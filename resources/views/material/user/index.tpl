





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
										<p class="card-heading">新手配置指南</p>
										<p>新用户请根据自己的设备类型进行配置：</p>
										
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
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
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
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;安卓</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_linux"><i class="icon icon-lg">desktop_windows</i>&nbsp;Linux</a>
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
															<p>
															<dt>服务器地址</dt>
															<dd>节点1：s1.mpdf.in</dd>
															<dd>节点2：s2.mpdf.in</dd>
															<dd>节点3：s3.mpdf.in</dd>
															<dd>节点4：s4.mpdf.in</dd>
															</p>

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
														
														<p>官方SS方案：<br>
														1.SS客户端依赖.net 4.6.2，Win10 1607开始已经集成，如果系统是在2016年前发布的（包括Win7 SP1、Win8.1、Win10 1507、Win10 1511），请下载并安装<a href="https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe">.net 4.6.2环境</a><br>
														2.点击下载<a href="https://dl.doufu.in/Shadowsocks.7z">SS客户端</a>，解压<br>
														3.下载你的<a href="/user/getpcconf?is_mu=0&is_ss=1">专属配置文件</a>，复制到刚才的Shadowsocks文件夹里<br>
														4.运行Shadowsocks.exe<br>
														5.下载<a href="https://www.lanzous.com/b00c3zsfe" target="_blank">百分浏览器麻婆豆腐定制版</a>，解压，运行chrome.exe即可<br>
														6.后续使用代理需同时开启Shadowsocks（建议设置开机自启）</p>
														<p>Clash方案：<br>
														1.点击下载<a href="https://www.lanzous.com/b00c4wxif" target="_blank">Clash for Windows</a>，解压到一个文件夹<br>
														2.右键复制<a href="https://sub.doufu.in/sub?target=clash&config=https://p.doufu.in/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a><br>
														3.运行运行Clash for Windows.exe，打开主界面<br>
														4.点击左侧Profiles菜单，将刚刚复制的链接粘贴到顶部Download from a URL处，点击Download按钮<br>
														5.选中刚刚下载的sub配置<br>
														6.下载<a href="https://www.lanzous.com/b00c3zsfe" target="_blank">百分浏览器麻婆豆腐定制版</a>，解压，运行chrome.exe<br>
														7.点击浏览器右上角第一个的圆圈图标，选择“Clash模式”</p>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p>官方SS方案：<br>
														1.下载<a href="https://www.lanzous.com/b00c4v26b" target="_blank">ShadowsocksX-NG</a>，解压，运行<br>
														2.点击右上角的纸飞机图标，进入“服务器”-“服务器设置”，点左下方的加号<br>
														3.地址填写：s1.mpdf.in，如果用其它节点就把1改成别的数字<br>
														4.服务器端口填写：{$user->port}，服务器密码填写：{$user->passwd}，加密方式选择：xchacha20-ietf-poly1305<br>
														5.插件填写：obfs-local，插件选项填写：obfs=http;obfs-host=www.apple.com，确定<br>
														6.点击右上角纸飞机图标上的“打开Shadowsocks”即可</p>
														<p>ClashX方案：<br>
														1.下载<a href="https://www.lanzous.com/b00c4v2mh" target="_blank">ClashX</a>，安装<br>
														2.右键复制<a href="https://sub.doufu.in/sub?target=clash&config=https://p.doufu.in/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a><br>
														3.运行ClashX，第一次要输入系统密码<br>
														4.在右上角ClashX图标上选择“配置”-“托管配置”-“管理”<br>
														5.点击“添加”，将刚才复制的那串链接填进去，点击“确定”<br>
														6.刚才添加的配置出现更新时间后，关掉托管管理窗口<br>
														7.点击右上角ClashX图标上的“设置为系统代理”即可</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>由于苹果频繁封禁公共账号，故不再此处提供公共账号，请关注QQ群内动态。建议自行注册美区/港区/日区等账号，并参考网上的App购买攻略</p>
														<p>shadowrocket方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/shadowrocket/id932747118">Shadowrocket</a><br>
														2.点击<a href="{$ss_url_all}">这个链接</a>，选择“打开”<br>
														3.打开Shadowrocket，点击顶部“未连接”旁边的开关，第一次会弹出权限提示，点Allow，需要指纹授权一次</p>
														<p>Quantumult方案：<br>
														1.请确保你已经安装了<a href="https://itunes.apple.com/us/app/quantumult/id1252015438?mt=8">Quantumult</a><br>
														2.长按<a href="/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Quantumult，进入底部的“设置”菜单，滑到页面下方，点击“下载配置文件”，把刚才复制的配置粘贴进去，点击“好”<br>
														4.下载配置成功后会显示出来，点击“保存”<br>
														5.回到Quantumult首页，点击顶部右上角的开关，第一次会弹出权限提示，点Allow，需要指纹授权一次</p>
														<p>Quantumult X方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/quantumult-x/id1443988620">Quantumult X</a><br>
														2.长按<a href="https://sub.doufu.in/sub?target=quanx&list=true&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开Quantumult X，点击右下方的圆形按钮，进入设置页<br>
														4.点击顶部的“引用（订阅）”，将刚才复制的链接粘贴进去，点击“确定”<br>
														5.回到首页，长按右下方的圆形按钮，选择第二个按钮（同时含有三个颜色的那个）<br>
														6.点击顶部右上角的开关，第一次会弹出权限提示，点Allow，需要指纹授权一次</p>
														<p>Surge方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/surge-4/id1442620678">Surge</a><br>
														2.长按<a href="https://sub.doufu.in/sub?target=surge&ver=4&config=https://p.doufu.in/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开App，导入该订阅地址</p>
														<p>Loon方案：<br>
														1.请确保你已经安装了<a href="https://apps.apple.com/us/app/loon/id1373567447">Loon</a><br>
														2.长按<a href="https://sub.doufu.in/sub?target=loon&config=https://p.doufu.in/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>（不是点击，是长按！），点击“拷贝”<br>
														3.打开App，导入该订阅地址</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p>官方SS方案：<br>
														1.下载<a href="https://dl.doufu.in/shadowsocks.apk">SS客户端</a>，安装<br>
														2.下载<a href="https://dl.doufu.in/simple-obfs.apk">Obfs插件</a>，安装，部分国产手机需要给这个插件设置关联启动权限<br>
														3.在手机浏览器中长按<a href="{$ss_url_all}">这个链接</a>（不是点击，是长按！），选择“复制链接”<br>
														4.打开安装好的Shadowsocks，点右上角的加号，选择“从剪贴板导入”<br>
														5.选中一个节点（如节点1，自带的198开头的节点是假的！）<br>
														6.点击节点最右侧的编辑按钮（铅笔状），找到“路由”，选择“绕过局域网及中国大陆地址”，点右上角的对勾保存（此步骤每个节点都需要操作一次）<br>
														7.点击主界面下方的开关，第一次需要授权VPN权限</p>
														<p>Surfboard方案：<br>
														1.下载<a href="https://dl.doufu.in/Surfboard.apk">Surfboard客户端</a>，安装<br>
														2.在手机浏览器中长按<a href="/link/{$ios_token}?is_ss=1">这个链接</a>，选择“复制链接网址”<br>
														3.运行Surfboard，进入底部第三个“配置”标签<br>
														4.点加号，选择第一个“使用链接下载”，里面会出现刚才复制的那个地址，点击“下载”<br>
														5.在出来的编辑配置界面点右下角的保存按钮，“好的”<br>
														6.点击底部第一个“切换”标签，点右下角的开关，第一次需要授权VPN权限</p>
														<p>Clash方案：<br>
														1.下载<a href="https://dl.doufu.in/Clash.apk">Surfboard客户端</a>，安装<br>
														2.在手机浏览器中长按<a href="https://sub.doufu.in/sub?target=clash&config=https://p.doufu.in/sub.ini&url={$baseUrl}/link/{$ios_token}?is_ss=1">这个链接</a>，选择“复制链接网址”<br>
														3.运行Clash，进入顶部部第二个“配置”按钮<br>
														4.点击“新配置”，选择“URL”<br>
														5.在出来的界面点击“URL”，将刚刚复制的链接粘贴进去，点确认<br>
														6.点击右上角的保存按钮，在配置页面选中刚刚创建的配置<br>
														7.返回首页，点击最顶上“已停止”按钮，第一次需要授权VPN权限</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>使用MTK处理器的路由器（如极路由、小米mini、newifi mini等）可以参考Padavan方案，使用博通处理器的路由器（如华硕ac68u、网件R6400等）可以参考梅林方案。</p>
														<p>Padavan方案：<br>
														1.刷入<a href="https://opt.cn2qq.com/padavan/" target="_blank">Padavan固件</a>，刷机教程自行搜索<br>
														2.进入路由器后台，点首页中间第四个纸飞机图标，点击“转到详细设置”<br>
														3.在下方的主服务器处填写：s1.mpdf.in，如果用其它节点就填具体的数字<br>
														4.服务器端口填写：{$user->port}，服务器密码填写：{$user->passwd}，加密方式选择：xchacha20-ietf-poly1305<br>
														5.插件名称填写：obfs-local，插件参数填写：obfs=http;obfs-host=www.apple.com<br>
														6.页面上方的“代理类型”确保是SS，打开顶上的ShadowSocks开关，点一次“应用本页面设置”</p>
														<p>梅林方案：<br>
														1.刷入<a href="http://koolshare.cn/forum-96-1.html">梅林固件</a>，刷机教程自行搜索<br>
														2.下载<a href="https://github.com/hq450/fancyss">SS插件</a>到电脑<br>
														3.进入路由器后台，打开软件中心，点离线安装，选择下载的gz文件，上传并安装<br>
														4.后续操作参考其它平台，切记加密方式选择xchacha20-ietf-poly1305</p>
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



							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">签到获取流量</p>
											<p>流量不会重置，可以通过签到获取流量。</p>

											<p>每次签到可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>

											<p>每天可以签到一次。您可以点击按钮或者摇动手机来签到。</p>

											<p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>

											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能签到</a></p>
											{/if}
										</div>
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