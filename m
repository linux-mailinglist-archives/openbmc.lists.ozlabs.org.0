Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB26A41235
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZ237JJz3bwX
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740129004;
	cv=none; b=dhzoOWqgToxWgLhkkeoBqcVnAzgPCiL0OP8kRd6xgVMu6qGr9UH9/dDa1vmcxlxwaFMyUtnxX8NhqccCxw2zi1+p/I13KuyS0lEQvFBySegea6H3WtBk+XV3rYPFQanbesO2/ExKmstxkgIwGFdn+LxiSBh2LMfj4BsVnAc9lyZ4O+D1ac+NPCtj0FaFkC2HIuuS5MIeiBwKFsPqZ+IpWxpsH7PhDhwWoh6uLUD4rhX2mwYyjMpWMPK08mj+SyYEq2ouw5ZmD3EVVIkVL7mYxwsr/xx1VyaOMmUoE6LKwZK53Mgeyd3Lp1xGsoYr1XGHtFSrS+ZH8dR4VYqTOnQTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740129004; c=relaxed/relaxed;
	bh=rVeAVPSbgAXXOGUHlFrLczPyw8KEDImJKjcWWnUOdzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0O4jtdfRmEZtsSvv2x09mbbvAN3jy+7+WkLxHN1eusNMtFBoENJXVMY/nIa/NwsdF+JYagTr6ura9YsqHL6GA+pCaP8v5Vi7jk7vDy9M8rQt5K0F/Ate1UG3/oxsRAPgR1ZKVz0dstibphMtKfbwg35iDItkMQrRwIQU4Q5T44s1Ggxw4HF7OpBR94XOHfJgAuI9XdFlFMZy1LeW/9YKowqLWhFsm1mCZnXVwQTpV6mv4vTuIlepAZaapSsOvSlwFLj8/GrscjwXFjpB5RnXGk3jY5ZX4hSEnlswd1otj9/Y0W3CRrh0dyQRNm6Qo2Yc6939gStITOns8vkbQq13g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QombxTq/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QombxTq/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzkqH4YQfz30RG
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 20:10:03 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220c665ef4cso30314365ad.3
        for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 01:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740129002; x=1740733802; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVeAVPSbgAXXOGUHlFrLczPyw8KEDImJKjcWWnUOdzY=;
        b=QombxTq/tQ0iSsZy43y++eFeIazAGgsyG6zYvl41G2+1yOVlSmZrHZb5rGxA2N1zyh
         QiY7UQGW81M8P9BNiZeMTEzFvVT1pExIJNtJDseUTwG8yYQBp/Glxy3tQr/PsoULanbh
         WqhJrKvU0pq4QEestDWxm1f2wofS13K3L7AI7U8YjH6IQXK8kC3xy9rlggh5SqChLTZf
         u9AhBeMsGKAiuFYADvBrWiULAHjSIAJ6MsTA3+u9QvmmMgqXgFYPmZjSLgLItskgxJUk
         +EIjiZLaUtNHFUWDW9YfbXYU7Iwzh4HFJE3LZVsuzc0R5oocV42fK4hS2UgXxvvtUCds
         XvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740129002; x=1740733802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVeAVPSbgAXXOGUHlFrLczPyw8KEDImJKjcWWnUOdzY=;
        b=G9fFO8d8RPFgmpexuzDT4tq611KbcPMs3nchaqac17xvyTXqsYGaVxSelWcOoJ6EXB
         I/o4Muh4MOtHJjAYJZrkKbJ9RSTp/kSnEr14y4rROz5TP/YNjIb/Do/V1S0t22PgkDyD
         exLDEn4lGJKaZQ4t/f7eVAGAgBGG1pN2zw+TiaSGvvL9Xa1V+6udrJFYCmAfv+CJdbf3
         6aT1S3F9jS5o8TVL/PBPE+4n7116slGY6R5RbDQ40tukv57J4xCLnehqCHjwCsZweWe5
         VQ/6qmPCAotbuD47OP4+T8lU/ahKXVIdTJetS5OOc6ipmn3jS0cP12Xn6gVPiWxm613V
         NvfA==
X-Gm-Message-State: AOJu0YwGvuB/eAqU/avs/MRG5LdX6yTqkz4AUgupV92jP4FS1Mknnfru
	R3vZVsn6grI4P4TYr7oYvjaWWR3JjnO3D6Hjdm1TXKAHM/BPqyxZ
X-Gm-Gg: ASbGnctfpC/QU6p9SNdJQQkvJiOhIR4GZNyBoRsfQ27kSQ/GGyYFU1ZqJBQXzKIDX9d
	NTGDkA2y/p1ubL96MqIgsZ4a25HdyHag0Tv/lNa/TfBXSm5wIA/HTyBR4d7Np8AV5XjrtvdcrNa
	N2qhPDTb6k5XobOAb+U6dCRKI7iU5zNYxASLqGtiPoagiAHlLdyNc70NG2rAbyZi7yazOBuBPPc
	MvriGglJpwERsMXSzZRe/aYNvu/ulnBst/8VV2xbXty4Yefdegq0LmGGwOCv0XomOVBRt24B6i8
	J8e074gtO0fZqDyMXH+zi3NCzZ3HLsitGHcOcHmnbQII2DEw/GYRDWG9GQ==
X-Google-Smtp-Source: AGHT+IEn3wYs3MYkMZmX5fVCTc3Eqh6Gg34f/k0seLI4MOsQgal1jgfR5yN6+szsFIBfCCTdhAgrQw==
X-Received: by 2002:a17:902:db10:b0:212:996:3536 with SMTP id d9443c01a7336-2219ff828admr41562505ad.10.1740129001926;
        Fri, 21 Feb 2025 01:10:01 -0800 (PST)
Received: from openbmc.. (211-23-34-211.hinet-ip.hinet.net. [211.23.34.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5367e8csm133593115ad.67.2025.02.21.01.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:10:01 -0800 (PST)
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
	gstols@baylibre.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	marcelo.schmitt@analog.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	herve.codina@bootlin.com,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
Date: Fri, 21 Feb 2025 17:09:18 +0800
Message-Id: <20250221090918.1487689-3-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221090918.1487689-1-j2anfernee@gmail.com>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
 drivers/iio/adc/Kconfig   |  11 +
 drivers/iio/adc/Makefile  |   1 +
 drivers/iio/adc/nct7201.c | 487 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 500 insertions(+)
 create mode 100644 drivers/iio/adc/nct7201.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fdc4aa5c7eff..389cbbdae1a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2838,6 +2838,7 @@ F:	arch/arm/mach-npcm/
 F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*/*npcm*
 F:	drivers/*/*npcm*
+F:	drivers/iio/adc/nct7201.c
 F:	drivers/rtc/rtc-nct3018y.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 849c90203071..d97eccb1c685 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1048,6 +1048,17 @@ config NAU7802
 	  To compile this driver as a module, choose M here: the
 	  module will be called nau7802.
 
+config NCT7201
+        tristate "Nuvoton NCT7201 and NCT7202 Power Monitor"
+        depends on I2C
+        select REGMAP_I2C
+        help
+          Say yes here to build support for Nuvoton NCT7201 and NCT7202
+          Voltage Monitor.
+
+          This driver can also be built as a module. If so, the module
+          will be called nct7201.
+
 config NPCM_ADC
 	tristate "Nuvoton NPCM ADC driver"
 	depends on ARCH_NPCM || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index ee19afba62b7..0108472e141c 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
 obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
+obj-$(CONFIG_NCT7201) += nct7201.o
 obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
 obj-$(CONFIG_PAC1921) += pac1921.o
 obj-$(CONFIG_PAC1934) += pac1934.o
diff --git a/drivers/iio/adc/nct7201.c b/drivers/iio/adc/nct7201.c
new file mode 100644
index 000000000000..c5d1540bcc00
--- /dev/null
+++ b/drivers/iio/adc/nct7201.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
+ *
+ * Copyright (c) 2024-2025 Nuvoton Technology corporation.
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
+
+#define NCT7201_VIN_MAX				12
+#define NCT7201_IN_SCALING				4995
+#define NCT7201_IN_SCALING_FACTOR			10000
+
+#define NCT7201_REG_INTERRUPT_STATUS_1			0x0C
+#define NCT7201_REG_INTERRUPT_STATUS_2			0x0D
+#define NCT7201_REG_VOLT_LOW_BYTE			0x0F
+#define NCT7201_REG_CONFIGURATION			0x10
+#define  NCT7201_BIT_CONFIGURATION_START		BIT(0)
+#define  NCT7201_BIT_CONFIGURATION_ALERT_MSK		BIT(1)
+#define  NCT7201_BIT_CONFIGURATION_CONV_RATE		BIT(2)
+#define  NCT7201_BIT_CONFIGURATION_RESET		BIT(7)
+
+#define NCT7201_REG_ADVANCED_CONFIGURATION		0x11
+#define  NCT7201_BIT_ADVANCED_CONF_MOD_ALERT		BIT(0)
+#define  NCT7201_BIT_ADVANCED_CONF_MOD_STS		BIT(1)
+#define  NCT7201_BIT_ADVANCED_CONF_FAULT_QUEUE		BIT(2)
+#define  NCT7201_BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN	BIT(4)
+#define  NCT7201_BIT_ADVANCED_CONF_EN_SMB_TIMEOUT	BIT(5)
+#define  NCT7201_BIT_ADVANCED_CONF_MOD_RSTIN		BIT(7)
+
+#define NCT7201_REG_CHANNEL_INPUT_MODE			0x12
+#define NCT7201_REG_CHANNEL_ENABLE_1			0x13
+#define  NCT7201_REG_CHANNEL_ENABLE_1_MASK		GENMASK(7, 0)
+#define NCT7201_REG_CHANNEL_ENABLE_2			0x14
+#define  NCT7201_REG_CHANNEL_ENABLE_2_MASK		GENMASK(3, 0)
+#define NCT7201_REG_INTERRUPT_MASK_1			0x15
+#define NCT7201_REG_INTERRUPT_MASK_2			0x16
+#define NCT7201_REG_BUSY_STATUS				0x1E
+#define  NCT7201_BIT_BUSY				BIT(0)
+#define  NCT7201_BIT_PWR_UP				BIT(1)
+#define NCT7201_REG_ONE_SHOT				0x1F
+#define NCT7201_REG_SMUS_ADDRESS			0xFC
+#define NCT7201_REG_VIN_MASK				GENMASK(15, 3)
+
+#define NCT7201_REG_VIN(i)				(i)
+#define NCT7201_REG_VIN_HIGH_LIMIT(i)			(0x20 + (i) * 2)
+#define NCT7201_REG_VIN_LOW_LIMIT(i)			(0x21 + (i) * 2)
+
+static const struct regmap_range nct7201_read_reg_range[] = {
+	regmap_reg_range(NCT7201_REG_INTERRUPT_STATUS_1, NCT7201_REG_BUSY_STATUS),
+	regmap_reg_range(NCT7201_REG_SMUS_ADDRESS, NCT7201_REG_SMUS_ADDRESS),
+};
+
+static const struct regmap_access_table nct7201_readable_regs_tbl = {
+	.yes_ranges = nct7201_read_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(nct7201_read_reg_range),
+};
+
+static const struct regmap_range nct7201_write_reg_range[] = {
+	regmap_reg_range(NCT7201_REG_CONFIGURATION, NCT7201_REG_INTERRUPT_MASK_2),
+	regmap_reg_range(NCT7201_REG_ONE_SHOT, NCT7201_REG_ONE_SHOT),
+};
+
+static const struct regmap_access_table nct7201_writeable_regs_tbl = {
+	.yes_ranges = nct7201_write_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(nct7201_write_reg_range),
+};
+
+static const struct regmap_range nct7201_read_vin_reg_range[] = {
+	regmap_reg_range(NCT7201_REG_VIN(0), NCT7201_REG_VIN(NCT7201_VIN_MAX - 1)),
+	regmap_reg_range(NCT7201_REG_VIN_HIGH_LIMIT(0),
+			 NCT7201_REG_VIN_LOW_LIMIT(NCT7201_VIN_MAX - 1)),
+};
+
+static const struct regmap_access_table nct7201_readable_vin_regs_tbl = {
+	.yes_ranges = nct7201_read_vin_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(nct7201_read_vin_reg_range),
+};
+
+static const struct regmap_range nct7201_write_vin_reg_range[] = {
+	regmap_reg_range(NCT7201_REG_VIN_HIGH_LIMIT(0),
+			 NCT7201_REG_VIN_LOW_LIMIT(NCT7201_VIN_MAX - 1)),
+};
+
+static const struct regmap_access_table nct7201_writeable_vin_regs_tbl = {
+	.yes_ranges = nct7201_write_vin_reg_range,
+	.n_yes_ranges = ARRAY_SIZE(nct7201_write_vin_reg_range),
+};
+
+static const struct regmap_config nct7201_regmap8_config = {
+	.name = "vin-data-read-byte",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.use_single_write = true,
+	.max_register = 0xff,
+	.rd_table = &nct7201_readable_regs_tbl,
+	.wr_table = &nct7201_writeable_regs_tbl,
+};
+
+static const struct regmap_config nct7201_regmap16_config = {
+	.name = "vin-data-read-word",
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = 0xff,
+	.rd_table = &nct7201_readable_vin_regs_tbl,
+	.wr_table = &nct7201_writeable_vin_regs_tbl,
+};
+
+struct nct7201_chip_info {
+	struct i2c_client *client;
+	struct mutex access_lock;
+	struct regmap *regmap;
+	struct regmap *regmap16;
+	int num_vin_channels;
+	u16 vin_mask;
+};
+
+struct nct7201_adc_model_data {
+	const char *model_name;
+	const struct iio_chan_spec *channels;
+	const int num_channels;
+	int num_vin_channels;
+};
+
+static const struct iio_event_spec nct7201_events[] = {
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
+#define NCT7201_VOLTAGE_CHANNEL(chan, addr)				\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = chan,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.address = addr,					\
+		.event_spec = nct7201_events,				\
+		.num_event_specs = ARRAY_SIZE(nct7201_events),		\
+	}
+
+static const struct iio_chan_spec nct7201_channels[] = {
+	NCT7201_VOLTAGE_CHANNEL(1, 0),
+	NCT7201_VOLTAGE_CHANNEL(2, 1),
+	NCT7201_VOLTAGE_CHANNEL(3, 2),
+	NCT7201_VOLTAGE_CHANNEL(4, 3),
+	NCT7201_VOLTAGE_CHANNEL(5, 4),
+	NCT7201_VOLTAGE_CHANNEL(6, 5),
+	NCT7201_VOLTAGE_CHANNEL(7, 6),
+	NCT7201_VOLTAGE_CHANNEL(8, 7),
+};
+
+static const struct iio_chan_spec nct7202_channels[] = {
+	NCT7201_VOLTAGE_CHANNEL(1, 0),
+	NCT7201_VOLTAGE_CHANNEL(2, 1),
+	NCT7201_VOLTAGE_CHANNEL(3, 2),
+	NCT7201_VOLTAGE_CHANNEL(4, 3),
+	NCT7201_VOLTAGE_CHANNEL(5, 4),
+	NCT7201_VOLTAGE_CHANNEL(6, 5),
+	NCT7201_VOLTAGE_CHANNEL(7, 6),
+	NCT7201_VOLTAGE_CHANNEL(8, 7),
+	NCT7201_VOLTAGE_CHANNEL(9, 8),
+	NCT7201_VOLTAGE_CHANNEL(10, 9),
+	NCT7201_VOLTAGE_CHANNEL(11, 10),
+	NCT7201_VOLTAGE_CHANNEL(12, 11),
+};
+
+static int nct7201_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	u16 volt;
+	unsigned int value;
+	int err;
+	struct nct7201_chip_info *chip = iio_priv(indio_dev);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&chip->access_lock);
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		err = regmap_read(chip->regmap16, NCT7201_REG_VIN(chan->address), &value);
+		if (err < 0)
+			return err;
+		volt = value;
+		*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
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
+static int nct7201_read_event_value(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    enum iio_event_type type,
+				    enum iio_event_direction dir,
+				    enum iio_event_info info,
+				    int *val, int *val2)
+{
+	struct nct7201_chip_info *chip = iio_priv(indio_dev);
+	u16 volt;
+	unsigned int value;
+	int err;
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info != IIO_EV_INFO_VALUE)
+		return -EINVAL;
+
+	if (dir == IIO_EV_DIR_FALLING) {
+		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
+				  &value);
+		if (err < 0)
+			return err;
+		volt = value;
+	} else {
+		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
+				  &value);
+		if (err < 0)
+			return err;
+		volt = value;
+	}
+
+	*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
+
+	return IIO_VAL_INT;
+}
+
+static int nct7201_write_event_value(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir,
+				     enum iio_event_info info,
+				     int val, int val2)
+{
+	struct nct7201_chip_info *chip = iio_priv(indio_dev);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	if (info != IIO_EV_INFO_VALUE)
+		return -EOPNOTSUPP;
+
+	if (dir == IIO_EV_DIR_FALLING)
+		regmap_write(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
+			     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
+	else
+		regmap_write(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
+			     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
+
+	return 0;
+}
+
+static int nct7201_read_event_config(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir)
+{
+	struct nct7201_chip_info *chip = iio_priv(indio_dev);
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	return !!(chip->vin_mask & BIT(chan->address));
+}
+
+static int nct7201_write_event_config(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      enum iio_event_type type,
+				      enum iio_event_direction dir,
+				      bool state)
+{
+	struct nct7201_chip_info *chip = iio_priv(indio_dev);
+	unsigned int mask;
+
+	if (chan->type != IIO_VOLTAGE)
+		return -EOPNOTSUPP;
+
+	mask = BIT(chan->address);
+
+	if (!state && (chip->vin_mask & mask))
+		chip->vin_mask &= ~mask;
+	else if (state && !(chip->vin_mask & mask))
+		chip->vin_mask |= mask;
+
+	if (chip->num_vin_channels <= 8)
+		regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, chip->vin_mask);
+	else
+		regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
+				  &chip->vin_mask, sizeof(chip->vin_mask));
+
+	return 0;
+}
+
+static const struct iio_info nct7201_info = {
+	.read_raw = nct7201_read_raw,
+	.read_event_config = nct7201_read_event_config,
+	.write_event_config = nct7201_write_event_config,
+	.read_event_value = nct7201_read_event_value,
+	.write_event_value = nct7201_write_event_value,
+};
+
+static const struct iio_info nct7201_info_no_irq = {
+	.read_raw = nct7201_read_raw,
+};
+
+static const struct nct7201_adc_model_data nct7201_model_data = {
+	.model_name = "nct7201",
+	.channels = nct7201_channels,
+	.num_channels = ARRAY_SIZE(nct7201_channels),
+	.num_vin_channels = 8,
+};
+
+static const struct nct7201_adc_model_data nct7202_model_data = {
+	.model_name = "nct7202",
+	.channels = nct7202_channels,
+	.num_channels = ARRAY_SIZE(nct7202_channels),
+	.num_vin_channels = 12,
+};
+
+static int nct7201_init_chip(struct nct7201_chip_info *chip)
+{
+	u8 data[2];
+	unsigned int value;
+	int err;
+
+	regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION,
+		     NCT7201_BIT_CONFIGURATION_RESET);
+
+	/*
+	 * After about 25 msecs, the device should be ready and then
+	 * the Power Up bit will be set to 1. If not, wait for it.
+	 */
+	mdelay(25);
+	err = regmap_read(chip->regmap, NCT7201_REG_BUSY_STATUS, &value);
+	if (err < 0)
+		return err;
+	if (!(value & NCT7201_BIT_PWR_UP))
+		return dev_err_probe(&chip->client->dev, -EIO,
+				     "Failed to power up after reset\n");
+
+	/* Enable Channel */
+	if (chip->num_vin_channels <= 8) {
+		data[0] = NCT7201_REG_CHANNEL_ENABLE_1_MASK;
+		err = regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, data[0]);
+		if (err < 0)
+			return dev_err_probe(&chip->client->dev, -EIO,
+					     "Failed to write NCT7201_REG_CHANNEL_ENABLE_1\n");
+	} else {
+		data[0] = NCT7201_REG_CHANNEL_ENABLE_1_MASK;
+		data[1] = NCT7201_REG_CHANNEL_ENABLE_2_MASK;
+		err = regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
+					data, ARRAY_SIZE(data));
+		if (err < 0)
+			return dev_err_probe(&chip->client->dev, -EIO,
+					    "Failed to write NCT7201_REG_CHANNEL_ENABLE_1 and NCT7201_REG_CHANNEL_ENABLE_2\n");
+	}
+
+	value = get_unaligned_le16(data);
+	chip->vin_mask = value;
+
+	/* Start monitoring if needed */
+	err = regmap_read(chip->regmap, NCT7201_REG_CONFIGURATION, &value);
+	if (err < 0)
+		return dev_err_probe(&chip->client->dev, -EIO,
+				     "Failed to read NCT7201_REG_CONFIGURATION\n");
+
+	regmap_set_bits(chip->regmap, NCT7201_REG_CONFIGURATION, NCT7201_BIT_CONFIGURATION_START);
+
+	return 0;
+}
+
+static int nct7201_probe(struct i2c_client *client)
+{
+	const struct nct7201_adc_model_data *model_data;
+	struct nct7201_chip_info *chip;
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
+	chip->regmap = devm_regmap_init_i2c(client, &nct7201_regmap8_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+			"Failed to init regmap\n");
+
+	chip->regmap16 = devm_regmap_init_i2c(client, &nct7201_regmap16_config);
+	if (IS_ERR(chip->regmap16))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16),
+			"Failed to init regmap16\n");
+
+	chip->num_vin_channels = model_data->num_vin_channels;
+
+	ret = devm_mutex_init(&client->dev, &chip->access_lock);
+	if (ret)
+		return ret;
+
+	chip->client = client;
+
+	ret = nct7201_init_chip(chip);
+	if (ret < 0)
+		return ret;
+
+	indio_dev->name = model_data->model_name;
+	indio_dev->channels = model_data->channels;
+	indio_dev->num_channels = model_data->num_channels;
+	if (client->irq)
+		indio_dev->info = &nct7201_info;
+	else
+		indio_dev->info = &nct7201_info_no_irq;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id nct7201_id[] = {
+	{ .name = "nct7201", .driver_data = (kernel_ulong_t)&nct7201_model_data },
+	{ .name = "nct7202", .driver_data = (kernel_ulong_t)&nct7202_model_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nct7201_id);
+
+static const struct of_device_id nct7201_of_match[] = {
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
+MODULE_DEVICE_TABLE(of, nct7201_of_match);
+
+static struct i2c_driver nct7201_driver = {
+	.driver = {
+		.name	= "nct7201",
+		.of_match_table = nct7201_of_match,
+	},
+	.probe = nct7201_probe,
+	.id_table = nct7201_id,
+};
+module_i2c_driver(nct7201_driver);
+
+MODULE_AUTHOR("Eason Yang <j2anfernee@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton NCT7201 voltage monitor driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

