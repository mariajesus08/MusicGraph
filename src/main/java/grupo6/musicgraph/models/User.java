package grupo6.musicgraph.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@NamedNativeQueries({
        @NamedNativeQuery(name = "User.findAll", query = "SELECT u FROM User u")})

public class User {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "isActive", nullable = false)
    private Boolean isActive;

    @Column(name = "register_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date registerDate;

    @Column(name = "lastAccess")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastAccess;


    public User(String name, String email, String password, Boolean isActive, Date registerDate, Date lastAccess) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.isActive = isActive;
        this.registerDate = registerDate;
        this.lastAccess = lastAccess;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public Date getLastAccess() {
        return lastAccess;
    }
}