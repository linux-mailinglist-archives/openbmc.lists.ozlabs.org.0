Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36119597EBD
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 08:42:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7b0g04s1z3c52
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:42:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HVTcRGQ2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=stanley.chuys@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HVTcRGQ2;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Zy906WXz2ynh
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 16:40:16 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso3857700pjk.0
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 23:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=m4ju2JYBe/sjW0Ru4qezdBVc3VWUrOlut5yUjZ46Yg0=;
        b=HVTcRGQ23E1ojGXnJHS0QCPjrz08p+e/t1k6I9u6nBhYwPGzAYdqQiJ7VeZEPPa/cY
         7A9nXX7tR+iez3Czhh3jIb7eMySKtc7ye8CCgJnAXrG7yj6bwf1OoySljyzCi+5zBETg
         hVToPP9mfw4ZS3pUKSnafOisbPSPxBVo+WtxaWXlFeM+vlq6LPCT+UPIw8gwMZ8DXawE
         DVnLmID+WAWz8gDjJpa69gn918WR4vVxjUV/XBzXMHW+iS6/XbjYaaraILyjUkJWQPZ1
         ja6JNgHKx8uS4X7ySTG4qaxUhAf/TQ1CkG7acjJxJuYBNtJUW/HibrxwoZkZOrGW1JvR
         rSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=m4ju2JYBe/sjW0Ru4qezdBVc3VWUrOlut5yUjZ46Yg0=;
        b=bh6jvABM/AWxADLCVV1FbveHc3UvasEfkEKJQXG/XBUnTfIhILZYlnOTZhDAsa8HHN
         sFKOifWPjUHwompAZ3uev+sejF6boak52Oro7ChmS6UzhacTbqRnm5w5Ke6we+CKwyOo
         Nilca4ul9L6bLoxpo4U+CYwD49MLxc88Wpi6XQlrVv2azDxy2njDT4BemzIj2j8R5pwV
         rXCv4hgvseCVXGwY5un0L5TDZ6WiOm8wQ9jdlq0+Aln+pmaINPPjYSlPyuKk3Y4IwQf1
         9kPIpDMCIxXNKwdyHxFZUh3j2I0l3ElTMr+pbUoLN5E0xZ0kn0dkP3p12E4hHmAanzMe
         cwqQ==
X-Gm-Message-State: ACgBeo0hECL3NTaXpHiP6oUo99dx/60q0fBP7mym+/aKEimMd2PDT6vr
	xV2SGBX4pdIQqOFzMW/YoSLpbHYVchsX/Q==
X-Google-Smtp-Source: AA6agR4W10cTkgHWmBzpvh8nSGo9Kdj14ErAMk2/Fbx7dV1gh89Zsopk1Mq8uX84eaaRZ4fmEcPf3A==
X-Received: by 2002:a17:90b:2691:b0:1fa:c427:1122 with SMTP id pl17-20020a17090b269100b001fac4271122mr1683604pjb.5.1660804814297;
        Wed, 17 Aug 2022 23:40:14 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.143])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ecc900b0016bf4428586sm553188plh.208.2022.08.17.23.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:40:14 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 3/3] misc: Add NPCM845 jtag master driver
Date: Thu, 18 Aug 2022 14:39:51 +0800
Message-Id: <20220818063951.12629-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818063951.12629-1-yschu@nuvoton.com>
References: <20220818063951.12629-1-yschu@nuvoton.com>
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
Cc: andrew@aj.id.au, yschu@nuvoton.com, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The jtag master driver provides ioctls for userspace to shift
jtag instruction/data.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/misc/Kconfig               |   7 +
 drivers/misc/Makefile              |   1 +
 drivers/misc/npcm8xx-jtag-master.c | 902 +++++++++++++++++++++++++++++
 3 files changed, 910 insertions(+)
 create mode 100644 drivers/misc/npcm8xx-jtag-master.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 1174ad7a15a7..18e478050b63 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -491,6 +491,13 @@ config NPCM7XX_JTAG_MASTER
 	help
 	  Control PSPI/GPIO to transmit jtag signals to support jtag master function.
 
+config NPCM8XX_JTAG_MASTER
+	tristate "NPCM8xx JTAG Master driver"
+	depends on (ARCH_NPCM || COMPILE_TEST)
+	help
+	  Provide a driver for userspace to control the JTAG master
+	  controller to shift JTAG signals.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 0400bfee295f..879fe9fbcdc0 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
 obj-$(CONFIG_NPCM_LPC_BPC)	+= npcm7xx-lpc-bpc.o
 obj-$(CONFIG_NPCM_PCI_MBOX)	+= npcm7xx-pci-mbox.o
 obj-$(CONFIG_NPCM7XX_JTAG_MASTER)	+= npcm7xx-jtag-master.o
+obj-$(CONFIG_NPCM8XX_JTAG_MASTER)       += npcm8xx-jtag-master.o
diff --git a/drivers/misc/npcm8xx-jtag-master.c b/drivers/misc/npcm8xx-jtag-master.c
new file mode 100644
index 000000000000..8efa3d04ecfe
--- /dev/null
+++ b/drivers/misc/npcm8xx-jtag-master.c
@@ -0,0 +1,902 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021 Nuvoton Technology corporation.
+
+#include <linux/kernel.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/miscdevice.h>
+#include <linux/delay.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+/* JTM registers */
+#define JTM_CTL			0x00
+#define JTM_STAT		0x04
+#define JTM_CMD			0x08
+#define JTM_TDO_OUT(n)	(0x10 + n * 4)
+#define JTM_TDO_EN(n)	(0x20 + n * 4)
+#define JTM_TMS_OUT(n)	(0x30 + n * 4)
+#define JTM_TDI_IN(n)	(0x40 + n * 4)
+
+#define JTM_CTL_JTM_EN	BIT(0)
+#define JTM_CTL_DONE_IE	BIT(4)
+#define JTM_CTL_TRST	BIT(8)
+#define JTM_CTL_CKDV	GENMASK(23, 16)
+#define JTM_STAT_BUSY	BIT(0)
+#define JTM_STAT_DONE	BIT(1)
+#define JTM_CMD_ST_OP	BIT(0)
+#define JTM_CMD_CK_CNT	GENMASK(15, 8)
+
+#define NPCM_JTM_MAX_RATE		(50000000)
+#define NPCM_JTM_DEFAULT_RATE	(1000000)
+#define NPCM_JTM_FIFO_SIZE		128
+#define NPCM_JTM_TIMEOUT_MS		10000
+#define JTAG_MAX_XFER_DATA_LEN	65535
+#define JTAG_TLR_TMS_COUNT		9
+
+struct tck_bitbang {
+	__u8     tms;
+	__u8     tdi;
+	__u8     tdo;
+} __packed;
+
+struct bitbang_packet {
+	struct tck_bitbang *data;
+	__u32	length;
+} __packed;
+
+struct jtag_xfer {
+	__u8	type;
+	__u8	direction;
+	__u8	from;
+	__u8	endstate;
+	__u32	padding;
+	__u32	length;
+	__u64	tdio;
+};
+
+struct jtag_tap_state {
+	__u8	reset;
+	__u8	from;
+	__u8	endstate;
+	__u8	tck;
+};
+enum jtagstates {
+	jtagtlr,
+	jtagrti,
+	jtagseldr,
+	jtagcapdr,
+	jtagshfdr,
+	jtagex1dr,
+	jtagpaudr,
+	jtagex2dr,
+	jtagupddr,
+	jtagselir,
+	jtagcapir,
+	jtagshfir,
+	jtagex1ir,
+	jtagpauir,
+	jtagex2ir,
+	jtagupdir,
+	JTAG_STATE_CURRENT
+};
+
+enum jtag_reset {
+	JTAG_NO_RESET = 0,
+	JTAG_FORCE_RESET = 1,
+};
+
+enum jtag_xfer_type {
+	JTAG_SIR_XFER = 0,
+	JTAG_SDR_XFER = 1,
+	JTAG_RUNTEST_XFER = 2,
+};
+
+enum jtag_xfer_direction {
+	JTAG_READ_XFER = 1,
+	JTAG_WRITE_XFER = 2,
+	JTAG_READ_WRITE_XFER = 3,
+};
+
+#define __JTAG_IOCTL_MAGIC	0xb2
+#define JTAG_SIOCSTATE	_IOW(__JTAG_IOCTL_MAGIC, 0, struct jtag_tap_state)
+#define JTAG_SIOCFREQ	_IOW(__JTAG_IOCTL_MAGIC, 1, unsigned int)
+#define JTAG_GIOCFREQ	_IOR(__JTAG_IOCTL_MAGIC, 2, unsigned int)
+#define JTAG_IOCXFER	_IOWR(__JTAG_IOCTL_MAGIC, 3, struct jtag_xfer)
+#define JTAG_GIOCSTATUS _IOWR(__JTAG_IOCTL_MAGIC, 4, enum jtagstates)
+#define JTAG_SIOCMODE	_IOW(__JTAG_IOCTL_MAGIC, 5, unsigned int)
+#define JTAG_IOCBITBANG	_IOW(__JTAG_IOCTL_MAGIC, 6, unsigned int)
+#define JTAG_RUNTEST    _IOW(__JTAG_IOCTL_MAGIC, 7, unsigned int)
+
+static DEFINE_IDA(jtag_ida);
+static DEFINE_SPINLOCK(jtag_file_lock);
+
+struct npcm_jtm {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct reset_control *reset;
+	struct completion xfer_done;
+	struct clk *clk;
+	void __iomem *base;
+	spinlock_t lock;
+	char *tx_buf;
+	char *rx_buf;
+	char *tms_buf;
+	u32 tx_len;
+	u32 rx_len;
+	u32 ck_cnt;
+	u8 tapstate;
+	u32 freq;
+	int id;
+	bool is_open;
+	bool end_tms_high;
+};
+
+struct tmscycle {
+	unsigned char tmsbits;
+	unsigned char count;
+};
+
+/* this is the complete set TMS cycles for going from any TAP state to
+ * any other TAP state, following a “shortest path” rule
+ */
+const struct tmscycle tmscyclelookup[][16] = {
+/*      TLR        RTI       SelDR      CapDR      SDR      */
+/*      Ex1DR      PDR       Ex2DR      UpdDR      SelIR    */
+/*      CapIR      SIR       Ex1IR      PIR        Ex2IR    */
+/*      UpdIR                                               */
+/* TLR */
+	{
+		{0x01, 1}, {0x00, 1}, {0x02, 2}, {0x02, 3}, {0x02, 4},
+		{0x0a, 4}, {0x0a, 5}, {0x2a, 6}, {0x1a, 5}, {0x06, 3},
+		{0x06, 4}, {0x06, 5}, {0x16, 5}, {0x16, 6}, {0x56, 7},
+		{0x36, 6}
+	},
+/* RTI */
+	{
+		{0x07, 3}, {0x00, 1}, {0x01, 1}, {0x01, 2}, {0x01, 3},
+		{0x05, 3}, {0x05, 4}, {0x15, 5}, {0x0d, 4}, {0x03, 2},
+		{0x03, 3}, {0x03, 4}, {0x0b, 4}, {0x0b, 5}, {0x2b, 6},
+		{0x1b, 5}
+	},
+/* SelDR */
+	{
+		{0x03, 2}, {0x03, 3}, {0x00, 0}, {0x00, 1}, {0x00, 2},
+		{0x02, 2}, {0x02, 3}, {0x0a, 4}, {0x06, 3}, {0x01, 1},
+		{0x01, 2}, {0x01, 3}, {0x05, 3}, {0x05, 4}, {0x15, 5},
+		{0x0d, 4}
+	},
+/* CapDR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x00, 0}, {0x00, 1},
+		{0x01, 1}, {0x01, 2}, {0x05, 3}, {0x03, 2}, {0x0f, 4},
+		{0x0f, 5}, {0x0f, 6}, {0x2f, 6}, {0x2f, 7}, {0xaf, 8},
+		{0x6f, 7}
+	},
+/* SDR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x07, 4}, {0x00, 0},
+		{0x01, 1}, {0x01, 2}, {0x05, 3}, {0x03, 2}, {0x0f, 4},
+		{0x0f, 5}, {0x0f, 6}, {0x2f, 6}, {0x2f, 7}, {0xaf, 8},
+		{0x6f, 7}
+	},
+/* Ex1DR */
+	{
+		{0x0f, 4}, {0x01, 2}, {0x03, 2}, {0x03, 3}, {0x02, 3},
+		{0x00, 0}, {0x00, 1}, {0x02, 2}, {0x01, 1}, {0x07, 3},
+		{0x07, 4}, {0x07, 5}, {0x17, 5}, {0x17, 6}, {0x57, 7},
+		{0x37, 6}
+	},
+/* PDR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x07, 4}, {0x01, 2},
+		{0x05, 3}, {0x00, 1}, {0x01, 1}, {0x03, 2}, {0x0f, 4},
+		{0x0f, 5}, {0x0f, 6}, {0x2f, 6}, {0x2f, 7}, {0xaf, 8},
+		{0x6f, 7}
+	},
+/* Ex2DR */
+	{
+		{0x0f, 4}, {0x01, 2}, {0x03, 2}, {0x03, 3}, {0x00, 1},
+		{0x02, 2}, {0x02, 3}, {0x00, 0}, {0x01, 1}, {0x07, 3},
+		{0x07, 4}, {0x07, 5}, {0x17, 5}, {0x17, 6}, {0x57, 7},
+		{0x37, 6}
+	},
+/* UpdDR */
+	{
+		{0x07, 3}, {0x00, 1}, {0x01, 1}, {0x01, 2}, {0x01, 3},
+		{0x05, 3}, {0x05, 4}, {0x15, 5}, {0x00, 0}, {0x03, 2},
+		{0x03, 3}, {0x03, 4}, {0x0b, 4}, {0x0b, 5}, {0x2b, 6},
+		{0x1b, 5}
+	},
+/* SelIR */
+	{
+		{0x01, 1}, {0x01, 2}, {0x05, 3}, {0x05, 4}, {0x05, 5},
+		{0x15, 5}, {0x15, 6}, {0x55, 7}, {0x35, 6}, {0x00, 0},
+		{0x00, 1}, {0x00, 2}, {0x02, 2}, {0x02, 3}, {0x0a, 4},
+		{0x06, 3}
+	},
+/* CapIR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x07, 4}, {0x07, 5},
+		{0x17, 5}, {0x17, 6}, {0x57, 7}, {0x37, 6}, {0x0f, 4},
+		{0x00, 0}, {0x00, 1}, {0x01, 1}, {0x01, 2}, {0x05, 3},
+		{0x03, 2}
+	},
+/* SIR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x07, 4}, {0x07, 5},
+		{0x17, 5}, {0x17, 6}, {0x57, 7}, {0x37, 6}, {0x0f, 4},
+		{0x0f, 5}, {0x00, 0}, {0x01, 1}, {0x01, 2}, {0x05, 3},
+		{0x03, 2}
+	},
+/* Ex1IR */
+	{
+		{0x0f, 4}, {0x01, 2}, {0x03, 2}, {0x03, 3}, {0x03, 4},
+		{0x0b, 4}, {0x0b, 5}, {0x2b, 6}, {0x1b, 5}, {0x07, 3},
+		{0x07, 4}, {0x02, 3}, {0x00, 0}, {0x00, 1}, {0x02, 2},
+		{0x01, 1}
+	},
+/* PIR */
+	{
+		{0x1f, 5}, {0x03, 3}, {0x07, 3}, {0x07, 4}, {0x07, 5},
+		{0x17, 5}, {0x17, 6}, {0x57, 7}, {0x37, 6}, {0x0f, 4},
+		{0x0f, 5}, {0x01, 2}, {0x05, 3}, {0x00, 1}, {0x01, 1},
+		{0x03, 2}
+	},
+/* Ex2IR */
+	{
+		{0x0f, 4}, {0x01, 2}, {0x03, 2}, {0x03, 3}, {0x03, 4},
+		{0x0b, 4}, {0x0b, 5}, {0x2b, 6}, {0x1b, 5}, {0x07, 3},
+		{0x07, 4}, {0x00, 1}, {0x02, 2}, {0x02, 3}, {0x00, 0},
+		{0x01, 1}
+	},
+/* UpdIR */
+	{
+		{0x07, 3}, {0x00, 1}, {0x01, 1}, {0x01, 2}, {0x01, 3},
+		{0x05, 3}, {0x05, 4}, {0x15, 5}, {0x0d, 4}, {0x03, 2},
+		{0x03, 3}, {0x03, 4}, {0x0b, 4}, {0x0b, 5}, {0x2b, 6},
+		{0x00, 0}
+	},
+};
+
+/* should be called from atomic context */
+static int npcm_jtm_send(struct npcm_jtm *priv)
+{
+	u32 *tdo32 = (u32 *)priv->tx_buf;
+	u32 *tms32 = (u32 *)priv->tms_buf;
+	u8 *tdo8, *tms8;
+	u32 cnt;
+	u32 val, tmsval;
+	int n, i;
+	int words, bytes;
+
+	if (priv->tx_len > NPCM_JTM_FIFO_SIZE)
+		cnt = NPCM_JTM_FIFO_SIZE;
+	else
+		cnt = priv->tx_len;
+
+	words = cnt / 32;
+	bytes = DIV_ROUND_UP((cnt % 32), 8);
+
+	for (n = 0; n < words; n++) {
+		if (tdo32) {
+			writel(*tdo32, priv->base + JTM_TDO_OUT(n));
+			tdo32++;
+		} else
+			writel(0, priv->base + JTM_TDO_OUT(n));
+		if (priv->tms_buf) {
+			tmsval = *tms32;
+			tms32++;
+		} else
+			tmsval = 0;
+		if (priv->end_tms_high && (cnt == priv->tx_len)
+				&& !bytes && (n == words - 1))
+			tmsval |= (1 << 31);
+		writel(tmsval, priv->base + JTM_TMS_OUT(n));
+	}
+
+	if (bytes) {
+		tdo8 = (u8 *)tdo32;
+		tms8 = (u8 *)tms32;
+		val = 0;
+		tmsval = 0;
+		for (i = 0; i < bytes; i++) {
+			if (tdo8)
+				val |= tdo8[i] << (i * 8);
+			if (priv->tms_buf)
+				tmsval |= tms8[i] << (i * 8);
+		}
+		if (priv->end_tms_high && (cnt == priv->tx_len))
+			tmsval |= 1 << ((cnt % 32) - 1);
+		writel(val, priv->base + JTM_TDO_OUT(n));
+		writel(tmsval, priv->base + JTM_TMS_OUT(n));
+	}
+
+	priv->ck_cnt = cnt;
+	priv->tx_len -= cnt;
+	if (priv->tx_buf)
+		priv->tx_buf += cnt / 8;
+	if (priv->tms_buf)
+		priv->tms_buf += cnt / 8;
+
+	/* Start */
+	val = readl(priv->base + JTM_CMD);
+	val &= ~JTM_CMD_CK_CNT;
+	val |= (cnt << 8) | JTM_CMD_ST_OP;
+	writel(val, priv->base + JTM_CMD);
+
+	return cnt;
+}
+
+/* should be called from atomic context */
+static int npcm_jtm_recv(struct npcm_jtm *priv, u32 cnt)
+{
+	u32 *buf32 = (u32 *)priv->rx_buf;
+	u8 *buf;
+	u32 val;
+	int n, i;
+	int words, bytes;
+
+	if (priv->rx_len < cnt)
+		return -EINVAL;
+
+	words = cnt / 32;
+	bytes = DIV_ROUND_UP((cnt % 32), 8);
+	for (n = 0; n < words; n++) {
+		val = readl(priv->base + JTM_TDI_IN(n));
+		if (buf32) {
+			*buf32 = val;
+			buf32++;
+		}
+	}
+
+	if (bytes) {
+		buf = (u8 *)buf32;
+		val = readl(priv->base + JTM_TDI_IN(n));
+		if (buf)
+			for (i = 0; i < bytes; i++)
+				buf[i] = (val >> (i * 8)) & 0xFF;
+	}
+	priv->rx_len -= cnt;
+	if (priv->rx_buf)
+		priv->rx_buf += cnt / 8;
+
+	return 0;
+}
+
+static irqreturn_t npcm_jtm_handler(int irq, void *dev_id)
+{
+	struct npcm_jtm *priv = dev_id;
+	u32 stat;
+
+	stat = readl(priv->base + JTM_STAT);
+
+	if (stat & JTM_STAT_DONE) {
+		writel(JTM_STAT_DONE, priv->base + JTM_STAT);
+		if (priv->rx_len && priv->ck_cnt)
+			npcm_jtm_recv(priv, priv->ck_cnt);
+		if (priv->rx_len == 0)
+			complete(&priv->xfer_done);
+	}
+	if (((stat & JTM_STAT_BUSY) == 0)) {
+		if (priv->tx_len)
+			npcm_jtm_send(priv);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/* jtm_tdo: master to target, jtm_tdi: target to master */
+static int npcm_jtm_shift(struct npcm_jtm *priv, char *jtm_tdo,
+			char *jtm_tdi, char *tms, unsigned int tcks)
+{
+	u32 val;
+	u8 stat;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!tcks)
+		return -EINVAL;
+
+	priv->tx_len = tcks;
+	priv->tx_buf = jtm_tdo;
+	priv->rx_len = tcks;
+	priv->rx_buf = jtm_tdi;
+	priv->tms_buf = tms;
+
+	stat = readl(priv->base + JTM_STAT);
+	if ((stat & JTM_STAT_BUSY) != 0) {
+		dev_err(priv->dev, "jtm state busy\n");
+		return -EBUSY;
+	}
+
+	reinit_completion(&priv->xfer_done);
+	/* enable module and interrupt */
+	val = readl(priv->base + JTM_CTL);
+	val |= JTM_CTL_JTM_EN | JTM_CTL_DONE_IE;
+	writel(val, priv->base + JTM_CTL);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	npcm_jtm_send(priv);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	ret = wait_for_completion_timeout(&priv->xfer_done,
+					     msecs_to_jiffies
+					     (NPCM_JTM_TIMEOUT_MS));
+	if (ret == 0)
+		ret = -ETIMEDOUT;
+	else
+		ret = 0;
+
+	/* disable module and interrupt */
+	val &= ~(JTM_CTL_JTM_EN | JTM_CTL_DONE_IE);
+	writel(val, priv->base + JTM_CTL);
+
+	return ret;
+}
+
+static void npcm_jtm_reset_hw(struct npcm_jtm *priv)
+{
+	reset_control_assert(priv->reset);
+	udelay(5);
+	reset_control_deassert(priv->reset);
+}
+
+static void npcm_jtm_set_baudrate(struct npcm_jtm *priv, unsigned int speed)
+{
+	u32 ckdiv;
+	u32 regtemp;
+
+	ckdiv = DIV_ROUND_CLOSEST(clk_get_rate(priv->clk), (2 * speed)) - 1;
+
+	regtemp = readl(priv->base + JTM_CTL);
+	regtemp &= ~JTM_CTL_CKDV;
+	writel(regtemp | (ckdiv << 16), priv->base + JTM_CTL);
+}
+
+static int jtag_set_tapstate(struct npcm_jtm *jtag,
+				     enum jtagstates from, enum jtagstates to)
+{
+	u8 tdo[2], tdi[2], tms[2];
+	u8 count;
+	int ret;
+
+	if (from == to || to == JTAG_STATE_CURRENT)
+		return 0;
+
+	if (from > JTAG_STATE_CURRENT || to > JTAG_STATE_CURRENT)
+		return -1;
+
+	jtag->end_tms_high = false;
+	if (to == jtagtlr) {
+		tms[0] = 0xff;
+		tms[1] = 0x01;
+		tdo[0] = tdo[1] = 0;
+		ret = npcm_jtm_shift(jtag, tdo, tdi, tms, JTAG_TLR_TMS_COUNT);
+		jtag->tapstate = jtagtlr;
+		return ret;
+	}
+
+	if (from == JTAG_STATE_CURRENT)
+		from = jtag->tapstate;
+
+	tms[0] = tmscyclelookup[from][to].tmsbits;
+	count   = tmscyclelookup[from][to].count;
+
+	if (count == 0)
+		return 0;
+
+	tdo[0] = 0;
+	ret = npcm_jtm_shift(jtag, tdo, tdi, tms, count);
+	pr_debug("jtag: change state %d -> %d\n", from, to);
+	jtag->tapstate = to;
+
+	return ret;
+}
+
+static int jtag_bitbangs(struct npcm_jtm *jtag,
+			struct bitbang_packet *bitbangs,
+			struct tck_bitbang *bitbang_data)
+{
+	int ret = 0;
+	int i;
+	u8 *jtm_tdo, *jtm_tdi, *tms;
+
+	jtag->end_tms_high = false;
+	for (i = 0; i < bitbangs->length; i++) {
+		jtm_tdo = &(bitbang_data[i].tdi);
+		jtm_tdi = &(bitbang_data[i].tdo);
+		tms = &(bitbang_data[i].tms);
+		ret = npcm_jtm_shift(jtag, jtm_tdo, jtm_tdi, tms, 1);
+		if (ret != 0)
+			break;
+	}
+
+	return ret;
+}
+
+static int jtag_transfer(struct npcm_jtm *jtag,
+			     struct jtag_xfer *xfer, u8 *jtm_tdo, u32 bytes)
+{
+	u8 *jtm_tdi = NULL;
+	int ret;
+
+	if (xfer->length == 0)
+		return 0;
+
+	if (xfer->type != JTAG_RUNTEST_XFER) {
+		jtm_tdi = kzalloc(bytes, GFP_KERNEL);
+		if (!jtm_tdi)
+			return -ENOMEM;
+	}
+
+	if (xfer->type == JTAG_SIR_XFER)
+		jtag_set_tapstate(jtag, xfer->from, jtagshfir);
+	else if (xfer->type == JTAG_SDR_XFER)
+		jtag_set_tapstate(jtag, xfer->from, jtagshfdr);
+	else if (xfer->type == JTAG_RUNTEST_XFER)
+		jtag_set_tapstate(jtag, xfer->from, jtagrti);
+
+	/* SIR/SDR: the last bit should be shifted with TMS high */
+	if ((xfer->type == JTAG_SIR_XFER && xfer->endstate != jtagshfir) ||
+			(xfer->type == JTAG_SDR_XFER && xfer->endstate != jtagshfdr)) {
+		jtag->end_tms_high = true;
+		jtag->tapstate = (jtag->tapstate == jtagshfdr) ?
+				jtagex1dr : jtagex1ir;
+	} else
+		jtag->end_tms_high = false;
+
+	ret = npcm_jtm_shift(jtag, jtm_tdo, jtm_tdi, NULL, xfer->length);
+	jtag_set_tapstate(jtag, JTAG_STATE_CURRENT, xfer->endstate);
+
+	if (xfer->type != JTAG_RUNTEST_XFER) {
+		if (jtm_tdo && !ret)
+			memcpy(jtm_tdo, jtm_tdi, bytes);
+		kfree(jtm_tdi);
+	}
+
+	return ret;
+}
+
+/* Run in rti state for specific number of tcks */
+static int jtag_runtest(struct npcm_jtm *jtag, unsigned int tcks)
+{
+	struct jtag_xfer xfer;
+	u32 bytes = DIV_ROUND_UP(tcks, BITS_PER_BYTE);
+	int ret;
+
+	xfer.type = JTAG_RUNTEST_XFER;
+	xfer.direction = JTAG_WRITE_XFER;
+	xfer.from = JTAG_STATE_CURRENT;
+	xfer.endstate = jtagrti;
+	xfer.length = tcks;
+
+	ret = jtag_transfer(jtag, &xfer, NULL, bytes);
+
+	return ret;
+}
+
+static long jtag_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct npcm_jtm *priv = file->private_data;
+	struct jtag_tap_state tapstate;
+	struct jtag_xfer xfer;
+	struct bitbang_packet bitbang;
+	struct tck_bitbang *bitbang_data;
+	u8 *xfer_data;
+	u32 data_size;
+	u32 value;
+	int ret = 0;
+
+	switch (cmd) {
+	case JTAG_SIOCFREQ:
+		if (get_user(value, (__u32 __user *)arg))
+			return -EFAULT;
+		if (value <= NPCM_JTM_MAX_RATE) {
+			priv->freq = value;
+			npcm_jtm_set_baudrate(priv, priv->freq);
+		} else {
+			dev_err(priv->dev, "invalid jtag freq %u\n", value);
+			ret = -EINVAL;
+		}
+		break;
+	case JTAG_GIOCFREQ:
+		if (put_user(priv->freq, (__u32 __user *)arg))
+			return -EFAULT;
+		break;
+	case JTAG_IOCBITBANG:
+		if (copy_from_user(&bitbang, (const void __user *)arg,
+				   sizeof(struct bitbang_packet)))
+			return -EFAULT;
+
+		if (bitbang.length >= JTAG_MAX_XFER_DATA_LEN)
+			return -EINVAL;
+
+		data_size = bitbang.length * sizeof(struct tck_bitbang);
+		bitbang_data = memdup_user((void __user *)bitbang.data,
+					   data_size);
+		if (IS_ERR(bitbang_data))
+			return -EFAULT;
+
+		ret = jtag_bitbangs(priv, &bitbang, bitbang_data);
+		if (ret) {
+			kfree(bitbang_data);
+			return -EIO;
+		}
+		ret = copy_to_user((void __user *)bitbang.data,
+				   (void *)bitbang_data, data_size);
+		kfree(bitbang_data);
+		if (ret)
+			return -EFAULT;
+		break;
+	case JTAG_SIOCSTATE:
+		if (copy_from_user(&tapstate, (const void __user *)arg,
+				   sizeof(struct jtag_tap_state)))
+			return -EFAULT;
+
+		if (tapstate.from > JTAG_STATE_CURRENT)
+			return -EINVAL;
+
+		if (tapstate.endstate > JTAG_STATE_CURRENT)
+			return -EINVAL;
+
+		if (tapstate.reset > JTAG_FORCE_RESET)
+			return -EINVAL;
+		if (tapstate.reset == JTAG_FORCE_RESET)
+			jtag_set_tapstate(priv, JTAG_STATE_CURRENT,
+						  jtagtlr);
+		jtag_set_tapstate(priv, tapstate.from,
+					  tapstate.endstate);
+		break;
+	case JTAG_GIOCSTATUS:
+		ret = put_user(priv->tapstate, (__u32 __user *)arg);
+		break;
+	case JTAG_IOCXFER:
+
+		if (copy_from_user(&xfer, (const void __user *)arg,
+			sizeof(struct jtag_xfer)))
+			return -EFAULT;
+
+		if (xfer.length >= JTAG_MAX_XFER_DATA_LEN)
+			return -EINVAL;
+
+		if (xfer.type > JTAG_SDR_XFER)
+			return -EINVAL;
+
+		if (xfer.direction > JTAG_READ_WRITE_XFER)
+			return -EINVAL;
+
+		if (xfer.from > JTAG_STATE_CURRENT)
+			return -EINVAL;
+
+		if (xfer.endstate > JTAG_STATE_CURRENT)
+			return -EINVAL;
+
+		data_size = DIV_ROUND_UP(xfer.length, BITS_PER_BYTE);
+		xfer_data = memdup_user((void __user *)xfer.tdio, data_size);
+		if (IS_ERR(xfer_data))
+			return -EFAULT;
+
+		ret = jtag_transfer(priv, &xfer, xfer_data, data_size);
+		if (ret) {
+			kfree(xfer_data);
+			return -EIO;
+		}
+		ret = copy_to_user((void __user *)xfer.tdio,
+				   (void *)xfer_data, data_size);
+		kfree(xfer_data);
+		if (ret)
+			return -EFAULT;
+
+		if (copy_to_user((void __user *)arg, (void *)&xfer,
+				 sizeof(struct jtag_xfer)))
+			return -EFAULT;
+		break;
+	case JTAG_SIOCMODE:
+		break;
+	case JTAG_RUNTEST:
+		ret = jtag_runtest(priv, (unsigned int)arg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int jtag_open(struct inode *inode, struct file *file)
+{
+	struct npcm_jtm *jtag;
+
+	jtag = container_of(file->private_data, struct npcm_jtm, miscdev);
+
+	spin_lock(&jtag_file_lock);
+	if (jtag->is_open) {
+		spin_unlock(&jtag_file_lock);
+		return -EBUSY;
+	}
+
+	jtag->is_open = true;
+	file->private_data = jtag;
+	spin_unlock(&jtag_file_lock);
+
+	jtag_set_tapstate(jtag, JTAG_STATE_CURRENT, jtagtlr);
+
+	return 0;
+}
+
+static int jtag_release(struct inode *inode, struct file *file)
+{
+	struct npcm_jtm *jtag = file->private_data;
+
+	spin_lock(&jtag_file_lock);
+	jtag->is_open = false;
+	spin_unlock(&jtag_file_lock);
+
+	return 0;
+}
+
+const struct file_operations npcm_jtag_fops = {
+	.open              = jtag_open,
+	.unlocked_ioctl    = jtag_ioctl,
+	.release           = jtag_release,
+};
+
+static int jtag_register_device(struct npcm_jtm *jtag)
+{
+	struct device *dev = jtag->dev;
+	int err;
+	int id;
+
+	if (!dev)
+		return -ENODEV;
+
+	id = ida_simple_get(&jtag_ida, 0, 0, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	jtag->id = id;
+	jtag->miscdev.parent = dev;
+	jtag->miscdev.fops =  &npcm_jtag_fops;
+	jtag->miscdev.minor = MISC_DYNAMIC_MINOR;
+	jtag->miscdev.name = kasprintf(GFP_KERNEL, "jtag%d", id);
+	if (!jtag->miscdev.name) {
+		err = -ENOMEM;
+		goto err;
+	}
+
+	err = misc_register(&jtag->miscdev);
+	if (err) {
+		dev_err(jtag->miscdev.parent,
+			"Unable to register device, err %d\n", err);
+		kfree(jtag->miscdev.name);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	ida_simple_remove(&jtag_ida, id);
+	return err;
+}
+
+static int npcm_jtm_probe(struct platform_device *pdev)
+{
+	struct npcm_jtm *priv;
+	unsigned long clk_hz;
+	int irq;
+	int ret;
+
+	dev_info(&pdev->dev, "%s\n", __func__);
+
+	priv = kzalloc(sizeof(struct npcm_jtm), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = &pdev->dev;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base)) {
+		ret = PTR_ERR(priv->base);
+		goto out_free_mem;
+	}
+
+	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		ret = PTR_ERR(priv->clk);
+		goto out_free_mem;
+	}
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		goto out_free_mem;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto out_disable_clk;
+	}
+
+	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->reset)) {
+		ret = PTR_ERR(priv->reset);
+		goto out_disable_clk;
+	}
+
+	/* reset JTM-HW block */
+	npcm_jtm_reset_hw(priv);
+
+	ret = devm_request_irq(&pdev->dev, irq, npcm_jtm_handler, 0,
+			       "npcm-jtm", priv);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		goto out_disable_clk;
+	}
+
+	init_completion(&priv->xfer_done);
+
+	clk_hz = clk_get_rate(priv->clk);
+
+	priv->freq = NPCM_JTM_DEFAULT_RATE;
+	npcm_jtm_set_baudrate(priv, NPCM_JTM_DEFAULT_RATE);
+
+	ret = jtag_register_device(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to create device\n");
+		goto out_disable_clk;
+	}
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+out_disable_clk:
+	clk_disable_unprepare(priv->clk);
+
+out_free_mem:
+	kfree(priv);
+	return ret;
+}
+
+static int npcm_jtm_remove(struct platform_device *pdev)
+{
+	struct npcm_jtm *jtag = platform_get_drvdata(pdev);
+
+	if (!jtag)
+		return 0;
+
+	misc_deregister(&jtag->miscdev);
+	kfree(jtag->miscdev.name);
+	kfree(jtag);
+	ida_simple_remove(&jtag_ida, jtag->id);
+
+	return 0;
+}
+
+static const struct of_device_id npcm_jtm_id[] = {
+	{ .compatible = "nuvoton,npcm845-jtm", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, npcm_jtm_id);
+
+static struct platform_driver npcm8xx_jtm_driver = {
+	.probe          = npcm_jtm_probe,
+	.remove			= npcm_jtm_remove,
+	.driver         = {
+		.name   = "jtag-master",
+		.owner	= THIS_MODULE,
+		.of_match_table = npcm_jtm_id,
+	},
+};
+
+module_platform_driver(npcm8xx_jtm_driver);
+
+MODULE_AUTHOR("Stanley Chu <yschu@nuvoton.com>");
+MODULE_DESCRIPTION("NPCM8xx JTAG Master Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

