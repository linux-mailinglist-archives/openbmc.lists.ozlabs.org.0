Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA479B9719
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:17:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zhl75Wt9zF3gp
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:17:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZhkK60dVzF3Dx
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:16:41 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 11:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="217725083"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2019 11:16:38 -0700
Subject: Re: phosphor-isolation
To: Milton Miller II <miltonm@us.ibm.com>
References: <4ae96d16-addd-2ee9-0f96-867116fba5c6@linux.intel.com>
 <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
 <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
 <OFB4439398.C2024144-ON0025847B.0059AC2A-0025847B.0059BE4A@notes.na.collabserv.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <dd3f64aa-e053-6c33-bf3e-fa6031eafb57@linux.intel.com>
Date: Fri, 20 Sep 2019 11:16:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <OFB4439398.C2024144-ON0025847B.0059AC2A-0025847B.0059BE4A@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/20/19 9:20 AM, Milton Miller II wrote:
> On September 20, 2019, around 10:56AM in some timezone, James Feist wrote:
>> On 9/19/19 8:47 PM, Andrew Jeffery wrote:
>>> On Fri, 20 Sep 2019, at 03:03, James Feist wrote:
>>>> I enabled phosphor-isolation on my system and noticed that kcs no
>>>> longer
>>>> worked afterwards. Commenting out this section:
>>>>
>>>>
> 
>>>>
>>>> +	/* iLPC2AHB */
>>>> +	val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
>>>> +	val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
>>>> +	writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
>>>>
>>>>
>>>> Seems to make KCS work again.
> 
> That configuration is disabling superio decoding, which means the host
> will no longer be able to configure the superio hardware on the LPC bus.
> 
>>>
>>> That is an unexpected result. Have you asked ASPEED about it? I've
>>> added
>>> Ryan to Cc. I must admit I didn't test the patch with systems that
>>> use KCS
>>> because OpenPOWER exclusively uses BT for IPMI (though we're
>>> starting
>>> to exploit the KCS interfaces for an LPC MCTP binding).
>>>
>>> Having said that, the systems that we're testing our LPC MCTP
>>> binding on
>>> would have this patch applied, so presumably we're not seeing the
>>> same
>>> effect there. They're 2500-based systems, is that what you're
>>> testing with?
>>
>> Yes I am.
>>
> 
> As an outside observer without hardware, can you check:
> 
> (1) Did you check from the OS or just from a BIOS inventory?

Attempting to send ipmi commands from uefi/linux stopped working. Linux 
driver on host reported issues communicating to bmc.

> 
> (2) Is there code to enable the KCS peripheral from the bmc

There is a driver and kcsbridged.
> 
> (3) Will the host try to use the KCS even though it can
>      not find the superio to choose the port and interrupt?

Yes.

> 
> 
> 
> 
> 
>>>>
>>>> Do we need this part set? If so, should we
>>>> create a phosphor-isolation-kcs and phosphor-isolation-bt?
>>>
>>> I hope not, given that leaving the SuperIO decoding enable allows
>> the
>>> host to (slowly) scrape BMC memory (or if iLPC2AHB writes are
>>> allowed,
>>> open faster backdoors). We should root-cause the issue before
>>> exploring this path.
>>>
>>> Andrew
> 
