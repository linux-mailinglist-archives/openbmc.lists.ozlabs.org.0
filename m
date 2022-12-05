Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86D642A70
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 15:34:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQmJd1gDqz3bfj
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 01:34:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEDZbh+V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEDZbh+V;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQmHz6C8Yz3000
	for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2022 01:33:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670250816; x=1701786816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2OBOfD2t0N8EJ/uY+cDMKQSnWSQHCvSrSmWj83dLn6E=;
  b=aEDZbh+V3cPOGqf0d7jYWd3bGauhBOC0dJUe4QqjxTWiydS+4niz3TfP
   TvX9XlMzBs3PpSE3cbSF8I1yGYelBa1vsinHxQoKkTtAYkfP4Ml/gVa1n
   TJNyo4fkVvhpVbVOQNZvd0kM4B0Nz9wbe8wNJnVD0cePBCrZCM5AuGmv8
   y28sdH5Kd0lZ+0IgK133eBekkakexdx5bftGnCsAMyVAXmUfAODH5DMTx
   8lphynMaYAGnR+Faq8dzy7RbrprUE7/+ByemAYRhVuvl/7Fp5st6mk6Al
   /PaLIi/b9oh6AuNhHlXbIbrzJIuD/q9dZj+JqpJkRG1bQg6NFapgBESlY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296719665"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="296719665"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 06:33:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="974700771"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="974700771"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.55.104])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 06:33:22 -0800
Message-ID: <c4e2a00c-d09e-95e2-eaf2-1de6b820ac6e@intel.com>
Date: Mon, 5 Dec 2022 16:33:18 +0200
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
 <c200557f-c30a-62f9-287a-af804e818cf1@intel.com>
 <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
 <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com>
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

On 5/12/22 16:17, Andy Shevchenko wrote:
> On Mon, Dec 5, 2022 at 4:14 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, Dec 5, 2022 at 3:41 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
>>> On 5/12/22 15:25, Andy Shevchenko wrote:
>>>> On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>>> On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>>>>> On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>>
>> ...
>>
>>>>>>> +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
>>>>>>
>>>>>> You can't mix devm with non-devm in this way.
>>>>> Can you explain what you mean You can't mix devm with non-devm in this
>>>>> way, where is the mix?
>>>>> In version 1 used devm_clk_get, is it problematic?
>>>>
>>>> devm_ is problematic in your case.
>>>> TL;DR: you need to use clk_get_optional() and clk_put().
>>>
>>> devm_ calls exactly those, so what is the issue?
>>
>> The issue is the error path or removal stage where it may or may be
>> not problematic. To be on the safe side, the best approach is to make
>> sure that allocated resources are being deallocated in the reversed
>> order. That said, the
>>
>> 1. call non-devm_func()
>> 2. call devm_func()
>>
>> is wrong strictly speaking.
> 
> To elaborate more, the
> 
> 1. call all devm_func()
> 2. call only non-devm_func()
> 
> is the correct order.

1. WRT pltfm_host->clk, that is what is happening
2. WRT other resources that is simply not always possible because not every resource is wrapped by devm_
e.g. mmc_alloc_host() / mmc_free_host()

> 
> Hence in this case the driver can be worked around easily (by
> shuffling the order in ->probe() to call devm_ first), but as I said
> looking into implementation of the _unregister() I'm pretty sure that
> clock management should be in sdhci-pltfm, rather than in all callers
> who won't need the full customization.
> 
> Hope this helps to understand my point.
> 
>>>> Your ->remove() callback doesn't free resources in the reversed order
>>>> which may or, by luck, may not be the case of all possible crashes,
>>>> UAFs, races, etc during removal stage. All the same for error path in
>>>> ->probe().
>>
>> I also pointed out above what would be the outcome of neglecting this rule.
>>
>>>>>>> +       if (IS_ERR(pltfm_host->clk))
>>>>>>> +               return PTR_ERR(pltfm_host->clk);
>>>>>>> +
>>>>>>> +       ret = clk_prepare_enable(pltfm_host->clk);
>>>>>>> +       if (ret)
>>>>>>> +               return ret;
>>>>>>> +
>>>>>>> +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
>>>>>>> +       if (caps & SDHCI_CAN_DO_8BIT)
>>>>>>> +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
>>>>>>> +
>>>>>>> +       ret = mmc_of_parse(host->mmc);
>>>>>>> +       if (ret)
>>>>>>> +               goto err_sdhci_add;
>>>>>>> +
>>>>>>> +       ret = sdhci_add_host(host);
>>>>>>> +       if (ret)
>>>>>>> +               goto err_sdhci_add;
>>>>>>
>>>>>> Why can't you use sdhci_pltfm_register()?
>>>>> two things are missing in sdhci_pltfm_register
>>>>> 1. clock.
>>>>
>>>> Taking into account the implementation of the corresponding
>>>> _unregister() I would add the clock handling to the _register() one.
>>>> Perhaps via a new member of the platform data that supplies the name
>>>> and index of the clock and hence all clk_get_optional() / clk_put will
>>>> be moved there.
>>>>
>>>>> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
>>>>
>>>> All the same, why can't platform data be utilised for this?
>>>>
>>>>>>> +       return 0;
>>>>>>> +
>>>>>>> +err_sdhci_add:
>>>>>>> +       clk_disable_unprepare(pltfm_host->clk);
>>>>>>> +       sdhci_pltfm_free(pdev);
>>>>>>> +       return ret;
>>>>>>> +}
>>
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
> 
> 
> 

