<table class="table table-hover table-bordered table-sortable table-striped table-condensed">
    <thead>
    <tr>
        <th>{t}Zeitstempel{/t}</th>
        <th>{t}Level{/t}</th>
        <th>{t}Ereignis{/t}</th>
        <th>{t}Benutzer{/t}</th>
        <th>{t}Ziel{/t}</th>
        <th>{t}Kommentar{/t}</th>
    </tr>
    </thead>
    <tbody>
    {foreach $log as $entry}

        <tr class="
            {if $entry.level_id == 5}
                info
            {elseif $entry.level_id == 4}
                warning
            {elseif $entry.level_id <= 3}
                danger
            {/if}">
            <td>{$entry.timestamp}</td>
            <td>{$entry.level}</td>
            <td>{$entry.type}</td>
            <td>{if isset($can_show_user) && $can_show_user}
                    <a href="{$relative_path}user_info.php?uid={$entry.user_id}">{$entry.user}</a>
                {else}
                    {$entry.user}
                {/if}
            </td>
            <td></td>
            <td>{$entry.comment}</td>
        </tr>
    {/foreach}
    </tbody>
</table>