Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBD8224FB
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:53:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=ZSIO2+3k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4SnK2y7qz3c1g
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:53:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZSIO2+3k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8wt5SYdz30YL
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:34:38 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d2e6e14865so10133025ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208876; x=1703813676; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNnL9mnUGLe/K7sBf/Kwegnxk1AkTlprT7jbYAfh6dQ=;
        b=ZSIO2+3k7EvvS375AnTs9iLpGiU99vl4Yo0MauXaONIp6nPwYNi5fr7IDKKcsh7dM7
         Iwgdkg7XMIjOiOdVLUdvI4m3oxjUqRRX3F591SwnpPXmfLodTtHWfZJxD0F4LV96MuXM
         l4YguDvJLFtGb0cpXJdL/Y7XUyvBqaiZ5mY3D50qLilSeep0HedMJrAqUims0pXX5XpT
         GSQ9fjJtxp3UXfRBNqdM5+WpdrBIIWPvKcDcpdyrRCcF/cfCQmeSNcO3rbtozl5XpJPI
         W0kBUkBLmlnY1QNfkY4g3CfF19pQK5CRz+5Ji1X+4wSzN3UG2AR5cg42hRQWyYY4FQ5k
         b5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208876; x=1703813676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNnL9mnUGLe/K7sBf/Kwegnxk1AkTlprT7jbYAfh6dQ=;
        b=TPaAj58aqIbSCEccoS3THeUHz4QrO6M8vw98ayL7q5LLPzuUCFrJwuvYnqfPTYzCgc
         fJSOZCofVEZUeOEczrBrkB5/MDX5+tWS6xxfwZ4s6jSXyaLoetD8JfnjSG7pF4Y21jIl
         RC1Xi/paqCgohD2q9jpLWBNe9BJJkOS3SZKZ3nyRhAJWfnNNR2BvvaEppO75SNdRIROm
         HHQXCRPZz4U22ImXlURSmMbdXCr7ronlT5UoTbDZ6kMjacKEnZg4M3V1BMvkE8tCfQ7O
         It2matEqni6nfgL1ZTlLwyHz8UI7CZyrR4DEBa70UsL9/iNazX14cX0Ht22MuwRK0Gz4
         559A==
X-Gm-Message-State: AOJu0YwurLnvhHMyX3vLlFt7G7gpNXOvVzLtq0zbSYI1z84Un2a7VueK
	RzCVuUMGrxKtNHSoiSFPvlY=
X-Google-Smtp-Source: AGHT+IHbKMfQWNSJ2GJ9ywmJ1/Rj3jm69vq1hP/XJwlOUm7ICYW8lcvifclY0YIzjgfbznxlAtohvA==
X-Received: by 2002:a17:903:110f:b0:1cf:ce79:8900 with SMTP id n15-20020a170903110f00b001cfce798900mr509448plh.22.1703208875901;
        Thu, 21 Dec 2023 17:34:35 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001d3d8e718c6sm2258634plg.282.2023.12.21.17.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:34:35 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v3 3/3] hwmon: Driver for Nuvoton NCT7363Y
Date: Fri, 22 Dec 2023 09:33:52 +0800
Message-Id: <20231222013352.3873689-4-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:46:15 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.

Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/nct7363.rst |  33 ++
 MAINTAINERS                     |   2 +
 drivers/hwmon/Kconfig           |  11 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/nct7363.c         | 515 ++++++++++++++++++++++++++++++++
 6 files changed, 563 insertions(+)
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 72f4e6065bae..178d3cae95de 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -161,6 +161,7 @@ Hardware Monitoring Kernel Drivers
    mp5023
    nct6683
    nct6775
+   nct7363
    nct7802
    nct7904
    npcm750-pwm-fan
diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7363.rst
new file mode 100644
index 000000000000..89699c95aa4b
--- /dev/null
+++ b/Documentation/hwmon/nct7363.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver nct7363
+=====================
+
+Supported chip:
+
+  * Nuvoton NCT7363Y
+
+    Prefix: nct7363
+
+    Addresses: I2C 0x20, 0x21, 0x22, 0x23
+
+Author: Ban Feng <kcfeng0@nuvoton.com>
+
+
+Description
+-----------
+
+The NCT7363Y is a Fan controller which provides up to 16 independent
+FAN input monitors, and up to 16 independent PWM output with SMBus interface.
+
+
+Sysfs entries
+-------------
+
+Currently, the driver supports the following features:
+
+======================= =======================================================
+fanX_input		provide current fan rotation value in RPM
+
+pwmX			get or set PWM fan control value.
+======================= =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 53cfcc629aa1..e39c4fc01a3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14842,6 +14842,8 @@ M:	Ban Feng <kcfeng0@nuvoton.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
+F:	Documentation/hwmon/nct7363.rst
+F:	drivers/hwmon/nct7363.c
 
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index cf27523eed5a..a0229851fc64 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1605,6 +1605,17 @@ config SENSORS_NCT6775_I2C
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6775-i2c.
 
+config SENSORS_NCT7363
+	tristate "Nuvoton NCT7363Y"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the Nuvoton NCT7363Y,
+	  hardware monitoring chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nct7363.
+
 config SENSORS_NCT7802
 	tristate "Nuvoton NCT7802Y"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e84bd9685b5c..dd794aa06209 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 nct6775-objs			:= nct6775-platform.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
 obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
+obj-$(CONFIG_SENSORS_NCT7363)	+= nct7363.o
 obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
 obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
 obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
new file mode 100644
index 000000000000..1bf6e83afd7f
--- /dev/null
+++ b/drivers/hwmon/nct7363.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 Nuvoton Technology corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define NCT7363_REG_GPIO_0_3		0x20
+#define NCT7363_REG_GPIO_4_7		0x21
+#define NCT7363_REG_GPIO_10_13		0x22
+#define NCT7363_REG_GPIO_14_17		0x23
+#define NCT7363_REG_PWMEN_0_7		0x38
+#define NCT7363_REG_PWMEN_8_15		0x39
+#define NCT7363_REG_FANINEN_0_7		0x41
+#define NCT7363_REG_FANINEN_8_15	0x42
+#define NCT7363_REG_FANINx_HVAL(x)	(0x48 + ((x) * 2))
+#define NCT7363_REG_FANINx_LVAL(x)	(0x49 + ((x) * 2))
+#define NCT7363_REG_FSCPxDUTY(x)	(0x90 + ((x) * 2))
+#define NCT7363_REG_VENDOR_ID		0xFD
+#define NCT7363_REG_CHIP_ID		0xFE
+#define NCT7363_REG_DEVICE_ID		0xFF
+
+#define NUVOTON_ID			0x49
+#define CHIP_ID				0x19
+#define DEVICE_ID			0x88
+
+#define PWM_SEL(x)			(BIT(0) << ((x % 4) * 2))
+#define FANIN_SEL(x)			(BIT(1) << ((x % 4) * 2))
+#define BIT_CHECK(x)			(BIT(0) << x)
+
+#define NCT7363_FANINx_LVAL_MASK	GENMASK(4, 0)
+#define NCT7363_FANIN_MASK		GENMASK(12, 0)
+
+#define NCT7363_PWM_COUNT		16
+#define NCT7363_FANIN_COUNT		16
+
+#define REFRESH_INTERVAL		(2 * HZ)
+
+static inline unsigned long FAN_FROM_REG(u16 val)
+{
+	if ((val >= NCT7363_FANIN_MASK) || (val == 0))
+		return	0;
+
+	return (1350000UL / val);
+}
+
+static const unsigned short normal_i2c[] = {
+	0x20, 0x21, 0x22, 0x23, I2C_CLIENT_END
+};
+
+enum chips { nct7363 };
+
+static const struct i2c_device_id nct7363_id[] = {
+	{ "nct7363", nct7363 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nct7363_id);
+
+static const struct of_device_id nct7363_of_match[] = {
+	{ .compatible = "nuvoton,nct7363", .data = (void *)nct7363 },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, nct7363_of_match);
+
+struct nct7363_data {
+	struct regmap		*regmap;
+	struct mutex		update_lock;
+	bool			valid;
+	unsigned long		last_updated; /* In jiffies */
+
+	u16			fanin_mask;
+	u16			fan[NCT7363_FANIN_COUNT];
+	u16			pwm_mask;
+	u8			pwm[NCT7363_PWM_COUNT];
+};
+
+static struct nct7363_data *nct7363_update_device(struct device *dev)
+{
+	struct nct7363_data *data = dev_get_drvdata(dev);
+	unsigned int hi, lo, regval;
+	int i, ret = 0;
+
+	mutex_lock(&data->update_lock);
+
+	if (!(time_after(jiffies, data->last_updated + REFRESH_INTERVAL)
+	      || !data->valid))
+		goto no_sensor_update;
+
+	for (i = 0; i < ARRAY_SIZE(data->fan); i++) {
+		if (!(data->fanin_mask & BIT_CHECK(i)))
+			continue;
+
+		/*
+		 * High-byte register should be read first to latch
+		 * synchronous low-byte value
+		 */
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FANINx_HVAL(i), &hi);
+		if (ret)
+			goto error;
+
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FANINx_LVAL(i), &lo);
+		if (ret)
+			goto error;
+
+		data->fan[i] = (hi << 5) | (lo & NCT7363_FANINx_LVAL_MASK);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(data->pwm); i++) {
+		if (!(data->pwm_mask & BIT_CHECK(i)))
+			continue;
+
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FSCPxDUTY(i), &regval);
+		if (ret)
+			goto error;
+
+		data->pwm[i] = regval;
+	}
+
+	data->last_updated = jiffies;
+	data->valid = true;
+
+error:
+	if (ret)
+		data = ERR_PTR(ret);
+
+no_sensor_update:
+	mutex_unlock(&data->update_lock);
+
+	return data;
+}
+
+static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct7363_data *data = nct7363_update_device(dev);
+	u16 cnt, rpm;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_fan_input:
+		cnt = data->fan[channel] & NCT7363_FANIN_MASK;
+		rpm = FAN_FROM_REG(cnt);
+		*val = (long)rpm;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int channel)
+{
+	const struct nct7363_data *data = _data;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		if (data->fanin_mask & BIT_CHECK(channel))
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int nct7363_read_pwm(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct7363_data *data = nct7363_update_device(dev);
+	u16 ret;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		ret = data->pwm[channel];
+		*val = (long)ret;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct7363_write_pwm(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct nct7363_data *data = nct7363_update_device(dev);
+	int ret;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		mutex_lock(&data->update_lock);
+		ret = regmap_write(data->regmap,
+				   NCT7363_REG_FSCPxDUTY(channel), val);
+		if (ret == 0)
+			data->pwm[channel] = val;
+		mutex_unlock(&data->update_lock);
+		return ret;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t nct7363_pwm_is_visible(const void *_data, u32 attr, int channel)
+{
+	const struct nct7363_data *data = _data;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (data->pwm_mask & BIT_CHECK(channel))
+			return 0644;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int nct7363_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_fan:
+		return nct7363_read_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return nct7363_read_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct7363_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		return nct7363_write_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t nct7363_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return nct7363_fan_is_visible(data, attr, channel);
+	case hwmon_pwm:
+		return nct7363_pwm_is_visible(data, attr, channel);
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_channel_info *nct7363_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops nct7363_hwmon_ops = {
+	.is_visible = nct7363_is_visible,
+	.read = nct7363_read,
+	.write = nct7363_write,
+};
+
+static const struct hwmon_chip_info nct7363_chip_info = {
+	.ops = &nct7363_hwmon_ops,
+	.info = nct7363_info,
+};
+
+/* Return 0 if detection is successful, -ENODEV otherwise */
+static int nct7363_detect(struct i2c_client *client,
+			  struct i2c_board_info *info)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	int vendor, chip, device;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -ENODEV;
+
+	vendor = i2c_smbus_read_byte_data(client, NCT7363_REG_VENDOR_ID);
+	if (vendor != NUVOTON_ID)
+		return -ENODEV;
+
+	chip = i2c_smbus_read_byte_data(client, NCT7363_REG_CHIP_ID);
+	if (chip != CHIP_ID)
+		return -ENODEV;
+
+	device = i2c_smbus_read_byte_data(client, NCT7363_REG_DEVICE_ID);
+	if (device != DEVICE_ID)
+		return -ENODEV;
+
+	strscpy(info->type, "nct7363", I2C_NAME_SIZE);
+
+	return 0;
+}
+
+static int nct7363_init_chip(struct nct7363_data *data)
+{
+	u8 i, gpio0_3 = 0, gpio4_7 = 0, gpio10_13 = 0, gpio14_17 = 0;
+	int ret;
+
+	for (i = 0; i < NCT7363_PWM_COUNT; i++) {
+		if (i < 4) {
+			if (data->pwm_mask & BIT_CHECK(i))
+				gpio0_3 |= PWM_SEL(i);
+			if (data->fanin_mask & BIT_CHECK(i))
+				gpio10_13 |= FANIN_SEL(i);
+		} else if (i < 8) {
+			if (data->pwm_mask & BIT_CHECK(i))
+				gpio4_7 |= PWM_SEL(i);
+			if (data->fanin_mask & BIT_CHECK(i))
+				gpio14_17 |= FANIN_SEL(i);
+		} else if (i < 12) {
+			if (data->pwm_mask & BIT_CHECK(i))
+				gpio10_13 |= PWM_SEL(i);
+			if (data->fanin_mask & BIT_CHECK(i))
+				gpio0_3 |= FANIN_SEL(i);
+		} else {
+			if (data->pwm_mask & BIT_CHECK(i))
+				gpio14_17 |= PWM_SEL(i);
+			if (data->fanin_mask & BIT_CHECK(i))
+				gpio4_7 |= FANIN_SEL(i);
+		}
+	}
+
+	/* Pin Function Configuration */
+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_0_3, gpio0_3);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_4_7, gpio4_7);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_10_13, gpio10_13);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_14_17, gpio14_17);
+	if (ret < 0)
+		return ret;
+
+	/* PWM and FANIN Monitoring Enable */
+	ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_0_7,
+			   data->pwm_mask & 0xff);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_8_15,
+			   (data->pwm_mask >> 8) & 0xff);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_0_7,
+			   data->fanin_mask & 0xff);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_8_15,
+			   (data->fanin_mask >> 8) & 0xff);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int nct7363_present_pwm_fanin(struct device *dev,
+				     struct device_node *child,
+				     struct nct7363_data *data)
+{
+	struct of_phandle_args args;
+	int ret, fanin_cnt;
+	u8 *fanin_ch;
+	u8 ch, index;
+
+	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
+					 0, &args);
+	if (ret)
+		return ret;
+
+	data->pwm_mask |= BIT(args.args[0]);
+
+	fanin_cnt = of_property_count_u8_elems(child, "tach-ch");
+	if (fanin_cnt < 1)
+		return -EINVAL;
+
+	fanin_ch = devm_kcalloc(dev, fanin_cnt, sizeof(*fanin_ch), GFP_KERNEL);
+	if (!fanin_ch)
+		return -ENOMEM;
+
+	ret = of_property_read_u8_array(child, "tach-ch", fanin_ch, fanin_cnt);
+	if (ret)
+		return ret;
+
+	for (ch = 0; ch < fanin_cnt; ch++) {
+		index = fanin_ch[ch];
+		data->fanin_mask |= BIT(index);
+	}
+
+	return 0;
+}
+
+static const struct regmap_config nct7363_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int nct7363_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *child;
+	struct nct7363_data *data;
+	struct device *hwmon_dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = devm_regmap_init_i2c(client, &nct7363_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	mutex_init(&data->update_lock);
+
+	for_each_child_of_node(dev->of_node, child) {
+		ret = nct7363_present_pwm_fanin(dev, child, data);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	/* Initialize the chip */
+	ret = nct7363_init_chip(data);
+	if (ret)
+		return ret;
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev, client->name, data,
+						     &nct7363_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct i2c_driver nct7363_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "nct7363",
+		.of_match_table = nct7363_of_match,
+	},
+	.probe = nct7363_probe,
+	.id_table = nct7363_id,
+	.detect = nct7363_detect,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(nct7363_driver);
+
+MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
+MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
+MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

