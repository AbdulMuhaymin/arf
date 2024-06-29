"use strict";var app=angular.module("materialsCloudApp",["ngAnimate","config","data","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch","ui.router","angular-loading-bar","ngAnimate","ngCookies","validation","validation.rule","LocalStorageModule","ncy-angular-breadcrumb","ngMaterial","ui.router.title","oc.lazyLoad"]);app.config(["$urlRouterProvider","$stateProvider","$locationProvider","$provide","$httpProvider","cfpLoadingBarProvider","$validationProvider","$breadcrumbProvider","$mdThemingProvider","$compileProvider","$ocLazyLoadProvider",function($urlRouterProvider,$stateProvider,$locationProvider,$provide,$httpProvider,cfpLoadingBarProvider,$validationProvider,$breadcrumbProvider,$mdThemingProvider,$compileProvider,$ocLazyLoadProvider){$compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|tel|file|blob):/);angular.extend($validationProvider,{validCallback:function(element){$(element).parents(".input-group:first").removeClass("has-error");$(element).parents(".form-group:first").removeClass("has-error")},invalidCallback:function(element){$(element).parents(".input-group:first").addClass("has-error");$(element).parents(".form-group:first").addClass("has-error")}});$httpProvider.defaults.useXDomain=true;$httpProvider.defaults.xsrfCookieName="csrftoken";$httpProvider.defaults.xsrfHeaderName="X-CSRFToken";delete $httpProvider.defaults.headers.common["X-Requested-With"];$breadcrumbProvider.setOptions({prefixStateName:"main",template:"bootstrap3"});$validationProvider.showSuccessMessage=false;$validationProvider.showErrorMessage=false;$mdThemingProvider.theme("default").primaryPalette("indigo").accentPalette("blue");$ocLazyLoadProvider.config({debug:false,events:false,serie:true});$stateProvider.state("main",{templateUrl:"views/main.html",abstract:true,ncyBreadcrumb:{label:"Home"},resolve:{$title:function(){return"Home"},loadMyCtrl:["$ocLazyLoad",function($ocLazyLoad){return $ocLazyLoad.load(["scripts/controllers/2d880d15.main.js","scripts/controllers/dd4ed3bb.auth.js"])}]}}).state("main.work",{url:"^/",templateUrl:"views/work/work.html",redirectTo:"main.work.menu",ncyBreadcrumb:{label:"Work"},resolve:{$title:function(){return"Work"}}}).state("main.work.menu",{url:"^/menu",templateUrl:"views/work/menu.html",ncyBreadcrumb:{skip:true},resolve:{$title:["$title",function($title){return $title}]}}).state("main.work.tools",{url:"^/tools",templateUrl:"views/work/tools.html",redirectTo:"main.work.tools.options",ncyBreadcrumb:{label:"Tools"},resolve:{$title:function(){return"Tools"}}}).state("main.work.tools.help",{url:"/help",templateUrl:"views/work/new_tool_help.html",ncyBreadcrumb:{label:"Help"},resolve:{$title:function(){return"Add new tool"}}}).state("main.work.tools.options",{url:"/options",templateUrl:"views/work/tooloptions.html",controller:function($scope,DATA){$scope.logoUrl="images/tools_logos/";$scope.menu=DATA.tools_menu.menu},ncyBreadcrumb:{skip:true},resolve:{$title:function(){return"Tools"}}}).state("main.work.tools.seekpath",{url:"/seekpath",templateUrl:"views/work/iframe.html",controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["toolsRestEndPoint"]+"/seekpath");var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}},ncyBreadcrumb:{label:"SeeK-path"},resolve:{$title:function(){return"SeeK-path"},loadMyCtrl:["$ocLazyLoad",function($ocLazyLoad){return $ocLazyLoad.load(["scripts/controllers/work/486fadb3.seekpathinfo.js"])}]}}).state("main.work.tools.shiftml",{url:"/shiftml",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"ShiftML"},resolve:{$title:function(){return"ShiftML"}},controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["toolsRestEndPoint"]+"/shiftml");var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.work.tools.alphaml",{url:"/alphaml",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"AlphaML"},resolve:{$title:function(){return"AlphaML"}},controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["toolsRestEndPoint"]+"/alphaml");var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.work.tools.sycofinder",{url:"/sycofinder",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"Synthesis condition finder"},resolve:{$title:function(){return"Synthesis condition finder"}},controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["sycofinderRestEndPoint"]);var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.work.tools.qeinputgenerator",{url:"/qeinputgenerator?structure",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"Quantum ESPRESSO input generator and structure visualizer"},resolve:{$title:function(){return"Quantum ESPRESSO input generator"}},controller:function($scope,$stateParams,ENV,$sce){var structureFilename=$stateParams.structure;if(structureFilename){var serverUrl=$sce.trustAsResourceUrl(ENV["toolsRestEndPoint"]+"/qeinputgenerator/?structure_filename="+structureFilename)}else{var serverUrl=$sce.trustAsResourceUrl(ENV["toolsRestEndPoint"]+"/qeinputgenerator/")}var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.work.tools.oximachine",{url:"/oximachine",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"oxiMACHINE"},resolve:{$title:function(){return"oxiMACHINE"}},controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["oximachineRestEndPoint"]);var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.work.tools.tgkp",{url:"/tgkp",templateUrl:"views/work/iframe.html",ncyBreadcrumb:{label:"Band structure of twisted mixed multilayer graphene in k • p model"},resolve:{$title:function(){return"TGKP"}},controller:function($scope,ENV,$sce){var serverUrl=$sce.trustAsResourceUrl(ENV["tgkpRestEndPoint"]);var ifr=document.getElementById("contentiframe");if(ifr){ifr.contentWindow.location.replace(serverUrl)}}}).state("main.aiidalab",{url:"/aiidalab",redirectTo:"main.work.aiidalab"}).state("main.work.aiidalab",{url:"^/aiidalab",templateUrl:"views/work/aiidalab.html",ncyBreadcrumb:{label:"AiiDAlab"},resolve:{$title:function(){return"AiiDAlab"}}}).state("main.pagenotfound",{url:"/pagenotfound",templateUrl:"views/custom404.html",resolve:{$title:function(){return"Page not found"}}});$urlRouterProvider.otherwise("/pagenotfound");$urlRouterProvider.rule(function($injector,$location){var path=$location.path();var hasTrailingSlash=path[path.length-1]==="/";if(hasTrailingSlash){var newPath=path.substr(0,path.length-1);return newPath}});$locationProvider.html5Mode(true).hashPrefix("!");cfpLoadingBarProvider.includeSpinner=false;cfpLoadingBarProvider.parentSelector=".mcloud-status-bar";$provide.factory("customHttpInterceptor",function($q){return{request:function(config){return config||$q.when(config)},requestError:function(rejection){return $q.reject(rejection)},response:function(response){return response||$q.when(response)},responseError:function(rejection){return $q.reject(rejection)}}});$httpProvider.interceptors.push("customHttpInterceptor")}]).run(["$rootScope","$state",function($rootScope,$state){$rootScope.$on("$stateChangeStart",function(event,toState,toParams,fromState,fromParams){$(toState).addClass("NewClass");$(fromState).removeClass("NewClass");if(toState.redirectTo){event.preventDefault();$state.go(toState.redirectTo,{},{location:"replace"})}})}]);