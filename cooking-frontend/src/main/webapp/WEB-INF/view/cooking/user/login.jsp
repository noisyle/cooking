<%@ page contentType="text/html; charset=utf-8"%>
<div class="container-fluid">
  <form class="form-signin">
    <h2 class="form-signin-heading">登录</h2>
    <input type="text" class="form-control" placeholder="手机号" required autofocus ng-model="loginname">
    <input type="password" class="form-control" placeholder="密码" required ng-model="password">
    <p class="bg-danger" ng-show="message" ng-bind="message"></p>
    <span><a>忘记密码？</a><a ui-sref="register" class="pull-right">现在注册</a></span>
    <button class="btn btn-primary btn-block" type="button" ng-click="login()">立即登录</button>
  </form>
</div>