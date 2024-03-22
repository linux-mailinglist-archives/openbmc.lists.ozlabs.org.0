Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A580887614
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 01:28:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ClfCxQ34;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1g5v0pF2z3vjg
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 11:28:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ClfCxQ34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1FS50Nl7z3dXC
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 19:12:35 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so1285525b3a.2
        for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711095153; x=1711699953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo9cV2YKA6xEmn26+e3S5Ay1MfdOdpNUnU0fzzKOH6w=;
        b=ClfCxQ34pi+EiEYCz67G/zZlefxNaDJMP3wwfY/Gf0IbGYNhI+k2jGvzuCqsyDMZNz
         xAJ5OqFiaU7F9Qzaay8A6Ocf0TbUO2A6JX0or3Xwtjf/0qKbybyvnwtC+1PTUqeKDfmj
         N7hLSm1gkbK0Z5xXhc9Gd6o9fSw2j/IS3Sa2b89BL7b3A0YPNkuie4fMHpah80To9dsF
         flD0GtkubyRrbNnBSjrtuyK/LzM5yQkQETIa+w9sAML8hnQe0wesheUGEh63zySTl4bg
         IEREXb5QejOALBiw4VS1ENe+mHGcyIP9JfGeKSO7IvkVtxlLZgfVJ2OMKMAeJG4FfW3o
         J2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711095153; x=1711699953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uo9cV2YKA6xEmn26+e3S5Ay1MfdOdpNUnU0fzzKOH6w=;
        b=fU3EFvDog55+C+Mk6BnwmZ8E2XfJ7TiEJXGIsJNHhetnZ6P/QHPnw+FCKSP8n7lGNa
         rrzY84yiK6Ha/+mNyio9lftLQ4ohZoEeC7pyjxhRoJnaJ/LZ/knICJwIngCHETNcvAaw
         +td3lZWfF3Fu/reauHAwPSW+lSpbgApWpGU4OhRHbvb59n5VdHJkLEwWNtkRbxmDiJB0
         mhDeC9PK7vWeFWZiTS468xQOg4Gw0RIPnQCAtPWEru9ZEzC8N+xO7Iiw45d11gkPaFym
         /lBUnNneMqbfg6w3L7LT+aOCKSEBoYgoBqzk0wsr3klh67e4xa0rELklAiJjrgDcrVwe
         YZSA==
X-Forwarded-Encrypted: i=1; AJvYcCWbcq3KSNA9QJ/G07lQy2Ku8SAiNICXQAoBHPheqaW1jJMckZeXjQBSXugXgAecEjDChyBrVVHkJYeIB821zF8tLTelFMl8zqQ=
X-Gm-Message-State: AOJu0YzQPV+DC7wMXCn4Z6+8HBVuLuZeSw78ayc3IxXnO8sF+O8P79uZ
	4qUO6fwiUYPveUyT86xjd9tHwTy8vD4oh3ZPD7JVB8GzW7sjrzRt
X-Google-Smtp-Source: AGHT+IEzCKlhwhomnrIWsLy5cE98Frk3FU0bSRUX8zOrVCZQfn4Pog2hmMH3a0VumXYzrzJo9QUdsQ==
X-Received: by 2002:a05:6a00:2d95:b0:6ea:7486:84ac with SMTP id fb21-20020a056a002d9500b006ea748684acmr2121868pfb.4.1711095153150;
        Fri, 22 Mar 2024 01:12:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s128-20020a625e86000000b006e749161d40sm1132564pfb.113.2024.03.22.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:12:32 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
Date: Fri, 22 Mar 2024 16:11:58 +0800
Message-Id: <20240322081158.4106326-3-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Mar 2024 11:26:13 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

The NCT7363Y is a fan controller which provides up to 16
independent FAN input monitors. It can report each FAN input count
values. The NCT7363Y also provides up to 16 independent PWM
outputs. Each PWM can output specific PWM signal by manual mode to
control the FAN duty outside.

Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/nct7363.rst |  33 +++
 MAINTAINERS                     |   2 +
 drivers/hwmon/Kconfig           |  11 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/nct7363.c         | 396 ++++++++++++++++++++++++++++++++
 6 files changed, 444 insertions(+)
 create mode 100644 Documentation/hwmon/nct7363.rst
 create mode 100644 drivers/hwmon/nct7363.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..0874f2f754f4 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -170,6 +170,7 @@ Hardware Monitoring Kernel Drivers
    mpq8785
    nct6683
    nct6775
+   nct7363
    nct7802
    nct7904
    npcm750-pwm-fan
diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7363.rst
new file mode 100644
index 000000000000..1a6abce3a433
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
+The NCT7363Y is a fan controller which provides up to 16 independent
+FAN input monitors, and up to 16 independent PWM outputs with SMBus interface.
+
+
+Sysfs entries
+-------------
+
+Currently, the driver supports the following features:
+
+==========  ==========================================
+fanX_input  provide current fan rotation value in RPM
+
+pwmX        get or set PWM fan control value.
+==========  ==========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 2705e44ffc0c..c016a0bed476 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15221,6 +15221,8 @@ M:	Ban Feng <kcfeng0@nuvoton.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
+F:	Documentation/hwmon/nct7363.rst
+F:	drivers/hwmon/nct7363.c
 
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 83945397b6eb..4ff19ea11001 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1658,6 +1658,17 @@ config SENSORS_NCT6775_I2C
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6775-i2c.
 
+config SENSORS_NCT7363
+	tristate "Nuvoton NCT7363Y"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the Nuvoton NCT7363Y
+	  hardware monitoring chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nct7363.
+
 config SENSORS_NCT7802
 	tristate "Nuvoton NCT7802Y"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5c31808f6378..cf7be22b916a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 nct6775-objs			:= nct6775-platform.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
 obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
+obj-$(CONFIG_SENSORS_NCT7363)	+= nct7363.o
 obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
 obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
 obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
new file mode 100644
index 000000000000..858296f5d5b3
--- /dev/null
+++ b/drivers/hwmon/nct7363.c
@@ -0,0 +1,396 @@
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
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define NCT7363_REG_FUNC_CFG_BASE(x)	(0x20 + (x))
+#define NCT7363_REG_PWMEN_BASE(x)	(0x38 + (x))
+#define NCT7363_REG_FANINEN_BASE(x)	(0x41 + (x))
+#define NCT7363_REG_FANINX_HVAL(x)	(0x48 + ((x) * 2))
+#define NCT7363_REG_FANINX_LVAL(x)	(0x49 + ((x) * 2))
+#define NCT7363_REG_FSCPXDUTY(x)	(0x90 + ((x) * 2))
+
+#define PWM_SEL(x)			(BIT(0) << ((x) * 2))
+#define FANIN_SEL(x)			(BIT(1) << ((x < 8) ? \
+					 (((x) + 8) * 2) : \
+					 (((x) % 8) * 2)))
+#define VALUE_TO_REG(x, y)		(((x) >> ((y) * 8)) & 0xFF)
+
+#define NCT7363_FANINX_LVAL_MASK	GENMASK(4, 0)
+#define NCT7363_FANIN_MASK		GENMASK(12, 0)
+
+#define NCT7363_PWM_COUNT		16
+
+static inline unsigned int FAN_FROM_REG(u16 val)
+{
+	if (val == NCT7363_FANIN_MASK || val == 0)
+		return 0;
+
+	return (1350000UL / val);
+}
+
+enum chips { nct7363, nct7362 };
+
+static const struct i2c_device_id nct7363_id[] = {
+	{ "nct7363", nct7363 },
+	{ "nct7362", nct7362 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, nct7363_id);
+
+static const struct of_device_id nct7363_of_match[] = {
+	{ .compatible = "nuvoton,nct7363", .data = (void *)nct7363 },
+	{ .compatible = "nuvoton,nct7362", .data = (void *)nct7362 },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, nct7363_of_match);
+
+struct nct7363_data {
+	struct regmap		*regmap;
+	struct mutex		lock;		/* protect register access */
+
+	u16			fanin_mask;
+	u16			pwm_mask;
+};
+
+static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
+			    long *val)
+{
+	struct nct7363_data *data = dev_get_drvdata(dev);
+	unsigned int hi, lo, rpm;
+	int ret = 0;
+	u16 cnt;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		/*
+		 * High-byte register should be read first to latch
+		 * synchronous low-byte value
+		 */
+		mutex_lock(&data->lock);
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FANINX_HVAL(channel), &hi);
+		if (ret)
+			goto out;
+
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FANINX_LVAL(channel), &lo);
+		if (ret)
+			goto out;
+		mutex_unlock(&data->lock);
+
+		cnt = (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
+		rpm = FAN_FROM_REG(cnt);
+		*val = (long)rpm;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+out:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int channel)
+{
+	const struct nct7363_data *data = _data;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		if (data->fanin_mask & BIT(channel))
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
+	struct nct7363_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		ret = regmap_read(data->regmap,
+				  NCT7363_REG_FSCPXDUTY(channel), &regval);
+		if (ret)
+			return ret;
+
+		*val = (long)regval;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct7363_write_pwm(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct nct7363_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+
+		ret = regmap_write(data->regmap,
+				   NCT7363_REG_FSCPXDUTY(channel), val);
+
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
+		if (data->pwm_mask & BIT(channel))
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
+static int nct7363_init_chip(struct nct7363_data *data)
+{
+	u32 func_config = 0;
+	int i, ret;
+
+	/* Pin Function Configuration */
+	for (i = 0; i < NCT7363_PWM_COUNT; i++) {
+		if (data->pwm_mask & BIT(i))
+			func_config |= PWM_SEL(i);
+		if (data->fanin_mask & BIT(i))
+			func_config |= FANIN_SEL(i);
+	}
+
+	for (i = 0; i < 4; i++) {
+		ret = regmap_write(data->regmap, NCT7363_REG_FUNC_CFG_BASE(i),
+				   VALUE_TO_REG(func_config, i));
+		if (ret < 0)
+			return ret;
+	}
+
+	/* PWM and FANIN Monitoring Enable */
+	for (i = 0; i < 2; i++) {
+		ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_BASE(i),
+				   VALUE_TO_REG(data->pwm_mask, i));
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_BASE(i),
+				   VALUE_TO_REG(data->fanin_mask, i));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int nct7363_present_pwm_fanin(struct device *dev,
+				     struct device_node *child,
+				     struct nct7363_data *data)
+{
+	u8 fanin_ch[NCT7363_PWM_COUNT];
+	struct of_phandle_args args;
+	int ret, fanin_cnt;
+	u8 ch, index;
+
+	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
+					 0, &args);
+	if (ret)
+		return ret;
+
+	if (args.args[0] >= NCT7363_PWM_COUNT)
+		return -EINVAL;
+	data->pwm_mask |= BIT(args.args[0]);
+
+	fanin_cnt = of_property_count_u8_elems(child, "tach-ch");
+	if (fanin_cnt < 1 || fanin_cnt > NCT7363_PWM_COUNT)
+		return -EINVAL;
+
+	ret = of_property_read_u8_array(child, "tach-ch", fanin_ch, fanin_cnt);
+	if (ret)
+		return ret;
+
+	for (ch = 0; ch < fanin_cnt; ch++) {
+		index = fanin_ch[ch];
+		if (index >= NCT7363_PWM_COUNT)
+			return -EINVAL;
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
+	mutex_init(&data->lock);
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

