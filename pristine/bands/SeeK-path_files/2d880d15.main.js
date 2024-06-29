"use strict";angular.module("materialsCloudApp").controller("MainCtrl",["$scope","$location","$window",function($scope,$location,$window){$scope.isActive=function(path){return $location.path().substr(0,path.length)===path?"active":""};var endmaintenance=new Date("2021-09-24T19:00:00+02:00");var current=new Date;var showMaintenanceMessage=true;var message="NOTE! Materials Cloud might be inaccessible from 8 AM of Thursday September 23rd"+" until 7 PM CET of Friday September 24th, 2021"+" due to maintenance work."+" <br>We apologize for any inconvenience.";if(current.getTime()<endmaintenance.getTime()&&showMaintenanceMessage){$(".mcloud-message-container").append('<div class="mcloud-general-message"><p>'+message+"</p></div>")}$scope.changePath=function(path){console.log("path: ",$window.location.origin+"/"+path);$window.location.href=$window.location.origin+"/"+path}}]);