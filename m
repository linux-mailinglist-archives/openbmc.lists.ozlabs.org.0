Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5202C418DB7
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 04:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHmqy1B5vz2ynh
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 12:32:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHmq76DP8z2xtj;
 Mon, 27 Sep 2021 12:31:29 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18R2AI0a038749;
 Mon, 27 Sep 2021 10:10:18 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 27 Sep 2021 10:30:55 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
Date: Mon, 27 Sep 2021 10:30:49 +0800
Message-ID: <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18R2AI0a038749
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
Cc: osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 'reg-io-width' properties are not used by LPC drivers
nor documented as part of bindings. Therefore drop them.

This is in preparation to move aspeed-lpc.txt to YAML schema.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
 arch/arm/boot/dts/aspeed-g6.dtsi | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index c5aeb3cf3a09..45a25eb4baa4 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -345,7 +345,6 @@
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 73ca1ec6fc24..8e1d00d8445e 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -436,7 +436,6 @@
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 1b47be1704f8..0d1aae6887cd 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -490,7 +490,6 @@
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.17.1

