Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAFF20E8
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 22:40:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477g1R0TDvzF5nx
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 08:40:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.171.146; helo=9.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 23493 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 08:39:39 AEDT
Received: from 9.mo6.mail-out.ovh.net (9.mo6.mail-out.ovh.net [87.98.171.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477g0q4HKpzF5nc
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 08:39:35 +1100 (AEDT)
Received: from player774.ha.ovh.net (unknown [10.109.160.251])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id AC9B81EB491
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 15:28:39 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 3F2F2BCF57EA;
 Wed,  6 Nov 2019 14:28:36 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 1/4] ARM: dts: aspeed-g6: Add timer
 description
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191106091705.7416-1-joel@jms.id.au>
 <20191106091705.7416-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <521809e2-06ec-1db6-e456-d81bcf452a2e@kaod.org>
Date: Wed, 6 Nov 2019 15:28:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106091705.7416-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15606943036262812587
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06/11/2019 10:17, Joel Stanley wrote:
> The AST2600 has 8 32-bit timers on the APB bus.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 6db29ee769d5..e574254f298d 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -310,6 +310,21 @@
>  				status = "disabled";
>  			};
>  
> +			timer: timer@1e782000 {
> +				compatible = "aspeed,ast2600-timer";
> +				reg = <0x1e782000 0x90>;
> +				interrupts-extended = <&gic  GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +						<&gic  GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				clock-names = "PCLK";
> +                        };
> +
>  			uart1: serial@1e783000 {
>  				compatible = "ns16550a";
>  				reg = <0x1e783000 0x20>;
> 
x
