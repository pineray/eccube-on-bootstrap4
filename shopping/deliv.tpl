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
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step1.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <div id="address_area" class="clearfix">
            <div class="alert alert-info">
                下記一覧よりお届け先住所を選択して、「選択したお届け先に送る」ボタンをクリックしてください。<br>
                <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                    一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」より追加登録してください。<br>
                <!--{/if}-->
                <small>※最大<!--{$smarty.const.DELIV_ADDR_MAX|h}-->件まで登録できます。</small>
            </div>
            <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                <div class="add_multiple mb-3">
                    <a class="btn btn-outline-secondary w-100" href="javascript:;" onclick="eccube.setModeAndSubmit('multiple', '', ''); return false">
                        <i class="bi bi-boxes"></i> 複数のお届け先に送りますか？
                    </a>
                </div>
            <!--{/if}-->
        </div>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="customer_addr" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <input type="hidden" name="other_deliv_id" value="" />
            <!--{if $arrErr.deli != ""}-->
                <p class="attention"><!--{$arrErr.deli}--></p>
            <!--{/if}-->
            <div class="list-group">
                <!--{section name=cnt loop=$arrAddr}-->
                    <div class="list-group-item">
                        <div class="d-flex justify-content-between">
                            <div class="form-group form-check">
                                <!--{if $smarty.section.cnt.first}-->
                                    <input type="radio" class="form-check-input" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="-1" <!--{if $arrForm.deliv_check.value == "" || $arrForm.deliv_check.value == -1}--> checked="checked"<!--{/if}--> />
                                <!--{else}-->
                                    <input type="radio" class="form-check-input" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="<!--{$arrAddr[cnt].other_deliv_id}-->"<!--{if $arrForm.deliv_check.value == $arrAddr[cnt].other_deliv_id}--> checked="checked"<!--{/if}--> />
                                <!--{/if}-->
                                <label class="form-check-label" for="chk_id_<!--{$smarty.section.cnt.iteration}-->">
                                    <!--{if $smarty.section.cnt.first}-->
                                        会員登録住所
                                    <!--{else}-->
                                        追加登録住所
                                    <!--{/if}-->
                                </label>
                            </div>
                            <!--{if !$smarty.section.cnt.first}-->
                            <div class="btn-group btn-group-sm">
                                <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->','new_deiv','600','640'); return false;" class="btn btn-link">
                                    <i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span>
                                </a>
                                <a href="?" onclick="eccube.setModeAndSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false" class="btn btn-link">
                                    <i class="bi bi-trash"></i> <span class="d-none d-sm-inline">削除</span>
                                </a>
                            </div>
                            <!--{/if}-->
                        </div>
                        <div>
                            <!--{assign var=key1 value=$arrAddr[cnt].pref}-->
                            <!--{assign var=key2 value=$arrAddr[cnt].country_id}-->
                            <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                            <!--{$arrCountry[$key2]|h}--><br/>
                            <!--{/if}-->
                            <!--{$arrPref[$key1]|h}--><!--{$arrAddr[cnt].addr01|h}--><!--{$arrAddr[cnt].addr02|h}--><br />
                            <!--{$arrAddr[cnt].company_name|h}--> <!--{$arrAddr[cnt].name01|h}--> <!--{$arrAddr[cnt].name02|h}-->
                        </div>
                    </div>
                <!--{/section}-->
                <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                    <a class="list-group-item list-group-item-action" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','600','640'); return false;">
                        <i class="bi bi-plus-lg"></i> 新しいお届け先を追加する
                    </a>
                <!--{/if}-->
            </div>

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <input type="submit" class="btn btn-primary w-100" value="選択したお届け先に送る" name="send_button" id="send_button" />
                    </div>
                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                        <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-secondary w-100">
                            戻る
                        </a>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
