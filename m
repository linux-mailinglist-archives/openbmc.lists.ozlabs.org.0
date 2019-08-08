Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C286474
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 16:37:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4649th6tP9zDqT2
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:37:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CPsn8yHo"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4649q93Rs0zDqW4
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 00:33:57 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y15so44229022pfn.5
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhS/cUB8IEfvGV/JJdMlD2pxb1aoBEybN9rJivyTQVI=;
 b=CPsn8yHom+RAl+VUCwhDTrXiDp12MOiNhyzlFLbijHErRGY9walblPfcBAmJTkLXep
 BlH5cAlzIKDkItufvTWkgcCnrGF3zZIA3OhoXQ1YkUDSNfmp3yOLjA2XNMQI5KHzKTAo
 bw7Tpvxnla8G9pcLb3Lt8g1VNC30MqF8/I0QBiyazm+02ScT7DFGQTpk9EOZtUbL9DaU
 XYmGABMHNhyoej9Yy2bC6Ki53l+CRvK26y9n5RX8GmBM6p/gW9OGq0ocRe4jIoxDU1J8
 mQjOgnugx1/gBqRh6QnW68rjyLG/WdewRK39250pl0BmQD+foU1WSo85z3yeGXLGcr/U
 UoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dhS/cUB8IEfvGV/JJdMlD2pxb1aoBEybN9rJivyTQVI=;
 b=eOBejhs0CxBiUE1gtvbHEggM7XJBW839cI2eo0z09wFNF48pxm3V8tDlk6+xJmP0kx
 NizQZW1GIRo0ToGZfhqdSR/18FMrocU7tT+igL+t59595ljU6NriAerXzdyHr26ASplZ
 V3B6Pk+bOLowY2nfyIILwkxvuyfmmCTJG5zEbRE7ILzoKOJUfqlOEK6FGDwMO8rpGFi+
 lZDJSwOlGTrg0pgGKV9+d1K9/BpWWDs6pfmWoMwZxp2J5NkTVHlGvPvvsirG10eQqeu6
 8dUvvNddeTEve82v9AeLVZUGH4j+e/UdVZUJAS3Eb5F3B3teT6ROwdFMRKVChVYR0QBH
 VhLw==
X-Gm-Message-State: APjAAAWcsPENUEtTZqfvwY7mwj07eu1BO63EQNfWs4g89G837eQ0KuKw
 CMyTV8pyF5XtLthXCDjUNqaaVgUk
X-Google-Smtp-Source: APXvYqxxME/GDSSY+xYhZmLYEb9IRKIUGLUMHVbQaFMkupVMEFwynL8Ac9YbUZsV1MBUHchd9+yJdw==
X-Received: by 2002:aa7:9591:: with SMTP id z17mr15999402pfj.215.1565274834937; 
 Thu, 08 Aug 2019 07:33:54 -0700 (PDT)
Received: from voyager.iht.com.au (210-10-229-158.cust.static-ipl.aapt.com.au.
 [210.10.229.158])
 by smtp.gmail.com with ESMTPSA id c35sm27554972pgl.72.2019.08.08.07.33.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:33:54 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 1/2] i2c: aspeed: Update to v3 of buffer and dma
 support
Date: Fri,  9 Aug 2019 00:03:41 +0930
Message-Id: <20190808143342.27779-2-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808143342.27779-1-joel@jms.id.au>
References: <20190808143342.27779-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This moves the aspeed i2c driver to the v3 RFC that Jae posted. This
version has backwards compatibility with the old device tree binding,
allowing us to disable the changes until the Qemu model has been updated
to support buffer mode.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 14 ++--
 drivers/i2c/busses/i2c-aspeed.c               | 67 ++++++++++---------
 2 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index bb34ca5f0cc1..e5b46885c15e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -3,11 +3,10 @@ Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
 Required Properties:
 - #address-cells	: should be 1
 - #size-cells		: should be 0
-- reg			: address offset and range of bus registers and buffer
-- reg-names		: "bus-regs" and "buf" are recognized by Aspeed I2C
-			  driver. "bus-regs" is default. "buf" is optional in
-			  case of enabling I2C dedicated SRAM for buffer mode
-			  transfer support
+- reg			: Address offset and range of bus registers.
+			  An additional SRAM buffer address offset and range is
+			  optional in case of enabling I2C dedicated SRAM for
+			  buffer mode transfer support.
 - compatible		: should be "aspeed,ast2400-i2c-bus"
 			  or "aspeed,ast2500-i2c-bus"
 - clocks		: root clock of bus, should reference the APB
@@ -20,7 +19,7 @@ Optional Properties:
 - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
 		  specified
 - multi-master	: states that there is another master active on this bus.
-- aspeed,dma-buf-size	: should be 4096 in case of AST2500.
+- aspeed,dma-buf-size	: size of DMA buffer (from 2 to 4095 in case of AST2500)
 			  Only AST2500 supports DMA mode under some limitations:
 			  I2C is sharing the DMA H/W with UHCI host controller
 			  and MCTP controller. Since those controllers operate
@@ -61,7 +60,6 @@ i2c {
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 		reg = <0x40 0x40>;
-		reg-names = "bus-regs";
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -76,7 +74,6 @@ i2c {
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 		reg = <0x80 0x40>, <0x210 0x10>;
-		reg-names = "bus-regs", "buf";
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -91,7 +88,6 @@ i2c {
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 		reg = <0xc0 0x40>;
-		reg-names = "bus-regs";
 		aspeed,dma-buf-size = <4095>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index cf15d9753fbf..89317929bee4 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -140,6 +140,7 @@
 #define ASPEED_I2CD_DMA_ALIGN				4
 
 /* 0x28 : I2CD DMA Transfer Length Register */
+#define ASPEED_I2CD_DMA_LEN_SHIFT			0
 #define ASPEED_I2CD_DMA_LEN_MASK			GENMASK(11, 0)
 
 enum aspeed_i2c_master_state {
@@ -303,10 +304,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	/* Slave was sent something. */
 	if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
 		if (bus->dma_buf &&
-		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED)
+		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		    !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
 			value = bus->dma_buf[0];
 		else if (bus->buf_base &&
-			 bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED)
+			 bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+			 !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
 			value = readb(bus->buf_base);
 		else
 			value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
@@ -324,28 +327,29 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was asked to stop. */
 	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
-		if (bus->dma_buf &&
-		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED) {
-			len = bus->dma_buf_size -
-			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
-					readl(bus->base +
-					      ASPEED_I2C_DMA_LEN_REG));
-			for (i = 0; i < len; i++) {
-				value = bus->dma_buf[i];
-				i2c_slave_event(slave,
-						I2C_SLAVE_WRITE_RECEIVED,
-						&value);
-			}
-		} else if (bus->buf_base &&
-			  bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED) {
-			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
-					readl(bus->base +
-					      ASPEED_I2C_BUF_CTRL_REG));
-			for (i = 0; i < len; i++) {
-				value = readb(bus->buf_base + i);
-				i2c_slave_event(slave,
-						I2C_SLAVE_WRITE_RECEIVED,
-						&value);
+		if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		    irq_status & ASPEED_I2CD_INTR_RX_DONE) {
+			if (bus->dma_buf) {
+				len = bus->dma_buf_size -
+				      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+						readl(bus->base +
+						      ASPEED_I2C_DMA_LEN_REG));
+				for (i = 0; i < len; i++) {
+					value = bus->dma_buf[i];
+					i2c_slave_event(slave,
+							I2C_SLAVE_WRITE_RECEIVED,
+							&value);
+				}
+			} else if (bus->buf_base) {
+				len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+						readl(bus->base +
+						      ASPEED_I2C_BUF_CTRL_REG));
+				for (i = 0; i < len; i++) {
+					value = readb(bus->buf_base + i);
+					i2c_slave_event(slave,
+							I2C_SLAVE_WRITE_RECEIVED,
+							&value);
+				}
 			}
 		}
 		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
@@ -1280,15 +1284,13 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	struct aspeed_i2c_bus *bus;
 	bool sram_enabled = true;
 	struct clk *parent_clk;
-	struct resource *res;
 	int irq, ret;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "bus-regs");
-	bus->base = devm_ioremap_resource(&pdev->dev, res);
+	bus->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
@@ -1351,11 +1353,14 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (sram_enabled && !IS_ENABLED(CONFIG_USB_UHCI_ASPEED) &&
 	    of_device_is_compatible(pdev->dev.of_node,
 				    "aspeed,ast2500-i2c-bus")) {
+		u32 dma_len_max = ASPEED_I2CD_DMA_LEN_MASK >>
+				  ASPEED_I2CD_DMA_LEN_SHIFT;
+
 		ret = device_property_read_u32(&pdev->dev,
 					       "aspeed,dma-buf-size",
 					       &bus->dma_buf_size);
-		if (!ret && bus->dma_buf_size > ASPEED_I2CD_DMA_LEN_MASK)
-			bus->dma_buf_size = ASPEED_I2CD_DMA_LEN_MASK;
+		if (!ret && bus->dma_buf_size > dma_len_max)
+			bus->dma_buf_size = dma_len_max;
 	}
 
 	if (bus->dma_buf_size) {
@@ -1381,7 +1386,9 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	}
 
 	if (!bus->dma_buf && sram_enabled) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "buf");
+		struct resource *res = platform_get_resource(pdev,
+							     IORESOURCE_MEM, 1);
+
 		bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(bus->buf_base) || resource_size(res) < 2) {
 			bus->buf_base = NULL;
-- 
2.20.1

