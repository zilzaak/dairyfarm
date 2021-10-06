package dairy.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Dailycost {

	private int costid;
	private String type;
	private String itemname;
	private String amount;
	private float cost;
	private String stringcostdate;
	private Date costdate;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getCostid() {
		return costid;
	}
	public void setCostid(int costid) {
		this.costid = costid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public String getStringcostdate() {
		return stringcostdate;
	}
	public void setStringcostdate(String stringcostdate) {
		this.stringcostdate = stringcostdate;
	}
	public Date getCostdate() {
		return costdate;
	}
	public void setCostdate(Date costdate) {
		this.costdate = costdate;
	}
	public Dailycost(String type, String itemname, String amount, float cost, String stringcostdate, Date costdate) {
		super();
		this.type = type;
		this.itemname = itemname;
		this.amount = amount;
		this.cost = cost;
		this.stringcostdate = stringcostdate;
		this.costdate = costdate;
	}
	
	public Dailycost() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
