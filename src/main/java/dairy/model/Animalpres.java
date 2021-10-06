package dairy.model;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table
public class Animalpres implements Serializable{
	private int presid;
	private String color;
	private String type;
	private int age;
	private Date presdate;
	private String stringpresdate;
	private String gender;
	private String filename;
	float chest;
	double height;double weight;
    private int anid;
    
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getPresid() {
		return presid;
	}
	public void setPresid(int presid) {
		this.presid = presid;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getPresdate() {
		return presdate;
	}
	public void setPresdate(Date presdate) {
		this.presdate = presdate;
	}
	public String getStringpresdate() {
		return stringpresdate;
	}
	public void setStringpresdate(String stringpresdate) {
		this.stringpresdate = stringpresdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getAnid() {
		return anid;
	}
	public void setAnid(int anid) {
		this.anid = anid;
	}
	public Animalpres(String color, String type, int age, Date presdate, String stringpresdate, String gender,
			String filename, float chest, double height, double weight, int anid) {
		super();
		this.color = color;
		this.type = type;
		this.age = age;
		this.presdate = presdate;
		this.stringpresdate = stringpresdate;
		this.gender = gender;
		this.filename = filename;
		this.chest = chest;
		this.height = height;
		this.weight = weight;
		this.anid = anid;
	}
	public Animalpres() {
		super();
		// TODO Auto-generated constructor stub
	}
	



	
}
