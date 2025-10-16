Return-Path: <openbmc+bounces-751-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B8BE5B4E
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 00:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnjbp6cH5z30MY;
	Fri, 17 Oct 2025 09:41:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760580889;
	cv=none; b=iVtJvcbYRhYg6jTEi27YZVOpVKmVM43bvx9QJOaoAn8L8fzDs7ay0aZabS8v5Wbd1etZhwe+XOquoQLXws17YSvO6Cbnlsjr54CP/381w9Q5BXj5RFmtDW87k5cf7zLRSy2BWX+S5L6H+Hd57oYJmkjItdgxkXcmI+ygBnVexjn6DKJjXn47gZOiqQ1Z+WW5jNoQwjD+fZmpVQaPqpYCTot3kY7KfrDWXmdV4joI5JYnLCwfzJXxMa+GTpi7k3lFoo/suqHFpvcXYmRrjAYxh2C0i87WFmHCc6ENpNOU4JjCJeFKTHLgPMsq1xROe+ohZwp0S8EAuWDl+HKMLbxbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760580889; c=relaxed/relaxed;
	bh=CN3kNOfm03CrvhGM2Cx7mJOrZjQ8n3nURYG65j59SxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bm7ep5JUtmJRlfeucK2hlipdc+PUmushrE0zax2EscP2xXyur6c+mAD0U4hT5QLtSusypUYWI8EmpG7pE87V6qYnaxYaBULX8+sDNcLyIOxontVBmCjvSay3lv4I6JfJkiY6iE23T1WkclgO7SyPIIQPe7lwJDXkCjd7oVWDiwtICbPhUm3qFsUGYU8l8ZX8M9uZonIIB7QgAjhpNFhphg8I/T6wjs1ADvSXN1tVVwPl58telRIh0skQltl+EgKX43ZVOXiDdz9VwEvqaX3AIFMDhl8HDBWlsLzp/38j1lWqO2jnYhtlYDMNEt41SkdezXPHpVnEM0FbX6qcKgcuOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdlXali8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdlXali8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnBNm2HRNz2yr1
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 13:14:48 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so240193b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 19:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580886; x=1761185686; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN3kNOfm03CrvhGM2Cx7mJOrZjQ8n3nURYG65j59SxA=;
        b=kdlXali8vwx1mqYxg50WFtwIR8+BSU7M7rzcq9UogmN96We7JGcMVJum3Okcvx1Jjm
         FWBmHR3XpToNWXfxpJPGzfgrfWPj14N60F3vnyV/4OjxRu4tC65n+s83jB7OliW9Esge
         HOSTlUg/00kv0Uj5NXyXqnMbbqUUY/pHFHADgekvlPrR4dcG2JDQ5c71x5MC4tOMc99G
         ArwiCh4Q4tRtv02Tk9FNotgRCOq6qUfYcmPcN3dE4M0eoxIADjoD6VqdQKHI3wE21oD/
         h/Vh9s0uF/2sLTwGDCHS7W/hk+gK/jSzLhUtNb0585HWCHaivG5Nj7KE+qH828+yLW7+
         i/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580886; x=1761185686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN3kNOfm03CrvhGM2Cx7mJOrZjQ8n3nURYG65j59SxA=;
        b=vGdwpakngacawcTBnA8PiUGmde1JzielNSETE3tqqBmAk782LwEh5c8RU91ruog3gz
         V38ny+4teTnQebSel+r8pxQGBaBGk/pYOyrAMWmeDja2+u703UqOmWrRVbj5EEfyBlvB
         HtIuEjfXN1sNAMdgnx+JuR2AMN1aN6Kq/iNnI50lOXJc8aNG/1tvZQFipPxealPrADyM
         OpdGL913UsKrbn7+14IVGqhdxyVzbRUd3KVKILxTJMkpMy7QnSVyhu8nUmqvycScR/1+
         D4/htObSD8JTuvIPCtIiAiT8f5Vkoy/VNbkX8fAJS0FDaevxvifcCAvq32UgccHiPx79
         8YPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCX8Hmdm+j15iV/7yvkQ1/JLE1Y3CX8Lrf/r66zvBjNOSvgz5Cd8ic+4o/GXkipdIrwiCIphzz@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhy7x+iBXYcAYMww9lxjKBfstGE8aqURhhgCYpAI2uRpzifSYv
	d/ScoyDCMA94L2UP2dC/amTOrw+Ht6zmohXbLvtiCvKBnKN042UZmoxV
X-Gm-Gg: ASbGncuwt5GaQVXLxvM8QI3zsTb/wd9PYiYA43ut7WyMW7rUsFttcb69BBLiA5iEVuq
	SH7AHnQ69T5B1DzD/2dc7zXN33cwsdKkzb1tbWsw3fIIw5HrVhEgIpvWL1Rj/7QmJUs2vCSuhMe
	UjjNMbEZK7dDKLPm0zZmVqLpj3tDiMLLS1wqM0tSfXlNIAJMjNV3DM/gCldzK4GuGHh32NFrfDm
	kdd185zDf7JQTZR8LxagqwYae5WQh2pGIAjGnRrHletDR94C+JX8k00MiNwpQSsYQAKPGw12jHp
	2QAARFYFsLJp0SEiGtYvHJJSlcTTJdv3g2kWNjV0rTM9/H9vhSjwAenAUVip5MhUsW9oMrYrjYa
	dl+tGERY69blprbmvtXRQOFPlu9eY3es+3eAmjA7jmcS30uKqnCcVF/RWRgD5klBEz7LCu4LkMM
	zUow4vze59AVp9loOTdAIsPHy3/V5DD57SOFvhZ5qbDo4oMXfc8p4=
X-Google-Smtp-Source: AGHT+IF1Yv1SWCNP0LuVGw5aUfLp0OqH0+kdGfjJeR3BsLtSrosSDAJNzkzNQmcJAbgkkxg2tr3Dhw==
X-Received: by 2002:a05:6a20:2585:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-32da8462b36mr41933614637.54.1760580886013;
        Wed, 15 Oct 2025 19:14:46 -0700 (PDT)
Received: from leo.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7af3sm21140553a91.17.2025.10.15.19.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:14:45 -0700 (PDT)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: leo-yang@quantatw.com,
	leo.yang.sy0@gmail.com
Subject: [PATCH linux dev-6.12 2/3] hwmon: add MP2869,MP29608,MP29612 and MP29816 series driver
Date: Thu, 16 Oct 2025 10:12:35 +0800
Message-ID: <20251016021241.1873764-2-Leo-Yang@quantatw.com>
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS VR mp2869/mp2869a,mp29608/mp29608a,mp29612/mp29612a
and mp29816/mp29816a/mp29816b/mp29816c controller. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20250805102020.749850-2-wenswang@yeah.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit a3a2923aaf7f2cf3aaa4649bddee2f936751825f)
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2869.rst | 175 +++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2869.c   | 659 +++++++++++++++++++++++++++++++++
 6 files changed, 852 insertions(+)
 create mode 100644 Documentation/hwmon/mp2869.rst
 create mode 100644 drivers/hwmon/pmbus/mp2869.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index cd722f78c5f3..526fc0c6e3b4 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -165,6 +165,7 @@ Hardware Monitoring Kernel Drivers
    menf21bmc
    mlxreg-fan
    mp2856
+   mp2869
    mp2888
    mp2891
    mp2975
diff --git a/Documentation/hwmon/mp2869.rst b/Documentation/hwmon/mp2869.rst
new file mode 100644
index 000000000000..2d9d65fc86b6
--- /dev/null
+++ b/Documentation/hwmon/mp2869.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2869
+====================
+
+Supported chips:
+
+  * MPS mp2869
+
+    Prefix: 'mp2869'
+
+  * MPS mp29608
+
+    Prefix: 'mp29608'
+
+  * MPS mp29612
+
+    Prefix: 'mp29612'
+
+  * MPS mp29816
+
+    Prefix: 'mp29816'
+
+Author:
+
+	Wensheng Wang <wenswang@yeah.net>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2869 Dual Loop Digital Multi-phase Controller.
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
+**in1_lcrit**
+
+**in1_lcrit_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
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
+**in3_input**
+
+**in3_label**
+
+**in3_crit**
+
+**in3_crit_alarm**
+
+**in3_lcrit**
+
+**in3_lcrit_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr2_input**
+
+**curr2_label**
+
+The driver provides the following attributes for output current:
+
+**curr3_input**
+
+**curr3_label**
+
+**curr3_crit**
+
+**curr3_crit_alarm**
+
+**curr3_max**
+
+**curr3_max_alarm**
+
+**curr4_input**
+
+**curr4_label**
+
+**curr4_crit**
+
+**curr4_crit_alarm**
+
+**curr4_max**
+
+**curr4_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for output power:
+
+**power3_input**
+
+**power3_label**
+
+**power3_input**
+
+**power3_label**
+
+**power3_max**
+
+**power3_max_alarm**
+
+**power4_input**
+
+**power4_label**
+
+**power4_input**
+
+**power4_label**
+
+**power4_max**
+
+**power4_max_alarm**
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
+
+**temp2_input**
+
+**temp2_crit**
+
+**temp2_crit_alarm**
+
+**temp2_max**
+
+**temp2_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index cc6791d023ea..242f582cc3bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15707,6 +15707,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
+MPS MP2869 DRIVER
+M:	Wensheng Wang <wenswang@yeah.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2869.rst
+F:	drivers/hwmon/pmbus/mp2869.c
+
 MPS MP2891 DRIVER
 M:	Noah Wang <noahwang.wang@outlook.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 0fa98903a2da..0eeade92f799 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -346,6 +346,15 @@ config SENSORS_MP2856
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2856.
 
+config SENSORS_MP2869
+	tristate "MPS MP2869"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2869 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2869.
+
 config SENSORS_MP2888
 	tristate "MPS MP2888"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 56f128c4653e..c3d1de9c0753 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
+obj-$(CONFIG_SENSORS_MP2869)	+= mp2869.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
diff --git a/drivers/hwmon/pmbus/mp2869.c b/drivers/hwmon/pmbus/mp2869.c
new file mode 100644
index 000000000000..cc69a1e91dfe
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2869.c
@@ -0,0 +1,659 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2869)
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific registers, the register MFR_SVI3_IOUT_PRT(0x67),
+ * READ_PIN_EST(0x94)and READ_IIN_EST(0x95) redefine the standard
+ * PMBUS register. The MFR_VOUT_LOOP_CTRL(0x29) is used to identify
+ * the vout scale and the MFR_SVI3_IOUT_PRT(0x67) is used to identify
+ * the iout scale. The READ_PIN_EST(0x94) is used to read input power
+ * per rail. The MP2891 does not have standard READ_IIN register(0x89),
+ * the iin telemetry can be obtained through the vendor redefined
+ * register READ_IIN_EST(0x95).
+ */
+#define MFR_SVI3_IOUT_PRT	0x67
+#define MFR_READ_PIN_EST	0x94
+#define MFR_READ_IIN_EST	0x95
+#define MFR_TSNS_FLT_SET	0xBB
+
+#define MP2869_VIN_OV_FAULT_GAIN	4
+#define MP2869_READ_VOUT_DIV	1024
+#define MP2869_READ_IOUT_DIV	32
+#define MP2869_OVUV_LIMIT_SCALE	10
+#define MP2869_OVUV_DELTA_SCALE	50
+#define MP2869_TEMP_LIMIT_OFFSET	40
+#define MP2869_IOUT_LIMIT_UINT	8
+#define MP2869_POUT_OP_GAIN	2
+
+#define MP2869_PAGE_NUM	2
+
+#define MP2869_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
+							PMBUS_HAVE_IIN | \
+							PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_TEMP | \
+							PMBUS_HAVE_STATUS_INPUT)
+
+#define MP2869_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
+							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
+							 PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+struct mp2869_data {
+	struct pmbus_driver_info info;
+	bool mfr_thwn_flt_en;
+	int vout_scale[MP2869_PAGE_NUM];
+	int iout_scale[MP2869_PAGE_NUM];
+};
+
+static const int mp2869_vout_sacle[8] = {6400, 5120, 2560, 2048, 1024,
+										 4, 2, 1};
+static const int mp2869_iout_sacle[8] = {32, 1, 2, 4, 8, 16, 32, 64};
+
+#define to_mp2869_data(x)	container_of(x, struct mp2869_data, info)
+
+static u16 mp2869_reg2data_linear11(u16 word)
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
+mp2869_identify_thwn_flt(struct i2c_client *client, struct pmbus_driver_info *info,
+			 int page)
+{
+	struct mp2869_data *data = to_mp2869_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_TSNS_FLT_SET);
+	if (ret < 0)
+		return ret;
+
+	data->mfr_thwn_flt_en = FIELD_GET(GENMASK(13, 13), ret);
+
+	return 0;
+}
+
+static int
+mp2869_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2869_data *data = to_mp2869_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, PMBUS_VOUT_SCALE_LOOP);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The output voltage is equal to the READ_VOUT(0x8B) register value multiply
+	 * by vout_scale.
+	 * Obtain vout scale from the register PMBUS_VOUT_SCALE_LOOP, bits 12-10
+	 * PMBUS_VOUT_SCALE_LOOP[12:10]:
+	 * 000b - 6.25mV/LSB, 001b - 5mV/LSB, 010b - 2.5mV/LSB, 011b - 2mV/LSB
+	 * 100b - 1mV/Lsb, 101b - (1/256)mV/LSB, 110b - (1/512)mV/LSB,
+	 * 111b - (1/1024)mV/LSB
+	 */
+	data->vout_scale[page] = mp2869_vout_sacle[FIELD_GET(GENMASK(12, 10), ret)];
+
+	return 0;
+}
+
+static int
+mp2869_identify_iout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2869_data *data = to_mp2869_data(info);
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
+	/*
+	 * The output current is equal to the READ_IOUT(0x8C) register value
+	 * multiply by iout_scale.
+	 * Obtain iout_scale from the register MFR_SVI3_IOUT_PRT[2:0].
+	 * The value is selected as below:
+	 * 000b - 1A/LSB, 001b - (1/32)A/LSB, 010b - (1/16)A/LSB,
+	 * 011b - (1/8)A/LSB, 100b - (1/4)A/LSB, 101b - (1/2)A/LSB
+	 * 110b - 1A/LSB, 111b - 2A/LSB
+	 */
+	data->iout_scale[page] = mp2869_iout_sacle[FIELD_GET(GENMASK(2, 0), ret)];
+
+	return 0;
+}
+
+static int mp2869_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2869_data *data = to_mp2869_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The calculation of vout in this driver is based on direct format.
+		 * As a result, the format of vout is enforced to direct.
+		 */
+		ret = PB_VOUT_MODE_DIRECT;
+		break;
+	case PMBUS_STATUS_BYTE:
+		/*
+		 * If the tsns digital fault is enabled, the TEMPERATURE flag
+		 * of PMBUS_STATUS_BYTE should come from STATUS_MFR_SPECIFIC
+		 * register bit1.
+		 */
+		if (!data->mfr_thwn_flt_en)
+			return -ENODATA;
+
+		ret = pmbus_read_byte_data(client, page, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & ~GENMASK(2, 2)) |
+			FIELD_PREP(GENMASK(2, 2),
+				   FIELD_GET(GENMASK(1, 1),
+					     pmbus_read_byte_data(client, page,
+								  PMBUS_STATUS_MFR_SPECIFIC)));
+		break;
+	case PMBUS_STATUS_TEMPERATURE:
+		/*
+		 * If the tsns digital fault is enabled, the OT Fault and OT Warning
+		 * flag of PMBUS_STATUS_TEMPERATURE should come from STATUS_MFR_SPECIFIC
+		 * register bit1.
+		 */
+		if (!data->mfr_thwn_flt_en)
+			return -ENODATA;
+
+		ret = pmbus_read_byte_data(client, page, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & ~GENMASK(7, 6)) |
+			FIELD_PREP(GENMASK(6, 6),
+				   FIELD_GET(GENMASK(1, 1),
+					     pmbus_read_byte_data(client, page,
+								  PMBUS_STATUS_MFR_SPECIFIC))) |
+			 FIELD_PREP(GENMASK(7, 7),
+				    FIELD_GET(GENMASK(1, 1),
+					      pmbus_read_byte_data(client, page,
+								   PMBUS_STATUS_MFR_SPECIFIC)));
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2869_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2869_data *data = to_mp2869_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		/*
+		 * If the tsns digital fault is enabled, the OT Fault flag
+		 * of PMBUS_STATUS_WORD should come from STATUS_MFR_SPECIFIC
+		 * register bit1.
+		 */
+		if (!data->mfr_thwn_flt_en)
+			return -ENODATA;
+
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & ~GENMASK(2, 2)) |
+			 FIELD_PREP(GENMASK(2, 2),
+				    FIELD_GET(GENMASK(1, 1),
+					      pmbus_read_byte_data(client, page,
+								   PMBUS_STATUS_MFR_SPECIFIC)));
+		break;
+	case PMBUS_READ_VIN:
+		/*
+		 * The MP2869 PMBUS_READ_VIN[10:0] is the vin value, the vin scale is
+		 * 31.25mV/LSB. And the vin scale is set to 31.25mV/Lsb(using r/m/b scale)
+		 * in MP2869 pmbus_driver_info struct, so the word data bit0-bit10 can be
+		 * returned to pmbus core directly.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(10, 0), ret);
+		break;
+	case PMBUS_READ_IIN:
+		/*
+		 * The MP2869 redefine the standard 0x95 register as iin telemetry
+		 * per rail.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, MFR_READ_IIN_EST);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case PMBUS_READ_PIN:
+		/*
+		 * The MP2869 redefine the standard 0x94 register as pin telemetry
+		 * per rail. The MP2869 MFR_READ_PIN_EST register is linear11 format,
+		 * but the pin scale is set to 1W/Lsb(using r/m/b scale). As a result,
+		 * the pin read from MP2869 should be converted to W, then return
+		 * the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, MFR_READ_PIN_EST);
+		if (ret < 0)
+			return ret;
+
+		ret = mp2869_reg2data_linear11(ret);
+		break;
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret &  GENMASK(11, 0)) * data->vout_scale[page],
+					MP2869_READ_VOUT_DIV);
+		break;
+	case PMBUS_READ_IOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(10, 0)) * data->iout_scale[page],
+					MP2869_READ_IOUT_DIV);
+		break;
+	case PMBUS_READ_POUT:
+		/*
+		 * The MP2869 PMBUS_READ_POUT register is linear11 format, but the pout
+		 * scale is set to 1W/Lsb(using r/m/b scale). As a result, the pout read
+		 * from MP2869 should be converted to W, then return the result to pmbus
+		 * core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = mp2869_reg2data_linear11(ret);
+		break;
+	case PMBUS_READ_TEMPERATURE_1:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(10, 0), ret);
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(12, 9), ret))
+			ret = FIELD_GET(GENMASK(8, 0), ret) * MP2869_OVUV_LIMIT_SCALE +
+				(FIELD_GET(GENMASK(12, 9), ret) + 1) * MP2869_OVUV_DELTA_SCALE;
+		else
+			ret = FIELD_GET(GENMASK(8, 0), ret) * MP2869_OVUV_LIMIT_SCALE;
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(12, 9), ret))
+			ret = FIELD_GET(GENMASK(8, 0), ret) * MP2869_OVUV_LIMIT_SCALE -
+				(FIELD_GET(GENMASK(12, 9), ret) + 1) * MP2869_OVUV_DELTA_SCALE;
+		else
+			ret = FIELD_GET(GENMASK(8, 0), ret) * MP2869_OVUV_LIMIT_SCALE;
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The scale of MP2869 PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT
+		 * is 1°C/LSB and they have 40°C offset.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) - MP2869_TEMP_LIMIT_OFFSET;
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) * MP2869_VIN_OV_FAULT_GAIN;
+		break;
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = FIELD_GET(GENMASK(9, 0), ret);
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) * data->iout_scale[page] *
+						MP2869_IOUT_LIMIT_UINT, MP2869_READ_IOUT_DIV);
+		break;
+	case PMBUS_POUT_OP_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) * MP2869_POUT_OP_GAIN;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2869_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2869_data *data = to_mp2869_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		/*
+		 * The MP2869 PMBUS_VOUT_UV_FAULT_LIMIT[8:0] is the limit value,
+		 * and bit9-bit15 should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(12, 9), ret))
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(8, 0)) |
+				FIELD_PREP(GENMASK(8, 0),
+					   DIV_ROUND_CLOSEST(word +
+						(FIELD_GET(GENMASK(12, 9),
+						ret) + 1) *
+					MP2869_OVUV_DELTA_SCALE,
+					MP2869_OVUV_LIMIT_SCALE)));
+		else
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(8, 0)) |
+					FIELD_PREP(GENMASK(8, 0),
+						   DIV_ROUND_CLOSEST(word,
+								     MP2869_OVUV_LIMIT_SCALE)));
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		/*
+		 * The MP2869 PMBUS_VOUT_OV_FAULT_LIMIT[8:0] is the limit value,
+		 * and bit9-bit15 should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(12, 9), ret))
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(8, 0)) |
+				FIELD_PREP(GENMASK(8, 0),
+					   DIV_ROUND_CLOSEST(word -
+							(FIELD_GET(GENMASK(12, 9),
+							ret) + 1) *
+						MP2869_OVUV_DELTA_SCALE,
+						MP2869_OVUV_LIMIT_SCALE)));
+		else
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(8, 0)) |
+				FIELD_PREP(GENMASK(8, 0),
+					   DIV_ROUND_CLOSEST(word,
+							     MP2869_OVUV_LIMIT_SCALE)));
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * If the tsns digital fault is enabled, the PMBUS_OT_FAULT_LIMIT and
+		 * PMBUS_OT_WARN_LIMIT can not be written.
+		 */
+		if (data->mfr_thwn_flt_en)
+			return -EINVAL;
+
+		/*
+		 * The MP2869 scale of MP2869 PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT
+		 * have 40°C offset. The bit0-bit7 is the limit value, and bit8-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+					 FIELD_PREP(GENMASK(7, 0),
+						    word + MP2869_TEMP_LIMIT_OFFSET));
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/*
+		 * The MP2869 PMBUS_VIN_OV_FAULT_LIMIT[7:0] is the limit value, and bit8-bit15
+		 * should not be changed. The scale of PMBUS_VIN_OV_FAULT_LIMIT is 125mV/Lsb,
+		 * but the vin scale is set to 31.25mV/Lsb(using r/m/b scale), so the word data
+		 * should divide by MP2869_VIN_OV_FAULT_GAIN(4)
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+					FIELD_PREP(GENMASK(7, 0),
+						   DIV_ROUND_CLOSEST(word,
+								     MP2869_VIN_OV_FAULT_GAIN)));
+		break;
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_UV_LIMIT[9:0] is the limit value, and bit10-bit15 should
+		 * not be changed. The scale of PMBUS_VIN_UV_LIMIT is 31.25mV/Lsb, and the
+		 * vin scale is set to 31.25mV/Lsb(using r/m/b scale), so the word data can
+		 * be written directly.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(9, 0)) |
+						FIELD_PREP(GENMASK(9, 0),
+							   word));
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word * MP2869_READ_IOUT_DIV,
+							      MP2869_IOUT_LIMIT_UINT *
+								  data->iout_scale[page]));
+		break;
+	case PMBUS_POUT_OP_WARN_LIMIT:
+		/*
+		 * The POUT_OP_WARN_LIMIT[11:0] is the limit value, and bit12-bit15 should
+		 * not be changed. The scale of POUT_OP_WARN_LIMIT is 2W/Lsb.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(11, 0)) |
+					FIELD_PREP(GENMASK(11, 0),
+						   DIV_ROUND_CLOSEST(word,
+								     MP2869_POUT_OP_GAIN)));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2869_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	/* Identify whether tsns digital fault is enable */
+	ret = mp2869_identify_thwn_flt(client, info, 1);
+	if (ret < 0)
+		return 0;
+
+	/* Identify vout scale for rail1. */
+	ret = mp2869_identify_vout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify vout scale for rail2. */
+	ret = mp2869_identify_vout_scale(client, info, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Identify iout scale for rail 1. */
+	ret = mp2869_identify_iout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify iout scale for rail 2. */
+	return mp2869_identify_iout_scale(client, info, 1);
+}
+
+static const struct pmbus_driver_info mp2869_info = {
+	.pages = MP2869_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 32,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.b[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_CURRENT_OUT] = 1,
+	.R[PSC_CURRENT_OUT] = 0,
+	.b[PSC_CURRENT_OUT] = 0,
+
+	.m[PSC_TEMPERATURE] = 1,
+	.R[PSC_TEMPERATURE] = 0,
+	.b[PSC_TEMPERATURE] = 0,
+
+	.m[PSC_POWER] = 1,
+	.R[PSC_POWER] = 0,
+	.b[PSC_POWER] = 0,
+
+	.func[0] = MP2869_RAIL1_FUNC,
+	.func[1] = MP2869_RAIL2_FUNC,
+	.read_word_data = mp2869_read_word_data,
+	.write_word_data = mp2869_write_word_data,
+	.read_byte_data = mp2869_read_byte_data,
+	.identify = mp2869_identify,
+};
+
+static int mp2869_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp2869_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2869_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2869_info, sizeof(*info));
+	info = &data->info;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp2869_id[] = {
+	{"mp2869", 0},
+	{"mp29608", 1},
+	{"mp29612", 2},
+	{"mp29816", 3},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2869_id);
+
+static const struct of_device_id __maybe_unused mp2869_of_match[] = {
+	{.compatible = "mps,mp2869", .data = (void *)0},
+	{.compatible = "mps,mp29608", .data = (void *)1},
+	{.compatible = "mps,mp29612", .data = (void *)2},
+	{.compatible = "mps,mp29816", .data = (void *)3},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2869_of_match);
+
+static struct i2c_driver mp2869_driver = {
+	.driver = {
+		.name = "mp2869",
+		.of_match_table = mp2869_of_match,
+	},
+	.probe = mp2869_probe,
+	.id_table = mp2869_id,
+};
+
+module_i2c_driver(mp2869_driver);
+
+MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2869");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


