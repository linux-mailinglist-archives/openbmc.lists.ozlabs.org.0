Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C588E9682
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:40:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zN74GLYzF3lS
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:40:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="icyBij9R"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCn0yp9zF3dq
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:53 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id p5so510448plr.7
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWUUmVkSSrsKHN00zrjqS9SsCMaN3B77zdCofuA+g7w=;
 b=icyBij9Ra/pgq7H7vE6nqrIbwFKttckuFrUllpSCDmCIK63OIRatDkJRDjvbvF5vxr
 5xT2o2+t2xiKTIPwC6pH79V2Rvudn2nVQ2blCyjLgTGmneH37HP+IeHhdv1UF+rUNjOy
 rA6rBH9MPwVSGwhjiv7GfBk7lhW61yk8dtr93kFPzVWsiqaSn90rtgYeLEapJ61Vuw/8
 hLO3YWKLIEhcsYEafRZHHC9cWZF2VJEVg0xvExYBvmrAeP0GN2591OpiT4Vr9ipX2FYw
 67EE9HDUwiXm7WAzj0gebhFJKC/EAC6kF12yZyq2XL+Zz3yivnJZNTk6DgL6sXCLWHUm
 +PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FWUUmVkSSrsKHN00zrjqS9SsCMaN3B77zdCofuA+g7w=;
 b=LTt4uUcMl5fOSnOPslScIza+8KshOvs1a5MF4Z4l8tPN4g9OMJDYC3X/8BO/tuP6QC
 jXDIOlJLlhrwTbyScKqni0ZeHD3a6jS9QCTil9hR3SaPlK9HEMAZQLUd3Mi8CwynnWMR
 0383hB5Q/qM+XQtaRoByf3/c6O/tclwWoijB09FO/U9uQotQoYE6+InjI6O+oqv1+NQV
 +99r1CJ2oem1/iuko9bFRGYyuNuSE2XbbDQyxD1yqoMgBikabYyFOO24TDXtn9c+wwf4
 SsSTuRwt5oM49DKjqlCRlBWrYHlujJwQBMPMjJr9saJZC+jXMZY/lpYzE6dnv+OZqxIh
 CbBA==
X-Gm-Message-State: APjAAAWJxbS/DoAMwkZAQiXQQfCTcOz90YhQb1OGNPNAeRU21cMAN1dE
 RYxj8b9SWq1wGRUf6sN+QaM=
X-Google-Smtp-Source: APXvYqy1SsOOuhXLt52EvdZz6sG5mLt7pCTWCAWHBHvgfT4K3ERylPIQqPoQAZ91/CNxwUSgW13kFA==
X-Received: by 2002:a17:902:74c9:: with SMTP id
 f9mr2916714plt.105.1572417170901; 
 Tue, 29 Oct 2019 23:32:50 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 6/7] Add FSI driver
Date: Wed, 30 Oct 2019 17:02:24 +1030
Message-Id: <20191030063225.11319-7-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

FSI is the Flexible Service Interface, an i2c-like bus used on IBM POWER
processors for boot control, monitoring and debug. The ASPEED AST2600
contains a FSI master that can be used to talk to slaves on this bus.

The u-boot driver is a light porting of the work in progress Linux
driver. It allows basic reading and writing across the FSI link, as well
as control of the bus speed divisor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/misc/Kconfig      |   6 +
 drivers/misc/Makefile     |   1 +
 drivers/misc/aspeed-fsi.c | 556 ++++++++++++++++++++++++++++++++++++++
 include/aspeed_fsi.h      |  14 +
 4 files changed, 577 insertions(+)
 create mode 100644 drivers/misc/aspeed-fsi.c
 create mode 100644 include/aspeed_fsi.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index e149d81fcc50..f73ab0755276 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -25,6 +25,12 @@ config ASPEED_H2X
         help
           Select this to enable AHB to PCIe bu Bridge driver for Aspeed SoC.
 
+config ASPEED_FSI
+	bool "Enable ASPEED FSI driver"
+	depends on ARCH_ASPEED
+	help
+	  Support the FSI master present in the ASPEED system on chips.
+
 config ALTERA_SYSID
 	bool "Altera Sysid support"
 	depends on MISC
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 61214bf9f17d..68713f149450 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -65,3 +65,4 @@ obj-$(CONFIG_TWL4030_LED) += twl4030_led.o
 obj-$(CONFIG_VEXPRESS_CONFIG) += vexpress_config.o
 obj-$(CONFIG_WINBOND_W83627) += winbond_w83627.o
 obj-$(CONFIG_JZ4780_EFUSE) += jz4780_efuse.o
+obj-$(CONFIG_ASPEED_FSI) += aspeed-fsi.o
diff --git a/drivers/misc/aspeed-fsi.c b/drivers/misc/aspeed-fsi.c
new file mode 100644
index 000000000000..c41053252b10
--- /dev/null
+++ b/drivers/misc/aspeed-fsi.c
@@ -0,0 +1,556 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) IBM Corporation 2018
+// FSI master driver for AST2600
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/bug.h>
+#include <linux/bitops.h>
+
+#include <common.h>
+#include <clk.h>
+
+#include <dm/device.h>
+#include <dm/fdtaddr.h>
+
+/* Control Registers */
+#define FSI_MMODE		0x0		/* R/W: mode */
+#define FSI_MDLYR		0x4		/* R/W: delay */
+#define FSI_MCRSP		0x8		/* R/W: clock rate */
+#define FSI_MENP0		0x10		/* R/W: enable */
+#define FSI_MLEVP0		0x18		/* R: plug detect */
+#define FSI_MSENP0		0x18		/* S: Set enable */
+#define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MAEB		0x70		/* R: Error address */
+#define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MSTAP0		0xd0		/* R: Port status */
+#define FSI_MRESP0		0xd0		/* W: Port reset */
+#define FSI_MESRB0		0x1d0		/* R: Master error status */
+#define FSI_MRESB0		0x1d0		/* W: Reset bridge */
+#define FSI_MSCSB0	 	0x1d4		/* R: Master sub command stack */
+#define FSI_MATRB0	 	0x1d8		/* R: Master address trace */
+#define FSI_MDTRB0	 	0x1dc		/* R: Master data trace */
+#define FSI_MECTRL		0x2e0		/* W: Error control */
+
+/* MMODE: Mode control */
+#define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
+#define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
+#define FSI_MMODE_RELA		0x20000000	/* Enable relative address commands */
+#define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
+#define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
+						/*   MSB=1, LSB=0 is 0.8 ms */
+						/*   MSB=0, LSB=1 is 0.9 ms */
+#define FSI_MMODE_CRS0SHFT	18		/* Clk rate selection 0 shift */
+#define FSI_MMODE_CRS0MASK	0x3ff		/* Clk rate selection 0 mask */
+#define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
+#define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
+
+/* MRESB: Reset brindge */
+#define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
+#define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
+
+/* MRESB: Reset port */
+#define FSI_MRESP_RST_ALL_MASTER 0x20000000	/* Reset all FSI masters */
+#define FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
+#define FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
+#define FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
+#define FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
+
+/* MECTRL: Error control */
+#define FSI_MECTRL_EOAE		0x8000		/* Enable machine check when */
+						/* master 0 in error */
+#define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
+
+#define FSI_ENGID_HUB_MASTER		0x1c
+#define FSI_HUB_LINK_OFFSET		0x80000
+#define FSI_HUB_LINK_SIZE		0x80000
+#define FSI_HUB_MASTER_MAX_LINKS	8
+
+#define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
+
+#define FSI_NUM_DEBUGFS_ENTRIES		17
+
+#define DEFAULT_DIVISOR			14
+
+struct fsi_master_aspeed;
+
+struct fsi_master_aspeed {
+	struct udevice		*dev;
+	void __iomem		*base;
+	struct clk		clk;
+};
+
+#define to_fsi_master_aspeed(m) \
+	container_of(m, struct fsi_master_aspeed, master)
+
+/* Control register (size 0x400) */
+static const u32 ctrl_base = 0x80000000;
+
+static const u32 fsi_base = 0xa0000000;
+
+#define OPB_FSI_VER	0x00
+#define OPB_TRIGGER	0x04
+#define OPB_CTRL_BASE	0x08
+#define OPB_FSI_BASE	0x0c
+#define OPB_CLK_SYNC	0x3c
+#define OPB_IRQ_CLEAR	0x40
+#define OPB_IRQ_MASK	0x44
+#define OPB_IRQ_STATUS	0x48
+
+#define OPB0_SELECT	0x10
+#define OPB0_RW		0x14
+#define OPB0_XFER_SIZE	0x18
+#define OPB0_FSI_ADDR	0x1c
+#define OPB0_FSI_DATA_W	0x20
+#define OPB0_STATUS	0x80
+/* half world */
+#define  STATUS_HW_ACK	BIT(0)
+/* full word */
+#define  STATUS_FW_ACK	BIT(1)
+#define  STATUS_ERR_ACK	BIT(2)
+#define OPB0_FSI_DATA_R	0x84
+
+#define OPB0_W_ENDIAN	0x4c
+#define OPB0_R_ENDIAN	0x5c
+
+/* OPB_IRQ_MASK */
+#define OPB1_XFER_ACK_EN BIT(17)
+#define OPB0_XFER_ACK_EN BIT(16)
+
+#define OPB_IRQ_CH0_DMA_EOT		BIT(0)
+#define OPB_IRQ_CH1_DMA_EOT		BIT(1)
+#define OPB_IRQ_CH2_DMA_EOT		BIT(2)
+#define OPB_IRQ_CH3_DMA_EOT		BIT(3)
+#define OPB_IRQ_CH0_DMA_FIFO_FULL	BIT(4)
+#define OPB_IRQ_CH1_DMA_FIFO_FULL	BIT(5)
+#define OPB_IRQ_CH2_DMA_FIFO_FULL	BIT(6)
+#define OPB_IRQ_CH3_DMA_FIFO_FULL	BIT(7)
+#define OPB_IRQ_CH0_DMA_FIFO_EMPTY	BIT(8)
+#define OPB_IRQ_CH1_DMA_FIFO_EMPTY	BIT(9)
+#define OPB_IRQ_CH2_DMA_FIFO_EMPTY	BIT(10)
+#define OPB_IRQ_CH3_DMA_FIFO_EMPTY	BIT(11)
+#define OPB_IRQ_CH0_DMA_TCONT_DONE	BIT(12)
+#define OPB_IRQ_CH1_DMA_TCONT_DONE	BIT(13)
+#define OPB_IRQ_CH2_DMA_TCONT_DONE	BIT(14)
+#define OPB_IRQ_CH3_DMA_TCONT_DONE	BIT(15)
+#define OPB_IRQ_OPB1_XFER_ACK		BIT(16)
+#define OPB_IRQ_OPB0_XFER_ACK		BIT(17)
+#define OPB_IRQ_SLAVE0			BIT(18)
+#define OPB_IRQ_SLAVE1			BIT(19)
+#define OPB_IRQ_SLAVE2			BIT(20)
+#define OPB_IRQ_SLAVE3			BIT(21)
+#define OPB_IRQ_SLAVE4			BIT(22)
+#define OPB_IRQ_SLAVE5			BIT(23)
+#define OPB_IRQ_SLAVE6			BIT(24)
+#define OPB_IRQ_SLAVE7			BIT(25)
+#define OPB_IRQ_ANY_HOTPLUG		BIT(26)
+#define OPB_IRQ_ANY_PORT_ERROR		BIT(27)
+#define OPB_IRQ_ANY_MST_ERROR		BIT(28)
+
+/* OPB_RW */
+#define CMD_READ	BIT(0)
+#define CMD_WRITE	0
+
+/* OPBx_XFER_SIZE */
+#define XFER_WORD	(BIT(1) | BIT(0))
+#define XFER_NIBBLE	(BIT(0))
+#define XFER_BYTE	(0)
+
+#define trace_aspeed_fsi_opb_write(addr, val, size, status, reg) \
+	debug("aspeed_opb_write: addr %08x val %08x size %d status %08d reg %08d\n", \
+			addr, val, size, status, reg)
+
+#define trace_aspeed_fsi_opb_read(addr, size, result, status, reg) \
+	debug("aspeed_opb_read: addr %08x size %d result %08x status %08d reg %08d\n", \
+			addr, size, result, status, reg)
+
+#define trace_aspeed_fsi_opb_error(mresp0, mstap0, mesrb0) \
+	debug("aspeed_opb_error: mresp %08d mstap %08x mesrb %08x\n", \
+			mresp0, mstap0, mesrb0)
+
+#define trace_aspeed_fsi_opb_error_enabled() (_DEBUG)
+
+static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
+		     uint32_t val, size_t size)
+{
+	void __iomem *base = aspeed->base;
+	u32 reg, ret, status;
+
+	/* TODO: implement other sizes, see 0x18 */
+	WARN_ON(size != 4);
+
+	writel(CMD_WRITE, base + OPB0_RW);
+	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(addr, base + OPB0_FSI_ADDR);
+	writel(val, base + OPB0_FSI_DATA_W);
+	writel(0x1, base + OPB_IRQ_CLEAR);
+	writel(0x1, base + OPB_TRIGGER);
+
+	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
+				(reg & OPB0_XFER_ACK_EN) != 0,
+				10000);
+
+	status = readl(base + OPB0_STATUS);
+
+	trace_aspeed_fsi_opb_write(addr, val, size, status, reg);
+
+	/* Return error when poll timed out */
+	if (ret)
+		return ret;
+
+	/* Command failed, master will reset */
+	if (status & STATUS_ERR_ACK)
+		return -EIO;
+
+	return 0;
+}
+
+static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
+		    size_t size, u32 *out)
+{
+	void __iomem *base = aspeed->base;
+	u32 result, reg;
+	int status, ret;
+
+	/* TODO: implement other sizes, see 0x18 */
+	WARN_ON(size != 4);
+
+	writel(CMD_READ, base + OPB0_RW);
+	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(addr, base + OPB0_FSI_ADDR);
+	writel(0x1, base + OPB_IRQ_CLEAR);
+	writel(0x1, base + OPB_TRIGGER);
+
+	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
+			   (reg & OPB0_XFER_ACK_EN) != 0,
+			   10000);
+
+	status = readl(base + OPB0_STATUS);
+
+	result = readl(base + OPB0_FSI_DATA_R);
+
+	trace_aspeed_fsi_opb_read(addr, size, result,
+			readl(base + OPB0_STATUS),
+			reg);
+
+	/* Return error when poll timed out */
+	if (ret)
+		return ret;
+
+	/* Command failed, master will reset */
+	if (status & STATUS_ERR_ACK)
+		return -EIO;
+
+	if (out)
+		*out = result;
+
+	return 0;
+}
+
+static int check_errors(struct fsi_master_aspeed *aspeed, int err)
+{
+	int ret;
+
+	 if (trace_aspeed_fsi_opb_error_enabled()) {
+		 __be32 mresp0, mstap0, mesrb0;
+
+		 opb_read(aspeed, ctrl_base + FSI_MRESP0, 4, &mresp0);
+		 opb_read(aspeed, ctrl_base + FSI_MSTAP0, 4, &mstap0);
+		 opb_read(aspeed, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+
+		 trace_aspeed_fsi_opb_error(
+				 be32_to_cpu(mresp0),
+				 be32_to_cpu(mstap0),
+				 be32_to_cpu(mesrb0));
+	 };
+
+	if (err == -EIO) {
+		/* Check MAEB (0x70) ? */
+
+		/* Then clear errors in master */
+		ret = opb_write(aspeed, ctrl_base + 0xd0,
+				cpu_to_be32(0x20000000), 4);
+		if (ret) {
+			/* TODO: log? return different code? */
+			return ret;
+		}
+		/* TODO: confirm that 0x70 was okay */
+	}
+
+	/* This will pass through timeout errors */
+	return err;
+}
+
+int aspeed_fsi_read(struct fsi_master_aspeed *aspeed, int link,
+		    uint32_t addr, void *val, size_t size)
+{
+	int ret;
+
+	addr += link * FSI_HUB_LINK_SIZE;
+	ret = opb_read(aspeed, fsi_base + addr, size, val);
+
+	ret = check_errors(aspeed, ret);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int aspeed_fsi_write(struct fsi_master_aspeed *aspeed, int link,
+			uint8_t id, uint32_t addr, const void *val, size_t size)
+{
+	int ret;
+
+	if (id != 0)
+		return -EINVAL;
+
+	addr += link * FSI_HUB_LINK_SIZE;
+	ret = opb_write(aspeed, fsi_base + addr, *(uint32_t *)val, size);
+
+	ret = check_errors(aspeed, ret);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int aspeed_fsi_link_enable(struct fsi_master_aspeed *aspeed, int link)
+{
+	int idx, bit, ret;
+	__be32 reg, result;
+
+	idx = link / 32;
+	bit = link % 32;
+
+	reg = cpu_to_be32(0x80000000 >> bit);
+
+	result = opb_write(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx),
+			reg, 4);
+
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	ret = opb_read(aspeed, ctrl_base + FSI_MENP0 + (4 * idx),
+			4, &result);
+	if (ret)
+		return ret;
+
+	if (result != reg) {
+		dev_err(aspeed->dev, "%s failed: %08x\n", __func__, result);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int aspeed_fsi_break(struct fsi_master_aspeed *aspeed, int link)
+{
+	uint32_t addr;
+	__be32 cmd;
+	int rc;
+
+	addr = 0x0;
+	cmd = cpu_to_be32(0xc0de0000);
+
+	dev_dbg(aspeed->dev, "sending break to link %d\n", link);
+
+	rc = aspeed_fsi_write(aspeed, link, 0, addr, &cmd, 4);
+
+	dev_dbg(aspeed->dev, "break done (%d)\n", rc);
+
+	return rc;
+}
+
+void aspeed_fsi_status(struct fsi_master_aspeed *aspeed)
+{
+	__be32 mmode, mresp0, mstap0, mesrb0;
+
+	printf("%s\n", aspeed->dev->name);
+
+	opb_read(aspeed, ctrl_base + FSI_MMODE, 4, &mmode);
+	opb_read(aspeed, ctrl_base + FSI_MRESP0, 4, &mresp0);
+	opb_read(aspeed, ctrl_base + FSI_MSTAP0, 4, &mstap0);
+	opb_read(aspeed, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+
+	printf("mmode %08x\n", be32_to_cpu(mmode));
+	printf("mresp %08x\n", be32_to_cpu(mresp0));
+	printf("mresp %08x\n", be32_to_cpu(mstap0));
+	printf("mresp %08x\n", be32_to_cpu(mesrb0));
+}
+
+int aspeed_fsi_divisor(struct fsi_master_aspeed *aspeed, uint16_t divisor)
+{
+        __be32 reg;
+        int rc;
+
+        rc = opb_read(aspeed, ctrl_base, 4, &reg);
+        if (rc)
+                return rc;
+
+	if (!divisor)
+		return (be32_to_cpu(reg) >> 18) & 0x3ff;
+
+	if (divisor > 0x3ff)
+		return -EINVAL;
+	
+        reg &= ~(0x3ff << 18);
+        reg |= (divisor & 0x3ff) << 18;
+
+        return 0;
+}
+
+/* mmode encoders */
+static inline u32 fsi_mmode_crs0(u32 x)
+{
+	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
+}
+
+static inline u32 fsi_mmode_crs1(u32 x)
+{
+	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
+}
+
+static int aspeed_fsi_init(struct fsi_master_aspeed *aspeed)
+{
+	__be32 reg;
+
+	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
+			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+
+	/* Initialize the MFSI (hub master) engine */
+	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
+			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+
+	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
+	opb_write(aspeed, ctrl_base + FSI_MECTRL, reg, 4);
+
+	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
+			| fsi_mmode_crs0(DEFAULT_DIVISOR)
+			| fsi_mmode_crs1(DEFAULT_DIVISOR)
+			| FSI_MMODE_P8_TO_LSB);
+	opb_write(aspeed, ctrl_base + FSI_MMODE, reg, 4);
+
+	reg = cpu_to_be32(0xffff0000);
+	opb_write(aspeed, ctrl_base + FSI_MDLYR, reg, 4);
+
+	reg = cpu_to_be32(~0);
+	opb_write(aspeed, ctrl_base + FSI_MSENP0, reg, 4);
+
+	/* Leave enabled long enough for master logic to set up */
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	opb_write(aspeed, ctrl_base + FSI_MCENP0, reg, 4);
+
+	opb_read(aspeed, ctrl_base + FSI_MAEB, 4, NULL);
+
+	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+
+	opb_read(aspeed, ctrl_base + FSI_MLEVP0, 4, NULL);
+
+	/* Reset the master bridge */
+	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
+	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
+
+	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
+	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
+
+	return 0;
+}
+
+static int aspeed_fsi_probe(struct udevice *dev)
+{
+	struct fsi_master_aspeed *aspeed = dev_get_priv(dev);
+	int ret, links, reg;
+	__be32 raw;
+
+	printf("%s\n", __func__);
+
+	aspeed->dev = dev;
+
+	aspeed->base = (void *)devfdt_get_addr(dev);
+
+	ret = clk_get_by_index(dev, 0, &aspeed->clk);
+        if (ret < 0) {
+		dev_err(dev, "Can't get clock for %s: %d\n", dev->name, ret);
+		return ret;
+        }
+
+	ret = clk_enable(&aspeed->clk);
+        if (ret) {
+                dev_err(dev, "failed to enable fsi clock (%d)\n", ret);
+                return ret;
+        }
+
+	printf("%s %d\n", __func__, __LINE__);
+
+	writel(0x1, aspeed->base + OPB_CLK_SYNC);
+	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
+			aspeed->base + OPB_IRQ_MASK);
+
+	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
+	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
+
+	/* Set read data order */
+	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
+
+	/* Set write data order */
+	writel(0x0011bb1b, aspeed->base + OPB0_W_ENDIAN);
+	writel(0xffaa5500, aspeed->base + 0x50);
+
+	/*
+	 * Select OPB0 for all operations.
+	 * Will need to be reworked when enabling DMA or anything that uses
+	 * OPB1.
+	 */
+	writel(0x1, aspeed->base + OPB0_SELECT);
+
+	printf("%s %d\n", __func__, __LINE__);
+
+	ret = opb_read(aspeed, ctrl_base + FSI_MVER, 4, &raw);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to read hub version\n");
+		goto err;
+	}
+
+	printf("%s %d\n", __func__, __LINE__);
+
+	reg = be32_to_cpu(raw);
+	links = (reg >> 8) & 0xff;
+	dev_info(&pdev->dev, "hub version %08x (%d links)\n", reg, links);
+
+	aspeed_fsi_init(aspeed);
+
+	printf("%s: probe done\n", __func__);
+
+	return 0;
+
+err:
+	clk_disable(&aspeed->clk);
+	return ret;
+}
+
+static int aspeed_fsi_remove(struct udevice *dev)
+{
+	struct fsi_master_aspeed *aspeed = dev_get_priv(dev);
+
+	clk_disable(&aspeed->clk);
+
+	return 0;
+}
+
+static const struct udevice_id aspeed_fsi_ids[] = {
+	{ .compatible = "aspeed,ast2600-fsi-master" },
+	{ }
+};
+
+U_BOOT_DRIVER(aspeed_fsi) = {
+	.name		= "aspeed_fsi",
+	.id		= UCLASS_MISC,
+	.of_match	= aspeed_fsi_ids,
+	.probe		= aspeed_fsi_probe,
+	.remove 	= aspeed_fsi_remove,
+	.priv_auto_alloc_size = sizeof(struct fsi_master_aspeed),
+};
diff --git a/include/aspeed_fsi.h b/include/aspeed_fsi.h
new file mode 100644
index 000000000000..c8d6616ef8e1
--- /dev/null
+++ b/include/aspeed_fsi.h
@@ -0,0 +1,14 @@
+struct fsi_master_aspeed;
+
+int aspeed_fsi_read(struct fsi_master_aspeed *aspeed, int link,
+		    uint32_t addr, void *val, size_t size);
+
+int aspeed_fsi_write(struct fsi_master_aspeed *aspeed, int link,
+		     uint32_t addr, const void *val, size_t size);
+
+int aspeed_fsi_break(struct fsi_master_aspeed *aspeed, int link);
+
+int aspeed_fsi_status(struct fsi_master_aspeed *aspeed);
+
+int aspeed_fsi_divisor(struct fsi_master_aspeed *aspeed, uint16_t divisor);
+
-- 
2.23.0

