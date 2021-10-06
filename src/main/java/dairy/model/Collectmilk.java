package dairy.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table
public class Collectmilk {
private Long colid;
private int anid;
private float amount;
private float rate;
private float totalprice;
private String animaltype;
private String stringcollectdate;
private Date collectdate;


@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public Long getColid() {
	return colid;
}


public void setColid(Long colid) {
	this.colid = colid;
}


public int getAnid() {
	return anid;
}


public void setAnid(int anid) {
	this.anid = anid;
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


public String getAnimaltype() {
	return animaltype;
}


public void setAnimaltype(String animaltype) {
	this.animaltype = animaltype;
}


public String getStringcollectdate() {
	return stringcollectdate;
}


public void setStringcollectdate(String stringcollectdate) {
	this.stringcollectdate = stringcollectdate;
}


public Date getCollectdate() {
	return collectdate;
}


public void setCollectdate(Date collectdate) {
	this.collectdate = collectdate;
}


public Collectmilk(int anid, float amount, float rate, float totalprice, String animaltype, String stringcollectdate,
		Date collectdate) {
	super();
	this.anid = anid;
	this.amount = amount;
	this.rate = rate;
	this.totalprice = totalprice;
	this.animaltype = animaltype;
	this.stringcollectdate = stringcollectdate;
	this.collectdate = collectdate;
}

public Collectmilk() {
	super();

}


}
