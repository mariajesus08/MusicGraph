package tbd.analisistweets.lucene;

import java.io.IOException;
import java.nio.file.Paths;

import com.mongodb.*;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import java.util.Arrays;
public class Index {
    public void crearIndice(){
        try {
            Directory dir = FSDirectory.open(Paths.get("indice"));
            Analyzer analyzer = new StandardAnalyzer();
            IndexWriterConfig iwc = new IndexWriterConfig(analyzer);

            // Create a new index in the directory, removing any
            // previously indexed documents:
            iwc.setOpenMode(OpenMode.CREATE);
            //// Add new documents to an existing index: OpenMode.CREATE_OR_APPEND

            IndexWriter writer = new IndexWriter(dir, iwc);
            MongoCredential credential = MongoCredential.createCredential("root", "admin", "secret1234".toCharArray());
            MongoClient mongoClient = new MongoClient(new ServerAddress("165.227.12.119", 27017), Arrays.asList(credential));
            DB baseDeDatos = mongoClient.getDB("musicgraphdb");
            DBCollection coleccion = baseDeDatos.getCollection("statusJSONImpl");
            DBCursor cursorInicial = coleccion.find();
            while(cursorInicial.hasNext()){
                DBObject cursor = cursorInicial.next();
                Document doc = new Document();
                doc.add(new TextField("text", cursor.get("text").toString(), Field.Store.YES));
                doc.add(new StringField("_id", cursor.get("_id").toString(), Field.Store.YES));
                doc.add(new StringField("id", cursor.get("id").toString(), Field.Store.YES));
                if(writer.getConfig().getOpenMode() == OpenMode.CREATE) {
                    writer.addDocument(doc);
                }
                else {
                    writer.updateDocument(new Term("path" + cursor.toString()), doc);
                }
            }
            writer.close();
        }
        catch(IOException ioe) {
            ioe.printStackTrace();
        }
        System.out.println("Creado indice Lucene");
    }
}
