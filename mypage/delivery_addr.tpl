<!--{*
/*
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
 */
*}-->
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="新しいお届け先の追加・変更"}-->

<div id="window_area">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <p>下記項目にご入力ください。「<span class="attention">※</span>」印は入力必須項目です。<br />
        入力後、一番下の「登録する」ボタンをクリックしてください。</p>

    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="edit" />
        <input type="hidden" name="other_deliv_id" value="<!--{$smarty.session.other_deliv_id|h}-->" />
        <input type="hidden" name="ParentPage" value="<!--{$ParentPage}-->" />

        <div>
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=1 emailMobile=false prefix=""}-->
        </div>
        <div class="btn_area py-4">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <a class="btn btn-primary w-100" href="javascript:" onclick="eccube.setValueAndSubmit('form1', 'mode', 'edit'); return false;">
                        登録する
                    </a>
                </div>
            </div>
        </div>
    </form>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
