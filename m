Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19513CE2D
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 21:46:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yfVy6Q65zDqSc
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 07:46:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yfV65z6NzDqRF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 07:45:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 12:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="273755088"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2020 12:45:29 -0800
Subject: Re: No sensors displayed in webUI
To: Patrick Williams <patrick@stwcx.xyz>
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
 <3ae17538-5e0d-1228-a242-56ab25dd3229@linux.intel.com>
 <20200115192701.GD3512@patrickw3-mbp.dhcp.thefacebook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <90469760-8693-9481-524a-1b3d92825df2@linux.intel.com>
Date: Wed, 15 Jan 2020 12:45:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20200115192701.GD3512@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Max Power <max_power2005-openbmc@yahoo.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/15/20 11:27 AM, Patrick Williams wrote:
> On Wed, Jan 15, 2020 at 09:26:48AM -0800, James Feist wrote:
>> There was a thread about this last week:
>>
>> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020044.html
>> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020136.html
>>
>> TL;DR all the sensors are available in Redfish, but the WebUI hasn't move
>> over to full Redfish support yet. There is a test patch that helps enable
>> this in the thread.
> 
> Hi James,
> 
> This statement about a dependency on Redfish stood out to me.  The
> current UI is mostly using the "old" REST API, but as long as the dbus
> objects are created correctly it should not matter one bit if the
> external interface is the dbus-based REST API or the Redfish one.
> 
> This is a bug in dbus-sensors that is independent of Redfish vs REST.
> 
> The current webui code expects there to be properties that are specified
> in phosphor-dbus-interfaces.  Specifically, it is looking for the "Unit"
> property[1], which is a required property on
> xyz.openbmc_project.Sensor.Value[2].  The dbus-sensors has a bunch of
> Sensor.Value objects that are violating the interface spec by not
> providing "Unit" [3].  Notice that `setInitialProperties` doesn't
> register_property on "Unit" and neither does any other code in this
> repository[4].
> 
> Why is none of this code using the code generated from
> phosphor-dbus-interfaces?  Since it is generating dbus objects "by
> hand" it isn't not getting any compile-time checking if it is doing the
> wrong thing (or more likely that the phosphor-dbus-interface changes out
> from underneath it).

There is a long history of this where I tried to get everyone to update 
the sensor value interface to use double instead of INT. I had a large 
agreement, but unfortunately updating all of the daemons that we did not 
use (and without any good way of testing), and trying to get by-in or 
help from all the maintainers became too large of a job. I updated as 
many daemons as I could to accept both before I ran out of time. At the 
same time, I was also phasing out unit, as unit was easy enough to read 
from the sensor path, and redundant information. All of our internal 
daemons don't use phosphor-dbus-interfaces to create interfaces, as we 
have found the code generation difficult to explain to new users, and it 
also makes it difficult to upgrade daemons as all patches need to be 
merged at once. We have been updating interfaces for documentation 
purposes, but haven't used them for any new work in quite some time.


> 
> [1] https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b4d77be07e4399122/app/common/services/api-utils.js#L979
> [2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L32
> [3] https://github.com/openbmc/dbus-sensors/blob/fbb44ad1ea716d4e8c2cacdf01d380c6d0f53855/include/sensor.hpp#L13
> [4] https://github.com/openbmc/dbus-sensors/search?utf8=%E2%9C%93&q=unit&type=
> 
