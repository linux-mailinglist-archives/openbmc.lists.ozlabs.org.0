Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377E523FF2
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 00:06:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz8BF13Tvz3c8V
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 08:06:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SEpm6OYj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=SEpm6OYj; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz89p625Yz2yn2
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 08:05:50 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2B67956;
 Wed, 11 May 2022 15:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652306749;
 bh=WR9giu9c6oC0IN84nlPwwv04zCbwogbLjfeBO19jPKA=;
 h=From:To:Cc:Subject:Date:From;
 b=SEpm6OYjc7J0jfdRsnGrItCgrWMLRDWWYpr/Hq3l13GeShpHELAXIgFuBnRZGptQB
 1F+sppPrQINIqRwFdMncOjn/02lScvsaW+T09oj5JOzzPd8BGjCP+tfBPMsYZUaR+N
 FfUGa67+ijm1M0sh1E8ciFWK1PA1y54Qg5sehlQo=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add Delta
 AHE-50DC BMC
Date: Wed, 11 May 2022 15:05:42 -0700
Message-Id: <20220511220542.4394-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
are mostly compatible with the existing ast2400-evb device tree, with
a couple small tweaks for the serial console UART and ethernet MACs.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v1 [0]:
 - Disabled spi1, which this system doesn't use [Joel]

[0] https://lore.kernel.org/openbmc/20220414210045.26480-1-zev@bewilderbeest.net/

 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2400-ahe-50dc.dts | 38 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm/dts/ast2400-ahe-50dc.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index a79f885f54fb..3515100c65ce 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
+	ast2400-ahe-50dc.dtb \
 	ast2500-evb.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
diff --git a/arch/arm/dts/ast2400-ahe-50dc.dts b/arch/arm/dts/ast2400-ahe-50dc.dts
new file mode 100644
index 000000000000..d5e6f1989586
--- /dev/null
+++ b/arch/arm/dts/ast2400-ahe-50dc.dts
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+#include "ast2400-evb.dts"
+
+/ {
+	model = "Delta AHE-50DC BMC";
+	compatible = "delta,ahe-50dc-bmc", "aspeed,ast2400-evb", "aspeed,ast2400";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+};
+
+&uart5 {
+	status = "disabled";
+};
+
+&uart3 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
+};
+
+&mac0 {
+	status = "disabled";
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&spi1 {
+	status = "disabled";
+};
-- 
2.35.3

