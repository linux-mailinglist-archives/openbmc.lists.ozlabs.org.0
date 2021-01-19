Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFB2FC39B
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 23:38:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL3Ts1h4TzDqvY
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:38:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL3PC5s9pzDqTY
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 09:34:35 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10JMYGIG008270;
 Wed, 20 Jan 2021 00:34:16 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 4F47263A17; Wed, 20 Jan 2021 00:34:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 1/4] arm: dts: npcm7xx: Add syscon property
Date: Wed, 20 Jan 2021 00:34:09 +0200
Message-Id: <20210119223412.223492-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210119223412.223492-1-tmaimon77@gmail.com>
References: <20210119223412.223492-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add syscon property to ADC and watchdog nodes.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 455a96b23b85..448cfc9d4ae1 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -82,7 +82,7 @@
 			"simple-mfd";
 			reg = <0x801000 0x6C>;
 		};
-		
+
 		fuse:fuse@18a000 {
 			compatible = "nuvoton,npcm750-fuse", "syscon",
 				"simple-mfd";
@@ -425,6 +425,7 @@
 				reg = <0x801C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				syscon = <&gcr>;
 			};
 
 			watchdog1: watchdog@901C {
@@ -433,6 +434,7 @@
 				reg = <0x901C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				syscon = <&gcr>;
 			};
 
 			watchdog2: watchdog@a01C {
@@ -441,6 +443,7 @@
 				reg = <0xa01C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				syscon = <&gcr>;
 			};
 
 			serial0: serial@1000 {
@@ -493,6 +496,7 @@
 				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_ADC>;
 				resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
+				syscon = <&fuse>;
 				status = "disabled";
 			};
 
-- 
2.22.0

