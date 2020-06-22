Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26D203883
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 15:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r9tk2MxFzDqRh
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 23:56:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r9sW1yvvzDq94
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 23:55:26 +1000 (AEST)
IronPort-SDR: cDuTCThp4lewmxX6Kog2ZGQ5YU4nUBKV8Kx+kRQQROLam3ZsDWzaX/scNpNmTTPmVi3eKVDAdp
 V1FXHGrvpE8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="161841486"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="161841486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 06:55:23 -0700
IronPort-SDR: 7AMX6cFlEC1O8o9HWYTAXcJwL+t/ljTkqGLmQqhe3++hS30RkLRC9lvVAFuvUj0jHFPOuEVMvg
 TgyoFBQLC/Jg==
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="451842938"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.10.18])
 ([10.213.10.18])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 06:55:21 -0700
Subject: Re: about virtual variable
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <HK2PR04MB38261ACC44E9A3FE1236DF55FE970@HK2PR04MB3826.apcprd04.prod.outlook.com>
 <b4aaf649-312c-ebc3-c8eb-e780973e17fc@linux.intel.com>
Message-ID: <18282d9f-9c23-df77-8a11-099abda81b88@linux.intel.com>
Date: Mon, 22 Jun 2020 15:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b4aaf649-312c-ebc3-c8eb-e780973e17fc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In other words - virtual/XYZ is exported by recipes delivering the same 
stuff, conflicting with each other . In your system you have to choose 
the compiler, kernel etc. While many recipes might deliver those 
components, recipe creators use the same 'meta-name' (from 'virtual' 
namespace), so then by choosing "PREFERRED_PROVIDER" you can decide 
which of the 'implementations' you would like to actually use.

With 'virtual' variables you can use 'virtual/xyz' as a generic alias. 
You can then introduce BitBake code depending on magic 'virtual/kernel' 
instead of using concrete name of implementations (like linux-aspeed / 
linux-nuvoton / linux-yocto / linux-yocto-rt).

Regards,
Adrian

W dniu 6/22/2020 o 15:43, Adrian Ambrożewicz pisze:
> I feel rude for pointing out link to StackOverflow, but this guy really 
> nailed it when it comes to easy explanation of 'virtual/' variable 
> namespace :)
> 
> https://stackoverflow.com/a/37823742/8226884
> 
> W dniu 6/22/2020 o 14:48, zhouyuanqing8@outlook.com pisze:
>> Hi everyone,
>>
>>       I would like to ask, is virtual a variable defined by bitbake? I 
>> did not find it in the bitbake manual. What is the use of the virtual 
>> variable? What would be the problem without this variable?
>>
>>
>>     2.4. Preferences¶
>>     
>> <https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html#bb-bitbake-preferences> 
>>
>>
>> The|PROVIDES|list is only part of the solution for figuring out a 
>> target's recipes. Because targets might have multiple providers, 
>> BitBake needs to prioritize providers by determining provider 
>> preferences.
>>
>> A common example in which a target has multiple providers is 
>> "virtual/kernel", which is on the|PROVIDES|list for each kernel 
>> recipe. Each machine often selects the best kernel provider by using a 
>> line similar to the following in the machine configuration file:
>>
>>       PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
>>
>>
