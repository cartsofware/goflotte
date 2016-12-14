{*
Copyright 2011-2016 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}
{include file='globalheader.tpl' cssFiles='css/dashboard.css' Qtip=true}

<div id="page-dashboard">

<script type="text/javascript">
	function getDocHeight(doc) {
	    doc = doc || document;
	    // stackoverflow.com/questions/1145850/
	    var body = doc.body, html = doc.documentElement;
	    var height = Math.max( body.scrollHeight, body.offsetHeight, 
		html.clientHeight, html.scrollHeight, html.offsetHeight );
	    return height;
	}
	function setIframeHeight(id) {
	    var ifrm = document.getElementById(id);
	    var doc = ifrm.contentDocument? ifrm.contentDocument: 
		ifrm.contentWindow.document;
	    ifrm.style.visibility = 'hidden';
	    ifrm.style.height = "10px"; // reset to minimal height ...
	    // IE opt. for bing/msn needs a bit added or scrollbar appears
	    ifrm.style.height = getDocHeight( doc ) + 4 + "px";
	    ifrm.style.visibility = 'visible';
	}
</script>

	<div class="embed-responsive embed-responsive-16by9">
		<iframe id="ifrm" class="embed-responsive-item" scrolling="auto" 
			src="../plugins/Adminlte/dashboard.html" onload="setIframeHeight(this.id)">
		</iframe>
	</div>

	<div id="dashboardList">
		{foreach from=$items item=dashboardItem}
			<div>{$dashboardItem->PageLoad()}</div>
		{/foreach}
	</div>

	{jsfile src="dashboard.js"}
	{jsfile src="resourcePopup.js"}
	{jsfile src="ajax-helpers.js"}

	<script type="text/javascript">
		$(document).ready(function () {

			var dashboardOpts = {
				reservationUrl: "{Pages::RESERVATION}?{QueryStringKeys::REFERENCE_NUMBER}=",
				summaryPopupUrl: "ajax/respopup.php",
				scriptUrl: '{$ScriptUrl}'
			};

			var dashboard = new Dashboard(dashboardOpts);
			dashboard.init();
		});
	</script>
</div>

{include file='globalfooter.tpl'}
