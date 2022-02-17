<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
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
	width: 750px;
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
				String sql = "select count(*) from lecturer0217";
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
		<h2>강사 리스트</h2>
		<div class="cnt">
		<span>총 <b><%=cnt %>명</b>의 강사가 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=100>강사코드</th>
				<th width=100>강사명</th>
				<th width=220>전공</th>
				<th width=180>세부전공</th>
				<th width=120>관리</th>
			</tr>
			<%	
				try{
					String sql ="select * from lecturer0217 order by idx";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String idx = rs.getString(1);
						String name = rs.getString(2);
						String major = rs.getString(3);
						String field = rs.getString(4);			
						%>
			<tr>
				<td><%=idx%></td>
				<td><%=name%></td>
				<td><p id="p1"><%=major%></p></td>
				<td><p id="p1"><%=field%></p></td>
				<td>
				<a href="/HRD_0217/lecturer0217/update_lecturer.jsp?idx=<%=idx %>">수정</a>
				<span>|</span>
				<a href="/HRD_0217/lecturer0217/delete_lecturer.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a>
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
			<input id="btn1" type="button" value="작성" onclick="location.href='/HRD_0217/lecturer0217/add_lecturer.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>