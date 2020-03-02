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
    $(function() {
        if ($('input[name=deliv_id]:checked').val()
            || $('#deliv_id').val()) {
            showForm(true);
        } else {
            showForm(false);
        }
        $('input[id^=deliv_]').click(function() {
            showForm(true);
            var data = {};
            data.mode = 'select_deliv';
            data.deliv_id = $(this).val();
            data['<!--{$smarty.const.TRANSACTION_ID_NAME}-->'] = '<!--{$transactionid}-->';
            $.ajax({
                type : 'POST',
                url : location.pathname,
                data: data,
                cache : false,
                dataType : 'json',
                error : remoteException,
                success : function(data, dataType) {
                    if (data.error) {
                        remoteException();
                    } else {
                        // 支払い方法の行を生成
                        var paymentSelect = $('#payment-method-select');
                        paymentSelect.empty();
                        for (var i in data.arrPayment) {
                            // ラジオボタン
                            <!--{* IE7未満対応のため name と id をベタ書きする *}-->
                            var radio = $('<input type="radio" name="payment_id" id="pay_' + i + '" />')
                                .val(data.arrPayment[i].payment_id)
                                .addClass('form-check-input');
                            // ラベル
                            var label = $('<label />')
                                .attr('for', 'pay_' + i)
                                .addClass('form-check-label')
                                .text(data.arrPayment[i].payment_method);
                            // 支払方法の画像が登録されている場合は表示
                            if (data.img_show) {
                                var payment_image = data.arrPayment[i].payment_image;
                                if (payment_image) {
                                    var img = $('<img />')
                                    .attr('src', '<!--{$smarty.const.IMAGE_SAVE_URLPATH}-->' + payment_image)
                                    .addClass('img-fluid');
                                    label.append('<br>').append(img);
                                }
                            }

                            // 行
                            var formCheck = $('<div />')
                                .addClass('form-check py-2')
                                .append(radio)
                                .append(label);

                            formCheck.appendTo(paymentSelect);
                        }
                        // お届け時間を生成
                        var deliv_time_id_select = $('select[id^=deliv_time_id]');
                        deliv_time_id_select.empty();
                        deliv_time_id_select.append($('<option />').text('指定なし').val(''));
                        for (var i in data.arrDelivTime) {
                            var option = $('<option />')
                                .val(i)
                                .text(data.arrDelivTime[i])
                                .appendTo(deliv_time_id_select);
                        }
                    }
                }
            });
        });

        /**
         * 通信エラー表示.
         */
        function remoteException(XMLHttpRequest, textStatus, errorThrown) {
            alert('通信中にエラーが発生しました。カート画面に移動します。');
            location.href = '<!--{$smarty.const.CART_URL}-->';
        }

        /**
         * 配送方法の選択状態により表示を切り替える
         */
        function showForm(show) {
            if (show) {
                $('#payment, div.delivdate, .select-msg').show();
                $('.non-select-msg').hide();
            } else {
                $('#payment, div.delivdate, .select-msg').hide();
                $('.non-select-msg').show();
            }
        }
    });
//]]></script>
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`shopping/process/step2.tpl"}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

            <!--{assign var=key value="deliv_id"}-->
            <!--{if $is_single_deliv}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" id="deliv_id" />
            <!--{else}-->
            <div class="pay_area mb-4">
                <h3>配送方法の指定</h3>
                <p>配送方法をご選択ください。</p>

                <div id="delivery-method-select"<!--{if $arrErr[$key] != ""}--> class="is-invalid"<!--{/if}-->>
                    <!--{section name=cnt loop=$arrDeliv}-->
                    <div class="form-check py-2">
                        <input class="form-check-input<!--{if $arrErr[$key] != ""}--> is-invalid<!--{/if}-->" type="radio" id="deliv_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" value="<!--{$arrDeliv[cnt].deliv_id}-->" <!--{$arrDeliv[cnt].deliv_id|sfGetChecked:$arrForm[$key].value}--> />
                        <label class="form-check-label" for="deliv_<!--{$smarty.section.cnt.iteration}-->">
                            <!--{$arrDeliv[cnt].name|h}--><!--{if $arrDeliv[cnt].remark != ""}--><br><small class="text-muted"><!--{$arrDeliv[cnt].remark|h|nl2br}--></small><!--{/if}-->
                        </label>
                    </div>
                    <!--{/section}-->
                </div>
                <!--{if $arrErr[$key] != ""}-->
                    <div class="invalid-feedback">
                        <!--{$arrErr[$key]}-->
                    </div>
                <!--{/if}-->
            </div>
            <!--{/if}-->

            <div class="pay_area mb-4">
                <h3>お支払方法の指定</h3>
                <p class="select-msg">お支払方法をご選択ください。</p>
                <p class="non-select-msg">まずはじめに、配送方法を選択ください。</p>

                <!--{assign var=key value="payment_id"}-->
                <div id="payment-method-select"<!--{if $arrErr[$key] != ""}--> class="is-invalid"<!--{/if}-->>
                    <!--{section name=cnt loop=$arrPayment}-->
                    <div class="form-check py-2">
                        <input class="form-check-input<!--{if $arrErr[$key] != ""}--> is-invalid<!--{/if}-->" type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" value="<!--{$arrPayment[cnt].payment_id}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}--> />
                        <label class="form-check-label" for="pay_<!--{$smarty.section.cnt.iteration}-->">
                            <!--{$arrPayment[cnt].payment_method|h}-->
                            <!--{if $img_show && $arrPayment[cnt].payment_image != ""}-->
                                <br>
                                <!--{if $arrPayment[cnt].payment_image != ""}-->
                                    <img class="img-fluid" src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrPayment[cnt].payment_image}-->" />
                                <!--{/if}-->
                            <!--{/if}-->
                        </label>
                    </div>
                    <!--{/section}-->
                </div>
                <!--{if $arrErr[$key] != ""}-->
                    <div class="invalid-feedback">
                        <!--{$arrErr[$key]}-->
                    </div>
                <!--{/if}-->
            </div>

            <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
            <div class="pay_area02 mb-4">
                <h3>お届け時間の指定</h3>
                <p class="select-msg">ご希望の方は、お届け時間を選択してください。</p>
                <p class="non-select-msg">まずはじめに、配送方法を選択ください。</p>
                <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
                <!--{assign var=index value=$shippingItem.shipping_id}-->
                    <!--{if $is_multiple}-->
                        <div class="card my-2">
                            <div class="card-header">
                                お届け先 <!--{$smarty.foreach.shippingItem.iteration}-->
                            </div>
                            <div class="card-body">
                                <!--{if $shippingItem.shipping_company_name}-->
                                    <!--{$shippingItem.shipping_company_name|h}--><br>
                                <!--{/if}-->
                                <!--{$shippingItem.shipping_name01}--><!--{$shippingItem.shipping_name02}--><br>
                                <small><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01}--><!--{$shippingItem.shipping_addr02}--></small>
                            </div>
                            <div class="card-footer">
                    <!--{/if}-->
                    <div class="delivdate row row-cols-1 row-cols-md-2">
                        <div class="col">
                            <!--★お届け日★-->
                            <!--{assign var=key value="deliv_date`$index`"}-->
                            <div class="form-row">
                                <label for="<!--{$key}-->" class="col-4 col-md-5 col-lg-4 col-form-label">お届け日</label>
                                <div class="col">
                                    <!--{if !$arrDelivDate}-->
                                        ご指定頂けません。
                                    <!--{else}-->
                                        <select class="form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" name="<!--{$key}-->" id="<!--{$key}-->">
                                            <option value="" selected="">指定なし</option>
                                            <!--{assign var=shipping_date_value value=$arrForm[$key].value|default:$shippingItem.shipping_date}-->
                                            <!--{html_options options=$arrDelivDate selected=$shipping_date_value}-->
                                        </select>
                                    <!--{/if}-->
                                    <!--{if $arrErr[$key]}-->
                                        <div class="invalid-feedback">
                                            <!--{$arrErr[$key]}-->
                                        </div>
                                    <!--{/if}-->
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <!--★お届け時間★-->
                            <!--{assign var=key value="deliv_time_id`$index`"}-->
                            <div class="form-row">
                                <label for="<!--{$key}-->" class="col-4 col-md-5 col-lg-4 col-form-label">お届け時間</label>
                                <div class="col">
                                    <select class="form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" name="<!--{$key}-->" id="<!--{$key}-->">
                                        <option value="" selected="">指定なし</option>
                                        <!--{assign var=shipping_time_value value=$arrForm[$key].value|default:$shippingItem.time_id}-->
                                        <!--{html_options options=$arrDelivTime selected=$shipping_time_value}-->
                                    </select>
                                    <!--{if $arrErr[$key]}-->
                                        <div class="invalid-feedback">
                                            <!--{$arrErr[$key]}-->
                                        </div>
                                    <!--{/if}-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--{if $is_multiple}-->
                            </div>
                        </div>
                    <!--{/if}-->
                <!--{/foreach}-->
            </div>
            <!--{/if}-->

            <!-- ▼ポイント使用 -->
            <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                <div class="point_area mb-4">
                    <h3>ポイント使用の指定</h3>
                        <p><span class="attention">1ポイントを<!--{$smarty.const.POINT_VALUE|n2s}-->円</span>として使用する事ができます。<br />
                            使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。
                        </p>
                        <div class="point_announce">
                            <p><span class="user_name"><!--{$name01|h}--> <!--{$name02|h}-->様</span>の、現在の所持ポイントは「<span class="point"><!--{$tpl_user_point|default:0|n2s}-->Pt</span>」です。<br />
                                今回ご購入合計金額：<span class="price"><!--{$arrPrices.subtotal|n2s}-->円</span> <span class="attention">(送料、手数料を含みません。)</span>
                            </p>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="eccube.togglePointForm();" />
                                        <label for="point_on" class="form-check-label">
                                            ポイントを使用する
                                        </label>
                                    </div>
                                    <!--{assign var=key value="use_point"}-->
                                    <div class="form-row mt-2<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->">
                                        <div class="col-4 col-md-2">
                                            <input type="number" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|default:$tpl_user_point}-->" maxlength="<!--{$arrForm[$key].length}-->" class="box60 form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" />
                                        </div>
                                        <div class="col col-form-label">
                                            ポイントを使用する。
                                        </div>
                                    </div>
                                    <!--{if $arrErr[$key]}-->
                                        <div class="invalid-feedback">
                                            <!--{$arrErr[$key]}-->
                                        </div>
                                    <!--{/if}-->
                                </li>
                                <li class="list-group-item">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="eccube.togglePointForm();" />
                                        <label for="point_off" class="form-check-label">ポイントを使用しない</label>
                                    </div>
                                </li>
                            </ul>
                    </div>
                </div>
            <!--{/if}-->
            <!-- ▲ポイント使用 -->

            <div class="pay_area02">
                <h3>その他お問い合わせ</h3>
                <p>その他お問い合わせ事項がございましたら、こちらにご入力ください。</p>
                <div>
                    <!--★その他お問い合わせ事項★-->
                    <!--{assign var=key value="message"}-->
                    <textarea name="<!--{$key}-->" cols="70" rows="8" class="txtarea form-control<!--{if $arrErr[$key]}--> is-invalid<!--{/if}-->" wrap="hard"><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                    <!--{if $arrErr[$key]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key]}-->
                        </div>
                    <!--{/if}-->
                    <small class="form-text text-muted attention">(<!--{$smarty.const.LTEXT_LEN}-->文字まで)</small>
                </div>
            </div>

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <input type="submit" class="btn btn-primary btn-block" value="次へ" name="next" id="next" />
                    </div>
                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                        <a href="?mode=return" class="btn btn-secondary btn-block">
                            戻る
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
