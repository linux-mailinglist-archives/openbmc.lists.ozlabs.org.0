Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F33EAFCB
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 07:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmCLt3HYqz3cHd
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 15:49:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmCKW6ypLz309K;
 Fri, 13 Aug 2021 15:48:45 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17D5UDmZ018826;
 Fri, 13 Aug 2021 13:30:13 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Aug 2021 13:48:05 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <cyrilbur@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH 2/2] ARM: dts: aspeed: Add mailbox to device tree
Date: Fri, 13 Aug 2021 13:47:58 +0800
Message-ID: <20210813054758.13189-3-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210813054758.13189-1-chiawei_wang@aspeedtech.com>
References: <20210813054758.13189-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17D5UDmZ018826
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

Add mailbox to the device tree for Aspeed AST24xx/AST25xx/AST26xx SoCs.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 8 +++++++-
 arch/arm/boot/dts/aspeed-g6.dtsi | 7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index c5aeb3cf3a09..6298d69df415 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -383,6 +383,13 @@
 					interrupts = <8>;
 					status = "disabled";
 				};
+
+				mbox: mbox@200 {
+					compatible = "aspeed,ast2500-mbox";
+					reg = <0x200 0x30>;
+					interrupts = <46>;
+					status = "disabled";
+				};
 			};
 
 			uart2: serial@1e78d000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 329eaeef66fb..ab9453d7803c 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -497,13 +497,19 @@
 					reg = <0xa0 0x24 0xc8 0x8>;
 				};
 
-
 				ibt: ibt@140 {
 					compatible = "aspeed,ast2500-ibt-bmc";
 					reg = <0x140 0x18>;
 					interrupts = <8>;
 					status = "disabled";
 				};
+
+				mbox: mbox@200 {
+					compatible = "aspeed,ast2500-mbox";
+					reg = <0x200 0x30>;
+					interrupts = <46>;
+					status = "disabled";
+				};
 			};
 
 			uart2: serial@1e78d000 {
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f96607b7b4e2..09b286f2ece2 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -529,6 +529,13 @@
 					interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
 				};
+
+				mbox: mbox@200 {
+					compatible = "aspeed,ast2600-mbox";
+					reg = <0x200 0xc0>;
+					interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
 			};
 
 			sdc: sdc@1e740000 {
-- 
2.17.1

