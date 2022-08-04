Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D65897C8
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 08:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyzSQ2t13z3052
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 16:33:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=79.137.123.220; helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyzS86zvWz2xnV
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 16:32:53 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7E19011C8FD20;
	Thu,  4 Aug 2022 08:16:14 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 08:16:09 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-102R004dacac5dd-c1d0-4bb2-ab10-0ccf146dcc01,
                    E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b1e6cec2-32f0-a316-ad4e-0dff839260ea@kaod.org>
Date: Thu, 4 Aug 2022 08:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add a
 Romulus board (AST2500)
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
References: <20220804035504.92900-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220804035504.92900-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 729cab9f-f345-49bf-b36d-de13b048153e
X-Ovh-Tracer-Id: 7217299879383894938
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhohedvle
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

On 8/4/22 05:55, Joel Stanley wrote:
> Romulus was the OpenPOWER reference platform for the IBM Power9,
> containing an ASPEED AST2500.
> 
> It was designed by IBM and built by SuperMicro. This reference platform
> was sold as the Raptor Computing Systems Tallos II.
> 
> The machine used one 32MB SPI NOR for the BMC, a second SPI NOR flash
> for the host firmware, and the Broadcom BCM5719 attached via NC-SI.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I have been using a similar patch for a while (QEMU purpose only)

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Which defconfig are you using ?

Thanks,

C.

> ---
>   arch/arm/dts/Makefile            |  1 +
>   arch/arm/dts/ast2500-romulus.dts | 76 ++++++++++++++++++++++++++++++++
>   2 files changed, 77 insertions(+)
>   create mode 100644 arch/arm/dts/ast2500-romulus.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index c1f24a14a615..6c34b8333634 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -679,6 +679,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2400-ahe-50dc.dtb \
>   	ast2400-palmetto.dtb \
>   	ast2500-evb.dtb \
> +	ast2500-romulus.dtb \
>   	ast2600a0-evb.dtb \
>   	ast2600a1-evb.dtb \
>   	ast2600-bletchley.dtb \
> diff --git a/arch/arm/dts/ast2500-romulus.dts b/arch/arm/dts/ast2500-romulus.dts
> new file mode 100644
> index 000000000000..726d3f54ff24
> --- /dev/null
> +++ b/arch/arm/dts/ast2500-romulus.dts
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2022 IBM Corp.
> +/dts-v1/;
> +
> +#include "ast2500-u-boot.dtsi"
> +
> +/ {
> +	model = "Romulus BMC";
> +	compatible = "ibm,romulus-bmc", "aspeed,ast2500";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	aliases {
> +		spi0 = &fmc;
> +		spi1 = &spi1;
> +		ethernet0 = &mac0;
> +		ethernet1 = &mac1;
> +	};
> +};
> +
> +&uart5 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&sdrammc {
> +	clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	phy-mode = "NC-SI";
> +	use-ncsi;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	flash@0 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_spi1_default>;
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};

