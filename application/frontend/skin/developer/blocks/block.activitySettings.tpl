{**
 * Блок настройки ленты активности
 *
 * @styles css/blocks.css
 *}

{extends 'blocks/block.aside.base.tpl'}

{block 'block_title'}{$aLang.stream_block_config_title}{/block}
{block 'block_type'}activity{/block}

{block 'block_content'}
	{if $oUserCurrent}
		<small class="note mb-15">{$aLang.stream_settings_note_filter}</small>

		{foreach $aStreamEventTypes as $sType => $aEventType}
			{if ! ($oConfig->get('module.stream.disable_vote_events') && substr($sType, 0, 4) == 'vote')}
				{$sLangKey = "stream_event_type_`$sType`"}

				{include 'forms/fields/form.field.checkbox.tpl'
						 sFieldInputClasses    = 'js-activity-settings-toggle'
						 sFieldInputAttributes = "data-type=\"{$sType}\""
						 bFieldChecked         = in_array($sType, $aStreamTypesList)
						 sFieldLabel           = $aLang.$sLangKey}
			{/if}
		{/foreach}
	{/if}
{/block}