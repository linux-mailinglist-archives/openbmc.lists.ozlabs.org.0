Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E081054B
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 07:44:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v6lb2XpfzDqST
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 15:44:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="knq8d/NW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ij45WZD3"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v6kc11nLzDqS7
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 15:43:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53A7B22D50;
 Wed,  1 May 2019 01:43:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 01:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=zqn9bFRnPY4DXg+EtvE+YjYZoMwX3rD
 OCTuHlCwHnQM=; b=knq8d/NWcl4ElvfX4WLd79Zoiid1omHH1cW8f+EXwWHfGpe
 Fs/MhvwYOjNLqVAmKMlEz32e1P3tt8L/n4wqeAvr4j2umIvuq3g48HHsG3HukuAl
 GxBXPUIwIRA1zYm+/wPSgugpuQXC7tZaVm+GAKpgp36WsQiBTZUxym1UQSNI+TZB
 PHYPFwf5ApOvjLJzX5iO3lBugMEfVYblDtfq8a+KNGW8dEPD0A5rPesifo6UsZ4l
 bWWGGCVSm/q/g+tgrwRiH7TTVMPrObUWk5AL9miNXZya6EKsQJFaC/znHn0EhaYJ
 HZtZoGUz35IcObfj/TBRkB4P8FuNnj+3WG74b5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zqn9bF
 RnPY4DXg+EtvE+YjYZoMwX3rDOCTuHlCwHnQM=; b=Ij45WZD3t0xs9SOqeNoVNB
 +cb/N+zp1GYkRg5UZ7R8eT8Ptf/QUFDRa28wkufK1t2TrsuaBkTFG1KMB99Au9cZ
 g31JJ1gviedZ4y4Tozf6yZk/9Zt+aeHZkpmBBDfGdjEedBdOzf5MCU1XJd7/VFRA
 XnDPHdjWDQ5ifSX3jCT1WFd8WNObye0tu3ZL7YS62gXniuFH7UKkXc+jEeWxUW+C
 COQTDoUX8F3kTo6AgtPmjCr8xV2K/9FlbtcyU9GZepnDGzIHqCG2AbSI16siEJVZ
 nk/UFad9EcrdXdWJ8aIacFVK6WDmTfX1mRBAny0ODoTZbF+NYZQ0qm9Xg/QcezMQ
 ==
X-ME-Sender: <xms:8jHJXI0-6eFXqkwqzicoqeMQmyMPNxz-1fMP0Y1b2il94H13v3OW6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeigddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:8zHJXHUcpoD4HWluCig5MAVOX8oDA_6oGRQfk4J3xr1VV-Y2j0it7Q>
 <xmx:8zHJXN3zDsC1kviNdQr48Eq4P2t7hK0FWYHs4XYr-tVhL45VRkmYgg>
 <xmx:8zHJXAjkwY5AsPkkYqupfLA3PbzVAAsqEXJQkr5BqSrx1fEmr4X9XA>
 <xmx:9DHJXE-oX9Gh89CYabXTeup9ON_4YAcKCqJtErxAzkkh4w55M_wcDA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CCDDF7C199; Wed,  1 May 2019 01:43:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <9e9b1574-7d06-4866-a706-a11b390b3702@www.fastmail.com>
In-Reply-To: <1556622019-7790-1-git-send-email-ray.lue@mic.com.tw>
References: <1556622019-7790-1-git-send-email-ray.lue@mic.com.tw>
Date: Wed, 01 May 2019 01:43:14 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ray Lue" <ray.lue@gmail.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>, "Vijay Khemka" <vijaykhemka@fb.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.0_v2_1/1]_ARM:_dts:_aspeed:_Add_s7106_B?=
 =?UTF-8?Q?MC_Machine?=
Content-Type: text/plain
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
Cc: Ray Lue <ray.lue@mic.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ray,

Thanks for the patch, it would be good to send this upstream!

However, some comments below:

On Tue, 30 Apr 2019, at 20:32, Ray Lue wrote:
> s7106 is a Tyan platform family with an ASPEED AST2500 BMC.
> 
> Signed-off-by: Ray Lue <ray.lue@mic.com.tw>
> ---
>  arch/arm/boot/dts/Makefile                  |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 175 ++++++++++++++++++++++++++++
>  2 files changed, 177 insertions(+), 1 deletion(-)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148..bc38f77 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-tyan-s7106.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts 
> b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> new file mode 100755
> index 0000000..563558d
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +	model = "Tyan S7106 BMC";
> +	compatible = "tyan,s7106-bmc", "aspeed,ast2500";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x00800000>; /* 8MB */
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +			<&adc 12>, <&adc 13>, <&adc 14>;
> +	};
> +
> +	iio-hwmon-battery {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 15>;
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		label = "bmc";
> +		status = "okay";
> +		m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +// UART1 is used only by the host. While the BMC does not need to 
> access it,
> +// enable it here to make sure the UART's clock gets enabled.
> +&uart1 {
> +	status = "okay";

Needs a pinctrl node as well to ensure the UART IO is routed out of the
BMC.

> +};
> +
> +&uart3 {
> +	status = "okay";

As above.

> +};
> +
> +&uart5 {
> +	status = "okay";

Note that pinctrl isn't necessary here, uart5 functionality isn't behind a mux.

> +};
> +
> +&lpc_ctrl {
> +	status = "okay";

Have you run into issues with not assigning reserved memory? As far
as I'm aware we still need Vijay's patch to be applied.

Are you setting it to "okay" this just to enable the LPC clock?

> +};
> +
> +&lpc_snoop {
> +	status = "okay";
> +	snoop-ports = <0x80>;
> +};
> +
> +&adc {
> +	status = "okay";

Should have explicit pinctrl property here requesting the necessary
ADC lines. Looks like all the other platform DTS files need this fixed
too.

> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm3_default &pinctrl_pwm4_default>;
> +
> +	fan@0 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +	};
> +
> +	fan@2 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +	};
> +
> +	fan@3 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +	};
> +
> +	fan@4 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +	};
> +
> +	fan@5 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	nct7802@28 {
> +		compatible = "nuvoton,nct7802";

This compatible isn't documented anywhere. Do you have out-of-tree
bindings? A driver?

> +		reg = <0x28>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "at,24c256";

Compatible also isn't documented anywhere. Same queries as above.

> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	use-ncsi;
> +	no-hw-checksum;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
> -- 
> 2.7.4
> 
>

Cheers,

Andrew
