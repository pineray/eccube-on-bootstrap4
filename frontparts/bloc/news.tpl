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

<!--{strip}-->
    <div class="block_outer">
        <div id="news_area">
            <h2><i class="bi bi-newspaper"></i> 新着情報 <span class="rss"><a href="<!--{$smarty.const.ROOT_URLPATH}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" target="_blank"><i class="bi bi-rss-fill"></i></a></span></h2>
            <div class="block_body">
                <div class="news_contents accordion" id="news-contents-accordion">
                <!--{section name=data loop=$arrNews}-->
                <!--{assign var="date_array" value="-"|explode:$arrNews[data].cast_news_date}-->
                <div class="newslist card">
                    <div id="news-heading<!--{$smarty.section.data.index}-->" class="card-header">
                        <small><!--{$date_array[0]}-->年<!--{$date_array[1]}-->月<!--{$date_array[2]}-->日</small>
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#news-collapse<!--{$smarty.section.data.index}-->" aria-expanded="false" aria-controls="news-collapse<!--{$smarty.section.data.index}-->">
                            <!--{$arrNews[data].news_title|h|nl2br}-->
                        </button>
                    </div>
                    <div id="news-collapse<!--{$smarty.section.data.index}-->" class="collapse" aria-labelledby="news-heading<!--{$smarty.section.data.index}-->" data-parent="#news-contents-accordion">
                        <div class="card-body">
                            <div><!--{$arrNews[data].news_comment|h|nl2br}--></div>
                            <!--{if $arrNews[data].news_url}-->
                            <p class="mt-3 mb-0">
                                <a href="<!--{$arrNews[data].news_url}-->"<!--{if $arrNews[data].link_method eq "2"}--> target="_blank"<!--{/if}-->>
                                    詳しくはこちら<!--{if $arrNews[data].link_method eq "2"}--> <i class="bi bi-box-arrow-up-right"></i><!--{/if}-->
                                </a>
                            </p>
                            <!--{/if}-->
                        </div>
                    </div>
                </div>
                <!--{/section}-->
                </div>
            </div>
        </div>
    </div>
<!--{/strip}-->
