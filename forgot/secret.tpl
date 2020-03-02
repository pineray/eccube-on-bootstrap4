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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="パスワードを忘れた方(確認ページ)"}-->

<div id="window_area">
    <h2>パスワードの再発行 秘密の質問の確認</h2>
    <p class="information">
        ご登録時に入力した下記質問の答えを入力して「次へ」ボタンをクリックしてください。<br />
        ※下記質問の答えをお忘れになられた場合は、<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentitiy'}--></a>までご連絡ください。
    </p>
    <div class="message alert alert-warning">
        【重要】新しくパスワードを発行いたしますので、お忘れになったパスワードはご利用できなくなります。
    </div>
    <form action="?" method="post" name="form1">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="secret_check" />

        <!--{foreach key=key item=item from=$arrForm}-->
            <!--{if $key ne 'reminder_answer'}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->

        <div id="completebox">
            <div class="form-group">
                <label for="reminder_answer"><!--{$arrReminder[$arrForm.reminder]}--></label>
                <input type="text" id="reminder_answer" name="reminder_answer" value="" class="box300 form-control<!--{if $arrErr.reminder || $arrErr.reminder_answer || $errmsg}--> is-invalid<!--{/if}-->" />
                <!--{if $arrErr.reminder || $arrErr.reminder_answer || $errmsg}-->
                    <div class="invalid-feedback">
                        <!--{$arrErr.reminder}--><!--{$arrErr.reminder_answer}--><!--{$errmsg}-->
                    </div>
                <!--{/if}-->
            </div>
        </div>
        <div class="btn_area">
            <input type="submit" class="btn btn-primary btn-block" value="次へ" name="next" id="next" />
        </div>
    </form>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
