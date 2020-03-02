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

<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <div class="mycondition_area clearfix">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-6">
                            <strong>購入日時：</strong>
                            <span><!--{$tpl_arrOrderData.create_date|sfDispDBDate}--></span>
                        </div>
                        <div class="col-12 col-sm-6">
                            <strong>注文番号：</strong>
                            <span><!--{$tpl_arrOrderData.order_id}--></span>
                        </div>
                        <div class="col-12 col-sm-6">
                            <strong>お支払い方法：</strong>
                            <span><!--{$arrPayment[$tpl_arrOrderData.payment_id]|h}--></span>
                        </div>
                        <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG}-->
                        <div class="col-12 col-sm-6">
                            <strong>ご注文状況：</strong>
                            <!--{if $tpl_arrOrderData.status != $smarty.const.ORDER_PENDING}-->
                                <span><!--{$arrCustomerOrderStatus[$tpl_arrOrderData.status]|h}--></span>
                            <!--{else}-->
                                <span class="attention"><!--{$arrCustomerOrderStatus[$tpl_arrOrderData.status]|h}--></span>
                            <!--{/if}-->
                        </div>
                        <!--{/if}-->
                    </div>
                </div>
                <div class="list-group list-group-flush">
                    <!--{foreach from=$tpl_arrOrderDetail item=orderDetail}-->
                        <div class="list-group-item">
                            <div class="row history-item">
                                <div class="col-3 col-md-2 text-center">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$orderDetail.main_list_image|sfNoImageMainList|h}-->" class="img-fluid" alt="<!--{$orderDetail.product_name|h}-->" />
                                </div>
                                <div class="col">
                                    <div class="history-item-title">
                                        <small class="text-muted"><!--{$orderDetail.product_code|h}--></small><br>
                                        <!--{if $orderDetail.enable}-->
                                            <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$orderDetail.product_id|u}-->">
                                        <!--{/if}-->
                                        <!--{$orderDetail.product_name|h}-->
                                        <!--{if $orderDetail.enable}-->
                                            </a>
                                        <!--{/if}-->
                                        <!--{if $orderDetail.classcategory_name1 != ""}-->
                                            <br><small><!--{$orderDetail.classcategory_name1|h}-->
                                            <!--{if $orderDetail.classcategory_name2 != ""}-->
                                                &nbsp;/&nbsp;<!--{$orderDetail.classcategory_name2|h}-->
                                            <!--{/if}-->
                                            </small>
                                        <!--{/if}-->
                                    </div>
                                    <div class="history-item-price">
                                        <!--{$orderDetail.price_inctax|n2s|h}-->円
                                        <!--{if $orderDetail.price_inctax != $orderDetail.product_price_inctax}-->
                                            <div class="attention">【現在価格】</div><span class="attention"><!--{$orderDetail.product_price_inctax|n2s|h}-->円</span>
                                        <!--{/if}-->
                                    </div>
                                    <!--{if $orderDetail.product_type_id == $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                        <div class="history-item-download">
                                            <!--{if $orderDetail.is_downloadable}-->
                                                <a target="_self" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/download.php?order_id=<!--{$tpl_arrOrderData.order_id}-->&product_class_id=<!--{$orderDetail.product_class_id}-->" class="btn btn-secondary">ダウンロード</a>
                                            <!--{else}-->
                                                <a href="#" class="btn btn-secondary" disabled="disabled">
                                                    ダウンロード
                                                    <!--{if $orderDetail.payment_date == "" && $orderDetail.effective == "0"}-->
                                                        （入金確認中）
                                                    <!--{else}-->
                                                        （期限切れ）
                                                    <!--{/if}-->
                                                </a>
                                            <!--{/if}-->
                                        </div>
                                    <!--{/if}-->
                                    <hr class="d-none d-md-block">
                                    <div class="justify-content-between d-none d-md-flex">
                                        <div>数量: <!--{$orderDetail.quantity|h}--></div>
                                        <div>小計: <!--{$orderDetail.price_inctax|sfMultiply:$orderDetail.quantity|n2s}-->円</div>
                                    </div>
                                </div>
                            </div>
                            <hr class="d-block d-md-none">
                            <div class="justify-content-between d-flex d-md-none">
                                <div>数量: <!--{$orderDetail.quantity|h}--></div>
                                <div>小計: <!--{$orderDetail.price_inctax|sfMultiply:$orderDetail.quantity|n2s}-->円</div>
                            </div>
                        </div>
                    <!--{/foreach}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <small>小計：</small>
                        <span><!--{$tpl_arrOrderData.subtotal|n2s}-->円</span>
                    </div>
                    <!--{assign var=point_discount value="`$tpl_arrOrderData.use_point*$smarty.const.POINT_VALUE`"}-->
                    <!--{if $point_discount > 0}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <small>ポイント値引き：</small>
                        <span>&minus;<!--{$point_discount|n2s}-->円</span>
                    </div>
                    <!--{/if}-->
                    <!--{assign var=key value="discount"}-->
                    <!--{if $tpl_arrOrderData[$key] != "" && $tpl_arrOrderData[$key] > 0}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <small>値引き：</small>
                        <span>&minus;<!--{$tpl_arrOrderData[$key]|n2s}-->円</span>
                    </div>
                    <!--{/if}-->
                    <div class="list-group-item d-flex justify-content-between">
                        <small>送料：</small>
                        <span><!--{assign var=key value="deliv_fee"}--><!--{$tpl_arrOrderData[$key]|n2s|h}-->円</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        <small>手数料：</small>
                        <!--{assign var=key value="charge"}-->
                        <span><!--{$tpl_arrOrderData[$key]|n2s|h}-->円</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between list-group-item-info">
                        <small>合計：</small>
                        <span><span class="price"><!--{$tpl_arrOrderData.payment_total|n2s}-->円</span></span>
                    </div>

                    <!-- 使用ポイントここから -->
                    <!--{if $smarty.const.USE_POINT !== false}-->
                        <div class="list-group-item d-flex justify-content-between">
                            <small>ご使用ポイント：</small>
                            <span><!--{assign var=key value="use_point"}--><!--{$tpl_arrOrderData[$key]|n2s|default:0}--> pt</span>
                        </div>
                        <div class="list-group-item d-flex justify-content-between">
                            <small>今回加算されるポイント：</small>
                            <span><!--{$tpl_arrOrderData.add_point|n2s|default:0}--> pt</span>
                        </div>
                    <!--{/if}-->
                    <!-- 使用ポイントここまで -->

                </div>
            </div>
        </div>

        <!--{if $is_price_change == true}-->
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> 金額が変更されている商品があるため、再注文時はご注意ください。
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <!--{/if}-->
        <form action="order.php" method="post">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="order_id" value="<!--{$tpl_arrOrderData.order_id|h}-->" />
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <input type="submit" class="btn btn-primary btn-block" value="この購入内容で再注文する" name="submit" />
                </div>
            </div>
        </form>

        <h3 class="mt-4">お届け先</h3>
        <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
            <div class="card">
                <!--{if $isMultiple}-->
                    <div class="card-header">お届け先<!--{$smarty.foreach.shippingItem.iteration}--></div>
                <!--{/if}-->
                <div class="card-body">
                    〒<!--{$shippingItem.shipping_zip01}-->-<!--{$shippingItem.shipping_zip02}--><br>
                    <!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}--><br>
                    <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
                        <!--{$arrCountry[$shippingItem.shipping_country_id]|h}-->
                        &nbsp;ZIPCODE：<!--{$shippingItem.shipping_zipcode|h}--><br>
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
                <div class="list-group list-group-flush">
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
                    <!--{if $isMultiple}-->
                        <!--{foreach item=item from=$shippingItem.shipment_item}-->
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-12 col-md-8">
                                        <small class="text-muted"><!--{$item.productsClass.product_code|h}--></small><br>
                                        <!--{* 商品名 *}--><!--{$item.productsClass.name|h}--><br>
                                        <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                            <small><!--{$item.productsClass.classcategory_name1}-->
                                            <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                                &nbsp;/&nbsp;<!--{$item.productsClass.classcategory_name2}-->
                                            <!--{/if}-->
                                            </small>
                                        <!--{/if}-->
                                    </td>
                                    <div class="col">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <strong>単価：</strong>
                                                <!--{$item.price|sfCalcIncTax:$tpl_arrOrderData.order_tax_rate:$tpl_arrOrderData.order_tax_rule|n2s}-->円
                                            </td>
                                            <td><strong>数量：</strong><!--{$item.quantity}--></td>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!--{/foreach}-->
                    <!--{/if}-->
                </div>
            </div>
        <!--{/foreach}-->

        <h3 class="mt-4">メール配信履歴一覧</h3>
        <div class="list-group">
            <!--{section name=cnt loop=$tpl_arrMailHistory}-->
            <a class="list-group-item list-group-item-action" href="#" onclick="eccube.openWindow('./mail_view.php?send_id=<!--{$tpl_arrMailHistory[cnt].send_id}-->','mail_view','650','800'); return false;">
                <span class="float-right"><i class="fas fa-chevron-right"></i></span>
                <div>配信日：<!--{$tpl_arrMailHistory[cnt].send_date|sfDispDBDate|h}--></div>
                <!--{assign var=key value="`$tpl_arrMailHistory[cnt].template_id`"}-->
                <div>通知メール：<!--{$arrMAILTEMPLATE[$key]|h}--></div>
                <div class="font-weight-bold"><!--{$tpl_arrMailHistory[cnt].subject|h}--></div>
            </a>
            <!--{/section}-->
        </div>

        <div class="btn_area py-4">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <a class="btn btn-secondary btn-block" href="./<!--{$smarty.const.DIR_INDEX_PATH}-->">戻る</a>
                </div>
            </div>
        </div>

    </div>
</div>
