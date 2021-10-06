package dairy.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Sellcow {
	
private int sellid;
private int anid;
private Date selldate;
private String stringselldate;
private float sellprice;
private float due;
private String buyername;
private String buyercontact;
private String sms;
private String succ;

public Sellcow() {
	super();
	// TODO Auto-generated constructor stub
}
public Sellcow(int anid, Date selldate, String stringselldate, float sellprice, float due, String buyername,
		String buyercontact, String sms) {
	super();
	this.anid = anid;
	this.selldate = selldate;
	this.stringselldate = stringselldate;
	this.sellprice = sellprice;
	this.due = due;
	this.buyername = buyername;
	this.buyercontact = buyercontact;
	this.sms = sms;

}
public String getSms() {
	return sms;
}
public void setSms(String sms) {
	this.sms = sms;
}
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getSellid() {
	return sellid;
}
public void setSellid(int sellid) {
	this.sellid = sellid;
}
public int getAnid() {
	return anid;
}
public void setAnid(int anid) {
	this.anid = anid;
}
public Date getSelldate() {
	return selldate;
}
public void setSelldate(Date selldate) {
	this.selldate = selldate;
}
public String getStringselldate() {
	return stringselldate;
}
public void setStringselldate(String stringselldate) {
	this.stringselldate = stringselldate;
}
public float getSellprice() {
	return sellprice;
}
public void setSellprice(float sellprice) {
	this.sellprice = sellprice;
}
public float getDue() {
	return due;
}
public void setDue(float due) {
	this.due = due;
}
public String getBuyername() {
	return buyername;
}
public void setBuyername(String buyername) {
	this.buyername = buyername;
}
public String getBuyercontact() {
	return buyercontact;
}
public void setBuyercontact(String buyercontact) {
	this.buyercontact = buyercontact;
}


}
