<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 조회</title>
<style>
th {
	height: 35px;
	background: whitesmoke;
}

td {
	height: 25px;
	text-align: center;
}

.cnt{
	display: table;
	margin: 0 auto;
	width: 880px;
	height: 25px;
	text-align: left;
	font-size: 0.9em;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
			int cnt = 0;
			try {
				String sql = "select count(*) from sub0217";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<h2>학사 정보 목록</h2>
		<div class="cnt">
		<span>총 <b><%=cnt %>개</b>의 교과목이 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=100>과목코드</th>
				<th width=200>과목명</th>
				<th width=70>학점</th>
				<th width=100>담당강사</th>
				<th width=70>요일</th>
				<th width=100>시작시간</th>
				<th width=100>종료시간</th>
				<th width=140>관리</th>
			</tr>
			<%	
				DecimalFormat df = new DecimalFormat("0000");
				try{
					String sql ="select a.id, a.subject_name, a.credit, b.name, a.week, a.start_hour, a.end_hour from sub0217 a, lecturer0217 b where a.lecturer=b.idx order by a.id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String subject_name = rs.getString(2);
						String credit = rs.getString(3);
						String lec_name = rs.getString(4);
						String week = rs.getString(5);
						int start_hour = rs.getInt(6);
						int end_hour = rs.getInt(7);									
						%>
			<tr>
				<td><%=id%></td>
				<td><p id="p1"><%=subject_name%></p></td>
				<td><%=credit%></td>
				<td><%=lec_name%></td>
				<td><%=week%></td>				
				<td><%=df.format(start_hour)%></td>
				<td><%=df.format(end_hour)%></td>
				<td>
				<a href="/HRD_0217/sub0217/update_sub.jsp?id=<%=id %>">수정</a>
				<span>|</span>
				<a href="/HRD_0217/sub0217/delete_sub.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a>
				</td>				
			</tr>
					<%
					}					
				}catch(SQLException e){
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class="btn_group" align="center">
			<input id="btn1" type="button" value="작성" onclick="location.href='/HRD_0217/sub0217/add_sub.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>