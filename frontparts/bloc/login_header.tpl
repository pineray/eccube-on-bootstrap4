<!--{strip}-->
    <form class="form-inline my-2 my-lg-0" name="header_login_form" id="header_login_form" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php"<!--{if !$tpl_login}--> onsubmit="return eccube.checkLoginFormInputted('header_login_form')"<!--{/if}-->>
        <input type="hidden" name="mode" value="login" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
        <!--{if $tpl_login}-->
            <div class="form-col-label text-light">
                ようこそ <span class="user_name"><!--{$tpl_name1|h}--> <!--{$tpl_name2|h}--> 様</span>
                <!--{if $smarty.const.USE_POINT !== false}-->
                    / 所持ポイント: <span class="point"> <!--{$tpl_user_point|n2s|default:0}--> pt</span>&nbsp;&nbsp;
                <!--{/if}-->
            </div>
            <!--{if !$tpl_disable_logout}-->
                <input type="submit" class="btn btn-outline-secondary btn-sm" onclick="eccube.fnFormModeSubmit('header_login_form', 'logout', '', ''); return false;" value="ログアウト" />
            <!--{/if}-->
        <!--{else}-->
            <input type="text" class="box150 form-control mr-sm-2" name="login_email" value="<!--{$tpl_login_email|h}-->" style="ime-mode: disabled;" placeholder="メールアドレス" aria-label="メールアドレス" />
            <div class="form-check form-check-inline my-2 my-sm-0">
                <input class="form-check-input" type="checkbox" name="login_memory" id="header_login_memory" value="1" <!--{$tpl_login_memory|sfGetChecked:1}-->>
                <label class="form-check-label text-light" for="header_login_memory">記憶</label>
            </div>
            <input type="password" class="box100 form-control mr-sm-2" name="login_pass" placeholder="パスワード" aria-label="パスワード" />
            <input type="submit" class="btn btn-outline-secondary my-2 my-sm-0" value="ログイン" />
        <!--{/if}-->
    </form>
<!--{/strip}-->
