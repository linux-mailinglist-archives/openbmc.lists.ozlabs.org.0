Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3942ABEC4D
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:06:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f5ZG05TmzDqD3
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:06:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.195; helo=11.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
 [46.105.34.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f5Y572qjzDqGJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:05:28 +1000 (AEST)
Received: from player776.ha.ovh.net (unknown [10.109.159.203])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id CB4DD2089DB
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 08:59:55 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id C07AEA37F941;
 Thu, 26 Sep 2019 06:59:52 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 13/13] mtd: spi-nor: aspeed: add support for
 AST2600 training
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-14-clg@kaod.org>
 <233401e3-9b67-42e8-b9aa-bbbef424171a@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2d6ac3ae-24d0-8949-19fd-569c6096fbbd@kaod.org>
Date: Thu, 26 Sep 2019 08:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <233401e3-9b67-42e8-b9aa-bbbef424171a@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7055733242005588947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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

On 26/09/2019 04:14, Andrew Jeffery wrote:
> 
> 
> On Wed, 25 Sep 2019, at 22:12, Cédric Le Goater wrote:
> 
> Would prefer some description here, this patch gets complex. At least for me,
> probably because I'm not familiar with the flash training routine.

Joel, Could you please squeeze in this in the commit log ? I can resend
just that patch if you prefer, once you have pushed the series. This is 
just an optimization.

Thanks,

C.  


The training consists in finding the appropriate read timing delays for 
the HCLK dividers 2, 3, 4, and 5 and store the results in the Read Timing 
Compensation register. The previous SoC AST2500 and AST2400 were covering 
a broader HCLK range [ 1 - 5 ] because the AHB frequency was lower.

The algo first reads a golden buffer at low speed and then performs reads 
with different clocks and delay cycles settings to find a breaking point.
This selects the default clock frequency for the CEx control register.
The current settings are bit optimistic as we pick the first delay giving 
good results. A safer approach would be to determine an interval and 
choose the middle value. We might change the approach depending on the 
results on other systems.

Only CS0 is taken into account for the moment.

> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 68 ++++++++++++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 48164d819a37..e9bc89755912 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -142,6 +142,9 @@ static u32 aspeed_smc_segment_end_ast2600(
>>  static u32 aspeed_smc_segment_reg_ast2600(
>>  	struct aspeed_smc_controller *controller, u32 start, u32 end);
>>  
>> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip 
>> *chip,
>> +	      u32 hdiv, const u8 *golden_buf, u8 *test_buf);
>> +
>>  static const struct aspeed_smc_info fmc_2600_info = {
>>  	.maxsize = 256 * 1024 * 1024,
>>  	.nce = 3,
>> @@ -149,7 +152,11 @@ static const struct aspeed_smc_info fmc_2600_info 
>> = {
>>  	.we0 = 16,
>>  	.ctl0 = 0x10,
>>  	.timing = 0x94,
>> +	.hclk_mask = 0xf0fff0ff,
>> +	.hdiv_max = 2,
>>  	.set_4b = aspeed_smc_chip_set_4b,
>> +	.optimize_read = aspeed_smc_optimize_read,
>> +	.calibrate = aspeed_smc_calibrate_reads_ast2600,
>>  	.segment_start = aspeed_smc_segment_start_ast2600,
>>  	.segment_end = aspeed_smc_segment_end_ast2600,
>>  	.segment_reg = aspeed_smc_segment_reg_ast2600,
>> @@ -162,7 +169,11 @@ static const struct aspeed_smc_info spi_2600_info 
>> = {
>>  	.we0 = 16,
>>  	.ctl0 = 0x10,
>>  	.timing = 0x94,
>> +	.hclk_mask = 0xf0fff0ff,
>> +	.hdiv_max = 2,
>>  	.set_4b = aspeed_smc_chip_set_4b,
>> +	.optimize_read = aspeed_smc_optimize_read,
>> +	.calibrate = aspeed_smc_calibrate_reads_ast2600,
>>  	.segment_start = aspeed_smc_segment_start_ast2600,
>>  	.segment_end = aspeed_smc_segment_end_ast2600,
>>  	.segment_reg = aspeed_smc_segment_reg_ast2600,
>> @@ -1101,6 +1112,63 @@ static int aspeed_smc_optimize_read(struct 
>> aspeed_smc_chip *chip,
>>  	return 0;
>>  }
>>  
>> +#define TIMING_DELAY_DI         BIT(3)
>> +#define TIMING_DELAY_HCYCLE_MAX     5
>> +
>> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip 
>> *chip, u32 hdiv,
>> +					      const u8 *golden_buf, u8 *test_buf)
>> +{
>> +	struct aspeed_smc_controller *controller = chip->controller;
>> +	const struct aspeed_smc_info *info = controller->info;
>> +	int hcycle;
>> +	u32 shift = (hdiv - 2) << 3;
>> +	u32 mask = ~(0xfu << shift);
>> +	u32 fread_timing_val = 0;
>> +
>> +	for (hcycle = 0; hcycle <= TIMING_DELAY_HCYCLE_MAX; hcycle++) {
>> +		int delay_ns;
>> +		bool pass = false;
>> +
>> +		fread_timing_val &= mask;
>> +		fread_timing_val |= hcycle << shift;
>> +
>> +		/* no DI input delay first  */
>> +		writel(fread_timing_val, controller->regs + info->timing);
>> +		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
>> +		dev_dbg(chip->nor.dev,
>> +			"  * [%08x] %d HCLK delay, DI delay none : %s",
>> +			fread_timing_val, hcycle, pass ? "PASS" : "FAIL");
>> +		if (pass)
>> +			return 0;
>> +
>> +		/* Add DI input delays  */
>> +		fread_timing_val &= mask;
>> +		fread_timing_val |= (TIMING_DELAY_DI | hcycle) << shift;
>> +
>> +		for (delay_ns = 0; delay_ns < 0x10; delay_ns++) {
>> +			fread_timing_val &= ~(0xf << (4 + shift));
>> +			fread_timing_val |= delay_ns << (4 + shift);
>> +
>> +			writel(fread_timing_val, controller->regs + info->timing);
>> +			pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
>> +			dev_dbg(chip->nor.dev,
>> +				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
>> +				fread_timing_val, hcycle, (delay_ns + 1)/2,
>> +				(delay_ns + 1) & 1 ? 5 : 5, pass ? "PASS" : "FAIL");
>> +			/*
>> +			 * TODO: This is optimistic. We should look
>> +			 * for a working interval and save the middle
>> +			 * value in the read timing register.
>> +			 */
>> +			if (pass)
>> +				return 0;
>> +		}
>> +	}
>> +
>> +	/* No good setting for this frequency */
>> +	return -1;
>> +}
>> +
>>  static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>  {
>>  	struct aspeed_smc_controller *controller = chip->controller;
>> -- 
>> 2.21.0
>>
>>

