Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE16429AE
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 14:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQl932yW7z3bZJ
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 00:42:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9O8zMeB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9O8zMeB;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQl8Q4wk4z30RG
	for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2022 00:41:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670247718; x=1701783718;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3GEBq+TnHHBMj8dKCAPrgcd5mxHNa6hFVgpFoTSTC/c=;
  b=g9O8zMeBFOuG0AkqxHC6GZEiFgn/JT3oD0O9sO3eIdnMzTKegkh2d35A
   525EoK7KWnLy1X6l02i/aEJag6ZJTnQUv/eo2jYSS10FJrN83siSAD9cE
   KfUGDu3gtoRJPrq1N7k/WJKCilhtjb0bWh05yZ2BR5Bcew+2C8+nRd0Jo
   HitkcELQGRO3rMw+4jfTlguvEqWPeFVkFRhHixztPkkQcRi3g7mXeIMHO
   JWnlaa6EAONKLjOTIVw+l3ZNXcdflVHQCx8SNoXZ7os8vcbrxHHkVEpPr
   AD9MPPjyI+fh37ZmQdVtIbqzRqCYp6FsjWNoAQifNOH/z1TRaUt0XOCpj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="299776118"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="299776118"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 05:41:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="714401437"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="714401437"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.55.104])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 05:41:43 -0800
Message-ID: <c200557f-c30a-62f9-287a-af804e818cf1@intel.com>
Date: Mon, 5 Dec 2022 15:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20221205085351.27566-1-tmaimon77@gmail.com>
 <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
 <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
 <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, Tomer Maimon <tmaimon77@gmail.com>, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/12/22 15:25, Andy Shevchenko wrote:
> On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>> On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>> On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
> 
> ...
> 
>>>> +#include <linux/clk.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/mmc/host.h>
>>>> +#include <linux/mmc/mmc.h>
>>>> +#include <linux/module.h>
>>>
>>> I guess platform_device.h is missing here.
>> Build and work without platform_device.h, do I need it for module use?
> 
> The rule of thumb is to include headers we are the direct user of. I
> believe you have a data type and API that are defined in that header.
> 
> ...
> 
>>>> +static int npcm_sdhci_probe(struct platform_device *pdev)
>>>> +{
>>>> +       struct sdhci_pltfm_host *pltfm_host;
>>>> +       struct sdhci_host *host;
>>>> +       u32 caps;
>>>> +       int ret;
>>>> +
>>>> +       host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
>>>> +       if (IS_ERR(host))
>>>> +               return PTR_ERR(host);
>>>> +
>>>> +       pltfm_host = sdhci_priv(host);
>>>
>>>> +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
>>>
>>> You can't mix devm with non-devm in this way.
>> Can you explain what you mean You can't mix devm with non-devm in this
>> way, where is the mix?
>> In version 1 used devm_clk_get, is it problematic?
> 
> devm_ is problematic in your case.
> TL;DR: you need to use clk_get_optional() and clk_put().

devm_ calls exactly those, so what is the issue?

> 
> Your ->remove() callback doesn't free resources in the reversed order
> which may or, by luck, may not be the case of all possible crashes,
> UAFs, races, etc during removal stage. All the same for error path in
> ->probe().
> 
>>>> +       if (IS_ERR(pltfm_host->clk))
>>>> +               return PTR_ERR(pltfm_host->clk);
>>>> +
>>>> +       ret = clk_prepare_enable(pltfm_host->clk);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
>>>> +       if (caps & SDHCI_CAN_DO_8BIT)
>>>> +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
>>>> +
>>>> +       ret = mmc_of_parse(host->mmc);
>>>> +       if (ret)
>>>> +               goto err_sdhci_add;
>>>> +
>>>> +       ret = sdhci_add_host(host);
>>>> +       if (ret)
>>>> +               goto err_sdhci_add;
>>>
>>> Why can't you use sdhci_pltfm_register()?
>> two things are missing in sdhci_pltfm_register
>> 1. clock.
> 
> Taking into account the implementation of the corresponding
> _unregister() I would add the clock handling to the _register() one.
> Perhaps via a new member of the platform data that supplies the name
> and index of the clock and hence all clk_get_optional() / clk_put will
> be moved there.
> 
>> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
> 
> All the same, why can't platform data be utilised for this?
> 
>>>> +       return 0;
>>>> +
>>>> +err_sdhci_add:
>>>> +       clk_disable_unprepare(pltfm_host->clk);
>>>> +       sdhci_pltfm_free(pdev);
>>>> +       return ret;
>>>> +}
> 

