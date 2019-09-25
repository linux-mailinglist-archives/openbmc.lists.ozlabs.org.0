Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54237BDEB7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:14:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddnc6nSbzDqnZ
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:14:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.63.230; helo=7.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 22:58:27 AEST
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddQq3SDSzDqVZ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:58:26 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.109.143.72])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 9D026144A88
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 3E093A33DD57;
 Wed, 25 Sep 2019 12:42:57 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 01/13] ARM: dts: aspeed-g6: Add FMC and SPI
 devices
Date: Wed, 25 Sep 2019 14:42:27 +0200
Message-Id: <20190925124239.27897-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6977764676474211074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 79 ++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b4991cbe1f36..e8c335416da8 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -80,6 +80,85 @@
 			    <0x40466000 0x2000>;
 			};
 
+		fmc: spi@1e620000 {
+			reg = < 0x1e620000 0xc4
+				0x20000000 0x10000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2600-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			status = "disabled";
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+			flash@2 {
+				reg = < 2 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+		};
+
+		spi1: spi@1e630000 {
+			reg = < 0x1e630000 0xc4
+				0x30000000 0x10000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2600-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			status = "disabled";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+		};
+
+		spi2: spi@1e631000 {
+			reg = < 0x1e631000 0xc4
+				0x50000000 0x10000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2600-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			status = "disabled";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+			flash@2 {
+				reg = < 2 >;
+				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
+				status = "disabled";
+			};
+		};
+
 		mdio0: mdio@1e650000 {
 			compatible = "aspeed,ast2600-mdio";
 			reg = <0x1e650000 0x8>;
-- 
2.21.0

