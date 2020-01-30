Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07714E462
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 22:00:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487t6f4n10zDqXs
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 08:00:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487t5m235kzDqWf;
 Fri, 31 Jan 2020 07:59:54 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 12:59:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="309818670"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga001.jf.intel.com with ESMTP; 30 Jan 2020 12:59:50 -0800
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To: Stephen Boyd <sboyd@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
 <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
 <20200130174208.B1D5620661@mail.kernel.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2f5b2f17-c5f3-4684-c276-c65820d1516d@linux.intel.com>
Date: Thu, 30 Jan 2020 12:59:50 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130174208.B1D5620661@mail.kernel.org>
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

Hi Stephen,

On 1/30/2020 9:42 AM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2020-01-15 13:26:38)
>> This commit adds critical clock setting logic that applies
>> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
>> device tree.
> 
> Yes that is what the patch does. The commit text is supposed to explain
> _why_ the patch is important. Please read "The canonical patch format"
> from Documentation/process/submitting-patches.rst to understand what is
> expected.

I see. I'll add more detailed summary.

>>
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
>>          for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>>                  const struct aspeed_gate_data *gd = &aspeed_gates[i];
>> +               unsigned long flags = gd->flags;
>>                  u32 gate_flags;
>>   
>> +               of_clk_detect_critical(pdev->dev.of_node, i, &flags);
>> +
> 
> Do you need clks to be critical, but only sometimes? What clks need to
> be critical? Why aren't there drivers for those clks that turn them on
> as necessary?
> 
> There was a lengthy discussion years ago on the list about this function
> and how it's not supposed to be used in newer code. Maybe we need to
> revisit that discussion and conclude that sometimes we actually do need
> clks to be turned on and kept on because we'll never have a driver for
> them in the kernel. Similar to how pinctrl has pin hogs.

Yes, I need to make BCLK as a critical only for specific platforms. BCLK
is for controllers that are connected through PCI or PCIe bus to the
host machine such as VGA controller, 2D graphics engine and P2A bridge
in this SoC.

I'm currently trying to enable VGA controller which is actually
independent from Aspeed BMC SoC. It means that the VGA can be reset
only when either host PCI bus reset or host power-on reset is asserted.
Basically, VGA hardware module is controlled by the host machine not by
the Aspeed BMC SoC.

I submitted this patch as an alternative solution of
https://www.spinics.net/lists/linux-clk/msg44836.html because there
could be use cases that intentionally disable the VGA controller
depend on hardware design. So it'd be helpful for reducing power
consumption and for allocating more generic memory space instead of
allocating dedicated VGA shared memory if we can flexibly config the
BCLK.

I think, we don't need to add VGA driver just for enabling the clock
because the VGA controller is actually controlled by host machine as I
explained above so I made this patch set instead.

I agree with you that we need to revisit the discussion.

Thanks,

Jae

