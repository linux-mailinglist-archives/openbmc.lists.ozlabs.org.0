Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE0127B626
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 22:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0YpV5V4wzDqCT
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 06:22:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Ynk1l9RzDqQK
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 06:21:29 +1000 (AEST)
IronPort-SDR: vuVWH1cSOz8bbHf294l9mfMzyqqTvVo1wNwawf7EvDt2vVdkvFeb49YA99Ukqzr/RF3+hAbuu0
 Fd4xQvz4uTfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226204098"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="226204098"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 13:21:25 -0700
IronPort-SDR: rMj7UWjVFnigyTu0+KsTO2suV1KbgtGfINlZqGYQO8ILImyKdLhqBhmILjHk2HI2PopJnTu63c
 2XLfQY+JGcxw==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="415119908"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.88.56])
 ([10.254.88.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 13:21:24 -0700
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Zev Weiss <zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
Date: Mon, 28 Sep 2020 13:21:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
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

On 9/28/2020 12:54 PM, Zev Weiss wrote:
> On Mon, Sep 28, 2020 at 02:08:24PM CDT, Jae Hyun Yoo wrote:
>>
>>
>> On 9/26/2020 2:27 PM, Zev Weiss wrote:
>>> Zero-based numbering is more consistent with all other cpu/core
>>> numbering I'm aware of (including the PECI spec).
>>>
>>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>> ---
>>>  drivers/hwmon/peci-cputemp.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
>>> index b9fe91281d58..78e442f433a7 100644
>>> --- a/drivers/hwmon/peci-cputemp.c
>>> +++ b/drivers/hwmon/peci-cputemp.c
>>> @@ -363,7 +363,7 @@ static int create_core_temp_label(struct 
>>> peci_cputemp *priv, int idx)
>>>      if (!priv->coretemp_label[idx])
>>>          return -ENOMEM;
>>> -    sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
>>> +    sprintf(priv->coretemp_label[idx], "Core %d", idx);
>>
>> Differently from low level indexing, it's labeling for users and it
>> should be synced with other temp or ADC sensors such as
>>
>> PVCCIN CPU1
>> PVDQ ABC CPU1
>> CPU1 P12V PVCCIN
>> CPU1 VR Mem ABCD
>> CPU1 VR P1V8
>>
>> These are using indexes starting from '1'.
>>
> 
> OK, if it's for consistency with other existing drivers I suppose that's 
> reasonable, though for my own reference, could you point me to where 
> those are implemented?  Some rough grepping around the source tree 
> didn't appear to turn up anything relevant.

Sensor names get assigned through these services
https://github.com/openbmc/entity-manager
https://github.com/openbmc/dbus-sensors

and it depends on board configuration of each machine.

> Thanks,
> Zev
> 
