{**
 * Навигация по блогам с возможностью выбрать категорию и блог из этой категории
 *
 * @styles css/blocks.css
 *}

{extends 'blocks/block.aside.base.tpl'}

{block 'block_title'}{$aLang.block_blog_navigator}{/block}
{block 'block_type'}blog-navigation{/block}

{block 'block_content'}
	{if $aNavigatorBlogCategories}
		<p><select class="width-full js-blog-nav-categories">
			<option value="0">{$aLang.blog.categories.category}</option>

			{foreach $aNavigatorBlogCategories as $oCategoryItem}
				<option style="margin-left: {$oCategoryItem->getLevel()*20}px;" value="{$oCategoryItem->getId()}">{$oCategoryItem->getTitle()|escape}</option>
			{/foreach}
		</select></p>

		<p><select class="width-full js-blog-nav-blogs" disabled>
			<option value="0">{$aLang.blog.blog}</option>

			{foreach $aNavigatorBlogs as $oBlogItem}
				<option value="{$oBlogItem->getId()}" data-url="{$oBlogItem->getUrlFull()}">{$oBlogItem->getTitle()|escape}</option>
			{/foreach}
		</select></p>

		{include 'forms/fields/form.field.button.tpl' sFieldText=$aLang.block_blog_navigator_button sFieldClasses='js-blog-nav-submit' bFieldIsDisabled=true}
	{else}
		{include 'alert.tpl' mAlerts=$aLang.blog.categories.empty sAlertStyle='empty'}
	{/if}
{/block}