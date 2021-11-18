// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageM.java

package com.mj.homeAdmin.manageM.vo;

import java.sql.Date;

public class ManageM
{

    public ManageM()
    {
    }

    public String getMode()
    {
        return mode;
    }

    public void setMode(String mode)
    {
        this.mode = mode;
    }

    public int getIdx()
    {
        return idx;
    }

    public void setIdx(int idx)
    {
        this.idx = idx;
    }

    public String getYyyy()
    {
        return yyyy;
    }

    public void setYyyy(String yyyy)
    {
        this.yyyy = yyyy;
    }

    public String getMm()
    {
        return mm;
    }

    public void setMm(String mm)
    {
        this.mm = mm;
    }

    public Date getWdt()
    {
        return wdt;
    }

    public void setWdt(Date wdt)
    {
        this.wdt = wdt;
    }

    public Date getEdt()
    {
        return edt;
    }

    public void setEdt(Date edt)
    {
        this.edt = edt;
    }

    public String getuId()
    {
        return uId;
    }

    public void setuId(String uId)
    {
        this.uId = uId;
    }

    public String getGasM()
    {
        return gasM;
    }

    public void setGasM(String gasM)
    {
        this.gasM = gasM;
    }

    public String getElM()
    {
        return elM;
    }

    public void setElM(String elM)
    {
        this.elM = elM;
    }

    public String getWtM()
    {
        return wtM;
    }

    public void setWtM(String wtM)
    {
        this.wtM = wtM;
    }

    public String getItM()
    {
        return itM;
    }

    public void setItM(String itM)
    {
        this.itM = itM;
    }
    public String getMm2()
    {
        return mm2;
    }

    public void setMm2(String mm2)
    {
        this.mm2 = mm2;
    }
    
   
    public String getYyyy2() {
		return yyyy2;
	}

	public void setYyyy2(String yyyy2) {
		this.yyyy2 = yyyy2;
	}

	 public String getMm3() {
			return mm3;
		}

		public void setMm3(String mm3) {
			this.mm3 = mm3;
		}

		public String getYyyy3() {
			return yyyy3;
		}

		public void setYyyy3(String yyyy3) {
			this.yyyy3 = yyyy3;
		}
	
		
    public int getJidx() {
			return jidx;
		}

		public void setJidx(int jidx) {
			this.jidx = jidx;
		}


	private int idx;
    private int jidx;
    private String yyyy;
    private String yyyy2;
    private String yyyy3;
	private String mm;
    private String mm2;
    private String mm3;
	private Date wdt;
    private Date edt;
    private String uId;
    private String gasM;
    private String elM;
    private String wtM;
    private String itM;
    private String mode;
}
