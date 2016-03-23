<%@ page contentType="text/html; charset=utf-8"%>
<div class="row">
  <div class="col-xs-12">
    <ul class="filterUL">
      <li>
        <div class="pull-left type">菜系：</div>
        <div class="choice">
          <a class="btn btn-default" href role="button" ng-model="filter.type" uib-btn-radio="'all'" ng-change="filterChanged()">不限</a>
          <a class="btn btn-default" href role="button" ng-model="filter.type" uib-btn-radio="'chuancai'" ng-change="filterChanged()">川菜</a>
          <a class="btn btn-default" href role="button" ng-model="filter.type" uib-btn-radio="'yuecai'" ng-change="filterChanged()">粤菜</a>
        </div>
      </li>
      <li>
        <div class="pull-left type">口味：</div>
        <div class="choice">
          <a class="btn btn-default" href role="button" ng-model="filter.flavor" uib-btn-radio="'all'" ng-change="filterChanged()">不限</a>
          <a class="btn btn-default" href role="button" ng-model="filter.flavor" uib-btn-radio="'qingdan'" ng-change="filterChanged()">清淡</a>
          <a class="btn btn-default" href role="button" ng-model="filter.flavor" uib-btn-radio="'mala'" ng-change="filterChanged()">麻辣</a>
        </div>
      </li>
    </ul>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <ul ng-repeat="item in items" class="list-unstyled">
      <li class="item">
        <div class="row">
          <div class="col-xs-7 col-sm-3">
            <img class="img-responsive" src="http://images.freeimages.com/images/previews/676/pita-gyros-1323451.jpg" alt="">
          </div>
          <div class="col-xs-5 col-sm-3 col-sm-push-6 item-action">
            <div><span class="item-price">{{item.idx | currency : '￥'}}</span> 元</div>
            <div><button type="button" class="btn btn-default">加入购物车</button></div>
          </div>
          <div class="col-xs-12 col-sm-6 col-sm-pull-3 item-detail">
            <div><span class="item-title">菜品{{item.idx}}</span></div>
			<div>介绍{{item.idx}}</div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="col-xs-12">
    <div class="pull-right">
      <uib-pagination total-items="totalItems" ng-model="currentPage" max-size="maxSize" items-per-page="perPage" boundary-links="true" rotate="false" previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;" last-text="&raquo;" ng-change="pageChanged()"></uib-pagination>
    </div>
  </div>
</div>