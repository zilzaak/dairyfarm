package dairy.model;

import javax.persistence.Entity;

import org.springframework.stereotype.Component;

public class Cprofit {
	private float  tcostanimal;
	private float tcostdaily;
	private float tcost;
	private float tsellcow;
	private float tsellmilk;
	private float tprofit;
    private float tsold;
	
	public float getTsold() {
		return tsold;
	}



	public void setTsold(float tsold) {
		this.tsold = tsold;
	}



	public float getTcostanimal() {
		return tcostanimal;
	}



	public Cprofit() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Cprofit(float tcostanimal, float tcostdaily,float tcost, float tsellcow,
			float tsellmilk, float tprofit,float tsold) {
		super();
		this.tcostanimal = tcostanimal;
		this.tcostdaily = tcostdaily;
		this.tcost = tcost;
		this.tsellcow = tsellcow;
		this.tsellmilk = tsellmilk;
		this.tprofit = tprofit;
		this.tsold=tsold;
	}



	public void setTcostanimal(float tcostanimal) {
		this.tcostanimal = tcostanimal;
	}

	public float getTcostdaily() {
		return tcostdaily;
	}

	public void setTcostdaily(float tcostdaily) {
		this.tcostdaily = tcostdaily;
	}


	public float getTcost() {
		return tcost;
	}

	public void setTcost(float tcost) {
		this.tcost = tcost;
	}

	public float getTsellcow() {
		return tsellcow;
	}

	public void setTsellcow(float tsellcow) {
		this.tsellcow = tsellcow;
	}

	

	public float getTsellmilk() {
		return tsellmilk;
	}



	public void setTsellmilk(float tsellmilk) {
		this.tsellmilk = tsellmilk;
	}



	public float getTprofit() {
		return tprofit;
	}

	public void setTprofit(float tprofit) {
		this.tprofit = tprofit;
	}
	
	
	
}
