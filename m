Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A26B886D
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 03:22:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbHNZ4RMNz3cJq
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 13:22:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbHKb736Gz3c2j;
	Tue, 14 Mar 2023 13:19:47 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 32E24ACY072546;
	Tue, 14 Mar 2023 10:04:10 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Mar
 2023 10:18:20 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <pmenzel@molgen.mpg.de>,
        <ilpo.jarvinen@linux.intel.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 5/5] ARM: dts: aspeed-g6: Add UDMA node
Date: Tue, 14 Mar 2023 10:18:17 +0800
Message-ID: <20230314021817.30446-6-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 32E24ACY072546
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

Add the device tree node for the UART DMA (UDMA) controller.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 8246a60de0d0..fe0633660f81 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -863,6 +863,15 @@ fsim1: fsi@1e79b100 {
 				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
 				status = "disabled";
 			};
+
+			udma: dma-controller@1e79e000 {
+				compatible = "aspeed,ast2600-udma";
+				reg = <0x1e79e000 0x1000>;
+				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+				dma-channels = <14>;
+				#dma-cells = <1>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.25.1

