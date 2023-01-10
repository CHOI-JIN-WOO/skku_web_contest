<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>		
	</head>	
	<body>	
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title"><c:out value="${title}"/></h3>
					</div>			
				</div>			
				<div id="cont">
					<!-- Algorithms -->		
					<c:if test='${REQUEST_DATA.courseno == 1}'>
						<div class="cont_txt">
							<div class="wrapper">
								<div class="cont_body">
									<div class="c_section">
										<h4 class="c_tit">Course Introduction</h4>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="30%" class="col3_1"/>
													<col width="70%"/>
												</colgroup>
												<tr>
													<td style="padding:0px; border:0px" colspan="3">
														<table>
															<colgroup>
																<col width="30%" class="col3_1"/>
																<col width="40%"/>
																<col width="15%" class="col3_1"/>
																<col width="15%"/>
															</colgroup>
															<th style='word-break: normal;'>Course name (Academic number)</th>
															<td style='word-break: normal;'>introduction to Algorithm(SWE2016-43)</td>																													
															<th style='word-break: normal;'>credits / hours</th>
															<td>3/3</td>
														</table>
													</td>
												
												</tr>
												<tr>
													<th>school year/semester</th>
													<td>2022/02</td>	
												</tr>
												<tr>
													<th rowspan="4">Course information</th>
													<td>Class hour: Tuesday[DD]13:30-14:45,Thursday[CC]12:00-13:15</td></tr>
												</tr>
												<tr>
													<td>Classroom: [26311]Engineering 2 (26) e+ Lecture Room</td>
												</tr>
												<tr>
													<td>Professor: Cho Dae Ho</td>
												</tr>
												<tr>
													<td>Contact (Lab): 031-290-7132</td>
												</tr>
												<tr>
													<th>Outline of the Course</th>
													<td style='word-break: normal;'>In this course, students study the analysis, design, and implementation of computer algoritms. Upon completion of this course, students will be 
														able to analyze the asymtotice performance of algorithms, demonstrate a familiarity with major algorithms and data structures, apply important algorithms to programming related
														 problems, and design and implemnet the algorithms in computer languages.
													</td>
												</tr>
												<tr>
													<th>Course objectives</th>
													<td style='word-break: normal;'>
														<li>Understand the objective of algorithms.</li>
														<li>Envaluate the performance of algorithms.</li>
														<li>Learn and apply the major algorithms such as Heap sort, Quick sort, Red-Black tree, etc.</li>
														<li>Learn and apply algorithms like Greedy algorithm, graph algorithm, etc.</li>
													</td>
												</tr>
												<tr>
													<th style='word-break: normal;'>Association with <br>Program Training Objectives</th>
													<td style='word-break: normal;'>
														<li>Developing problem-solving skills based on creative thinking and basic engineering knowledge.</li>
														<li>Cultivating comprehensive design capabilities that create beneficial value based on expertise and design techniques in the field of computer engineering.</li>
														<li>Developing effective communication and teamwork skills that should be possessed as an engineer in a digital information society.</li>
														<li>Cultivating continuous self-development with an open mind and a sense of responsibility as a proper social worker.</li>													
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					
					<!-- Computer Architecture -->
					<c:if test='${REQUEST_DATA.courseno == 2}'>
						<div class="cont_txt">
							<div class="wrapper">
								<div class="cont_body">
									<div class="c_section">
										<h4 class="c_tit">Course Introduction</h4>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="30%" class="col3_1"/>
													<col width="70%"/>
												</colgroup>
												<tr>
													<td style="padding:0px; border:0px" colspan="3">
														<table>
															<colgroup>
																<col width="30%" class="col3_1"/>
																<col width="40%"/>
																<col width="15%" class="col3_1"/>
																<col width="15%"/>
															</colgroup>
															<th style='word-break: normal;'>Course name (Academic number)</th>
															<td style='word-break: normal;'>introduction to Computer Sturcture(SWE3005-41)</td>																													
															<th style='word-break: normal;'>credits / hours</th>
															<td>3/3</td>
														</table>
													</td>
												</tr>
												<tr>
													<th>school year/semester</th>
													<td>2022/02</td>	
												</tr>
												<tr>
													<th rowspan="4">Course information</th>
													<td>Class hour: Monday[DD]13:30-14:45,Wednesday[CC]12:00-13:15</td></tr>
												</tr>
												<tr>
													<td>Classroom: [23219]Engineering 1 (23) Remote Video Lecture Room</td>
												</tr>
												<tr>
													<td>Professor: Cho Hyeong Min</td>
												</tr>
												<tr>
													<td>Contact (Lab): 031-290-7698</td>
												</tr>
												<tr>
													<th>Outline of the Course</th>
													<td style='word-break: normal;'>In this course, students learn the fundamentals of the computer system operations.
														<br>- Low-level instructions
														<br>- The basic components of the processors
														<br>- Pipeline Architecture
														<br>- Memory system
													</td>
												</tr>
												<tr>
													<th>Course objectives</th>
													<td style='word-break: normal;'>
														<li>Understand the interface between the software and hardware</li>
														<li>Understand the basic organization of the computer processor</li>
														<li>Learn fundamental skills to evaluate the performance of a computer system</li>
														<li>Explore various techniques to imporove the performance of a computer system</li>
													</td>
												</tr>
												<tr>
													<th style='word-break: normal;'>Association with <br>Program Training Objectives</th>
													<td style='word-break: normal;'>
														<li>Developing problem-solving skills based on creative thinking and basic engineering knowledge.</li>
														<li>Cultivating comprehensive design capabilities that create beneficial value based on expertise and design techniques in the field of computer engineering.</li>
														<li>Developing effective communication and teamwork skills that should be possessed as an engineer in a digital information society.</li>
														<li>Cultivating continuous self-development with an open mind and a sense of responsibility as a proper social worker.</li>													
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					
					<!-- Operating System -->
					<c:if test='${REQUEST_DATA.courseno == 3}'>
						<div class="cont_txt">
							<div class="wrapper">
								<div class="cont_body">
									<div class="c_section">
										<h4 class="c_tit">Course introduction</h4>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="30%" class="col3_1"/>
													<col width="70%"/>
												</colgroup>
												<tr>
													<td style="padding:0px; border:0px" colspan="3">
														<table>
															<colgroup>
																<col width="30%" class="col3_1"/>
																<col width="40%"/>
																<col width="15%" class="col3_1"/>
																<col width="15%"/>
															</colgroup>
															<th style='word-break: normal;'>Course name (Academic number)</th>
															<td style='word-break: normal;'>Operating system(SWE3004-41)</td>																													
															<th style='word-break: normal;'>credits / hours</th>
															<td>3/3</td>
														</table>
													</td>
												</tr>
												<tr>
													<th>school year/semester</th>
													<td>2022/02</td>	
												</tr>
												<tr>
													<th rowspan="4">Course information</th>
													<td>Class hour: Monday[AA]09:00-10:15,Wednesday[BB]10:30-11:45</td></tr>
												</tr>
												<tr>
													<td>Classroom: [26312]Engineering 2 (26) e+ recording Lecture Room</td>
												</tr>
												<tr>
													<td>Professor: Um Young Ik</td>
												</tr>
												<tr>
													<td>Contact (Lab): 031-290-7120</td>
												</tr>
												<tr>
													<th>Outline of the Course</th>
													<td style='word-break: normal;'>In this course, after examining the basic concepts, structures,
														 and functions of the operating system, we study specific functions such as process management, 
														 processor management, storage device management, file and input/output management, and security 
														 management to understand the computer system's operation process at the software level.
													</td>
												</tr>
												<tr>
													<th>Course objectives</th>
													<td style='word-break: normal;'>
														<li>Students can explain the overall operating process of the operating system.</li>
														<li>Students can analyze/comparison techniques used in detailed components such as process and processor management, memory management, and file management.</li>
														<li>Students can model and design detailed components of the operating system by applying them creatively.</li>
														<li>Students can develop the unit modules of the operating system as a basic function.</li>
													</td>
												</tr>
												<tr>
													<th style='word-break: normal;'>Association with <br>Program Training Objectives</th>
													<td style='word-break: normal;'>
														<li>Developing problem-solving skills based on creative thinking and basic engineering knowledge.</li>
														<li>Cultivating comprehensive design capabilities that create beneficial value based on expertise and design techniques in the field of computer engineering.</li>
														<li>Developing effective communication and teamwork skills that should be possessed as an engineer in a digital information society.</li>
														<li>Cultivating continuous self-development with an open mind and a sense of responsibility as a proper social worker.</li>													
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					
					<!-- Web Programming -->
					<c:if test='${REQUEST_DATA.courseno == 4}'>
						<div class="cont_txt">
							<div class="wrapper">
								<div class="cont_body">
									<div class="c_section">
										<h4 class="c_tit">Course introduction</h4>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="30%" class="col3_1"/>
													<col width="70%"/>
												</colgroup>
												<tr>
													<td style="padding:0px; border:0px" colspan="3">
														<table>
															<colgroup>
																<col width="30%" class="col3_1"/>
																<col width="40%"/>
																<col width="15%" class="col3_1"/>
																<col width="15%"/>
															</colgroup>
															<th style='word-break: normal;'>Course name (Academic number)</th>
															<td style='word-break: normal;'>Web Programming Lab(SWE3048-41)</td>																													
															<th style='word-break: normal;'>credits / hours</th>
															<td>2/4</td>
														</table>
													</td>
												</tr>
												<tr>
													<th>school year/semester</th>
													<td>2022/02</td>	
												</tr>
												<tr>
													<th rowspan="4">Course information</th>
													<td>Class hour: Tuseday[10,11,12,13]18:00-21:45</td></tr>
												</tr>
												<tr>
													<td>Classroom: [85702]Research & Business Center e+ Lecture Room</td>
												</tr>
												<tr>
													<td>Professor: Tamer</td>
												</tr>
												<tr>
													<td>Contact (Lab): 031-290-7968</td>
												</tr>
												<tr>
													<th>Outline of the Course</th>
													<td style='word-break: normal;'>This course is an introduction to programming for the World Wide Web.
														 Students learn foundational programming concepts (e.g., functions, for loops, conditional statements) and
														  how to solve problems like a programmer. In addition, learn basic web development as you bulid web pages
														   using HTML, CSS, JavaScript, and JSP. By the end of the course, students can create a dynamic website with
														    frontend and backend programming approaches.
													</td>
												</tr>
												<tr>
													<th>Course objectives</th>
													<td style='word-break: normal;'>
														<li>Be able to design and program in Hypertext Markup Language(HTML) for authoring web pages</li>
														<li>Be able to design and program using Cascading Style Sheets(CSS) for styling web pages</li>
														<li>Be able to design and program using JavaScript for creating interactive web pages</li>
														<li>Be able to develop web pages that support Asynchronous JavaScript and XML(Ajax) for enhanced web interaction and applications</li>
													</td>
												</tr>
												<tr>
													<th style='word-break: normal;'>Association with <br>Program Training Objectives</th>
													<td style='word-break: normal;'>
														<li>Developing problem-solving skills based on creative thinking and basic engineering knowledge.</li>
														<li>Cultivating comprehensive design capabilities that create beneficial value based on expertise and design techniques in the field of computer engineering.</li>
														<li>Developing effective communication and teamwork skills that should be possessed as an engineer in a digital information society.</li>
														<li>Cultivating continuous self-development with an open mind and a sense of responsibility as a proper social worker.</li>													
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>					
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>