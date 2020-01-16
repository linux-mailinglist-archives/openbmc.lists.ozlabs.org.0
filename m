Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238013FAEF
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 22:02:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGqR54x5zDqy6
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 08:02:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zChs2YdSzDqJ3;
 Fri, 17 Jan 2020 05:41:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 10:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="305959327"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga001.jf.intel.com with ESMTP; 16 Jan 2020 10:41:42 -0800
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To: Paul Menzel <pmenzel@molgen.mpg.de>, Joel Stanley <joel@jms.id.au>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
 <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
 <3cafc96a-0ec5-d51c-94cc-2b2e41cc5c65@molgen.mpg.de>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0ba94fd3-e57f-82bc-0770-d623c2ce0a3b@linux.intel.com>
Date: Thu, 16 Jan 2020 10:41:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cafc96a-0ec5-d51c-94cc-2b2e41cc5c65@molgen.mpg.de>
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
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

On 1/16/2020 1:57 AM, Paul Menzel wrote:
> Dear Jae,
> 
> 
> On 2020-01-15 22:26, Jae Hyun Yoo wrote:
>> This commit adds critical clock setting logic that applies
>> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
>> device tree.
> 
> Tested how?

I added in the cover letter how I tested it. For an example, BCLK
can have the flag if I add below setting into one of
'aspeed-bmc-*.dts' files.

&syscon {
	clock-critical = <ASPEED_CLK_GATE_BCLK>;
};

>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/clk/clk-aspeed.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 411ff5fb2c07..d22eeb574ede 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>   
>>   	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>>   		const struct aspeed_gate_data *gd = &aspeed_gates[i];
>> +		unsigned long flags = gd->flags;
>>   		u32 gate_flags;
>>   
>> +		of_clk_detect_critical(pdev->dev.of_node, i, &flags);
>> +
> 
> The function description in `drivers/clk/clk.c` has the warning below.
> 
>>   * Do not use this function. It exists only for legacy Device Tree
>>   * bindings, such as the one-clock-per-node style that are outdated.
>>   * Those bindings typically put all clock data into .dts and the Linux
>>   * driver has no clock data, thus making it impossible to set this flag
>>   * correctly from the driver. Only those drivers may call
>>   * of_clk_detect_critical from their setup functions.
> 
> Will this still work?

At least, it still works now and still useful for this case. Actually, I
made this change as an alternative way of
https://www.spinics.net/lists/linux-clk/msg44836.html
because not all Aspeed BMC systems enable BCLK as a critical clock, so
it's for providing more flexible way of critical clock setting for
various hardware configurations.

If the function is deprecated and is going to be removed soon, would it
be acceptable if I add the 'critical-clock' parsing code into this
driver module instead of using the function?

Best Regards,

Jae

>>   		/* Special case: the USB port 1 clock (bit 14) is always
>>   		 * working the opposite way from the other ones.
>>   		 */
>> @@ -550,7 +553,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>   		hw = aspeed_clk_hw_register_gate(dev,
>>   				gd->name,
>>   				gd->parent_name,
>> -				gd->flags,
>> +				flags,
>>   				map,
>>   				gd->clock_idx,
>>   				gd->reset_idx,
> 
> 
> Kind regards,
> 
> Paul
> 
