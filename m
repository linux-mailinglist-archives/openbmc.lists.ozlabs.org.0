Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF99E2F39
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 23:47:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2wkH0yQ1z3bbS
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 09:46:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733217385;
	cv=none; b=G4MPrWGvlrxVwAKTfWevI5GJgfU83u2rTVcGxKSO8sNtUlRukZWTcbVO7BTYx6fYhxtkt5BjeuGl9qM5I0CiGceu+UPDY2UXwBhOFRJI5QvhP602bUWm8ByjlZhZ4s5ok05ATQU9skOgJfqSjao+tKtkrfikkIU8NN86ZJYpLmk/FqSljqLb0rSFg6ota4h3xc/iSV5imzK+NZkWMBPjcHdmMTDqBGWx1Yp2yR5jP6yyhFW3zBSevshybOKz75nm9dbZu2hHMQwrjJYT3JvmrsxDfE2g/xGpSnvjtw+O9TSW0QgPShWDXGxuNDIRaz1IsE6eljIyrmXXvI6BXwTd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733217385; c=relaxed/relaxed;
	bh=jLO3L7nytEwdUPQXYW3PGHVT20sNDP9PKmw6CFL3HG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFdhPZADgykl7Iww56RnL2nLn2PUaFpKBm4IJwusW8STVQ5J+zyxUAs3Gvb6Y3lyOZdjeNs017BGKwspof6cJeIlZ9NedhHJZ23T6W7kmeyWjlrL+yzebPhupGXGfhzFp65QFJ1jWXUry5xrP7TxmPb3lINSTJYUz8UGNDZVmI0HQIEON46L+9/nYCtflwbxl3X5zt28IjiFaSW6KA8xQudkeMN+JMlD6YY0olwAu1ERakJk3kky9OuhEedpX5xpacb4j2QrQJb5n5n8ycVarlN8lcNlKvkmD8p70ly5VVk9btFQ6wdAICOsU/FB6NTR0GRKZabmYFVSG43+6UI+Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fHl8wAOK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fHl8wAOK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2ZlX29syz2ymH
	for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2024 20:16:24 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7251331e756so4978451b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 01:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733217381; x=1733822181; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLO3L7nytEwdUPQXYW3PGHVT20sNDP9PKmw6CFL3HG8=;
        b=fHl8wAOKtOr0dWv8Mf3+CjyMRo1EbeXTCJBMs52EMNFXHZdBaY1b6HguayLOPyya0L
         uUuu0oXj8qi7RrKGRRt9KwaZZiwDG4ws7awv989qe48HRIZ1km1Z2tjhZnnvJm1UoTbm
         UuJPPjhWE+nqKnp8ZxCipKHWRp2OtyD1AeBA1O2NYoCOv+59nqPGoa0po2d/yF/VCVIP
         aewycAWN+X+1Ai00QEvZBlMLcD2VpP9NN0MS3HsJ5unDloF8X/tzBEGFg958Zl2Zigd5
         4k0GeiOLIdIzn47xoxSyO7poYQhDfBXMK3hkY2+fUPLLqJ8NN1eX0/ulCKzxjVgGaFlf
         8qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217381; x=1733822181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLO3L7nytEwdUPQXYW3PGHVT20sNDP9PKmw6CFL3HG8=;
        b=k4FbOFw7kYCzK/eTsRxcHOI0JQ2+eDQMqmstI3OmFnsqrryFlzt1+V1jGgLftVBqfm
         e3TIcUvoFJqCRYH4GrxM1P9FZc+FogJ14Vb8aVzMm35JBpK9wFbpkk2yvWWxuKeBUBov
         J7w3sFH+tOqRHfsm8AHYEya/4c/3hbpu72QXvuoLFxRuK+VNO5SLBidC6Q7z5Pe83C58
         n/8XpGcyU6zjoTpjXFH/9ednBL75Z1I2YvwVqqcS71K3oHB0wfenpre1Os7yqO8Z9Zcv
         1KS0slyiRiMKDW71TytrIKWZHux/qXZloGCnbr3Lwm6JzDzJYoLJB+m0GvNzT08pW7YH
         9FOg==
X-Gm-Message-State: AOJu0YzWd6BjLTSEhAHgbgm0eLfeo7ZYttNNdN7/xbsmE6CWWbF5cPLU
	lFLh5+kby1JqJHon7NQ3J9NjMZQYi+dKRAGdV4I9BVbopwV6xl/b
X-Gm-Gg: ASbGncuG/WSqRXDWmzx+J63iaOT4yGaUYXrr68mtyj9jArGATDR/AraJrAW6Ktvexen
	84lgGvfSCtRZGjNeg0GNnhsaXz7wZ5/aeErb9Rfpss/GVMj/8CHRh2xX+rS4eYJ8rxKqA0EoZlC
	U+ZwHe4pRI+7u3Ts/eUfXXeeSjWSgx/eugm/RTP1gbvQoM1i8e6zbZ+uVb6EQoGQfs1xT6rrNEo
	amFYNsKbF4kvgj/A+IY5uXM+RXF4OFm+F6p/fEthVvjF23uOAjxeC44clva1Jn7QyWdNvfaMkWh
	1beQxX8KQiD4GjQ=
X-Google-Smtp-Source: AGHT+IHsayVSxlEyGkUvLBjq4qeYZDIh8tosu2mObBPBIBoWPKbriLMO/LM6leWr6lecQtcXA19Gtw==
X-Received: by 2002:a17:90b:3ecb:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-2ef011e3749mr2379921a91.2.1733217381069;
        Tue, 03 Dec 2024 01:16:21 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee566a9a34sm7713069a91.51.2024.12.03.01.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:16:20 -0800 (PST)
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
	andriy.shevchenko@linux.intel.com,
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	gstols@baylibre.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Date: Tue,  3 Dec 2024 17:15:40 +0800
Message-Id: <20241203091540.3695650-3-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203091540.3695650-1-j2anfernee@gmail.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:46:15 +1100
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
 drivers/iio/adc/Kconfig   |  10 +
 drivers/iio/adc/Makefile  |   1 +
 drivers/iio/adc/nct720x.c | 533 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 545 insertions(+)
 create mode 100644 drivers/iio/adc/nct720x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bea10a846475..573b12f0cd4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2799,6 +2799,7 @@ F:	arch/arm/mach-npcm/
 F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*/*npcm*
 F:	drivers/*/*npcm*
+F:	drivers/iio/adc/nct720x.c
 F:	drivers/rtc/rtc-nct3018y.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 849c90203071..6eed518efa1c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1048,6 +1048,16 @@ config NAU7802
 	  To compile this driver as a module, choose M here: the
 	  module will be called nau7802.
 
+config NCT720X
+	tristate "Nuvoton Instruments NCT7201 and NCT7202 Power Monitor"
+	depends on I2C
+	select REGMAP_I2C
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
index ee19afba62b7..89f5b5d1a567 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
 obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
+obj-$(CONFIG_NCT720X) += nct720x.o
 obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
 obj-$(CONFIG_PAC1921) += pac1921.o
 obj-$(CONFIG_PAC1934) += pac1934.o
diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
new file mode 100644
index 000000000000..b28b5f4d7d70
--- /dev/null
+++ b/drivers/iio/adc/nct720x.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
+ *
+ * Copyright (c) 2024 Nuvoton Inc.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+
+#define VIN_MAX					12	/* Counted from 1 */
+#define NCT720X_IN_SCALING			4995
+#define NCT720X_IN_SCALING_FACTOR		10000
+
+#define REG_INTERRUPT_STATUS_1			0x0C
+#define REG_INTERRUPT_STATUS_2			0x0D
+#define REG_VOLT_LOW_BYTE			0x0F
+#define REG_CONFIGURATION			0x10
+#define  BIT_CONFIGURATION_START		BIT(0)
+#define  BIT_CONFIGURATION_ALERT_MSK		BIT(1)
+#define  BIT_CONFIGURATION_CONV_RATE		BIT(2)
+#define  BIT_CONFIGURATION_RESET		BIT(7)
+
+#define REG_ADVANCED_CONFIGURATION		0x11
+#define  BIT_ADVANCED_CONF_MOD_ALERT		BIT(0)
+#define  BIT_ADVANCED_CONF_MOD_STS		BIT(1)
+#define  BIT_ADVANCED_CONF_FAULT_QUEUE		BIT(2)
+#define  BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN	BIT(4)
+#define  BIT_ADVANCED_CONF_EN_SMB_TIMEOUT	BIT(5)
+#define  BIT_ADVANCED_CONF_MOD_RSTIN		BIT(7)
+
+#define REG_CHANNEL_INPUT_MODE			0x12
+#define REG_CHANNEL_ENABLE_1			0x13
+#define  REG_CHANNEL_ENABLE_1_MASK		GENMASK(7, 0)
+#define REG_CHANNEL_ENABLE_2			0x14
+#define  REG_CHANNEL_ENABLE_2_MASK		GENMASK(3, 0)
+#define REG_INTERRUPT_MASK_1			0x15
+#define REG_INTERRUPT_MASK_2			0x16
+#define REG_BUSY_STATUS				0x1E
+#define  BIT_BUSY				BIT(0)
+#define  BIT_PWR_UP				BIT(1)
+#define REG_ONE_SHOT				0x1F
+#define REG_SMUS_ADDRESS			0xFC
+#define REG_VIN_LIMIT_LSB_MASK			GENMASK(4, 0)
+
+static const u8 REG_VIN[VIN_MAX] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,	/* 0 -7 */
+	0x08, 0x09, 0x0A, 0x0B,				/* 8 - 11 */
+};
+static const u8 REG_VIN_HIGH_LIMIT[VIN_MAX] = {
+	0x20, 0x22, 0x24, 0x26, 0x28, 0x2A, 0x2C, 0x2E,
+	0x30, 0x32, 0x34, 0x36,
+};
+static const u8 REG_VIN_LOW_LIMIT[VIN_MAX] = {
+	0x21, 0x23, 0x25, 0x27, 0x29, 0x2B, 0x2D, 0x2F,
+	0x31, 0x33, 0x35, 0x37,
+};
+static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] = {
+	0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,
+	0x50, 0x52, 0x54, 0x56,
+};
+static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] = {
+	0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F,
+	0x51, 0x53, 0x55, 0x57,
+};
+static u8 nct720x_chan_to_index[] = {
+	0 /* Not used */, 0, 1, 2, 3, 4, 5, 6,
+	7, 8, 9, 10, 11,
+};
+
+struct nct720x_chip_info {
+	struct i2c_client *client;
+	struct mutex access_lock;	/* for multi-byte read and write operations */
+	struct regmap *regmap;
+	struct regmap *regmap16;
+	int vin_max;			/* number of VIN channels */
+	u32 vin_mask;
+};
+
+struct nct720x_adc_model_data {
+	const char *model_name;
+	const struct iio_chan_spec *channels;
+	const int num_channels;
+	int vin_max;
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
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
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
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.address = addr,					\
+		.event_spec = nct720x_events,				\
+		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
+	}
+
+static const struct iio_chan_spec nct7201_channels[] = {
+	NCT720X_VOLTAGE_CHANNEL(1, 1),
+	NCT720X_VOLTAGE_CHANNEL(2, 2),
+	NCT720X_VOLTAGE_CHANNEL(3, 3),
+	NCT720X_VOLTAGE_CHANNEL(4, 4),
+	NCT720X_VOLTAGE_CHANNEL(5, 5),
+	NCT720X_VOLTAGE_CHANNEL(6, 6),
+	NCT720X_VOLTAGE_CHANNEL(7, 7),
+	NCT720X_VOLTAGE_CHANNEL(8, 8),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
+	NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
+};
+
+static const struct iio_chan_spec nct7202_channels[] = {
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
+static int nct720x_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	int index = nct720x_chan_to_index[chan->address];
+	u16 volt;
+	unsigned int value;
+	int err;
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&chip->access_lock);
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		err = regmap_read(chip->regmap16, REG_VIN[index], &value);
+		if (err < 0)
+			return err;
+		volt = (u16)value;
+		*val = volt >> 3;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		/* From the datasheet, we have to multiply by 0.0004995 */
+		*val = 0;
+		*val2 = 499500;
+		return IIO_VAL_INT_PLUS_NANO;
+	default:
+		return -EINVAL;
+	}
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
+	u16 volt;
+	unsigned int value;
+	int tmp, err;
+	int index = nct720x_chan_to_index[chan->address];
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info != IIO_EV_INFO_VALUE)
+		return -EINVAL;
+
+	if (dir == IIO_EV_DIR_FALLING) {
+		err = regmap_read(chip->regmap16, REG_VIN_LOW_LIMIT[index], &value);
+		if (err < 0)
+			return err;
+		volt = (u16)value;
+	} else {
+		err = regmap_read(chip->regmap16, REG_VIN_HIGH_LIMIT[index], &value);
+		if (err < 0)
+			return err;
+		volt = (u16)value;
+	}
+
+	/* Voltage(V) = 13bitCountValue * 0.0004995 */
+	tmp = (volt >> 3) * NCT720X_IN_SCALING;
+	*val = tmp / NCT720X_IN_SCALING_FACTOR;
+
+	return IIO_VAL_INT;
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
+	volt = (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING;
+	v1 = volt >> 5;
+	v2 = (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info == IIO_EV_INFO_VALUE) {
+		if (dir == IIO_EV_DIR_FALLING) {
+			guard(mutex)(&chip->access_lock);
+			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT[index], v1);
+			if (err < 0)
+				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT\n",
+					index + 1);
+
+			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT_LSB[index], v2);
+			if (err < 0)
+				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT_LSB\n",
+					index + 1);
+
+		} else {
+			guard(mutex)(&chip->access_lock);
+			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT[index], v1);
+			if (err < 0)
+				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT\n",
+					index + 1);
+
+			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT_LSB[index], v2);
+			if (err < 0)
+				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT_LSB\n",
+					index + 1);
+		}
+	}
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
+				      bool state)
+{
+	int err = 0;
+	struct nct720x_chip_info *chip = iio_priv(indio_dev);
+	int index = nct720x_chan_to_index[chan->address];
+	unsigned int mask;
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	mask = BIT(index);
+
+	if (!state && (chip->vin_mask & mask))
+		chip->vin_mask &= ~mask;
+	else if (state && !(chip->vin_mask & mask))
+		chip->vin_mask |= mask;
+
+	guard(mutex)(&chip->access_lock);
+
+	err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1,
+			   chip->vin_mask & REG_CHANNEL_ENABLE_1_MASK);
+	if (err < 0)
+		dev_err(&indio_dev->dev, "Failed to write REG_CHANNEL_ENABLE_1\n");
+
+	if (chip->vin_max == 12) {
+		err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, chip->vin_mask >> 8);
+		if (err < 0)
+			dev_err(&indio_dev->dev, "Failed to write REG_CHANNEL_ENABLE_2\n");
+	}
+	return err;
+}
+
+static const struct iio_info nct720x_info = {
+	.read_raw = nct720x_read_raw,
+	.read_event_config = nct720x_read_event_config,
+	.write_event_config = nct720x_write_event_config,
+	.read_event_value = nct720x_read_event_value,
+	.write_event_value = nct720x_write_event_value,
+};
+
+static const struct nct720x_adc_model_data nct7201_model_data = {
+	.model_name = "nct7201",
+	.channels = nct7201_channels,
+	.num_channels = ARRAY_SIZE(nct7201_channels),
+	.vin_max = 8,
+};
+
+static const struct nct720x_adc_model_data nct7202_model_data = {
+	.model_name = "nct7202",
+	.channels = nct7202_channels,
+	.num_channels = ARRAY_SIZE(nct7202_channels),
+	.vin_max = 12,
+};
+
+static int nct720x_init_chip(struct nct720x_chip_info *chip)
+{
+	u8 data[2];
+	unsigned int value;
+	int err;
+
+	err = regmap_write(chip->regmap, REG_CONFIGURATION, BIT_CONFIGURATION_RESET);
+	if (err) {
+		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
+		return err;
+	}
+
+	/*
+	 * After about 25 msecs, the device should be ready and then
+	 * the Power Up bit will be set to 1. If not, wait for it.
+	 */
+	mdelay(25);
+	err  = regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
+	if (err < 0)
+		return err;
+	if (!(value & BIT_PWR_UP))
+		return err;
+
+	/* Enable Channel */
+	err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1, REG_CHANNEL_ENABLE_1_MASK);
+	if (err) {
+		dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_1\n");
+		return err;
+	}
+
+	if (chip->vin_max == 12) {
+		err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, REG_CHANNEL_ENABLE_2_MASK);
+		if (err) {
+			dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_2\n");
+			return err;
+		}
+	}
+
+	guard(mutex)(&chip->access_lock);
+	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
+	if (err < 0)
+		return err;
+	data[0] = (u8)value;
+
+	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
+	if (err < 0)
+		return err;
+	data[1] = (u8)value;
+
+	value = get_unaligned_le16(data);
+	chip->vin_mask = value;
+
+	/* Start monitoring if needed */
+	err = regmap_read(chip->regmap, REG_CONFIGURATION, &value);
+	if (err < 0) {
+		dev_err(&chip->client->dev, "Failed to read REG_CONFIGURATION\n");
+		return value;
+	}
+
+	value |= BIT_CONFIGURATION_START;
+	err = regmap_write(chip->regmap, REG_CONFIGURATION, value);
+	if (err < 0) {
+		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct regmap_config nct720x_regmap8_config = {
+	.name = "vin-data-read-byte",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+	.cache_type = REGCACHE_NONE,
+};
+
+static const struct regmap_config nct720x_regmap16_config = {
+	.name = "vin-data-read-word",
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = 0xff,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int nct720x_probe(struct i2c_client *client)
+{
+	const struct nct720x_adc_model_data *model_data;
+	struct nct720x_chip_info *chip;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	model_data = i2c_get_match_data(client);
+	if (!model_data)
+		return -EINVAL;
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
+	if (!indio_dev)
+		return -ENOMEM;
+	chip = iio_priv(indio_dev);
+
+	chip->regmap = devm_regmap_init_i2c(client, &nct720x_regmap8_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+			"Failed to init regmap\n");
+
+	chip->regmap16 = devm_regmap_init_i2c(client, &nct720x_regmap16_config);
+	if (IS_ERR(chip->regmap16))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16),
+			"Failed to init regmap16\n");
+
+	chip->vin_max = model_data->vin_max;
+
+	ret = devm_mutex_init(&client->dev, &chip->access_lock);
+	if (ret)
+		return ret;
+
+	chip->client = client;
+
+	ret = nct720x_init_chip(chip);
+	if (ret < 0)
+		return ret;
+
+	indio_dev->name = model_data->model_name;
+	indio_dev->channels = model_data->channels;
+	indio_dev->num_channels = model_data->num_channels;
+	indio_dev->info = &nct720x_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id nct720x_id[] = {
+	{ "nct7201", (kernel_ulong_t)&nct7201_model_data },
+	{ "nct7202", (kernel_ulong_t)&nct7202_model_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nct720x_id);
+
+static const struct of_device_id nct720x_of_match[] = {
+	{
+		.compatible = "nuvoton,nct7201",
+		.data = &nct7201_model_data,
+	},
+	{
+		.compatible = "nuvoton,nct7202",
+		.data = &nct7202_model_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nct720x_of_match);
+
+static struct i2c_driver nct720x_driver = {
+	.driver = {
+		.name	= "nct720x",
+		.of_match_table = nct720x_of_match,
+	},
+	.probe = nct720x_probe,
+	.id_table = nct720x_id,
+};
+module_i2c_driver(nct720x_driver);
+
+MODULE_AUTHOR("Eason Yang <j2anfernee@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

