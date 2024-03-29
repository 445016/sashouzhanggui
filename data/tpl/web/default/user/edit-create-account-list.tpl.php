<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>
<?php  if(empty($user['founder_groupid'])) { ?>
<ol class="breadcrumb we7-breadcrumb">
	<a href="<?php  echo url('user/display');?>"><i class="wi wi-back-circlewi wi-back-circle"></i> </a>
	<li><a href="<?php  echo url('user/display');?>">用户管理</a></li>
	<li>编辑用户详情</li>
</ol>
<?php  } else { ?>
<ol class="breadcrumb we7-breadcrumb">
	<a href="<?php  echo url('founder/display');?>"><i class="wi wi-back-circlewi wi-back-circle"></i> </a>
	<li><a href="<?php  echo url('founder/display');?>">副创始人管理</a></li>
	<li>编辑副创始人详情</li>
</ol>
<?php  } ?>
<div id="js-user-edit-account" ng-controller="UserEditAccount" ng-cloak>
	<div class="user-head-info" >
		<img ng-src="{{profile.avatar || ''}}" class="img-circle user-avatar ">
		<div class="info">
			<h3 class="title" ng-bind="user.username"></h3>
		</div>
		
		<?php  if($user['founder_groupid'] != ACCOUNT_MANAGE_GROUP_VICE_FOUNDER) { ?>
		<a href="javascript:;" class="btn btn-primary" ng-click="recycleUser()">禁用</a>
		<?php  } ?>
		
	</div>

	<div class="btn-group we7-btn-group we7-padding-bottom">
		<a href="<?php  echo url('user/edit/edit_base', array('uid' => $_GPC['uid']))?>" class="btn btn-default">基础信息</a>
		<?php  if(empty($user['founder_groupid'])) { ?>
		<a href="<?php  echo url('user/edit/edit_modules_tpl', array('uid' => $_GPC['uid']))?>" class="btn btn-default">应用模板权限</a>
		<?php  } ?>

		
			<?php  if(!empty($user['founder_groupid'])) { ?>
			<a href="<?php  echo url('founder/edit/edit_modules_tpl', array('uid' => $_GPC['uid']))?>" class="btn btn-default">应用模板权限</a>
			<?php  } ?>
		

		<a href="<?php  echo url('user/edit/edit_create_account_list', array('uid' => $_GPC['uid']))?>" class="btn btn-default active">账号创建权限</a>
		<a href="<?php  echo url('user/edit/edit_account_dateline', array('uid' => $_GPC['uid']))?>" class="btn btn-default">账号使用期限</a>

		<?php  if(empty($user['founder_groupid'])) { ?>
		<a href="<?php  echo url('user/edit/edit_account', array('uid' => $_GPC['uid']))?>" class="btn btn-default">使用账号列表</a>
		<?php  } ?>

		
			<?php  if(!empty($user['founder_groupid'])) { ?>
			<a href="<?php  echo url('founder/edit/edit_account', array('uid' => $_GPC['uid']))?>" class="btn btn-default">使用账号列表</a>
			<?php  } ?>
		
	</div>

	<div class="edit-account-num hidden">
		<div class="item">
			<div class="title">公众号</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxaccount'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['account_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['account_limit'];?></span></div>
		</div>
		<div class="item">
			<div class="title">微信小程序</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxwxapp'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['wxapp_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['wxapp_limit'];?></span></div>
		</div>
		<div class="item">
			<div class="title">PC</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxwebapp'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['webapp_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['webapp_limit'];?></span></div>
		</div>
		<div class="item">
			<div class="title">APP</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxphoneapp'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['phoneapp_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['phoneapp_limit'];?></span></div>
		</div>
		<div class="item">
			<div class="title">熊掌号</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxxzapp'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['xzapp_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['xzapp_limit'];?></span></div>
		</div>
		<div class="item">
			<div class="title">支付宝小程序</div>
			<div class="num">可创建总数 <span><?php  echo $user_permission_account['maxaliapp'];?></span></div>
			<div class="num">已创建 <span><?php  echo $user_permission_account['aliapp_num'];?></span></div>
			<div class="num">剩余可创建 <span><?php  echo $user_permission_account['aliapp_limit'];?></span></div>
		</div>
	</div>
	<div class="panel we7-panel user-permission">
		<div class="panel-heading">
			<span>所属用户组：<span ><?php  echo $user_permission_account['group_name'];?></span></span>
			<span class="pull-right">
				<a href="javascript:;" ng-if="user.groupid != 0" class="color-default" ng-click="delUserGroup(group_info.id)">删除</a>
				<a href="javascript:;" class="color-default" data-toggle="modal" data-target="#group">修改</a>
			</span>
		</div>
		<div class="panel-body ">
			<?php  if($user_permission_account['group_name']) { ?>
			<div class="we7-account-show we7-padding">
				<div class="name"><?php  echo $user_permission_account['group_name'];?></div>
				<div class="account-num-list">
					<?php  if($user_permission_account['user_group_maxaccount']) { ?>
					<span class="account-num-item">
						<i class="wi wi-account" ></i> <?php  echo $user_permission_account['user_group_maxaccount'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxwxapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-wxapp" ></i> <?php  echo $user_permission_account['user_group_maxwxapp'];?>个
					</span>
					<?php  } ?>
					<!-- <span class="account-num-item">
						<i class="wi wi-welcome" ></i> 6个
					</span> -->
					<?php  if($user_permission_account['user_group_maxwebapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-pc" ></i> <?php  echo $user_permission_account['user_group_maxwebapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxphoneapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-app" ></i> <?php  echo $user_permission_account['user_group_maxphoneapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxxzapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-xzapp" ></i> <?php  echo $user_permission_account['user_group_maxxzapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxaliapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-aliapp" ></i> <?php  echo $user_permission_account['user_group_maxaliapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxtoutiaoapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-toutiaoapp" ></i> <?php  echo $user_permission_account['user_group_maxtoutiaoapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['user_group_maxbaiduapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-baiduapp" ></i> <?php  echo $user_permission_account['user_group_maxbaiduapp'];?>个
					</span>
					<?php  } ?>
				</div>
			</div>
			<?php  } else { ?>
			<div class="we7-empty-block ">
				无用户组
			</div>
			<?php  } ?>
		</div>
	</div>
	<div class="panel we7-panel user-permission">
		<div class="panel-heading">
			<span>账号权限组名称</span>
			<div class=" pull-right">
				<we7-modal-account account="create_account_info" multiple="true" type="2" on-confirm="extraCreateGroup('group')">
					<a href="javascript:;" class="color-default">修改</a>
				</we7-modal-account>
			</div>
		</div>
		<?php  if($user_permission_account['create_groups']) { ?>
		<?php  if(is_array($user_permission_account['create_groups'])) { foreach($user_permission_account['create_groups'] as $create_group) { ?>
		<div class="panel-body we7-padding">
			<div class="we7-account-show">
				<div class="name"><?php  echo $create_group['group_name'];?></div>
				<div class="account-num-list">
					<?php  if($create_group['maxaccount']) { ?>
					<span class="account-num-item">
						<i class="wi wi-account" ></i> <?php  echo $create_group['maxaccount'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxwxapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-wxapp" ></i> <?php  echo $create_group['maxwxapp'];?>个
					</span>
					<?php  } ?>
					<!-- <span class="account-num-item">
						<i class="wi wi-welcome" ></i> 6个
					</span> -->
					<?php  if($create_group['maxwebapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-pc" ></i> <?php  echo $create_group['maxwebapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxphoneapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-app" ></i> <?php  echo $create_group['maxphoneapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxxzapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-xzapp" ></i> <?php  echo $create_group['maxxzapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxaliapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-aliapp" ></i> <?php  echo $create_group['maxaliapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxtoutiaoapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-toutiaoapp" ></i> <?php  echo $create_group['maxtoutiaoapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($create_group['maxbaiduapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-baiduapp" ></i> <?php  echo $create_group['maxbaiduapp'];?>个
					</span>
					<?php  } ?>
				</div>
			</div>
		</div>
		<?php  } } ?>
		<?php  } else { ?>
		<div class="we7-empty-block ">
			无账号权限组
		</div>
		<?php  } ?>
	</div>
	<?php  if(user_is_founder($_W['uid']) || user_is_vice_founder($_W['uid'])) { ?>
	<div class="panel we7-panel user-permission">
		<div class="panel-heading">
			<span>附加权限</span>
			<div class=" pull-right">
				<we7-modal-account account="create_account_info" multiple="true" type="3" on-confirm="extraCreateGroup('numbers')"><a href="javascript:;" class="color-default">修改</a></we7-modal-account>
			</div>
		</div>
		<?php  if($user_permission_account['extra_account'] || $user_permission_account['extra_wxapp'] || $user_permission_account['extra_webapp'] || $user_permission_account['extra_phoneapp'] || $user_permission_account['extra_xzapp'] || $user_permission_account['extra_aliapp'] || $user_permission_account['extra_toutiaoapp'] || $user_permission_account['extra_baiduapp']) { ?>
		<div class="panel-body we7-padding">
			<div class="we7-account-show">
				<div class="name">添加账号</div>
				<div class="account-num-list">
					<?php  if($user_permission_account['extra_account']) { ?>
					<span class="account-num-item">
						<i class="wi wi-account" ></i> <?php  echo $user_permission_account['extra_account'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_wxapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-wxapp" ></i> <?php  echo $user_permission_account['extra_wxapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_webapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-pc" ></i> <?php  echo $user_permission_account['extra_webapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_phoneapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-app" ></i> <?php  echo $user_permission_account['extra_phoneapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_xzapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-xzapp" ></i> <?php  echo $user_permission_account['extra_xzapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_aliapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-aliapp" ></i> <?php  echo $user_permission_account['extra_aliapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_toutiaoapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-toutiaoapp" ></i> <?php  echo $user_permission_account['extra_toutiaoapp'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['extra_baiduapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-baiduapp" ></i> <?php  echo $user_permission_account['extra_baiduapp'];?>个
					</span>
					<?php  } ?>
				</div>
			</div>
		</div>
		<?php  } else { ?>
		<div class="we7-empty-block ">
			无权限
		</div>
		<?php  } ?>
	</div>
	<?php  } ?>
	<div class="panel we7-panel user-permission">
		<div class="panel-heading">
			<span>商城购买账号权限</span>
		</div>
		<?php  if($user_permission_account['store_buy_account'] || $user_permission_account['store_buy_wxapp']) { ?>
		<div class="panel-body we7-padding">
			<div class="we7-account-show">
				<div class="name">购买账号</div>
				<div class="account-num-list">
					<?php  if($user_permission_account['store_buy_account']) { ?>
					<span class="account-num-item">
						<i class="wi wi-account" ></i> <?php  echo $user_permission_account['store_buy_account'];?>个
					</span>
					<?php  } ?>
					<?php  if($user_permission_account['store_buy_wxapp']) { ?>
					<span class="account-num-item">
						<i class="wi wi-wxapp" ></i> <?php  echo $user_permission_account['store_buy_wxapp'];?>个
					</span>
					<?php  } ?>
				</div>
			</div>
			<div class="user-account-num-shop hidden">
				<div class="item media">
					<div class="media-left">
						<div class="media-object logo">
							<i class="wi wi-account"></i>
						</div>
					</div>
					<div class="media-body media-middle">
						<h4 class="media-heading num">数量：<?php  echo $user_permission_account['store_buy_account'];?></h4>
						<!--<p class="date">有效期：1个月	</p>-->
					</div>
				</div>
				<div class="item media">
					<div class="media-left">
						<div class="media-object logo">
							<i class="wi wi-wxapp"></i>
						</div>
					</div>
					<div class="media-body media-middle">
						<h4 class="media-heading num">数量：<?php  echo $user_permission_account['store_buy_wxapp'];?></h4>
						<!--<p class="date">有效期：1个月	</p>-->
					</div>
				</div>
				<!--<div class="item media">-->
					<!--<div class="media-left">-->
						<!--<div class="media-object logo">-->
							<!--<i class="wi wi-pc"></i>-->
						<!--</div>-->
					<!--</div>-->
					<!--<div class="media-body media-middle">-->
						<!--<h4 class="media-heading num">数量：1</h4>-->
						<!--<p class="date">有效期：1个月	</p>-->
					<!--</div>-->
				<!--</div>-->
				<!--<div class="item media">-->
					<!--<div class="media-left">-->
						<!--<div class="media-object logo">-->
							<!--<i class="wi wi-app"></i>-->
						<!--</div>-->
					<!--</div>-->
					<!--<div class="media-body media-middle">-->
						<!--<h4 class="media-heading num">数量：1</h4>-->
						<!--<p class="date">有效期：1个月	</p>-->
					<!--</div>-->
				<!--</div>-->
				<!--<div class="item media">-->
					<!--<div class="media-left">-->
						<!--<div class="media-object logo">-->
							<!--<i class="wi wi-xzapp"></i>-->
						<!--</div>-->
					<!--</div>-->
					<!--<div class="media-body media-middle">-->
						<!--<h4 class="media-heading num">数量：1</h4>-->
						<!--<p class="date">有效期：1个月	</p>-->
					<!--</div>-->
				<!--</div>-->
				<!--<div class="item media">-->
					<!--<div class="media-left">-->
						<!--<div class="media-object logo">-->
							<!--<i class="wi wi-aliapp"></i>-->
						<!--</div>-->
					<!--</div>-->
					<!--<div class="media-body media-middle">-->
						<!--<h4 class="media-heading num">数量：1</h4>-->
						<!--<p class="date">有效期：1个月	</p>-->
					<!--</div>-->
				<!--</div>-->
				<!--<div class="item media">-->
					<!--<div class="media-left">-->
						<!--<div class="media-object logo">-->
							<!--<i class="wi wi-account"></i>-->
						<!--</div>-->
					<!--</div>-->
					<!--<div class="media-body media-middle">-->
						<!--<h4 class="media-heading num">数量：1</h4>-->
						<!--<p class="date">有效期：1个月	</p>-->
					<!--</div>-->
				<!--</div>-->
			</div>
		</div>
		<?php  } else { ?>
		<div class="we7-empty-block ">
			无权限
		</div>
		<?php  } ?>
	</div>
	<div class="modal fade" id="group" role="dialog">
		<div class="we7-modal-dialog modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<div class="modal-title">修改用户组</div>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<select class="we7-select" ng-model="changeGroup">
							<option value="">请选择所属用户组</option>
							<option ng-value="group.id" ng-repeat="group in user_groups" ng-selected="group.id == group_info.id" ng-bind="group.name"></option>
						</select>
						<span class="help-block"></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="httpChange('groupid')">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	require(['daterangepicker'], function() {
		angular.module('userManageApp').value('config', {
			uid : <?php  echo $_GPC['uid']?>,
			user: <?php echo !empty($user) ? json_encode($user) : 'null'?>,
			wechats: <?php echo !empty($account_detail['wechat']) ? json_encode($account_detail['wechat']) : 'null'?>,
			wxapps: <?php echo !empty($account_detail['wxapp']) ? json_encode($account_detail['wxapp']) : 'null'?>,
			group_info: <?php echo !empty($group_info) ? json_encode($group_info) : 'null'?>,
			webapps: <?php echo !empty($account_detail['webapp']) ? json_encode($account_detail['webapp']) : 'null'?>,
			phoneapps: <?php echo !empty($account_detail['phoneapp']) ? json_encode($account_detail['phoneapp']) : 'null'?>,
			xzapps : <?php echo !empty($account_detail['xzapp']) ? json_encode($account_detail['xzapp']) : 'null'?>,
			profile: <?php echo !empty($profile) ? json_encode($profile) : 'null'?>,
			create_account_info: <?php  echo json_encode($create_account)?>,
			user_groups: <?php  echo json_encode($user_groups)?>,
			links: {
				recycleUser: "<?php  echo url('user/display/operate', array('type' => 'recycle'))?>",
				editGroup: "<?php  echo url('user/edit/edit_modules_tpl')?>",
				editCreateAccountList: "<?php  echo url('user/edit/edit_create_account_list', array('uid' => $uid))?>",
				deleteUserGroupUrl: "<?php  echo url('user/edit/delete_user_group')?>",
				extra_create_account_url: "<?php  echo url('user/edit/edit_user_extra_group', array('uid' => $uid))?>",
			},
		});
		angular.bootstrap($('#js-user-edit-account'), ['userManageApp']);
	});
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>