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


	Reservation Details:
	<br/>
	<br/>

	User: {$UserName}
	Starting: {formatdate date=$StartDate key=reservation_email}<br/>
	Ending: {formatdate date=$EndDate key=reservation_email}<br/>
	Resource: {$ResourceName}<br/>

	{if $ResourceImage}
		<div class="resource-image"><img src="{$ScriptUrl}/{$ResourceImage}"/></div>
	{/if}

	Title: {$Title}<br/>
	Description: {$Description}<br/>

	{if count($RepeatDates) gt 0}
		<br/>
		The reservation occurs on the following dates:
		<br/>
	{/if}

	{foreach from=$RepeatDates item=date name=dates}
		{formatdate date=$date}<br/>
	{/foreach}

	{if $RequiresApproval}
		<br/>
		One or more of the resources reserved require approval before usage.  Please ensure that this reservation request is approved or rejected.
	{/if}

	<br/>
	<a href="{$ScriptUrl}{$ReservationUrl}">View this reservation</a> | <a href="{$ScriptUrl}">Log in to Booked Scheduler</a>
