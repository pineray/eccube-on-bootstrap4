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
    <dt class="col-12 col-sm-3">お名前</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`name01"}-->
        <!--{assign var=key2 value="`$prefix`name02"}-->
        <!--{$arrForm[$key1].value|h}-->&nbsp;
        <!--{$arrForm[$key2].value|h}-->
    </dd>
    <dt class="col-12 col-sm-3">お名前(フリガナ)</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`kana01"}-->
        <!--{assign var=key2 value="`$prefix`kana02"}-->
        <!--{$arrForm[$key1].value|h}-->&nbsp;
        <!--{$arrForm[$key2].value|h}-->
    </dd>
    <dt class="col-12 col-sm-3">会社名</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`company_name"}-->
        <!--{$arrForm[$key1].value|h}-->
    </dd>
    <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
        <dt class="col-12 col-sm-3">国</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`country_id"}-->
            <!--{assign var="country_id" value=$arrForm[$key1].value}-->
            <!--{$arrCountry[$country_id]|h}-->
        </dd>
        <dt class="col-12 col-sm-3">ZIP CODE</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`zipcode"}-->
            <!--{$arrForm[$key1].value|h}-->
        </dd>
    <!--{/if}-->
    <dt class="col-12 col-sm-3">郵便番号</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`zip01"}-->
        <!--{assign var=key2 value="`$prefix`zip02"}-->
        〒 <!--{$arrForm[$key1].value|h}--> - <!--{$arrForm[$key2].value|h}-->
    </dd>
    <dt class="col-12 col-sm-3">住所</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`pref"}-->
        <!--{assign var=key2 value="`$prefix`addr01"}-->
        <!--{assign var=key3 value="`$prefix`addr02"}-->
        <!--{assign var="pref_id" value=$arrForm[$key1].value}-->
        <!--{$arrPref[$pref_id]|h}--><!--{$arrForm[$key2].value|h}--><!--{$arrForm[$key3].value|h}-->
    </dd>
    <dt class="col-12 col-sm-3">電話番号</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`tel01"}-->
        <!--{assign var=key2 value="`$prefix`tel02"}-->
        <!--{assign var=key3 value="`$prefix`tel03"}-->
        <!--{$arrForm[$key1].value|h}--> - <!--{$arrForm[$key2].value|h}--> - <!--{$arrForm[$key3].value|h}-->
    </dd>
    <dt class="col-12 col-sm-3">FAX</dt>
    <dd class="col-12 col-sm-9">
        <!--{assign var=key1 value="`$prefix`fax01"}-->
        <!--{assign var=key2 value="`$prefix`fax02"}-->
        <!--{assign var=key3 value="`$prefix`fax03"}-->
        <!--{if strlen($arrForm[$key1].value) > 0 && strlen($arrForm[$key2].value) > 0 && strlen($arrForm[$key3].value) > 0}-->
            <!--{$arrForm[$key1].value|h}--> - <!--{$arrForm[$key2].value|h}--> - <!--{$arrForm[$key3].value|h}-->
        <!--{else}-->
            未登録
        <!--{/if}-->
    </dd>
    <!--{if $flgFields > 1}-->
        <dt class="col-12 col-sm-3">メールアドレス</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`email"}-->
            <a href="mailto:<!--{$arrForm[$key1].value|escape:'hex'}-->"><!--{$arrForm[$key1].value|escape:'hexentity'}--></a>
        </dd>
        <!--{if $emailMobile}-->
            <dt class="col-12 col-sm-3">携帯メールアドレス</dt>
            <dd class="col-12 col-sm-9">
                <!--{assign var=key1 value="`$prefix`email_mobile"}-->
                <!--{if strlen($arrForm[$key1].value) > 0}-->
                    <a href="mailto:<!--{$arrForm[$key1].value|escape:'hex'}-->"><!--{$arrForm[$key1].value|escape:'hexentity'}--></a>
                <!--{else}-->
                    未登録
                <!--{/if}-->
            </dd>
        <!--{/if}-->
        <dt class="col-12 col-sm-3">性別</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`sex"}-->
            <!--{assign var="sex_id" value=$arrForm[$key1].value}-->
            <!--{$arrSex[$sex_id]|h}-->
        </dd>
        <dt class="col-12 col-sm-3">職業</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`job"}-->
            <!--{assign var="job_id" value=$arrForm[$key1].value}-->
            <!--{$arrJob[$job_id]|default:"未登録"|h}-->
        </dd>
        <dt class="col-12 col-sm-3">生年月日</dt>
        <dd class="col-12 col-sm-9">
            <!--{assign var=key1 value="`$prefix`year"}-->
            <!--{assign var=key2 value="`$prefix`month"}-->
            <!--{assign var=key3 value="`$prefix`day"}-->
            <!--{if strlen($arrForm[$key1].value) > 0 && strlen($arrForm[$key2].value) > 0 && strlen($arrForm[$key3].value) > 0}-->
            <!--{$arrForm[$key1].value|h}-->年<!--{$arrForm[$key2].value|h}-->月<!--{$arrForm[$key3].value|h}-->日
            <!--{else}-->
            未登録
            <!--{/if}-->
        </dd>
        <!--{if $flgFields > 2}-->
            <dt class="col-12 col-sm-3">希望するパスワード</dt>
            <dd class="col-12 col-sm-9"><!--{$passlen}--></dd>
            <dt class="col-12 col-sm-3">パスワードを忘れた時のヒント</dt>
            <dd class="col-12 col-sm-9">
                <!--{assign var=key1 value="`$prefix`reminder"}-->
                <!--{assign var=key2 value="`$prefix`reminder_answer"}-->
                <!--{assign var="reminder_id" value=$arrForm[$key1].value}-->
                質問：<!--{$arrReminder[$reminder_id]|h}--><br />
                答え：<!--{$arrForm[$key2].value|h}-->
            </dd>
            <dt class="col-12 col-sm-3">メールマガジン送付について</dt>
            <dd class="col-12 col-sm-9">
                <!--{assign var=key1 value="`$prefix`mailmaga_flg"}-->
                <!--{assign var="mailmaga_flg_id" value=$arrForm[$key1].value}-->
                <!--{$arrMAILMAGATYPE[$mailmaga_flg_id]|h}-->
            </dd>
        <!--{/if}-->
    <!--{/if}-->
<!--{/strip}-->
