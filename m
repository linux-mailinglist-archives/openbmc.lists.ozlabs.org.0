Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA581664B
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 07:10:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L7Ky/FPT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StqDz1RY2z3cLQ
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 17:10:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L7Ky/FPT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StqBR6MHKz3bYQ
	for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2023 17:08:15 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b9efed2e6fso2359596b6e.0
        for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2023 22:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702879691; x=1703484491; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulz+5kS975pM8i734nxzZZCsm3GC/t1Bgu+p3EmQ3ew=;
        b=L7Ky/FPTFGb5di7PDsmZ5kqOI7zae0WMkRL7TCuiQcqMTBK3mFbXIgWef5s66s1waP
         VrWIZjbVSQNmSo2RFN1ZFzn5/8nmfOe7uwk1oQ0O5htOFNDwU0flJpicWh1nUgf2UXCR
         conwcYLYs0wvdiU+fMbQL3ujLiYexOHe6If3sgM7bpj18A4S2osC1Sni/DaAVS+KXs4G
         1zclOTQoCGpEF7l5wtlWtulVca3q/ysYORahLtsYiH5k45R8N65yBoXZ+zXJCLGsHQC3
         5XFYDg1HyVNy8lT7541YfE97JOEGvh1csIPzlZFTjSS70dc3xStXd1eayODt3eT/qKFj
         QuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879691; x=1703484491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulz+5kS975pM8i734nxzZZCsm3GC/t1Bgu+p3EmQ3ew=;
        b=YLeVxS3riMiWIH3W/hzX9NJo74+7Ww+yoKMM3/7m1bNjsprBUIaUZXWlZHqT9qIYG3
         91lyUr24LMu1D8svDKwYjPDz1vUXWenpCNlQjLU+tjGBfnDFWVUN9IWWisToHECc0eJc
         U1FWhcOPcgKhgtwRXPgexQJegKL5WIZ7LqsQYvTQVe0cNalmZMy8kSsW0mMVQcURIXdn
         jzXAXsdPT4+X3yV70w8y/FO8tIdNPkmnwFcLXgTTfs2zK4aVKNBoJRZ0h1Sy9QCmcTyj
         wEcsvOy3c2tyAGNPCHYz7puBATt2N4d+jR2cwdeMdBW86NLo/CUKnBX/L+2p8tPoMi33
         ywLw==
X-Gm-Message-State: AOJu0Yxb8EMrhMWGRw2pd21jUGeTAt8pEYzo478TX/RhKOYRqUgxIiwO
	k+Lml3/cSN3hagUoazwGaRkdR69+sJg=
X-Google-Smtp-Source: AGHT+IFHJr3W5JYZxH1MkYN4E8f6bO53+BFDg7JY33gzYjGqqpZ+d1ugUX/fyzr5UlOuZJH1kz+jEQ==
X-Received: by 2002:a05:6808:3193:b0:3ba:431:1957 with SMTP id cd19-20020a056808319300b003ba04311957mr15608169oib.1.1702879691411;
        Sun, 17 Dec 2023 22:08:11 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id hq10-20020a056a00680a00b006d5b877aa9asm1877689pfb.41.2023.12.17.22.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:08:10 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 2/2] hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857 controller
Date: Mon, 18 Dec 2023 14:05:59 +0800
Message-Id: <20231218060559.2302459-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231218060559.2302459-1-potin.lai@quantatw.com>
References: <20231218060559.2302459-1-potin.lai@quantatw.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Peter Yin <peteryin.openbmc@gmail.com>

Add support for mp2856/mp2857 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is a dual-loop, digital, multi-phase,
modulation controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2856.rst |  98 +++++++
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2856.c   | 466 +++++++++++++++++++++++++++++++++
 5 files changed, 575 insertions(+)
 create mode 100644 Documentation/hwmon/mp2856.rst
 create mode 100644 drivers/hwmon/pmbus/mp2856.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fac861e2a8ab4..e45999f8e6740 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -156,6 +156,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    menf21bmc
    mlxreg-fan
+   mp2856
    mp2888
    mp2975
    mp5023
diff --git a/Documentation/hwmon/mp2856.rst b/Documentation/hwmon/mp2856.rst
new file mode 100644
index 0000000000000..af625c22b6ea7
--- /dev/null
+++ b/Documentation/hwmon/mp2856.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2856
+====================
+
+Supported chips:
+
+  * MPS MP2856
+
+    Prefix: 'mp2856'
+
+  * MPS MP2857
+
+    Prefix: 'mp2857'
+
+Author:
+
+	Peter Yin <peter.yin@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+vendor dual-loop, digital, multi-phase controller MP2856/MP2857
+
+This device:
+
+- Supports up to two power rail.
+- Supports two pages 0 and 1 for and also pages 2 for configuration.
+- Can configured VOUT readout in direct or VID format and allows
+  setting of different formats on rails 1 and 2. For VID the following
+  protocols are available: AMD SVI3 mode with 5-mV/LSB.
+
+Device supports:
+
+- SVID interface.
+- AVSBus interface.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading output current, output voltage,
+input and output power and temperature.
+Device supports linear format for reading input voltage and input power.
+Device supports VID and direct formats for reading output voltage.
+The below VID modes are supported: AMD SVI3.
+
+The driver provides the following sysfs attributes for current measurements:
+
+- indexes 1  for "iin";
+- indexes 2, 3 for "iout";
+
+**curr[1-3]_alarm**
+
+**curr[1-3]_input**
+
+**curr[1-3]_label**
+
+The driver provides the following sysfs attributes for voltage measurements.
+
+- indexes 1 for "vin";
+- indexes 2, 3 for "vout";
+
+**in[1-3]_crit**
+
+**in[1-3]_crit_alarm**
+
+**in[1-3]_input**
+
+**in[1-3]_label**
+
+**in[1-3]_lcrit**
+
+**in[1-3]_lcrit_alarm**
+
+The driver provides the following sysfs attributes for power measurements.
+
+- indexes 1 for "pin";
+- indexes 2, 3 for "pout";
+
+**power[1-3]_alarm**
+
+**power[1-3]_input**
+
+**power[1-3]_label**
+
+The driver provides the following sysfs attributes for temperature measurements.
+
+**temp[1-2]_crit**
+
+**temp[1-2]_crit_alarm**
+
+**temp[1-2]_input**
+
+**temp[1-2]_max**
+
+**temp[1-2]_max_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 02208d76e8223..95013c95f258a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -308,6 +308,15 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_MP2856
+	tristate "MPS MP2856"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2856 MP2857 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2856.
+
 config SENSORS_MP2888
 	tristate "MPS MP2888"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index eea38c77ed1db..cf8a767445456 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
diff --git a/drivers/hwmon/pmbus/mp2856.c b/drivers/hwmon/pmbus/mp2856.c
new file mode 100644
index 0000000000000..6969350f5d7d4
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2856.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS2856/2857
+ * Monolithic Power Systems VR Controllers
+ *
+ * Copyright (C) 2023 Quanta Computer lnc.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+/* Vendor specific registers. */
+#define MP2856_MFR_VR_MULTI_CONFIG_R1	0x0d
+#define MP2856_MFR_VR_MULTI_CONFIG_R2	0x1d
+
+#define MP2856_MUL1_BOOT_SR_R2		0x10
+#define MP2856_VR_ACTIVE		BIT(15)
+
+#define MP2856_MFR_VR_CONFIG2		0x5e
+#define MP2856_VOUT_MODE		BIT(11)
+
+#define MP2856_MFR_VR_CONFIG1		0x68
+#define MP2856_DRMOS_KCS		GENMASK(13, 12)
+
+#define MP2856_MFR_READ_CS1_2_R1	0x82
+#define MP2856_MFR_READ_CS3_4_R1	0x83
+#define MP2856_MFR_READ_CS5_6_R1	0x84
+#define MP2856_MFR_READ_CS7_8_R1	0x85
+#define MP2856_MFR_READ_CS9_10_R1	0x86
+#define MP2856_MFR_READ_CS11_12_R1	0x87
+
+#define MP2856_MFR_READ_CS1_2_R2	0x85
+#define MP2856_MFR_READ_CS3_4_R2	0x86
+#define MP2856_MFR_READ_CS5_6_R2	0x87
+
+#define MP2856_MAX_PHASE_RAIL1		8
+#define MP2856_MAX_PHASE_RAIL2		4
+
+#define MP2857_MAX_PHASE_RAIL1		12
+#define MP2857_MAX_PHASE_RAIL2		4
+
+#define MP2856_PAGE_NUM			2
+
+enum chips { mp2856 = 1, mp2857 };
+
+static const int mp2856_max_phases[][MP2856_PAGE_NUM] = {
+	[mp2856] = { MP2856_MAX_PHASE_RAIL1, MP2856_MAX_PHASE_RAIL2 },
+	[mp2857] = { MP2857_MAX_PHASE_RAIL1, MP2857_MAX_PHASE_RAIL2 },
+};
+
+static const struct i2c_device_id mp2856_id[] = {
+	{"mp2856", mp2856},
+	{"mp2857", mp2857},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, mp2856_id);
+
+struct mp2856_data {
+	struct pmbus_driver_info info;
+	int vout_format[MP2856_PAGE_NUM];
+	int curr_sense_gain[MP2856_PAGE_NUM];
+	int max_phases[MP2856_PAGE_NUM];
+	enum chips chip_id;
+};
+
+#define to_mp2856_data(x)	container_of(x, struct mp2856_data, info)
+
+#define MAX_LIN_MANTISSA	(1023 * 1000)
+#define MIN_LIN_MANTISSA	(511 * 1000)
+
+static u16 val2linear11(s64 val)
+{
+	s16 exponent = 0, mantissa;
+	bool negative = false;
+
+	if (val == 0)
+		return 0;
+
+	if (val < 0) {
+		negative = true;
+		val = -val;
+	}
+
+	/* Reduce large mantissa until it fits into 10 bit */
+	while (val >= MAX_LIN_MANTISSA && exponent < 15) {
+		exponent++;
+		val >>= 1;
+	}
+	/* Increase small mantissa to improve precision */
+	while (val < MIN_LIN_MANTISSA && exponent > -15) {
+		exponent--;
+		val <<= 1;
+	}
+
+	/* Convert mantissa from milli-units to units */
+	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
+
+	/* restore sign */
+	if (negative)
+		mantissa = -mantissa;
+
+	/* Convert to 5 bit exponent, 11 bit mantissa */
+	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
+}
+
+static int
+mp2856_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
+			u16 mask)
+{
+	int ret = pmbus_read_word_data(client, page, phase, reg);
+
+	return (ret > 0) ? ret & mask : ret;
+}
+
+static int
+mp2856_read_vout(struct i2c_client *client, struct mp2856_data *data, int page,
+		 int phase, u8 reg)
+{
+	int ret;
+
+	ret = mp2856_read_word_helper(client, page, phase, reg,
+				      GENMASK(9, 0));
+	if (ret < 0)
+		return ret;
+
+	/* convert vout result to direct format */
+	ret = (data->vout_format[page] == vid) ?
+		((ret + 49) * 5) : ((ret * 1000) >> 8);
+
+	return ret;
+}
+
+static int
+mp2856_read_phase(struct i2c_client *client, struct mp2856_data *data,
+		  int page, int phase, u8 reg)
+{
+	int ret;
+	int val;
+
+	ret = pmbus_read_word_data(client, page, phase, reg);
+	if (ret < 0)
+		return ret;
+
+	if (!((phase + 1) % MP2856_PAGE_NUM))
+		ret >>= 8;
+	ret &= 0xff;
+
+	/*
+	 * Output value is calculated as: (READ_CSx * 12.5mV - 1.23V) / (Kcs * Rcs)
+	 */
+	val = (ret * 125) - 12300;
+
+	return val2linear11(val);
+}
+
+static int
+mp2856_read_phases(struct i2c_client *client, struct mp2856_data *data,
+		   int page, int phase)
+{
+	int ret;
+
+	if (page == 0) {
+		switch (phase) {
+		case 0 ... 1:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS1_2_R1);
+			break;
+		case 2 ... 3:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS3_4_R1);
+			break;
+		case 4 ... 5:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS5_6_R1);
+			break;
+		case 6 ... 7:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS7_8_R1);
+			break;
+		default:
+			return -ENODATA;
+		}
+	} else {
+		switch (phase) {
+		case 0 ... 1:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS1_2_R2);
+			break;
+		case 2 ... 3:
+			ret = mp2856_read_phase(client, data, page, phase,
+						MP2856_MFR_READ_CS1_2_R2);
+			break;
+		default:
+			return -ENODATA;
+		}
+	}
+	return ret;
+}
+
+static int
+mp2856_read_word_data(struct i2c_client *client, int page,
+		      int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2856_data *data = to_mp2856_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = mp2856_read_vout(client, data, page, phase, reg);
+		break;
+	case PMBUS_READ_IOUT:
+		if (phase != 0xff)
+			ret = mp2856_read_phases(client, data, page, phase);
+		else
+			ret = pmbus_read_word_data(client, page, phase, reg);
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
+static int
+mp2856_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/* Enforce VOUT direct format. */
+		return PB_VOUT_MODE_DIRECT;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int
+mp2856_identify_multiphase(struct i2c_client *client, u8 reg, u8 max_phase,
+			   u16 mask)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, reg);
+	if (ret < 0)
+		return ret;
+
+	ret &= mask;
+	return (ret >= max_phase) ? max_phase : ret;
+}
+
+static int
+mp2856_identify_multiphase_rail1(struct i2c_client *client,
+				 struct mp2856_data *data)
+{
+	int ret, i;
+
+	ret = mp2856_identify_multiphase(client, MP2856_MFR_VR_MULTI_CONFIG_R1,
+					 MP2856_MAX_PHASE_RAIL1, GENMASK(3, 0));
+	if (ret < 0)
+		return ret;
+
+	data->info.phases[0] = (ret > data->max_phases[0]) ?
+				data->max_phases[0] : ret;
+
+	for (i = 0 ; i < data->info.phases[0]; i++)
+		data->info.pfunc[i] |= PMBUS_HAVE_IOUT;
+
+	return 0;
+}
+
+static int
+mp2856_identify_multiphase_rail2(struct i2c_client *client,
+				 struct mp2856_data *data)
+{
+	int ret, i;
+
+	ret = mp2856_identify_multiphase(client, MP2856_MFR_VR_MULTI_CONFIG_R2,
+					 MP2856_MAX_PHASE_RAIL2, GENMASK(2, 0));
+	if (ret < 0)
+		return ret;
+
+	data->info.phases[1] = (ret > data->max_phases[1]) ?
+				data->max_phases[1] : ret;
+
+	for (i = 0 ; i < data->info.phases[0]; i++)
+		data->info.pfunc[i] |= PMBUS_HAVE_IOUT;
+
+	return 0;
+}
+
+static int
+mp2856_current_sense_gain_get(struct i2c_client *client,
+			      struct mp2856_data *data)
+{
+	int i, ret;
+
+	/*
+	 * Obtain DrMOS current sense gain of power stage from the register
+	 * MP2856_MFR_VR_CONFIG1, bits 13-12. The value is selected as below:
+	 * 00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A. Other
+	 * values are invalid.
+	 */
+	for (i = 0 ; i < data->info.pages; i++) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+		ret = i2c_smbus_read_word_data(client,
+					       MP2856_MFR_VR_CONFIG1);
+		if (ret < 0)
+			return ret;
+
+		switch ((ret & MP2856_DRMOS_KCS) >> 12) {
+		case 0:
+			data->curr_sense_gain[i] = 50;
+			break;
+		case 1:
+			data->curr_sense_gain[i] = 85;
+			break;
+		case 2:
+			data->curr_sense_gain[i] = 97;
+			break;
+		default:
+			data->curr_sense_gain[i] = 100;
+			break;
+		}
+	}
+	return 0;
+}
+
+static int
+mp2856_identify_vout_format(struct i2c_client *client,
+			    struct mp2856_data *data)
+{
+	int i, ret;
+
+	for (i = 0; i < data->info.pages; i++) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_word_data(client, MP2856_MFR_VR_CONFIG2);
+		if (ret < 0)
+			return ret;
+
+		data->vout_format[i] = (ret & MP2856_VOUT_MODE) ? linear : vid;
+	}
+	return 0;
+}
+
+static bool
+mp2856_is_rail2_active(struct i2c_client *client)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return true;
+
+	ret = i2c_smbus_read_word_data(client, MP2856_MUL1_BOOT_SR_R2);
+	if (ret < 0)
+		return true;
+
+	return (ret & MP2856_VR_ACTIVE) ? true : false;
+}
+
+static struct pmbus_driver_info mp2856_info = {
+	.pages = MP2856_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP,
+	.read_byte_data = mp2856_read_byte_data,
+	.read_word_data = mp2856_read_word_data,
+};
+
+static int mp2856_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp2856_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2856_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
+
+	memcpy(data->max_phases, mp2856_max_phases[data->chip_id],
+	       sizeof(data->max_phases));
+
+	memcpy(&data->info, &mp2856_info, sizeof(*info));
+	info = &data->info;
+
+	/* Identify multiphase configuration. */
+	ret = mp2856_identify_multiphase_rail1(client, data);
+	if (ret < 0)
+		return ret;
+
+	if (mp2856_is_rail2_active(client)) {
+		ret = mp2856_identify_multiphase_rail2(client, data);
+		if (ret < 0)
+			return ret;
+	} else {
+		/* rail2 is not active */
+		info->pages = 1;
+	}
+
+	/* Obtain current sense gain of power stage. */
+	ret = mp2856_current_sense_gain_get(client, data);
+	if (ret)
+		return ret;
+
+	/* Identify vout format. */
+	ret = mp2856_identify_vout_format(client, data);
+	if (ret)
+		return ret;
+
+	/* set the device to page 0 */
+	i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id __maybe_unused mp2856_of_match[] = {
+	{.compatible = "mps,mp2856", .data = (void *)mp2856},
+	{.compatible = "mps,mp2857", .data = (void *)mp2857},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2856_of_match);
+
+static struct i2c_driver mp2856_driver = {
+	.driver = {
+		.name = "mp2856",
+		.of_match_table = mp2856_of_match,
+	},
+	.probe = mp2856_probe,
+	.id_table = mp2856_id,
+};
+
+module_i2c_driver(mp2856_driver);
+
+MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2856/MP2857 device");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.31.1

