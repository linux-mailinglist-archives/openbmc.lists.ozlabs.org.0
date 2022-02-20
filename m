Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472F4BD509
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:18:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29ZC29Npz3bZR
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:18:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZwNtu53T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZwNtu53T; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpv5MxWz30Dy
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:27 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so455542pjb.1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sDnvnOGDEBsHucmnzCTIoEwmgetObKwR2kGgru15NFw=;
 b=ZwNtu53TvI1ayF2X2M8bwn57WiNwhwRmYjytEa4kIidJvH6PADPw2AHjdZrhTjLbvs
 qsNbwtoZj7FbfGVIJY1PfmPTxkMKgBe2H5aC4/cx3PZl5N9zxxNSTV9CkECaak34P1KT
 kgOp5TdJPM1oW35GYdFAoBuDcch6TLJAiicRKBGmUv/tUsPvFsGhT6uvqgz1F8YH8W8n
 Q2JigcbfGnnh0G3NOKspAGuu9IqGKj5aCVEPRnEH93b7i1wT7bKqbcY39o5jDrCulYI5
 zqBXOpT30W2C4/PR5NjYKwSBK0kXyeWMKuBO8GuyX8RaP7Oep78uOqc0F7+5WCFdUpxq
 qMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sDnvnOGDEBsHucmnzCTIoEwmgetObKwR2kGgru15NFw=;
 b=flYMLpbj+xyDGiIA0RdXbsk9Ujc2bTwV/COyTcpottToDULot4175E/CNXc4D9rDjo
 BhzjDhEgovCCHJYmH0lnoTjL6GJHs4ggvxDDI5A6uCic2YsBDIn0sWpkglncVhQsSRmg
 +GjKMI2R0X+8SyqJIJWhYVPCHPYRmLUs+1BSKmXO0OT5srQ72GGMHQVS0lQ2XmPOqI+8
 BoyFZFaVnVPV0nhC5o8B2+QPz0dxAlM5e5vnNkSThQEGbH1CzR3P3Y324stJkGoSxZcX
 fP1h7LjrxLCWEMEZ17xFpo8rBvURF6dFiiXrHnhFqKKNutF18d14YpjzBfC+B+GAmYnr
 ba/A==
X-Gm-Message-State: AOAM533Un91uWv0X3wtdvC5cP5WpNHBbwG9jOGDbxEyF6A4u1zsrc7kg
 qBIF0AG9qNgJHNExW4IyLQ==
X-Google-Smtp-Source: ABdhPJw9ivBPW9Yo6ArQ72rcRNrdDn+c8Me8KFIO/JdLyMIXx4K9ltU17VEmNVEN9gqJVvTrUns2Ew==
X-Received: by 2002:a17:90b:3ec2:b0:1b9:f17d:4452 with SMTP id
 rm2-20020a17090b3ec200b001b9f17d4452mr19344572pjb.71.1645329445991; 
 Sat, 19 Feb 2022 19:57:25 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id gk15sm10029648pjb.3.2022.02.19.19.57.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:25 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 11/11] i2c: npcm: Support NPCM845
Date: Sun, 20 Feb 2022 11:53:21 +0800
Message-Id: <20220220035321.3870-12-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Add NPCM8XX I2C support.
The NPCM8XX uses a similar i2c module as NPCM7XX.
The internal HW FIFO is larger in NPCM8XX.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/Kconfig       |  8 +--
 drivers/i2c/busses/Makefile      |  2 +-
 drivers/i2c/busses/i2c-npcm7xx.c | 87 ++++++++++++++++++++++----------
 3 files changed, 66 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..ab9ee2de5e00 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -817,13 +817,13 @@ config I2C_NOMADIK
 	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
 	  as well as the STA2X11 PCIe I/O HUB.
 
-config I2C_NPCM7XX
+config I2C_NPCM
 	tristate "Nuvoton I2C Controller"
-	depends on ARCH_NPCM7XX || COMPILE_TEST
+	depends on ARCH_NPCM || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
-	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
-	  controller.
+	  Nuvoton I2C controller, which is available on the NPCM BMC
+	  controllers.
 	  Driver can also support slave mode (select I2C_SLAVE).
 
 config I2C_OCORES
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..01fdf74a5565 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
 obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
-obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
+obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2cbf9c679aed..b281e0424e3e 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -91,7 +92,7 @@ enum i2c_addr {
 
 /* init register and default value required to enable module */
 #define NPCM_I2CSEGCTL			0xE4
-#define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
+#define NPCM_I2CSEGCTL_INIT_VAL		bus->data->segctl_init_val
 
 /* Common regs */
 #define NPCM_I2CSDA			0x00
@@ -228,8 +229,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CFIF_CTS_CLR_FIFO	BIT(6)
 #define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
 
-/* NPCM_I2CTXF_CTL reg fields */
-#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
+/* NPCM_I2CTXF_CTL reg field */
 #define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
 
 /* NPCM_I2CT_OUT reg fields */
@@ -238,22 +238,22 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CT_OUT_T_OUTST		BIT(7)
 
 /* NPCM_I2CTXF_STS reg fields */
-#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
+#define NPCM_I2CTXF_STS_TX_BYTES	bus->data->txf_sts_tx_bytes
 #define NPCM_I2CTXF_STS_TX_THST		BIT(6)
 
 /* NPCM_I2CRXF_STS reg fields */
-#define NPCM_I2CRXF_STS_RX_BYTES	GENMASK(4, 0)
+#define NPCM_I2CRXF_STS_RX_BYTES	bus->data->rxf_sts_rx_bytes
 #define NPCM_I2CRXF_STS_RX_THST		BIT(6)
 
 /* NPCM_I2CFIF_CTL reg fields */
 #define NPCM_I2CFIF_CTL_FIFO_EN		BIT(4)
 
 /* NPCM_I2CRXF_CTL reg fields */
-#define NPCM_I2CRXF_CTL_RX_THR		GENMASK(4, 0)
-#define NPCM_I2CRXF_CTL_LAST_PEC	BIT(5)
+#define NPCM_I2CRXF_CTL_LAST_PEC	bus->data->rxf_ctl_last_pec
 #define NPCM_I2CRXF_CTL_THR_RXIE	BIT(6)
 
-#define I2C_HW_FIFO_SIZE		16
+#define MAX_I2C_HW_FIFO_SIZE		32
+#define I2C_HW_FIFO_SIZE		bus->data->fifo_size
 
 /* I2C_VER reg fields */
 #define I2C_VER_VERSION			GENMASK(6, 0)
@@ -270,11 +270,36 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct npcm_i2c_data {
+	u8 fifo_size;
+	u32 segctl_init_val;
+	u8 txf_sts_tx_bytes;
+	u8 rxf_sts_rx_bytes;
+	u8 rxf_ctl_last_pec;
+};
+
+static const struct npcm_i2c_data npxm7xx_i2c_data = {
+	.fifo_size = 16,
+	.segctl_init_val = 0x0333F000,
+	.txf_sts_tx_bytes = GENMASK(4, 0),
+	.rxf_sts_rx_bytes = GENMASK(4, 0),
+	.rxf_ctl_last_pec = BIT(5)
+};
+
+static const struct npcm_i2c_data npxm8xx_i2c_data = {
+	.fifo_size = 32,
+	.segctl_init_val = 0x9333F000,
+	.txf_sts_tx_bytes = GENMASK(5, 0),
+	.rxf_sts_rx_bytes = GENMASK(5, 0),
+	.rxf_ctl_last_pec = BIT(7)
+};
+
 /* Status of one I2C module */
 struct npcm_i2c {
 	struct i2c_adapter adap;
 	struct device *dev;
 	unsigned char __iomem *reg;
+	const struct npcm_i2c_data *data;
 	spinlock_t lock;   /* IRQ synchronization */
 	struct completion cmd_complete;
 	int cmd_err;
@@ -307,8 +332,8 @@ struct npcm_i2c {
 	int slv_rd_ind;
 	int slv_wr_size;
 	int slv_wr_ind;
-	u8 slv_rd_buf[I2C_HW_FIFO_SIZE];
-	u8 slv_wr_buf[I2C_HW_FIFO_SIZE];
+	u8 slv_rd_buf[MAX_I2C_HW_FIFO_SIZE];
+	u8 slv_wr_buf[MAX_I2C_HW_FIFO_SIZE];
 #endif
 	struct dentry *debugfs; /* debugfs device directory */
 	u64 ber_cnt;
@@ -743,11 +768,11 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 static u8 npcm_i2c_fifo_usage(struct npcm_i2c *bus)
 {
 	if (bus->operation == I2C_WRITE_OPER)
-		return FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+		return (NPCM_I2CTXF_STS_TX_BYTES &
+			ioread8(bus->reg + NPCM_I2CTXF_STS));
 	if (bus->operation == I2C_READ_OPER)
-		return FIELD_GET(NPCM_I2CRXF_STS_RX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CRXF_STS));
+		return (NPCM_I2CRXF_STS_RX_BYTES &
+			ioread8(bus->reg + NPCM_I2CRXF_STS));
 	return 0;
 }
 
@@ -882,10 +907,10 @@ static void npcm_i2c_write_fifo_slave(struct npcm_i2c *bus, u16 max_bytes)
 	while (max_bytes-- && I2C_HW_FIFO_SIZE != npcm_i2c_fifo_usage(bus)) {
 		if (bus->slv_wr_size <= 0)
 			break;
-		bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_wr_ind = bus->slv_wr_ind & (I2C_HW_FIFO_SIZE - 1);
 		npcm_i2c_wr_byte(bus, bus->slv_wr_buf[bus->slv_wr_ind]);
 		bus->slv_wr_ind++;
-		bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_wr_ind = bus->slv_wr_ind & (I2C_HW_FIFO_SIZE - 1);
 		bus->slv_wr_size--;
 	}
 }
@@ -900,7 +925,7 @@ static void npcm_i2c_read_fifo_slave(struct npcm_i2c *bus, u8 bytes_in_fifo)
 	while (bytes_in_fifo--) {
 		data = npcm_i2c_rd_byte(bus);
 
-		bus->slv_rd_ind = bus->slv_rd_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_rd_ind = bus->slv_rd_ind & (I2C_HW_FIFO_SIZE - 1);
 		bus->slv_rd_buf[bus->slv_rd_ind] = data;
 		bus->slv_rd_ind++;
 
@@ -927,7 +952,7 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 		} else {
 			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 		}
-		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
+		ind = (bus->slv_wr_ind + bus->slv_wr_size) & (I2C_HW_FIFO_SIZE - 1);
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
 	}
@@ -999,8 +1024,8 @@ static void npcm_i2c_slave_wr_buf_sync(struct npcm_i2c *bus)
 {
 	int left_in_fifo;
 
-	left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+	left_in_fifo = (NPCM_I2CTXF_STS_TX_BYTES &
+			ioread8(bus->reg + NPCM_I2CTXF_STS));
 
 	/* fifo already full: */
 	if (left_in_fifo >= I2C_HW_FIFO_SIZE ||
@@ -2265,12 +2290,21 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	bus->debugfs = d;
 }
 
+static const struct of_device_id npcm_i2c_bus_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-i2c", .data = &npxm7xx_i2c_data },
+	{ .compatible = "nuvoton,npcm845-i2c", .data = &npxm8xx_i2c_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
+
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
 	struct npcm_i2c *bus;
 	struct i2c_adapter *adap;
 	struct clk *i2c_clk;
 	static struct regmap *gcr_regmap;
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
 	int irq;
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
@@ -2281,6 +2315,13 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 
 	bus->dev = &pdev->dev;
 
+	match = of_match_device(npcm_i2c_bus_of_table, dev);
+	if (!match) {
+		dev_err(dev, "OF data missing\n");
+		return -EINVAL;
+	}
+	bus->data = match->data;
+
 	bus->num = of_alias_get_id(pdev->dev.of_node, "i2c");
 	/* core clk must be acquired to calculate module timing settings */
 	i2c_clk = devm_clk_get(&pdev->dev, NULL);
@@ -2352,12 +2393,6 @@ static int npcm_i2c_remove_bus(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id npcm_i2c_bus_of_table[] = {
-	{ .compatible = "nuvoton,npcm750-i2c", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
-
 static struct platform_driver npcm_i2c_bus_driver = {
 	.probe = npcm_i2c_probe_bus,
 	.remove = npcm_i2c_remove_bus,
-- 
2.17.1

