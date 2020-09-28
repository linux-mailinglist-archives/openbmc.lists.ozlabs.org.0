Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D412527B709
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 23:33:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0bNb5g67zDqN8
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 07:33:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0bMm6155zDqMp
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 07:32:35 +1000 (AEST)
IronPort-SDR: 4iSR7M6tIpoX1vYpM2nthalMWNRz13kfgAHi+LPT137Xvrp/hTZYliFhkcRcc1aeHHki8WxMwF
 4nfjwlTsxJag==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="161294705"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="161294705"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 14:32:33 -0700
IronPort-SDR: aTG/cKw+e7eviHwz8dRu6t+ArGf3eZZrveL8/M0kqu1pYTFonwH6ZBnTwRJiI6DbuZPH/wiQ2q
 t5HP2R5Y5Q0A==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="415140228"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.88.56])
 ([10.254.88.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 14:32:32 -0700
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Zev Weiss <zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
Date: Mon, 28 Sep 2020 14:32:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/28/2020 2:09 PM, Zev Weiss wrote:
> On Mon, Sep 28, 2020 at 03:21:23PM CDT, Jae Hyun Yoo wrote:
>> On 9/28/2020 12:54 PM, Zev Weiss wrote:
>>> On Mon, Sep 28, 2020 at 02:08:24PM CDT, Jae Hyun Yoo wrote:
>>>>
>>>>
>>>> On 9/26/2020 2:27 PM, Zev Weiss wrote:
>>>>> Zero-based numbering is more consistent with all other cpu/core
>>>>> numbering I'm aware of (including the PECI spec).
>>>>>
>>>>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>>>> ---
>>>>>  drivers/hwmon/peci-cputemp.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/peci-cputemp.c 
>>>>> b/drivers/hwmon/peci-cputemp.c
>>>>> index b9fe91281d58..78e442f433a7 100644
>>>>> --- a/drivers/hwmon/peci-cputemp.c
>>>>> +++ b/drivers/hwmon/peci-cputemp.c
>>>>> @@ -363,7 +363,7 @@ static int create_core_temp_label(struct 
>>>>> peci_cputemp *priv, int idx)
>>>>>      if (!priv->coretemp_label[idx])
>>>>>          return -ENOMEM;
>>>>> -    sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
>>>>> +    sprintf(priv->coretemp_label[idx], "Core %d", idx);
>>>>
>>>> Differently from low level indexing, it's labeling for users and it
>>>> should be synced with other temp or ADC sensors such as
>>>>
>>>> PVCCIN CPU1
>>>> PVDQ ABC CPU1
>>>> CPU1 P12V PVCCIN
>>>> CPU1 VR Mem ABCD
>>>> CPU1 VR P1V8
>>>>
>>>> These are using indexes starting from '1'.
>>>>
>>>
>>> OK, if it's for consistency with other existing drivers I suppose 
>>> that's reasonable, though for my own reference, could you point me to 
>>> where those are implemented?  Some rough grepping around the source 
>>> tree didn't appear to turn up anything relevant.
>>
>> Sensor names get assigned through these services
>> https://github.com/openbmc/entity-manager
>> https://github.com/openbmc/dbus-sensors
>>
>> and it depends on board configuration of each machine.
>>
> 
> Oh I see -- I had thought you were referring to other existing hwmon 
> drivers in the kernel.
> 
> As far as I can tell, all those instances appear to be numbering CPU 
> *sockets* though -- which as Jason mentioned in a call earlier today I 
> gather is done to line up with motherboard silkscreen labeling.  But in 
> the code in question here we're labeling *cores* within a given socket, 
> which I don't see arising anywhere in any existing entity-manager 
> configs.  So I'm still unclear on why we want to use one-based indexing 
> here instead of zero-based -- I'd think we'd want the PECI driver to 
> match the PECI spec?

PECI driver uses zero-based index for PECI command handling but label is
user facing stuff which shouldn't make confusion to users. We can modify
driver like you did in this patch and previous driver also used
zero-based indexing but I changed it to natural number based indexing
to avoid confusion between driver labels and dbus-sensors names.
Any specific reason for the zero-based indexing? Any benefit?

Thanks,
Jae
