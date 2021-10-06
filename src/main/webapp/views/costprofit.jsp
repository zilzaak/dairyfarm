<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>cost and profit</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>

<script>
var module=angular.module("dailyapp",[]);
module.controller("dailycontrol",function($scope,$http){
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
		
$scope.dailycost=[];
var cost1={"type":"","itemname":"","amount":"","cost":null,"stringcostdate":"" };
var cost2={"type":"","itemname":"","amount":"","cost":null,"stringcostdate":"" };
var cost3={"type":"","itemname":"","amount":"","cost":null,"stringcostdate":"" };
$scope.dailycost.push(cost1);
$scope.dailycost.push(cost2);
$scope.dailycost.push(cost3);
$scope.deletecost=function(i){
	
	$scope.dailycost.splice(i,1);
}
$scope.addcost=function(){
	var cost={"type":"","itemname":"","amount":"","cost":null,"stringcostdate":"" };
	$scope.dailycost.push(cost);
}
$scope.removecost=function(){
	var length=$scope.dailycost.length;
	$scope.dailycost.splice(length-1,1);
}
$scope.setcostdate=function(i){
	
	$scope.dailycost.stringcostdate=$scope.cd[i]+"/"+$scope.cm[i]+"/"+$scope.cy[i];	

}
$scope.savecost=function(i){
	
$http({
	method:"POST", url:"${pageContext.request.contextPath}/",
	data:angular.toJson($scope.dailycost),headers: {"Content-Type":"application/json"}
	
	}).then(function(respose){
	
alert('record is successfully saved');	
})	

}

var cps={"tcostanimal":"","tcostdaily":"","tcost":"","tsellcow":"","tsellmilk":"","tprofit":"","tsold":""}

$scope.thisab=function(){
	$http({
		method:"POST", 
		url:"${pageContext.request.contextPath}/costprofit/thisab",
		data:angular.toJson(cps),
		headers: {"Content-Type":"application/json"}
			}).then(function(response){
			
				$scope.cp=response.data;
document.getElementById('pophisab').click();	

	       })	
	
	
}


$scope.m=""; $scope.y=""; $scope.d="";
 $scope.d2;  $scope.m2; $scope.y2;
 
$scope.inamonth=function(){
	
	var s=[];
	s[0]=$scope.m;
	s[1]=$scope.y;
	
	$http({
		method:"POST", 
		url:"${pageContext.request.contextPath}/costprofit/inamonth",
		data:angular.toJson(s),
		headers: {"Content-Type":"application/json"}
			}).then(function(response){
				alert("okkkkk");
		$scope.scp=response.data;


	       })			
	
}


$scope.inbetween=function(){
	
	var x =$scope.d+"/"+$scope.m+"/"+$scope.y;
	var y=$scope.d2+"/"+$scope.m2+"/"+$scope.y2;
	var s=[x,y];
	
	$http({
		method:"POST", 
		url:"${pageContext.request.contextPath}/costprofit/inbetween",
		data:angular.toJson(s),
		headers: {"Content-Type":"application/json"}
			} ).then(function(response){
			alert("okkkkk");
		$scope.scp=response.data;


	       })		
	
	
}




$scope.inadate=function(){
	
	$scope.d1=$scope.d+"/"+$scope.m+"/"+$scope.y;
	
	$http({
		method:"POST", 
		url:"${pageContext.request.contextPath}/costprofit/inadate",
		data:$scope.d1,
		headers: {"Content-Type":"text/plain","Response-Type":"application/json"}
			} ).then(function(response){
			alert("okkkkk");
		$scope.scp=response.data;


	       })	
	
	
}


})



function disit(a,b,c,d,e,f,g){
	
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
</style>

</head>
<body style="background-color:lightseagreen;" ng-controller="dailycontrol"  ng-app="dailyapp"  ng-init="inityear();">

<%
if(session.getAttribute("adminuser")==null && session.getAttribute("adminpass")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}

	  %>
	  <nav class="navbar navbar-expand-lg" style="margin-right:7%;margin-left:8%;margin-top:2%;border-radius:8px;background-color:darkslategrey;">
  <a class="navbar-brand" href="#" style="margin-left:5%;color:white;">COST AND BENIFIT ANALYSIS</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon" style="color:white;"><b>click</b></span>
  </button> 
   <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:6%;">
    <ul class="navbar-nav mr-auto">     
      <li class="nav-item dropdown"  style="margin-left:6%;">
        <a class="nav-link dropdown-toggle" style="margin-left:5%;color:white;" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         total cost & profit
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      <a class="dropdown-item" href="#"  ng-click="thisab();">total cost,profit</a>
 
         </li>
        <li class="nav-item dropdown"  style="margin-left:6%;">
        <a class="nav-link dropdown-toggle" style="margin-left:5%;color:white;" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          search cost & profit
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" onclick="disit('1','2','3','7')">cost & profit in a month</a>
             <a class="dropdown-item" href="#" onclick="disit('2','3','7','1')">cost & profit between two date</a>
          <a class="dropdown-item" href="#" onclick="disit('3','7','1','2')">cost & profit in a date</a></div>
           </li>       
                
       <li class="nav-item dropdown" style="margin-left:6%;color:green;">
        <a  class="nav-link dropdown-toggle" href="#" style="margin-left:6%;color:white;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          save cost
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#" onclick="disit('7','1','2','3');">save daily spending</a>
        </div>
      </li>
         </ul>
  </div>
</nav>



<div id="1" style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;">

<h1>cost & profit of a month</h1>
<b>select month</b><select ng-model="m" ng-options="c for c in days"></select> 
<b>select year</b><select ng-model="y" ng-options="c for c in year"></select> <button ng-click="inamonth()">search</button>

</div>

<div id="2" style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;">
<h1>cost & profit between two date</h1> <br/>
<b>1st date::</b> <b>day/month/year</b><select ng-model="d" ng-options="c for c in days"></select>
<select ng-model="m" ng-options="c for c in month"></select><select ng-model="y" ng-options="c for c in year"></select> <br/><br/>

<b>2nd date::</b> <b>day/month/year</b><select ng-model="d2" ng-options="c for c in days"></select>
<select ng-model="m2" ng-options="c for c in month"></select><select ng-model="y2" ng-options="c for c in year"></select> <br/><br/>
<button ng-click="inbetween();">search</button>
</div>

<div id="3" style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;">
<h1>cost & profit in a date</h1>
<b>enter date::</b> <b>day/month/year</b><select ng-model="d" ng-options="c for c in days"></select>
<select ng-model="m" ng-options="c for c in month"></select><select ng-model="y" ng-options="c for c in year"></select> <br/><br/>
<button ng-click="inadate();">search</button>
</div>






<div  style="margin-left:8%;background-color:lightblue;width:85%;display:none;font-size:0.80em;" id="7">
	<br/><br/>

<div class="row">

<div class="col col-sm-2" style="text-align:center;">
<button ng-click="addcost()" class="btn btn-sm btn-info">add row</button>
<br/>
<br/>
<button ng-click="removecost()" class="btn btn-sm btn-dark">remove</button>
<br/>
<br/>
<button ng-click="savecost()" class="btn btn-sm btn-dark">save</button>
</div>

<div class="col col-md-10">
<table border="1" style="text-align:center;margin-left:25px;">
<tr>
<th>record no</th>
<th>item type</th>
<th>item name</th>
<th>amount</th>
<th>buying date</th>
<th>cost(TaKa)</th>
</tr>
<tr ng-repeat="x in dailycost">
<td>{{$index+1}}<br/>
<button class="btn btn-sm btn-danger" ng-click="deletecost($index)">delete</button>
</td>
<td><select ng-model="x.type" ng-options="c for c in types">
</select></td>
<td><input type="text" ng-model="x.itemname" /></td>
<td><input type="text" ng-model="x.amount" /></td>
<td>
<b>day</b><br/>
<select ng-model="cd[$index]" ng-options="c for c in days" ng-change="setcostdate($index)"></select>
<br/>
<b>month</b>
<select ng-model="cm[$index]" ng-options="c for c in month" ng-change="setcostdate($index)"></select>
<br/>
<b>year</b>
<br/>
<select ng-model="cy[$index]" ng-options="c for c in year" ng-change="setcostdate($index)"></select>
</td>
<td><input type="number" ng-model="x.cost"/></td>
</tr>
</table>
</div>

</div>
	<br/><br/>
</div>




  <button data-toggle="modal" data-target="#tcpmodal" id="pophisab" style="display:none;"></button>
 
  <div id="tcpmodal" class="modal fade" role="dialog" >
  <div class="modal-dialog"  >
       <!-- Modal content-->
  <div class="modal-content" style="width:500px;font-size:0.80em;">
  <div class="modal-header" style="background-color:gray;">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">cost & profit</h4>
  </div>
  <div class="modal-body" style="text-align:center;">

<h4>total investment</h4> <br/>
<ul style="list-style-type:none;padding:5px;">
<li style="background-color:maroon;color:white"><b style="color:gold;">animal buying cost::</b>{{cp.tcostanimal}} tk</li>
<li style="background-color:steelblue;color:white;"><b style="color:gold;">food,medicine,firm cost::</b>{{cp.tcostdaily}}tk</li>
<li style="background-color:maroon;color:white;"><b style="color:gold;">total spending/cost::</b>{{cp.tcost}} tk</li>
</ul>
<br/>
<h4>total selling</h4> <br/>
<ul style="list-style-type:none;padding:5px;">
<li style="background-color:maroon;color:white"><b style="color:gold;">total animal sold::</b>{{cp.tsellcow}} tk</li>
<li style="background-color:steelblue;color:white;"><b style="color:gold;">total milk sold::</b>{{cp.tsellmilk}} tk</li>
<li style="background-color:maroon;color:white;"><b style="color:gold;">total sold::</b>{{cp.tsold}} tk</li>
</ul>
<br/>
<h4>total profit</h4> <br/>
<ul>
<li style="color:maroon;"><b>total profit=totalsell-totalcost=</b>{{cp.tprofit}} tk</li>
</ul>
   </div>
  <div class="modal-footer">
   <button  class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>   
    






</body>

</html>
