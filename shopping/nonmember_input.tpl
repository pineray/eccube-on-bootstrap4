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
    <div id="undercolumn_customer">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step1.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <div class="information alert alert-info">
            下記項目にご入力ください。「<span class="attention">※</span>」印は入力必須項目です。<br />
            <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                入力後、一番下の「上記のお届け先のみに送る」<br/>
                または「複数のお届け先に送る」ボタンをクリックしてください。
            <!--{else}-->
                入力後、一番下の「次へ」ボタンをクリックしてください。
            <!--{/if}-->
        </div>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="nonmember_confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <div>
                <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=2 emailMobile=false prefix="order_"}-->
                <div class="alert alert-warning mt-4">
                    <div class="form-check">
                        <!--{assign var=key value="deliv_check"}-->
                        <input class="form-check-input" type="checkbox" name="<!--{$key}-->" value="1" onclick="eccube.toggleDeliveryForm();" <!--{$arrForm[$key].value|sfGetChecked:1}--> id="deliv_label" />
                        <label class="form-check-label" for="deliv_label"><span class="attention">お届け先を指定</span>　※上記に入力された住所と同一の場合は省略可能です。</label>
                    </div>
                </div>
                <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=1 emailMobile=false prefix="shipping_"}-->
            </div>

            <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                <p class="text-center mt-5">この商品を複数のお届け先に送りますか？</p>
            <!--{/if}-->
            <div class="btn_area">
                <div class="row justify-content-center">
                    <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                        <div class="col-12 col-md-6">
                            <input type="submit" class="btn btn-primary w-100" value="上記のお届け先のみ" name="singular" id="singular" />
                        </div>
                        <div class="col-12 col-md-6">
                            <a class="btn btn-primary w-100" href="javascript:;" onclick="eccube.setModeAndSubmit('multiple', '', ''); return false">
                                複数のお届け先に送る
                            </a>
                        </div>
                    <!--{else}-->
                        <div class="col-12 col-md-6">
                            <input type="submit" class="btn btn-primary w-100" value="次へ" name="singular" id="singular" />
                        </div>
                    <!--{/if}-->
                </div>
            </div>
        </form>
    </div>
</div>
