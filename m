Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BD59D1AB
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBgCt72SMz3c3L
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 17:02:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=UVJE2EGN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=UVJE2EGN;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBgCP4bdXz3blJ;
	Tue, 23 Aug 2022 17:02:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 735D1429F7;
	Tue, 23 Aug 2022 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received
	:received:received; s=mta-01; t=1661238137; x=1663052538; bh=wBa
	6pS8mrekSSYHtOFL3NgOxGd/ebttLtxHP9pNNwfE=; b=UVJE2EGN2UCVBsWw6Rb
	1e56cooXDyxj9H304x7yCyQB31qauWVcoz00sVG6I1xhISQA+zGmlbsJc9aP5WfE
	6hkRvTLDrlTpgEgotf0axnLDBGZpWfR3cdBFjUcwkcYm/X/MY+Ipu5uKVc2rvXGt
	Uv6uvpkx1guqxhg33HSS13Uw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkH0mTi-veXb; Tue, 23 Aug 2022 10:02:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 1B5AF412ED;
	Tue, 23 Aug 2022 10:02:17 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 23 Aug 2022 10:02:17 +0300
Received: from [10.178.113.33] (10.178.113.33) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 23 Aug
 2022 10:02:15 +0300
Message-ID: <01dfdd3e-0de6-be94-18dd-5418e60b5a74@yadro.com>
Date: Tue, 23 Aug 2022 10:02:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] drivers/misc: (aspeed-lpc-snoop): Add regmap cleanup
 on a shutdown.
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <cover.1661094034.git.i.kononenko@yadro.com>
 <f9814f62fe2d6b6c21400ee3c83e46e61e0c72d1.1661094034.git.i.kononenko@yadro.com>
 <CACPK8XenuLrB-iOCo57FjeoOdEieHyxSM2ZM-X73AfP3fq3r+g@mail.gmail.com>
From: i.kononenko <i.kononenko@yadro.com>
In-Reply-To: <CACPK8XenuLrB-iOCo57FjeoOdEieHyxSM2ZM-X73AfP3fq3r+g@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 23.08.2022 03:30, Joel Stanley wrote:
> «Внимание! Данное письмо от внешнего адресата!»
> 
> On Sun, 21 Aug 2022 at 15:54, Igor Kononenko <i.kononenko@yadro.com> wrote:
>>
>> The bmc might be rebooted while the host is still reachable and the host
>> might send requests through configured lpc-kcs channels in same time.
>> That leads to raise lpc-snoop interrupts that haven't adjusted IRQ
>> handlers on next early kernel boot, because on the aspeed-chip reboot
>> might keep registers on a unclean state that is configured on the last
>> boot.
>>
>> The patch brings an way to masking lpc-snoop interrupts all through
>> a bmc-rebooting time.
>>
>> Tested on a YADRO VEGMAN N110 stand.
>>
>> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
>> ---
>>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 44 +++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> index eceeaf8dfbeb..6ec47bf1dc6b 100644
>> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> @@ -235,6 +235,41 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>>         return rc;
>>  }
>>
>> +static void aspeed_lpc_reset_regmap(struct aspeed_lpc_snoop *lpc_snoop)
>> +{
>> +       u8 index;
>> +       struct lpc_regman_cleanup {
>> +               u32 offset;
>> +               u32 mask;
>> +               u8 val;
>> +       };
>> +       static struct lpc_regman_cleanup cleanup_list[] = {
>> +               // Prevent handling ENINIT_SNPxW
>> +               { .offset = HICR5,
>> +                 .mask = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
>> +                 .val = 0 },
>> +               { .offset = HICR5,
>> +                 .mask = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
>> +                 .val = 0 },
>> +               { .offset = HICRB,
>> +                 .mask = HICRB_ENSNP0D | HICRB_ENSNP1D,
>> +                 .val = 0 },
>> +               // Reset SNOOP channel IRQ status
>> +               { .offset = HICR6,
>> +                 .mask = HICR6_STR_SNP0W | HICR6_STR_SNP1W,
>> +                 .val = 1 },
>> +       };
>> +       for (index = 0; index < ARRAY_SIZE(cleanup_list); index++) {
> 
> Did you consider open coding the various updates instead of using a
> for loop? I don't think the for loop help us here.
> 
> You could instead make these three updates:
> 
> /* Prevent handling ENINIT_SNPxW */
> regmap_clear_bits(lpc_snoop->regmap, HICR5,
>                                   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W |
> HICR5_EN_SNP1W | HICR5_ENINT_SNP1W);
> 
> regmap_clear_bits(lpc_snoop->regmap, HICRB,
>                                HICRB_ENSNP0D | HICRB_ENSNP1D);
> 
> /* Reset SNOOP channel IRQ status */
> regmap_set_bits(lpc_snoop->regmap, HICR6,
>                             HICR6_STR_SNP0W | HICR6_STR_SNP1W);
> 
> 

Thanks! I'll take a notice for the further patches.
Will fix in a v3 patchset.

> 
>> +               u32 val = 0;
>> +
>> +               if (cleanup_list[index].val)
>> +                       val = cleanup_list[index].mask;
>> +               regmap_update_bits(lpc_snoop->regmap,
>> +                                  cleanup_list[index].offset,
>> +                                  cleanup_list[index].mask, val);
>> +       }
>> +}
>> +
>>  static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>>                                      int channel)
>>  {
>> @@ -285,6 +320,7 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>>                 return -ENODEV;
>>         }
>>
>> +       aspeed_lpc_reset_regmap(lpc_snoop);
>>         dev_set_drvdata(&pdev->dev, lpc_snoop);
>>
>>         rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
>> @@ -345,6 +381,13 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>>         return 0;
>>  }
>>
>> +static void aspeed_lpc_snoop_shutdown(struct platform_device *pdev)
>> +{
>> +       struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
>> +
>> +       aspeed_lpc_reset_regmap(lpc_snoop);
>> +}
>> +
>>  static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {
>>         .has_hicrb_ensnp = 0,
>>  };
>> @@ -370,6 +413,7 @@ static struct platform_driver aspeed_lpc_snoop_driver = {
>>         },
>>         .probe = aspeed_lpc_snoop_probe,
>>         .remove = aspeed_lpc_snoop_remove,
>> +       .shutdown = aspeed_lpc_snoop_shutdown,
>>  };
>>
>>  module_platform_driver(aspeed_lpc_snoop_driver);
>> --
>> 2.25.1
>>

-- 
Best regards,

Igor Kononenko
