





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">最新公告</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置指南</p>
										<p>新手请根据自己的设备类型点击不同的标签进行客户端配置：</p>
										
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}

													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iPhone/iPad</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ssr_info">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义协议</dt>
															<dd>{$user->protocol}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

															<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

															<p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_windows">
														<p><a href="/ssr-download/ssr-win.7z">下载</a>，解压，运行程序，然后您有三种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=0">这个（单端口多用户）</a>，右键小飞机 服务器 -- 从配置文件导入服务器，选择这个文件，<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这里（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这个(单端口多用户）</a>，然后右键小飞机 -- 从剪贴板复制地址<br>
															(3)(推荐)右键小飞机--服务器--SSR服务器订阅设置，将订阅地址设置为下面的地址，其他参数留空，确定之后再更新 SSR 服务器订阅。<br>
															然后选择一个合适的服务器，系统代理模式选”全局模式”，代理规则选“绕过局域网和大陆”，然后即可上网。</p>

														<p>SSR 订阅地址：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														<p><a href="/ssr-download/ssr-mac.dmg">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个(普通端口)</a>或者<a  href="/user/getpcconf?is_mu=1&is_ss=0">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，然后在 Safari 中点击<a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>SSR 订阅地址：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														<p><a href="/ssr-download/ssr-android.apk">下载</a>，安装，然后在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（单端口多用户）</a>，然后点击确定，批量添加完节点，然后路由选择绕过大陆，右上角开启就可以上网了。同时提供一个 ACL 地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里应用即可。</p>
														<p>SSR 订阅地址，您可以在节点列表处添加订阅来自动更新节点：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>

												</div>
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;电脑</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;安卓</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iPhone/iPad</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p><dt>协议</dt>
															<dd>Shadowsocks</p>

															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>加密方式</dt>
															<dd>{$user->method}</dd></p>
															
															<p><dt>混淆方式</dt>
															<dd>http</dd></p>
															
															<p><dt>Host</dt>
															<dd>www.apple.com</dd></p>

														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ss_windows">
														<p>请确保账号等级不是0！请确保账号等级不是0！请确保账号等级不是0！</p>
														<p>Clash小白方案：<br>
														1.点击下载<a href="https://wwfe.lanzoub.com/b00c3zsfe" target="_blank">百分浏览器定制版</a>，解压到一个文件夹<br>
														2.点击下载<a href="https://sub.df001.in/sub?target=clash&filename=config.yaml&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">配置文件</a><br>
														3.将下载好的config.yaml复制到浏览器的文件夹内，确保和clash-windows-386.exe在一起<br>
														4.双击打开“运行浏览器.bat”即可<br>
														PS：中途不可关闭clash的日志框</p>
														<p>Clash方案（推荐，不支持32位系统）：<br>
														1.点击下载<a href="https://wwi.lanzoui.com/b00c4wxif" target="_blank">Clash for Windows</a>，exe版本直接安装，7z版本需要解压<br>
														2.右键复制<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a><br>
														3.运行Clash for Windows.exe，打开主界面<br>
														4.点击左侧Profiles菜单，将刚刚复制的链接粘贴到顶部“Download from a URL”处，点击右侧的“Download”按钮<br>
														5.选中刚刚下载的sub配置<br>
														6.回到General菜单，勾选“Syestem Proxy”，打开任意浏览器即可<br>
														PS：如果想给不支持系统代理的网游或者软件使用，可以开启TUN模式，开启方法参考<a href="https://docs.cfw.lbyczf.com/contents/tun.html" target="_blank">这篇文档</a><br>
														PS2：勾选“Allow LAN”可共享给局域网其它设备使用，在游戏机等设备的代理处填电脑的内网IP，端口填7890</p>
														<p>官方SS方案：<br>
														1.SS客户端依赖.NET 4.8环境，Win10 1903开始已经集成，如果系统是在2019年前发布的（包括Win7 SP1、Win8.1、Win10 1607-1809），请下载并安装<a href="https://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/0fd66638cde16859462a6243a4629a50/ndp48-x86-x64-allos-enu.exe">.NET 4.8环境</a><br>
														2.点击下载<a href="https://wwfe.lanzouj.com/i8L9R0y7nfyj" target="_blank">SS客户端</a>，解压<br>
														3.下载你的<a href="/user/getpcconf?is_mu=0&is_ss=1">专属配置文件</a>，复制到刚才的Shadowsocks文件夹里<br>
														4.运行Shadowsocks.exe，在右下角的纸飞机图标上点右键，选择“系统代理”-“PAC模式”，打开任意浏览器即可</p>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
													    <p>ClashX方案：<br>
														1.下载<a href="https://wwi.lanzoui.com/b00c4v2mh" target="_blank">ClashX</a>，安装<br>
														2.右键复制<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a><br>
														3.运行ClashX，第一次要输入系统密码<br>
														4.在右上角ClashX图标上选择“配置”-“托管配置”-“管理”<br>
														5.点击“添加”，将刚才复制的那串链接填进去，点击“确定”<br>
														6.刚才添加的配置出现更新时间后，关掉托管管理窗口<br>
														7.点击右上角ClashX图标上的“设置为系统代理”即可</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>可以使用群内公共账号或自行注册美区账号并购买礼品卡</p>
														<p>Shadowrocket方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/shadowrocket/id932747118">Shadowrocket</a><br>
														2.长按<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Shadowrocket，点击顶部右上角的加号，确保类型是“Subscribe”<br>
														4.在URL处粘贴你复制的链接，点击完成<br>
														5.点击顶部“未连接”旁边的开关，第一次会弹出权限提示，需要授权</p>
														<p>Quantumult方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/quantumult/id1252015438">Quantumult</a><br>
														2.长按<a href="/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Quantumult，点击底部的“设置”<br>
														4.点击“下载配置文件”<br>
														5.将刚才复制的链接粘贴进去，点保存<br>
														6.回到首页，点击顶部右上角的开关，第一次会弹出权限提示，需要授权</p>
														<p>Loon Lite方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/loon-lite/id6444029612">Loon Lite</a><br>
														2.长按<a href="https://sub.df001.in/sub?target=loon&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Loon Lite，点击右上角的加号<br>
														4.在URL处粘贴你复制的链接，在别名处随意写一个名字，点保存<br>
														5.会弹出所有节点的列表，关掉<br>
														6.点击首页上方的“自动分流”旁边的开关，第一次会弹出权限提示，需要授权</p>
														<p>Quantumult X方案（推荐）：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/quantumult-x/id1443988620">Quantumult X</a><br>
														2.长按<a href="https://sub.df001.in/sub?target=quanx&list=true&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Quantumult X，点击右下方的圆形按钮，进入设置页<br>
														4.点击顶部的“节点资源（订阅）”按钮<br>
														5.点击右上角的添加资源按钮<br>
														6.将刚才复制的链接粘贴到“资源路径”中，点击右上角的保存按钮<br>
														7.回到首页，长按右下方的圆形按钮，选择第二个按钮（三色的那个）切换为规则分流模式<br>
														8.点击顶部右上角的开关，第一次会弹出权限提示，需要授权</p>
														<p>Stash方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/stash/id1596063349">Stash</a><br>
														2.长按<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Stash，点击底部的设置，选择“配置文件”，点击“从URL下载”<br>
														4.在URL处粘贴你复制的链接，点击“下载”<br>
														5.返回首页，确保左上角为“SUB.TXT”，点击右上角的“启动”按钮，第一次会弹出权限提示，需要授权</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
													    <p>请确保账号等级不是0！请确保账号等级不是0！请确保账号等级不是0！</p>
														<p>Surfboard方案：<br>
														1.下载<a href="https://wwfe.lanzouj.com/b00c4v2kf">Surfboard客户端</a>，安装<br>
														2.在手机浏览器中长按<a href="/link/{$ios_token}?is_ss=1">这个链接</a>，选择“复制链接网址”<br>
														3.运行Surfboard，进入底部的“配置文件”标签<br>
														4.点加号，选择“从URL导入”，里面会出现刚才复制的那个地址（没有的话手动粘贴进去），点击“导入”<br>
														6.点击底部第一个“仪表盘”标签，点右下角的开关，第一次需要授权VPN权限</p>
														<p>Clash方案：<br>
														1.下载<a href="https://wwfe.lanzouj.com/iNRUA0y95sre">Clash客户端</a>，安装<br>
														2.在手机浏览器中长按<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>，选择“复制链接网址”<br>
														3.运行Clash，进入顶部第二个“配置”按钮<br>
														4.点击右上角的加号，选择“URL”<br>
														5.在出来的界面点击“URL”，将刚刚复制的链接粘贴进去，点确认<br>
														6.点击右上角的保存按钮，在配置页面选中刚刚创建的配置<br>
														7.返回首页，点击最顶上“已停止”按钮，第一次需要授权VPN权限</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>Merlin Clash方案（适用于华硕、网件等采用博通芯片的路由器）：<br>
														1.刷入<a href="https://fw.koolcenter.com/" target="_blank">KoolCenter固件</a>，刷机教程自行搜索，也可以请卖家代刷<br>
														2.下载MerlinClash插件到电脑，MCKP开头的才是主程序，其它的是补丁<br>
														HND版：<a href="https://wwn.lanzoub.com/b0cmmva3g" target="_blank">点击下载</a>，适用于AC86U/GT5300/AX68U/AX86U/AX88U/AX92U/AX11000/AX6000/AX86U pro/RAX80等ARMv8机型<br>
														AX32版：<a href="https://wwn.lanzoub.com/b0cmmvaqj" target="_blank">点击下载</a>，适用于AX3000/AX5400/AX6600/AX82U/AX56U/AX58U/AX1800/AX89X/RAX50/AX56Uv2/AX57U等ARMv7新机型<br>
														384版：<a href="https://wwn.lanzoub.com/b0cmmvaud" target="_blank">点击下载</a>，适用于AC66U_B1/AC68U/AC1900/AC1900P/AC87U/AC3200/AC88U/AC3100/RT5300/斐讯K3 G大固件等ARMv7老机型<br>
														3.进入路由器后台，打开软件中心，点手动安装，选择下载的gz文件，上传并安装<br>
														4.进入安装好的Merlin Clash插件，进入“配置文件”标签<br>
														5.找到“Clash-Yaml配置下载”，右键复制<a href="https://sub.df001.in/sub?target=clash&config=https://github.com/doufu001/config/raw/master/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>，粘贴到右侧的文本框中<br>
														6.在“重命名”里随意填一个名字，例如clash，点击“Clash订阅”<br>
														7.回到首页，打开顶部的“Merlin Clash开关”，“配置文件选择”处选中刚才添加的配置，点击最下方的“保存&应用”<br>
														8.首页的“访问 Clash 管理面板”可以切换节点<br>
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">close</span>&nbsp;重置所有链接</a></p>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">帐号使用情况</p>
										<dl class="dl-horizontal">
											<p><dt>帐号等级</dt>
											<dd>{$user->class}</dd></p>

											<p><dt>等级过期时间</dt>
											<dd>{$user->class_expire}</dd></p>

											<p><dt>帐号过期时间</dt>
											<dd>{$user->expire_in}</dd>

											<p><dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>不限速</dd>
											{/if}</p>

											<p><dt>上次使用</dt>
											<dd>{$user->lastSsTime()}</dd></p>
										</dl>
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>






						{if $enable_duoshuo=='true'}

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0]
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>

								</div>
							</div>

						{/if}

						{include file='dialog.tpl'}

					</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>
