﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NzbDrone.Web.Models.EpisodeSortingModel>" %>

<script type="text/javascript">
    $(document).ready(function () {
        var options = {
            target: '#result',
            beforeSubmit: showRequest,
            success: showResponse,
            type: 'post',
            resetForm: false
        };
        $('#form').ajaxForm(options);
        $('#save_button').attr('disabled', '');
    });

    function showRequest(formData, jqForm, options) {
        $("#result").empty().html('Saving...');
        $("#form :input").attr("disabled", true);
    }

    function showResponse(responseText, statusText, xhr, $form) {
        $("#result").empty().html(responseText);
        $("#form :input").attr("disabled", false);
    }                
</script>

    <% Html.EnableClientValidation(); %>

<% using (Html.BeginForm("SaveEpisodeSorting", "Settings", FormMethod.Post, new { id = "form", name = "form" }))
       {%>
<%--<%: Html.ValidationSummary(true, "Unable to save your settings. Please correct the errors and try again.") %>--%>

    <fieldset>
        <legend>Episode Sorting</legend>
                    
            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.ShowName)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.ShowName)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.ShowName)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.EpisodeName)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.EpisodeName)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.EpisodeName)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.ReplaceSpaces)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.ReplaceSpaces)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.ReplaceSpaces)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.AppendQuality)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.AppendQuality)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.AppendQuality)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.UseAirByDate)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.UseAirByDate)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.UseAirByDate)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.SeasonFolders)%></div>
                    <div class="config-value"><%= Html.CheckBoxFor(m => m.SeasonFolders)%></div>
                    
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.SeasonFolders)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.SeasonFolderFormat)%></div>
                    <div class="config-value"><%= Html.TextBoxFor(m => m.SeasonFolderFormat)%></div>
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.SeasonFolderFormat)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.SeparatorStyle) %></div>
                    <div class="config-value"><%= Html.DropDownListFor(m => m.SeparatorStyle, Model.SeparatorStyles)%></div>
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.SeparatorStyle)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.NumberStyle) %></div>
                    <div class="config-value"><%= Html.DropDownListFor(m => m.NumberStyle, Model.NumberStyles)%></div>
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.NumberStyle)%></div>
            </div>

            <div class="config-section">
                <div class="config-group">
                    <div class="config-title"><%= Html.LabelFor(m => m.MultiEpisodeStyle) %></div>
                    <div class="config-value"><%= Html.DropDownListFor(m => m.MultiEpisodeStyle, Model.MultiEpisodeStyles)%></div>
                </div>
                <div class="config-validation"><%= Html.ValidationMessageFor(m => m.MultiEpisodeStyle)%></div>
            </div>

            <input type="submit" id="save_button" value="Save" disabled="disabled" />
    
    <% } %>
    </fieldset>
<div id="result"></div>