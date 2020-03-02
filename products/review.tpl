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
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="お客様の声書き込み（入力ページ）"}-->

<div id="window_area">
    <h2 class="title">お客様の声書き込み</h2>
    <p class="windowtext">以下の商品について、お客様のご意見、ご感想をどしどしお寄せください。<br />
        「<span class="attention">※</span>」印は入力必須項目です。<br />
        ご入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="product_id" value="<!--{$arrForm.product_id|h}-->" />
        <div>
            <div class="form-group row">
                <label class="col-12 col-sm-3 col-form-label">商品名</label>
                <div class="col col-form-label"><!--{$arrForm.name|h}--></div>
            </div>
            <div class="form-group row">
                <!--{assign var=key1 value="reviewer_name"}-->
                <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">投稿者名<span class="attention">※</span></label>
                <div class="col">
                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm.reviewer_name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="box350 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
            <div class="form-group row">
                <!--{assign var=key1 value="reviewer_url"}-->
                <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">投稿者URL</label>
                <div class="col">
                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm.reviewer_url|h}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="box350 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
            <fieldset class="form-group">
                <div class="row">
                    <!--{assign var=key1 value="sex"}-->
                    <legend class="col-12 col-sm-3 col-form-label">性別</legend>
                    <div class="col">
                        <div<!--{if $arrErr[$key1]}--> class="is-invalid"<!--{/if}-->>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" type="radio" name="<!--{$key1}-->" id="man" value="1" <!--{if $arrForm.sex eq 1}--> checked="checked"<!--{/if}--> />
                                <label class="form-check-label" for="man">男性</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" type="radio" name="<!--{$key1}-->" id="woman" value="2" <!--{if $arrForm.sex eq 2}--> checked="checked"<!--{/if}--> />
                                <label class="form-check-label" for="woman">女性</label>
                            </div>
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
                <!--{assign var=key1 value="recommend_level"}-->
                <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">おすすめレベル<span class="attention">※</span></label>
                <div class="col">
                    <select id="<!--{$key1}-->" name="<!--{$key1}-->" class="form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->">
                        <option value="" selected="selected">選択してください</option>
                            <!--{html_options options=$arrRECOMMEND selected=$arrForm.recommend_level}-->
                    </select>
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
            <div class="form-group row">
                <!--{assign var=key1 value="title"}-->
                <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">タイトル<span class="attention">※</span></label>
                <div class="col">
                    <input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm.title|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" class="box350 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->" />
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
            <div class="form-group row">
                <!--{assign var=key1 value="comment"}-->
                <label for="<!--{$key1}-->" class="col-12 col-sm-3 col-form-label">コメント<span class="attention">※</span></label>
                <div class="col">
                    <textarea id="<!--{$key1}-->" name="<!--{$key1}-->" cols="50" rows="10" class="area350 form-control<!--{if $arrErr[$key1]}--> is-invalid<!--{/if}-->"><!--{"\n"}--><!--{$arrForm.comment|h}--></textarea>
                    <!--{if $arrErr[$key1]}-->
                        <div class="invalid-feedback">
                            <!--{$arrErr[$key1]}-->
                        </div>
                    <!--{/if}-->
                </div>
            </div>
        </div>
        <div class="btn_area py-4">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <input type="submit" class="btn btn-primary btn-block" value="確認ページへ" />
                </div>
            </div>
        </div>
    </form>
</div>

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->
