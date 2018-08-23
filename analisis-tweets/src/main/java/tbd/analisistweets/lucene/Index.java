package tbd.analisistweets.lucene;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;

import com.mongodb.*;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.*;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class Index {

    public void crearIndice() throws Exception{
            System.out.println("Se está creando el índice con lucene");
            Directory dir = FSDirectory.open(Paths.get("indice"));
            Analyzer analyzer = new StandardAnalyzer();
            IndexWriterConfig iwc = new IndexWriterConfig(analyzer);

            // Create a new index in the directory, removing any
            // previously indexed documents:
            iwc.setOpenMode(OpenMode.CREATE);
            //// Add new documents to an existing index: OpenMode.CREATE_OR_APPEND

            IndexWriter writer = new IndexWriter(dir, iwc);
           MongoCredential mongoCredential = MongoCredential.createCredential("root", "admin","secret1234".toCharArray());
            MongoClientOptions.Builder options_builder = new MongoClientOptions.Builder();
            options_builder.maxConnectionIdleTime(600000);
            ServerAddress address = new ServerAddress("165.227.12.119", 27017);
            MongoClient mongoClient = new MongoClient(address, Arrays.asList(mongoCredential));
            DB baseDeDatos = mongoClient.getDB("musicgraphdb");
            DBCollection coleccion = baseDeDatos.getCollection("statusJSONImpl");
            DBCursor cursorInicial = coleccion.find();

            while(cursorInicial.hasNext()){
                DBObject cursor = cursorInicial.next();
                Object user = cursor.get("user");
                String userString = user.toString();
                String location = getLocation(userString);
                Document doc = new Document();
                doc.add(new TextField("artistName", getName(userString), Field.Store.YES));
                doc.add(new TextField("followers", getFollowers(userString), Field.Store.YES));
                doc.add(new StringField("retweets", cursor.get("retweetCount").toString(),Field.Store.YES));
                doc.add(new TextField("text", cursor.get("text").toString(), Field.Store.YES));
                doc.add(new TextField("text", cursor.get("text").toString(), Field.Store.YES));
                doc.add(new StringField("_id", cursor.get("_id").toString(), Field.Store.YES));
                doc.add(new StringField("createdAt", cursor.get("createdAt").toString(),Field.Store.YES));
                doc.add(new StringField("location", location, Field.Store.YES));

                if(writer.getConfig().getOpenMode() == OpenMode.CREATE) {
                    writer.addDocument(doc);
                }
                else {
                    writer.updateDocument(new Term("path" + cursor.toString()), doc);
                }
            }
            writer.close();
            coleccion.drop();
        System.out.println("Creado índice Lucene");

    }


    public String getLocation(String userInformation){
        String location = "";
        Integer indiceLocation = userInformation.indexOf("location");
        Integer indiceEndLocation = userInformation.indexOf("\"", indiceLocation+13);
        location = userInformation.substring(indiceLocation+13, indiceEndLocation);
        return location;
    }
    public String getFollowers(String userInformation){
        String location = "";
        Integer indiceLocation = userInformation.indexOf("followersCount");
        Integer indiceEndLocation = userInformation.indexOf("\"", indiceLocation+18);
        location = userInformation.substring(indiceLocation+18, indiceEndLocation-3);
        return location;
    }
    public String getName(String userInformation){
        String location = "";
        Integer indiceLocation = userInformation.indexOf("screenName");
        Integer indiceEndLocation = userInformation.indexOf("\"", indiceLocation+15);
        location = userInformation.substring(indiceLocation+15, indiceEndLocation);
        return location;
    }
}
