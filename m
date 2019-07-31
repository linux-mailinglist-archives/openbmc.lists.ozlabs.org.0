Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0C7B7A1
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 03:36:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ywxR39LWzDqZV
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:36:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::a4a;
 helo=mail-vk1-xa4a.google.com;
 envelope-from=3e_baxqmkb-ywasowwotm.kwuwxmvjuktqaba.whtija.wzo@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lnqfmVuI"; 
 dkim-atps=neutral
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywvM1bhhzDqYp
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 11:34:15 +1000 (AEST)
Received: by mail-vk1-xa4a.google.com with SMTP id d14so28700820vka.6
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=d2sWsZYwop/FlZD2sslunw1XpgNZEW/d3Zvm+DXDThk=;
 b=lnqfmVuII8vLJomjxRWE8WtUicmV5dshtalbAPTKX4vej097pN/0nouRFUFVQDVjtO
 BEVg/4WRje82jt3tbzDjruPPFjYipP5YwpE+NFfX3z3NiihN6qOpysy8zBqNszFP00Fb
 uTAOxPmIL3lWWkr4IMrMfTXNuSMSwX+f5pvWN912uTR7zskPICTQw0+OW1HbkRCC+ADG
 IxSEsfigGnIrLkZeNDCBEI8+YEEDqj7Z8JxOeANzxRCsRbeYhEgAUA41QAn0U9uE2W53
 bD7EcC2BAeYP2683fGyezZVrrhOqFVa7ywC86IGb7vZ2JPZR8cmBbBJzAHlE9d6Hkd9P
 aJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=d2sWsZYwop/FlZD2sslunw1XpgNZEW/d3Zvm+DXDThk=;
 b=jG8m3HOy+oSG2Qvsl5PvXxmeJsOL8I97jstp3/HqgduOcShLRfyyWbFsivRVii6eIF
 nNnSKG9M8AH9bz9gy5ivv0PU2gZmGwgJTVmGHav2080wzbCu0+KO2tARLL38CWyG4gr6
 yJNn/a1YO/byi6SijdCzqV7q6I5SUBaQ3b0AZKwph2OF1PilRL2D9fVSrCVUYQwVI1ME
 JsqqjKdhwG4bRxTMtwu6V9imvyzrSflbXmlSkcCu3Yw/e0oCnG5Re1/NLIJt0jZOiR1t
 XMV/N0cUy73+mOHPVfIbhei0IYIwgA/ilS08RVBFPxG033Ch+sFHFOVM6Dhs6IQjLNJn
 Ylbw==
X-Gm-Message-State: APjAAAV3mOaJKUttx0qRU1S8qWXA2Jc4s3uyA0mmv/+u6KEbLV9uK8AX
 4ZYyjZ15FtjaBWgVT1BrHmTUWJA=
X-Google-Smtp-Source: APXvYqyG0L9Yj7lhRAqqpt80c1tlP4H2oqVMRnvB7LFmMJOwO8AEB/TpxqCFDW73Q61xO2ur51YhdWc=
X-Received: by 2002:a1f:1d58:: with SMTP id d85mr46622787vkd.13.1564536851278; 
 Tue, 30 Jul 2019 18:34:11 -0700 (PDT)
Date: Tue, 30 Jul 2019 21:34:02 -0400
Message-Id: <20190731013404.243755-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 1/3] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make the SIRQ polarity for Aspeed AST24xx/25xx VUART configurable via
sysfs. This setting need to be changed on specific host platforms
depending on the selected host interface (LPC / eSPI).

The setting is configurable via sysfs rather than device-tree to stay in
line with other related configurable settings.

On AST2500 the VUART SIRQ polarity can be auto-configured by reading the
LPC/eSPI interface configuration from the HW strap table.

Tested: Verified on TYAN S7106 mainboard.
Signed-off-by: Oskar Senft <osk@google.com>
---
 .../ABI/stable/sysfs-driver-aspeed-vuart      | 10 ++-
 drivers/tty/serial/8250/8250_aspeed_vuart.c   | 82 +++++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |  1 +
 3 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
index 8062953ce77b..64fad87ad964 100644
--- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
@@ -6,10 +6,18 @@ Description:	Configures which IO port the host side of the UART
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
 
-What:		/sys/bus/platform/drivers/aspeed-vuart*/sirq
+What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq
 Date:		April 2017
 Contact:	Jeremy Kerr <jk@ozlabs.org>
 Description:	Configures which interrupt number the host side of
 		the UART will appear on the host <-> BMC LPC bus.
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity
+Date:		July 2019
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the polarity of the serial interrupt to the
+		host via the BMC LPC bus.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 0438d9a905ce..e0e441c38541 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -14,6 +14,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/clk.h>
@@ -22,6 +24,7 @@
 
 #define ASPEED_VUART_GCRA		0x20
 #define ASPEED_VUART_GCRA_VUART_EN		BIT(0)
+#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY	BIT(1)
 #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
 #define ASPEED_VUART_GCRB		0x24
 #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK	GENMASK(7, 4)
@@ -131,8 +134,53 @@ static ssize_t sirq_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(sirq);
 
+static ssize_t sirq_polarity_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	u8 reg;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
+}
+
+static void aspeed_vuart_set_sirq_polarity(struct aspeed_vuart *vuart,
+					   bool polarity)
+{
+	u8 reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+
+	if (polarity)
+		reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+	else
+		reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+}
+
+static ssize_t sirq_polarity_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	aspeed_vuart_set_sirq_polarity(vuart, val != 0);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(sirq_polarity);
+
 static struct attribute *aspeed_vuart_attrs[] = {
 	&dev_attr_sirq.attr,
+	&dev_attr_sirq_polarity.attr,
 	&dev_attr_lpc_address.attr,
 	NULL,
 };
@@ -302,6 +350,27 @@ static int aspeed_vuart_handle_irq(struct uart_port *port)
 	return 1;
 }
 
+static void aspeed_vuart_auto_configure_sirq_polarity(
+	struct aspeed_vuart *vuart, struct device_node *syscon_np,
+	u32 reg_offset, u32 reg_mask)
+{
+	struct regmap *regmap;
+	u32 value;
+
+	regmap = syscon_node_to_regmap(syscon_np);
+	if (IS_ERR(regmap)) {
+		dev_warn(vuart->dev,
+			 "could not get regmap for espi-enabled\n");
+		return;
+	}
+	if (regmap_read(regmap, reg_offset, &value)) {
+		dev_warn(vuart->dev, "could not read hw strap table\n");
+		return;
+	}
+
+	aspeed_vuart_set_sirq_polarity(vuart, (value & reg_mask) == 0);
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port port;
@@ -310,6 +379,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	struct resource *res;
 	u32 clk, prop;
 	int rc;
+	struct of_phandle_args espi_enabled_args;
 
 	np = pdev->dev.of_node;
 
@@ -402,6 +472,18 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	vuart->line = rc;
 
+	rc = of_parse_phandle_with_fixed_args(
+		np, "espi-enabled", 2, 0, &espi_enabled_args);
+	if (rc < 0) {
+		dev_warn(&pdev->dev, "espi-enabled property not found\n");
+	} else {
+		aspeed_vuart_auto_configure_sirq_polarity(
+			vuart, espi_enabled_args.np,
+			espi_enabled_args.args[0],
+			BIT(espi_enabled_args.args[1]));
+		of_node_put(espi_enabled_args.np);
+	}
+
 	aspeed_vuart_set_enabled(vuart, true);
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 509f6a3bb9ff..98e25781a293 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -243,6 +243,7 @@ config SERIAL_8250_ASPEED_VUART
 	tristate "Aspeed Virtual UART"
 	depends on SERIAL_8250
 	depends on OF
+	depends on REGMAP && MFD_SYSCON
 	help
 	  If you want to use the virtual UART (VUART) device on Aspeed
 	  BMC platforms, enable this option. This enables the 16550A-
-- 
2.22.0.709.g102302147b-goog

