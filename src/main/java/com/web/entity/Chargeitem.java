package com.web.entity;

import java.io.Serializable;

/**
 * chargeitem
 * 
 * @author
 */
public class Chargeitem implements Serializable {
	private Integer chargeid;

	private Integer patientid;

	private String chargetime;

	private Integer userid;

	private Integer departmentid;
	
	private Integer isdelete;
	
	private User user;
	
	private Department department;

	private Patient patient;

	private static final long serialVersionUID = 1L;

	public String getChargetime() {
		return chargetime;
	}

	public void setChargetime(String chargetime) {
		this.chargetime = chargetime;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Integer getChargeid() {
		return chargeid;
	}

	public void setChargeid(Integer chargeid) {
		this.chargeid = chargeid;
	}

	public Integer getPatientid() {
		return patientid;
	}

	public void setPatientid(Integer patientid) {
		this.patientid = patientid;
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
		Chargeitem other = (Chargeitem) that;
		return (this.getChargeid() == null ? other.getChargeid() == null
				: this.getChargeid().equals(other.getChargeid()))
				&& (this.getPatientid() == null ? other.getPatientid() == null
						: this.getPatientid().equals(other.getPatientid()))
				&& (this.getChargetime() == null ? other.getChargetime() == null
						: this.getChargetime().equals(other.getChargetime()))
				&& (this.getUserid() == null ? other.getUserid() == null
						: this.getUserid().equals(other.getUserid()))
				&& (this.getDepartmentid() == null ? other.getDepartmentid() == null
						: this.getDepartmentid().equals(other.getDepartmentid()))
				&& (this.getIsdelete() == null ? other.getIsdelete() == null
				: this.getIsdelete().equals(other.getIsdelete()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getChargeid() == null) ? 0 : getChargeid().hashCode());
		result = prime * result + ((getPatientid() == null) ? 0 : getPatientid().hashCode());
		result = prime * result + ((getChargetime() == null) ? 0 : getChargetime().hashCode());
		result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
		result = prime * result + ((getDepartmentid() == null) ? 0 : getDepartmentid().hashCode());
		result = prime * result + ((getIsdelete() == null) ? 0 : getIsdelete().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", chargeid=").append(chargeid);
		sb.append(", patientid=").append(patientid);
		sb.append(", chargetime=").append(chargetime);
		sb.append(", userid=").append(userid);
		sb.append(", departmentid=").append(departmentid);
		sb.append(", isdelete=").append(isdelete);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}