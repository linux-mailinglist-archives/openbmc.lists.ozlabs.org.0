Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C559D18A
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 08:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBg2V0TmVz3c34
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 16:54:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=XKlk3hoa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=XKlk3hoa;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBg1z0nySz2yn3;
	Tue, 23 Aug 2022 16:54:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id E732242CB4;
	Tue, 23 Aug 2022 06:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received
	:received:received; s=mta-01; t=1661237647; x=1663052048; bh=H/K
	SNmU1gDJ1bmxbU4cTWx1pQlXHm5JLGeYtsagr+sQ=; b=XKlk3hoaIcPlMKOxsso
	D1fcqOHsYhMj6cf/iVFIjPZIefBSBUukHee33ulpY5Jl1aPn+httdmtkTtprsyCc
	0C3SXbu4zfJcZBlsPvahLYxPvOcq4FnYR8EMYsvZtc1KKppkRHqI7P99h99QuzyF
	BPncnYobFutCLsIykHBLUQzs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlkT9Z5kyEBb; Tue, 23 Aug 2022 09:54:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id C9C06429F7;
	Tue, 23 Aug 2022 09:54:06 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 23 Aug 2022 09:54:06 +0300
Received: from [10.178.113.33] (10.178.113.33) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 23 Aug
 2022 09:54:04 +0300
Message-ID: <97ba69b1-1568-f749-1342-72f238fbd33b@yadro.com>
Date: Tue, 23 Aug 2022 09:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] ipmi:kcs_bmc: Add cleanup regmap(interrupt-regs)
 on a shutdown.
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <fb81dda34f9db0b9f743b247a2464576dcccd7c9.1661094034.git.i.kononenko@yadro.com>
 <ad3cd046c4dcb9169aaff6c0b739b23d0a06014d.1661149313.git.i.kononenko@yadro.com>
 <CACPK8Xfe+hPLXcgwWxZtb5H_WG8GRJ7pLfRXG3jupk8ANc7wgQ@mail.gmail.com>
From: i.kononenko <i.kononenko@yadro.com>
In-Reply-To: <CACPK8Xfe+hPLXcgwWxZtb5H_WG8GRJ7pLfRXG3jupk8ANc7wgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.178.113.33]
X-ClientProxiedBy: T-EXCH-02.corp.yadro.com (172.17.10.102) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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
Cc: Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 23.08.2022 03:22, Joel Stanley wrote:
> «Внимание! Данное письмо от внешнего адресата!»
> 
> On Mon, 22 Aug 2022 at 06:36, Igor Kononenko <i.kononenko@yadro.com> wrote:
>>
>> The previos v1 [PATCH 1/3] have error of getting `struct kcs_bmc_device`
>> pointer from `struct platform_device *`. Replaced to retriveing pointer by
>> `platform_get_drvdata()`
> 
> Can we get a v3 with your original commit message added? You had a
> good write up in v1 but it was dropped in v2.
> 

Thanks for the review.
Ok, I'll include the origin commit message to a v3. 

> This change looks like the right thing to do. We should get Andrew to
> review too, as he spends more time with the KCS controllers.
> 
> The missed irq issue was seen with the other LPC sub drivers because
> the clock wasn't enabled. We ended up with this patch:
> 
> https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
>> Do we need to do something similar for KCS?

As far as I see by the LPC 'nobody cared irq' issue there had the feature of 
enabling LCLK individually earlier, there is patch about:

https://lore.kernel.org/all/20211101233751.49222-5-jae.hyun.yoo@intel.com/

Originally I found the bug on the linux-dev.v5.4 that includes the 'LCLK individually
enabling' feature.

It seems to me the issue is that lpc-snoop and the lpc-kcs has same IRQ#35 that is used
in separated drivers(by the IRQF_SHARED flag).
The IRQ handler determinate request purpose(for kcs or snoop) by LPC interrupt registers
state, and if such interrupt is not for any one of them, the irq-handler passthrough 
request to a next handler by returning `IRQ_NONE`.

So, even if lpc-kcs will be having adjusted own individual LCLK, that is doesn't solve 
issue, because when lpc-snoop will had configured irq-handler the irq-manager will know 
that for IRQ#35 already registered a good handler, but such handler will skip all requests
by `IRQ_NONE` because such irqs are intended for lpc-kcs. I guess that is the point of bug.


> 
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
>> ---
>>  drivers/char/ipmi/kcs_bmc_aspeed.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> index cdc88cde1e9a..8437f3cfe3f4 100644
>> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> @@ -636,6 +636,14 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
>>         return 0;
>>  }
>>
>> +static void aspeed_kcs_shutdown(struct platform_device *pdev)
>> +{
>> +       struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
>> +       struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
>> +
>> +       aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF), 0);
>> +}
>> +
>>  static const struct of_device_id ast_kcs_bmc_match[] = {
>>         { .compatible = "aspeed,ast2400-kcs-bmc-v2" },
>>         { .compatible = "aspeed,ast2500-kcs-bmc-v2" },
>> @@ -651,6 +659,7 @@ static struct platform_driver ast_kcs_bmc_driver = {
>>         },
>>         .probe  = aspeed_kcs_probe,
>>         .remove = aspeed_kcs_remove,
>> +       .shutdown = aspeed_kcs_shutdown,
>>  };
>>  module_platform_driver(ast_kcs_bmc_driver);
>>
>> --
>> 2.25.1
>>

-- 
Best regards,

Igor Kononenko
