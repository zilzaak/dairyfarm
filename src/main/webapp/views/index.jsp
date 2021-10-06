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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>




<script>
var alst=<%= session.getAttribute("listanimal")%>
var i=1900; 

var mod = angular.module("myapp",[]);

mod.controller("mycon",function($scope,$http){

	
$scope.animalform=alst;
	$scope.years=[];
	$scope.ds=[];
	$scope.ms=[];
	$scope.ys=[];
	$scope.days=['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26',
		'27','28','29','30','31'];
	
	$scope.mfi=['01','02','03','04','05','06','07','08','09','10','11','12'];
	$scope.brown=[]; 
	$scope.black=[]; 
	$scope.gray=[];
	$scope.white=[];
	
$scope.animalprice=null; $scope.numberofanimal=null;
$scope.brown1="";    $scope.black1="";     $scope.gray1="";     $scope.white1="";
	
	$scope.inityear=function(){
		
		for(var k=i;k<=3000;k++){
			
			$scope.years.push(k);
	
			
		}
		

		for(var k=0;k<=200;k++){
	
			$scope.brown[k]="";
			$scope.black[k]=""; 
			$scope.gray[k]="";
			$scope.white[k]="";
			
				}		
		
		
		
	}
	
	

	
	
	$scope.sdate=function(i){
		
		
	$scope.animalform[i].stringbdate=$scope.ds[i]+"/"+$scope.ms[i]+"/"+$scope.ys[i];

		
	}
	
	
$scope.addrowani=function(){
	
	var x={
			"gender":"", "type":"","color":"","chest":null,"height":"","hu":"","weight":"","wu":"","source":"",
			"stringbdate":"","extra":""		
					
		  }
	
	$scope.animalform.push(x);
	
}



$scope.removerowani=function(){
	var length=$scope.animalform.length;
	$scope.animalform.splice(length-1, 1); 
	
}






$scope.chooseanicolor=function(i,v){
	
if(v=='brown'){
if($scope.brown[i]==""){
	
	$scope.brown[i]='brown';
}	

else{
	$scope.brown[i]="";
}
	

}



if(v=='black'){
	if($scope.black[i]==""){
		
		$scope.black[i]='black';
		
		      }	

	else{
		$scope.black[i]="";
	}
	
}




if(v=='gray'){
	if($scope.gray[i]==""){
		
		$scope.gray[i]='gray';
	}	

	else{
		$scope.gray[i]="";
	}	
	
}

if(v=='white'){
	if($scope.white[i]==""){
		
		$scope.white[i]='white';
	}	

	else{
		$scope.white[i]="";
	}	
	
}

	
	
}



$scope.manage=function(){
	
angular.forEach($scope.animalform,function(v,i){
	
	v.color=$scope.black[i]+$scope.white[i]+$scope.brown[i]+$scope.gray[i];

})	
	
}


$scope.photoupload=function(){

	$http({
		method:"GET",
		url:"${pageContext.request.contextPath}/animal/unphoto",
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;
		
	$scope.calculateprice();
	$('#dis').append($('#allanimal'));	
	document.getElementById("allanimal").style.display="inline";
	document.getElementById("addiv").style.display="none";
	document.getElementById("collectmilk").style.display="none";
	document.getElementById("sellmilk").style.display="none";
		
		        })
	
                    }


$scope.calculateprice=function(){
	$scope.animalprice=null;
	$scope.numberofanimal=$scope.unphoto.length;
	angular.forEach($scope.unphoto,function(v,i){
	$scope.animalprice=	$scope.animalprice+v.chest;
		
	})
}


$scope.s={
	 "type":"","color":"","agey":"","weight":"","wu":"","height":""	,"anid":null
				
	  }




$scope.choosecolor=function(i){
	
if(i=="black"){
	if($scope.black1=="black"){
		$scope.black1="";
	}
	else{
		$scope.black1="black";
	}
	
	
}	
if(i=="brown"){
	
	if($scope.brown1=="brown"){
		$scope.brown1="";
	}
else{
	$scope.brown1="brown";	
}	

	
}

if(i=="white"){
if($scope.white1=="white"){
	
$scope.white1="";	
}	
else{
	$scope.white1="white";	
}

	
	
}

if(i=="gray"){
	
	if($scope.gray1=="gray"){
		$scope.gray1="";
	}
	
else {
	$scope.gray1="gray";
	}
}
	
}

$scope.sbytype=function(){
	
	if($scope.s.type=="all"){
		
		$scope.photoupload();
	}
	
	else{
		
		$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/search/bytype",
			data: angular.toJson($scope.s),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
		$scope.unphoto=response.data;
		$scope.calculateprice();
			$scope.pre=response.data;

			
			        })
		
	}
	
	
	
	
}


$scope.sbid;

$scope.sbyid=function(){

	$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/search/byid",
			data: angular.toJson($scope.s),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
		$scope.sbid=response.data;
		
			        })
		
	
}







$scope.filterg=function(i){
	alert(i);
	$scope.up=[];
	
	if(i=="all"){
		$scope.up=$scope.pre;	
		
	}
	
	else if(i=="---"){
		
		$scope.up=$scope.pre;	
	}
	
	else{
		angular.forEach($scope.pre,function(v,k){
			
			if(v.gender==i){
				$scope.up.push(v);
				  }
			
		})	
		
	}


$scope.unphoto=$scope.up;
$scope.calculateprice();
}

$scope.bytypeageupper=function(){
	$scope.s.color=$scope.black1+$scope.white1+$scope.brown1+$scope.gray1;
	
	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/search/bytypeageupper",
		data: angular.toJson($scope.s),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;
	$scope.calculateprice();
	$scope.pre=response.data;	

		
		        })
	
	
                   }





$scope.bytypeagelower=function(){
	$scope.s.color=$scope.black1+$scope.white1+$scope.brown1+$scope.gray1;

	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/search/bytypeagelower",
		data: angular.toJson($scope.s),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;
	$scope.calculateprice();
	$scope.pre=response.data;	
		        })
	
	          
	             }





$scope.bytypecolorweightupper=function(){
	$scope.s.color=$scope.black1+$scope.white1+$scope.brown1+$scope.gray1;
	
	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/search/bytypecolorweightupper",
		data: angular.toJson($scope.s),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;
	$scope.calculateprice();
	$scope.pre=response.data;
		
		        })

	
}

$scope.bytypecolorweightlower=function(){
	$scope.s.color=$scope.black1+$scope.white1+$scope.brown1+$scope.gray1;
	
	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/search/bytypecolorweightlower",
		data: angular.toJson($scope.s),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;	$scope.calculateprice();
	$scope.pre=response.data;
		        })
		
	
}


$scope.bytypecolor=function(){
	$scope.s.color=$scope.black1+$scope.white1+$scope.brown1+$scope.gray1;

	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/search/bytypecolor",
		data: angular.toJson($scope.s),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
	$scope.unphoto=response.data;	$scope.calculateprice();
	$scope.pre=response.data;
		        })
		
	
}





$scope.addanimal=function(){
$scope.manage();
var err="no";

angular.forEach($scope.animalform,function(v,i){
	if(v.stringbdate.length!=10 || v.type=="" || v.chest==null || v.chest==0 || v.gender=="" || v.source=="" || v.color==""){
		err="ye";
	}
})

if(err=="ye"){
	
	alert("error form ");
}
if(err=="no"){
	$http({
		method:"POST",
		url:"${pageContext.request.contextPath}/animal/add",
		data: angular.toJson($scope.animalform),
		headers: {"Content-Type":"application/json"}}).
		then(function(response){
		alert('suuccessful');
		location.reload();
		})	
}
		

	
	
}	



	$scope.presrecord=function(v){
		
		$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/prescribe/presrecord",
			data: angular.toJson(v),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
		
				$scope.presrecords=response.data;
				if($scope.presrecords[0].itemid==""){
					alert("ohhh, sorry ,no record created");
				}
				else{
					document.getElementById("presrecordbtn").click();
				}
				
			
			        })	

		
		
	}
$scope.setr=[];
	
	$scope.updateanimal=function(j){
		
		$http({
			method:"PUT",
			url:"${pageContext.request.contextPath}/prescribe/updateanimal",
			data: angular.toJson(j),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
               alert("successfully updated");

           
			             })	
	
	}
	
	$scope.setstyle=function(i){
	 
		$scope.setr[i]='t';
	    $scope.photoupload();
		
	}
	
	$scope.checkstyle=function(i){
var z='t';
		if($scope.setr[i]=='t'){

			z='t';
		}
		if($scope.setr[i]==null){

			z='f';
		}
		
		return z;
		
	}
	
	
	$scope.presupdate=function(j){
		var d="rt";
	     alert(j.prestypenumber);
		$http({
				method:"POST",
				url:"${pageContext.request.contextPath}/prescribe/updatepres",
				data: angular.toJson(j),
				headers: {"Content-Type":"application/json"}}).
				then(function(response){
                   alert(response.data.consult);
   
               
				             })	
			
	         			
	               }
	
	
	
	$scope.hukk=function(x){
		$scope.gray1=""; $scope.brown1=""; $scope.black1=""; $scope.white1="";
	

		if(x=='one'){
			document.getElementById("one").style.display="block";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="none";
			document.getElementById("six").style.display="none";document.getElementById("seven").style.display="none";	
		}	

		if(x=='two'){
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="block";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="none";
			document.getElementById("six").style.display="none";document.getElementById("seven").style.display="none";	
		}


		if(x=='three'){
			document.getElementById("six").style.display="none";
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="block";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="none";document.getElementById("seven").style.display="none";	
		}

		if(x=='four'){
			document.getElementById("six").style.display="none";
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="block";
			document.getElementById("five").style.display="none";	
			document.getElementById("seven").style.display="none";	
		}


		if(x=='five'){
			document.getElementById("six").style.display="none";
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="block";	
			document.getElementById("seven").style.display="none";	
		}
		

		if(x=='six'){
			document.getElementById("six").style.display="block";
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="none";	
			document.getElementById("seven").style.display="none";	
		}
		
		if(x=='seven'){
			document.getElementById("six").style.display="none";
			document.getElementById("one").style.display="none";
			document.getElementById("two").style.display="none";
			document.getElementById("three").style.display="none";
			document.getElementById("four").style.display="none";
			document.getElementById("five").style.display="none";	
			document.getElementById("seven").style.display="block";	
		}
		
	}
	
	
	
	$scope.dc="";
	$scope.mc="";
	$scope.yc="";	  
	$scope.mrate=null; 
$scope.tamount=0;$scope.tprice=0;
	
$scope.dupidexist=['n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',
	               'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',
		           'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n']

	$scope.milklist=[];
	
var ml1={"rate":null,"totalprice":null,"amount":null,"animaltype":"","stringcollectdate":"","anid":null}; 
var ml2={"rate":null,"totalprice":null,"amount":null,"animaltype":"","stringcollectdate":"","anid":null}; 
var ml3={"rate":null,"totalprice":null,"amount":null,"animaltype":"","stringcollectdate":"","anid":null};
$scope.milklist.push(ml1);$scope.milklist.push(ml2);$scope.milklist.push(ml3);
	
	$scope.addrowm=function(){
		
		var x={"rate":null,"totalprice":null,"amount":null,"animaltype":"","stringcollectdate":"","anid":null};
		
		if($scope.milklist.length>29){
		alert("can not add 30+ record at a time,save first")	
			
		}
		else{
			$scope.milklist.push(x);	
		}
		
		
		
	                        }
	
	$scope.removerowm=function(){
		var length= $scope.milklist.length;
		if(length>1){
			$scope.milklist.splice(length-1,1);
		}
		
      	}
	

	
	$scope.setprice=function(x,i){
		
		$scope.milklist[i].totalprice=($scope.mrate)*(x.amount);

		
	                               }
	
	$scope.pricerate=function(r){
		angular.forEach($scope.milklist,function(v,i){
			v.totalprice=r*v.amount;
		})
		
       }
	
	
	$scope.checkduplicate=function(j,x){
		var milkerr='n';
	angular.forEach($scope.milklist,function(v,i){
		if(i!=j){
			if(x.anid==v.anid){
			milkerr='y';

			}	
				
		}
  	})
	
	if(milkerr=='y'){
		$scope.dupidexist[j]='y';
                   	}
	if(milkerr=='n'){
	$scope.dupidexist[j]='n';

                   	}
	
	}
	
	
	
	$scope.duplicateid=function(i){
		
	if($scope.dupidexist[i]=='y'){

		return 'ok';
	}
	if($scope.dupidexist[i]=='n'){
		
		return 'no';
	}
		
              }
	
$scope.addmilk=function(){
	
angular.forEach($scope.milklist,function(v,i){
	v.stringcollectdate=$scope.dc+"/"+$scope.mc+"/"+$scope.yc;	
	v.rate=$scope.mrate;	

		})
	
	var errd='n';
	var errf='n';
	angular.forEach($scope.milklist,function(v,i){
		alert(v.stringcollectdate);
		
	if(v.anid==null || v.animaltype==null || v.amount==null || $scope.mrate==null || v.stringcollectdate=="//" || v.stringcollectdate.length!=10){
		errf="blank filed not allowed";
	}	
		
	})
	
		angular.forEach($scope.dupidexist,function(v,i){
		
	if(v=='y'){
		errd="duplicate id invalid";
	}	
		
	})
	

	if(errf=='n' && errd=='n'){
		$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/addmilk",
			data:angular.toJson($scope.milklist),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
	        
	         alert(response.data[0].stringcollectdate);      
			             })	
	}
	
	if(errf!='n' || errd!='n'){
		alert("ohhh sorry,"+errd+","+errf);
	}
	

			             
	    
}



	$scope.totalmilk=function(){
		$scope.tamount=0; $scope.tprice=0;
		  angular.forEach($scope.milklist,function(v,i){
		$scope.tamount=v.amount+$scope.tamount;
		$scope.tprice=v.totalprice+$scope.tprice;
		
			  })
		
               	}                     
	                     
	                     
	                     
	  $scope.clearmilk=function(){
		  
		  angular.forEach($scope.milklist,function(v,i){
			v.anid=null; v.animaltype=""; v.rate=null; v.amount=null;v.totalprice=null;v.stringcollectdate="";
		  })
		  
		  	angular.forEach($scope.dupidexist,function(v,i){

		     v='n';
                	})
	  }   
	  
	  
	  $scope.tamountc=0;$scope.tpricec=0;
	$scope.searchcollectdate=function(){
		
		$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/collectbydate",
			data:$scope.collectdate,
			headers: {"Content-Type":"text/plain","Response-Type":"application/json"}}).
			then(function(response){
	        $scope.recsbydate=response.data;
			  angular.forEach($scope.recsbydate,function(v,i){
					$scope.tamountc=v.amount+$scope.tamountc;
					$scope.tpricec=v.totalprice+$scope.tpricec;
						  })
	        
			             })	
		           
	}  
	  
	$scope.updatecollect=function(i){
		
		$http({
			method:"PUT",
			url:"${pageContext.request.contextPath}/milk/updatecollect",
			data:angular.toJson($scope.recsbydate[i]),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
	        alert("updated successfully");
	        
			             })	
		           
	}  
	  	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
$scope.selld="";$scope.sellm="";$scope.selly="";	  
$scope.sellrate=null;	  
	$scope.tsellprice; $scope.tsellamount;  
$scope.sellmilk=[];	  
 var x1={"buyername":"", "amount":null, "rate":null, "totalprice":null, "due":"", "stringselldate":null,"contact":""};
var y1={"buyername":"", "amount":null, "rate":null, "totalprice":null, "due":"", "stringselldate":null,"contact":""};
var z1={"buyername":"", "amount":null, "rate":null, "totalprice":null, "due":"", "stringselldate":null,"contact":""};
	 $scope.sellmilk.push(x1);  $scope.sellmilk.push(y1);  $scope.sellmilk.push(z1); 
	  

	 
	 $scope.totalsell=function(){
	$scope.tsellprice=0; $scope.tsellamount=0; 

	  angular.forEach($scope.sellmilk,function(v,i){
		  
		  $scope.tsellprice=$scope.tsellprice+v.totalprice-v.due;
		  
		  $scope.tsellamount=$scope.tsellamount+v.amount;
		  
		  })	
	
}	    	
	 
	 	 
$scope.addsellrow=function(){
	
	  var x={"buyername":"", "amount":null, "rate":null, "totalprice":null, "due":"", "stringselldate":null,"contact":""};
	  if($scope.sellmilk.length>29){
		  alert("can not add 30+ record at a time");
	  }
	  else{
		  $scope.sellmilk.push(x);  
	  }
	        
}	  
	  
$scope.removesellrow=function(){
	var length= $scope.sellmilk.length;
	if(length>1){
		 $scope.sellmilk.splice(length-1,1);	
	}
		
}  
	  


$scope.setsellprice=function(){

	angular.forEach($scope.sellmilk,function(v,i){
		v.rate=$scope.sellrate;
		v.totalprice=$scope.sellrate*v.amount;	
	  
	})
	}
	

$scope.setsellprice2=function(i){
	$scope.sellmilk[i].rate=$scope.sellrate;
	$scope.sellmilk[i].totalprice=$scope.sellrate*$scope.sellmilk[i].amount;
               }

$scope.clearsel=function(){
	angular.forEach($scope.sellmilk,function(v,i){
  v.buyername=""; 
  v.amount=null; 
  v.rate=null;
  v.totalprice=null;
  v.due=""; 
  v.stringselldate=""; 
  v.contact="";
	  
	})	
	
}

  $scope.sellmilksave=function(){
	
       var err='n';
       var err2='n';
       if($scope.selld=="" || $scope.sellm=="" || $scope.selly=="" || $scope.sellrate==null){
    	   err='y';
    	 
       }
       
       
   	angular.forEach($scope.sellmilk,function(v,i){
     if(v.amount==null || v.buyername=="" || v.contact==""){
    	 err2='y'; 
    	 
    	     }

	})   
     
	if(err=='y' || err2=='y'){
		alert("sorry,blank field not allowed");
	}
	  
   	if(err=='n' && err2=='n'){
   angular.forEach($scope.sellmilk,function(v,i){
   	   
     	v.stringselldate=$scope.selld+"/"+$scope.sellm+"/"+$scope.selly;
     	
   		}) 
   		
  	  $http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/sellmilk",
			data: angular.toJson($scope.sellmilk),
			headers: {"Content-Type":"application/json"}}).
			
			then(function(response){
	           $scope.lko=response.data;
	           
	       alert("successfully saved");
			             })	 
   		
     	}
   	
         }



  
 $scope.pregnant=[]; $scope.pregd=[]; $scope.pregm=[];$scope.pregy=[];
 var p1={"anid":null,"type":"", "stringconcivedate":"", 
		 "stringpossibledate":"","sms":"","pregnantno":null,"stringnextconcive":"","dateerr":""} ;
 
 var p2={"anid":null,"type":"", "stringconcivedate":"", 
		 "stringpossibledate":"","sms":"","pregnantno":null,"stringnextconcive":"","dateerr":""} ;
 
 var p3={"anid":null,"type":"", "stringconcivedate":"", 
		 "stringpossibledate":"","sms":"","pregnantno":null,"stringnextconcive":"","dateerr":""} ;
 
 $scope.pregnant.push(p1); $scope.pregnant.push(p2); $scope.pregnant.push(p3);
  
 
 $scope.addpreg=function(){
	  var ps={"anid":null,"type":"", "stringconcivedate":"", 
		"stringpossibledate":"","sms":"","pregnantno":null,"stringnextconcive":"","dateerr":""} ;
	  $scope.pregnant.push(ps);  
	  
                         }
  
  $scope.removepreg=function(){
	  var length=$scope.pregnant.length;
	  $scope.pregnant.splice(length-1,1);
                    }
  
  $scope.delform=function(i){
	 
	  $scope.pregnant.splice(i,1);
                    }
  
 $scope.setconcivedate=function(i){
  	 
	$scope.pregnant[i].stringconcivedate=$scope.pregd[i]+"/"+$scope.pregm[i]+"/"+$scope.pregy[i]; 
	
	if($scope.pregnant[i].stringconcivedate.length==10 && $scope.pregnant[i].anid!=null){
		$http({
			method:"POST",
			url:"${pageContext.request.contextPath}/pregnant/pregdate",
			data: angular.toJson($scope.pregnant[i]),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
	 $scope.pregnant[i]=response.data;

			})	  
               }
	
                   
               } 
  
 
 $scope.checkpreganimalid=function(j){
	 $scope.pregnant[j].sms="";
	 var x=$scope.pregnant[j].anid;
	
	 angular.forEach($scope.pregnant,function(v,i){
								
        if(i!=j){
        	if(x==v.anid){
        	$scope.pregnant[j].sms="id:-"+x+",already added";	
        	}
  
        	
        }
		
	           	})	
	 
	 
	 $http({
			method:"POST",
			url:"${pageContext.request.contextPath}/pregnant/preganimalid",
			data: angular.toJson($scope.pregnant[j]),
			headers: {"Content-Type":"application/json"}}).
			then(function(response){
$scope.pregnant[j].sms=$scope.pregnant[j].sms+response.data.sms;

			             })	   
		if($scope.pregnant[j].stringconcivedate.length==10){
			$scope.setconcivedate(j);
		}	             
		             
         }
 
 
  
 $scope.postpregnant=function(){
	  var err="no";
	  angular.forEach($scope.pregnant,function(v,i){
		  if(v.anid==null || v.stringconcivedate=="" || v.type=="" || v.stringnextconcive=="" || v.pregnantno==null || v.dateerr!="" || v.sms!=""){
			  err="ye";  
		  }
		 
		    }) 
		    
	  if(err=="no"){
		  $http({
				method:"POST",
				url:"${pageContext.request.contextPath}/pregnant/postpreg",
				data: angular.toJson($scope.pregnant),
				headers: {"Content-Type":"application/json"}
				
		  }).
				then(function(response){
		       if(response.data[0].sms!=""){
		    	   alert("sorry something wrong");
		       }else{
		    	   alert("successfully saved pregnant report"); 
		       }
		        
				             })	   	  
		  
	       }
	  
	  else{
		  alert("sorry!!,error input or exist blank field")
	  }    
 }
  
  
 
 $scope.msells=[]; $scope.tm=0;$scope.tt=0;$scope.tdue=0;
 
 $scope.caltta=function(){

	 $scope.tm=0;$scope.tt=0;
	angular.forEach($scope.msells,function(v,i){
		$scope.tm=$scope.tm+v.amount;
		$scope.tt=$scope.tt+v.totalprice-v.due;
		$scope.tdue=$scope.tdue+v.due;
	}) 
	 
 }
 
 
 $scope.inadate=function(){
	
	 $http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/inadate",
			data:$scope.ad,
			headers: {"Content-Type":"text/plain", "Response-Type":"application/json"}
			
	  }).then(function(response){
	   if(response.data.length<1){
		   alert("no record fouynd");
	   }
	   else{
		   $scope.msells=response.data;   
		  $scope.caltta(); 
		   		   
	       }
		    })	 
	 
 }
 
 
 $scope.buyername=function(){
	 
	 $http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/buyername",
			data:$scope.bn,
			headers: {"Content-Type":"text/plain","Response-Type":"application/json"}
			
	  }).then(function(response){
		   if(response.data.length<1){
			   alert("no record fouynd");
		   }
		   else{
			   $scope.msells=response.data;   
			   $scope.caltta(); 
		       }
			    })	 
	 
                    }
 
 
 $scope.inamonth=function(){
	 var s=[];
	 s[0]=$scope.am; 
	 s[1]=$scope.ay;
	 $http({
			method:"POST",
			url:"${pageContext.request.contextPath}/milk/inamonth",
			data: angular.toJson(s),
			headers: {"Content-Type":"application/json"}
			
	  }).then(function(response){
		   if(response.data.length<1){
			   alert("no record fouynd");
		   }
		   else{
			   $scope.msells=response.data;   
			   $scope.caltta(); 
		       }
			    })	 
	 
           }
 
 
 $scope.tmsell=function(){
		 $http({
			method:"GET",
			url:"${pageContext.request.contextPath}/milk/tmsell",
			headers:{"Content-Type":"application/json"}}
		 ).then(function(response){
		  
			   if(response.data.length<1){
				   alert("no record fouynd");
			   }
			   else{
				   $scope.msells=response.data;   
				   $scope.caltta(); 
			       }
				    })	
		  	 
           }
 
 $scope.clearbn=function(){
	 
	 $scope.bns.buyername="";$scope.bns.contact="";$scope.bns.stringselldate="";
 }
 
 
 
 
 
 
  
	
})



document.addEventListener("DOMContentLoaded", function(){
  document.querySelectorAll('.sidebar .nav-link').forEach(function(element){
    
    element.addEventListener('click', function (e) {

      let nextEl = element.nextElementSibling;
      let parentEl  = element.parentElement;	

        if(nextEl) {
            e.preventDefault();	
            let mycollapse = new bootstrap.Collapse(nextEl);
            
            if(nextEl.classList.contains('show')){
              mycollapse.hide();
            } else {
                mycollapse.show();
                // find other submenus with class=show
                var opened_submenu = parentEl.parentElement.querySelector('.submenu.show');
                // if it exists, then close all of them
                if(opened_submenu){
                  new bootstrap.Collapse(opened_submenu);
                }
            }
        }
    }); // addEventListener
  }) // forEach
});



function addit(){

	$('#dis').append($('#addiv'));	

	document.getElementById("addiv").style.display="inline";
	document.getElementById("allanimal").style.display="none";
	document.getElementById("collectmilk").style.display="none";	
	document.getElementById("sellmilk").style.display="none";
	           }
	                  
	   
function milkdisplay(){
	$('#dis').append($('#collectmilk'));	
	document.getElementById("addiv").style.display="none";
	document.getElementById("allanimal").style.display="none";
	document.getElementById("sellmilk").style.display="none";
	document.getElementById("collectmilk").style.display="inline";
	
}

function selldisplay(){
	$('#dis').append($('#sellmilk'));	
	document.getElementById("addiv").style.display="none";
	document.getElementById("allanimal").style.display="none";
	document.getElementById("sellmilk").style.display="inline";
	document.getElementById("collectmilk").style.display="none";
}	



	function callpregnantbtn(){
		
		document.getElementById("pregnantmodalbtn").click();
	              }
	                 
	
	</script>

<style>

#ar:hover{

background-color:darkslategrey;

}

.sidebar li .submenu{ 
	list-style: none; 
	margin: 0; 
	padding: 0; 
	padding-left: 0%;
	padding-right: 0%;

}


.sidebar li .submenu a{ 
color:green;
paddinh:0%;
margin:0%;
}

.sidebar li .nav-link{ 
padding:2px;
color:white;

margin:0%;

}


.sidebar li .nav-link:hover{ 
background-color:skyblue;
color:black;

}



.nav-item .submenu li a:hover{
background-color:black;
color:white;
}

.nav-item{
background-color:steelblue;
paddinh:0%;
margin:0%;
}

.container{
margin:2%;
background-color:skyblue;
border:1px solid black;
padding:1% 0%;
padding-top:0%;
display:inline;
}






.alt{
  background-color:black;
}



.grid-contain{
display:grid;
grid-template-columns: 80% 20%;
background-color:green;
}


.grid-contain:hover{
 filter: blur(0.5px);

}

.grid-contain div{
background-color:darkslategrey;
padding:10px;
color:white;
word-wrap: break-word;
display:inline;
}


.grid-contain2{
display:grid;
grid-template-columns: 20% 80%;

}



#arf{
display:grid;
width:25%;
color:white;
background-color:lightgray;
grid-template-columns: 50% 50%;
margin-left:3%;
}

#arf div{
word-wrap: break-word;
margin:0;
background-color:white;
}


#arf div button:hover{
color:white;
background-color:lightseagreen;
}


.grid-contain2 .dv1{
margin:0%;
margin-top:0%;
padding:0%;
}

.grid-contain2 div{
background-color:skyblue;
padding:10px;
color:white;
word-wrap: break-word;
display:inline
}

table{
margin:2%;
overflow-x:scroll;
}

table th{
background-color:black;
color:white;
word-break:break-all;
}

table td{
padding:7px;
word-break:break-all;
}


input:hover{
background-color:maroon;
color:white;
}


h:hover {
  color:red;
  text-shadow:1px 1px;
}


#im{
height:50px;;
width:150px;
}

#sop:hover{

background-color:mediumseagreen;

}

#allanimal #tb td{

word-wrap: break-word;

}

#allanimal #tb td:hover{
background-color:silver; color:green;

}

#allanimal #sp p:hover{

color:gold;
display:inline;
}

</style>

</head>

<body ng-app="myapp" ng-controller="mycon"  style="background-color:gray;">

<%
if(session.getAttribute("adminuser")==null && session.getAttribute("adminpass")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}

	  %>

 <div class="container" ng-init="inityear();">

<div class="grid-contain">
<div>
<span><img id="im"  src="<c:url value="/static/theme/cow2.jpg" />"/>
<h>your dairy firm , dream is here...</h></span>
</div>
<div style="text-align:right;">

<form action="/logout" method="post">
 <button class="btn btn-sm btn-success" type="submit">logout</button>
</form>
</div>

</div>
<div class="grid-contain2">


<div class="dv1">
<nav class="sidebar card py-2 mb-4" style="display:inline;float:left;background-color:steelblue;">
<ul class="nav flex-column" id="nav_accordion">

	<li class="nav-item has-submenu">
		<a class="nav-link" href="#">animal & prescription</a>
		<ul class="submenu collapse" style="background-color:white;">
			<li><a class="nav-link" href="#" onclick="addit()">add animal</a></li>
			<li><a class="nav-link" href="#" ng-click="photoupload()">all animals</a></li>
			<li><a class="nav-link" href="#">search prescription</a> </li>
		</ul>
	</li>
	
	<li class="nav-item has-submenu">
		<a class="nav-link" href="#">pregnency report</a>
		<ul class="submenu collapse" style="background-color:white;">
			<li><a class="nav-link" href="#" onclick="callpregnantbtn();">make report</a></li>
			<li><a class="nav-link" href="#">upcoming child</a></li>
			<li><a class="nav-link" href="#">search record</a></li>
		</ul>
	</li>
	
	<li class="nav-item">
		<a class="nav-link" href="#">milk portal</a>
	 <ul class="submenu collapse" style="background-color:white;">
		<li><a class="nav-link" href="#" onclick="milkdisplay()">collect milk</a></li>
		<li><a class="nav-link" href="#" >total collected milk</a></li>
			<li><a class="nav-link" href="#"  onclick="selldisplay()">sell milk</a></li>
			<li><a class="nav-link" href="#" data-toggle="modal" data-target="#tsm" ng-click="tmsell();">total sold milk (tk)</a></li>
			<li><a class="nav-link" href="#" data-target="#msell" data-toggle="modal">search</a></li>
		</ul>
	</li>
	      <li class="nav-item">		
  <a class="nav-link" href="#" onclick="window.open('${pageContext.request.contextPath}/costprofit')" >cost & profit</a>
		  
	      </li>
	      
	      	      <li class="nav-item">		
  <a class="nav-link" href="#" onclick="window.open('${pageContext.request.contextPath}/sellcow')" >sell animal</a>
		  
	      </li>
	      	      	      <li class="nav-item">		
  <a class="nav-link" href="#" onclick="window.open('${pageContext.request.contextPath}/newborn')" >new born animal</a>
		  
	      </li>
</ul>

</nav>

</div>

<div class="row" id="dis" style="margin-right:2px;overflow-x:auto;">





</div>
</div>

<!--  collect milk div  -->


<div id="collectmilk" style="font-size:0.80em;margin-right:7%;display:none;" >


<div style="display:inline;margin-left:10%;">
<div>
<button id="ar" ng-click="removerowm()"><i class="fa fa-trash fa-fas" ></i></button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button ng-click="addrowm()" id="ar"><i class="fa fa-plus fa-fas" aria-hidden="true"></i></button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button ng-click="clearmilk()" id="ar">clear all</button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button id="ar" ng-click="totalmilk();" >total</button>
</div>
</div>

<table border="1">
<tr>
<th>day</th>
<th>month</th>
<th>year</th>
<th  style="text-align:center;">milk rate</th>
<th  style="text-align:center;">total milk(kg)</th>
<th  style="text-align:center;">total price(tk)</th>
</tr>
<tr>
<td><select  ng-model="dc"  ng-options="c for c in days"  ></select></td>
<td><select  ng-model="mc"  ng-options="c for c in mfi"    ></select></td>
<td><select  ng-model="yc"  ng-options="c for c in years"   ></select></td>
<td>
<input type="number" ng-model="mrate" ng-keyup="pricerate(mrate)" ng-click="pricerate(mrate)" />
</td>
<td style="color:black;background-color:white;">{{tamount}}</td>  
<td style="color:black;background-color:white;">{{tprice}}</td>
</tr>
</table>


<table id="aslam">
<tr>
<th style="text-align:center;">animal id</th>
<th style="text-align:center;">animal type</th>
<th style="text-align:center;">amount(kg)</th>
<th style="text-align:center;">price</th>
</tr>
<tr ng-repeat="x in milklist">

<td ng-if="duplicateid($index)=='ok'"   style="background-color:red;color:white;">
<input type="number" ng-model="x.anid" ng-keyup="checkduplicate($index,x)" ng-click="checkduplicate($index,x)" />

</td>
<td ng-if="duplicateid($index)=='no'">
<input type="number" ng-model="x.anid" ng-keyup="checkduplicate($index,x)"  ng-click="checkduplicate($index,x)" />
</td>

<td ng-if="duplicateid($index)=='ok';"  style="background-color:red;color:white;">
<select ng-model="x.animaltype" ng-change="checkduplicate($index,x)">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option>
</select>
</td>
<td ng-if="duplicateid($index)=='no';">
<select ng-model="x.animaltype" ng-change="checkduplicate($index,x)">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option>
</select>
</td>

<td  ng-if="duplicateid($index)=='ok';" style="background-color:red;color:white;">
<input type="number" ng-model="x.amount"    ng-keyup="setprice(x,$index);"  ng-click="setprice(x,$index);" />
</td>

<td  ng-if="duplicateid($index)=='no';">
<input type="number" ng-model="x.amount"    ng-keyup="setprice(x,$index);"  ng-click="setprice(x,$index);" />
</td>

<td ng-if="duplicateid($index)=='ok';"   style="background-color:red;color:white;">
<input type="number" ng-model="x.totalprice"   disabled />
</td>
<td ng-if="duplicateid($index)=='no';">
<input type="number" ng-model="x.totalprice"   disabled />
</td>
</tr>
</table>
<br/>
<button class="btn btn-success btn-sm" ng-click="addmilk();">save</button>


<span><h4 style="color:maroon;">search milk collection records by date</h4>
<input type="text" ng-model="collectdate" placeholder="day/month/year" />
<button ng-click="searchcollectdate();"  data-toggle="modal" data-target="#tcpmodal" >search</button></span>


</div>
 


<!-- - sell milk div -->


<div id="sellmilk" style="font-size:0.80em;margin-right:7%;display:none;" class="row">
<div style="display:inline;margin-left:10%;">
<div>
<button id="ar" ng-click="removesellrow()"><i class="fa fa-trash fa-fas" ></i></button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button ng-click="addsellrow()" id="ar"><i class="fa fa-plus fa-fas" aria-hidden="true"></i></button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button id="ar" ng-click="clearsel()">clear all</button>
</div>
<div style="display:inline; border-left:2px solid green;">
<button id="ar" ng-click="totalsell()">total</button>
<table border="1">
<tr><th>total price except due(tk)</th><th>total amount(kg)</th>
<th>total due(tk)</th> </tr>
<tr><td style="background-color:white;color:black;">{{tsellprice}} tk</td>
<td style="background-color:white;color:black;">{{tsellamount}} kg</td>
<td style="background-color:white;color:black;">{{totaldue}} kg</td></tr>
</table>
</div>
</div>
<div>
<b style="color:black;">*rate(Taka):</b><input type="number" ng-model="sellrate"  placeholder="rate" 
ng-keyup="setsellprice()" />

<b style="color:black;">Date(day/month/year):</b><div>
<select  ng-model="selld"  ng-options="c for c in days"  ></select>
<select  ng-model="sellm"  ng-options="c for c in mfi"   ></select>
<select  ng-model="selly"  ng-options="c for c in years"  ></select>
</div>
</div>

<table border="1">
<tr>
<th style="text-align:center;">No</th>
<th style="text-align:center;">buyer info*</th>
<th style="text-align:center;">amount*</th>
<th style="text-align:center;">total price</th>
<th style="text-align:center;">due</th>
</tr>
<tr ng-repeat="x in sellmilk">
<td>
{{$index+1}}
</td>
<td>
<input type="text" ng-model="x.buyername"  placeholder="buyername"/><br/>
<input type="text" ng-model="x.contact"  placeholder="contact"/>
</td>
<td>
<input type="number" ng-model="x.amount" placeholder="amount" 
ng-keyup="setsellprice2($index)"  ng-click="setsellprice2($index)" /><br/>

</td>
<td >
<input type="number" ng-model="x.totalprice" disabled />
</td>
<td >
<input type="number" ng-model="x.due" />
</td>
</tr>
</table>
<button class="btn btn-sm btn-primary" ng-click="sellmilksave()">save reord</button>
</div>




<!-- --add animal list -->


<div id="addiv" style="font-size:0.80em;margin-right:7%;display:none;">

<div id="arf">
<div><button class="btn btn-sm" ng-click="addrowani()">add field</button></div>
<div><button class="btn btn-sm" ng-click="removerowani()">remove field</button></div>
</div>

<table border="1" >
  <tr>
<th>gender</th>
<th>type & source</th>
<th>color</th>
<th>price</th>
<th>height</th>
<th>weight</th>
<th>birth date</th>
  </tr>
  
  <tr ng-repeat="animal in animalform">
  
  <td ng-if="$index%2==0" style="background-color:darkseagreen;">
  <b>index no:-{{$index+1}}</b><br/>
  <select ng-model="animal.gender">
  <option value="male">male</option>
   <option value="female">female</option>
  </select>
  </td>
    <td ng-if="$index%2==1">
  <b>index no:-{{$index+1}}</b><br/>
  <select ng-model="animal.gender">
  <option value="male">male</option>
   <option value="female">female</option>
  </select>
  </td>
  
  
  
      <td ng-if="$index%2==0" style="background-color:darkseagreen;">
      <b>animal type</b> <br/>
      <select ng-model="animal.type">
      <option value="গরু">গরু</option>
     <option value="ছাগল">ছাগল</option>
      <option value="ভেড়া">ভেড়া</option>
       <option value="মহিষ">মহিষ</option>

          </select> 
          <br/>
          <b>source</b> <br/>
      <select ng-model="animal.source">
      <option value="from market">from market</option>
      <option value="from my firm">from my firm</option>
         </select>     
          
          </td>
          
    <td ng-if="$index%2==1" >
     <b>animal type</b> <br/>
    <select ng-model="animal.type">
      <option value="গরু">গরু</option>
     <option value="ছাগল">ছাগল</option>
      <option value="ভেড়া">ভেড়া</option>
       <option value="মহিষ">মহিষ</option>
         </select>
         <br/>
                  <b>source</b> <br/>
      <select ng-model="animal.source">
           <option value="from market">from market</option>
      <option value="from my firm">from my firm</option>
         </select>  
       
         
         </td>  
          
          
          
      
  <td style="height:20px;overflow:hidden;background-color:cornsilk;">
      <input type="checkbox"   ng-click="chooseanicolor($index,'brown')"><div style="background-color:brown;"></div>
</input>
      <input type="checkbox"    ng-click="chooseanicolor($index,'gray')"><div style="background-color:gray;"></div>
</input>
      <input type="checkbox"   ng-click="chooseanicolor($index,'black')"><div style="background-color:black;"></div>
</input>

      <input type="checkbox"   ng-click="chooseanicolor($index,'white')"><div style="background-color:white;border:1px solid green;"></div>
</input>

 </td>
 
 
  <td ng-if="$index%2==0" style="background-color:darkseagreen;"> 
   <b>price</b> <br/>
      <input style="width:80px;"  type="number" ng-model="animal.chest" />
      </td>
     <td ng-if="$index%2==1"> 
   <b>price</b> <br/>
      <input style="width:80px;"  type="number" ng-model="animal.chest" />
      </td>   
      
      
      
       <td ng-if="$index%2==0" style="background-color:darkseagreen;">
       <b>height</b> <br/>
      <input  style="width:50px;"  type="number" ng-model="animal.height" />
            <select ng-model="animal.hu">
<option value="cm">cm</option>
<option value="inch">inch</option>
<option value="feet">feet</option>
      </select>
      </td>
         <td ng-if="$index%2==1">
       <b>height</b> <br/>
      <input  style="width:50px;"  type="number" ng-model="animal.height" />
            <select ng-model="animal.hu">
<option value="cm">cm</option>
<option value="inch">inch</option>
<option value="feet">feet</option>
      </select>
      </td>    
      
      
      
      
       <td ng-if="$index%2==0" style="background-color:darkseagreen;">
       <b>weight</b> <br/>
      <input style="width:50px;"  type="number" ng-model="animal.weight" />
            <select ng-model="animal.wu">
<option value="গ্রাম">গ্রাঃ</option>
<option value="কেজি">কেজি</option> 
<option value="মন">মণ</option>
      </select>
      <br/>
                  <b>note</b>
<textarea rows="3" cols="10" ng-model="animal.extra"></textarea> 
      </td> 
        <td ng-if="$index%2==1">
       <b>weight</b> <br/>
      <input style="width:50px;"  type="number" ng-model="animal.weight" />
            <select ng-model="animal.wu">
<option value="গ্রাম">গ্রাঃ</option>
<option value="কেজি">কেজি</option> 
<option value="মন">মণ</option>
      </select>
      <br/>
            <b>note</b>
<textarea rows="3" cols="10" ng-model="animal.extra"></textarea> 
      </td> 
      
       <td>
       <b>day</b> <br/>
<select ng-options="c for c in days" ng-model="ds[$index]" ng-change="sdate($index)"></select>
     
      <br/>
<b>month</b><br/>
<select ng-options="c for c in mfi" ng-model="ms[$index]" ng-change="sdate($index)"></select>
<br/>
      <b>year</b><br/>
      <select ng-options="c for c in years" ng-model="ys[$index]" ng-change="sdate($index)"></select>
      <br/>
      </td>
      
      
    </tr>

</table>
<button class="btn btn-sm btn-success" ng-click="addanimal()">submit</button>
</div>












<div id="allanimal" style="display:none;">

<div id="sp">
<p  style="background-color:maroon;display:inline;">Select Search option</p>
<select ng-change="hukk(mg)" ng-model="mg">
<option value="---">------</option>
<option value="one">by type ,color,and age upper</option>
<option value="two">by type,color,and age lower</option>
<option value="three">by type,color and weight upper</option>
<option value="four">by type ,color and weight lower</option>
<option value="five">by type</option>
<option value="six">by id</option>
<option value="seven">by type and color</option>
</select>
</div>
<div style="background-color:white;color:black;margin-top:7px;margin-bottom:7px;">
<b>total animal::</b>{{numberofanimal}} <b> total price::</b>{{animalprice}}
</div>
<br/>
<br/>




<div id="one"  class="row" style="background-color:mediumseagreen;width:50%;display:none;margin-bottom:4px;margin-left:10px;font-size:0.80em;">
<div class="col" style="font-size:0.80em;">
<b>type</b><select ng-model="s.type">
<option value="গরু"> গরু  </option> 

<option value="ছাগল">  ছাগল </option>

<option value="মহিষ"> মহিষ </option>

<option value="ভেড়া">  ভেড়া  </option></select>
</div>

<div class="col" style="font-size:0.80em;">
<b>color</b> <div> <input type="checkbox" ng-click="choosecolor('brown')"><div style="background-color:brown;"></div>
</input>
      <input type="checkbox" ng-click="choosecolor('gray')"><div style="background-color:gray;"></div>
</input>
      <input type="checkbox" ng-click="choosecolor('black')"><div style="background-color:black;"></div>
</input>

      <input type="checkbox" ng-click="choosecolor('white')"><div style="background-color:white;border:1px solid green;"></div>
</input>
</div>
</div>

<div class="col" style="font-size:0.80em;">
<br/><br/>
<bold>year</bold><input type="number" placeholder="minimum age" ng-model="s.agey"/>
<b>unit</b> <select ng-model="s.wu">
<option value="month">month</option>
<option value="year">year</option> 
      </select>
<br/>
<br/>
<button ng-click="bytypeageupper();" style="margin-left:3px;" id="sbtn">search</button>
</div>

<br/><br/>

<div style="background-color:darkslategrey;color:white;border-left:2px solid black;margin:3px;font-size:0.80em;">

<b>select gender</b><select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select>
</div>
</div>




<div id="two" style="background-color:mediumseagreen;width:50%;display:none;margin-bottom:4px;margin-left:10px;" class="row">

<div class="col" style="margin:3px;background-color:mediumseagreen;">
<bold>type</bold> <select ng-model="s.type">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option></select>
<bold>year</bold><input type="number" placeholder="maximum age" ng-model="s.agey"/>
<b>unit</b> <select ng-model="s.wu">
<option value="month">month</option>
<option value="year">year</option> 
      </select>
</div>
<br/> <br/>
  <div class="col" style="margin:3px;background-color:mediumseagreen;"> <input type="checkbox" ng-click="choosecolor('brown')"><div style="background-color:brown;"></div>
</input>
      <input type="checkbox" ng-click="choosecolor('gray')"><div style="background-color:gray;"></div>
</input>
      <input type="checkbox" ng-click="choosecolor('black')"><div style="background-color:black;"></div>
</input>

      <input type="checkbox" ng-click="choosecolor('white')"><div style="background-color:white;border:1px solid green;"></div>
</input>
<div><button ng-click="bytypeagelower();" style="margin-left:3px;" id="sbtn" class="btn btn-default btn-sm">search</button></div>

</div>
<br/> <br/>

<div style="background-color:darkslategrey;color:white;border-left:2px solid black;margin:3px;font-size:0.80em;">
<b>select gender</b><select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select>
</div>

</div>


<div id="three" style="background-color:mediumseagreen;width:50%;display:none;margin-bottom:4px;font-size:0.80em;margin-left:10px;">

<table>
<tr>
<th>type</th>
<th>weight</th>
<th>unit</th>
</tr>

<tr>
<td><select ng-model="s.type">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option></select></td>

<td><input type="number" ng-model="s.weight" placeholder="weight"></td>
<td><select ng-model="s.wu">
<option value="গ্রাম">  গ্রাম </option>
<option value="কেজি">  কেজি  </option>
<option value="মন"> মন </option> 
</select></td>
</tr>
</table>
<br/>
<div style="background-color:mediumseagreen;"> 

<input type="checkbox" ng-click="choosecolor('brown')"><div style="background-color:brown;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('gray')"><div style="background-color:gray;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('black')"><div style="background-color:black;"></div>
</input>
<input type="checkbox" ng-click="choosecolor('white')"><div style="background-color:white;border:1px solid green;"></div>
</input>

<button style="margin:5px;" ng-click="bytypecolorweightupper();" style="margin-left:3px;" id="sbtn">search</button>
</div>

<br/> <br/>
<div style="background-color:darkslategrey;color:white;border-left:2px solid black;font-size:0.80em;" class="col">
<b>select gender</b><select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select> 
</div>

</div>


<div id="four" style="background-color:mediumseagreen;width:50%;display:none;margin-bottom:4px;font-size:0.80em;margin-left:10px;" class="row">

<table>
<tr>
<th>type</th>
<th>weight</th>
<th>unit</th>
</tr>
<tr>
<td><select ng-model="s.type">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option></select></td>

<td><input type="number" ng-model="s.weight" placeholder="weight"></td>
<td><select ng-model="s.wu">
<option value="গ্রাম">  গ্রাম </option>
<option value="কেজি">  কেজি  </option>
<option value="মন"> মন </option> 
</select></td>
</tr>
</table>
<br/>
<div style="background-color:mediumseagreen;"> 

<input type="checkbox" ng-click="choosecolor('brown')"><div style="background-color:brown;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('gray')"><div style="background-color:gray;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('black')"><div style="background-color:black;"></div>
</input>
<input type="checkbox" ng-click="choosecolor('white')"><div style="background-color:white;border:1px solid green;"></div>
</input>
<button style="margin:5px;" ng-click="bytypecolorweightlower();" style="margin-left:3px;" id="sbtn">search</button>
</div>

<br/> <br/>

<div style="background-color:darkslategrey;color:white;border-left:2px solid black;margin:3px;font-size:0.80em;" class="col">
<b>select gender</b><select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select>
</div>

</div>


<div id="five" style="background-color:mediumseagreen;width:50%;display:none;font-size:0.80em;margin-left:10px;" class="row">
<div class="col" class="col" style="margin:3px;background-color:mediumseagreen;">
<bold>type</bold> <select ng-model="s.type">
<option value="গরু"> গরু  </option> 
<option value="all"> all </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option></select></div>

<div class="col" class="col">
<button ng-click="sbytype();" style="margin-left:3px;" id="sbtn" class="btn btn-default btn-sm">search</button>
</div>
<br/><br/>
<div style="background-color:darkslategrey;color:white;margin:3px;" class="col">

<b>select gender</b> <select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select>
</div>

</div>




<div id="seven" style="background-color:mediumseagreen;width:50%;display:none;font-size:0.80em;margin-left:10px;" class="row">
<div class="col" class="col" style="margin:3px;background-color:mediumseagreen;">
<bold>type</bold> <select ng-model="s.type">
<option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option></select></div>
<br/>
<div style="background-color:mediumseagreen;"> 

<input type="checkbox" ng-click="choosecolor('brown')"><div style="background-color:brown;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('gray')"><div style="background-color:gray;"></div>
</input>
 <input type="checkbox" ng-click="choosecolor('black')"><div style="background-color:black;"></div>
</input>
<input type="checkbox" ng-click="choosecolor('white')"><div style="background-color:white;border:1px solid green;"></div>
</input>
<button  ng-click="bytypecolor();" style="margin-left:3px;" id="sbtn">search</button>
</div>
<br/><br/>
<div style="background-color:darkslategrey;color:white;margin:3px;" class="col">
<b>select gender</b> <select ng-model="g" ng-change="filterg(g)">
<option value="---">---</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="all">all</option>
</select>
</div>

</div>












<div id="six"  class="row" style="background-color:mediumseagreen;width:50%;display:none;margin-bottom:4px;margin-left:10px;font-size:0.80em;">
<div  class="col">
<input type="text" ng-model="s.anid" /> 
<button ng-click="sbyid();" style="margin-left:3px;" class="btn btn-default btn-sm">search</button>
</div>

<table>
<tr>
<th>animal id</th>
<th>type</th>
<th>price</th>
<th>gender</th>
<th>age</th>
<th>weight</th>
<th>height</th>
<th>prescriptions</th>
</tr>
 <tr>
<td>{{sbid.anid}}</td>
<td>{{sbid.type}}</td>
<td>{{sbid.chest}}</td>
<td>{{sbid.gender}}</td>
<td>{{sbid.agey}}</td>
<td>{{sbid.weight}}</td>
<td>{{sbid.height}}</td>
<td> 
<form method="get" target="_blank" action="/prescribe/pres">
 <input type="number"  name="anid" value="{{sbid.anid}}" style="display:none;">
   <input type="submit"  value="create new" />
</form>
<a   href="#" ng-click="presrecord(sbid.anid)" style="text-decoration:none;">created prescriptions</a>
</td> 
</tr>
</table>

</div>





<table border="1" id="tb" style="font-size:0.80em;">

<tr>
<th>index</th>
<th>id</th>
<th>created & price</th>
<th>type</th>
<th>gender</th>
<th>color</th>
<th>weight</th>
<th>height</th>
<th>age</th>
<th>photo</th>
<th>prescription</th>
</tr>


<tr ng-repeat="x in unphoto">

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{$index+1}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{$index+1}}
</td> 

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.anid}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.anid}}
</td> 


<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.createdstring}} <br/>
<b>price</b> <br/>
{{x.chest}} (tk)
</td> 

<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.createdstring}} <br/>
<b>price</b> <br/>
{{x.chest}} (tk)
</td> 

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.type}}
</td> 

<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.type}}
</td> 

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.gender}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.gender}}
</td> 

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.color}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.color}}
</td>  
<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.weight}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.weight}}
</td> 
  
<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.height}}
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.height}}
</td>  

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
{{x.agey}} year
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black"> 
{{x.agey}} year
</td> 

<td > <img  style="height:110px;width:170px;" src="<c:url value="/static/images/{{x.filename}}" />"/> <br/>
<br/>
<form method="get" target="_blank" action="${pageContext.request.contextPath}/animal/photoid/">
 <input type="number"  name="anid" value="{{x.anid}}" style="display:none;">
   <input type="submit"  value="upload photo" />
</form>
</td>

<td ng-if="checkstyle($index)=='t' " style="background-color:#838996;color:gold;">  
<form method="get" target="_blank" action="/prescribe/pres">
 <input type="number"  name="anid" value="{{x.anid}}" style="display:none;">
   <input type="submit"  value="create new" ng-click="setstyle($index);" />
</form>
<a   href="#" ng-click="presrecord(x.anid)" style="text-decoration:none;">created prescriptions</a>
</td> 
<td ng-if="checkstyle($index)=='f' "  style="background-color:ghostwhite;color:black" > 
<form method="get" target="_blank" action="/prescribe/pres">
 <input type="number"  name="anid" value="{{x.anid}}" style="display:none;">
   <input type="submit"  value="create new" ng-click="setstyle($index);"/>
</form>
<a   href="#" ng-click="presrecord(x.anid)" style="text-decoration:none;">created prescriptions</a>
</td> 

</tr>
</table>
</div>
    
 <!-- Prescription records -->   
    
    <button style="display:none;" id="presrecordbtn" data-toggle="modal" data-target="#presrecordmodal"></button>
    <div id="presrecordmodal" class="modal fade" role="dialog">
  <div class="modal-dialog"  >
 <!-- Modal content-->
      <div class="modal-content" style="width:100%;">
      <div class="modal-header" style="background-color:gray;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">prescription records</h4>
      </div>

  <div class="modal-body" >
      <b>Animal info & prescription</b>
<div ng-repeat="x in presrecords" style="font-size:0.80em;">

<div ng-if="$index==0" style="background-color:darkslategray;color:white;margin-bottom:4px;" class="row">
<div class="col-sm-7"><ul style="list-style-type:none;">
<li><b style="color:black;">animal id::-</b>{{x.ap.anid}} <b>doctor name::</b>{{x.ap.doctor}}</li>
<li><b style="color:black;">color::-</b>{{x.ap.color}}</li>
<li><b style="color:black;">age::-</b>{{x.ap.age}}</li>
<li><b style="color:black;">type::-</b>{{x.ap.type}} <b>   gender::-</b>{{x.doctor}}</li>
<li><b style="color:black;">weight::-</b><input type="number" ng-model="x.ap.weight"/></li>
<li><button ng-click="updateanimal(x.ap);">update</button></li>
</ul></div>
<div class="col-sm-4">
<img  style="height:150px;width:150px;"  src="<c:url value="/static/images/{{x.ap.filename}}" />"/>
</div>

<br/>
</div>
<b ng-if="$index==0">time condition** </b> <p ng-if="$index==0">it means if '0' then the drug need to take every day
otherwise the medicine need to take every 1 day later or  or 2 day later 'N' 
day later</p>
<table border="1" style="width:60%;font-size:0.70em;">
<tr ng-if="$index==0">
<th><b>starting date</b></th>
<th><b>drug type</b></th>
<th><b>drug name</b></th>
<th><b>continue til</b></th>
<th><b>rules</b></th>
<th><b>other</b></th>
</tr>
<tr >
<td>
<b style="color:maroon;">dd/mm/yyyy</b><input type="text" ng-model="x.stringstartingdate" style="width:40px;height:20px;"/>
</td>


<td>

{{x.drugtype}}
</td>
<td >
{{x.drugname}}
</td>


<td>
<b style="color:maroon;">dd/mm/yyyy</b><input type="text" ng-model="x.stringlastdate" style="width:40px;background-color:skyblue;height:20px;"/>
</td>
<td>

<input type="text" ng-model="x.rules"/>


</td>



<td>
<b>advice</b><input type="text" ng-model="x.consult"/><br/>
<b style="color:maroon;">time condition</b><input type="number" ng-model="x.prestypenumber"/><br/>
<button ng-click="presupdate(x)">update</button>

</td>

</tr>

</table>
</div>

 </div>
    
  <div class="modal-footer">
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    
    
 <button style="display:none;" id="pregnantmodalbtn" data-toggle="modal" data-target="#pregnantmodal"></button>
  <div id="pregnantmodal" class="modal fade" role="dialog" >
  <div class="modal-dialog"  >
       <!-- Modal content-->
  <div class="modal-content" style="width:500px;font-size:0.80em;">
  <div class="modal-header" style="background-color:gray;">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">pregnant report</h4>
  </div>
  <div class="modal-body" >

<button  class="btn btn-sm btn-primary" ng-click="addpreg()">addrow</button> <button  ng-click="removepreg()" class="btn btn-sm btn-primary">remove</button>
       
        <br/> <br/>
        
         <div ng-repeat="p in pregnant" >
         
        <div ng-if="$index%2==0" style="border:1px solid green;background-color:skyblue;">
        <br/>
     <b style="color:red;">{{p.sms}}</b>
         <b>animalid</b><input type="number" ng-model="p.anid" ng-keyup="checkpreganimalid($index)"/>
         <b>type</b><select  ng-model="p.type" ng-change="checkpreganimalid($index);">
         <option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option>
         </select>
        
       <br/> <br/>
        <b style="color:red;">{{p.dateerr}}</b>
 <b>concive date(dd/mm/yyyy)</b> <select ng-model="pregd[$index]" ng-options="c for c in days" ng-change="setconcivedate($index);"> </select> 
        <select ng-model="pregm[$index]" ng-options="c for c in mfi" ng-change="setconcivedate($index);"> </select> 
        <select ng-model="pregy[$index]" ng-options="c for c in years" ng-change="setconcivedate($index);"> </select> <br/>  <br/> 
             <b>next concive date</b><input type="text" ng-model="p.stringnextconcive" disabled/> <br/>
         <b>pregnancy serial no</b><input type="number" ng-model="p.pregnantno" disabled/> <button ng-click="delform($index);">delete this form</button><br/>
    <b>predicted child birth</b><input type="text" ng-model="p.stringpossibledate" disabled/> <b>(record no:- {{$index+1}})</b>
           <br/><br/>
	   </div>
	
	   <div ng-if="$index%2==1" style="border:1px solid black;background-color:darkseagreen;">
	    <br/>     
	          <b style="color:red;">{{p.sms}}</b>
	            <b>animalid</b><input type="number" ng-model="p.anid" ng-keyup="checkpreganimalid($index);"/>
            <b>type</b><select  ng-model="p.type" ng-change="checkpreganimalid($index);" >
         <option value="গরু"> গরু  </option> 
<option value="ছাগল">  ছাগল </option>
<option value="মহিষ"> মহিষ </option>
<option value="ভেড়া">  ভেড়া  </option>
         </select>
        
       <br/>  <br/> 
	 <b style="color:red;">{{p.dateerr}}</b>
	 <b>concive date(dd/mm/yyyy)</b> <select ng-model="pregd[$index]" ng-options="c for c in days" ng-change="setconcivedate($index);"> </select> 
        <select ng-model="pregm[$index]" ng-options="c for c in mfi" ng-change="setconcivedate($index);"> </select> 
        <select ng-model="pregy[$index]" ng-options="c for c in years" ng-change="setconcivedate($index);"> </select> <br/>  <br/> 
        <b>next concive date</b><input type="text" ng-model="p.stringnextconcive" disabled/> <br/>
        <b>pregnancy serial no</b><input type="number" ng-model="p.pregnantno" disabled/><button ng-click="delform($index);">delete this form</button> <br/>
        <b>predicted child birth</b><input type="text" ng-model="p.stringpossibledate" disabled/> <b>(record no:- {{$index+1}})</b>
	   <br/><br/>
	   </div>
	  <br/> <br/>
   </div>
  <div class="modal-footer">
  <button  style="float:left;"class="btn btn-success" ng-click="postpregnant();">save</button>  <button  class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>   
    
</div>

 <div id="tcpmodal" class="modal fade" role="dialog" >
  <div class="modal-dialog"  >
       <!-- Modal content-->
  <div class="modal-content" style="width:500px;font-size:0.80em;">
  <div class="modal-header" style="background-color:gray;">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">cost & profit</h4>
  </div>
  <div class="modal-body" >
  <b>total amount :: {{tamountc}} kg</b> <br/>
  <b>total taka:: {{tpricec}}</b>
  <table border="1" style="width:500px;overflow:auto;">
  <tr>
  <th>animal id</th>
  <th>collected milk</th>
  <th>animal type</th>
  <th>total price</th>
  <th>rate</th>
  <th>update</th>
  </tr>
  <tr ng-repeat="r in recsbydate">
  <td> {{r.anid}}</td> 
   <td><input   style="width:80px;" type="number" ng-model="r.amount"/></td>
    <td><input  style="width:80px;" type="text" ng-model="r.animaltype" /></td>
     <td><input style="width:80px;" type="number" ng-model="r.totalprice"/></td>
      <td><input style="width:80px;" type="number" ng-model="r.rate"/></td>
       <td><button ng-click="updatecollect($index)"></button></td>
  </tr>
  </table>
  
  </div>
  <div class="modal-footer">
   <button  class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  



 <div id="msell" class="modal fade" role="dialog" >
  <div class="modal-dialog">
       <!-- Modal content-->
  <div class="modal-content" style="width:500px;font-size:0.80em;">
  <div class="modal-header" style="background-color:gray;">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">milk sell record</h4>
  </div>
  <div class="modal-body" >
  search by date::<input type="text" ng-model="ad" placeholder="day/month/year" /> <button ng-click="inadate()">search</button>
  <br/> <br/>
  search by month of a year:: <b>month</b> <select ng-model="am" ng-options="c for c in mfi" ></select>
  
  <b>year</b><select ng-model="ay" ng-options="c for c in years" ></select>
  <br/>
  <button ng-click="inamonth()">search</button>
  <br/>
  search by buyername::<input type="text" ng-model="bn" placeholder="buyer name" /> <button ng-click="buyername()">search</button>
  <br/><br/>
  <b>total taka::</b> {{tt}} <b> total amount in kg::</b>{{tm}}
  
  <table border="1" style="text-align:center;">
  <tr ng-repeat="x in msells">
  <th ng-if="$index==0">buyer name</th>
   <th ng-if="$index==0">amount</th>
    <th ng-if="$index==0">milk rate</th>
     <th ng-if="$index==0">totalprice</th>
      <th ng-if="$index==0">due</th>
      <th ng-if="$index==0">selldate</th>
   </tr>
   
  <tr ng-repeat="x in msells">
  <td>{{x.buyername}}</td>
  <td>{{x.amount}}</td>
  <td>{{x.rate}}</td>
  <td>{{x.totalprice}}</td>
  <td>{{x.due}}</td>
  <td>{{x.stringselldate}}</td>
  </tr>
  
  </table>
  
  
  
  </div>
  <div class="modal-footer">
   <button  class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  



 <div id="tsm" class="modal fade" role="dialog" >
  <div class="modal-dialog">
       <!-- Modal content-->
  <div class="modal-content" style="width:500px;font-size:0.80em;">
  <div class="modal-header" style="background-color:gray;">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">milk sell record</h4>
  </div>
  <div class="modal-body" style="text-align:center;">
 <b>total sold except due::</b> {{tt}} tk 
 
 <br/>
 <b> total amount of milk in ::</b>{{tm}} kg <br/>
 <b>total due::{{tdue}} tk</b>
  <br/>
 search by buyername:: <input type="text" ng-model="bns.buyername" placeholder="buyername" ng-click="clearbn()" /> <br/>
    search by contact::<input type="text" ng-model="bns.contact" placeholder="contact" ng-click="clearbn()" /> <br/>
    search by date::  <input type="text" ng-model="bns.stringselldate" placeholder="selldate" ng-click="clearbn()" /><br/>
  <table border="1" style="textr-align:center;">
  
 <tr>
 <th>buyer name</th>
  <th>contact</th>
 <th>amount</th>
 <th>rate </th>
 <th>price</th>
 <th>tota due</th>
 <th>date</th>
  </tr>
  
  <tr ng-repeat="x in msells | filter:bns">
  <td>{{x.buyername}}</td>
  <td>
  {{x.contact}}</td>
   <td>{{x.amount}}</td>
    <td>{{x.rate}}</td>
    <td>{{x.totalprice}}</td>
    <td>{{x.due}}</td>
      <td>{{x.stringselldate}}</td>
  </tr>
  </table>
  
</div>
  <div class="modal-footer">
   <button  class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  

</body>
</html>