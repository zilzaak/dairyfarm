package dairy.model;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table
public class Presitem implements Serializable{
private int itemid;
private String prestype;
private int prestypenumber;
private Date lastdate;
private String stringlastdate;
private String drugtype;
private String drugname;
private String rules;
private String consult;
private String instruction;
private Animalpres ap;
private String doctor;

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getItemid() {
	return itemid;
}
public void setItemid(int itemid) {
	this.itemid = itemid;
}
public String getPrestype() {
	return prestype;
}
public void setPrestype(String prestype) {
	this.prestype = prestype;
}
public Date getLastdate() {
	return lastdate;
}
public void setLastdate(Date lastdate) {
	this.lastdate = lastdate;
}
public String getDrugtype() {
	return drugtype;
}
public void setDrugtype(String drugtype) {
	this.drugtype = drugtype;
}
public String getDrugname() {
	return drugname;
}
public void setDrugname(String drugname) {
	this.drugname = drugname;
}
public String getRules() {
	return rules;
}
public void setRules(String rules) {
	this.rules = rules;
}
public String getConsult() {
	return consult;
}
public void setConsult(String consult) {
	this.consult = consult;
}
public String getInstruction() {
	return instruction;
}
public void setInstruction(String instruction) {
	this.instruction = instruction;
}

public int getPrestypenumber() {
	return prestypenumber;
}
public void setPrestypenumber(int prestypenumber) {
	this.prestypenumber = prestypenumber;
}
public String getStringlastdate() {
	return stringlastdate;
}
public void setStringlastdate(String stringlastdate) {
	this.stringlastdate = stringlastdate;
}
@ManyToOne(cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
public Animalpres getAp() {
	return ap;
}
public void setAp(Animalpres ap) {
	this.ap = ap;
}

private String stringstartingdate;
private Date startingdate;


   public String getStringstartingdate() {
	return stringstartingdate;
}
public void setStringstartingdate(String stringstartingdate) {
	this.stringstartingdate = stringstartingdate;
}
public Date getStartingdate() {
	return startingdate;
}
public void setStartingdate(Date startingdate){
	this.startingdate = startingdate;
}
public Presitem(String prestype, Date lastdate, String stringlastdate, String drugtype, String drugname, String rules,
		String consult, String instruction, int prestypenumber,Animalpres ap,String doctor) {
	super();
	this.prestype = prestype;
	this.lastdate = lastdate;
	this.stringlastdate = stringlastdate;
	this.drugtype = drugtype;
	this.drugname = drugname;
	this.rules = rules;
	this.consult = consult;
	this.instruction = instruction;
	this.prestypenumber = prestypenumber;
	this.ap = ap;
	this.doctor=doctor;
}
   
public String getDoctor() {
	return doctor;
}
public void setDoctor(String doctor) {
	this.doctor = doctor;
}
public Presitem(){


              }




}
