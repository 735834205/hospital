package com.web.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * medicalrecord
 * @author 
 */
public class Medicalrecord implements Serializable {
    /**
     * 病案号
     */
    private Integer medicalrecordid;

    /**
     * 病人ID
     */
    private Integer patientid;

    /**
     * 类别
     */
    private String category;

    /**
     * 既往病史
     */
    private String anamnesis;

    private String doctoradvice;
    /**
     * 
     */
    private Integer isdelete;

	/**
     * 入院科室
     */
    private Integer departmentid;

    /**
     * 入院日期
     */
    private String admissiondate;

    /**
     * 入院诊断
     */
    private String admissiondiagnosis;

    /**
     * 入院情况
     */
    private String admissionstatus;

    /**
     * 转院情况
     */
    private String transfer;

    /**
     * 出院时间
     */
    private Date dischargetime;

    /**
     * 出院诊断
     */
    private String dischargediagnosis;

    /**
     * 出院情况
     */  
    private String dischargestatus;

	private Patient patient;
     
    private Department department;
    
    public String getDoctoradvice() {
		return doctoradvice;
	}

	public void setDoctoradvice(String doctoradvice) {
		this.doctoradvice = doctoradvice;
	}
    
    public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}
    
    public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


    
    private static final long serialVersionUID = 1L;

    public Integer getMedicalrecordid() {
        return medicalrecordid;
    }

    public void setMedicalrecordid(Integer medicalrecordid) {
        this.medicalrecordid = medicalrecordid;
    }

    public Integer getPatientid() {
        return patientid;
    }

    public void setPatientid(Integer patientid) {
        this.patientid = patientid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAnamnesis() {
        return anamnesis;
    }

    public void setAnamnesis(String anamnesis) {
        this.anamnesis = anamnesis;
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getAdmissiondate() {
        return admissiondate;
    }

    public void setAdmissiondate(String admissiondate) {
        this.admissiondate = admissiondate;
    }

    public String getAdmissiondiagnosis() {
        return admissiondiagnosis;
    }

    public void setAdmissiondiagnosis(String admissiondiagnosis) {
        this.admissiondiagnosis = admissiondiagnosis;
    }

    public String getAdmissionstatus() {
        return admissionstatus;
    }

    public void setAdmissionstatus(String admissionstatus) {
        this.admissionstatus = admissionstatus;
    }

    public String getTransfer() {
        return transfer;
    }

    public void setTransfer(String transfer) {
        this.transfer = transfer;
    }

    public Date getDischargetime() {
        return dischargetime;
    }

    public void setDischargetime(Date dischargetime) {
        this.dischargetime = dischargetime;
    }

    public String getDischargediagnosis() {
        return dischargediagnosis;
    }

    public void setDischargediagnosis(String dischargediagnosis) {
        this.dischargediagnosis = dischargediagnosis;
    }

    public String getDischargestatus() {
        return dischargestatus;
    }

    public void setDischargestatus(String dischargestatus) {
        this.dischargestatus = dischargestatus;
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
        Medicalrecord other = (Medicalrecord) that;
        return (this.getMedicalrecordid() == null ? other.getMedicalrecordid() == null : this.getMedicalrecordid().equals(other.getMedicalrecordid()))
            && (this.getPatientid() == null ? other.getPatientid() == null : this.getPatientid().equals(other.getPatientid()))
            && (this.getCategory() == null ? other.getCategory() == null : this.getCategory().equals(other.getCategory()))
            && (this.getAnamnesis() == null ? other.getAnamnesis() == null : this.getAnamnesis().equals(other.getAnamnesis()))
            && (this.getDoctoradvice() == null ? other.getDoctoradvice() == null : this.getDoctoradvice().equals(other.getDoctoradvice()))
            && (this.getIsdelete() == null ? other.getIsdelete() == null : this.getIsdelete().equals(other.getIsdelete()))
            && (this.getDepartmentid() == null ? other.getDepartmentid() == null : this.getDepartmentid().equals(other.getDepartmentid()))
            && (this.getAdmissiondate() == null ? other.getAdmissiondate() == null : this.getAdmissiondate().equals(other.getAdmissiondate()))
            && (this.getAdmissiondiagnosis() == null ? other.getAdmissiondiagnosis() == null : this.getAdmissiondiagnosis().equals(other.getAdmissiondiagnosis()))
            && (this.getAdmissionstatus() == null ? other.getAdmissionstatus() == null : this.getAdmissionstatus().equals(other.getAdmissionstatus()))
            && (this.getTransfer() == null ? other.getTransfer() == null : this.getTransfer().equals(other.getTransfer()))
            && (this.getDischargetime() == null ? other.getDischargetime() == null : this.getDischargetime().equals(other.getDischargetime()))
            && (this.getDischargediagnosis() == null ? other.getDischargediagnosis() == null : this.getDischargediagnosis().equals(other.getDischargediagnosis()))
            && (this.getDischargestatus() == null ? other.getDischargestatus() == null : this.getDischargestatus().equals(other.getDischargestatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getMedicalrecordid() == null) ? 0 : getMedicalrecordid().hashCode());
        result = prime * result + ((getPatientid() == null) ? 0 : getPatientid().hashCode());
        result = prime * result + ((getCategory() == null) ? 0 : getCategory().hashCode());
        result = prime * result + ((getAnamnesis() == null) ? 0 : getAnamnesis().hashCode());
        result = prime * result + ((getDoctoradvice() == null) ? 0 : getDoctoradvice().hashCode());
        result = prime * result + ((getIsdelete() == null) ? 0 : getIsdelete().hashCode());
        result = prime * result + ((getDepartmentid() == null) ? 0 : getDepartmentid().hashCode());
        result = prime * result + ((getAdmissiondate() == null) ? 0 : getAdmissiondate().hashCode());
        result = prime * result + ((getAdmissiondiagnosis() == null) ? 0 : getAdmissiondiagnosis().hashCode());
        result = prime * result + ((getAdmissionstatus() == null) ? 0 : getAdmissionstatus().hashCode());
        result = prime * result + ((getTransfer() == null) ? 0 : getTransfer().hashCode());
        result = prime * result + ((getDischargetime() == null) ? 0 : getDischargetime().hashCode());
        result = prime * result + ((getDischargediagnosis() == null) ? 0 : getDischargediagnosis().hashCode());
        result = prime * result + ((getDischargestatus() == null) ? 0 : getDischargestatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", medicalrecordid=").append(medicalrecordid);
        sb.append(", patientid=").append(patientid);
        sb.append(", category=").append(category);
        sb.append(", anamnesis=").append(anamnesis);
        sb.append(", doctoradvice=").append(doctoradvice);
        sb.append(", isdelete=").append(isdelete);
        sb.append(", departmentid=").append(departmentid);
        sb.append(", admissiondate=").append(admissiondate);
        sb.append(", admissiondiagnosis=").append(admissiondiagnosis);
        sb.append(", admissionstatus=").append(admissionstatus);
        sb.append(", transfer=").append(transfer);
        sb.append(", dischargetime=").append(dischargetime);
        sb.append(", dischargediagnosis=").append(dischargediagnosis);
        sb.append(", dischargestatus=").append(dischargestatus);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}