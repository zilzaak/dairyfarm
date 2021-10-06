package dairy.model;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Pregnantreport {
	private int pregid;
	private int anid;
	private String type;
	private String stringconcivedate;
	private Date concivedate;
	private String stringpossibledate;
	private Date possibledate;
	private String sms;
	private Date nextconcive;
	private String stringnextconcive;
	private int pregnantno;
	private String dateerr;
	

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getPregid() {
		return pregid;
	}
	public void setPregid(int pregid) {
		this.pregid = pregid;
	}
	public int getAnid() {
		return anid;
	}
	public void setAnid(int anid) {
		this.anid = anid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStringconcivedate() {
		return stringconcivedate;
	}
	public void setStringconcivedate(String stringconcivedate) {
		this.stringconcivedate = stringconcivedate;
	}
	public Date getConcivedate() {
		return concivedate;
	}
	public void setConcivedate(Date concivedate) {
		this.concivedate = concivedate;
	}
	public String getStringpossibledate() {
		return stringpossibledate;
	}
	public void setStringpossibledate(String stringpossibledate) {
		this.stringpossibledate = stringpossibledate;
	}
	public Date getPossibledate() {
		return possibledate;
	}
	public void setPossibledate(Date possibledate) {
		this.possibledate = possibledate;
	}
	

	
	
	public Pregnantreport(int anid, String type, String stringconcivedate, Date concivedate, String stringpossibledate,
			Date possibledate, String sms, Date nextconcive, String stringnextconcive,int pregnantno,String dateerr) {
		super();
		this.anid = anid;
		this.type = type;
		this.stringconcivedate = stringconcivedate;
		this.concivedate = concivedate;
		this.stringpossibledate = stringpossibledate;
		this.possibledate = possibledate;
		this.sms = sms;
		this.nextconcive = nextconcive;
		this.stringnextconcive = stringnextconcive;
		this.pregnantno=pregnantno;
		this.dateerr=dateerr;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public Pregnantreport() {
		super();
	
	}
	public Date getNextconcive() {
		return nextconcive;
	}
	public int getPregnantno() {
		return pregnantno;
	}
	public void setPregnantno(int pregnantno) {
		this.pregnantno = pregnantno;
	}
	public void setNextconcive(Date nextconcive) {
		this.nextconcive = nextconcive;
	}
	public String getStringnextconcive() {
		return stringnextconcive;
	}
	public void setStringnextconcive(String stringnextconcive) {
		this.stringnextconcive = stringnextconcive;
	}
	
	public String getDateerr() {
		return dateerr;
	}
	public void setDateerr(String dateerr) {
		this.dateerr = dateerr;
	}
	
}
