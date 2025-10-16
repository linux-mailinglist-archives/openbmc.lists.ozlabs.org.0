Return-Path: <openbmc+bounces-750-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D1BE5B49
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 00:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnjbp3TQmz3069;
	Fri, 17 Oct 2025 09:41:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760580890;
	cv=none; b=DALk4M915D3L8lKRfh9S/YBE8oKt2xkRXrsDWmALN3wQlnBLkAGfpN83mWZDwywl/VBLmNwJmnPgbkiZct3kk6RlvuTPVuz8b8Drk2yqf7GB3FwEhPdUY9fOS1bVi++2YO38v+YDu9IpUJdN5sqGfXsfon03ukULbEyFdhWS9YTirLpPi5FJRn4EglynnkI4JgICTtkK2liq/r35/kQV/5SYB72WOnI0xOl/ZrVrYv6GBkP/UBlAdJiJqhkGaGjSPTqAlelsTzaHaGJfN4WyZ5lUIbJGnEIOmFKyCcxwPpM23LKPg5J+XsUk/zH6skJuIEuE00UTDMCqhLchRyeqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760580890; c=relaxed/relaxed;
	bh=u5b/WqlLeVwT4z5Ifiw5lh5cCcvOPAiKMmnZVYJB/2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqMitK5bzyjLw5GMsE9/48tVZuvWBcptvOG5kO8Jm5BKRKIpMA6PDFlghowwBe3TKAQJ3rA3iyJqW2WGPIQnbZ+6c+QSfvQ94bcO2dLCEn+P+7HXqnsZqiMyDmtJDNMJhZZKyczuap+uo42QSF+ze6IZIKKGV4QUYRHVfKoMWP9tUicDH41fNdvT7YtXJNyh5JMFEiVokLD9Ga4OrtEO/YNCn369zXersuas/xYBpgKFsuvgWdc7QukvGCvFyIijkVP3YLSp7iICRopcScvxSd8RLBwkP03gFrhvnsrAdSwEFy3J/477E8QfLKf4ThtagplWdVtF6VWjB1dVIixgZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lMglRyYE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lMglRyYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnBNn4b6hz2yr1
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 13:14:49 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so304215a91.2
        for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 19:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580888; x=1761185688; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5b/WqlLeVwT4z5Ifiw5lh5cCcvOPAiKMmnZVYJB/2c=;
        b=lMglRyYEF4jBoGmeaOrU714W7iAHdtwhfvWy4TCeJr2JMFqKyYBll995R9v3Blb5Lr
         aXi22/FsjBg0eJIVHzkb4UCJxlK2iwLbqaR7ZNCMiHxbucty/UgKXRuhzreMhRAsjpWw
         mUmL/L/F4xl75m3EKXuqAsYnJSDfrGYs0oXXV1UkjybK5exREVZFYLxirC25PO8rLT3l
         6o1H5Qvm8VikvP57HhliGuW8r3Y1YM+t+S97Q3h5p7DiHVMoBGGDqEn7MnIQzV8mhsay
         a0bfVTQ7gpwNUDN9cEs25qI8HXwe2VKSQv+UEnS/81yaB3LZgwn9wNoWCalQuMr05Fjz
         3XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580888; x=1761185688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5b/WqlLeVwT4z5Ifiw5lh5cCcvOPAiKMmnZVYJB/2c=;
        b=tqdqOcISZ07pyRQWo1kjD7InaG9IWyB8X9YgcrHgTSNyS5Bj4oysd1z9LuBwsEGp1Q
         4ZdqMQ8pRlqerFX27b+P+CTn6jHbI2dyMfGFouzbznkAjujlJsKFRm6h0yiLDU0ETTQc
         z2Vtzx4HG7+6i3GmP8XqIeV/G//TV69j3yiem7eEGW4IDultYuECovVIT7x9uIUQ0R1z
         Q4tYud0QilSR59/c8/VyBoJ4WtZEJJ3zgxfJAjs/lQpCcc9MCiSDc9uET8IpR3nPesvZ
         MiU8smj7mDp/65FhW05qubHR3xJ5BWtaDZWlJbehCDrK/JT4Ti+lPJ1OaZ9hhRy19ea5
         jufA==
X-Forwarded-Encrypted: i=1; AJvYcCXxsIavSb4/89FniAAgM8smaIRSTfqDT8U+yzs8nU/62g2gHL6b9ITS6LP2k5n7wf2lIm0U4GCA@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdQX2BUysR3Jj81S6AT3JNdfvrCVINRvROuCCCYHFAoGxti0QC
	i2ttJDl7eK2j5BIpdYExHvsqUKmiSB8Qr4NGtzKJO7i0KUBmUdMENM3Zv+sfcw==
X-Gm-Gg: ASbGncvM/drcHfnUObwGI0wefGtQfm3xrnjMu6pWDCx1ePjORMWGiK5LYehK8LZkmIX
	YSkkfKV2S53Bkzv3o9Br6rsejD5Kmu9O9WDt2etPZHp51l5bWoaRUBfUl6EcELM+bGhyqktnOIQ
	ED85XzINrj6i14n0XWc/QKW8H4yxnDExMVAoKMYhm0+1bK7QTqnRYK7vtXnqg5ImCNNBD+2KQAJ
	+TYtSa9vFy4vdDV4kc22DMyEtNRphVEKeAu/FopHbh9XY4H5ur3nQm53GGWOM/xUuJUayqRYxnd
	7TW0Yvv7CI/qney+E/FZ27knsFqb+EjhRpQDou/4dvdVeOzZIGyVk3nDNIgYpujpwYyo7nAapEP
	nCNdv6uXvZg17orT9aDTx8ESu1B3s2sNpXZjEA99VKiNmMW3/SdvuJwRf2Jxd3If123pWtIt6Ix
	uS9D2RF8jj7wNosHhGlu5O6gjqtlY4puezvKpzCKr/QA8nj5myPkc=
X-Google-Smtp-Source: AGHT+IG69RpPzqOBikn8xH3WjLrNLmyIKN9iyVepVuWw/f/vpVV3cIpSN/ZbKKKqGLBw25ws9t4YLQ==
X-Received: by 2002:a17:90b:3ec6:b0:339:ec9c:b26d with SMTP id 98e67ed59e1d1-33b510f8488mr43209664a91.8.1760580887383;
        Wed, 15 Oct 2025 19:14:47 -0700 (PDT)
Received: from leo.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7af3sm21140553a91.17.2025.10.15.19.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:14:47 -0700 (PDT)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: leo-yang@quantatw.com,
	leo.yang.sy0@gmail.com
Subject: [PATCH linux dev-6.12 3/3] hwmon: add MP29502 driver
Date: Thu, 16 Oct 2025 10:12:36 +0800
Message-ID: <20251016021241.1873764-3-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016021241.1873764-1-Leo-Yang@quantatw.com>
References: <20251016021241.1873764-1-Leo-Yang@quantatw.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS VR controller mp29502. This driver exposes
telemetry and limits value readings and writtings.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20250805102020.749850-3-wenswang@yeah.net
[groeck: Fixed document formatting]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 90bad684e9ac5ae435c2715fab36f6799849e800)
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/mp29502.rst |  93 +++++
 MAINTAINERS                     |   7 +
 drivers/hwmon/pmbus/Kconfig     |   9 +
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/mp29502.c   | 670 ++++++++++++++++++++++++++++++++
 6 files changed, 781 insertions(+)
 create mode 100644 Documentation/hwmon/mp29502.rst
 create mode 100644 drivers/hwmon/pmbus/mp29502.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 526fc0c6e3b4..af3161adcd5a 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
    mp2869
    mp2888
    mp2891
+   mp29502
    mp2975
    mp2993
    mp5023
diff --git a/Documentation/hwmon/mp29502.rst b/Documentation/hwmon/mp29502.rst
new file mode 100644
index 000000000000..893e741a6b71
--- /dev/null
+++ b/Documentation/hwmon/mp29502.rst
@@ -0,0 +1,93 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp29502
+=====================
+
+Supported chips:
+
+  * MPS mp29502
+
+    Prefix: 'mp29502'
+
+Author:
+
+	Wensheng Wang <wenswang@yeah.net>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP29502 Digital Multi-phase Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_crit**
+
+**in2_crit_alarm**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+**curr2_crit**
+
+**curr2_crit_alarm**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index 242f582cc3bb..3f49681e7a25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15721,6 +15721,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp2891.rst
 F:	drivers/hwmon/pmbus/mp2891.c
 
+MPS MP29502 DRIVER
+M:	Wensheng Wang <wenswang@yeah.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp29502.rst
+F:	drivers/hwmon/pmbus/mp29502.c
+
 MPS MP2993 DRIVER
 M:	Noah Wang <noahwang.wang@outlook.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 0eeade92f799..91ed4f090259 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -373,6 +373,15 @@ config SENSORS_MP2891
       This driver can also be built as a module. If so, the module will
       be called mp2891.
 
+config SENSORS_MP29502
+	tristate "MPS MP29502"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP29502 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp29502.
+
 config SENSORS_MP2975
 	tristate "MPS MP2975"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index c3d1de9c0753..7995b16b7502 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
 obj-$(CONFIG_SENSORS_MP2869)	+= mp2869.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
+obj-$(CONFIG_SENSORS_MP29502)	+= mp29502.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
diff --git a/drivers/hwmon/pmbus/mp29502.c b/drivers/hwmon/pmbus/mp29502.c
new file mode 100644
index 000000000000..7241373f1557
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp29502.c
@@ -0,0 +1,670 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP29502)
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define MFR_VOUT_SCALE_LOOP	0x29
+#define MFR_SVI3_IOUT_PRT	0x67
+#define MFR_READ_PIN_EST	0x94
+#define MFR_READ_IIN_EST	0x95
+#define MFR_VOUT_PROT1	0x3D
+#define MFR_VOUT_PROT2	0x51
+#define MFR_SLOPE_CNT_SET	0xA8
+#define MFR_TSNS_FLT_SET	0xBB
+
+#define MP29502_VIN_OV_GAIN	4
+#define MP29502_TEMP_LIMIT_OFFSET	40
+#define MP29502_READ_VOUT_DIV	1024
+#define MP29502_READ_IOUT_DIV	32
+#define MP29502_IOUT_LIMIT_UINT	8
+#define MP29502_OVUV_LIMIT_SCALE	10
+#define MP28502_VOUT_OV_GAIN	512
+#define MP28502_VOUT_OV_SCALE	40
+#define MP29502_VOUT_UV_OFFSET	36
+#define MP29502_PIN_GAIN	2
+#define MP29502_IIN_DIV	2
+
+#define MP29502_PAGE_NUM	1
+
+#define MP29502_RAIL_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
+							PMBUS_HAVE_IIN | \
+							PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_TEMP | \
+							PMBUS_HAVE_STATUS_INPUT)
+
+struct mp29502_data {
+	struct pmbus_driver_info info;
+	int vout_scale;
+	int vout_bottom_div;
+	int vout_top_div;
+	int ovp_div;
+	int iout_scale;
+};
+
+#define to_mp29502_data(x)	container_of(x, struct mp29502_data, info)
+
+static u16 mp29502_reg2data_linear11(u16 word)
+{
+	s16 exponent;
+	s32 mantissa;
+	s64 val;
+
+	exponent = ((s16)word) >> 11;
+	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
+	val = mantissa;
+
+	if (exponent >= 0)
+		val <<= exponent;
+	else
+		val >>= -exponent;
+
+	return val;
+}
+
+static int
+mp29502_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			    int page)
+{
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_VOUT_SCALE_LOOP);
+	if (ret < 0)
+		return ret;
+
+	switch (FIELD_GET(GENMASK(12, 10), ret)) {
+	case 0:
+		data->vout_scale = 6400;
+		break;
+	case 1:
+		data->vout_scale = 5120;
+		break;
+	case 2:
+		data->vout_scale = 2560;
+		break;
+	case 3:
+		data->vout_scale = 2048;
+		break;
+	case 4:
+		data->vout_scale = 1024;
+		break;
+	case 5:
+		data->vout_scale = 4;
+		break;
+	case 6:
+		data->vout_scale = 2;
+		break;
+	case 7:
+		data->vout_scale = 1;
+		break;
+	default:
+		data->vout_scale = 1;
+		break;
+	}
+
+	return 0;
+}
+
+static int
+mp29502_identify_vout_divider(struct i2c_client *client, struct pmbus_driver_info *info,
+			      int page)
+{
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_VOUT_PROT1);
+	if (ret < 0)
+		return ret;
+
+	data->vout_bottom_div = FIELD_GET(GENMASK(11, 0), ret);
+
+	ret = i2c_smbus_read_word_data(client, MFR_VOUT_PROT2);
+	if (ret < 0)
+		return ret;
+
+	data->vout_top_div = FIELD_GET(GENMASK(14, 0), ret);
+
+	return 0;
+}
+
+static int
+mp29502_identify_ovp_divider(struct i2c_client *client, struct pmbus_driver_info *info,
+			     int page)
+{
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_SLOPE_CNT_SET);
+	if (ret < 0)
+		return ret;
+
+	data->ovp_div = FIELD_GET(GENMASK(9, 0), ret);
+
+	return 0;
+}
+
+static int
+mp29502_identify_iout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			    int page)
+{
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_SVI3_IOUT_PRT);
+	if (ret < 0)
+		return ret;
+
+	switch (ret & GENMASK(2, 0)) {
+	case 0:
+	case 6:
+		data->iout_scale = 32;
+		break;
+	case 1:
+		data->iout_scale = 1;
+		break;
+	case 2:
+		data->iout_scale = 2;
+		break;
+	case 3:
+		data->iout_scale = 4;
+		break;
+	case 4:
+		data->iout_scale = 8;
+		break;
+	case 5:
+		data->iout_scale = 16;
+		break;
+	default:
+		data->iout_scale = 64;
+		break;
+	}
+
+	return 0;
+}
+
+static int mp29502_read_vout_ov_limit(struct i2c_client *client, struct mp29502_data *data)
+{
+	int ret;
+	int ov_value;
+
+	/*
+	 * This is because the vout ov fault limit value comes from
+	 * page1 MFR_TSNS_FLT_SET reg, and other telemetry and limit
+	 * value comes from page0 reg. So the page should be set to
+	 * 0 after the reading of vout ov limit.
+	 */
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_TSNS_FLT_SET);
+	if (ret < 0)
+		return ret;
+
+	ov_value = DIV_ROUND_CLOSEST(FIELD_GET(GENMASK(12, 7), ret) *
+						   MP28502_VOUT_OV_GAIN * MP28502_VOUT_OV_SCALE,
+						   data->ovp_div);
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	return ov_value;
+}
+
+static int mp29502_write_vout_ov_limit(struct i2c_client *client, u16 word,
+				       struct mp29502_data *data)
+{
+	int ret;
+
+	/*
+	 * This is because the vout ov fault limit value comes from
+	 * page1 MFR_TSNS_FLT_SET reg, and other telemetry and limit
+	 * value comes from page0 reg. So the page should be set to
+	 * 0 after the writing of vout ov limit.
+	 */
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_TSNS_FLT_SET);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_word_data(client, MFR_TSNS_FLT_SET,
+					(ret & ~GENMASK(12, 7)) |
+		FIELD_PREP(GENMASK(12, 7),
+			   DIV_ROUND_CLOSEST(word * data->ovp_div,
+					     MP28502_VOUT_OV_GAIN * MP28502_VOUT_OV_SCALE)));
+
+	return i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+}
+
+static int mp29502_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		ret = PB_VOUT_MODE_DIRECT;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp29502_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		ret = -ENODATA;
+		break;
+	case PMBUS_READ_VIN:
+		/*
+		 * The MP29502 PMBUS_READ_VIN[10:0] is the vin value, the vin scale is
+		 * 125mV/LSB. And the vin scale is set to 125mV/Lsb(using r/m/b scale)
+		 * in MP29502 pmbus_driver_info struct, so the word data bit0-bit10 can
+		 * be returned to pmbus core directly.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(10, 0), ret);
+		break;
+	case PMBUS_READ_VOUT:
+		/*
+		 * The MP29502 PMBUS_READ_VOUT[11:0] is the vout value, and vout
+		 * value is calculated based on vout scale and vout divider.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret &  GENMASK(11, 0)) *
+								data->vout_scale *
+								(data->vout_bottom_div +
+								4 * data->vout_top_div),
+								MP29502_READ_VOUT_DIV *
+								data->vout_bottom_div);
+		break;
+	case PMBUS_READ_IIN:
+		/*
+		 * The MP29502 MFR_READ_IIN_EST register is linear11 format, and the
+		 * exponent is not a constant value. But the iin scale is set to
+		 * 1A/Lsb(using r/m/b scale). As a result, the iin read from MP29502
+		 * should be calculated to A, then return the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, MFR_READ_IIN_EST);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST(mp29502_reg2data_linear11(ret),
+					MP29502_IIN_DIV);
+		break;
+	case PMBUS_READ_PIN:
+		/*
+		 * The MP29502 MFR_READ_PIN_EST register is linear11 format, and the
+		 * exponent is not a constant value. But the pin scale is set to
+		 * 1W/Lsb(using r/m/b scale). As a result, the pout read from MP29502
+		 * should be calculated to W, then return the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, MFR_READ_PIN_EST);
+		if (ret < 0)
+			return ret;
+
+		ret = mp29502_reg2data_linear11(ret) * MP29502_PIN_GAIN;
+		break;
+	case PMBUS_READ_POUT:
+		/*
+		 * The MP29502 PMBUS_READ_POUT register is linear11 format, and the
+		 * exponent is not a constant value. But the pout scale is set to
+		 * 1W/Lsb(using r/m/b scale). As a result, the pout read from MP29502
+		 * should be calculated to W, then return the result to pmbus core.
+		 * And the pout is calculated based on vout divider.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST(mp29502_reg2data_linear11(ret) *
+					(data->vout_bottom_div +
+					4 * data->vout_top_div),
+					data->vout_bottom_div);
+		break;
+	case PMBUS_READ_IOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(10, 0)) * data->iout_scale,
+					MP29502_READ_IOUT_DIV);
+		break;
+	case PMBUS_READ_TEMPERATURE_1:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(10, 0), ret);
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/*
+		 * The MP29502 PMBUS_VIN_OV_FAULT_LIMIT is 500mV/Lsb, but
+		 * the vin  scale is set to 125mV/Lsb(using r/m/b scale),
+		 * so the word data should multiply by 4.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(7, 0), ret) * MP29502_VIN_OV_GAIN;
+		break;
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/*
+		 * The MP29502 PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
+		 * scale is 125mV/Lsb, but the vin scale is set to 125mV/Lsb(using
+		 * r/m/b scale), so the word data bit0-bit9 can be returned to pmbus
+		 * core directly.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(9, 0), ret);
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		/*
+		 * The MP29502 vout ov fault limit value comes from
+		 * page1 MFR_TSNS_FLT_SET[12:7].
+		 */
+		ret = mp29502_read_vout_ov_limit(client, data);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((FIELD_GET(GENMASK(8, 0), ret) *
+								MP29502_OVUV_LIMIT_SCALE -
+								MP29502_VOUT_UV_OFFSET) *
+								(data->vout_bottom_div +
+								4 * data->vout_top_div),
+								data->vout_bottom_div);
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) *
+								data->iout_scale *
+								MP29502_IOUT_LIMIT_UINT,
+								MP29502_READ_IOUT_DIV);
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The scale of MP29502 PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT
+		 * is 1°C/LSB and they have 40°C offset.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) - MP29502_TEMP_LIMIT_OFFSET;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp29502_write_word_data(struct i2c_client *client, int page, int reg,
+				   u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp29502_data *data = to_mp29502_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (reg) {
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_OV_FAULT_LIMIT[7:0] is the limit value,
+		 * and bit8-bit15 should not be changed. The scale of
+		 * PMBUS_VIN_OV_FAULT_LIMIT is 500mV/Lsb, but the vin
+		 * scale is set to 125mV/Lsb(using r/m/b scale), so
+		 * the word data should divide by 4.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+				FIELD_PREP(GENMASK(7, 0),
+					   DIV_ROUND_CLOSEST(word,
+							     MP29502_VIN_OV_GAIN)));
+		break;
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_UV_WARN_LIMIT[9:0] and PMBUS_VIN_UV_FAULT_LIMIT[9:0]
+		 * are the limit value, and bit10-bit15 should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(9, 0)) |
+							FIELD_PREP(GENMASK(9, 0),
+								   word));
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		ret = mp29502_write_vout_ov_limit(client, word, data);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(8, 0)) |
+						FIELD_PREP(GENMASK(8, 0),
+							   DIV_ROUND_CLOSEST(word *
+									data->vout_bottom_div +
+									MP29502_VOUT_UV_OFFSET *
+									(data->vout_bottom_div +
+									4 * data->vout_top_div),
+									MP29502_OVUV_LIMIT_SCALE *
+									(data->vout_bottom_div +
+									4 * data->vout_top_div))));
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word *
+							MP29502_READ_IOUT_DIV,
+							MP29502_IOUT_LIMIT_UINT *
+							data->iout_scale));
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The PMBUS_OT_FAULT_LIMIT[7:0] and PMBUS_OT_WARN_LIMIT[7:0]
+		 * are the limit value, and bit8-bit15 should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+					FIELD_PREP(GENMASK(7, 0),
+						   word + MP29502_TEMP_LIMIT_OFFSET));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp29502_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	/* Identify vout scale */
+	ret = mp29502_identify_vout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify vout divider. */
+	ret = mp29502_identify_vout_divider(client, info, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Identify ovp divider. */
+	ret = mp29502_identify_ovp_divider(client, info, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Identify iout scale */
+	return mp29502_identify_iout_scale(client, info, 0);
+}
+
+static const struct pmbus_driver_info mp29502_info = {
+	.pages = MP29502_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_POWER] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 8,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.b[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_TEMPERATURE] = 1,
+	.R[PSC_TEMPERATURE] = 0,
+	.b[PSC_TEMPERATURE] = 0,
+
+	.m[PSC_CURRENT_IN] = 1,
+	.R[PSC_CURRENT_IN] = 0,
+	.b[PSC_CURRENT_IN] = 0,
+
+	.m[PSC_CURRENT_OUT] = 1,
+	.R[PSC_CURRENT_OUT] = 0,
+	.b[PSC_CURRENT_OUT] = 0,
+
+	.m[PSC_POWER] = 1,
+	.R[PSC_POWER] = 0,
+	.b[PSC_POWER] = 0,
+
+	.func[0] = MP29502_RAIL_FUNC,
+	.read_word_data = mp29502_read_word_data,
+	.read_byte_data = mp29502_read_byte_data,
+	.write_word_data = mp29502_write_word_data,
+	.identify = mp29502_identify,
+};
+
+static int mp29502_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp29502_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp29502_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp29502_info, sizeof(*info));
+	info = &data->info;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp29502_id[] = {
+	{"mp29502", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp29502_id);
+
+static const struct of_device_id __maybe_unused mp29502_of_match[] = {
+	{.compatible = "mps,mp29502"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp29502_of_match);
+
+static struct i2c_driver mp29502_driver = {
+	.driver = {
+		.name = "mp29502",
+		.of_match_table = mp29502_of_match,
+	},
+	.probe = mp29502_probe,
+	.id_table = mp29502_id,
+};
+
+module_i2c_driver(mp29502_driver);
+
+MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net");
+MODULE_DESCRIPTION("PMBus driver for MPS MP29502");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


