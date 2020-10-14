Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703428D83D
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 04:09:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9wpc1ndnzDqkX
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 13:09:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9wng4m8gzDqgZ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 13:08:50 +1100 (AEDT)
IronPort-SDR: hTnKUBKBkm9RyWFUs1d+g6rv7QlOlhk5GMktQKiVcZe6ye+MUmKdmm0Wljnjibn5CW7V2Ld5wr
 5/a8vSzT9dkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145335408"
X-IronPort-AV: E=Sophos;i="5.77,373,1596524400"; d="scan'208";a="145335408"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 19:08:45 -0700
IronPort-SDR: SwQOwYbvmFXUGsYy7xQl1g59y1JSIE1bAlLdpRKg9+fzOAV7YnlDHYb29KLlt8rJ8nWVTk/QlN
 fwa2G+28YfqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,373,1596524400"; d="scan'208";a="357232966"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 13 Oct 2020 19:08:44 -0700
Received: from [10.239.85.204] (shwdecce01.ccr.corp.intel.com [10.239.85.204])
 by linux.intel.com (Postfix) with ESMTP id 813D8580814;
 Tue, 13 Oct 2020 19:08:43 -0700 (PDT)
Subject: Re: How to list all sensors through redfish?
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, Lei Yu
 <yulei.sh@bytedance.com>, "Li, Yong B" <yong.b.li@intel.com>,
 Ed Tanous <ed@tanous.net>
References: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
 <CAGm54UFuP60G6-2BYerdK_+ssuWh0BYUBVdBCSaBHrHbHD0MFQ@mail.gmail.com>
 <c9fc71c8-aa5a-d00d-81f7-40d8ca2d5e63@linux.vnet.ibm.com>
From: "Li, Yong B" <yong.b.li@linux.intel.com>
Message-ID: <ac60f50b-175a-babe-cece-a6890ae3edf3@linux.intel.com>
Date: Wed, 14 Oct 2020 10:08:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <c9fc71c8-aa5a-d00d-81f7-40d8ca2d5e63@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "feistjj@gmail.com" <feistjj@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/14/2020 12:30 AM, Gunnar Mills wrote:
> On 10/12/2020 8:17 PM, Lei Yu wrote:
>> On Sat, Oct 10, 2020 at 9:06 PM Li, Yong B <yong.b.li@intel.com> wrote:
>>>
>>> Hi All,
>>>
>>> Based on the current bmcweb implementation:
>>>
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L61 
>>>
>>>
>>> The below URL only list these power/current/utilization sensors:
>>>
>>> redfish/v1/Chassis/$chassis/Sensors
>>>
>>> Just want to know why not list all running sensors? Is it required 
>>> by redfish spec?
>
> We asked this question in the Redfish forum thread below and Redfish 
> said "for sensors that are not covered elsewhere in the model - 
> meaning don't duplicate Power and Thermal".
Thanks a lot for your clarification!
>
>>>
>>>
>>> Is there any way to  list all sensors through redfish interface? 
>>> Like the “ipmitool sensor list” command?
>>>
>
> Not in one command. You will have to call the Thermal, Power, and 
> Sensors schemas like the webui does: 
> https://github.com/openbmc/webui-vue/blob/e9a59c75670461a80156554a4dfa04bab5eaf42c/src/store/modules/Health/SensorsStore.js#L22
>
> In 2020.4, this changes and all sensors will be in one location. :)

YES! the #/health/sensors webpage will display all these sensors, but I 
found a minor issue and submitted a code review


>
>>
>> I just saw some discussion in the IRC by GunnarM quoted as:
>>
>>> /sensors is sensors that aren't in Power/Thermal 
>>> https://redfishforum.com/thread/190/sensorcollection-contain-all-sensors-chassis
>>> For 2020.4 this changes, all sensors will be under /sensors with 
>>> only a link to the Power/Thermal/Fan/Powersupply schemas
>>
>> But from the Redfish spec it does not say /sensors should exclude the
>> ones in Power/Thermal, instead /sensors is "the link to the collection
>> of sensors located in the equipment and sub-components"
> Yeah the spec should have clarified. Probably isn't worth clarifying 
> in the spec now because this changes in 2020.4 and that would be the 
> release any updated spec is available.
>
>> So I am expecting that it should contain all the sensors in the system.
>> In OpenBMC, this could be done by returning all the objects that
>> implement the xyz.openbmc_project.Sensor.Value interface.
>>
>
> We implemented this way because of that thread. Feel free to reply on 
> that thread.
>
> Thanks,
> Gunnar
