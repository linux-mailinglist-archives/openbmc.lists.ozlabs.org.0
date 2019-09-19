Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6143B7F32
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 18:32:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z2Sy2XzxzF56D
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 02:32:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z2S93nk9zF4d8
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 02:32:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JGHTPI126891; Thu, 19 Sep 2019 12:32:02 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdfp2ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 12:32:01 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JGH4mM020445;
 Thu, 19 Sep 2019 16:31:59 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2v3vbtrjp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:31:59 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JGVw4m26607916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 16:31:58 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9439B2064;
 Thu, 19 Sep 2019 16:31:58 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 816C8B205F;
 Thu, 19 Sep 2019 16:31:58 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 16:31:58 +0000 (GMT)
Subject: Re: [PATCH v2 linux dev-5.3 4/4] ARM: dts: aspeed: add Rainier system
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-10-bradleyb@fuzziesquirrel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <2d74af3f-faba-4435-f7da-613dabee5602@linux.vnet.ibm.com>
Date: Thu, 19 Sep 2019 11:31:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919152340.23133-10-bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190146
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/19/19 10:23 AM, Brad Bishop wrote:
> Rainier is a new Power system with an AST2600.


Reviewed-by: Eddie James <eajames@linux.ibm.com>

Thanks!

Eddie


>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v2:
>    - reordered rainier DT elements (alphabetized).
>    - added rainier rtc, lpc-ctl, reserved memory, mac devices
> ---
>   arch/arm/boot/dts/Makefile                   |   3 +-
>   arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 485 +++++++++++++++++++
>   2 files changed, 487 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5af075c2f819..2f81a4be50a8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1293,4 +1293,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-opp-witherspoon.dtb \
>   	aspeed-bmc-opp-zaius.dtb \
>   	aspeed-bmc-portwell-neptune.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-opp-rainier.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> new file mode 100644
> index 000000000000..5f45b1effe4a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2019 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "Rainier";
> +	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
> +		};
> +	};
> +
> +};
> +
> +&emmc_controller {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	status = "okay";
> +};
> +
> +&fsim0 {
> +	status = "okay";
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	power-supply@68 {
> +		compatible = "ibm,cffps2";
> +		reg = <0x68>;
> +	};
> +
> +	power-supply@69 {
> +		compatible = "ibm,cffps2";
> +		reg = <0x69>;
> +	};
> +
> +	power-supply@6a {
> +		compatible = "ibm,cffps2";
> +		reg = <0x6a>;
> +	};
> +
> +	power-supply@6b {
> +		compatible = "ibm,cffps2";
> +		reg = <0x6b>;
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +
> +	tmp275@4b {
> +		compatible = "ti,tmp275";
> +		reg = <0x4b>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +
> +	si7021-a20@20 {
> +		compatible = "silabs,si7020";
> +		reg = <0x20>;
> +	};
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	max31785@52 {
> +		compatible = "maxim,max31785a";
> +		reg = <0x52>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fan@0 {
> +			compatible = "pmbus-fan";
> +			reg = <0>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@1 {
> +			compatible = "pmbus-fan";
> +			reg = <1>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@2 {
> +			compatible = "pmbus-fan";
> +			reg = <2>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@3 {
> +			compatible = "pmbus-fan";
> +			reg = <3>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +	};
> +
> +	pca0: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
> +			reg = <0>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +		};
> +	};
> +
> +	dps: dps310@76 {
> +		compatible = "infineon,dps310";
> +		reg = <0x76>;
> +		#io-channel-cells = <0>;
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +
> +	ucd90320@b {
> +		compatible = "ti,ucd90160";
> +		reg = <0x0b>;
> +	};
> +
> +	ucd90320@c {
> +		compatible = "ti,ucd90160";
> +		reg = <0x0c>;
> +	};
> +
> +	ucd90320@11 {
> +		compatible = "ti,ucd90160";
> +		reg = <0x11>;
> +	};
> +
> +	rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +	};
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	ir35221@42 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x42>;
> +	};
> +
> +	ir35221@43 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x43>;
> +	};
> +
> +	ir35221@44 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x44>;
> +	};
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	tmp423b@4d {
> +		compatible = "ti,tmp423";
> +		reg = <0x4d>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};
> +
> +	ir35221@73 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x73>;
> +	};
> +
> +	ir35221@74 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x74>;
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +
> +	ir35221@42 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x42>;
> +	};
> +
> +	ir35221@43 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x43>;
> +	};
> +
> +	ir35221@44 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x44>;
> +	};
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	tmp423b@4d {
> +		compatible = "ti,tmp423";
> +		reg = <0x4d>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};
> +
> +	ir35221@73 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x73>;
> +	};
> +
> +	ir35221@74 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x74>;
> +	};
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
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
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;
> +	flash = <&spi1>;
> +};
> +
> +&mac0 {
> +	status = "okay";
> +};
> +
> +&mac1 {
> +	status = "okay";
> +};
> +
> +&mac2 {
> +	status = "okay";
> +};
> +
> +&mac3 {
> +	status = "okay";
> +};
> +
> +&sdc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sd1_default>;
> +};
> +
> +&sdhci1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sd2_default>;
> +};
