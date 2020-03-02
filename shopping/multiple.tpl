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
        <div class="alert alert-info">
            各商品のお届け先を選択してください。<br>
            （※数量の合計は、カゴの中の数量と合わせてください。）<br>
            <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」より追加登録してください。<br>
            <!--{/if}-->
            <small>※最大<!--{$smarty.const.DELIV_ADDR_MAX|h}-->件まで登録できます。</small>
        </div>

        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
            <div class="addbtn mb-3 row">
                <div class="col-12 col-md-6 col-lg-4">
                    <a class="btn btn-secondary btn-block btn-sm" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','600','640'); return false;">
                        <i class="fas fa-plus"></i> 新しいお届け先を追加する
                    </a>
                </div>
            </div>
        <!--{/if}-->
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <input type="hidden" name="line_of_num" value="<!--{$arrForm.line_of_num.value}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <!--{section name=line loop=$arrForm.line_of_num.value}-->
                <!--{assign var=index value=$smarty.section.line.index}-->
                <div class="card my-2">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-3">
                                <a
                                    <!--{if $arrForm.main_image[$index]|strlen >= 1}--> href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrForm.main_image.value[$index]|sfNoImageMainList|h}-->" class="expansion" target="_blank"
                                    <!--{/if}-->
                                >
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrForm.main_list_image.value[$index]|sfNoImageMainList|h}-->" class="img-fluid" alt="<!--{$arrForm.name.value[$index]|h}-->" /></a>
                            </div>
                            <div class="col">
                                <!--{* 商品名 *}--><strong><!--{$arrForm.name.value[$index]|h}--></strong><br />
                                <!--{if $arrForm.classcategory_name1.value[$index] != ""}-->
                                    <!--{$arrForm.class_name1.value[$index]|h}-->：<!--{$arrForm.classcategory_name1.value[$index]|h}--><br />
                                <!--{/if}-->
                                <!--{if $arrForm.classcategory_name2.value[$index] != ""}-->
                                    <!--{$arrForm.class_name2.value[$index]|h}-->：<!--{$arrForm.classcategory_name2.value[$index]|h}--><br />
                                <!--{/if}-->
                                <!--{$arrForm.price_inctax.value[$index]|n2s}-->円
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <!--{assign var=key value="quantity"}-->
                                    <label for="<!--{$key}-->-<!--{$index}-->">数量</label>
                                    <input type="number" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" class="box40 form-control<!--{if $arrErr[$key][$index] != ''}-->is-invalid<!--{/if}--> w-100" min="0" maxlength="<!--{$arrForm[$key].length}-->" />
                                    <!--{if $arrErr[$key][$index] != ''}-->
                                        <div class="invalid-feedback"><!--{$arrErr[$key][$index]}--></div>
                                    <!--{/if}-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <input type="hidden" name="cart_no[<!--{$index}-->]" value="<!--{$index}-->" />
                        <!--{assign var=key value="product_class_id"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="name"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="class_name1"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="class_name2"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="classcategory_name1"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="classcategory_name2"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="main_image"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="main_list_image"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="price"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="price_inctax"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$index}-->]" value="<!--{$arrForm[$key].value[$index]|h}-->" />
                        <!--{assign var=key value="shipping"}-->
                        <select class="form-control<!--{if strlen($arrErr[$key][$index]) >= 1}--> is-invalid<!--{/if}-->" name="<!--{$key}-->[<!--{$index}-->]">
                            <!--{html_options options=$addrs selected=$arrForm[$key].value[$index]}-->
                        </select>
                        <!--{if strlen($arrErr[$key][$index]) >= 1}-->
                            <div class="invalid-feedback"><!--{$arrErr[$key][$index]}--></div>
                        <!--{/if}-->
                    </div>
                </div>
            <!--{/section}-->

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <input type="submit" class="btn btn-primary btn-block" value="選択したお届け先に送る" name="send_button" id="send_button" />
                    </div>
                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                        <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-secondary btn-block">
                            戻る
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
