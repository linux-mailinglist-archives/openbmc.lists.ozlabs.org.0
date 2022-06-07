Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925C53F923
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 11:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHPm70ZVPz3bnX
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 19:13:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net [178.33.254.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHPlr6y46z3bc8
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 19:13:10 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A2DDC24FE0;
	Tue,  7 Jun 2022 07:43:15 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 09:43:14 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-107S001d6997094-3969-4d0d-8ce2-465db6e60dbe,
                    B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org>
Date: Tue, 7 Jun 2022 09:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
 <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2308cc28-409d-404e-9736-3806e1ce911f
X-Ovh-Tracer-Id: 113434419127356323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/7/22 03:05, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Ping
>>
>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>
>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
>>> equipped with Aspeed AST2600 BMC SoC.
>>>
>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>> ---
>>> Changes in v2:
>>> * Changed vendor name from Nuvia to Qualcomm.
>>>
>>>    arch/arm/dts/Makefile                   |   1 +
>>>    arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208 ++++++++++++++++++++++++
>>>    2 files changed, 209 insertions(+)
>>>    create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>>
>>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>>> index 3515100c65ce..e86a6c0ed609 100755
>>> --- a/arch/arm/dts/Makefile
>>> +++ b/arch/arm/dts/Makefile
>>> @@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>        ast2600-intel.dtb \
>>>        ast2600-ncsi.dtb \
>>>        ast2600-pfr.dtb \
>>> +     ast2600-qcom-dc-scm-v1.dts \
>>>        ast2600-rainier.dtb \
>>>        ast2600-s6q.dtb \
>>>        ast2600-slt.dtb \
>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>> new file mode 100644
>>> index 000000000000..e966f739b708
>>> --- /dev/null
>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>>> @@ -0,0 +1,208 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>> +/dts-v1/;
>>> +
>>> +#include "ast2600-u-boot.dtsi"
>>> +
>>> +/ {
>>> +     model = "Qualcomm DC-SCM V1 BMC";
>>> +     compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
>>> +
>>> +     memory {
>>> +             device_type = "memory";
>>> +             reg = <0x80000000 0x40000000>;
>>> +     };
>>> +
>>> +     chosen {
>>> +             stdout-path = &uart5;
>>> +     };
>>> +
>>> +     aliases {
>>> +             spi0 = &fmc;
>>> +             spi1 = &spi1;
>>> +             spi2 = &spi2;
>>> +     };
>>> +
>>> +     cpus {
>>> +             cpu@0 {
>>> +                     clock-frequency = <800000000>;
>>> +             };
>>> +             cpu@1 {
>>> +                     clock-frequency = <800000000>;
>>> +             };
>>> +     };
>>> +};
>>> +
>>> +&uart5 {
>>> +     u-boot,dm-pre-reloc;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&sdrammc {
>>> +     clock-frequency = <400000000>;
>>> +};
>>> +
>>> +&wdt1 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&wdt2 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&wdt3 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&mdio {
>>> +     status = "okay";
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_mdio4_default>;
>>> +     #address-cells = <1>;
>>> +     #size-cells = <0>;
>>> +
>>> +     ethphy3: ethernet-phy@1 {
>>> +             reg = <1>;
>>> +     };
>>> +};
>>> +
>>> +&mac2 {
>>> +     status = "okay";
>>> +     reg = <0x1e670000 0x180>, <0x1e650018 0x4>;
>>> +     phy-mode = "rgmii";
>>> +     phy-handle = <&ethphy3>;
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_rgmii3_default>;
>>> +};
>>> +
>>> +&fmc {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_fmcquad_default>;
>>> +
>>> +     flash@0 {
>>> +             compatible = "spi-flash", "sst,w25q256";
> 
> Compatible strings should go from the most general to the most
> specific, so these are around the wrong way. I see you've probably
> just copied the ast2600-evb which makes the same mistake.
> 
> In the dtsi we have jedec,spi-nor which you overwrite here.
> 
> u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
> should update the aspeed driver to use that?
> 
> Cédric, do you have thoughts here?

Yes. The closer we are to the Linux DT the better.

The "spi-flash" and "jedec,spi-nor" compatibles are equivalent for
the SF driver in U-Boot. I think we can remove all the :

    compatible = "spi-flash", "sst,w25q256";

from the Aspeed dts files.

This fits what the latest U-Boot does.

Cheers,

C.

> 
>>> +             status = "okay";
>>> +             spi-max-frequency = <133000000>;
>>> +             spi-tx-bus-width = <4>;
>>> +             spi-rx-bus-width = <4>;
>>> +     };
>>> +
>>> +     flash@1 {
>>> +             compatible = "spi-flash", "sst,w25q256";
>>> +             status = "okay";
>>> +             spi-max-frequency = <133000000>;
>>> +             spi-tx-bus-width = <4>;
>>> +             spi-rx-bus-width = <4>;
>>> +     };
>>> +};
>>> +
>>> +&spi1 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
>>> +                     &pinctrl_spi1cs1_default &pinctrl_spi1wp_default
>>> +                     &pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
>>> +
>>> +     flash@0 {
>>> +             compatible = "spi-flash", "sst,w25q256";
>>> +             status = "okay";
>>> +             spi-max-frequency = <133000000>;
>>> +             spi-tx-bus-width = <4>;
>>> +             spi-rx-bus-width = <4>;
>>> +     };
>>> +};
>>> +
>>> +&i2c4 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c5_default>;
> 
> All of the pinctrl properties are set in the dtsi as of f2b82fa4ba17
> ("arm: dts: ast2600: Add I2C pinctrl"), so you can drop these.
> 
> 
>>> +};
>>> +
>>> +&i2c5 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c6_default>;
>>> +};
>>> +
>>> +&i2c6 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c7_default>;
>>> +};
>>> +
>>> +&i2c7 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c8_default>;
>>> +};
>>> +
>>> +&i2c8 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c9_default>;
>>> +};
>>> +
>>> +&i2c9 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c10_default>;
>>> +};
>>> +
>>> +&i2c10 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c11_default>;
>>> +};
>>> +
>>> +&i2c12 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c13_default>;
>>> +};
>>> +
>>> +&i2c13 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c14_default>;
>>> +};
>>> +
>>> +&i2c14 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c15_default>;
>>> +};
>>> +
>>> +&i2c15 {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_i2c16_default>;
>>> +};
>>> +
>>> +&scu {
>>> +     mac0-clk-delay = <0x1d 0x1c
>>> +                       0x10 0x17
>>> +                       0x10 0x17>;
>>> +     mac1-clk-delay = <0x1d 0x10
>>> +                       0x10 0x10
>>> +                       0x10 0x10>;
>>> +     mac2-clk-delay = <0x0a 0x04
>>> +                       0x08 0x04
>>> +                       0x08 0x04>;
>>> +     mac3-clk-delay = <0x0a 0x04
>>> +                       0x08 0x04
>>> +                       0x08 0x04>;
>>> +};

