Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D7FFD67
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 04:42:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GZXr0nm7zDqcH
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 14:42:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DqXr758ZzF4QS;
 Fri, 15 Nov 2019 18:21:42 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 23:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,307,1569308400"; d="scan'208";a="235980233"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.197])
 ([10.237.72.197])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2019 23:21:31 -0800
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-aspeed: add inversion
 sighttps://elixir.bootlin.com/linux/v4.6/ident/sdhci_opsnal presence
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
References: <20191114125435.27756-1-i.mikhaylov@yadro.com>
 <20191114125435.27756-3-i.mikhaylov@yadro.com>
 <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
 <b443738f5e2a3c7ba96b329a8347374f7f934483.camel@yadro.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <d177ef37-643e-442d-d536-750e0bb5e86d@intel.com>
Date: Fri, 15 Nov 2019 09:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b443738f5e2a3c7ba96b329a8347374f7f934483.camel@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2019 14:39:07 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/11/19 7:19 PM, Ivan Mikhaylov wrote:
> On Thu, 2019-11-14 at 15:10 +0200, Adrian Hunter wrote:
>> On 14/11/19 2:54 PM, Ivan Mikhaylov wrote:
>>> Change the default .get_cd callback. Add inverted signal card detection
>>> check.
>>>
>>> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>>>
>>> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-
>>> aspeed.c
>>> index 8962f6664381..186559ee8fcc 100644
>>> --- a/drivers/mmc/host/sdhci-of-aspeed.c
>>> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
>>> @@ -143,6 +143,19 @@ static inline int aspeed_sdhci_calculate_slot(struct
>>> aspeed_sdhci *dev,
>>>  	return (delta / 0x100) - 1;
>>>  }
>>>  
>>> +static int aspeed_get_cd(struct mmc_host *mmc)
>>> +{
>>> +	struct sdhci_host *host = mmc_priv(mmc);
>>> +
>>> +	int present = !!(sdhci_readl(host, SDHCI_PRESENT_STATE)
>>> +			 & SDHCI_CARD_PRESENT);
>>> +
>>> +	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
>>> +		present = !present;
>>
>> Perhaps safer to flip the bit using CONFIG_MMC_SDHCI_IO_ACCESSORS and
>> ->readl() callback
>>
> 
> Sorry, don't quite understand what you're saying. You want to instantiate
> '.read_l' callback instead of '.get_cd' in sdhci_ops and substitute the real
> value?
> 
> res = readl(base, reg);
> if (reg == SDHCI_PRESENT_STATE)
> 	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
> 		return !res;

Presumably just flip the SDHCI_CARD_PRESENT bit i.e.

		return res ^ SDHCI_CARD_PRESENT;

> return res;
> 
> Something like this?

Yes

> 
>>  
>>> +	host->mmc_host_ops.get_cd = aspeed_get_cd;
>>> +	if (of_property_read_bool(pdev->dev.of_node, "cd-inverted"))
>>> +		dev_info(&pdev->dev, "aspeed: sdhci: presence signal inversion
>>> enabled\n");
>>
>> Is this print really needed?
>>
> I can remove it if you think it's redundant.
> 
> Thanks.
> 
> 

