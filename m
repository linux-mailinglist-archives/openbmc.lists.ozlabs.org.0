Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5B2EB9C8
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:03:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9f1n5QJpzDqBc
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 17:03:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9dyJ0hLzzDqbk;
 Wed,  6 Jan 2021 17:00:36 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1065sFlt004601;
 Wed, 6 Jan 2021 13:54:16 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Jan 2021 13:58:50 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <tglx@linutronix.de>, <maz@kernel.org>, <p.zabel@pengutronix.de>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] ARM: dts: aspeed: Add AST2600 eSPI nodes
Date: Wed, 6 Jan 2021 13:59:39 +0800
Message-ID: <20210106055939.19386-7-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1065sFlt004601
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add eSPI nodes for the device tree of Aspeed 6th generation SoCs.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 57 ++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 810b0676ab03..d457baf11e37 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -3,7 +3,9 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
+#include <dt-bindings/interrupt-controller/aspeed-espi-ic.h>
 #include <dt-bindings/clock/ast2600-clock.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
 	model = "Aspeed BMC";
@@ -75,6 +77,61 @@
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	espi: espi@1e6ee000 {
+		compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+		reg = <0x1e6ee000 0x1000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1e6ee000 0x1000>;
+
+		espi_ic: espi-ic {
+			#interrupt-cells = <1>;
+			compatible = "aspeed,ast2600-espi-ic";
+			interrupts-extended = <&gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gpio0 ASPEED_GPIO(W, 7) IRQ_TYPE_EDGE_FALLING>;
+			interrupt-controller;
+			status = "disabled";
+		};
+
+		espi_ctrl: espi-ctrl {
+			compatible = "aspeed,ast2600-espi-ctrl";
+			interrupts-extended = <&espi_ic ASPEED_ESPI_IC_CTRL_EVENT>,
+					      <&espi_ic ASPEED_ESPI_IC_CTRL_RESET>;
+			clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+			resets = <&syscon ASPEED_RESET_ESPI>;
+			status = "disabled";
+		};
+
+		espi_peripheral: espi-peripheral-channel {
+			compatible = "aspeed,ast2600-espi-peripheral";
+			interrupts-extended = <&espi_ic ASPEED_ESPI_IC_PERIF_EVENT>,
+					      <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+			status = "disabled";
+		};
+
+		espi_vw: espi-vw-channel {
+			compatible = "aspeed,ast2600-espi-vw";
+			interrupts-extended = <&espi_ic ASPEED_ESPI_IC_VW_EVENT>,
+					      <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+			status = "disabled";
+		};
+
+		espi_oob: espi-oob-channel {
+			compatible = "aspeed,ast2600-espi-oob";
+			interrupts-extended = <&espi_ic ASPEED_ESPI_IC_OOB_EVENT>,
+					      <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+			status = "disabled";
+		};
+
+		espi_flash: espi-flash-channel {
+			compatible = "aspeed,ast2600-espi-flash";
+			interrupts-extended = <&espi_ic ASPEED_ESPI_IC_FLASH_EVENT>,
+					      <&espi_ic ASPEED_ESPI_IC_CHAN_RESET>;
+			status = "disabled";
+		};
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.1

