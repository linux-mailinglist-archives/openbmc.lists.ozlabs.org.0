Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC141474F
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 13:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDwWz1P4tz3cFX
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 21:08:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvkf3r3Zz2yJv;
 Wed, 22 Sep 2021 20:32:42 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB9Cp012570;
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
Subject: [PATCH 08/10] arm: dts: ibm: Adjust clock phase parameter
Date: Wed, 22 Sep 2021 18:31:14 +0800
Message-ID: <20210922103116.30652-9-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB9Cp012570
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

- Add max-tap-delay property for eMMC controller.
- Change clock phase degree for AST2600 on IBM platforms.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 2efd70666738..eccb4749755a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2824,6 +2824,7 @@
 
 &emmc_controller {
 	status = "okay";
+	max-tap-delay = <1253>;
 };
 
 &pinctrl_emmc_default {
@@ -2832,7 +2833,7 @@
 
 &emmc {
 	status = "okay";
-	clk-phase-mmc-hs200 = <210>, <228>;
+	clk-phase-mmc-hs200 = <1 124>, <1 141>;
 };
 
 &fsim0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 6419c9762c0b..2138a8a10d6e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -299,6 +299,7 @@
 
 &emmc_controller {
 	status = "okay";
+	max-tap-delay = <1253>;
 };
 
 &pinctrl_emmc_default {
@@ -307,7 +308,7 @@
 
 &emmc {
 	status = "okay";
-	clk-phase-mmc-hs200 = <180>, <180>;
+	clk-phase-mmc-hs200 = <1 90>, <1 90>;
 };
 
 &fsim0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index e39f310d55eb..7427809354cc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -182,11 +182,12 @@
 
 &emmc_controller {
 	status = "okay";
+	max-tap-delay = <1253>;
 };
 
 &emmc {
 	status = "okay";
-	clk-phase-mmc-hs200 = <36>, <270>;
+	clk-phase-mmc-hs200 = <0 40>, <1 181>;
 };
 
 &fsim0 {
-- 
2.17.1

