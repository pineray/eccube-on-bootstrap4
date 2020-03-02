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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="パスワードを忘れた方(入力ページ)"}-->

<div id="window_area">
    <h2>パスワードの再発行</h2>
    <p class="information">ご登録時のメールアドレスと、ご登録されたお名前を入力して「次へ」ボタンをクリックしてください。</p>
    <div class="alert alert-warning">※新しくパスワードを発行いたしますので、お忘れになったパスワードはご利用できなくなります。</div>
    <form action="?" method="post" name="form1">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="mail_check" />

        <div id="forgot">
            <div class="contents">
                <fieldset class="mailaddres form-group">
                    <div class="row">
                        <div class="col-12 col-sm-3 col-form-label">メールアドレス<span class="attention">※</span></div>
                        <div class="col">
                            <!--{assign var=key1 value="email"}-->
                            <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$tpl_login_email|h}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                            <!--{if $arrErr[$key1]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key1]}-->
                                </div>
                            <!--{/if}-->
                        </div>
                    </div>
                </fieldset>
                <fieldset class="name form-group">
                    <div class="row">
                        <legend class="col-12 col-sm-3 col-form-label">お名前<span class="attention">※</span></legend>
                        <div class="col">
                            <!--{assign var=key1 value="name01"}-->
                            <!--{assign var=key2 value="name02"}-->
                            <div class="form-row<!--{if $arrErr[$key1] || $arrErr[$key2] || $errmsg}--> is-invalid<!--{/if}-->">
                                <div class="col">
                                    <label for="<!--{$key1}-->">姓</label>
                                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                                </div>
                                <div class="col">
                                    <label for="<!--{$key2}-->">名</label>
                                    <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                                </div>
                            </div>
                            <!--{if $arrErr[$key1] || $arrErr[$key2] || $errmsg}-->
                                <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$errmsg}--></div>
                            <!--{/if}-->
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="btn_area">
            <input type="submit" class="btn btn-primary btn-block" value="次へ" name="next" id="next" />
        </div>
    </form>
</div>
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->

