package dairy.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table
public class Sellmilk {

private int mid;
private String buyername;
private String contact;
private float amount;
private float rate;
private float totalprice;
private float due;
private String stringselldate; 
private Date selldate;

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getMid() {
	return mid;
}
public void setMid(int mid) {
	this.mid = mid;
}
public String getBuyername() {
	return buyername;
}
public void setBuyername(String buyername) {
	this.buyername = buyername;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public float getAmount() {
	return amount;
}
public void setAmount(float amount) {
	this.amount = amount;
}
public float getRate() {
	return rate;
}
public void setRate(float rate) {
	this.rate = rate;
}
public float getTotalprice() {
	return totalprice;
}
public void setTotalprice(float totalprice) {
	this.totalprice = totalprice;
}
public float getDue() {
	return due;
}
public void setDue(float due) {
	this.due = due;
}
public String getStringselldate() {
	return stringselldate;
}
public void setStringselldate(String stringselldate) {
	this.stringselldate = stringselldate;
}
public Date getSelldate() {
	return selldate;
}
public void setSelldate(Date selldate) {
	this.selldate = selldate;
}
public Sellmilk(String buyername, String contact, float amount, float rate, float totalprice, float due,
		String stringselldate, Date selldate) {
	super();
	this.buyername = buyername;
	this.contact = contact;
	this.amount = amount;
	this.rate = rate;
	this.totalprice = totalprice;
	this.due = due;
	this.stringselldate = stringselldate;
	this.selldate = selldate;
}
public Sellmilk() {
	super();
	// TODO Auto-generated constructor stub
}



                          


}
