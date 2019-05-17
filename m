Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE021635
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 11:24:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4552sx2jvtzDqRm
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 19:24:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.63.100; helo=6.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 9947 seconds by postgrey-1.36 at bilbo;
 Fri, 17 May 2019 19:22:36 AEST
Received: from 6.mo68.mail-out.ovh.net (6.mo68.mail-out.ovh.net
 [46.105.63.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4552rD6jV1zDqQ4
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 19:22:32 +1000 (AEST)
Received: from player687.ha.ovh.net (unknown [10.108.57.226])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id BBA2C125B96
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 08:26:43 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 3E45D5D2094A;
 Fri, 17 May 2019 06:26:39 +0000 (UTC)
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
Date: Fri, 17 May 2019 08:26:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6062689527456369544
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/17/19 1:00 AM, Andrew Jeffery wrote:
> 
> 
> On Fri, 17 May 2019, at 01:42, Cédric Le Goater wrote:
>> Some Witherspoon boards are shipped with a mt25ql01g flash chip
>> holding the BMC firmware.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> "witherspoon128-bmc" is not very creative, but I can't blame you for that :D

he. 

Should we introduce a machine option to set the model name of the 
FMC flash chip ? I think I tried that in the past but at the block
level and mainline did not like it. But we could try at the machine
level.

Anyhow, it's a good way to debug flash issues on real HW.
 

> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
>> ---
>>
>>  It helps in tracking https://github.com/openbmc/u-boot/issues/18
>>
>>  hw/arm/aspeed.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index efc97df00de0..f26215ab5524 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -441,6 +441,17 @@ static const AspeedBoardConfig aspeed_boards[] = {
>>          .i2c_init  = witherspoon_bmc_i2c_init,
>>          .ram       = 512 * MiB,
>>          .num_cpus  = 1,
>> +     }, {
>> +        .name      = MACHINE_TYPE_NAME("witherspoon128-bmc"),
>> +        .desc      = "OpenPOWER Witherspoon128 BMC (ARM1176)",
>> +        .soc_name  = "ast2500-a1",
>> +        .hw_strap1 = WITHERSPOON_BMC_HW_STRAP1,
>> +        .fmc_model = "mt25ql01g",
>> +        .spi_model = "mx66l1g45g",
>> +        .num_cs    = 2,
>> +        .i2c_init  = witherspoon_bmc_i2c_init,
>> +        .ram       = 512 * MiB,
>> +        .num_cpus  = 1,
>>      }, {
>>          .name      = MACHINE_TYPE_NAME("ast2600-evb"),
>>          .desc      = "Aspeed AST2600 EVB (Cortex A7)",
>> -- 
>> 2.20.1
>>
>>

