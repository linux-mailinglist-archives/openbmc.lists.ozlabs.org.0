Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621354314B
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 15:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ7LN0vlRz3bmw
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 23:27:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1081 seconds by postgrey-1.36 at boromir; Wed, 08 Jun 2022 23:26:50 AEST
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net [178.32.121.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ7L2669Fz307B
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 23:26:47 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4D44021EC5;
	Wed,  8 Jun 2022 13:08:40 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 8 Jun 2022
 15:08:39 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-96R001c649a352-519d-4a15-8b27-ad31a683607c,
                    54A3B2140384DD5702107EFE02B2448601CCACB1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4c2702c7-14ee-df07-5c5c-eca257947536@kaod.org>
Date: Wed, 8 Jun 2022 15:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
Content-Language: en-US
To: Zev Weiss <zweiss@equinix.com>
References: <20220608082221.460166-1-clg@kaod.org>
 <20220608101727.GR11809@packtop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220608101727.GR11809@packtop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ca1d157c-1cdd-4222-a993-a7207c7a1f79
X-Ovh-Tracer-Id: 11481927253563378653
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/8/22 12:17, Zev Weiss wrote:
> On Wed, Jun 08, 2022 at 01:22:21AM PDT, Cédric Le Goater wrote:
>> Palmettos were the first OpenPOWER systems built by Tyan with the
>> product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
>> processor and an Aspeed AST2400 SoC.
>>
>> The ast2400_openbmc_defconfig defconfig is based on the evb-ast2400
>> defconfig, plus these extras :
>>
>>   CONFIG_BOOTCOMMAND="bootm 20080000"
>>   CONFIG_DEFAULT_DEVICE_TREE="ast2400-palmetto"
>>   CONFIG_PHY_NCSI=y
>>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>> Changes in v2 :
>>
>> - device tree cleanups to match HW
>> - renamed defconfig to ast2400_openbmc_defconfig
>>
>> arch/arm/dts/Makefile             |  1 +
>> arch/arm/dts/ast2400-palmetto.dts | 74 +++++++++++++++++++++++++++++++
>> configs/ast2400_openbmc_defconfig | 72 ++++++++++++++++++++++++++++++
>> 3 files changed, 147 insertions(+)
>> create mode 100644 arch/arm/dts/ast2400-palmetto.dts
>> create mode 100644 configs/ast2400_openbmc_defconfig
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index 8f876a0aa0d7..1d523c5d5da0 100755
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>>
>> dtb-$(CONFIG_ARCH_ASPEED) += \
>> 	ast2400-evb.dtb \
>> +	ast2400-palmetto.dtb \
>> 	ast2400-ahe-50dc.dtb \
> 
> Sort?  (palmetto after ahe-50dc)

yes.

> 
>> 	ast2500-evb.dtb \
>> 	ast2600a0-evb.dtb \
>> diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-palmetto.dts
>> new file mode 100644
>> index 000000000000..2a49ded27b43
>> --- /dev/null
>> +++ b/arch/arm/dts/ast2400-palmetto.dts
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "ast2400-u-boot.dtsi"
>> +
>> +/ {
>> +	model = "Palmetto BMC";
>> +	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0x40000000 0x10000000>;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +		bootargs = "console=ttyS4,115200 earlyprintk";
> 
> Does bootargs serve a particular purpose here?  (The other ast2x00
> device-trees don't appear to include it.)


It is useless indeed.

>> +	};
>> +
>> +	aliases {
>> +		spi0 = &fmc;
>> +		spi1 = &spi1;
>> +		ethernet0 = &mac0;
>> +	};
>> +};
>> +
>> +&uart5 {
>> +	u-boot,dm-pre-reloc;
>> +	status = "okay";
>> +};
>> +
>> +&sdrammc {
>> +	clock-frequency = <200000000>;
>> +};
>> +
>> +&wdt1 {
>> +	u-boot,dm-pre-reloc;
>> +	status = "okay";
>> +};
>> +
>> +&wdt2 {
>> +	u-boot,dm-pre-reloc;
>> +	status = "okay";
>> +};
>> +
>> +&mac0 {
>> +	status = "okay";
>> +	phy-mode = "rgmii";
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
>> +};
>> +
>> +&fmc {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";
>> +		spi-max-frequency = <50000000>;
>> +		spi-tx-bus-width = <2>;
>> +		spi-rx-bus-width = <2>;
>> +	};
>> +};
>> +
>> +&spi1 {
>> +	status = "okay";
>> +	flash@0 {
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_spi1_default>;
>> +		status = "okay";
>> +		spi-max-frequency = <50000000>;
>> +		spi-tx-bus-width = <2>;
>> +		spi-rx-bus-width = <2>;
>> +	};
>> +};
>> diff --git a/configs/ast2400_openbmc_defconfig b/configs/ast2400_openbmc_defconfig
>> new file mode 100644
>> index 000000000000..d09358777304
>> --- /dev/null
>> +++ b/configs/ast2400_openbmc_defconfig
> 
> Is the implication here that the testing discussed in the v1 thread
> (using the existing evb defconfig instead of an entirely new one) didn't
> work out?

No because of NCSI support. net_loop() would need some tweak to
avoid configuring NCSI if the DT has no advertise support.

Here is a tentative try below, tested on the AST2500 EVB.

Thanks,

C.


 From b621c15390719197357554f52f340aaa87dc80d4 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Wed, 8 Jun 2022 15:06:53 +0200
Subject: [PATCH] net: phy: ncsi: Add phy_interface_is_ncsi() helper
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

and use it to avoid configuring NCSI in net_loop() when the DT has no
support for it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
  include/phy.h         | 2 ++
  drivers/net/phy/phy.c | 7 +++++++
  net/net.c             | 2 +-
  3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/phy.h b/include/phy.h
index ed21775f3bbc..a759d04038a3 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -287,6 +287,8 @@ static inline bool phy_interface_is_sgmii(struct phy_device *phydev)
  		phydev->interface <= PHY_INTERFACE_MODE_QSGMII;
  }
  
+bool phy_interface_is_ncsi(void);
+
  /* PHY UIDs for various PHYs that are referenced in external code */
  #define PHY_UID_CS4340  	0x13e51002
  #define PHY_UID_CS4223  	0x03e57003
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index daea26c451fe..a0f7b7964464 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
  
  	return -1;
  }
+
+bool phy_interface_is_ncsi(void)
+{
+	struct eth_pdata *pdata = dev_get_platdata(eth_get_dev());
+
+	return pdata->phy_interface == PHY_INTERFACE_MODE_NCSI;
+}
diff --git a/net/net.c b/net/net.c
index f0f9cd4d946b..8449445bf65c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
  	debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
  
  #ifdef CONFIG_PHY_NCSI
-	if (protocol != NCSI && !ncsi_active()) {
+	if (phy_interface_is_ncsi() && protocol != NCSI && !ncsi_active()) {
  		printf("Configuring NCSI\n");
  		if (net_loop(NCSI) < 0)
  			return ret;
-- 
2.35.3



