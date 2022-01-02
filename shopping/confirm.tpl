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

<script type="text/javascript">//<![CDATA[
    var sent = false;

    function fnCheckSubmit() {
        if (sent) {
            alert("只今、処理中です。しばらくお待ち下さい。");
            return false;
        }
        sent = true;
        return true;
    }
//]]></script>

<!--CONTENTS-->
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step3.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <p class="information">下記ご注文内容で送信してもよろしいでしょうか？<br />
            よろしければ、「<!--{if $use_module}-->次へ<!--{else}-->ご注文完了ページへ<!--{/if}-->」ボタンをクリックしてください。</p>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

            <h3 class="mt-4 d-flex justify-content-between">
               <span>ご注文内容</span>
               <a href="<!--{$smarty.const.CART_URL}-->" class="btn btn-link"><i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span></a>
            </h3>
            <div class="list-group list-group-flush">
                <!--{foreach from=$arrCartItems item=item}-->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-3 col-md-2 text-center">
                            <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                <a class="expansion" target="_blank" href="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->">
                            <!--{/if}-->
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$item.productsClass.name|h}-->" class="img-fluid" />
                            <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                </a>
                            <!--{/if}-->
                            </div>
                            <div class="col">
                                <div class="cart-item-title">
                                    <!--{* 商品名 *}--><strong><!--{$item.productsClass.name|h}--></strong>
                                    <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                        <div><small><!--{$item.productsClass.class_name1|h}-->：<!--{$item.productsClass.classcategory_name1|h}--></small></div>
                                    <!--{/if}-->
                                    <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                        <div><small><!--{$item.productsClass.class_name2|h}-->：<!--{$item.productsClass.classcategory_name2|h}--></small></div>
                                    <!--{/if}-->
                                </div>
                                <div class="cart-item-price">
                                    価格: <!--{$item.price_inctax|n2s|h}-->円
                                </div>
                                <hr class="d-none d-md-block">
                                <div class="justify-content-between d-none d-md-flex">
                                    <div>数量: <!--{$item.quantity|h}--></div>
                                    <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                                </div>
                            </div>
                        </div>
                        <hr class="d-block d-md-none">
                        <div class="justify-content-between d-flex d-md-none">
                            <div>数量: <!--{$item.quantity|h}--></div>
                            <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                        </div>
                    </div>
                <!--{/foreach}-->
                <div class="list-group-item d-flex justify-content-between">
                    <div>小計</div>
                    <div><!--{$tpl_total_inctax[$cartKey]|n2s}-->円</div>
                </div>
                <!--{if $smarty.const.USE_POINT !== false}-->
                    <!--{if $arrForm.use_point > 0}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <div>値引き（ポイントご使用時）</div>
                        <div>
                            <!--{assign var=discount value="`$arrForm.use_point*$smarty.const.POINT_VALUE`"}-->
                            -<!--{$discount|n2s|default:0}-->円</div>
                    </div>
                    <!--{/if}-->
                <!--{/if}-->
                <div class="list-group-item d-flex justify-content-between">
                    <div>送料</div>
                    <div><!--{$arrForm.deliv_fee|n2s}-->円</div>
                </div>
                <div class="list-group-item d-flex justify-content-between">
                    <div>手数料</div>
                    <div><!--{$arrForm.charge|n2s}-->円</div>
                </div>
                <div class="list-group-item d-flex justify-content-between list-group-item-info">
                    <div>合計</div>
                    <div><span class="price"><!--{$arrForm.payment_total|n2s}-->円</span></div>
                </div>
            </div>

            <!--{* ログイン済みの会員のみ *}-->
            <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                <div class="delivname list-group mt-3">
                    <div class="list-group-item d-flex justify-content-between">
                        <div>ご注文前のポイント</div>
                        <div><!--{$tpl_user_point|n2s|default:0}-->Pt</div>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        <div>ご使用ポイント</div>
                        <div>-<!--{$arrForm.use_point|n2s|default:0}-->Pt</div>
                    </div>
                    <!--{if $arrForm.birth_point > 0}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <div>お誕生月ポイント</div>
                        <div>+<!--{$arrForm.birth_point|n2s|default:0}-->Pt</div>
                    </div>
                    <!--{/if}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <div>今回加算予定のポイント</div>
                        <div>+<!--{$arrForm.add_point|n2s|default:0}-->Pt</div>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                    <!--{assign var=total_point value="`$tpl_user_point-$arrForm.use_point+$arrForm.add_point`"}-->
                        <div>加算後のポイント</div>
                        <div><!--{$total_point|n2s}-->Pt</div>
                    </div>
                </div>
            <!--{/if}-->
            <!--{* ログイン済みの会員のみ *}-->

            <!--{* ▼注文者 *}-->
            <h3 class="mt-4 d-flex justify-content-between">
                <span>ご注文者</span>
                <!--{if !$smarty.session.customer}-->
                    <a href="./?mode=nonmember" class="btn btn-link"><i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span></a>
                <!--{else}-->
                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/change.php" class="btn btn-link"><i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span></a>
                <!--{/if}-->
            </h3>
            <div class="customer card">
                <div class="card-body">
                    〒<!--{$arrForm.order_zip01|h}-->-<!--{$arrForm.order_zip02|h}--><br/>
                    <!--{$arrPref[$arrForm.order_pref]}--><!--{$arrForm.order_addr01|h}--><!--{$arrForm.order_addr02|h}--><br />
                    <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                        <!--{$arrCountry[$arrForm.order_country_id]|h}--><br/>
                        ZIPCODE：<!--{$arrForm.order_zipcode|h}--><br/>
                    <!--{/if}-->
                    <!--{if $arrForm.order_company_name}-->
                        会社名：<!--{$arrForm.order_company_name|h}--><br />
                        担当者：<!--{$arrForm.order_name01|h}--> <!--{$arrForm.order_name02|h}--><br />
                    <!--{else}-->
                        <!--{$arrForm.order_name01|h}--> <!--{$arrForm.order_name02|h}-->
                        （<!--{$arrForm.order_kana01|h}--> <!--{$arrForm.order_kana02|h}-->）<br />
                    <!--{/if}-->
                    TEL：<!--{$arrForm.order_tel01}-->-<!--{$arrForm.order_tel02}-->-<!--{$arrForm.order_tel03}--><br />
                    <!--{if $arrForm.order_fax01 > 0}-->
                            FAX：<!--{$arrForm.order_fax01}-->-<!--{$arrForm.order_fax02}-->-<!--{$arrForm.order_fax03}--><br />
                    <!--{/if}-->
                    EMAIL：<!--{$arrForm.order_email|h}--><br />
                    性別：<!--{$arrSex[$arrForm.order_sex]|h}--><br />
                    職業：<!--{$arrJob[$arrForm.order_job]|default:'(未登録)'|h}--><br />
                    生年月日：<!--{$arrForm.order_birth|regex_replace:"/ .+/":""|regex_replace:"/-/":"/"|default:'(未登録)'|h}-->
                </div>
            </div>

            <!--{* ▼お届け先 *}-->
            <!--{if $arrShipping}-->
                <h3 class="mt-4 d-flex justify-content-between">
                    <span>お届け先<!--{if $is_multiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></span>
                    <a href="./payment.php?mode=return" class="btn btn-link"><i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span></a>
                </h3>
            <!--{/if}-->
            <!--{foreach item=shippingItem from=$arrShipping name=shippingItem}-->
                <div class="card">
                    <!--{if $is_multiple}-->
                        <div class="card-header">お届け先<!--{$smarty.foreach.shippingItem.iteration}--></div>
                    <!--{/if}-->

                    <div class="delivname list-group list-group-flush">
                        <div class="list-group-item">
                            〒<!--{$shippingItem.shipping_zip01|h}-->-<!--{$shippingItem.shipping_zip02|h}--><br />
                            <!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}--><br />
                            <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                                <!--{$arrCountry[$shippingItem.shipping_country_id]|h}-->
                                &nbsp;ZIPCODE：<!--{$shippingItem.shipping_zipcode|h}--><br />
                            <!--{/if}-->
                            <!--{if $shippingItem.shipping_company_name}-->
                                会社名：<!--{$shippingItem.shipping_company_name|h}--><br />
                                担当者：<!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}--><br />
                            <!--{else}-->
                                お名前：<!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}-->（<!--{$shippingItem.shipping_kana01|h}--> <!--{$shippingItem.shipping_kana02|h}-->）<br />
                            <!--{/if}-->
                            TEL：<!--{$shippingItem.shipping_tel01}-->-<!--{$shippingItem.shipping_tel02}-->-<!--{$shippingItem.shipping_tel03}--><br />
                            <!--{if $shippingItem.shipping_fax01 > 0}-->
                                FAX：<!--{$shippingItem.shipping_fax01}-->-<!--{$shippingItem.shipping_fax02}-->-<!--{$shippingItem.shipping_fax03}--><br />
                            <!--{/if}-->
                        </div>
                        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-12 col-sm-6">
                                        <strong>お届け日：</strong>
                                        <span><!--{$shippingItem.shipping_date|default:"指定なし"|h}--></span>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <strong>お届け時間：</strong>
                                        <span><!--{$shippingItem.shipping_time|default:"指定なし"|h}--></span>
                                    </div>
                                </div>
                            </div>
                        <!--{/if}-->
                        <!--{if $is_multiple}-->
                            <!--{foreach item=item from=$shippingItem.shipment_item}-->
                                <div class="list-group-item">
                                    <div class="row">
                                        <div class="col-3 col-md-2 text-center">
                                        <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                            <a class="expansion" target="_blank" href="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->">
                                        <!--{/if}-->
                                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$item.productsClass.name|h}-->" class="img-fluid" />
                                        <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                            </a>
                                        <!--{/if}-->
                                        </div>
                                        <div class="col">
                                            <div class="cart-item-title">
                                                <!--{* 商品名 *}--><strong><!--{$item.productsClass.name|h}--></strong>
                                                <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                                    <div><small><!--{$item.productsClass.class_name1|h}-->：<!--{$item.productsClass.classcategory_name1|h}--></small></div>
                                                <!--{/if}-->
                                                <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                                    <div><small><!--{$item.productsClass.class_name2|h}-->：<!--{$item.productsClass.classcategory_name2|h}--></small></div>
                                                <!--{/if}-->
                                            </div>
                                            <div class="cart-item-price">
                                                価格: <!--{$item.price_inctax|n2s|h}-->円
                                            </div>
                                            <hr class="d-none d-md-block">
                                            <div class="justify-content-between d-none d-md-flex">
                                                <div>数量: <!--{$item.quantity|h}--></div>
                                                <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="d-block d-md-none">
                                    <div class="justify-content-between d-flex d-md-none">
                                        <div>数量: <!--{$item.quantity|h}--></div>
                                        <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                                    </div>
                                </div>
                            <!--{/foreach}-->
                        <!--{/if}-->
                    </div>
                </div>
            <!--{/foreach}-->
            <!--{* ▲お届け先 *}-->

            <h3 class="mt-4 d-flex justify-content-between">
                <span>配送方法・お支払方法など</span>
                <a href="./payment.php" class="btn btn-link"><i class="bi bi-pen"></i> <span class="d-none d-sm-inline">変更</span></a>
            </h3>
            <div class="list-group">
                <div class="list-group-item">
                    <strong>配送方法：</strong>
                    <span><!--{$arrDeliv[$arrForm.deliv_id]|h}--></span>
                </div>
                <div class="list-group-item">
                    <strong>お支払方法：</strong>
                    <span><!--{$arrForm.payment_method|h}--></span>
                </div>
                <div class="list-group-item">
                    <strong>その他お問い合わせ：</strong>
                    <span><!--{$arrForm.message|h|nl2br}--></span>
                </div>
            </div>

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                    <!--{if $use_module}-->
                        <input type="submit" onclick="return fnCheckSubmit();" class="btn btn-primary btn-block" value="次へ" name="next" id="next" />
                    <!--{else}-->
                        <input type="submit" onclick="return fnCheckSubmit();" class="btn btn-primary btn-block" value="ご注文完了ページへ" name="next" id="next" />
                    <!--{/if}-->
                    </div>
                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                        <a href="./payment.php" class="btn btn-secondary btn-block">
                            戻る
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
