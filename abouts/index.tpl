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

<!--{if $arrSiteInfo.latitude && $arrSiteInfo.longitude}-->
    <script type="text/javascript">//<![CDATA[
        $(function() {
            $("#maps").css({
                'margin-top': '15px',
                'margin-left': 'auto',
                'margin-right': 'auto',
                'width': '98%',
                'height': '300px'
            });
            var lat = <!--{$arrSiteInfo.latitude}-->
            var lng = <!--{$arrSiteInfo.longitude}-->
            if (lat && lng) {
                var latlng = new google.maps.LatLng(lat, lng);
                var mapOptions = {
                    zoom: 15,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map($("#maps").get(0), mapOptions);
                var marker = new google.maps.Marker({map: map, position: latlng});
            } else {
                $("#maps").remove();
            }
        });
    //]]></script>
<!--{/if}-->
<div id="undercolumn">

    <div id="undercolumn_aboutus">
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <dl class="row">
            <!--{if strlen($arrSiteInfo.shop_name)}-->
                <dt class="col12 col-sm-3">店名</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.shop_name|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.company_name)}-->
                <dt class="col12 col-sm-3">会社名</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.company_name|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.zip01)}-->
                <dt class="col12 col-sm-3">所在地</dt>
                <dd class="col12 col-sm-9">〒<!--{$arrSiteInfo.zip01|h}-->-<!--{$arrSiteInfo.zip02|h}--><br /><!--{$arrPref[$arrSiteInfo.pref]|h}--><!--{$arrSiteInfo.addr01|h}--><!--{$arrSiteInfo.addr02|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.tel01)}-->
                <dt class="col12 col-sm-3">電話番号</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.tel01|h}-->-<!--{$arrSiteInfo.tel02|h}-->-<!--{$arrSiteInfo.tel03|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.fax01)}-->
                <dt class="col12 col-sm-3">FAX番号</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.fax01|h}-->-<!--{$arrSiteInfo.fax02|h}-->-<!--{$arrSiteInfo.fax03|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.email02)}-->
                <dt class="col12 col-sm-3">メールアドレス</dt>
                <dd class="col12 col-sm-9"><a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.business_hour)}-->
                <dt class="col12 col-sm-3">営業時間</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.business_hour|h}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.good_traded)}-->
                <dt class="col12 col-sm-3">取扱商品</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.good_traded|h|nl2br}--></dd>
            <!--{/if}-->

            <!--{if strlen($arrSiteInfo.message)}-->
                <dt class="col12 col-sm-3">メッセージ</dt>
                <dd class="col12 col-sm-9"><!--{$arrSiteInfo.message|h|nl2br}--></dd>
            <!--{/if}-->

        </dl>

        <div id="maps"></div>
    </div>
</div>
