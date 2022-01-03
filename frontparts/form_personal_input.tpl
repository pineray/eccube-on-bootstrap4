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

<!--{strip}-->
    <fieldset class="form-group">
        <div class="row">
            <legend class="col-12 col-sm-3 col-form-label">お名前<span class="attention">※</span></legend>
            <div class="col">
                <!--{assign var=key1 value="`$prefix`name01"}-->
                <!--{assign var=key2 value="`$prefix`name02"}-->
                <div class="form-row<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                    <div class="col">
                        <label for="<!--{$key1}-->">姓</label>
                        <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col">
                        <label for="<!--{$key2}-->">名</label>
                        <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
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
                <!--{assign var=key1 value="`$prefix`kana01"}-->
                <!--{assign var=key2 value="`$prefix`kana02"}-->
                <div class="form-row<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                    <div class="col">
                        <label for="<!--{$key1}-->">セイ</label>
                        <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col">
                        <label for="<!--{$key2}-->">メイ</label>
                        <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box120 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                    </div>
                </div>
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                    <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                <!--{/if}-->
            </div>
        </div>
    </fieldset>
    <div class="form-group row">
        <!--{assign var=key1 value="`$prefix`company_name"}-->
        <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">会社名</label>
        <div class="col">
            <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;" class="box300 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
            <!--{if $arrErr[$key1]}-->
                <div class="invalid-feedback">
                    <!--{$arrErr[$key1]}-->
                </div>
            <!--{/if}-->
        </div>
    </div>
    <!--{assign var=key1 value="`$prefix`zip01"}-->
    <!--{assign var=key2 value="`$prefix`zip02"}-->
    <!--{assign var=key3 value="`$prefix`pref"}-->
    <!--{assign var=key4 value="`$prefix`addr01"}-->
    <!--{assign var=key5 value="`$prefix`addr02"}-->
    <!--{assign var=key6 value="`$prefix`country_id"}-->
    <!--{assign var=key7 value="`$prefix`zipcode"}-->
    <!--{if !$smarty.const.FORM_COUNTRY_ENABLE}-->
    <input type="hidden" name="<!--{$key6}-->" value="<!--{$smarty.const.DEFAULT_COUNTRY_ID}-->" />
    <!--{else}-->
    <div class="form-group row">
        <label for="<!--{$key6}-->" class="col-12 col-sm-3 col-form-label">国<span class="attention">※</span></label>
        <div class="col">
            <select id="<!--{$key6}-->" name="<!--{$key6}-->" class="form-control<!--{if $arrErr[$key6]}--> is-invalid<!--{/if}-->">
                <option value="" selected="selected">国を選択</option>
                <!--{html_options options=$arrCountry selected=$arrForm[$key6].value|default:$smarty.const.DEFAULT_COUNTRY_ID}-->
            </select>
            <!--{if $arrErr[$key6]}-->
                <div class="invalid-feedback">
                    <!--{$arrErr[$key6]}-->
                </div>
            <!--{/if}-->
        </div>
    </div>
    <div class="form-group row">
        <label for="<!--{$key7}-->" class="col-12 col-sm-3 col-form-label">ZIP CODE</label>
        <div class="col">
            <input type="text" id="<!--{$key7}-->" name="<!--{$key7}-->" value="<!--{$arrForm[$key7].value|h}-->" maxlength="<!--{$arrForm[$key7].length}-->" class="box120 form-control<!--{if $arrErr[$key7]}--> is-invalid<!--{/if}-->" style="ime-mode: disabled;" />
            <!--{if $arrErr[$key7]}-->
                <div class="invalid-feedback">
                    <!--{$arrErr[$key7]}-->
                </div>
            <!--{/if}-->
        </div>
    </div>
    <!--{/if}-->
    <div class="form-group row">
        <div class="col-12 col-sm-3 col-form-label">郵便番号<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><span class="attention">※</span><!--{/if}--></div>
        <div class="col">
            <div class="form-row mx-0<!--{if $arrErr[$key1] || $arrErr[$key2]}--> is-invalid<!--{/if}-->">
                <div class="col col-sm-auto">
                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" size="3" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                </div>
                <label class="col-auto col-form-label px-1 px-sm-2">-</label>
                <div class="col col-sm-auto">
                    <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" size="4" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
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
                        <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
                    </select>
                    <!--{if $arrErr[$key3]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key3]}-->
                        </div>
                    <!--{/if}-->
                </div>
                <div class="form-group">
                    <input type="text" id="<!--{$key4}-->" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|h}-->" class="box300 form-control<!--{if $arrErr[$key4]}--> is-invalid<!--{/if}-->" style="ime-mode: active;" />
                    <!--{if $arrErr[$key4]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key4]}-->
                        </div>
                    <!--{/if}-->
                    <small class="form-text text-muted"><!--{$smarty.const.SAMPLE_ADDRESS1}--></small>
                </div>
                <div class="form-group">
                    <input type="text" id="<!--{$key5}-->" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|h}-->" class="box300 form-control<!--{if $arrErr[$key5]}--> is-invalid<!--{/if}-->" style="ime-mode: active;" />
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
                <!--{assign var=key1 value="`$prefix`tel01"}-->
                <!--{assign var=key2 value="`$prefix`tel02"}-->
                <!--{assign var=key3 value="`$prefix`tel03"}-->
                <div class="form-row mx-0<!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}--> is-invalid<!--{/if}-->">
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" size="5" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" size="5" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key3}-->" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" size="5" maxlength="<!--{$arrForm[$key3].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key3]}--> is-invalid<!--{/if}-->" />
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
            <div class="col-12 col-sm-3 col-form-label">FAX</div>
            <div class="col">
                <!--{assign var=key1 value="`$prefix`fax01"}-->
                <!--{assign var=key2 value="`$prefix`fax02"}-->
                <!--{assign var=key3 value="`$prefix`fax03"}-->
                <div class="form-row mx-0<!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}--> is-invalid<!--{/if}-->">
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" size="5" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" size="5" maxlength="<!--{$arrForm[$key2].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                    </div>
                    <div class="col-auto col-form-label px-1 px-sm-2">-</div>
                    <div class="col col-sm-auto">
                        <input type="text" id="<!--{$key3}-->" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" size="5" maxlength="<!--{$arrForm[$key3].length}-->" style="ime-mode: disabled;" class="box60 form-control<!--{if $arrErr[$key3]}--> is-invalid<!--{/if}-->" />
                    </div>
                </div>
                <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                    <div class="invalid-feedback"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
                <!--{/if}-->
            </div>
        </div>
    </fieldset>
    <!--{if $flgFields > 1}-->
        <fieldset class="form-group">
            <div class="row">
                <div class="col-12 col-sm-3 col-form-label">メールアドレス<span class="attention">※</span></div>
                <div class="col">
                    <!--{assign var=key1 value="`$prefix`email"}-->
                    <!--{assign var=key2 value="`$prefix`email02"}-->
                    <div class="form-group">
                        <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                        <!--{if $arrErr[$key1]}-->
                            <div class="invalid-feedback">
                                <!--{$arrErr[$key1]}-->
                            </div>
                        <!--{/if}-->
                    </div>
                    <div class="form-group">
                        <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="ime-mode: disabled;" class="box300 form-control<!--{if $arrErr[$key1]|cat:$arrErr[$key2]}--> is-invalid<!--{/if}-->"  onPaste="return false;"/>
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
        <!--{if $emailMobile}-->
            <fieldset class="form-group">
                <div class="row">
                    <div class="col-12 col-sm-3 col-form-label">携帯メールアドレス</div>
                    <div class="col">
                        <!--{assign var=key1 value="`$prefix`email_mobile"}-->
                        <!--{assign var=key2 value="`$prefix`email_mobile02"}-->
                        <div class="form-group">
                            <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="box300 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                            <!--{if $arrErr[$key1]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key1]}-->
                                </div>
                            <!--{/if}-->
                        </div>
                        <div class="form-group">
                            <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="box300 form-control<!--{if $arrErr[$key1]|cat:$arrErr[$key2]}--> is-invalid<!--{/if}-->" onPaste="return false;"/><br />
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
        <!--{/if}-->
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-12 col-sm-3 col-form-label">性別<span class="attention">※</span></legend>
                <div class="col">
                    <!--{assign var=key1 value="`$prefix`sex"}-->
                    <div<!--{if $arrErr[$key1]}--> class="is-invalid"<!--{/if}-->>
                        <!--{foreach from=$arrSex item="label" key="val" name=sex}-->
                            <div class="form-check">
                                <input class="form-check-input<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" type="radio" name="<!--{$key1}-->" value="<!--{$val}-->" id="<!--{$key1}-->-<!--{$smarty.foreach.sex.iteration}-->" <!--{if $arrForm[$key1].value == $val}-->checked<!--{/if}-->>
                                <label class="form-check-label" for="<!--{$key1}-->-<!--{$smarty.foreach.sex.iteration}-->">
                                    <!--{$label}-->
                                </label>
                            </div>
                        <!--{/foreach}-->
                    </div>
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
        </fieldset>
        <div class="form-group row">
            <!--{assign var=key1 value="`$prefix`job"}-->
            <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">職業</label>
            <div class="col">
                <select id="<!--{$key1}-->" name="<!--{$key1}-->" class="form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->">
                    <option value="" selected="selected">選択してください</option>
                    <!--{html_options options=$arrJob selected=$arrForm[$key1].value}-->
                </select>
                <!--{if $arrErr[$key1]}-->
                    <div class="invalid-feedback">
                        <!--{$arrErr[$key1]}-->
                    </div>
                <!--{/if}-->
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-12 col-sm-3 col-form-label">生年月日</legend>
                <div class="col">
                    <!--{assign var=key1 value="`$prefix`year"}-->
                    <!--{assign var=key2 value="`$prefix`month"}-->
                    <!--{assign var=key3 value="`$prefix`day"}-->
                    <!--{assign var=errBirth value="`$arrErr.$key1``$arrErr.$key2``$arrErr.$key3`"}-->
                    <div class="form-row<!--{if $errBirth}--> is-invalid<!--{/if}-->">
                        <div class="col">
                            <select id="<!--{$key1}-->" name="<!--{$key1}-->" class="form-control<!--{if $errBirth}--> is-invalid<!--{/if}-->">
                                <!--{html_options options=$arrYear selected=$arrForm[$key1].value|default:''}-->
                            </select>
                        </div>
                        <div class="col col-auto col-form-label">年</div>
                        <div class="col">
                            <select id="<!--{$key2}-->" name="<!--{$key2}-->" class="form-control<!--{if $errBirth}--> is-invalid<!--{/if}-->">
                                <!--{html_options options=$arrMonth selected=$arrForm[$key2].value|default:''}-->
                            </select>
                        </div>
                        <div class="col col-auto col-form-label">月</div>
                        <div class="col">
                            <select id="<!--{$key3}-->" name="<!--{$key3}-->" class="form-control<!--{if $errBirth}--> is-invalid<!--{/if}-->">
                                <!--{html_options options=$arrDay selected=$arrForm[$key3].value|default:''}-->
                            </select>
                        </div>
                        <div class="col col-auto col-form-label">日</div>
                    </div>
                    <!--{if $errBirth}-->
                        <div class="invalid-feedback"><!--{$errBirth}--></div>
                    <!--{/if}-->
                </div>
            </div>
        </fieldset>
        <!--{if $flgFields > 2}-->
            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-12 col-sm-3 col-form-label">希望するパスワード<span class="attention">※</span></legend>
                    <div class="col">
                        <!--{assign var=key1 value="`$prefix`password"}-->
                        <!--{assign var=key2 value="`$prefix`password02"}-->
                        <div class="form-group">
                            <input type="password" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" class="box120 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                            <!--{if $arrErr[$key1]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key1]}-->
                                </div>
                            <!--{/if}-->
                            <small class="form-text text-muted"><span class="attention mini">半角英数字<!--{$smarty.const.PASSWORD_MIN_LEN}-->～<!--{$smarty.const.PASSWORD_MAX_LEN}-->文字でお願いします。（記号可）</span></small>
                        </div>
                        <div class="form-group">
                            <input type="password" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" class="box120 form-control<!--{if $arrErr[$key1]|cat:$arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                            <!--{if $arrErr[$key2]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key2]}-->
                                </div>
                            <!--{/if}-->
                            <small class="form-text text-muted"><span class="attention mini">確認のために2度入力してください。</span></small>
                        </div>
                    </div>
                </div>
            </fieldset>
            <fieldset class="form-group">
                <div class="row">
                    <div class="col-12 col-sm-3 col-form-label">パスワードを忘れた時のヒント<span class="attention">※</span></div>
                    <div class="col">
                        <!--{assign var=key1 value="`$prefix`reminder"}-->
                        <!--{assign var=key2 value="`$prefix`reminder_answer"}-->
                        <div class="form-group">
                            <label for="<!--{$key1}-->">質問</label>
                            <select id="<!--{$key1}-->" name="<!--{$key1}-->" class="form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->">
                                <option value="" selected="selected">選択してください</option>
                                <!--{html_options options=$arrReminder selected=$arrForm[$key1].value}-->
                            </select>
                            <!--{if $arrErr[$key1]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key1]}-->
                                </div>
                            <!--{/if}-->
                        </div>
                        <div class="form-group">
                            <label for="<!--{$key2}-->">答え</label>
                            <input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" style="ime-mode: active;" class="box260 form-control<!--{if $arrErr[$key2]}--> is-invalid<!--{/if}-->" />
                            <!--{if $arrErr[$key2]}-->
                                <div class="invalid-feedback">
                                    <!--{$arrErr[$key2]}-->
                                </div>
                            <!--{/if}-->
                        </div>
                    </div>
                </div>
            </fieldset>
            <fieldset class="form-group">
                <div class="row">
                    <legend class="col-12 col-sm-3 col-form-label">メールマガジン送付について<span class="attention">※</span></legend>
                    <div class="col">
                        <!--{assign var=key1 value="`$prefix`mailmaga_flg"}-->
                        <!--{if $arrErr[$key1]}-->
                            <div class="attention"><!--{$arrErr[$key1]}--></div>
                        <!--{/if}-->
                        <div<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->>
                        <!--{foreach from=$arrMAILMAGATYPE item="label" key="val" name=mailmagtype}-->
                            <div class="form-check">
                                <input class="form-check-input<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" type="radio" name="<!--{$key1}-->" value="<!--{$val}-->" id="<!--{$key1}-->-<!--{$smarty.foreach.mailmagtype.iteration}-->" <!--{if $arrForm[$key1].value == $val}-->checked<!--{/if}-->>
                                <label class="form-check-label" for="<!--{$key1}-->-<!--{$smarty.foreach.mailmagtype.iteration}-->">
                                    <!--{$label}-->
                                </label>
                            </div>
                        <!--{/foreach}-->
                        </div>
                        <!--{if $arrErr[$key1]}-->
                            <div class="invalid-feedback">
                                <!--{$arrErr[$key1]}-->
                            </div>
                        <!--{/if}-->
                    </div>
                </div>
            </fieldset>
        <!--{/if}-->
    <!--{/if}-->
<!--{/strip}-->
