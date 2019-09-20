Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A8B94A4
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 17:56:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZdcH3XFzzF1RV
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 01:56:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZdbL59DtzDsDy
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 01:55:25 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 08:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="217688360"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2019 08:55:22 -0700
Subject: Re: phosphor-isolation
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
 <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <4ae96d16-addd-2ee9-0f96-867116fba5c6@linux.intel.com>
Date: Fri, 20 Sep 2019 08:55:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/19/19 8:47 PM, Andrew Jeffery wrote:
> 
> 
> On Fri, 20 Sep 2019, at 03:03, James Feist wrote:
>> I enabled phosphor-isolation on my system and noticed that kcs no longer
>> worked afterwards. Commenting out this section:
>>
>> https://github.com/openbmc/meta-phosphor/blob/a1cee09419cb1467c3d2b7bf996b40089f0d06f4/aspeed-layer/recipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch#L230
>>
>> +	/* iLPC2AHB */
>> +	val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
>> +	val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
>> +	writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
>>
>>
>> Seems to make KCS work again.
> 
> That is an unexpected result. Have you asked ASPEED about it? I've added
> Ryan to Cc. I must admit I didn't test the patch with systems that use KCS
> because OpenPOWER exclusively uses BT for IPMI (though we're starting
> to exploit the KCS interfaces for an LPC MCTP binding).
> 
> Having said that, the systems that we're testing our LPC MCTP binding on
> would have this patch applied, so presumably we're not seeing the same
> effect there. They're 2500-based systems, is that what you're testing with?

Yes I am.


> 
>> Do we need this part set? If so, should we
>> create a phosphor-isolation-kcs and phosphor-isolation-bt?
> 
> I hope not, given that leaving the SuperIO decoding enable allows the
> host to (slowly) scrape BMC memory (or if iLPC2AHB writes are allowed,
> open faster backdoors). We should root-cause the issue before exploring
> this path.
> 
> Andrew
> 
