<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN" ng-app="myApp" ng-controller="MainCtrl">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title ng-bind="title"></title>
<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
  <script src="static/html5shiv.min.js"></script>
  <script src="static/respond.min.js"></script>
<![endif]-->
<link href="static/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="static/site/css/index.css" rel="stylesheet">
</head>
<body>
<header class="navbar navbar-default navbar-fixed-top header" du-scrollspy="top" ng-cloak>
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse" ng-click="isCollapsed = !isCollapsed">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" ui-sref="home" ui-sref-opts="{reload: true}">LOGO</a>
      <span class="navbar-brand change-city" uib-dropdown>
		<a href id="city-dropdown" uib-dropdown-toggle><span ng-bind="city"></span> <span class="caret"></span></a>
        <ul uib-dropdown-menu aria-labelledby="city-dropdown" class="list-unstyled">
          <li ng-repeat="choice in cities">
            <a href ng-click="chose(choice)" ng-bind="choice"></a>
          </li>
        </ul>
      </span>
    </div>
    <nav class="hidden-xs navbar-large">
      <ul class="nav navbar-nav navbar-right">
        <li ui-sref-active="active"><a ui-sref="home" ui-sref-opts="{reload: true}">首页</a></li>
        <li ui-sref-active="active"><a ui-sref="order" ui-sref-opts="{reload: true}">找大厨</a></li>
        <li ui-sref-active="active"><a ui-sref="party" ui-sref-opts="{reload: true}">订派对</a></li>
        <li ui-sref-active="active"><a ui-sref="about" ui-sref-opts="{reload: true}">关于我们</a></li>
      </ul>
    </nav>
    <nav class="hidden-xs navbar-login">
      <ul class="nav navbar-nav navbar-right">
        <li ng-show="!$root.context"><span style="display: inline-block"><a ui-sref="login" ui-sref-opts="{reload: true}">登录</a> / <a ui-sref="register" ui-sref-opts="{reload: true}">注册</a></span></li>
        <li ng-show="$root.context"><span style="display: inline-block"><span ng-bind="$root.context.user.loginname"></span>, 你好 <a ng-click="logout()" ui-sref-opts="{reload: true}">退出</a></span></li>
        <li><a ui-sref="cart" ui-sref-opts="{reload: true}"><i class="fa fa-shopping-cart"></i> <span class="badge">3</span></a></li>
      </ul>
    </nav>
    <nav class="visible-xs navbar-small" uib-collapse="!isCollapsed">
      <ul class="nav navbar-nav">
        <li ui-sref-active="active"><a ui-sref="home" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">首页</a></li>
        <li ui-sref-active="active"><a ui-sref="order.cooking" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">推荐套餐</a></li>
        <li ui-sref-active="active"><a ui-sref="order.custom" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">自选菜品</a></li>
        <li ui-sref-active="active"><a ui-sref="party" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">订派对</a></li>
        <li ui-sref-active="active"><a ui-sref="cart" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">购物车 <span class="badge">3</span></a></li>
        <li ui-sref-active="active"><a ui-sref="about" ui-sref-opts="{reload: true}" ng-click="isCollapsed = !isCollapsed">关于我们</a></li>
      </ul>
    </nav>
  </div>
  <a class="gotop" href="#top" du-smooth-scroll><i class="fa fa-arrow-up"></i> 返回顶部</a>
</header>
<div id="top" style="height:1px;"></div>
<div class="main" ui-view></div>
<footer class="footer">
  <div class="container">
    <div class="row">
		<div class="footer-col col-sm-3">
		  <h3>Company</h3>
		  <ul>
		  	<li><a href="#">首页</a></li>
		    <li><a href="#">关于我们</a></li>
		    <li><a href="#">最新动态</a></li>
		    <li><a href="#">联系我们</a></li>
		  </ul>
		  </div>
		<div class="footer-col col-sm-3">
		  <h3>Information</h3>
		  <ul>
		  	<li><a href="#">My Account</a></li>
		    <li><a href="#">Rewards</a></li>
		    <li><a href="#">Terms & Conditions</a></li>
		    <li><a href="#">Buying Guide</a></li>
		    <li><a href="#">FAQ</a></li>
		  </ul>
		  </div>
		<div class="footer-col col-sm-3">
		  <h3>Let's be friends</h3>
		  <ul class="list-inline">
		 <li><a href=""><i class="fa fa-facebook-square fa-inverse fa-2x"></i></a></li>
		 <li><a href=""><i class="fa fa-twitter-square fa-inverse fa-2x"></i></a></li>
		 <li><a href=""><i class="fa fa-google-plus-square fa-inverse fa-2x"></i></a></li>
		 <li><a href=""><i class="fa fa-rss-square fa-inverse fa-2x"></i></a></li>
		  </ul>
		</div>
		<div class="footer-col col-sm-3">
		  <ul>
		  	<li><img src="static/site/images/secure.png" alt=""/></li> 
		  	<li>Lorem ipsum dolor coadipiscing</li>
		  </ul>
		  <ul>
		  	<li><img src="static/site/images/order.png" alt=""/></li> 
		  	<li>Lorem ipsum dolor coadipiscing</li>
		 </ul>
		</div>
    </div>
  </div>
</footer>
<script src="static/angular/angular.min.js"></script>
<script src="static/angular-animate/angular-animate.min.js"></script>
<script src="static/angular-ui-router/angular-ui-router.min.js"></script>
<script src="static/angular-ui-router-styles/ui-router-styles.js"></script>
<script src="static/angular-ui-bootstrap/ui-bootstrap-tpls.js"></script>
<script src="static/angular-scroll/angular-scroll.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script src="static/utils.js"></script>
<script src="static/site/js/controller.js"></script>
<script src="static/site/js/app.js"></script>
</script>
</body>
</html>
