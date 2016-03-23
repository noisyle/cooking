var myCtrl = angular.module('myCtrl', []);

myCtrl.controller('MainCtrl', ["$scope", "$rootScope", "$http", function ($scope, $rootScope, $http) {
  $scope.city = '成都';
  $scope.cities = [
    '成都',
    '上海',
    '北京',
    '杭州',
    '深圳'
  ];

  $scope.chose = function(city) {
    $scope.city = city;
  };
  
  $scope.logout = function() {
    $http.post("logout").success(function(r){
      if(r.status == 'SUCCESS'){
        $rootScope.context = undefined;
      }
    });
  };
  
  $http.get("getContext").success(function(r){
    if(r.status == 'SUCCESS'){
      $rootScope.context = r.data;
    }
  });
}]);

myCtrl.controller('HomeCtrl', ["$scope", function($scope){
  $scope.myInterval = 5000;
  $scope.noWrapSlides = false;
  $scope.active = 0;
  var slides = $scope.slides = [];
  var currIndex = 0;
  
  $scope.addSlide = function() {
    var newWidth = 600 + slides.length + 1;
    slides.push({
      image: 'static/site/images/home/jumbotron.jpg',
      text: ['Nice image','Awesome photograph','That is so cool','I love that'][slides.length % 4],
      id: currIndex++
    });
  };
  for (var i=0; i<4; i++) {
    $scope.addSlide();
  }
}]);

myCtrl.controller('OrderCtrl', ["$state", function($state){
  if($state.is('order')) $state.go("order.cooking");
}]);

myCtrl.controller('CookingCtrl', ["$scope", function($scope){
  items = function(){var a=[],i=0;while(i<123){a.push({idx:++i});};return a;}();
  $scope.items = items.slice(0, 10);
  $scope.maxSize = 5;
  $scope.perPage = 10;
  $scope.totalItems = items.length;
  $scope.currentPage = 1;
  $scope.pageChanged = function(){
  	  $scope.items = items.slice(($scope.currentPage-1)*10, $scope.currentPage*10);
  };
  $scope.filter = {type: "all", flavor: "all"};
  $scope.filterChanged = function(){
	  $scope.currentPage = 1;
	  $scope.items = items.slice(0, 10);
  };
}]);

myCtrl.controller('CookingOrderCtrl', ["$scope", function($scope, $stateParams){
  $scope.id = $stateParams.id;
}]);

myCtrl.controller('CustomCtrl', ["$scope", function($scope){
  items = function(){var a=[],i=0;while(i<123){a.push({idx:++i});};return a;}();
  $scope.items = items.slice(0, 10);
  $scope.maxSize = 5;
  $scope.perPage = 10;
  $scope.totalItems = items.length;
  $scope.currentPage = 1;
  $scope.pageChanged = function(){
  	  $scope.items = items.slice(($scope.currentPage-1)*10, $scope.currentPage*10);
  };
  $scope.filter = {type: "all", flavor: "all"};
  $scope.filterChanged = function(){
	  $scope.currentPage = 1;
	  $scope.items = items.slice(0, 10);
  };
}]);

myCtrl.controller('AboutCtrl', ["$scope", function ($scope) {
  //创建和初始化地图函数：
  function initMap(){
    createMap();//创建地图
    setMapEvent();//设置地图事件
    addMapControl();//向地图添加控件
  }

  //创建地图函数：
  function createMap(){
    var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
    var point = new BMap.Point(116.403011,39.912445);//定义一个中心点坐标
    map.centerAndZoom(point,13);//设定地图的中心点和坐标并将地图显示在地图容器中
    window.map = map;//将map变量存储在全局
  }

  //地图事件设置函数：
  function setMapEvent(){
    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
    map.enableScrollWheelZoom();//启用地图滚轮放大缩小
    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
    map.enableKeyboard();//启用键盘上下左右键移动地图
  }

  //地图控件添加函数：
  function addMapControl(){
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
    //向地图中添加缩略图控件
    var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
    map.addControl(ctrl_ove);
    //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
  }

  initMap();//创建和初始化地图
}]);

myCtrl.controller('LoginCtrl', ["$scope", "$rootScope", "$http", "$state", function ($scope, $rootScope, $http, $state) {
  $scope.login = function(){
    if(!$scope.loginname || !$scope.loginname.trim()){
      $scope.message = "请输入用户名和密码";
      return;
    }
	if(!$scope.password || !$scope.password.trim()){
      $scope.message = "请输入用户名和密码";
      return;
    }
	var user = {loginname: $scope.loginname.trim(), password: md5($scope.password.trim()).toUpperCase()};
    $http.post("login", user).success(function(r){
      if(r.status == 'SUCCESS'){
  	    $rootScope.context = r.data;
        $state.go("home");
      }else{
        $scope.message = r.message;
      }
    });
  };
}]);

myCtrl.controller('RegisterCtrl', ["$scope", "$rootScope", "$http", "$state", function ($scope, $rootScope, $http, $state) {
  $scope.captchaUrl = "captcha.png?_ts=" + new Date().getTime();
  $scope.getCaptcha = function(){
	  $scope.captchaUrl = "captcha.png?_ts=" + new Date().getTime();
  }
  $scope.register = function(){
    if(!$scope.loginname || !$scope.loginname.trim()){
      $scope.message = "请填写用户名";
      return;
    }
    if(!$scope.password || !$scope.password.trim()){
      $scope.message = "请填写密码";
      return;
    }
    if(!$scope.password2 || !$scope.password2.trim()){
      $scope.message = "请填写确认密码";
      return;
    }
    if(!$scope.captcha || !$scope.captcha.trim()){
      $scope.message = "请填写验证码";
      return;
    }
    var user = {
      loginname: $scope.loginname.trim(),
      password: md5($scope.password.trim()).toUpperCase(),
      password2: md5($scope.password2.trim()).toUpperCase(),
      captcha: $scope.captcha.trim().toUpperCase()
    };
    $http.post("register", user).success(function(r){
      if(r.status == 'SUCCESS'){
        $rootScope.context = r.data;
        $state.go("home");
      }else{
        $scope.message = r.message;
        $scope.getCaptcha();
      }
    });
  };
}]);