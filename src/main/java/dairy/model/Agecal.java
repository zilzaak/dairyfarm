package dairy.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Agecal {
private int ageid;
private Date agedate;
public Agecal() {
	super();
	// TODO Auto-generated constructor stub
}

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getAgeid() {
	return ageid;
}
public void setAgeid(int ageid) {
	this.ageid = ageid;
}
public Date getAgedate() {
	return agedate;
}
public void setAgedate(Date agedate) {
	this.agedate = agedate;
}
public Agecal(Date agedate) {
	super();
	this.agedate = agedate;
}
	


}
