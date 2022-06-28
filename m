Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E6055E5EB
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 18:21:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXVGq72h0z3chG
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 02:21:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXVFj0Jdgz3btt
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 02:20:57 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXVFj09xKz4xYX;
	Wed, 29 Jun 2022 02:20:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXVFg1k3Gz4xYL;
	Wed, 29 Jun 2022 02:20:54 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/5] spi: aspeed: Introduce a "windows" device attribute
Date: Tue, 28 Jun 2022 18:20:41 +0200
Message-Id: <20220628162044.1121337-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628162044.1121337-1-clg@kaod.org>
References: <20220628162044.1121337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This dumps the mapping windows, or decoding ranges, of all devices
possibly attached of the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 5a995b5653f1..1611c354c31f 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -382,6 +382,7 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
 
 struct aspeed_spi_window {
 	u32 cs;
+	u32 reg;
 	u32 offset;
 	u32 size;
 };
@@ -396,6 +397,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		reg_val = readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
 		windows[cs].cs = cs;
+		windows[cs].reg = reg_val;
 		windows[cs].size = data->segment_end(aspi, reg_val) -
 			data->segment_start(aspi, reg_val);
 		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
@@ -712,6 +714,41 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
 		aspeed_spi_chip_enable(aspi, cs, enable);
 }
 
+static int windows_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aspeed_spi *aspi = dev_get_drvdata(dev);
+	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
+	u32 cs;
+	int len = 0;
+
+	if (aspi->data == &ast2400_spi_data)
+		return 0;
+
+	aspeed_spi_get_windows(aspi, windows);
+
+	len += sysfs_emit_at(buf, len, "     offset     size       register\n");
+	for (cs = 0; cs < aspi->data->max_cs; cs++) {
+		if (!windows[cs].reg)
+			len += sysfs_emit_at(buf, len, "CE%d: disabled\n", cs);
+		else
+			len += sysfs_emit_at(buf, len, "CE%d: 0x%.8x 0x%.8x 0x%x\n", cs,
+					     windows[cs].offset, windows[cs].size,
+					     windows[cs].reg);
+	}
+	return len;
+}
+
+static DEVICE_ATTR_RO(windows);
+
+static struct attribute *aspeed_spi_attributes[] = {
+	&dev_attr_windows.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_spi_attribute_group = {
+	.attrs = aspeed_spi_attributes
+};
+
 static int aspeed_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -784,6 +821,12 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
 		goto disable_clk;
 	}
+
+	ret = devm_device_add_group(&pdev->dev, &aspeed_spi_attribute_group);
+	if (ret) {
+		dev_err(&pdev->dev, "cannot create attribute group\n");
+		goto disable_clk;
+	}
 	return 0;
 
 disable_clk:
-- 
2.35.3

