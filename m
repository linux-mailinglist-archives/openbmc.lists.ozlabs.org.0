Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09215424D0
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHybr3pSCz3bgh
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=w4t0uhiR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=w4t0uhiR;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHybS4331z2yn5
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:52:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654671172; x=1686207172;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vdLe9GL9SPZn1XDUinyr4GRnVlzJQANxQyASHfMXlOU=;
  b=w4t0uhiRxcAawUfxoU7fnVT6jlhCZhPxtn5UDwp6g9YkRLu2TMQG/XdU
   6oZiRINjExIvrAQuHBaG+o2JOfNTlDxPSnunkW9/N/2KlH5vuJGzZF+bh
   jJQ7/XcbXD5fWJlAxvXelOrm9ZAtQvigkKw1l0tJvnGoLus4GOFYXUUat
   U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 07 Jun 2022 23:51:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 23:51:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 7 Jun 2022 23:51:49 -0700
Received: from [10.110.70.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 7 Jun 2022
 23:51:49 -0700
Message-ID: <e3e0a6dd-b33c-7c9c-0e0b-dd988c6fb2ae@quicinc.com>
Date: Tue, 7 Jun 2022 23:51:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>
References: <20220607142845.1123692-1-quic_jaehyoo@quicinc.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220607142845.1123692-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/7/2022 7:28 AM, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
> equipped with Aspeed AST2600 BMC SoC.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---

Tested it again on a real hardware and QEMU.
Worked with Cedric's patch:
https://lore.kernel.org/openbmc/20220608061455.365123-1-clg@kaod.org/T/#t

Thanks,
Jae

> Changes in v3:
> * Dropped compatible string of flash memory - Joel / Cedric
> * Dropped I2C pinctrl settings - Joel
> 
> Changes in v2:
> * Changed vendor name from Nuvia to Qualcomm.
> 
>   arch/arm/dts/Makefile                   |   1 +
>   arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 172 ++++++++++++++++++++++++
>   2 files changed, 173 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 8f876a0aa0d7..952c3d776adc 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-ncsi.dtb \
>   	ast2600-p10bmc.dtb \
>   	ast2600-pfr.dtb \
> +	ast2600-qcom-dc-scm-v1.dts \
>   	ast2600-s6q.dtb \
>   	ast2600-slt.dtb \
>   	ast2600-tacoma.dtb
> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> new file mode 100644
> index 000000000000..bbfb4c7e9e0d
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "Qualcomm DC-SCM V1 BMC";
> +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	aliases {
> +		spi0 = &fmc;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency = <800000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency = <800000000>;
> +		};
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
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +};
> +
> +&wdt3 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mdio4_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ethphy3: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&mac2 {
> +	status = "okay";
> +	reg = <0x1e670000 0x180>, <0x1e650018 0x4>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <133000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		spi-max-frequency = <133000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
> +			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
> +			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <133000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
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
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +};
> +
> +&scu {
> +	mac0-clk-delay = <0x1d 0x1c
> +			  0x10 0x17
> +			  0x10 0x17>;
> +	mac1-clk-delay = <0x1d 0x10
> +			  0x10 0x10
> +			  0x10 0x10>;
> +	mac2-clk-delay = <0x0a 0x04
> +			  0x08 0x04
> +			  0x08 0x04>;
> +	mac3-clk-delay = <0x0a 0x04
> +			  0x08 0x04
> +			  0x08 0x04>;
> +};
