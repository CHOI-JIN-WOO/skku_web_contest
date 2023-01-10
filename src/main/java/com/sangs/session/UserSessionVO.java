package com.sangs.session;

import java.io.Serializable;

public class UserSessionVO implements Serializable {	
	private static final long serialVersionUID = 1L;
	private String sessionId = "";	
	private String isLogin = "N";	
	private String userId = "";
	private int userNo = 0;
	private String userName = "";
	private String gradeCode = "";
	private String gradeName = "";
	private int gradeNum = 0;
	private int cyberGradeNum = 0;
	private String tutorCode = "";
	private String tutorName = "";	
	private String email = "";
	private String mobile = "";
	private String brthdy = "";
	private String mberRegGb = "";
	private String statusGb = "";
	private String tutorAt = "";
	private String seqTitle = "";
	private String ctypeName = "";
	private int courseNo;
	private int cUserNo;
	private int cSeqNo;
	private String siteName = "";
	private int siteNo = 0;
	private String siteDomain = "";
	private String siteBwTitle = "";
	private String siteLogImg = "";
	private String homePage = "";
	private String siteLeftImg = "";
	private String siteMainImg = "";
	private String bizno = "";
	private int loginResult = 0;
	public final static int LOGIN_FAIL_INFO = 1;
	public final static int LOGIN_FAIL_PWD = 2;
	public final static int LOGIN_SUCCESS = 100;
	private String lastAccDate = "";
	private String ipAddr = "";
	private String lastAccUrl = "";
	private String sessionWdate = "";
	public String getCtypeName() {
		return ctypeName;
	}

	public void setCtypeName(String ctypeName) {
		this.ctypeName = ctypeName;
	}
	
	public String getSeqTitle() {
		return seqTitle;
	}

	public void setSeqTitle(String seqTitle) {
		this.seqTitle = seqTitle;
	}
	
	public String gettutorAt() {
		return tutorAt;
	}

	public void settutorAt(String tutorAt) {
		this.tutorAt = tutorAt;
	}

	public String getLastAccUrl() {
		return lastAccUrl;
	}

	public void setLastAccUrl(String lastAccUrl) {
		this.lastAccUrl = lastAccUrl;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getTutorCode() {
		return tutorCode;
	}

	public void setTutorCode(String tutorCode) {
		this.tutorCode = tutorCode;
	}

	public String getTutorName() {
		return tutorName;
	}

	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {		
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile =  mobile;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getcUserNo() {
		return cUserNo;
	}

	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}

	public int getcSeqNo() {
		return cSeqNo;
	}

	public void setcSeqNo(int cSeqNo) {
		this.cSeqNo = cSeqNo;
	}

	public String getSiteName() {
		return siteName;
	}

	public int getCyberGradeNum() {
		return cyberGradeNum;
	}

	public void setCyberGradeNum(int cyberGradeNum) {
		this.cyberGradeNum = cyberGradeNum;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public int getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}

	public String getSiteDomain() {
		return siteDomain;
	}

	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}

	public String getSiteBwTitle() {
		return siteBwTitle;
	}

	public void setSiteBwTitle(String siteBwTitle) {
		this.siteBwTitle = siteBwTitle;
	}

	public String getSiteLogImg() {
		return siteLogImg;
	}

	public void setSiteLogImg(String siteLogImg) {
		this.siteLogImg = siteLogImg;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getSiteLeftImg() {
		return siteLeftImg;
	}

	public void setSiteLeftImg(String siteLeftImg) {
		this.siteLeftImg = siteLeftImg;
	}

	public String getSiteMainImg() {
		return siteMainImg;
	}

	public void setSiteMainImg(String siteMainImg) {
		this.siteMainImg = siteMainImg;
	}

	public int getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(int loginResult) {
		this.loginResult = loginResult;
	}
	
	public String getBizno() {
		return bizno;
	}

	public void setBizno(String bizno) {
		this.bizno = bizno;
	}

	public String getLastAccDate() {
		return lastAccDate;
	}

	public void setLastAccDate(String lastAccDate) {
		this.lastAccDate = lastAccDate;
	}

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public String getMberRegGb() {
		return mberRegGb;
	}

	public void setMberRegGb(String mberRegGb) {
		this.mberRegGb = mberRegGb;
	}
	
	public String getStatusGb() {
		return statusGb;
	}
	
	public void setStatusGb(String statusGb) {
		this.statusGb = statusGb;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getTutorAt() {
		return tutorAt;
	}

	public void setTutorAt(String tutorAt) {
		this.tutorAt = tutorAt;
	}
	
	public String getSessionWdate() {
		return sessionWdate;
	}
	
	public void setSessionWdate(String sessionWdate) {
		this.sessionWdate = sessionWdate;
	}	
	
	@Override
	public String toString() {
		return "UserSessionVO [sessionId=" + sessionId + ", isLogin=" + isLogin
				+ ", userId=" + userId + ", userNo=" + userNo + ", userName="
				+ userName + ", gradeCode=" + gradeCode + ", gradeName="
				+ gradeName + ", gradeNum=" + gradeNum + ", cyberGradeNum="
				+ cyberGradeNum + ", tutorCode=" + tutorCode + ", tutorName="
				+ tutorName + ", email=" + email + ", mobile=" + mobile
				+ ", brthdy=" + brthdy + ", mberRegGb=" + mberRegGb
				+ ", statusGb=" + statusGb + ", tutorAt=" + tutorAt
				+ ", seqTitle=" + seqTitle + ", ctypeName=" + ctypeName
				+ ", courseNo=" + courseNo + ", cUserNo=" + cUserNo
				+ ", cSeqNo=" + cSeqNo + ", siteName=" + siteName + ", siteNo="
				+ siteNo + ", siteDomain=" + siteDomain + ", siteBwTitle="
				+ siteBwTitle + ", siteLogImg=" + siteLogImg + ", homePage="
				+ homePage + ", siteLeftImg=" + siteLeftImg + ", siteMainImg="
				+ siteMainImg + ", bizno=" + bizno + ", loginResult="
				+ loginResult + ", lastAccDate=" + lastAccDate + ", ipAddr="
				+ ipAddr + ", lastAccUrl=" + lastAccUrl + "]";
	}	
}