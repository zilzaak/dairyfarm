package dairy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table 
@Entity
public class Firmadmin {
	
	
private int adminid;
private String email;
private String password;
private String code;

public String getCode() {
	return code;
}


public void setCode(String code) {
	this.code = code;
}


public String getEmail() {
	return email;
}


@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getAdminid() {
	return adminid;
}
public void setAdminid(int adminid) {
	this.adminid = adminid;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Firmadmin() {
	super();
	// TODO Auto-generated constructor stub
}
public Firmadmin(String email, String password,String code) {
	super();
	this.email = email;
	this.password = password;
	this.code = code;
	
}




}
