package com.web.entity;

import java.io.Serializable;

/**
 * drugstorage
 * @author 
 */
public class Drugstorage implements Serializable {
    /**
     * 药库
     */
    private Integer drugstorageid;

    /**
     * 类别
     */
    private Integer drugsid;

    /**
     * 负责人id
     */
    private Integer inchargeperson;

    /**
     * 面积
     */
    private Integer number;

    private Integer isdelete;
    
    private User user;
    
    private Drugs drugs;

	public Drugs getDrugs() {
		return drugs;
	}

	public void setDrugs(Drugs drugs) {
		this.drugs = drugs;
	}

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private static final long serialVersionUID = 1L;

    public Integer getDrugstorageid() {
        return drugstorageid;
    }

    public void setDrugstorageid(Integer drugstorageid) {
        this.drugstorageid = drugstorageid;
    }

    public Integer getdrugsid() {
        return drugsid;
    }

    public void setdrugsid(Integer drugsid) {
        this.drugsid = drugsid;
    }

    public Integer getInchargeperson() {
        return inchargeperson;
    }

    public void setInchargeperson(Integer inchargeperson) {
        this.inchargeperson = inchargeperson;
    }

    public Integer getnumber() {
        return number;
    }

    public void setnumber(Integer number) {
        this.number = number;
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
        Drugstorage other = (Drugstorage) that;
        return (this.getDrugstorageid() == null ? other.getDrugstorageid() == null : this.getDrugstorageid().equals(other.getDrugstorageid()))
            && (this.getdrugsid() == null ? other.getdrugsid() == null : this.getdrugsid().equals(other.getdrugsid()))
            && (this.getInchargeperson() == null ? other.getInchargeperson() == null : this.getInchargeperson().equals(other.getInchargeperson()))
            && (this.getnumber() == null ? other.getnumber() == null : this.getnumber().equals(other.getnumber()))
            && (this.getIsdelete() == null ? other.getIsdelete() == null : this.getIsdelete().equals(other.getIsdelete()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getDrugstorageid() == null) ? 0 : getDrugstorageid().hashCode());
        result = prime * result + ((getdrugsid() == null) ? 0 : getdrugsid().hashCode());
        result = prime * result + ((getInchargeperson() == null) ? 0 : getInchargeperson().hashCode());
        result = prime * result + ((getnumber() == null) ? 0 : getnumber().hashCode());
        result = prime * result + ((getIsdelete() == null) ? 0 : getIsdelete().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", drugstorageid=").append(drugstorageid);
        sb.append(", drugsid=").append(drugsid);
        sb.append(", inchargeperson=").append(inchargeperson);
        sb.append(", number=").append(number);
        sb.append(", isdelete=").append(isdelete);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}