<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<style>
* {
	margin: 0;
	padding: 0
}

html,body{
	width: 100%;
	height: 100%;
}

header{
	width: 100%;
	height: 12%;
	line-height: 120px;
	text-align: center;
	background: deepskyblue;;
	color: white;
	font-size: 1.1em;
}

nav{
	width: 15%;
	height: 83%;
	line-height: 45px;
	background: black;
	color: white;
	float: left;
	text-align: center;
}

nav ul{
	display: inline-block;
	list-style-type: none;
}

nav li{
	float: center;
	margin: 0 25px;
}

nav a{
	display: block;
	text-decoration: none;
	color: white;
}

nav a:HOVER{
	color: white;
	background: deepskyblue;
	font-weight: bold;
	width: 100%;
}

section{
	width: 85%;
	height: 83%;
	float: left;
}

section h2{
	text-align: center;
	margin: 20px auto;	
}

footer{
	width: 100%;
	height: 5%;
	line-height: 45px;
	text-align: center;
	background: grey;
	color: white;
	font-size: 0.9em;
	clear: both;
}

table{
	margin: 0 auto;
	border-collapse: collapse;
	border: 2px solid grey;
}

tr,th,td{
	border: 1px solid grey;
}

#tr_btn{
	height: 50px;
}

#btn1{
	width: 120px;
	height: 30px;
	background: black;
	color: white;	
}

#btn2{
	width: 120px;
	height: 30px;
	background:grey;
	color: black;
	font-weight: bold;	
}

#p1 {
	margin-left: 5px;
	text-align: left;
}

#p2 {
	margin-right: 5px;
	text-align: right;
}

.btn_group{
	margin: 15px auto;
}

#ra1 {
	margin-left: 3px;
}

#chk1 {
	margin-left: 3px;
}

#sel1 {
	margin-left: 3px;
	width:150px;
	height: 25px;
}

</style>
</head>
<body>
	<header>
		<h1>수강신청 도우미 사이트</h1>
	</header>
</body>
</html>