Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2B9BF913
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKM662wvz3fQW
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730860790;
	cv=none; b=ds3IiX/nj9R3qP2jmfdLxGOmdvlqPLjBL9o4LwgtywkXP1nocuxcHM61jID2qYa/U3Mc9Yj5ypgruvHk3A25QQZUYg1zS2g2dA1uv2L8+IyBs7vsw1H/6caOkNURJL9o6YQkOESNsiANzcPkCS3Ih0Y3QbB1zPQeaLHA1D+BXIRYie9sYoQoya/SgQRHESy5k95704H8XvFny17NO0V2Jy9aSr6+1D1wNj2zVyDVEKQWhLnqIG0a+R5kGWV3BdPR7viRc6ReRhgSt8bSVC1Q6o9zwvmUezMMYONZv1llkQzIYAnM7sMqD7DyDW4lPETy+wJe86wDTJgmOXVo3+GnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730860790; c=relaxed/relaxed;
	bh=nwLgXrSP+rtnQKluhexbIX6LlfWEpR4iqUnFHFDxsQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fsTU1FCx5e14YXnFGT4XrSDopEhPC3yUBQBrexk2ricP4D3Q0BcVILwv7yvOuA/el8Q9g5KxTP+OyaJc3l/O9V7RsaL1Z+gxrdrS5aJ8HC/baECkKDpevX2X/kdMCSBM6NTNAsJxXHo2ulPbrP7JogVX74VNMd6WXep+K/ZU/K43VDyGAWb8kl0aagRa86Us0YeMAuESweYakBpFrbibgRCpekgxwzb3SXL1eq95HumThA2O0sLBe8R1jvPWWM0QiOXr92nOtIebPFpK4YMfKhdfuwOmvthPw18sUFxtWpnhIB4zvsZBNVfYfP1DVFbf7ZBng+NQBSGs8fOEPs9HUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ko1aQOw5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ko1aQOw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjqDN71h6z2xqc
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 13:39:48 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so3236974a12.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2024 18:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730860786; x=1731465586; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwLgXrSP+rtnQKluhexbIX6LlfWEpR4iqUnFHFDxsQ4=;
        b=Ko1aQOw5mptH7wTcBLt7Of5Bkv6fpj00+qZTkTFN2d68CkTesXqEY9Qp8bhHt+HGAN
         8h8gTgbL2cubyZ1Uatc8Tz8Fh3u/QIU3ftYNKSOpO8va5GOjC3+KSOXRNyfXShDGd7mi
         FZx6pvNGPLlsK5/jC0SYasoN83Mn0LTMH/bR7v/qP/1ze3NB6US4ToE07Aua9OY91iw1
         8XhdBtV18uV7nCPQ+URTIJiu70FssrA36xZVvNbIkHVZy3AbV7PH0jRkvnl/WepsouBq
         xLgnJWhqBfTNbpDQ8Hd8IFYkqBn05gh5c73wa3mxLoAzLeBL4/8sguWOAhmZSsqatsua
         etgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730860786; x=1731465586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwLgXrSP+rtnQKluhexbIX6LlfWEpR4iqUnFHFDxsQ4=;
        b=lxEMbSwntP8AVNoP7MK+Yx1PzvwIqfnuPfyA5nXZ6gMiWOJxn8yJAdrRp7hRx9fmiL
         2BH0g+4c4XnWvamOJjU4bE1V84jByqoQpEP3fr0CwhrSFbf/zwzJxg7yWLI3SsZ7Tuq5
         AQtectUWrnluoOHSvhkK+OteIvjDTBoVgo9RVET8nvKlvhPqmzL0e2cLIBFDu7sTJt+j
         eR7eXm2dHDvm8k27AMaXeds3ERjzwhOiYV2y8hnGlQK2MhJnrkj1HXvNu/za4sW0vyJB
         9hmLcuNxElBVmTy7DG3OZseQif45rzmWlOhyF8zdBNhkLkVzSxDz4KfhXlkF3Z6hAq/+
         UK2g==
X-Gm-Message-State: AOJu0YwVyqsyvjLCcCoMIULNaJ/AMKERQWlFu1BdKX7o/Y0jfmcl12Gm
	uUJzNNykFlHH5/ff8OxUqoIOLpb76y2scdltAP6EpHthFVqu8YNV
X-Google-Smtp-Source: AGHT+IEoiH9dwm5GKJ3qtm7jYT+JNH8vgXLdIHDA9UzlxCukTBzEr6F5hI2AuRDLGatOplxh2+tdfw==
X-Received: by 2002:a05:6a20:431e:b0:1db:eba6:225 with SMTP id adf61e73a8af0-1dbeba60240mr11286996637.35.1730860785799;
        Tue, 05 Nov 2024 18:39:45 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c39acsm10382484b3a.137.2024.11.05.18.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:39:45 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	marius.cristea@microchip.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Date: Wed,  6 Nov 2024 10:39:16 +0800
Message-Id: <20241106023916.440767-3-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106023916.440767-1-j2anfernee@gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver

NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
independent alarm signals, and the all threshold values could be set for
system protection without any timing delay. It also supports reset input
RSTIN# to recover system from a fault condition.

Currently, only single-edge mode conversion and threshold events support.

Signed-off-by: Eason Yang <j2anfernee@gmail.com>
---
 MAINTAINERS               |   1 +
 drivers/iio/adc/Kconfig   |   9 +
 drivers/iio/adc/Makefile  |   1 +
 drivers/iio/adc/nct720x.c | 617 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 628 insertions(+)
 create mode 100644 drivers/iio/adc/nct720x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 68570c58e7aa..9940de0ddca2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2753,6 +2753,7 @@ F:	arch/arm/mach-npcm/
 F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*/*npcm*
 F:	drivers/*/*npcm*
+F:	drivers/iio/adc/nct720x.c
 F:	drivers/rtc/rtc-nct3018y.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 6c4e74420fd2..adbbf0ca6f57 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1008,6 +1008,15 @@ config NAU7802
 	  To compile this driver as a module, choose M here: the
 	  module will be called nau7802.
 
+config NCT720X
+	tristate "Nuvoton Instruments NCT7201 and NCT7202 Power Monitor"
+	depends on I2C
+	help
+	  If you say yes here you get support for the Nuvoton NCT7201 and
+	  NCT7202 Voltage Monitor.
+	  This driver can also be built as a module. If so, the module
+	  will be called nct720x.
+
 config NPCM_ADC
 	tristate "Nuvoton NPCM ADC driver"
 	depends on ARCH_NPCM || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 7b91cd98c0e0..f53318e5aa04 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
 obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
+obj-$(CONFIG_NCT720X) += nct720x.o
 obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
 obj-$(CONFIG_PAC1921) += pac1921.o
 obj-$(CONFIG_PAC1934) += pac1934.o
diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
new file mode 100644
index 000000000000..e589479fd06e
--- /dev/null
+++ b/drivers/iio/adc/nct720x.c
@@ -0,0 +1,617 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
+ *
+ * Copyright (c) 2022 Nuvoton Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+#define REG_CHIP_ID			0xFD
+#define NCT720X_ID			0xD7
+#define REG_VENDOR_ID			0xFE
+#define NUVOTON_ID			0x50
+#define REG_DEVICE_ID			0xFF
+#define NCT720X_DEVICE_ID		0x12
+#define VIN_MAX				12	/* Counted from 1 */
+#define NCT7201_VIN_MAX			8
+#define NCT7202_VIN_MAX			12
+#define NCT720X_IN_SCALING		4995
+
+#define REG_INTERRUPT_STATUS_1		0x0C
+#define REG_INTERRUPT_STATUS_2		0x0D
+#define REG_VOLT_LOW_BYTE		0x0F
+#define REG_CONFIGURATION		0x10
+#define  CONFIGURATION_START		BIT(0)
+#define  CONFIGURATION_ALERT_MSK	BIT(1)
+#define  CONFIGURATION_CONV_RATE	BIT(2)
+#define  CONFIGURATION_INIT		BIT(7)
+
+#define REG_ADVANCED_CONFIGURATION	0x11
+#define  ADVANCED_CONF_MOD_ALERT	BIT(0)
+#define  ADVANCED_CONF_MOD_STS		BIT(1)
+#define  ADVANCED_CONF_FAULT_QUEUE	BIT(2)
+#define  ADVANCED_CONF_EN_DEEP_SHUTDOWN	BIT(4)
+#define  ADVANCED_CONF_EN_SMB_TIMEOUT	BIT(5)
+#define  ADVANCED_CONF_MOD_RSTIN	BIT(7)
+
+#define REG_CHANNEL_INPUT_MODE		0x12
+#define REG_CHANNEL_ENABLE_1		0x13
+#define REG_CHANNEL_ENABLE_2		0x14
+#define REG_INTERRUPT_MASK_1		0x15
+#define REG_INTERRUPT_MASK_2		0x16
+#define REG_BUSY_STATUS			0x1E
+#define REG_ONE_SHOT			0x1F
+#define REG_SMUS_ADDRESS		0xFC
+
+static const u8 REG_VIN[VIN_MAX] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+				     0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B};
+static const u8 REG_VIN_HIGH_LIMIT[VIN_MAX] = { 0x20, 0x22, 0x24, 0x26, 0x28, 0x2A,
+						0x2C, 0x2E, 0x30, 0x32, 0x34, 0x36};
+static const u8 REG_VIN_LOW_LIMIT[VIN_MAX] = { 0x21, 0x23, 0x25, 0x27, 0x29, 0x2B,
+					       0x2D, 0x2F, 0x31, 0x33, 0x35, 0x37};
+static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] = { 0x40, 0x42, 0x44, 0x46, 0x48, 0x4A,
+						    0x4C, 0x4E, 0x50, 0x52, 0x54, 0x56};
+static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] = { 0x41, 0x43, 0x45, 0x47, 0x49, 0x4B,
+						   0x4D, 0x4F, 0x51, 0x53, 0x55, 0x57};
+static u8 nct720x_chan_to_index[] = {
+	0,	/* Not used */
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
+};
+
+
+/* List of supported devices */
+enum nct720x_chips {
+	nct7201, nct7202
+};
+
+struct nct720x_chip_info {
+	struct i2c_client	*client;
+	enum nct720x_chips	type;
+	struct mutex		access_lock;	/* for multi-byte read and write operations */
+	int vin_max;				/* number of VIN channels */
+	u32 vin_mask;
+	bool use_read_byte_vin;
+};
+
+static const struct iio_event_spec nct720x_events[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	}, {
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+#define NCT720X_VOLTAGE_CHANNEL(chan, addr)				\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = chan,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),	\
+		.address = addr,					\
+		.event_spec = nct720x_events,				\
+		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
+	}
+
+#define NCT720X_VOLTAGE_CHANNEL_DIFF(chan1, chan2, addr)		\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = (chan1),					\
+		.channel2 = (chan2),					\
+		.differential = 1,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),	\
+		.address = addr,					\
+		.event_spec = nct720x_events,				\
+		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
+	}
+
+static const struct iio_chan_spec nct720x_channels[] = {
+	NCT720X_VOLTAGE_CHANNEL(1, 1),
+	NCT720X_VOLTAGE_CHANNEL(2, 2),
+	NCT720X_VOLTAGE_CHANNEL(3, 3),
+	NCT720X_VOLTAGE_CHANNEL(4, 4),
+	NCT720X_VOLTAGE_CHANNEL(5, 5),
+	NCT720X_VOLTAGE_CHANNEL(6, 6),
+	NCT720X_VOLTAGE_CHANNEL(7, 7),
+	NCT720X_VOLTAGE_CHANNEL(8, 8),
+	NCT720X_VOLTAGE_CHANNEL(9, 9),
+	NCT720X_VOLTAGE_CHANNEL(10, 10),
+	NCT720X_VOLTAGE_CHANNEL(11, 11),
+	NCT720X_VOLTAGE_CHANNEL(12, 12),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),
+};
+
+/* Read 1-byte register. Returns unsigned byte data or -ERRNO on error. */
+static int nct720x_read_reg(struct nct720x_chip_info *chip, u8 reg)
+{
+	struct i2c_client *client = chip->client;
+
+	return i2c_smbus_read_byte_data(client, reg);
+}
+
+/* Read 1-byte register. Returns unsigned word data or -ERRNO on error. */
+static int nct720x_read_word_swapped_reg(struct nct720x_chip_info *chip, u8 reg)
+{
+	struct i2c_client *client = chip->client;
+
+	return i2c_smbus_read_word_swapped(client, reg);
+}
+
+/*
+ * Read 2-byte register. Returns register in big-endian format or
+ * -ERRNO on error.
+ */
+static int nct720x_read_reg16(struct nct720x_chip_info *chip, u8 reg)
+{
+	struct i2c_client *client = chip->client;
+	int ret, low;
+
+	mutex_lock(&chip->access_lock);
+	ret = i2c_smbus_read_byte_data(client, reg);
+	if (ret >= 0) {
+		low = ret;
+		ret = i2c_smbus_read_byte_data(client, reg + 1);
+		if (ret >= 0)
+			ret = low | (ret << 8);
+	}
+
+	mutex_unlock(&chip->access_lock);
+	return ret;
+}
+
+/* Write 1-byte register. Returns 0 or -ERRNO on error. */
+static int nct720x_write_reg(struct nct720x_chip_info *chip, u8 reg, u8 val)
+{
+	struct i2c_client *client = chip->client;
+	int err;
+
+	err = i2c_smbus_write_byte_data(client, reg, val);
+	/* wait for write command to be finished */
+	mdelay(10);
+
+	return err;
+}
+
+static int nct720x_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	int index = nct720x_chan_to_index[chan->address];
+	int v1, v2, volt, err;
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_PROCESSED:
+		mutex_lock(&chip->access_lock);
+		if (chip->use_read_byte_vin) {
+			/*
+			 * MNTVIN Low Byte together with MNTVIN High Byte
+			 * forms the 13-bit count value. If MNTVIN High
+			 * Byte readout is read successively, the
+			 * NCT7201/NCT7202 will latch the MNTVIN Low Byte
+			 * for next read.
+			 */
+			v1 = nct720x_read_reg(chip, REG_VIN[index]);
+			if (v1 < 0) {
+				err = v1;
+				goto abort;
+			}
+
+			v2 = nct720x_read_reg(chip, REG_VOLT_LOW_BYTE);
+			if (v2 < 0) {
+				err = v2;
+				goto abort;
+			}
+			volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */
+		} else {
+			/* NCT7201/NCT7202 also supports read word-size data */
+			volt = nct720x_read_word_swapped_reg(chip, REG_VIN[index]);
+		}
+
+		/* Voltage(V) = 13bitCountValue * 0.0004995 */
+		volt = (volt >> 3) * NCT720X_IN_SCALING;
+		*val = volt / 10000;
+		mutex_unlock(&chip->access_lock);
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+abort:
+	mutex_unlock(&chip->access_lock);
+	return err;
+}
+
+static int nct720x_read_event_value(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    enum iio_event_type type,
+				    enum iio_event_direction dir,
+				    enum iio_event_info info,
+				    int *val, int *val2)
+{
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+	int v1, v2, err;
+	int volt = 0;
+	int index = nct720x_chan_to_index[chan->address];
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info == IIO_EV_INFO_VALUE) {
+		if (dir == IIO_EV_DIR_FALLING) {
+			if (chip->use_read_byte_vin) {
+				/*
+				 * Low limit VIN Low Byte together with Low limit VIN High Byte
+				   forms the 13-bit count value
+				 */
+				mutex_lock(&chip->access_lock);
+				v1 = nct720x_read_reg(chip, REG_VIN_LOW_LIMIT[index]);
+				if (v1 < 0) {
+					err = v1;
+					goto abort;
+				}
+
+				v2 = nct720x_read_reg(chip, REG_VIN_LOW_LIMIT_LSB[index]);
+				if (v2 < 0) {
+					err = v2;
+					goto abort;
+				}
+				mutex_unlock(&chip->access_lock);
+				volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */
+			} else {
+				/* NCT7201/NCT7202 also supports read word-size data */
+				volt = nct720x_read_word_swapped_reg(chip,
+					REG_VIN_LOW_LIMIT[index]);
+			}
+		} else {
+			if (chip->use_read_byte_vin) {
+				/*
+				 * High limit VIN Low Byte together with high limit VIN High Byte
+				 * forms the 13-bit count value
+				 */
+				mutex_lock(&chip->access_lock);
+				v1 = nct720x_read_reg(chip, REG_VIN_HIGH_LIMIT[index]);
+				if (v1 < 0) {
+					err = v1;
+					goto abort;
+				}
+
+				v2 = nct720x_read_reg(chip, REG_VIN_HIGH_LIMIT_LSB[index]);
+				if (v2 < 0) {
+					err = v2;
+					goto abort;
+				}
+				mutex_unlock(&chip->access_lock);
+				volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */
+			} else {
+				/* NCT7201/NCT7202 also supports read word-size data */
+				volt = nct720x_read_word_swapped_reg(chip,
+					REG_VIN_HIGH_LIMIT[index]);
+			}
+		}
+	}
+	/* Voltage(V) = 13bitCountValue * 0.0004995 */
+	volt = (volt >> 3) * NCT720X_IN_SCALING;
+	*val = volt / 10000;
+
+	return IIO_VAL_INT;
+abort:
+	mutex_unlock(&chip->access_lock);
+	return err;
+}
+
+static int nct720x_write_event_value(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir,
+				     enum iio_event_info info,
+				     int val, int val2)
+{
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+	int index, err = 0;
+	long v1, v2, volt;
+
+	index = nct720x_chan_to_index[chan->address];
+	volt = (val * 10000) / NCT720X_IN_SCALING;
+	v1 = volt >> 5;
+	v2 = (volt & 0x1f) << 3;
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info == IIO_EV_INFO_VALUE) {
+		if (dir == IIO_EV_DIR_FALLING) {
+			mutex_lock(&chip->access_lock);
+			err = nct720x_write_reg(chip, REG_VIN_LOW_LIMIT[index], v1);
+			if (err < 0) {
+				pr_err("Failed to write REG_VIN%d_LOW_LIMIT\n", index + 1);
+				goto abort;
+			}
+
+			err = nct720x_write_reg(chip, REG_VIN_LOW_LIMIT_LSB[index], v2);
+			if (err < 0) {
+				pr_err("Failed to write REG_VIN%d_LOW_LIMIT_LSB\n", index + 1);
+				goto abort;
+			}
+		} else {
+			mutex_lock(&chip->access_lock);
+			err = nct720x_write_reg(chip, REG_VIN_HIGH_LIMIT[index], v1);
+			if (err < 0) {
+				pr_err("Failed to write REG_VIN%d_HIGH_LIMIT\n", index + 1);
+				goto abort;
+			}
+
+			err = nct720x_write_reg(chip, REG_VIN_HIGH_LIMIT_LSB[index], v2);
+			if (err < 0) {
+				pr_err("Failed to write REG_VIN%d_HIGH_LIMIT_LSB\n", index + 1);
+				goto abort;
+			}
+		}
+	}
+abort:
+	mutex_unlock(&chip->access_lock);
+	return err;
+}
+
+static int nct720x_read_event_config(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir)
+{
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+	int index = nct720x_chan_to_index[chan->address];
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	return !!(chip->vin_mask & BIT(index));
+}
+
+static int nct720x_write_event_config(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      enum iio_event_type type,
+				      enum iio_event_direction dir,
+				      int state)
+{
+	int err = 0;
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+	int index = nct720x_chan_to_index[chan->address];
+	unsigned int mask;
+
+	mask = BIT(index);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (!state && (chip->vin_mask & mask))
+		chip->vin_mask &= ~mask;
+	else if (state && !(chip->vin_mask & mask))
+		chip->vin_mask |= mask;
+
+	mutex_lock(&chip->access_lock);
+
+	err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, chip->vin_mask & 0xff);
+	if (err < 0) {
+		pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
+		goto abort;
+	}
+
+	if (chip->type == nct7202) {
+		err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, chip->vin_mask >> 8);
+		if (err < 0) {
+			pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
+			goto abort;
+		}
+	}
+abort:
+	mutex_unlock(&chip->access_lock);
+	return err;
+}
+
+static int nct720x_detect(struct i2c_client *client,
+			  struct i2c_board_info *info)
+{
+	struct i2c_adapter *adapter = client->adapter;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	/* Determine the chip type. */
+	if (i2c_smbus_read_byte_data(client, REG_VENDOR_ID) != NUVOTON_ID ||
+	    i2c_smbus_read_byte_data(client, REG_CHIP_ID) != NCT720X_ID ||
+	    i2c_smbus_read_byte_data(client, REG_DEVICE_ID) != NCT720X_DEVICE_ID)
+		return -ENODEV;
+
+	strscpy(info->type, "nct720x", I2C_NAME_SIZE);
+
+	return 0;
+}
+
+static const struct iio_info nct720x_info = {
+	.read_raw = &nct720x_read_raw,
+	.read_event_config = &nct720x_read_event_config,
+	.write_event_config = &nct720x_write_event_config,
+	.read_event_value = &nct720x_read_event_value,
+	.write_event_value = &nct720x_write_event_value,
+};
+
+static const struct i2c_device_id nct720x_id[];
+
+static int nct720x_init_chip(struct nct720x_chip_info *chip)
+{
+	int value = 0;
+	int err = 0;
+
+	/* Initial reset */
+	err = nct720x_write_reg(chip, REG_CONFIGURATION, CONFIGURATION_INIT);
+	if (err) {
+		pr_err("Failed to write REG_CONFIGURATION\n");
+		return err;
+	}
+
+	/* Enable Channel */
+	err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, 0xff);
+	if (err) {
+		pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
+		return err;
+	}
+
+	if (chip->type == nct7202) {
+		err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, 0xf);
+		if (err) {
+			pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
+			return err;
+		}
+	}
+
+	value = nct720x_read_reg16(chip, REG_CHANNEL_ENABLE_1);
+	if (value < 0)
+		return value;
+	chip->vin_mask = value;
+
+	/* Start monitoring if needed */
+	value = nct720x_read_reg(chip, REG_CONFIGURATION);
+	if (value < 0) {
+		pr_err("Failed to read REG_CONFIGURATION\n");
+		return value;
+	}
+
+	value |= CONFIGURATION_START;
+	err = nct720x_write_reg(chip, REG_CONFIGURATION, value);
+	if (err < 0) {
+		pr_err("Failed to write REG_CONFIGURATION\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int nct720x_probe(struct i2c_client *client)
+{
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	struct nct720x_chip_info *chip;
+	struct iio_dev *indio_dev;
+	int ret;
+	u32 tmp;
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
+	if (!indio_dev)
+		return -ENOMEM;
+	chip = iio_priv(indio_dev);
+
+	if (client->dev.of_node)
+		chip->type = (enum nct720x_chips)device_get_match_data(&client->dev);
+	else
+		chip->type = i2c_match_id(nct720x_id, client)->driver_data;
+
+	chip->vin_max = (chip->type == nct7201) ? NCT7201_VIN_MAX : NCT7202_VIN_MAX;
+
+	ret = of_property_read_u32(client->dev.of_node, "read-vin-data-size", &tmp);
+	if (ret < 0) {
+		pr_err("read-vin-data-size property not found\n");
+		return ret;
+	}
+
+	if (tmp == 8) {
+		chip->use_read_byte_vin = true;
+	} else if (tmp == 16) {
+		chip->use_read_byte_vin = false;
+	} else {
+		pr_err("invalid read-vin-data-size (%d)\n", tmp);
+		return -EINVAL;
+	}
+
+	mutex_init(&chip->access_lock);
+
+	/* this is only used for device removal purposes */
+	i2c_set_clientdata(client, indio_dev);
+
+	chip->client = client;
+
+	ret = nct720x_init_chip(chip);
+	if (ret < 0)
+		return ret;
+
+	indio_dev->name = id->name;
+	indio_dev->channels = nct720x_channels;
+	indio_dev->num_channels = ARRAY_SIZE(nct720x_channels);
+	indio_dev->info = &nct720x_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	iio_device_register(indio_dev);
+
+	return 0;
+}
+
+static void nct720x_remove(struct i2c_client *client)
+{
+	struct iio_dev *indio_dev = i2c_get_clientdata(client);
+
+	iio_device_unregister(indio_dev);
+}
+
+static const unsigned short nct720x_address_list[] = {
+	0x1d, 0x1e, 0x35, 0x36, I2C_CLIENT_END
+};
+
+static const struct i2c_device_id nct720x_id[] = {
+	{ "nct7201", nct7201 },
+	{ "nct7202", nct7202 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, nct720x_id);
+
+static const struct of_device_id nct720x_of_match[] = {
+	{
+		.compatible = "nuvoton,nct7201",
+		.data = (void *)nct7201
+	},
+	{
+		.compatible = "nuvoton,nct7202",
+		.data = (void *)nct7202
+	},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, nct720x_of_match);
+
+static struct i2c_driver nct720x_driver = {
+	.driver = {
+		.name	= "nct720x",
+		.of_match_table = nct720x_of_match,
+	},
+	.probe = nct720x_probe,
+	.remove = nct720x_remove,
+	.id_table = nct720x_id,
+	.detect = nct720x_detect,
+	.address_list = nct720x_address_list,
+};
+
+module_i2c_driver(nct720x_driver);
+
+MODULE_AUTHOR("Eason Yang <YHYANG2@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

