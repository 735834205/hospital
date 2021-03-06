package com.web.entity;

import java.io.Serializable;

/**
 * position
 * 
 * @author
 */
public class Position implements Serializable { 
	/**
	 * 岗位编号
	 */
	private Integer postnumber;

	private Integer isdelete;

	/**
	 * 岗位名称
	 */
	private String postname;

	/**
	 * 岗位工资
	 */
	private Integer postsalary;

	private static final long serialVersionUID = 1L;

	public Integer getPostnumber() {
		return postnumber;
	}

	public void setPostnumber(Integer postnumber) {
		this.postnumber = postnumber;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public Integer getPostsalary() {
		return postsalary;
	}

	public void setPostsalary(Integer postsalary) {
		this.postsalary = postsalary;
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
		Position other = (Position) that;
		return (this.getPostnumber() == null ? other.getPostnumber() == null
				: this.getPostnumber().equals(other.getPostnumber()))
				&& (this.getIsdelete() == null ? other.getIsdelete() == null
						: this.getIsdelete().equals(other.getIsdelete()))
				&& (this.getPostname() == null ? other.getPostname() == null
						: this.getPostname().equals(other.getPostname()))
				&& (this.getPostsalary() == null ? other.getPostsalary() == null
						: this.getPostsalary().equals(other.getPostsalary()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getPostnumber() == null) ? 0 : getPostnumber().hashCode());
		result = prime * result + ((getIsdelete() == null) ? 0 : getIsdelete().hashCode());
		result = prime * result + ((getPostname() == null) ? 0 : getPostname().hashCode());
		result = prime * result + ((getPostsalary() == null) ? 0 : getPostsalary().hashCode());
		return result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", postnumber=").append(postnumber);
		sb.append(", isdelete=").append(isdelete);
		sb.append(", postname=").append(postname);
		sb.append(", postsalary=").append(postsalary);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}