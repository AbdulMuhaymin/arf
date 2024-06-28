"use strict";

/**
 * @ngdoc controller
 * @name materialsCloudApp.controller:SeekpathInfoCtrl
 * @description
 *
 * It is the controller for displaying SeeK-path information like "About the SeeK-path"
 * and "Acknowledgement" pages.
 *
 * #### File location: app/scripts/controllers/work/seekpathinfo.js
 *
 * @requires $scope : scope object for this page
 * @requires $timeout : used to add delay
 * @requires utils : to get utils functionality to create window
 *
 */
angular.module("materialsCloudApp").controller("SeekpathInfoCtrl",
    ["$scope", "$timeout", "utils",
        function ($scope, $timeout, utils) {

/*            *//**
             * @ngdoc
             * @name materialsCloudApp.controller:SeekpathInfoCtrl#aboutWin
             * @propertyOf materialsCloudApp.controller:SeekpathInfoCtrl
             *
             * @description
             * Define window object to display "About the SeeK-path" page.
             *//*
            $scope.aboutWin = null;

            *//**
             * @ngdoc
             * @name materialsCloudApp.controller:SeekpathInfoCtrl#ackWin
             * @propertyOf materialsCloudApp.controller:SeekpathInfoCtrl
             *
             * @description
             * Define window object to display "Acknowledgement" page.
             *//*
            $scope.ackWin = null;

            if($scope.aboutWin === null){
                // create about window
                $timeout(function(){
                    $scope.aboutWin = utils.createKWindow("div#aboutWindow", "div#aboutContainer",
                        "About SeeK-path", [], false);
                    $scope.aboutWin.minimize();
                });
            }

            if($scope.ackWin === null){
                // create ack window
                $timeout(function(){
                    $scope.ackWin = utils.createKWindow("div#ackWindow", "div#ackContainer",
                        "Acknowledgements and how to cite", [], false);
                    $scope.ackWin.minimize();
                });
            }
*/

            $scope.activateAccordion = null;

            if($scope.activateAccordion === null){
                // activate accordion
                $timeout(function(){
                    $scope.activateAccordion = $( "#accordion" );
                    $scope.activateAccordion.collapse({
                        toggle: true});
                });
            }


            $('.panel-collapse').on('show.bs.collapse', function () {
                $(this).siblings('.panel-info').addClass('active');
            });

            $('.panel-collapse').on('hide.bs.collapse', function () {
                $(this).siblings('.panel-info').removeClass('active');
            });

        }
    ]
);