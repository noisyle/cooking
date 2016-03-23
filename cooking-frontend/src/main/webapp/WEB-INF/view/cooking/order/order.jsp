<%@ page contentType="text/html; charset=utf-8"%>
<div class="container">
  <ul class="nav nav-tabs hidden-xs">
    <li role="presentation" ui-sref-active="active"><a ui-sref=".cooking">套餐</a></li>
    <li role="presentation" ui-sref-active="active"><a ui-sref=".custom">自选</a></li>
  </ul>
  <div ui-view></div>
</div>