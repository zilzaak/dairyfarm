<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>sell animal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>

<script>
var module=angular.module("sellapp",[]);
module.controller("sellcontrol",function($scope,$http){
	$scope.types=['খাবার','ঘর','অন্যান্য ']
	$scope.cd=[]; $scope.cm=[]; $scope.cy=[];
	$scope.days=['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26',
		'27','28','29','30','31'];
	$scope.month=['01','02','03','04','05','06','07','08','09','10','11','12'];
	$scope.year=[];
	$scope.inityear=function(){
		for(var k=1900;k<=3000;k++){
			
			$scope.year.push(k);
	                     }
	                         }
		

	
	$scope.sellafter=function(r){

		$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/cowsell/sellafter", 
		data:r,
		headers: {"Content-Type":"text/plain","responseType":"application/json"}
		}).then(function(response){
			
			alert("okkkkkkkkkkkkkkkk");
		})
			}	
	

	
	$scope.sellbefore=function(s){
		
			$http({
			method:"POST",
		    url:"${pageContext.request.contextPath}/cowsell/sellbefore", 
			data:s,
			headers: {"Content-Type":"text/plain","responseType":"application/json"}
			}).then(function(response){
				
				alert("okkkkkkkkkkkkkkkk");
			})
				}	

	$scope.dbt1;
	$scope.dbt2;
	
	$scope.selldatebt=function(){		
		var x=[$scope.dbt1,$scope.dbt2];
		$http({
		method:"POST",
	    url:"${pageContext.request.contextPath}/cowsell/selldatebt", 
		data:angular.toJson(x),
		headers: {"Content-Type":"application/json"}
		}).then(function(response){
			
			alert("okkkkkkkkkkkkkkkk");
		})
		
		
			}	
	
	

})


</script>

<script>

function showdiv(a,b,c,d,e,f,g){
	document.getElementById(a).style.display="block";
	document.getElementById(b).style.display="none";
	document.getElementById(c).style.display="none";
	document.getElementById(d).style.display="none";
	document.getElementById(e).style.display="none";
	document.getElementById(f).style.display="none";
	document.getElementById(g).style.display="none";
}


</script>


<style>
table td:hover{
background-color:silver; color:green;

}

input:hover{
background-color:maroon; color:white;

}
table th{
word-break:breal-all;
background-color:black;
color:white;

}
table td{
word-break:breal-all;
background-color:white;
color:black;

}

a:hover{
background-color:steelblue;

}


.dropdown-menu a:hover{
background-color:steelblue;

}
</style>

</head>
<body style="background-color:lightseagreen;" ng-controller="sellcontrol"  ng-app="sellapp"  ng-init="inityear();">

<%
if(session.getAttribute("adminuser")==null && session.getAttribute("adminpass")==null){
	response.sendRedirect("${pageContext.request.contextPath}/");
	}

	  %>



	  <nav class="navbar navbar-expand-lg" style="margin-right:7%;margin-left:8%;margin-top:2%;border-radius:8px;background-color:darkslategrey;">
  <a class="navbar-brand" href="#" style="margin-left:5%;color:white;">ANIMAL SELLING & SEARCH HISTOREY</a>
  <div class="collapse navbar-collapse" style="margin-left:10%;" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">     
      <li class="nav-item dropdown"  style="margin-left:10%;">
        <a id="x" class="nav-link dropdown-toggle" style="margin-left:5%;color:white;" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          search query
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" onclick="showdiv('1','2','3','4','5','6','7');">record between two date</a>
          <a class="dropdown-item" href="#" onclick="showdiv('2','3','4','5','6','7','1');">record after a date</a>
          <a class="dropdown-item" href="#" onclick="showdiv('3','4','5','6','7','2','1');">record before a date</a>
           <a class="dropdown-item" href="#" onclick="showdiv('4','5','6','7','1','2','3');">record by id</a>
          <a class="dropdown-item" href="#" onclick="showdiv('5','6','7','1','2','3','4');">record by price </a></div>
         </li>
           <li class="nav-item dropdown"  style="margin-left:15%;color:green;">
        <a class="nav-link dropdown-toggle" href="#" style="margin-left:15%;color:white;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          save selling info
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" onclick="showdiv('6','7','1','2','3','4','5');">insert record</a>
        
      </li>
       <li class="nav-item dropdown" style="margin-left:15%;color:green;">
        <a  class="nav-link dropdown-toggle" href="#" style="margin-left:15%;color:white;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          total sell
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" onclick="showdiv('7','1','2','3','4','5','6');">total sell</a>
        </div>
      </li>
         </ul>
  </div>
</nav>


<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="1">

<h1>this is div 1</h1>


</div>
<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="2">


<h1>this is div 2</h1>

</div>
<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="3">

<h1>this is div 3</h1>


</div>

<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="4">

<h1>this is div 4</h1>
<input type="text" ng-model="d"/>
<button class="btn btn-success" ng-click="sellafter(d)">sell after</button>
<input type="text" ng-model="s"/>
<button class="btn btn-success" ng-click="sellbefore(s)">sell before</button>
<br/>
<button class="btn btn-dark btn-sm" ng-click="selldatebt()">betweentwodate</button>

<b>date 1</b><input type="text" ng-model="dbt1" /> and  <b>date 2</b> <input type="text" ng-model="dbt2" />

</div>

<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="5">
<h1>this is div 5</h1>



</div>




<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="6">
<br/><br/>
    <h4 style="text-align:center;">add selling record 6</h4>
<br/><br/>
<div style="height:300px;width:300px;background-color:gray;margin-left:35%;">

</div>


</div>



<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="7">

<h1>this is div 7</h1>


</div>

</body>

</html>
