package iii.team3.chatroom.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "CHATROOM")
public class MessageModel {
	
	@Id
	@Column(name = "CHAT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "CHAT_MESSAGE")
    private String message;
	
	@Column(name = "MAILER")
	private String fromLogin;
	
	@Column(name = "ACCEPTOR")
	private String acceptor;
	
	@Column(name = "TIME")
	private String time;
	
	@Transient
	private String image;
	
	public MessageModel() {
		super();
	}

	public MessageModel(String message, String fromLogin, String acceptor, String time) {
		super();
		
		this.message = message;
		this.fromLogin = fromLogin;
		this.acceptor = acceptor;
		this.time = time;
	}
	
	public String getAcceptor() {
		return acceptor;
	}

	public void setAcceptor(String acceptor) {
		this.acceptor = acceptor;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
    
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFromLogin() {
        return fromLogin;
    }

    public void setFromLogin(String fromLogin) {
        this.fromLogin = fromLogin;
    }

    public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
    public String toString() {
        return "MessageModel{" +
                "message='" + message + '\'' +
                ", fromLogin='" + fromLogin + '\'' +
                '}';
    }
}
