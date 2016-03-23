var myApp = angular.module('myApp', ['ngAnimate', 'ui.router', 'ui.bootstrap', 'duScroll', 'uiRouterStyles', 'myCtrl']);
myApp.config(['$stateProvider', '$urlRouterProvider',  '$locationProvider', '$httpProvider', 
    function($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider){
  $locationProvider.html5Mode(false);
  $urlRouterProvider.otherwise("/home");
  $stateProvider
  .state("home", {
  	url: "/home",
  	templateUrl: "home.html",
  	data: {
  	  pageTitle: "首页",
      css: 'static/site/css/home/home.css'
  	},
  	controller: "HomeCtrl"
  })
  .state("order", {
  	url: "/order",
  	templateUrl: "order.html",
  	controller: "OrderCtrl"
  })
  .state("order.cooking", {
  	url: "/cooking",
  	templateUrl: "cooking.html",
  	data: {
  	  pageTitle: "套餐",
      css: 'static/site/css/order/cooking.css'
  	},
  	controller: "CookingCtrl"
  })
  .state("order.cookingOrder", {
  	url: "/cooking/:id",
  	templateUrl: "cookingOrder.html",
  	data: {
  	  pageTitle: "套餐"
  	},
  	controller: "CookingOrderCtrl"
  })
  .state("order.custom", {
  	url: "/custom",
  	templateUrl: "custom.html",
  	data: {
  	  pageTitle: "自选",
      css: 'static/site/css/order/custom.css'
  	},
  	controller: "CustomCtrl"
  })
  .state("party", {
  	url: "/party",
  	data: {
      pageTitle: "订派对"
   	},
  	templateUrl: "party.html"
  })
  .state("login", {
  	url: "/login",
  	templateUrl: "login.html",
  	data: {
  	  pageTitle: "登录",
      css: 'static/site/css/user/login.css'
  	},
  	controller: "LoginCtrl"
  })
  .state("register", {
  	url: "/register",
  	templateUrl: "register.html",
  	data: {
  	  pageTitle: "注册",
      css: 'static/site/css/user/register.css'
  	},
  	controller: "RegisterCtrl"
  })
  .state("about", {
  	url: "/about",
  	templateUrl: "about.html",
  	data: {
  	  pageTitle: "关于我们"
  	},
  	controller: "AboutCtrl"
  });
  
  
  $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
  $httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
  //Override $http service's default transformRequest
  $httpProvider.defaults.transformRequest = [function(data) {
    /**
     * The workhorse; converts an object to x-www-form-urlencoded serialization.
     * @param {Object} obj
     * @return {String}
     */
    var param = function(obj) {
      var query = '';
      var name, value, fullSubName, subName, subValue, innerObj, i;
      for (name in obj) {
        value = obj[name];
        if (value instanceof Array) {
          for (i = 0; i < value.length; ++i) {
            subValue = value[i];
            fullSubName = name + '[' + i + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        } else if (value instanceof Object) {
          for (subName in value) {
            subValue = value[subName];
            fullSubName = name + '[' + subName + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        } else if (value !== undefined && value !== null) {
          query += encodeURIComponent(name) + '='
              + encodeURIComponent(value) + '&';
        }
      }
      return query.length ? query.substr(0, query.length - 1) : query;
    };
    return angular.isObject(data) && String(data) !== '[object File]'
        ? param(data)
        : data;
  }];
}]);

myApp.directive('title', ['$rootScope', '$timeout',
  function($rootScope, $timeout) {
    return {
      link: function() {
        var listener = function(event, toState) {
          $timeout(function() {
            $rootScope.title = (toState.data && toState.data.pageTitle) 
            ? toState.data.pageTitle 
            : '首页';
          });
        };
        $rootScope.$on('$stateChangeSuccess', listener);
      }
    };
  }
]);