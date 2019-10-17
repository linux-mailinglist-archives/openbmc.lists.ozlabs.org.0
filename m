Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC2DA5AE
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 08:40:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v00Y1d50zDr13
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 17:40:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.29; helo=11.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at bilbo;
 Thu, 17 Oct 2019 17:39:49 AEDT
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tzzn39yNzDqf2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 17:39:46 +1100 (AEDT)
Received: from player759.ha.ovh.net (unknown [10.109.160.239])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A29AE19471E
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 08:34:04 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id F221EB1927CE
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 06:34:03 +0000 (UTC)
Subject: Re: [PATCH qemu aspeed-4.2] hw/arm/aspeed: Fix STRAP2 configuration
 for Tacoma
To: openbmc@lists.ozlabs.org
References: <20191017062544.25110-1-andrew@aj.id.au>
 <CACPK8Xe=q_rxYjgiGtY1i0KRmxJiZnbL7E0mTZ=4BMFrsZS_Ug@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2fc9ce5d-295e-9d4a-951a-4adb7765e486@kaod.org>
Date: Thu, 17 Oct 2019 08:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe=q_rxYjgiGtY1i0KRmxJiZnbL7E0mTZ=4BMFrsZS_Ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 818529232738814722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/10/2019 08:29, Joel Stanley wrote:
> On Thu, 17 Oct 2019 at 06:24, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> We were writing the STRAP2 configuration to the STRAP1 property/register
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Nice, I have the same patch in my tree, and forgot about it.
> 
> Reviewed-by: Joel

I will merge this fix in the machine definition patch if you don't mind.

C.
 
> 
>> ---
>>  hw/arm/aspeed.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ad86ef2eccec..807868224c6c 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -711,7 +711,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>>      mc->desc       = "Aspeed AST2600 EVB (Cortex A7)";
>>      amc->soc_name  = "ast2600-a0";
>>      amc->hw_strap1 = TACOMA_BMC_HW_STRAP1;
>> -    amc->hw_strap1 = TACOMA_BMC_HW_STRAP2;
>> +    amc->hw_strap2 = TACOMA_BMC_HW_STRAP2;
>>      amc->fmc_model = "mx66l1g45g";
>>      amc->spi_model = "mx66l1g45g";
>>      amc->num_cs    = 2;
>> --
>> 2.20.1
>>

