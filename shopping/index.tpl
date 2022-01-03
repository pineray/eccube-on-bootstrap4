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

<div id="undercolumn">
    <div id="undercolumn_login">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <div class="row">
            <div class="login_area col-12 col-md-6 mb-4 mb-md-0">
                <form name="member_form" id="member_form" method="post" action="?" onsubmit="return eccube.checkLoginFormInputted('member_form')">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="mode" value="login" />

                    <h3><i class="bi bi-arrow-right-circle-fill"></i> アカウントをお持ちの方</h3>
                    <p class="inputtext">会員の方は、登録時に入力されたメールアドレスとパスワードでログインしてください。</p>
                    <div class="inputbox card bg-light">
                        <div class="card-body">
                            <div class="formlist clearfix form-group">
                                <!--{assign var=key value="login_email"}-->
                                <label for="<!--{$key}-->">メールアドレス</label>
                                <input type="text" id="<!--{$key}-->" name="<!--{$key}-->" value="<!--{$tpl_login_email|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" />
                                <!--{if $arrErr[$key]}-->
                                    <div class="invalid-feedback"><!--{$arrErr[$key]}--></div>
                                <!--{/if}-->
                                <div class="login_memory form-check">
                                    <!--{assign var=key value="login_memory"}-->
                                    <input type="checkbox" name="<!--{$key}-->" value="1"<!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" class="form-check-input<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" />
                                    <label for="login_memory" class="form-check-label">メールアドレスを記憶させる</label>
                                </div>
                            </div>
                            <div class="formlist clearfix form-group">
                                <!--{assign var=key value="login_pass"}-->
                                <label for="<!--{$key}-->">パスワード</label>
                                <input type="password" id="<!--{$key}-->" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box300 form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" />
                                <!--{if $arrErr[$key]}-->
                                    <div class="invalid-feedback"><!--{$arrErr[$key]}--></div>
                                <!--{/if}-->
                            </div>
                            <input type="submit" class="btn btn-primary w-100" value="ログイン" name="log" id="log" />
                        </div>
                    </div>
                    <div class="alert alert-warning mt-3">
                        ※パスワードを忘れた方は<a href="<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="eccube.openWindow('<!--{$smarty.const.HTTPS_URL}-->forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460',{scrollbars:'no',resizable:'no'}); return false;" target="_blank">こちら</a>からパスワードの再発行を行ってください。<br />
                        ※メールアドレスを忘れた方は、お手数ですが、<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">お問い合わせページ</a>からお問い合わせください。
                    </div>
                </form>
            </div>
            <div class="login_area col-12 col-md-6 mb-4 mb-md-0">
                <h3><i class="bi bi-arrow-right-circle-fill"></i> 会員登録をして購入</h3>
                <p class="inputtext">会員登録をすると便利なMyページをご利用いただけます。<br />
                    また、ログインするだけで、毎回お名前や住所などを入力することなくスムーズにお買い物をお楽しみいただけます。
                </p>
                <div class="inputbox card bg-light mb-4">
                    <div class="btn_area card-body">
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" class="btn btn-danger w-100">
                            会員登録をする
                        </a>
                    </div>
                </div>

                <h3><i class="bi bi-arrow-right-circle-fill"></i> 会員登録をせずに購入</h3>
                <p class="inputtext">会員登録をせずに購入手続きをされたい方は、下記よりお進みください。</p>
                <form name="member_form2" id="member_form2" method="post" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="mode" value="nonmember" />
                    <div class="inputbox card bg-light mb-4">
                        <div class="btn_area card-body">
                            <input type="submit" class="btn btn-primary w-100" value="購入手続きへ" name="buystep" id="buystep" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
