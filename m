Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FB535BEB
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 10:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8dlZ3pcrz3bkD
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 18:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FypdWyD/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FypdWyD/;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8dhw5Zhrz3bkR
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 18:47:12 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id q4so3570214plr.11
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ircKXkU/J207P0hZbVlMwneiC9EWCk+QuJbTImAfc+E=;
        b=FypdWyD/1SCCEVwn9SXGe1+N2/ldiRtsnPepIbo64KaUBFimcp99gRXp1//mQO5Ns/
         jv0KYm/9aJjKrUcFk/4mmap2rpYnoACiFhpeOpHzy/5pBvxwpiqcir/NjV8nUdls0X1s
         kg+bKsUXpCKWf+DjCRXVZ4VFt+ohrPW0KmHWwERHsWKZK7wuca1agGqgsLci2Rar6ui4
         OFT8ituCczpTu6Pmp1ASlJmyrViYMxCv/30JzQER0Pq+aBnqDnyh6BnTUX3roeuo1MF2
         qjHNrFZsVgWMJiVupBeoD9HhTryVf0GH15c2yZw/JUWAr5+tu3OTr1pVvVlsskcBG8Oe
         N2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ircKXkU/J207P0hZbVlMwneiC9EWCk+QuJbTImAfc+E=;
        b=NLoPVMiqzKU6JvKJqknr8rvltUWQFqxLE1frQn0V0eRFRPvWpgVHmT1dvI3ip+Ec/D
         iSteKQOW1IcX60p3X/SZSlIZd6qbGH0zFBewsA3t4lSO42MBaFU0V2LnCcnV5NOU+sb2
         IAsXiF8FKkbISoscXHoix0lK82UMetJ1rIa8RDvzaYOFNjziCYkPsVB2FZR6E240kgrU
         u9EZSyWstFuocNPan+jTzeLwUpWw2xH//qYVFveLEPDihts04KgdpJGVwSJp2Cs+ZAk8
         N94r7MYHrXPGj3M5IOZNZwif79zDDxFg3vsJ19L2MiQFmiNJgdg0vRvqfW/ZIY/d7Fpf
         y03g==
X-Gm-Message-State: AOAM532LwyQp1WMfGa9XRIPJBLVPV7k6hctU0VRjOTLAlDf+BhezqrrG
	mcCNjQUVR3RZZNDh9HYl5b8YIdhd77QRYA==
X-Google-Smtp-Source: ABdhPJyU/CzjgtNXMiPT/iLq//bo8DD8/RG1zDvNc6NHD6pnT3Yy1nZSyearOuxkg4IBaDVpclwfUA==
X-Received: by 2002:a17:902:868b:b0:161:f0ac:875f with SMTP id g11-20020a170902868b00b00161f0ac875fmr36251162plo.83.1653641230041;
        Fri, 27 May 2022 01:47:10 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902d58c00b0015e8d4eb1ebsm3003254plh.53.2022.05.27.01.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 01:47:09 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	tali.perry1@gmail.com,
	tmaimon77@gmail.com,
	avifishman70@gmail.com,
	robh+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	a.zummo@towertech.it,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	ctcchien@nuvoton.com
Subject: [PATCH v3 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Date: Fri, 27 May 2022 16:46:47 +0800
Message-Id: <20220527084647.30835-4-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220527084647.30835-1-ctcchien@nuvoton.com>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Add real time clock support for NCT3018Y.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 MAINTAINERS                |   1 +
 drivers/rtc/Kconfig        |  10 +
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-nct3018y.c | 559 +++++++++++++++++++++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct3018y.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a4302e9aad2..7a8f3b04ca61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2372,6 +2372,7 @@ F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
+F:	drivers/rtc/rtc-nct3018y.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 
 ARM/NUVOTON WPCM450 ARCHITECTURE
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index d85a3c31347c..a61f9fd0b8fc 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -383,6 +383,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_NCT3018Y
+	tristate "Nuvoton NCT3018Y"
+	depends on OF
+	help
+	   If you say yes here you get support for the Nuvoton NCT3018Y I2C RTC
+	   chip.
+
+	   This driver can also be built as a module, if so, the module will be
+	   called "rtc-nct3018y".
+
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK808
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index e92f3e943245..d3c100e43d1f 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
 obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
 obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
+obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
new file mode 100644
index 000000000000..1a175e8dda9d
--- /dev/null
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 Nuvoton Technology Corporation
+
+#include <linux/bcd.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+#define NCT3018Y_REG_SC		0x00 /* seconds */
+#define NCT3018Y_REG_SCA	0x01 /* alarm */
+#define NCT3018Y_REG_MN		0x02
+#define NCT3018Y_REG_MNA	0x03 /* alarm */
+#define NCT3018Y_REG_HR		0x04
+#define NCT3018Y_REG_HRA	0x05 /* alarm */
+#define NCT3018Y_REG_DW		0x06
+#define NCT3018Y_REG_DM		0x07
+#define NCT3018Y_REG_MO		0x08
+#define NCT3018Y_REG_YR		0x09
+#define NCT3018Y_REG_CTRL	0x0A /* timer control */
+#define NCT3018Y_REG_ST		0x0B /* status */
+#define NCT3018Y_REG_CLKO	0x0C /* clock out */
+
+#define NCT3018Y_BIT_AF		BIT(7)
+#define NCT3018Y_BIT_ST		BIT(7)
+#define NCT3018Y_BIT_DM		BIT(6)
+#define NCT3018Y_BIT_HF		BIT(5)
+#define NCT3018Y_BIT_DSM	BIT(4)
+#define NCT3018Y_BIT_AIE	BIT(3)
+#define NCT3018Y_BIT_OFIE	BIT(2)
+#define NCT3018Y_BIT_CIE	BIT(1)
+#define NCT3018Y_BIT_TWO	BIT(0)
+
+#define NCT3018Y_REG_BAT_MASK		0x07
+#define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
+#define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
+
+struct nct3018y {
+	struct rtc_device *rtc;
+	struct i2c_client *client;
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw		clkout_hw;
+#endif
+};
+
+static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
+{
+	int err, flags;
+
+	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
+
+	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (flags < 0) {
+		dev_err(&client->dev,
+			"Failed to read NCT3018Y_REG_CTRL\n");
+		return flags;
+	}
+
+	if (on)
+		flags |= NCT3018Y_BIT_AIE;
+	else
+		flags &= ~NCT3018Y_BIT_AIE;
+
+	flags |= NCT3018Y_BIT_CIE;
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+		return err;
+	}
+
+	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
+	if (flags < 0) {
+		dev_err(&client->dev,
+			"Failed to read NCT3018Y_REG_ST\n");
+		return flags;
+	}
+
+	flags &= ~(NCT3018Y_BIT_AF);
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_ST\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *alarm_enable,
+				  unsigned char *alarm_flag)
+{
+	int err, flags;
+
+	if (alarm_enable) {
+		dev_dbg(&client->dev, "%s:NCT3018Y_REG_CTRL\n", __func__);
+		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+		if (flags < 0)
+			return flags;
+		*alarm_enable = flags & NCT3018Y_BIT_AIE;
+	}
+
+	if (alarm_flag) {
+		dev_dbg(&client->dev, "%s:NCT3018Y_REG_ST\n", __func__);
+		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
+		if (flags < 0)
+			return flags;
+		*alarm_flag = flags & NCT3018Y_BIT_AF;
+	}
+
+	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
+		__func__, *alarm_enable, *alarm_flag);
+
+	return 0;
+}
+
+static irqreturn_t nct3018y_irq(int irq, void *dev_id)
+{
+	struct nct3018y *nct3018y = i2c_get_clientdata(dev_id);
+	struct i2c_client *client = nct3018y->client;
+	int err;
+	unsigned char alarm_flag;
+	unsigned char alarm_enable;
+
+	dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
+	err = nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable, &alarm_flag);
+	if (err)
+		return IRQ_NONE;
+
+	if (alarm_flag) {
+		dev_dbg(&client->dev, "%s:alarm flag:%x\n",
+			__func__, alarm_flag);
+		rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
+		nct3018y_set_alarm_mode(nct3018y->client, 0);
+		dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+/*
+ * In the routines that deal directly with the nct3018y hardware, we use
+ * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
+ */
+static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[10];
+	int err;
+
+	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SC, sizeof(buf), buf);
+	if (err < 0)
+		return err;
+
+	tm->tm_sec = bcd2bin(buf[0] & 0x7F);
+	tm->tm_min = bcd2bin(buf[2] & 0x7F);
+	tm->tm_hour = bcd2bin(buf[4] & 0x3F);
+	tm->tm_wday = buf[6] & 0x07;
+	tm->tm_mday = bcd2bin(buf[7] & 0x3F);
+	tm->tm_mon = bcd2bin(buf[8] & 0x1F) - 1;
+	tm->tm_year = bcd2bin(buf[9]) + 100;
+
+	return 0;
+}
+
+static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[4] = {0};
+	int err;
+
+	buf[0] = bin2bcd(tm->tm_sec);
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_SC\n");
+		return err;
+	}
+
+	buf[0] = bin2bcd(tm->tm_min);
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MN, buf[0]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_MN\n");
+		return err;
+	}
+
+	buf[0] = bin2bcd(tm->tm_hour);
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HR, buf[0]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_HR\n");
+		return err;
+	}
+
+	buf[0] = tm->tm_wday & 0x07;
+	buf[1] = bin2bcd(tm->tm_mday);
+	buf[2] = bin2bcd(tm->tm_mon+1);
+	buf[3] = bin2bcd(tm->tm_year - 100);
+	err = i2c_smbus_write_i2c_block_data(client, NCT3018Y_REG_DW,
+					     sizeof(buf), buf);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write for day and mon and year\n");
+		return -EIO;
+	}
+
+	return err;
+}
+
+static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[5];
+	int err;
+
+	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
+					    sizeof(buf), buf);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to read date\n");
+		return -EIO;
+	}
+
+	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x hr=%02x\n",
+		__func__, buf[0], buf[2], buf[4]);
+
+	tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
+	tm->time.tm_min = bcd2bin(buf[2] & 0x7F);
+	tm->time.tm_hour = bcd2bin(buf[4] & 0x3F);
+
+	err = nct3018y_get_alarm_mode(client, &tm->enabled, &tm->pending);
+	if (err < 0)
+		return err;
+
+	dev_dbg(&client->dev, "%s:s=%d m=%d, hr=%d, enabled=%d, pending=%d\n",
+		__func__, tm->time.tm_sec, tm->time.tm_min,
+		tm->time.tm_hour, tm->enabled, tm->pending);
+
+	return 0;
+}
+
+static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[3];
+	int err;
+
+	dev_dbg(dev, "%s, sec=%d, min=%d hour=%d tm->enabled:%d\n",
+		__func__, tm->time.tm_sec, tm->time.tm_min, tm->time.tm_hour,
+		tm->enabled);
+
+	buf[0] = bin2bcd(tm->time.tm_sec);
+	buf[1] = bin2bcd(tm->time.tm_min);
+	buf[2] = bin2bcd(tm->time.tm_hour);
+
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, buf[0]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
+		return err;
+	}
+
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, buf[1]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
+		return err;
+	}
+
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, buf[2]);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
+		return err;
+	}
+
+	return nct3018y_set_alarm_mode(client, tm->enabled);
+}
+
+static int nct3018y_irq_enable(struct device *dev, unsigned int enabled)
+{
+	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
+
+	return nct3018y_set_alarm_mode(to_i2c_client(dev), enabled);
+}
+
+static int nct3018y_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int status, flags = 0;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		status = i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
+		if (status < 0)
+			return status;
+
+		if (!(status & NCT3018Y_REG_BAT_MASK))
+			flags |= RTC_VL_DATA_INVALID;
+
+		return put_user(flags, (unsigned int __user *)arg);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+#ifdef CONFIG_COMMON_CLK
+/*
+ * Handling of the clkout
+ */
+
+#define clkout_hw_to_nct3018y(_hw) container_of(_hw, struct nct3018y, clkout_hw)
+
+static const int clkout_rates[] = {
+	32768,
+	1024,
+	32,
+	1,
+};
+
+static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
+	struct i2c_client *client = nct3018y->client;
+	int flags;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CLKO);
+	if (flags < 0)
+		return 0;
+
+	flags &= NCT3018Y_REG_CLKO_F_MASK;
+	return clkout_rates[flags];
+}
+
+static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *prate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] <= rate)
+			return clkout_rates[i];
+
+	return 0;
+}
+
+static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
+	struct i2c_client *client = nct3018y->client;
+	int i, flags;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CLKO);
+	if (flags < 0)
+		return flags;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] == rate) {
+			flags &= ~NCT3018Y_REG_CLKO_F_MASK;
+			flags |= i;
+			return i2c_smbus_write_byte_data(client, NCT3018Y_REG_CLKO, flags);
+		}
+
+	return -EINVAL;
+}
+
+static int nct3018y_clkout_control(struct clk_hw *hw, bool enable)
+{
+	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
+	struct i2c_client *client = nct3018y->client;
+	int flags;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CLKO);
+	if (flags < 0)
+		return flags;
+
+
+	if (enable)
+		flags |= NCT3018Y_REG_CLKO_CKE;
+	else
+		flags &= ~NCT3018Y_REG_CLKO_CKE;
+
+	return i2c_smbus_write_byte_data(client, NCT3018Y_REG_CLKO, flags);
+}
+
+static int nct3018y_clkout_prepare(struct clk_hw *hw)
+{
+	return nct3018y_clkout_control(hw, 1);
+}
+
+static void nct3018y_clkout_unprepare(struct clk_hw *hw)
+{
+	nct3018y_clkout_control(hw, 0);
+}
+
+static int nct3018y_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct nct3018y *nct3018y = clkout_hw_to_nct3018y(hw);
+	struct i2c_client *client = nct3018y->client;
+	int flags;
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CLKO);
+	if (flags < 0)
+		return flags;
+
+	return flags & NCT3018Y_REG_CLKO_CKE;
+}
+
+static const struct clk_ops nct3018y_clkout_ops = {
+	.prepare = nct3018y_clkout_prepare,
+	.unprepare = nct3018y_clkout_unprepare,
+	.is_prepared = nct3018y_clkout_is_prepared,
+	.recalc_rate = nct3018y_clkout_recalc_rate,
+	.round_rate = nct3018y_clkout_round_rate,
+	.set_rate = nct3018y_clkout_set_rate,
+};
+
+static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
+{
+	struct i2c_client *client = nct3018y->client;
+	struct device_node *node = client->dev.of_node;
+	struct clk *clk;
+	struct clk_init_data init;
+	int flags, err;
+
+	/* disable the clkout output */
+	flags = 0;
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CLKO, flags);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write oscillator status register\n");
+		return ERR_PTR(err);
+	}
+
+	init.name = "nct3018y-clkout";
+	init.ops = &nct3018y_clkout_ops;
+	init.flags = 0;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+	nct3018y->clkout_hw.init = &init;
+
+	/* optional override of the clockname */
+	of_property_read_string(node, "clock-output-names", &init.name);
+
+	/* register the clock */
+	clk = devm_clk_register(&client->dev, &nct3018y->clkout_hw);
+
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return clk;
+}
+#endif
+
+static const struct rtc_class_ops nct3018y_rtc_ops = {
+	.read_time	= nct3018y_rtc_read_time,
+	.set_time	= nct3018y_rtc_set_time,
+	.read_alarm	= nct3018y_rtc_read_alarm,
+	.set_alarm	= nct3018y_rtc_set_alarm,
+	.alarm_irq_enable = nct3018y_irq_enable,
+	.ioctl		= nct3018y_ioctl,
+};
+
+static int nct3018y_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct nct3018y *nct3018y;
+	int err, flags;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "%s: ENODEV\n", __func__);
+		return -ENODEV;
+	}
+
+	nct3018y = devm_kzalloc(&client->dev, sizeof(struct nct3018y),
+				GFP_KERNEL);
+	if (!nct3018y)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, nct3018y);
+	nct3018y->client = client;
+	device_set_wakeup_capable(&client->dev, 1);
+
+	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
+	if (flags < 0) {
+		dev_err(&client->dev, "%s: read error\n", __func__);
+		return flags;
+	} else if (flags & NCT3018Y_BIT_TWO)
+		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
+
+
+	flags = NCT3018Y_BIT_TWO;
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
+		return err;
+	}
+
+	flags = 0;
+	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
+	if (err < 0) {
+		dev_err(&client->dev, "%s: write error\n", __func__);
+		return err;
+	}
+
+
+	nct3018y->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(nct3018y->rtc))
+		return PTR_ERR(nct3018y->rtc);
+
+	nct3018y->rtc->ops = &nct3018y_rtc_ops;
+	nct3018y->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	nct3018y->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	if (client->irq > 0) {
+		err = devm_request_threaded_irq(&client->dev, client->irq,
+				NULL, nct3018y_irq,
+				IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
+				"nct3018y", client);
+		if (err) {
+			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
+			return err;
+		}
+	}
+
+	return devm_rtc_register_device(nct3018y->rtc);
+
+#ifdef CONFIG_COMMON_CLK
+	/* register clk in common clk framework */
+	nct3018y_clkout_register_clk(nct3018y);
+#endif
+
+	return 0;
+}
+
+static const struct i2c_device_id nct3018y_id[] = {
+	{ "nct3018y", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nct3018y_id);
+
+
+static const struct of_device_id nct3018y_of_match[] = {
+	{ .compatible = "nuvoton,nct3018y" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nct3018y_of_match);
+
+static struct i2c_driver nct3018y_driver = {
+	.driver		= {
+		.name	= "rtc-nct3018y",
+		.of_match_table = of_match_ptr(nct3018y_of_match),
+	},
+	.probe		= nct3018y_probe,
+	.id_table	= nct3018y_id,
+};
+
+module_i2c_driver(nct3018y_driver);
+
+MODULE_AUTHOR("Medad CChien <ctcchien@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NCT3018Y RTC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

