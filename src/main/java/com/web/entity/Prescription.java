package com.web.entity;

import java.io.Serializable;

/**
 * prescription
 * @author 
 */
public class Prescription implements Serializable {
    /**
     * 处方号
     */
    private Integer prescriptionnumber;

    private Integer drugsid;

    private Integer drugno;

    private Integer patientid;

    private Integer isdelete;
    
    private String date;
    
    private Integer userid;
    
    private User user;

    private Patient patient;
    
    private Drugs drugs;

    public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
    
    public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Drugs getDrugs() {
		return drugs;
	}

	public void setDrugs(Drugs drugs) {
		this.drugs = drugs;
	}

	public Integer getPatientid() {
		return patientid;
	}

	public void setPatientid(Integer patientid) {
		this.patientid = patientid;
	}

	private static final long serialVersionUID = 1L;

    public Integer getPrescriptionnumber() {
        return prescriptionnumber;
    }

    public void setPrescriptionnumber(Integer prescriptionnumber) {
        this.prescriptionnumber = prescriptionnumber;
    }

    public Integer getDrugsid() {
        return drugsid;
    }

    public void setDrugsid(Integer drugsid) {
        this.drugsid = drugsid;
    }

    public Integer getDrugno() {
        return drugno;
    }

    public void setDrugno(Integer drugno) {
        this.drugno = drugno;
    }

    public Integer getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Prescription other = (Prescription) that;
        return (this.getPrescriptionnumber() == null ? other.getPrescriptionnumber() == null : this.getPrescriptionnumber().equals(other.getPrescriptionnumber()))
            && (this.getDrugsid() == null ? other.getDrugsid() == null : this.getDrugsid().equals(other.getDrugsid()))
            && (this.getDrugno() == null ? other.getDrugno() == null : this.getDrugno().equals(other.getDrugno()))
            && (this.getPatientid() == null ? other.getPatientid() == null : this.getPatientid().equals(other.getPatientid()))
            && (this.getIsdelete() == null ? other.getIsdelete() == null : this.getIsdelete().equals(other.getIsdelete()))
            && (this.getDate() == null ? other.getDate() == null : this.getDate().equals(other.getDate()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getPrescriptionnumber() == null) ? 0 : getPrescriptionnumber().hashCode());
        result = prime * result + ((getDrugsid() == null) ? 0 : getDrugsid().hashCode());
        result = prime * result + ((getDrugno() == null) ? 0 : getDrugno().hashCode());
        result = prime * result + ((getPatientid() == null) ? 0 : getPatientid().hashCode());
        result = prime * result + ((getIsdelete() == null) ? 0 : getIsdelete().hashCode());
        result = prime * result + ((getDate() == null) ? 0 : getDate().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", prescriptionnumber=").append(prescriptionnumber);
        sb.append(", drugsid=").append(drugsid);
        sb.append(", drugno=").append(drugno);
        sb.append(", patientid=").append(patientid);
        sb.append(", isdelete=").append(isdelete);
        sb.append(", date=").append(date); 
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}