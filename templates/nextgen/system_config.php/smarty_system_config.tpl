{locale path="nextgen/locale" domain="partdb"}
{if isset($refresh_navigation_frame)}
    <script type="text/javascript">
        location.reload();
    </script>
{/if}

{if $can_read}
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-cog" aria-hidden="true"></i> {t}Systemeinstellungen{/t}
        </div>
        <div class="panel-body">
            <form class="form-horizontal" action="" method="post" class="no-progbar">
                <p class="help-block">{t}Auf dieser Seite sind nur die wichtigsten Einstellungen vorhanden, weitere Einstellungen kann man direkt in der "config.php" vornehmen. Mögliche Parameter entnehmen Sie bitte der "config_defaults.php" oder der Dokumentation.{/t}</p>

                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#appearance" class="link-anchor">
                        <span class="fa-stack">
                            <i class="far fa-square fa-stack-2x"></i>
                            <i class="fa fa-magic fa-stack-1x"></i>
                        </span>
                            {t}Aussehen{/t}</a></li>
                    <li><a data-toggle="tab" href="#features" class="link-anchor">
                         <span class="fa-stack">
                            <i class="far fa-square fa-stack-2x"></i>
                            <i class="fa fa-sliders-h fa-stack-1x"></i>
                        </span>
                            {t}Funktionen{/t}</a></li>
                    <li><a data-toggle="tab" href="#misc" class="link-anchor">
                        <span class="fa-stack">
                            <i class="far fa-square fa-stack-2x"></i>
                            <i class="fa fa-cogs fa-stack-1x"></i>
                        </span>
                            {t}Sonstiges{/t}</a></li>
                    {if $developer_mode_available}<li><a data-toggle="tab" href="#dev" class="link-anchor">
                        <span class="fa-stack">
                            <i class="far fa-square fa-stack-2x"></i>
                            <i class="fa fa-code fa-stack-1x"></i>
                        </span>
                            {t}Entwickler{/t}
                        </a></li>{/if}
                </ul>

                <div class="tab-content">
                    <div id="appearance" class="tab-pane fade in active">
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="custom_css">{t}Theme:{/t}</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="custom_css">
                                    <option value="">{t}Standardmäßiges Theme{/t}</option>
                                    {foreach $custom_css_loop as $css}
                                        <option value="{$css.value}" {if $css.selected}selected{/if}>{$css.text}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="checkbox-container" class="control-label col-sm-2">{t}Aussehen:{/t}</label>
                            <div class="checkbox-container col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="use_old_datasheet_icons" {if $use_old_datasheet_icons} checked{/if}>
                                    <label>{t}Alte (farbige) Icons für automatisch erzeugte Datenblattlinks benutzen{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="short_description" {if $short_description} checked{/if}>
                                    <label>{t}Länge der Bauteilebeschreibungen in den Übersichtstabellen begrenzen{/t}</label>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="checkbox-container" class="control-label col-sm-2">{t}Detailinfos:{/t}</label>
                            <div class="checkbox-container col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="info_hide_actions" {if $info_hide_actions} checked{/if}>
                                    <label>{t}Verstecke "Aktionen" Dialog in den Detailinfos{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="info_hide_empty_orderdetails" {if $info_hide_empty_orderdetails} checked{/if}>
                                    <label>{t}Verstecke "Einkaufsinformationen" Panel, wenn keine Einkaufsinformationen vorhanden sind.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="info_hide_empty_attachements" {if $info_hide_empty_attachements} checked{/if}>
                                    <label>{t}Verstecke "Dateianhänge" Panel, wenn keine Dateianhänge vorhanden sind.{/t}</label>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="checkbox-container" class="control-label col-sm-2">{t}"Sonstiges" Panel:{/t}</label>
                            <div class="checkbox-container col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="others_panel_collapse" {if $others_panel_collapse} checked{/if}>
                                    <label>{t}"Sonstiges" Panel ist standardmäßig eingeklappt{/t}</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="checkbox-container" class="control-label col-sm-2">{t}"Sonstiges" Panel Position:{/t}</label>
                            <div class="col-sm-10">
                                <select name="others_panel_position" class="form-control">
                                    <option value="top" {if $others_panel_position == "top"}selected{/if}>{t}Oben{/t}</option>
                                    <option value="bottom" {if $others_panel_position == "bottom"}selected{/if}>{t}Unten{/t}</option>
                                    <option value="both" {if $others_panel_position == "both"}selected{/if}>{t}Oben und Unten{/t}</option>
                                    <option value="" {if $others_panel_position == ""}selected{/if}>{t}Nicht anzeigen{/t}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div id="features" class="tab-pane fade">
                        <br>
                        <div class="form-group">
                            <label for="checkbox-container" class="control-label col-sm-2">{t}Allgemein:{/t}</label>

                            <div id="checkbox-container" class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="disable_updatelist" {if $disable_updatelist} checked{/if}>
                                    <label for="disable_updatelist">{t}Updateliste (RSS-Feed) auf Startseite verstecken (verringert die Ladezeit){/t}</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_search_warning" {if $disable_search_warning} checked{/if}>
                                    <label for="disable_search_warning">{t}Hinweis auf fehlende Datenstrukturen (Lagerorte, Hersteller, etc.) auf Startseite ausblenden.{/t}</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_footprints" {if $disable_footprints} checked{/if}>
                                    <label for="disable_footprints">{t}Footprints global deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_manufacturers" {if $disable_manufacturers} checked{/if}>
                                    <label for="disable_manufacturers">{t}Hersteller global deaktivieren{/t}</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_suppliers" {if $disable_suppliers} checked{/if}>
                                    <label for="disable_suppliers">{t}Lieferanten und Einkaufsinformationen global deaktivieren{/t}</label>
                                </div>


                                <div class="checkbox">
                                    <input type="checkbox" name="disable_devices" {if $disable_devices} checked{/if}>
                                    <label for="disable_devices">{t}Baugruppenfunktion global deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_auto_datasheets" {if $disable_auto_datasheets} checked{/if}>
                                    <label for="disable_auto_datasheets">{t}Automatische Links zu Datenblättern global deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_help" {if $disable_help} checked{/if}>
                                    <label for="disable_help">{t}Menüpunkt "Hilfe" deaktivieren{/t}</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_config" {if $disable_config} checked{/if} {if $is_online_demo}disabled{/if}>
                                    <label>{t}Menüpunkt "System" deaktivieren{/t}</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_labels" {if $disable_labels} checked{/if}>
                                    <label>{t}Menüpunkt "Tools -> Labels" deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_calculator" {if $disable_calculator} checked{/if}>
                                    <label>{t}Menüpunkt "Tools -> Widerstandsrechner" deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_iclogos" {if $disable_iclogos} checked{/if}>
                                    <label>{t}Menüpunkt "Tools -> IC-Logos" deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="disable_tools_footprints" {if $disable_tools_footprints} checked{/if}>
                                    <label>{t}Menüpunkt "Tools -> Footprints" deaktivieren{/t} *</label>
                                </div>

                                <div class="checkbox">
                                    <input type="checkbox" name="tools_footprints_autoload" {if $tools_footprints_autoload} checked{/if}>
                                    <label>{t}Unter "Tools -> Footprints" beim Aufruf automatisch alle Bilder laden (lange Ladezeit!){/t}</label>
                                </div>

                                <br>
                                <div>
                                    <p class="help-block">* {t}Durch das Aktivieren dieser Checkboxen ist Part-DB auch für Nicht-Elektronische Bauteile hervorragend geeignet.{/t}</p>
                                </div>

                            </div>

                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="modal-container" class="control-label col-sm-2">{t}3D-Footprints:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="foot3d_active" {if $foot3d_active} checked{/if}>
                                    <label for="foot3d_active">{t}3D-Footprints aktiviert{/t}</label>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="modal-container" class="control-label col-sm-2">{t}Bauteilebearbeitung:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="created_redirect" {if $created_redirect} checked{/if}>
                                    <label for="properties_active">{t}Springe zu Bauteileübersicht, nachdem ein neues Teil angelegt wurde.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="saved_redirect" {if $saved_redirect} checked{/if}>
                                    <label for="properties_active">{t}Springe zu Bauteileübersicht, nachdem ein neues Teil bearbeitet und gespeichert wurde.{/t}</label>
                                </div>
                                <p class="help-block">{t}Tipp: Wird der Dialog zur Erzeugung bzw. Bearbeitung von Bauteilen mit einem Rechtsklick bestätigt, so werden obige Einstellungen, für diese Aktion umgekehrt.{/t}<br>
                                    {t}So wird bei einem Rechtsklick auf "Bauteil anlegen", auch ohne oben gesetzen Haken, auf die Übersichtsseite des neuen Bauteils umgeleitet, und umgekehrt.{/t}
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="modal-container" class="control-label col-sm-2">{t}Bauteileeigenschaften:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="properties_active" {if $properties_active} checked{/if}>
                                    <label for="properties_active">{t}Bauteileigenschaften global aktiv.{/t}</label>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="modal-container" class="control-label col-sm-2">{t}Bauteilesuche:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="livesearch_active" {if $livesearch_active} checked{/if}>
                                    <label for="properties_active">{t}Suche bereits während der Eingabe in das Suchfeld (Livesuche).{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="search_highlighting" {if $search_highlighting} checked{/if}>
                                    <label for="properties_active">{t}Hebe den Suchbegriff in den Ergebnissen hervor (Highlighting).{/t}</label>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label for="modal-container" class="control-label col-sm-2">{t}Bauteiletabellen:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="table_autosort" {if $table_autosort} checked{/if}>
                                    <label for="table_autosort">{t}Aktiviere initiale Sortierung.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="default_subcat" {if $default_subcat} checked{/if}>
                                    <label for="default_subcat">{t}Zeige die beim Auflisten aller Teile einer Kategorie, die Unterkategorien standarmäßig.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="show_full_paths" {if $show_full_paths} checked{/if}>
                                    <label for="default_subcat">{t}Zeige vollständige Pfade in Tabellen an.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="instock_warning_full_row" {if $instock_warning_full_row} checked{/if}>
                                    <label>{t}Markiere die gesamte Zeile, falls ein Teil zum Autobestellen vorgemerkt ist.{/t}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">{t}Standardmäßige Anzahl von Bauteilen pro Seite:{/t}</label>
                            <div class="col-md-10">
                                <input type="number" class="form-control" name="default_limit" min="0" step="1" value="{$default_limit}"/>
                                <p class="help-block">
                                    {t}Setze diesen Wert auf 0, um standardmäßig alle Bauteile anzuzeigen.{/t}
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label class="control-label col-sm-2">{t}Dateianhänge:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="attachements_structure" {if $attachements_structure} checked{/if}>
                                    <label for="table_autosort">{t}Speichere Anhänge in Ordnerstruktur, ähnlich der Kategorienhierachie.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="attachements_download" {if $attachements_download} checked{/if}>
                                    <label for="table_autosort">{t}Lade Medien von externen Quellen standardmäßig herunter.{/t}</label>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="attachements_show_name" {if $attachements_show_name} checked{/if}>
                                    <label for="table_autosort">{t}Zeige die Namen der Anhängen in der Übersichtstabelle (statt Icons).{/t}</label>
                                </div>
                            </div>
                        </div>

                    </div>

                    {if $developer_mode_available}
                        <br>
                        <div id="dev" class="tab-pane fade">
                            <div class="form-group">
                                <label for="checkbox-container" class="control-label col-sm-2">{t}Entwickleroptionen:{/t}</label>
                                <div id="checkbox-container" class="col-sm-10">
                                    <div class="checkbox">
                                        <input type="checkbox" name="enable_developer_mode" {if $enable_developer_mode} checked{/if}>
                                        <label>{t}Entwickler-Werkzeuge aktivieren (für Entwickler und Tester){/t}</label>
                                    </div>

                                    <div class="checkbox">
                                        <input type="checkbox" name="enable_debug_link" {if $enable_debug_link} checked{/if}>
                                        <label>{t}Menüpunkt "System -> Debugging" aktivieren{/t}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <div id="misc" class="tab-pane fade">
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="timezon">{t}Zeitzone:{/t}</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker" data-live-search="true" name="timezone">
                                    {foreach $timezone_loop as $timezone}
                                        <option value="{$timezone.value}" {if $timezone.selected}selected{/if}>{$timezone.text}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="language">{t}Sprache:{/t}</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="language">
                                    {foreach $language_loop as $lang}
                                        <option value="{$lang.value}" {if $lang.selected}selected{/if}>{$lang.text}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="page_title" class="control-label col-sm-2">{t}Titel der Seite:{/t}</label>
                            <div class="col-sm-10">
                                <input type="text" name="page_title" class="form-control" placeholder="{t}Part-DB Elektronische Bauteile-Datenbank{/t}" value="{$page_title}" {if $is_online_demo}disabled{/if}>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="startup_banner" class="control-label col-sm-2">{t}Eigener Banner für die Startseite (BB-Code):{/t}</label>
                            <div class="col-sm-10">
                                <textarea name="startup_banner" rows="5" class="form-control"  {if $is_online_demo}disabled{/if}>{$startup_banner}</textarea>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="checkbox">
                                    <input type="checkbox" name="downloads_enable" {if $downloads_enable} checked{/if}>
                                    <label for="downloads_enable">{t}Erlaube Nutzern Dateien (z.B. Anhänge) über den Server herunterzuladen.{/t}</label>
                                </div>
                                <p class="help-block"><b>{t}Achtung:{/t}</b> {t}Wenn diese Option aktiviert ist, können Benutzer potentiell, Dateien von jedem Server herunterladen, auf den dieser Server Zugriff hat.{/t}
                                    {t}Dies könnte einen Angreifer in die Lage versetzen, auf Dateien von internen Servern zuzugreifen.{/t}</p>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <label class="control-label col-sm-2">{t}Benutzer:{/t}</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <input type="checkbox" name="gravatar_enable" {if $gravatar_enable} checked{/if}>
                                    <label for="downloads_enable">{t}Benutze Gravatar für Benutzeravatare.{/t}</label>
                                </div>
                                <p class="help-block"><b>{t}Achtung:{/t}</b> {t}Wenn diese Option aktiv ist, werden die Email Addressen der Benutzer in MD5 gehashter Form an die Server von Gravatar gesendet.{/t}</p>
                                <div class="checkbox">
                                    <input type="checkbox" name="login_redirect" {if $login_redirect} checked{/if}>
                                    <label for="login_redirect">{t}Leite einen Benutzer ohne Rechte beim Aufruf der Startseite, zum Login weiter.{/t}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">{t}Maximale Sessiondauer (in Sekunden):{/t}</label>
                            <div class="col-sm-10">
                                <input type="number" min="0" step="1" name="max_sessiontime" class="form-control" value="{$gc_lifetime}" placeholder="5400">
                                <p class="help-block">{t}Wenn der Wert auf 0 gesetzt ist, wird der Standardwert von PHP verwendet.{/t}</p>
                            </div>
                        </div>

                        <br>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2">
                            <button class="btn btn-success" type="submit" name="apply" {if !$can_edit}disabled{/if}>{t}Einstellungen übernehmen{/t}</button>
                            <button class="btn btn-danger" type="submit" {if !$can_edit}disabled{/if}>{t}Änderungen verwerfen{/t}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
{/if}

{if !$is_online_demo && $can_infos}
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-server" aria-hidden="true"></i>
            {t}Server{/t}
        </div>
        <table width="" class="table table-condensed">
            <thead>
            <tr>
                <th>{t}Eigenschaft{/t}</th>
                <th>{t}Wert{/t}</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><b>{t}PHP-Version:{/t}</b></td>
                <td>{$php_version}</td>
            </tr>
            <tr>
                <td><b>{t}.htaccess funktioniert:{/t}</b></td>
                <td>{if $htaccess_works}<span class="text-success">{t}ja{/t}</span>{else}
                        <span class="text-danger font-weight-bold">{t}nein{/t}</span>{/if}</td>
            </tr>
            <tr>
                <td><b>{t}Verbindung benutzt HTTPS:{/t}</b></td>
                <td>{if $using_https}<span class="text-success">{t}ja{/t}</span>{else}
                        <span class="text-danger font-weight-bold">{t}nein{/t}</span>{/if}</td>
            </tr>
            <tr>
                <td><b>{t}Max. Input Vars:{/t}</b></td>
                <td>{$max_input_vars}</td>
            </tr>
            <tr>
                <td><b>{t}Maximale Dateigröße beim Upload:{/t}</b></td>
                <td>{$max_upload_filesize}B</td>
            </tr>
            <tr>
                <td><b>{t}Maximale Zeit bis eine unbenutze Benutzersession geschlossen wird:{/t}</b></td>
                <td>{$session_gc_maxlifetime}s</td>
            </tr>
            <tr>
                <td><b>{t}Lebensdauer der Sessioncookies:{/t}</b></td>
                <td>{$session_cookie_lifetime}</td>
            </tr>
            </tbody>
        </table>
    </div>
{/if}
