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

        <p>内容によっては回答をさしあげるのにお時間をいただくこともございます。<br />
        また、休業日は翌営業日以降の対応となりますのでご了承ください。</p>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />

            <div>
                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-12 col-sm-3 col-form-label">お名前<span class="attention">※</span></legend>
                        <div class="col">
                            <!--{assign var=key1 value="name01"}-->
                            <!--{assign var=key2 value="name02"}-->
                            <div class="form-row<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                                <div class="col">
                                    <label for="<!--{$key1}-->">姓</label>
                                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$arrData[$key1]|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                                </div>
                                <div class="col">
                                    <label for="<!--{$key2}-->">名</label>
                                    <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$arrData[$key2]|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                                </div>
                            </div>
                            <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                                <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                            <!--{/if}-->
                        </div>
                    </div>
                </fieldset>
                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-12 col-sm-3 col-form-label">お名前(フリガナ)<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><span class="attention">※</span><!--{/if}--></legend>
                        <div class="col">
                            <!--{assign var=key1 value="kana01"}-->
                            <!--{assign var=key2 value="kana02"}-->
                            <div class="form-row<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                                <div class="col">
                                    <label for="<!--{$key1}-->">セイ</label>
                                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$arrData[$key1]|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                                </div>
                                <div class="col">
                                    <label for="<!--{$key2}-->">メイ</label>
                                    <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$arrData[$key2]|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                                </div>
                            </div>
                            <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                                <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                            <!--{/if}-->
                        </div>
                    </div>
                </fieldset>
                <!--{assign var=key1 value="zip01"}-->
                <!--{assign var=key2 value="zip02"}-->
                <!--{assign var=key3 value="pref"}-->
                <!--{assign var=key4 value="addr01"}-->
                <!--{assign var=key5 value="addr02"}-->
                <div class="form-group row">
                    <div class="col-12 col-sm-3 col-form-label">郵便番号<span class="attention">※</span></div>
                    <div class="col">
                        <div class="form-row mx-0<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                            <div class="col col-sm-auto">
                                <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$arrData[$key1]|h}-->" size="3" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                            </div>
                            <label class="col-auto col-form-label px-1 px-sm-2">-</label>
                            <div class="col col-sm-auto">
                                <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$arrData[$key2]|h}-->" size="4" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                            </div>
                            <div class="col col-form-label pl-1 pl-sm-2">
                                <a href="https://www.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
                            </div>
                        </div>
                        <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                            <div class="invalid-feedback">
                                <!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}-->
                            </div>
                        <!--{/if}-->
                        <p class="zipimg d-none d-sm-block mt-3">
                            <a class="btn btn-secondary btn-sm" href="<!--{$smarty.const.ROOT_URLPATH}-->input_zip.php" onclick="eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->'); return false;" target="_blank">
                                住所自動入力
                            </a>
                            &nbsp;<span class="mini">郵便番号を入力後、クリックしてください。</span>
                        </p>
                        <div class="d-sm-none mt-3">
                            <a class="btn btn-secondary w-100 btn-sm" href="<!--{$smarty.const.ROOT_URLPATH}-->input_zip.php" onclick="eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->'); return false;" target="_blank">
                                郵便番号から住所自動入力
                            </a>
                        </div>
                    </div>
                </div>
                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-12 col-sm-3 col-form-label">住所<span class="attention">※</span></legend>
                        <div class="col">
                            <div class="form-group">
                                <select id="<!--{$key3}-->" name="<!--{$key3}-->" class="form-control<!--{if $arrErr[$key3]}--> is-invalid<!--{/if}-->">
                                    <option value="" selected="selected">都道府県を選択</option>
                                    <!--{html_options options=$arrPref selected=$arrForm[$key3].value|default:$arrData[$key3]}-->
                                </select>
                                <!--{if $arrErr[$key3]}-->
                                    <div class="invalid-feedback">
                                        <!--{$arrErr[$key3]}-->
                                    </div>
                                <!--{/if}-->
                            </div>
                            <div class="form-group">
                                <input type="text" id="<!--{$key4}-->" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|default:$arrData[$key4]|h}-->" class="box300 form-control<!--{if $arrErr[$key4]}--> is-invalid<!--{/if}-->" style="ime-mode: active;" />
                                <!--{if $arrErr[$key4]}-->
                                    <div class="invalid-feedback">
                                        <!--{$arrErr[$key4]}-->
                                    </div>
                                <!--{/if}-->
                                <small class="form-text text-muted"><!--{$smarty.const.SAMPLE_ADDRESS1}--></small>
                            </div>
                            <div class="form-group">
                                <input type="text" id="<!--{$key5}-->" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|default:$arrData[$key5]|h}-->" class="box300 form-control<!--{if $arrErr[$key5]}--> is-invalid<!--{/if}-->" style="ime-mode: active;" />
                                <!--{if $arrErr[$key5]}-->
                                    <div class="invalid-feedback">
                                        <!--{$arrErr[$key5]}-->
                                    </div>
                                <!--{/if}-->
                                <small class="form-text text-muted"><!--{$smarty.const.SAMPLE_ADDRESS2}--></small>
                            </div>
                            <p class="mini"><span class="attention">住所は2つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-12 col-sm-3 col-form-label">電話番号<span class="attention">※</span></legend>
                        <div class="col">
                            <!--{assign var=key1 value="tel01"}-->
                            <!--{assign var=key2 value="tel02"}-->
                            <!--{assign var=key3 value="tel03"}-->
                            <div class="form-row mx-0<!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}--> is-invalid<!--{/if}-->">
                                <div class="col col-sm-auto">
                                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$arrData[$key1]|h}-->" size="5" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                                </div>
                                <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                                <div class="col col-sm-auto">
                                    <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$arrData[$key2]|h}-->" size="5" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                                </div>
                                <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                                <div class="col col-sm-auto">
                                    <input type="text" id="<!--{$key3}-->" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|default:$arrData[$key3]|h}-->" size="5" maxlength="<!--{$arrForm[$key3].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key3]}--> is-invalid<!--{/if}-->" />
                                </div>
                            </div>
                            <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                                <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
                            <!--{/if}-->
                        </div>
                    </div>
                </fieldset>
                <fieldset class="form-group">
                    <div class="row">
                        <div class="col-12 col-sm-3 col-form-label">メールアドレス<span class="attention">※</span></div>
                        <div class="col">
                            <!--{assign var=key1 value="email"}-->
                            <!--{assign var=key2 value="email02"}-->
                            <div class="form-group">
                                <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$arrData[$key1]|h}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                                <!--{if $arrErr[$key1]}-->
                                    <div class="invalid-feedback">
                                        <!--{$arrErr[$key1]}-->
                                    </div>
                                <!--{/if}-->
                            </div>
                            <div class="form-group">
                                <!--{* ログインしていれば入力済みにする *}-->
                                <!--{if $smarty.session.customer}-->
                                    <!--{assign var=email02 value=$arrData.email}-->
                                <!--{/if}-->
                                <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$email02|h}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key1]|cat:$arrErr[$key2]}--> is-invalid<!--{/if}-->"  onPaste="return false;"/>
                                <!--{if $arrErr[$key2]}-->
                                    <div class="invalid-feedback">
                                        <!--{$arrErr[$key2]}-->
                                    </div>
                                <!--{/if}-->
                                <small class="form-text text-muted">確認のため2度入力してください。</small>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row">
                    <!--{assign var=key1 value="contents"}-->
                    <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">
                        お問い合わせ内容<span class="attention">※</span><br />
                        <small>（全角<!--{$smarty.const.MLTEXT_LEN}-->字以下）</small>
                    </label>
                    <div class="col">
                        <textarea name="contents" class="box380 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" cols="60" rows="20" style="ime-mode: active;"><!--{"\n"}--><!--{$arrForm.contents.value|h}--></textarea>
                        <!--{if $arrErr[$key1]}-->
                            <div class="invalid-feedback">
                                <!--{$arrErr[$key1]}-->
                            </div>
                        <!--{/if}-->
                        <small class="form-text text-muted attention">※ご注文に関するお問い合わせには、必ず「ご注文番号」をご記入くださいますようお願いいたします。</small>
                    </div>
                </div>
            </div>

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <input type="submit" class="btn btn-primary w-100" value="確認ページへ" name="confirm" id="confirm" />
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
