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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="お客様の声書き込み（確認ページ）"}-->

<div id="window_area">
    <h2 class="title">お客様の声書き込み</h2>
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <!--{foreach from=$arrForm key=key item=item}-->
            <!--{if $key ne "mode"}-->
                <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->

        <dl class="row">
            <dt class="col-12 col-sm-3">商品名</dt>
            <dd class="col-12 col-sm-9"><!--{$arrForm.name|h}--></dd>
            <dt class="col-12 col-sm-3">投稿者名</dt>
            <dd class="col-12 col-sm-9"><!--{$arrForm.reviewer_name|h}--></dd>
            <dt class="col-12 col-sm-3">投稿者URL</dt>
            <dd class="col-12 col-sm-9"><!--{$arrForm.reviewer_url|h}--></dd>
            <dt class="col-12 col-sm-3">性別</dt>
            <dd class="col-12 col-sm-9"><!--{if $arrForm.sex eq 1}-->男性<!--{elseif $arrForm.sex eq 2}-->女性<!--{/if}--></dd>
            <dt class="col-12 col-sm-3">おすすめレベル</dt>
            <dd class="col-12 col-sm-9"><span class="recommend_level"><!--{$arrRECOMMEND[$arrForm.recommend_level]}--></span></dd>
            <dt class="col-12 col-sm-3">タイトル</dt>
            <dd class="col-12 col-sm-9"><!--{$arrForm.title|h}--></dd>
            <dt class="col-12 col-sm-3">コメント</dt>
            <dd class="col-12 col-sm-9"><!--{$arrForm.comment|h|nl2br}--></dd>
        </dl>
        <div class="btn_area py-4">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <input type="submit" class="btn btn-primary btn-block" value="完了ページへ" name="send" id="send" />
                </div>
                <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                    <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" class="btn btn-secondary btn-block">
                        戻る
                    </a>
                </div>
            </div>
        </div>
    </form>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
