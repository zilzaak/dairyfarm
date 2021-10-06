<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
<style>

.grid-contain{
display:grid;
grid-template-columns: 60% 40%;
background-color:lightgray;
}



.grid-contain div{
padding:10px;
word-wrap: break-word;
display:inline;
}
table th{
background-color:black;
color:white;
}

table td{
background-color:skyblue;
}

input:hover{
background-color:green;
color:white;
}

textarea:hover{
background-color:green;
color:white;
}

.x td:hover{
background-color:darkcyan;
}
</style>
<script>

var pr = <%= session.getAttribute("presitems")%>;

var mod=angular.module("pressapp",[]);

mod.controller("presscon",function($scope,$http,$window){
	$scope.presitems= pr;
$scope.days=["daily","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25",
	"26","27","28","29","30"
	 ];
	 
$scope.tsokal=[];
$scope.tdupur=[];
$scope.trat=[];

$scope.numbers=["১","১.৫","পৌনে ২","২","২.৫","পৌনে ৩","৩","৩.৫","পৌনে ৪","৪","৫","৬"];
$scope.dose=["1/2 টি করে ২ বেলা","১টি করে ২ বেলা","দিনে ১ টি"];

$scope.injamount=["মিঃগ্রাঃ প্রতিবার","মিঃলিঃ প্রতিবার ","সেঃগ্রাঃ প্রতিবার"];
$scope.injnumber=[];
$scope.injunit=[];
$scope.futa=[];
$scope.bela=[];
$scope.dongso=[];
$scope.dbela=[];
$scope.drfuta=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"];
$scope.drbela=["1","2","2","3","4","5","6"];
	 
	 $scope.ds=[];
	 $scope.ms=[];
	 $scope.ys=[];
	 $scope.sds=[];
	 $scope.sms=[];
	 $scope.sys=[];
	 
$scope.year=[];
$scope.month=["01","02","03","04","05","06","07","08","09","10","11","12"];
$scope.day=["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25",
	"26","27","28","29","30","31"];
	
$scope.typeselect=function(i){
	
	if($scope.presitems[i].drugtype=='syrup'){
		return 'syrup'
	}
	if($scope.presitems[i].drugtype=='vaccine'){
		return 'vaccine'
	}
	if($scope.presitems[i].drugtype=='drop'){
		return 'drop'
	}
	if($scope.presitems[i].drugtype=='cream'){
		return 'cream'
	}
	if($scope.presitems[i].drugtype=='tablet'){
		return 'tablet';
	}
if($scope.presitems[i].drugtype=='seline'){
		return 'seline';
	}
	
	if($scope.presitems[i].drugtype=='dose'){
		return 'dose';
	}
	
}	
	
$scope.insertinj=function(i){
		
	   $scope.presitems[i].rules=$scope.injnumber[i]+" "+$scope.injunit[i];	
	
			
		}	
	
	$scope.insertdrop=function(i){
		
		$scope.presitems[i].rules=$scope.futa[i]+"*"+$scope.bela[i];	
	
			
		}	
	$scope.insertdose=function(i){
		
		$scope.presitems[i].rules=$scope.dongso[i]+"পার্ট"+ $scope.dbela[i]+"বেলা";
		
		
		}	

	
	$scope.inserttab=function(i){
		
		$scope.presitems[i].rules=$scope.tsokal[i]+"-"+$scope.tdupur[i]+"-"+$scope.trat[i];
			
		                           }
	
$scope.drugtype=["syrup","drop","vaccine","tablet","antibiotic","dose","cream","seline"];


$scope.yearinit=function(){
	
	for(var i=2000;i<3100;i++){
		
		$scope.year.push(i);
	}

	
	
}


$scope.choosedate=function(i){
	$scope.presitems[i].stringlastdate =$scope.ds[i]+ "/"+$scope.ms[i]+"/"+$scope.ys[i];
	

}
$scope.schoosedate=function(i){
	$scope.presitems[i].stringstartingdate =$scope.sds[i]+ "/"+$scope.sms[i]+"/"+$scope.sys[i];
	

}


$scope.add=function(){
	var x = {"stringstartingdate":"","stringlastdate":"","prestype":"","drugtype":"","drugname":"","rules":"","consult":"","instruction":"","doctor":""}
	$scope.presitems.push(x);
		
}

$scope.remove=function(){
	
	var length=$scope.presitems.length;
	$scope.presitems.splice(length-1, 1); 
	
}


$scope.postpress=function(){
if($scope.presitems[0].doctor==null){
	alert("enter the doctor name please");
}
	
else{
		$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/prescribe/presfinal",
		data: angular.toJson($scope.presitems),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
		
  alert(response.data[0].rules);

                             
		        })	
}

}






})

</script>

</head>

<body ng-app="pressapp" ng-controller="presscon" ng-init="yearinit()">



<div style="margin:2%;">
<button ng-click="add();"  >add</button> <button ng-click="remove();" >remove</button>
</div>




<div class="grid-contain">

<div>
<input type="text" placeholder="doctor name" ng-model="presitems[0].doctor"/><br/>
<table style="font-size:0.78em;margin-left:30px;margin-top:15px;width:500px;" border="1" class="x">

<tr>
<th>সেবনের ধরন</th>
<th>ঔষধের ধরণ   </th>
<th>ঔষধের নাম</th>
<th>সেবন শুরু</th>
<th>সেবনের শেষ তারিখ</th>
<th>নিয়ম</th>
<th>শর্ত</th>
<th>বাড়তি নির্দেশনা</th>
</tr>
<tr ng-repeat="p in presitems">
<td>daily or every <select ng-model="p.prestype" ng-options="c for c in days"></select>day later
</td>
<td><select ng-model="p.drugtype" ng-options="c for c in drugtype"></select></td>
<td><input type="text" ng-model="p.drugname"/></td>

<td>
day<select ng-model="sds[$index]" ng-options="c for c in day"   ng-change="schoosedate($index)"></select>
month<select ng-model="sms[$index]" ng-options="c for c in month"  ng-change="schoosedate($index)"></select>
year<select ng-model="sys[$index]" ng-options="c for c in year"  ng-change="schoosedate($index)"></select>
</td>

<td>
day<select ng-model="ds[$index]" ng-options="c for c in day"   ng-change="choosedate($index)"></select>
month<select ng-model="ms[$index]" ng-options="c for c in month"  ng-change="choosedate($index)"></select>
year<select ng-model="ys[$index]" ng-options="c for c in year"  ng-change="choosedate($index)"></select>
</td>

<td>
<div ng-if="typeselect($index)=='drop'">
<b>ফোটা</b><select ng-options="c for c in drfuta" ng-model="futa[$index]"></select>
<b>বেলা</b><select ng-options="c for c in drbela" ng-model="bela[$index]" ng-change="insertdrop($index);"></select>
</div>
<div ng-if="typeselect($index)=='tablet'" style="font-size:0.7em;" >
<b>সকাল</b><select  ng-options="n for n in numbers" ng-model="tsokal[$index]" ng-change="inserttab($index);"></select> 
<b>দুপুর</b><select  ng-options="n for n in numbers" ng-model="tdupur[$index]" ng-change="inserttab($index);"></select> 
<b>রাত</b><select  ng-options="n for n in numbers" ng-model="trat[$index]" ng-change="inserttab($index);"></select>
</div>
<div ng-if="typeselect($index)=='syrup'" style="font-size:0.7em;" >
<b>সকাল</b><select  ng-options="n for n in numbers" ng-model="tsokal[$index]" ng-change="inserttab($index);"></select> 
<b>দুপুর</b><select  ng-options="n for n in numbers" ng-model="tdupur[$index]" ng-change="inserttab($index);"></select> 
<b>রাত</b><select  ng-options="n for n in numbers" ng-model="trat[$index]" ng-change="inserttab($index);"></select>
</div>

<div ng-if="typeselect($index)=='dose'" style="font-size:0.7em;">

<div ng-if="typeselect($index)=='dose'">
<b>অংশ</b><input  ng-model="dongso[$index]"/>
<b>বেলা</b><input ng-model="dbela[$index]" ng-change="insertdose($index);"/>
</div>
</div> 

<div ng-if="typeselect($index)=='vaccine'" style="font-size:0.7em;">
<input type="text" placeholder="amount" ng-model="injnumber[$index]"/> 
<select  ng-options="a for a in  injamount" ng-model="injunit[$index]" ng-change="insertinj($index);">
</select>
</div>
<div ng-if="typeselect($index)=='cream'" style="font-size:0.7em;"><select  ng-model="p.rules">
 <option value="---">---</option>
<option value="১বার ">১বার দিনে</option>
<option value="২বার ">২বার</ দিনে </option> 
<option value="৩বার ">৩বার</ দিন  </option>
<option value="৪বার ">৪বার</ দিনে  </option> 
</select>
</div>
<div ng-if="typeselect($index)=='seline'" style="font-size:0.7em;">
<input type="text"  ng-model="p.rules"/>

</div>

 </td>
<td>

<div ng-if="typeselect($index)=='tablet" style="font-size:0.7em;">
<select ng-model="p.consult">
<option value="---">---</option> 
<option value="খাওয়ার পরে">জেকুন সময় </option> 
<option value="খাওয়ার পরে ">খাওয়ার পরে</option> 
<option value="খাওয়ার  ১ ঘণ্টা পরে">খাওয়ার  ১ ঘণ্টা পরে</option>
<option value="খাওয়ার  ২ ঘণ্টা পরে">খাওয়ার  ২ ঘণ্টা পরে</option>
<option value="খাওয়ার  আগে">খাওয়ার  আগে</option>  
<option value="খাওয়ার  ১ ঘণ্টা  আগে">খাওয়ার  ১ ঘণ্টা  আগে</option>
</select></div>
<div ng-if="typeselect($index)=='seline'" style="font-size:0.7em;">
<input type="text"  ng-model="p.consult"/>

</div>
<div ng-if="typeselect($index)=='syrup" style="font-size:0.7em;">
<select ng-model="p.consult">
<option value="---">---</option> 
<option value="খাওয়ার পরে">জেকুন সময় </option> 
<option value="খাওয়ার পরে ">খাওয়ার পরে</option> 
<option value="খাওয়ার  ১ ঘণ্টা পরে">খাওয়ার  ১ ঘণ্টা পরে</option>
<option value="খাওয়ার  ২ ঘণ্টা পরে">খাওয়ার  ২ ঘণ্টা পরে</option>
<option value="খাওয়ার  আগে">খাওয়ার  আগে</option>  
<option value="খাওয়ার  ১ ঘণ্টা  আগে">খাওয়ার  ১ ঘণ্টা  আগে</option>
</select></div>

<div ng-if="typeselect($index)=='dose'" style="font-size:0.7em;">
<input type="text" ng-model="p.consult" />

</div>

</td>
<td ><textarea style="font-size:0.75em;" columns="20" rows="3" ng-model="p.instruction"></textarea></td>

</tr>
</table>

</div>

<div>
 <img  style="height:150px;width:150px;" src="<c:url value="/static/images/${animal.filename}" />"/> <br/>

<b>animal details</b>
<table >
<tr>
<th>animal id</th>
<th>gender</th>
<th>age</th>
<th>type</th>
<th>color</th>
<th>date</th>
</tr>

<tr style="background-color:ghodtwhite;color:black;">
<td>${animalpres.anid}</td>
<td>${animal.gender}</td>
<td>${animalpres.age}</td>
<td>${animalpres.type} </td>
<td>${animalpres.color}</td>
<td>${animalpres.presdate}</td>
</tr>
</table>
</div>

</div>

<div class="row" style="padding:2%;margin:auto;">
<button class="btn btn-success btn-md" ng-click="postpress()" style="text-align:center;" >post</button>
</div>

</body>
</html>