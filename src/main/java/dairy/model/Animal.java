package dairy.model;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Animal {
private Date created;
private int anid;
private int agey;
private int agem;
private String source;
private float chest;
private double height;
private String hu;
private float weight;
private String gender;
private String wu;
private String filename;
private Date bdate;
private String stringbdate;
private String color;
private String type;

public int getAgem() {
	return agem;
}
public void setAgem(int agem) {
	this.agem = agem;
}
private String extra;
private String createdstring;

public String getCreatedstring() {
	return createdstring;
}
public void setCreatedstring(String createdstring) {
	this.createdstring = createdstring;
}
public String getExtra() {
	return extra;
}
public void setExtra(String extra) {
	this.extra = extra;
}

public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}

public String getHu() {
	return hu;
}
public void setHu(String hu) {
	this.hu = hu;
}
public String getWu() {
	return wu;
}
public void setWu(String wu) {
	this.wu = wu;
}

public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}


public int getAgey() {
	return agey;
}
public void setAgey(int agey) {
	this.agey = agey;
}

public float getChest() {
	return chest;
}
public void setChest(float chest) {
	this.chest = chest;
}
public double getHeight() {
	return height;
}
public void setHeight(double height) {
	this.height = height;
}
public float getWeight() {
	return weight;
}
public void setWeight(float weight) {
	this.weight = weight;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}


@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getAnid() {
	return anid;
}
public void setAnid(int anid) {
	this.anid = (int) anid;
}

public Date getBdate() {
	return bdate;
}
public void setBdate(Date bdate) {
	this.bdate = bdate;
}
public String getStringbdate() {
	return stringbdate;
}
public void setStringbdate(String stringbdate) {
	this.stringbdate = stringbdate;
}
public Animal() {
	
	super();

}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public Date getCreated() {
	return created;
}
public void setCreated(Date created) {
	this.created = created;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}


public Animal(Date created, int agey, int agem, String source, String extra, String createdstring, float chest,
		double height, String hu, float weight, String gender, String wu, String filename, Date bdate,
		String stringbdate, String color, String type) {
	super();
	this.created = created;
	this.agey = agey;
	this.agem = agem;
	this.source = source;
	this.extra = extra;
	this.createdstring = createdstring;
	this.chest = chest;
	this.height = height;
	this.hu = hu;
	this.weight = weight;
	this.gender = gender;
	this.wu = wu;
	this.filename = filename;
	this.bdate = bdate;
	this.stringbdate = stringbdate;
	this.color = color;
	this.type = type;
}







}
