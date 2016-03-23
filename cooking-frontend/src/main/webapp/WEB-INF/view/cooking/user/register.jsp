<%@ page contentType="text/html; charset=utf-8"%>
<div class="container-fluid">
  <form class="form-signin">
    <h2 class="form-signin-heading">注册</h2>
    <input type="text" class="form-control" placeholder="手机号" required autofocus ng-model="loginname">
    <input type="password" class="form-control" placeholder="密码" required ng-model="password">
    <input type="password" class="form-control" placeholder="确认密码" required ng-model="password2">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="验证码" required ng-model="captcha">
      <span class="input-group-addon">
        <img alt="captcha" ng-src="{{captchaUrl}}" ng-click="getCaptcha()" />
      </span>
    </div>
    <p class="bg-danger" ng-show="message" ng-bind="message"></p>
    <span><a ui-sref="login">已经有账号？</a></span>
    <button class="btn btn-primary btn-block" type="button" ng-click="register()">立即注册</button>
  </form>
</div>