Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF50414751
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 13:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDwXQ3DLsz3c97
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 21:08:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvkf73cPz2yN6;
 Wed, 22 Sep 2021 20:32:42 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB9Ko012569;
 Wed, 22 Sep 2021 18:11:09 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 18:31:27 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <adrian.hunter@intel.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <andrew@aj.id.au>
Subject: [PATCH 07/10] arm: dts: aspeed: Adjust clock phase parameter
Date: Wed, 22 Sep 2021 18:31:13 +0800
Message-ID: <20210922103116.30652-8-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB9Ko012569
X-Mailman-Approved-At: Wed, 22 Sep 2021 21:04:50 +1000
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
Cc: BMC-SW@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change clock phase degree for AST2600 EVB.
These parameter has been verified with 100MHz
clock frequency for eMMC and SD controllers.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts | 8 ++++++++
 arch/arm/boot/dts/aspeed-ast2600-evb.dts    | 9 ++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts b/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
index dd7148060c4a..2d83617dc436 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts
@@ -13,3 +13,11 @@
 };
 
 /delete-node/ &sdc;
+
+&emmc_controller {
+	max-tap-delay = <706>;
+};
+
+&emmc {
+	clk-phase-mmc-hs200 = <0 13>, <1 103>;
+};
diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 4551dba499c2..f728b9d9b4cf 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -143,13 +143,15 @@
 
 &emmc_controller {
 	status = "okay";
+	/* Measured value with *handwave* environmentals and static loading */
+	max-tap-delay = <736>;
 };
 
 &emmc {
 	non-removable;
 	bus-width = <4>;
 	max-frequency = <100000000>;
-	clk-phase-mmc-hs200 = <9>, <225>;
+	clk-phase-mmc-hs200 = <0 27>, <1 95>;
 };
 
 &rtc {
@@ -260,6 +262,7 @@
 
 &sdc {
 	status = "okay";
+	max-tap-delay = <9000>;
 };
 
 /*
@@ -287,7 +290,7 @@
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci0>;
 	vqmmc-supply = <&vccq_sdhci0>;
-	clk-phase-sd-hs = <7>, <200>;
+	clk-phase-uhs-sdr50 = <0 130>, <0 238>;
 };
 
 &sdhci1 {
@@ -300,5 +303,5 @@
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci1>;
 	vqmmc-supply = <&vccq_sdhci1>;
-	clk-phase-sd-hs = <7>, <200>;
+	clk-phase-uhs-sdr50 = <0 130>, <0 130>;
 };
-- 
2.17.1

