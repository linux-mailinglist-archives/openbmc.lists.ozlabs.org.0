Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB091105D59
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 00:45:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jx4k0VVpzDr6d
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 10:45:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HVDJ2xTfzDqdq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:31:43 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xAJEoDNF005891;
 Tue, 19 Nov 2019 16:50:13 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id BEC3160329; Tue, 19 Nov 2019 16:50:13 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 mark.rutland@arm.com, tali.perry1@gmail.com, robh@kernel.org,
 wsa@the-dreams.de, jdelvare@suse.de, jarkko.nikula@linux.intel.com,
 geert@linux-m68k.org, arnd@arndb.de, max@enpas.org,
 krzysztof.adamski@nokia.com, syniurge@gmail.com, puwen@hygon.cn,
 jfi@ssv-embedded.de, sr@denx.de, mchehab+samsung@kernel.org,
 kdasu.kdev@gmail.com, enric.balletbo@collabora.com,
 baolin.wang@linaro.org, ludovic.desroches@microchip.com
Subject: [PATCH v5 1/2] dt-bindings: i2c: npcm7xx: * add binding for i2c
 controller
Date: Tue, 19 Nov 2019 16:49:29 +0200
Message-Id: <20191119144930.227241-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191119144930.227241-1-tali.perry1@gmail.com>
References: <20191119144930.227241-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Nov 2019 10:41:10 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 dt-bindings: i2c: npcm7xx: * add binding for i2c controller
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-npcm7xx.txt   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
new file mode 100644
index 000000000000..0ecae950748b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
@@ -0,0 +1,29 @@
+Nuvoton NPCM7XX I2C bus
+
+The NPCM750x includes sixteen I2C bus controllers. All Controllers support
+both master and slave mode. Each controller has two 16 byte HW FIFO for TX and
+RX.
+
+Required properties:
+- compatible      : must be "nuvoton,npcm750-i2c"
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the I2C interrupt with flags for falling edge.
+- clocks          : phandle of I2C reference clock.
+
+Optional:
+- bus-frequency   : Contain the I2C bus frequency,
+			the default I2C bus frequency is 100000.
+- pinctrl-0       : must be <&smbX_pins>, X is module number
+			(on NPCM7XX it's 0 to 15)
+- pinctrl-names   : should be set to "default"
+Example:
+
+	i2c0: i2c@80000 {
+		compatible = "nuvoton,npcm750-i2c";
+		reg = <0x80000 0x1000>;
+		clocks = <&clk NPCM7XX_CLK_APB2>;
+		bus-frequency = <100000>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&smb0_pins>;
+	};
-- 
2.22.0

