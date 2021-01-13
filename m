Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5872F53F2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:17:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJdF5jyYzDrh8
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:17:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGX0mm0zDrSt
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:51 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0Uks007593;
 Wed, 13 Jan 2021 22:00:30 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id CA7A963A17; Wed, 13 Jan 2021 22:00:30 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 11/12] dt-binding: bmc: add NPCM7XX JTAG
 master documentation
Date: Wed, 13 Jan 2021 22:00:09 +0200
Message-Id: <20210113200010.71845-12-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stanley Chu <yschu@nuvoton.com>,
 Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for
Nuvoton NPCM7XX JTAG master.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/bmc/npcm7xx-jtag-master.txt      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
new file mode 100644
index 000000000000..3ad7a18ba9a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
@@ -0,0 +1,38 @@
+Nuvoton NPCM7xx JTAG MASTER interface
+
+Nuvoton BMC NPCM7xx JTAG Master is used for debugging host CPU or programming
+CPLD device. The driver is implemented as an SPI device driver that enabling
+the option to transfer JTAG data with the assistance of SPI HW.
+
+Required properties for jtag_master node
+- compatible		: "nuvoton,npcm750-jtag-master" for Poleg NPCM7XX.
+- spi-max-frequency	: specify the max spi bus frequency.
+- reg 				: always 0
+- pinctrl-names		: contain 2 pinctrl states "pspi" and "gpio", which indicates
+					  the TCK/TDI/TDO pin state in HW mode(using PSPI hw) and
+					  SW mode (using GPIO bitbang) respectively.
+- tck-gpios			: specify the GPIO number of TCK pin
+- tdi-gpios			: specify the GPIO number of TDI pin
+- tdo-gpios			: specify the GPIO number of TDO pin
+- tms-gpios			: specify the GPIO number of TMS pin
+
+Example:
+spi1: spi@201000 {
+	...
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi2_pins>;
+		pinctrl-1 = <&gpio17_pins &gpio18o_pins
+			&gpio19ol_pins>;
+
+		tck-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
-- 
2.22.0

