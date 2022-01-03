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
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <div id="undercolumn_contact">
        <p>下記入力内容で送信してもよろしいでしょうか？<br />
            よろしければ、一番下の「完了ページへ」ボタンをクリックしてください。</p>
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{foreach key=key item=item from=$arrForm}-->
                <!--{if $key ne 'mode'}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->
            <dl class="row">
                <dt class="col-12 col-sm-3">お名前</dt>
                <dd class="col-12 col-sm-9"><!--{$arrForm.name01.value|h}-->　<!--{$arrForm.name02.value|h}--></dd>
                <dt class="col-12 col-sm-3">お名前(フリガナ)</dt>
                <dd class="col-12 col-sm-9"><!--{$arrForm.kana01.value|h}-->　<!--{$arrForm.kana02.value|h}--></dd>
                <dt class="col-12 col-sm-3">郵便番号</dt>
                <dd class="col-12 col-sm-9">
                    <!--{if strlen($arrForm.zip01.value) > 0 && strlen($arrForm.zip02.value) > 0}-->
                        〒<!--{$arrForm.zip01.value|h}-->-<!--{$arrForm.zip02.value|h}-->
                    <!--{/if}-->
                </dd>
                <dt class="col-12 col-sm-3">住所</dt>
                <dd class="col-12 col-sm-9"><!--{$arrPref[$arrForm.pref.value]}--><!--{$arrForm.addr01.value|h}--><!--{$arrForm.addr02.value|h}--></dd>
                <dt class="col-12 col-sm-3">電話番号</dt>
                <dd class="col-12 col-sm-9">
                    <!--{if strlen($arrForm.tel01.value) > 0 && strlen($arrForm.tel02.value) > 0 && strlen($arrForm.tel03.value) > 0}-->
                        <!--{$arrForm.tel01.value|h}-->-<!--{$arrForm.tel02.value|h}-->-<!--{$arrForm.tel03.value|h}-->
                    <!--{/if}-->
                </dd>
                <dt class="col-12 col-sm-3">メールアドレス</dt>
                <dd class="col-12 col-sm-9"><a href="mailto:<!--{$arrForm.email.value|escape:'hex'}-->"><!--{$arrForm.email.value|escape:'hexentity'}--></a></dd>
                <dt class="col-12 col-sm-3">お問い合わせ内容</dt>
                <dd class="col-12 col-sm-9"><!--{$arrForm.contents.value|h|nl2br}--></dd>
            </dl>
            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <input type="submit" class="btn btn-primary w-100" value="完了ページへ" name="send" id="send" />
                    </div>
                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                        <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" class="btn btn-secondary w-100">
                            戻る
                        </a>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
