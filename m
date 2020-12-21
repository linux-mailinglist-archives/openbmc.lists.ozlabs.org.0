Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B939F2E040A
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 02:49:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0K5Q1ZNNzDqPQ
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 12:49:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzsDj5wbQzDqTZ;
 Mon, 21 Dec 2020 18:54:09 +1100 (AEDT)
IronPort-SDR: HjMDHAEE5/ykeNAl7c4cEX/bYtfc5vzUA7S37tQAlDL+kevX//oLhwudnmh7CSizaoUgnsP0+l
 ngXGwy4H2DGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="172184047"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="172184047"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2020 23:54:04 -0800
IronPort-SDR: 3YZFBbHJQgZ0sUp81t+n3fSzD+Roiww3AEymwF3PgrT79xjDhA865R7xHBDXUQQigeTkzhHmoQ
 eHCHef0dR8bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="415701255"
Received: from shwdenpg096.ccr.corp.intel.com (HELO [10.67.104.88])
 ([10.67.104.88])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2020 23:53:45 -0800
Subject: Re: [PATCH v3 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linus.walleij@linaro.org, minyard@acm.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
 <20201221055623.31463-4-chiawei_wang@aspeedtech.com>
From: Haiyue Wang <haiyue.wang@linux.intel.com>
Message-ID: <12d347b6-168b-11d2-b906-18164afb1724@linux.intel.com>
Date: Mon, 21 Dec 2020 15:53:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221055623.31463-4-chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 22 Dec 2020 12:47:06 +1100
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
Cc: BMC-SW@aspeedtech.com, cyrilbur@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/21/2020 13:56, Chia-Wei, Wang wrote:
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>   drivers/char/ipmi/kcs_bmc_aspeed.c | 35 ++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index a140203c079b..6283bfef4ea7 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -27,7 +27,6 @@
>   
>   #define KCS_CHANNEL_MAX     4
>   
> -/* mapped to lpc-bmc@0 IO space */
>   #define LPC_HICR0            0x000
>   #define     LPC_HICR0_LPC3E          BIT(7)
>   #define     LPC_HICR0_LPC2E          BIT(6)
> @@ -52,15 +51,13 @@
>   #define LPC_STR1             0x03C
>   #define LPC_STR2             0x040
>   #define LPC_STR3             0x044
> -
> -/* mapped to lpc-host@80 IO space */
> -#define LPC_HICRB            0x080
> +#define LPC_HICRB            0x100
>   #define     LPC_HICRB_IBFIF4         BIT(1)
>   #define     LPC_HICRB_LPC4E          BIT(0)
> -#define LPC_LADR4            0x090
> -#define LPC_IDR4             0x094
> -#define LPC_ODR4             0x098
> -#define LPC_STR4             0x09C
> +#define LPC_LADR4            0x110
> +#define LPC_IDR4             0x114
> +#define LPC_ODR4             0x118
> +#define LPC_STR4             0x11C
>   
>   struct aspeed_kcs_bmc {
>   	struct regmap *map;
> @@ -345,15 +342,25 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct kcs_bmc *kcs_bmc;
> -	struct device_node *np;
> +	struct device_node *kcs_np;
> +	struct device_node *lpc_np;
>   	int rc;
>   

I think you can just use 'np' to do LPC compatible checking:

np = pdev->dev.of_node->parent;

if (!of_device_is_compatible(lpc_np, "aspeed,ast2400-lpc-v2") &&
     !of_device_is_compatible(lpc_np, "aspeed,ast2500-lpc-v2") &&
     !of_device_is_compatible(lpc_np, "aspeed,ast2600-lpc-v2")) {
	dev_err(dev, "unsupported LPC device binding\n");
	return -ENODEV;
}


before:

np = pdev->dev.of_node;
if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
     of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))

Then the patch is clear. ;-)

> -	np = pdev->dev.of_node;
> -	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
> -			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
> +	kcs_np = dev->of_node;
> +	lpc_np = kcs_np->parent;
> +
> +	if (!of_device_is_compatible(lpc_np, "aspeed,ast2400-lpc-v2") &&
> +	    !of_device_is_compatible(lpc_np, "aspeed,ast2500-lpc-v2") &&
> +	    !of_device_is_compatible(lpc_np, "aspeed,ast2600-lpc-v2")) {
> +		dev_err(dev, "unsupported LPC device binding\n");
> +		return -ENODEV;
> +	}
> +
> +	if (of_device_is_compatible(kcs_np, "aspeed,ast2400-kcs-bmc") ||
> +			of_device_is_compatible(kcs_np, "aspeed,ast2500-kcs-bmc"))
>   		kcs_bmc = aspeed_kcs_probe_of_v1(pdev);
> -	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
> -			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
> +	else if (of_device_is_compatible(kcs_np, "aspeed,ast2400-kcs-bmc-v2") ||
> +			of_device_is_compatible(kcs_np, "aspeed,ast2500-kcs-bmc-v2"))
>   		kcs_bmc = aspeed_kcs_probe_of_v2(pdev);
>   	else
>   		return -EINVAL;
