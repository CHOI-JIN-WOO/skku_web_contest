<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		
		<script>
			function fnProceed(){	
				if(!fnCheckboxChecked($('#agree2'), "Please agree with terms of use.")) return false;
				if(!fnCheckboxChecked($('#agree4'), "Please agree with privacy policy.")) return false;
				
		    	$("#frm").attr("action","/user/memberJoinStep01.do");
				$("#frm").submit();
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Sign in</h3>
					</div>			
				</div>
				<div id="content">
					<form name="frm" id="frm" action="" method="post">
						<input type="hidden" name="email" id="email" value="" /> 	
						<input type="hidden" name="snsType" id="snsType" value="JM0001"/>
						<input type="hidden" name="snsUserId" id="snsUserId" value=""/>
						<input type="hidden" name="userName" id="userName" value=""/>
						<div class="wrapper">
							<div class="cont_body">
								<div class="c_section">	
									<div class="join_type_box">
										<div class="c_section">
											<h4 class="c_tit">Terms of use</h4>
											<div class="agreement" tabindex="0">	
												<h5>Chapter 1 General Rules</h5>
												<h3>Article 1 (Purpose)</h3>
												These terms and conditions govern the terms and conditions of use of site(hereinafter referred to as the "service"), an Internet service provided by site (hereinafter referred to as "Education Center") to service subscribers (hereinafter referred to as "members"). The purpose is to determine matters related to procedures and other matters necessary for use.
												
												<br/><br/><h3>Article 2 (Effect and Change of Terms of Use)</h3>
												1. These Terms and Conditions take effect when published online on the Education Center website, and may be amended within the scope of not violating the relevant laws and regulations in the event of a reasonable cause. The revised Terms and Conditions take effect by notifying them online, and revisions to important regulations, such as users' rights or obligations, are notified in advance.<br/>
												2. The Education Center may change these terms and conditions in the event of a reasonable reason, and if the terms and conditions are changed, they will be notified in advance without delay.<br/>
												3. Agreeing to these terms and conditions means that you agree to periodically check the web for changes to the terms and conditions. The Education Center is not responsible for damages caused by users not knowing information about the changed terms and conditions.<br/>
												4. Members may request membership withdrawal (cancellation) if they do not agree to the changed terms and conditions, and if they continue to use the service without expressing their intention to refuse even after 7 days from the effective date of the changed terms and conditions, they will be deemed to have agreed to the changes in the terms and conditions. is considered
												
												<br/><br/><h3>Article 3 (Excluding Terms and Conditions)</h3>
												1. These terms and conditions apply together with the user guide for individual services provided by the training center (hereinafter referred to as service-specific guides).<br/>
												2. Matters not specified in these terms and conditions can be applied according to the relevant laws and the purpose of each service guide.
												
												<br/><br/><h3>Article 4 (Definition of Terms)</h3>
												1. The definitions of terms used in these terms and conditions are as follows.<br/>
												① ‘Mall’ refers to a virtual business place set up by the Education Center to trade goods or services using information and communication facilities such as computers to provide goods or services to users, and also a business operator operating a cyber mall. It is also used in the meaning of.<br/>
												② 'Member' refers to a user who uses membership service, and refers to a person who can continuously use the services provided by the "Mall".<br/>
												③ 'Use contract' refers to the contract between the education center and the user in relation to the use of the service.<br/>
												④ 'User number (ID)' refers to a combination of letters and numbers selected by the user and assigned by the education center for identification of the user and use of the service by the user.<br/>
												⑤ 'Password' refers to a combination of letters and numbers selected by the user to confirm that the user is a user that matches the user number assigned to the user and to protect the rights and interests of the user.<br/>
												⑥ 'Cancellation' refers to the cancellation of the use contract by the Education Center or the member.<br/>
												2. The definitions of terms used in these terms and conditions, except for those set forth in Paragraph 1, shall be governed by related laws and service-specific guides.
												
												
												<br/><br/><br/><h5>Chapter 2 Concluding a User Agreement</h5>
												<h3>Article 5 (Establishment of use contract)</h3>
												1. The contract of use is established by the customer's consent to the contents of these terms and conditions and the education center's approval of the application for use.<br/>
												2. Agreeing to these Terms of Use is expressed by clicking the 'I Agree' button on the web of the education center at the time of application for use.
												
												<br/><br/><h3>Article 6 (Application for Service Use)</h3>
												1. Customers who wish to use this service by signing up as a member must provide all information (name, email, contact information, etc.) requested by the training center.<br/>
												2. All members must provide their own name and email to use the service, and users who do not register with their real name cannot claim any rights.<br/>
												3. You can sign up for membership only with your real name, and the training center can take measures to verify your real name.<br/>
												4. All IDs of members who applied for use by stealing someone else's name (name and email) will be deleted, and they may be punished according to relevant laws.<br/>
												5. The Education Center may differentiate the services provided by level for members who use this service.
												
												<br/><br/><h3>Article 7 (Protection and Use of Personal Information)</h3>
												1. The Education Center strives to protect users' personal information, including user registration information, in accordance with the relevant laws and regulations. Regarding the protection and use of user's personal information, related laws and the education center's privacy policy apply. However, the education center's privacy policy does not apply to sites linked from the web other than the education center's official website. In addition, the education center is not responsible for any information exposed due to reasons attributable to the user.<br/>
												2. The provided personal information cannot be used for any other purpose or provided to a third party without the user's consent, and all responsibility for this shall be the "mall". However, exceptions are made in the following cases.<br/>
												① In the case of providing the delivery company with the minimum user information (name, address, phone number) required for delivery<br/>
												② In case a specific individual is provided in a form that cannot be identified as necessary for statistical writing, academic research or market research<br/>
												3. If the "mall" is required to obtain the user's consent pursuant to paragraphs 2 and 3, the identity of the person in charge of personal information management (affiliation, name, phone number and other contact information), purpose of collection and use of information, and third Matters stipulated in Article 16, Paragraph 3 of the Act on Promotion of Information and Communications Network Utilization, etc., such as matters related to the provision of information to users (recipient, purpose of provision, and contents of information to be provided), etc. You can withdraw.<br/>
												4. Users may request to view and correct errors on their personal information possessed by the "mall" at any time, and the "mall" is obligated to take necessary measures without delay. If a user requests correction of an error, the "Mall" will not use the personal information until the error is corrected.<br/>
												5. "Mall" or a third party who receives personal information from it destroys the personal information without delay when it has achieved the purpose of collecting or receiving personal information.
												
												<br/><br/><h3>Article 8 (Acceptance and Restriction of Application for Use)</h3>
												1. In principle, the Education Center approves the use of the service in the order of reception when there is no problem in performance or technology for customers applying for use pursuant to Article 6.<br/>
												2. The Education Center does not approve of the following cases.<br/>
												① * If the application is not a real name or someone else's name<br/>
												② * If the contents of the application for use contract are false<br/>
												③ * In the case of applying for the purpose of hindering social well-being, order, and morals<br/>
												④ * If you want to use this service for fraudulent purposes<br/>
												⑤ * If you want to use this service for the purpose of pursuing profit<br/>
												⑥ * In case of applying in violation of other regulations <br/>
												⑦ * In case a user in competition with this service applies<br/>
												⑧ * In case of applying in violation of other regulations<br/>
												3. If the application for service use falls under any of the following subparagraphs, the education center may defer approval until the reason for the restriction on acceptance is resolved.<br/>
												① * If the training center does not have enough facilities <br/>
												② * In case of technical difficulties in the education center<br/>
												③ * In case it is difficult to approve the use due to reasons attributable to the education center
												
												<br/><br/><h3>Article 9 (User ID assignment and change, etc.)</h3>
												1. The Education Center grants user IDs to customers as stipulated in the terms and conditions.<br/>
												2. User ID cannot be changed in principle, and if you want to change it due to unavoidable reasons, you must cancel the ID and re-register.<br/>
												3. User ID can be changed at the request of the user or the training center in the following cases. <br/>
												① If the user ID is registered with the user's phone number or e-mail, etc., there is a concern about invasion of privacy<br/>
												② In the case of causing disgust to others or going against public morals<br/>
												③ If there are other reasonable reasons<br/>
												4. The user is responsible for managing the service user ID and password. Users are responsible for damages in service use caused by negligent management or illegal use by a third party, and the Education Center does not take any responsibility for them.<br/>
												5. Matters regarding the management and change of other users' personal information shall be governed by the guidance for each service.
												
												
												<br/><br/><br/><h5>Chapter 3 Obligations of the Contracting Parties</h5>
												<h3>Article 10 (Duty of Education Center)</h3>
												1. The education center must ensure that the customer can use the service on the desired service start date, unless there are special circumstances.<br/>
												2. In order to provide continuous and stable service, the Education Center repairs or restores without delay when there is a failure or loss of equipment unless there is an unavoidable reason.<br/>
												3. The education center establishes a security system to protect personal information and discloses and complies with the privacy policy.<br/>
												4. "Mall" is posted on the initial service screen (front page) of the mall so that users can know the contents of the terms and conditions, company name, business location, representative's name, business registration number, and contact information (telephone, fax, e-mail address, etc.) <br/>
												5. "Mall" may amend these Terms and Conditions to the extent that it does not violate related laws such as the Act on the Regulation of Terms, the Framework Act on Electronic Commerce, the Electronic Signature Act, the Act on Promotion of Information and Communications Network Utilization, etc., the Act on Door-to-Door Sales, and the Consumer Protection Act. There is.<br/>
												6. If the "mall" amends the terms and conditions, the date of application and the reason for the amendment shall be specified and announced along with the current terms and conditions on the initial screen of the mall from 7 days before the effective date to the day before the effective date.<br/>
												7. If the "mall" amends the terms and conditions, the date of application and the reason for the amendment shall be specified and announced along with the current terms and conditions on the initial screen of the mall from 7 days before the effective date to the day before the effective date.<br/>
												8. If the "Mall" amends the terms and conditions, the revised terms and conditions apply only to contracts concluded after the date of application, and the terms and conditions before the revision apply to contracts already concluded before that date. However, if a user who has already entered into a contract transmits his or her intention to be subject to the provisions of the account terms and conditions to the "mall" within the notice period of the amended terms and conditions under paragraph 3 and receives the consent of the "mall", the provisions of the amended terms and conditions apply. It's possible. <br/>
												9. Matters not stipulated in these Terms and Conditions in relation to the "Mall" and the interpretation of these Terms and Conditions shall be governed by the E-Commerce Consumer Protection Guidelines and related laws or commercial practices established by the government.
												
												<br/><br/><h3>Article 11 (Obligations of Users)</h3>
												1. When applying for membership or changing member information, users must write all matters based on facts under their real names, and cannot claim any rights if false or other people's information is registered.
												<br/>2. Members must comply with the matters stipulated in these Terms and Conditions, other regulations and notices announced by the Education Center, and related laws, as well as other acts that interfere with the work of the Education Center, and damage the reputation of the Education Center. Do not do anything that damages it.
												<br/>3. Members must immediately notify the training center of any changes to the contract of use, such as address, contact information, or e-mail address, through the relevant procedures.
												<br/>4. Members are responsible for all consequences arising from negligent management and illegal use of IDs and passwords assigned to members, except when the Education Center is responsible for it in accordance with the relevant laws and 'Personal Information Protection Policy'.
												<br/>5. Members cannot conduct sales activities using the service without prior consent from the Education Center, and the Education Center is not responsible for the results of such sales activities. In addition, if a member suffers damages to the education center due to such business activities, the member is obligated to compensate the education center for damages, and the education center cannot restrict the member's use of services and claim compensation for damages through legal procedures. there is.
												<br/>6. Members cannot transfer or give the right to use the service or other status under the contract of use to another person without the express consent of the Education Center, and cannot provide it as collateral.
												<br/>7. Members must not infringe the intellectual property rights of the Education Center and third parties.
												<br/>8. Members must not engage in any of the following acts, and if they do, the Education Center may impose sanctions, including restrictions on members' use of services and legal action.
												<br/>* Entering false personal information or duplicating registration
												<br/>* Stealing someone else's service ID and email
												<br/>* An act of impersonating the management, staff, or related persons of the education center.
												<br/>* Distributing one's ID and password
												<br/>* Infringement of intellectual property rights of others
												<br/>* Acts that defame others or invade their privacy
												<br/>* Intentionally or negligently disclosing or distributing false information
												<br/>* An act of interfering with the stable operation of the service by transmitting a large amount of information or repeatedly posting the same or similar information.
												<br/>* Any act of copying, distributing, or commercially using or distributing information obtained by using the services of the Education Center without prior consent from the Education Center
												<br/>* Illegal election campaigning
												<br/>* Changing the Education Center's client program, hacking the Education Center's server, or arbitrarily changing part or all of the website or posted information without special rights granted by the Education Center
												<br/>* An act of transmitting, posting, e-mailing, or distributing vulgar or obscene information, sentences, figures, sounds, or videos that violate public order and morals to others
												<br/>* An act of transmitting, posting, e-mailing, or otherwise distributing content that is insulting or personal and may infringe on the honor or privacy of others.
												<br/>* An act of harassing or threatening other users, or causing continuous pain or inconvenience to a specific user.
												<br/>* Collecting or storing other users' personal information without the approval of the Education Center
												<br/>* An act that is objectively judged to be related to a crime
												<br/>* Violation of all rules or terms of use set by other education centers, including these terms and conditions
												<br/>* Acts that violate other related laws
												<br/>9. Members must not engage in business activities for commercial purposes by using the service without the prior written consent of the Education Center. The Education Center is not responsible for the results of sales activities that violate this, and if the Education Center suffers damages as a result of such sales activities, the member is obliged to compensate for the damages to the Financial Academy.
												
												
												<br/><br/><br/><h5>Chapter 4 Use of Services</h5>
												<h3>Article 12 (Service Usage Hours)</h3>
												1. In principle, service use is operated 24 hours a day, 7 days a week, unless there is a special obstacle to the business or technology of the education center. However, the education center may temporarily suspend service on the day or time set by the education center for regular system inspection, expansion, and replacement, and service suspension due to scheduled work will be notified in advance through the education center web.
												<br/>2. The Education Center may temporarily suspend service without notice due to unavoidable reasons such as urgent system inspection, expansion and replacement, and may completely suspend the currently provided service for reasons deemed appropriate by the Education Center, such as replacing with a new service. can.
												<br/>3. The Education Center may restrict or suspend all or part of the service if normal service is impossible to provide due to a national emergency, power outage, failure of service facilities, or congestion of service use. However, in this case, the reason and period are notified to the member in advance or afterward.
												<br/>4. In case of service interruption due to reasons beyond the education center's control (disk failure, system down, etc. without system administrator's intention or negligence), prior notification is not possible, and ) will not be notified in case of intentional or negligent system shutdown.
												<br/>5. The training center can divide the service into specific ranges and separately designate available hours for each range. However, in this case, the contents will be notified.
												<br/>6. If the education center intends to restrict the use of the service, it notifies the user by e-mail or phone after setting the reason, date, and period. However, this may not be the case if the Education Center recognizes that it is necessary to suspend use urgently.
												
												<br/><br/><h3>Article 13 (Provision of Mall Services)</h3>
												1. "Mall" performs the following tasks.
												<br/>① Provision of information on goods or services and conclusion of purchase contract
												<br/>② Delivery of goods or services for which a purchase contract has been concluded
												<br/>③ Other tasks designated by the "mall"
												<br/>2. 'Mall' may change the contents of goods and services to be provided by contracts to be concluded in the future in the event of out-of-stock goods or changes in technical specifications. In this case, specify the contents of the changed goods and services and the date of provision, and In the place where the contents of the goods and services are posted, they are notified from 7 days prior to the date of provision.
												<br/>3. If the contents of the service contracted with the user by the "mall" are changed for reasons such as out of stock or change in technical specifications, the "mall" compensates for damages suffered by the user. However, this is not the case if there is no intention or negligence in the "Mall".						
											</div>
											<div class="agree_check">
												<input type="radio" id="agree1" name="agree1"/>
												<label for="agree1">Disagree</label>
												<input type="radio" id="agree2" name="agree1"/>
												<label for="agree2">I agree</label>
											</div>
										</div>
					
										<div class="c_section">
											<h4 class="c_tit">Privacy policy</h4>
											<div class="agreement" tabindex="0">				
												<p align="left" >This Privacy Policy is the contents of the protection policy regarding the management and operation of user personal information so that members can use the various services of the site operated by site with confidence.<br /><br />
												We promise to do our best to protect personal information related to the member's privacy and prevent personal information leakage and damage. It can be arbitrarily adjusted according to changes, so please check it from time to time.<br /><br />
												This privacy policy is specified to ensure privacy, freedom and communication secrets, which are the basic rights of users using site, and to prevent human rights violations due to illegal information leakage. <br /><br />
												Please read the Privacy Policy below to understand how your personal information will be treated while using site's services. This privacy policy may change from time to time, so please visit and check it regularly. </p>
												
												<br /><br /><strong class="blue">1. Definitions of Terms Used in the Privacy Policy</strong> <br /><br />
												<p align="left" >"Personal information" is information about a living individual or company that can identify the individual or company by the name, e-mail address, contact information, etc. included in the information. Information (including information that can be easily combined with other information to identify a specific individual even if the information alone cannot identify a specific individual). <br />
												"User" refers to a person who uses the services provided by site. <br />
												"Withdrawal" refers to canceling the service use contract. <br />
												</p>
												<br /><br /><strong>2. Purpose of collection and use of personal information</strong><br /><br />
												<p align="left" class="pop_basic_sub">Site collects users' personal information to provide comprehensive knowledge information across corporate and institutional management, a list of publications, and educational programs. <br />
												The information we collect is as follows. <br /><br />
												- Required items for service provision <br />
												: Name, mobile phone number, email, address<br /><br />
												</p>
												<br /><br /><strong>3. When personal information is provided to a third party</strong><br /><br />
												<p align="left">Site does not share your personal information with any other companies.</p>
												<br /><br /><strong class="blue">4. Rights of users, such as withdrawal or modification requests</strong><br /><br />
												<p align="left">You can modify or cancel your personal information by calling or e-mailing us at any time.</p>
												<br /><br /><strong class="blue">5. Retention period and usage period of collected personal information</strong><br /><br />
												<p align="left">User's personal information will be retained by site while receiving services provided by site.<br/>
												However, if the user requests withdrawal according to the procedure described above, the collected personal information is completely deleted from the hard disk in a way that cannot be reproduced, and is processed so that it cannot be viewed or used for any purpose.<br/>
												If you want to re-register after withdrawal, there is no limit, and you can sign up through the same procedure as the initial registration process.<br/>
												</p>
												<br /><br /><strong class="blue">6. Matters concerning the operation of cookies</strong><br /><br />
												<p align="left">You have choices about cookies. By adjusting the options in your web browser, you can have the option of accepting all cookies, sending a notification when a cookie is placed, or rejecting all cookies.</p>
												
												<br /><br /><strong class="blue">7. Technical and Administrative Measures</strong> <br /><br />
												<p align="left">Inside the server, anti-virus programs are used to prevent damage caused by computer viruses. Vaccine programs are regularly updated, and in the event of a sudden virus outbreak, vaccines are provided as soon as they become available to prevent personal information from being damaged. <br />
												site restricts personal information handling staff to a minimum, emphasizes compliance with this policy through frequent training of staff in charge, and checks compliance with this policy and staff in charge to correct problems immediately We are taking action.
												</p>
												<br /><br /><strong class="blue">8. Matters concerning handling complaints related to personal information</strong><br /><br />
												<p align="left">Site handles complaints related to personal information and complaints through e-mail or inquiry bulletin board.
												</p>
											</div>
											<div class="agree_check">
												<input type="radio" id="agree3" name="agree2"/>
												<label for="agree3">Disagree</label>
												<input type="radio" id="agree4" name="agree2"/>
												<label for="agree4">I agree</label>
											</div>
										</div>
										<div class="join_type">
											<ul>
												<li class="email">
													<a href="#" onClick="fnProceed();return false;">
														<span>Next step</span>
													</a>
												</li>
											</ul>
										</div>
									</div>	
								</div>
							</div>	
						</div>
					</form>
				</div>		
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>