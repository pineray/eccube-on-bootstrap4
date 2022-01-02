<!--{*
 * EC-CUBE on Bootstrap4. This file is part of EC-CUBE
 *
 * Copyright(c) PineRay. All Rights Reserved.
*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<!--{strip}-->
    <div class="block_outer">
        <div id="login_area" class="card">
            <h3 class="card-header"><i class="bi bi-box-arrow-in-right"></i> ログイン</h3>
            <form name="login_form" id="login_form" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php"<!--{if $tpl_login}--> onsubmit="return eccube.checkLoginFormInputted('login_form')"<!--{/if}-->>
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="login" />
                <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
                <div class="block_body card-body">
                    <!--{if $tpl_login}-->
                        <p>ようこそ<br>
                            <span class="user_name"><!--{$tpl_name1|h}--> <!--{$tpl_name2|h}--> 様</span>
                            <!--{if $smarty.const.USE_POINT !== false}-->
                                <br>所持ポイント：<span class="point"> <!--{$tpl_user_point|n2s|default:0}--> pt</span>
                            <!--{/if}-->
                        </p>
                        <!--{if !$tpl_disable_logout}-->
                            <input type="submit" class="btn btn-block btn-secondary" onclick="eccube.fnFormModeSubmit('login_form', 'logout', '', ''); return false;" value="ログアウト" />
                        <!--{/if}-->
                    <!--{else}-->
                        <div class="formlist mb-3">
                            <label for="login-form-email">メールアドレス</label>
                            <input type="text" id="login-form-email" name="login_email" class="box140 form-control" value="<!--{$tpl_login_email|h}-->" style="ime-mode: disabled;" />
                            <div class="mini form-check">
                                <input type="checkbox" name="login_memory" id="login_memory" value="1" class="form-check-input" <!--{$tpl_login_memory|sfGetChecked:1}--> />
                                <label for="login_memory" class="form-check-label"><span>コンピューターに記憶する</span></label>
                            </div>
                        </div>
                        <div class="formlist mb-3">
                            <label for="login-form-password" class="password">パスワード</label>
                            <input type="password" id="login-form-password" name="login_pass" class="box140 form-control" />
                            <p class="mini">
                                <small><a href="<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="eccube.openWindow('<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','480'); return false;" target="_blank">パスワードを忘れた方はこちら</a></small>
                            </p>
                        </div>
                        <input type="submit" class="btn btn-block btn-secondary" value="ログイン" />
                    <!--{/if}-->
                </div>
            </form>
        </div>
    </div>
<!--{/strip}-->
