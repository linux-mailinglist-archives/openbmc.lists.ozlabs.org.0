Return-Path: <openbmc+bounces-418-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68518B1CF94
	for <lists+openbmc@lfdr.de>; Thu,  7 Aug 2025 02:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by6kw21Pcz3bkb;
	Thu,  7 Aug 2025 10:01:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754482361;
	cv=none; b=fI7V95BUXrFd3ARzs3GMtRgwdjwqCSBYPGNe37v4j0bBe4uG2A11LWP7gdy+2fusjo1gXWZUdTzadDLlYvkSGPOoFrcI0zgXmNkxaWm+Rx7yW7FKQA76aC0o81598pNhrL8jpuyW1G6YpkVHvPrULIJgjOQyFZLdJLolvmZnVNH0/uPrgJn9UtP5l+ZgkCNvGWoJ12ZPW96TY7ojXpMjZQCZZsKL1PbaT5qJ1oPMp31iDGyoW5EA6vkySfPSPEDNiRyNTEP2o2GQyBLoKxBRE1Y2VImNtUBcNPASG1TKrihO4x9WfFS9Qq8soYEIKE7AC0uSett1n+upfsYrEzAHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754482361; c=relaxed/relaxed;
	bh=bUuRw/uP3eX4lo9DLBbcc7Qn+qqbAH+Pnq6vmx0iXYU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZivwfrM05x8cwYeCGYLXsXflLxE7FblMVg5rOFDt/obPTQtgB/zohMyEAebhBt3HZZFnq2nUZnVSIH0Mm+T/uC4rtBG3bMmg4vIOMkpYj8ELtnB+C8xhfW7cWg0v8nRXI/zdZTY5pj9+7B+Q9FSsFIdjbAW8NOmzMqGelqxoj77dv0jsrOH90oEpKco0y9kLVV2oS87DS3E/4fmwEMApxWR4uQs7DyryG0PeNT3pHVtnO1HstLofug3aCRdUxjkFb+UXVIoXR9CKg1kfp0+trHc/6R5cGCAefSnPsRjcSLUDTnXZcjIZ6TWO18t0yAqXVHDRxw/k8lmX4GJ25qeZyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TS6mR5TD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TS6mR5TD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxq1N3l96z30W5
	for <openbmc@lists.ozlabs.org>; Wed,  6 Aug 2025 22:12:39 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76bc55f6612so800395b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Aug 2025 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754482357; x=1755087157; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bUuRw/uP3eX4lo9DLBbcc7Qn+qqbAH+Pnq6vmx0iXYU=;
        b=TS6mR5TDpqa6v8XggYawqRFL0YU5JXLqkCSjlXtafYpm4YpFbQg22D4bcIkElX6JA9
         8TygJW9qah5IB2hYsEfbtD2AZYojAhb0Hb6tBB7ho72+QYlQbZ+MMX6I6bclajXsPJ5i
         qaXlV+I8Zm8rwmmdXr7vMoHZIFxk5V0+CNEoM1X2KO4yj6Al7ew69bs4aFTEeJ6H104S
         OE/4Il60uuaZxRAWAKgXeLeYXHxVGoQcouBfvEYZAxyptvI/JWZ9b1IYAqoMA1tBnPXw
         Xp+Icdus111EFWGuXGaJbKlT+Sh3Me0UcAj+6atT1vRBXtEtLR+jBJLwQEj7G9aPmJy4
         cWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754482357; x=1755087157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUuRw/uP3eX4lo9DLBbcc7Qn+qqbAH+Pnq6vmx0iXYU=;
        b=VK4GVM2xya08O/k34IN7EhdM4S+90phNDGDZ/URIM6w0L8bEB+q/9KelU9JyYBIGAr
         u5PATubfsirnDB/9vw2ccQR/VA2BCvzGEGnSeW8YQXEhEVo/uLcZ3DsMn8VH+54seba1
         BfRuOBXarmLy0vty+W3TxkzW6+Kqrv51ZJuaqhTVybxenyFA7BggYd4lkU+Q5qsqGahd
         LOIjoqbknrSK2tXfq3m3om1Zqo5Ube1Xum3gLqQ6ZaZM+TQoxjjKSSAYvkG+OxQ6V2+2
         MEPbQdyXyPeCZ6l4wHw+CfV+H4ct3U5KabXYLH8Qb9QSgKqCcNY0AfpGhNCfEApStr2E
         Rgfw==
X-Forwarded-Encrypted: i=1; AJvYcCXSggZZ6WLtSsUZCTMskBTuXCGouuKfBcgOA0jAzKPlgHcU/ripCTGYMNGnfasVTF5VABoLxLyq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyDROHg8hjCQ6iapni6Oj7ZeZMOSCnRrOoksbaUeyYX0bzoANZ
	dfVFKeUhOJjiKglMjfHEim2wa7r8m+HzR5/WFhWy8AUKwGxufKBgmOSn250fRA==
X-Gm-Gg: ASbGncv+UdWR0Ro1B8frVPMXxgFaSG+bExIMOY5OQIsUsIbPiZn6H6zidJDkOKKHRHa
	mkmBwgvUiI8wWgbdYxkuPqrZzSTwO+CxDmUE5MfYM7hHRM5bYFemRWEwaNCOVqIcBGXrnyA+UFg
	R1c5Ecf20qv2srFSRL+Ay2ITIbCLK6CRauhg1hGrXQi03YmdwU5xRUwDEC3nPETUeoaoQgBbVAV
	Cn3sLUhNaoFm2rBOMz/fD1LGt3VTcptNixb2eXGYkCux+Pr+AkKc7Oa5z1+7TJWKxR8keBE7t71
	oNBFm81TVz8OarbHCjp+o2C56gfJTL445ucOXPmKVVCjE1oUAp1lZGEo/grX3JvDo0+hdAKIEmy
	qij6H4kQ2RU9uDIE5U+8oi4zxkgebrFCsIXK1fMByIIZij40qlJqno2XXUiDpqSuvjWeFk6Ujhf
	2HoAFB8YQBzSw=
X-Google-Smtp-Source: AGHT+IECcMvOyk+ET5/yKxVJ5O9hkgsXDmPvXFmIk7vOHnR/KQZ/RCZHPS1+tFDYuDJ/SZM/VPCNhA==
X-Received: by 2002:a05:6a00:2e15:b0:76b:dfd4:b8bf with SMTP id d2e1a72fcca58-76c29547878mr3462525b3a.0.1754482356485;
        Wed, 06 Aug 2025 05:12:36 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f474sm15212060b3a.4.2025.08.06.05.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:12:35 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 1/2] hwmon: Add driver for MPS MPQ8785 Synchronous Step-Down Converter
Date: Wed,  6 Aug 2025 20:12:31 +0800
Message-ID: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Charles Hsu <ythsu0511@gmail.com>

Add support for mpq8785 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is synchronous step-down controller.

Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
Link: https://lore.kernel.org/r/20240131074822.2962078-2-ythsu0511@gmail.com
[groeck: probe_new --> probe; add MODULE_IMPORT_NS(PMBUS)]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit f20b4a931130cb574c40563cfda0fc2cb944b4df)
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/mpq8785.rst | 94 +++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  9 ++++
 drivers/hwmon/pmbus/Makefile    |  1 +
 drivers/hwmon/pmbus/mpq8785.c   | 90 +++++++++++++++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/hwmon/mpq8785.rst
 create mode 100644 drivers/hwmon/pmbus/mpq8785.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 88dadea85cfc..1f9dd8786609 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
    mp2888
    mp2975
    mp5023
+   mpq8785
    nct6683
    nct6775
    nct7802
diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
new file mode 100644
index 000000000000..bf8176b87086
--- /dev/null
+++ b/Documentation/hwmon/mpq8785.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver mpq8785
+=======================
+
+Supported chips:
+
+  * MPS MPQ8785
+
+    Prefix: 'mpq8785'
+
+Author: Charles Hsu <ythsu0511@gmail.com>
+
+Description
+-----------
+
+The MPQ8785 is a fully integrated, PMBus-compatible, high-frequency, synchronous
+buck converter. The MPQ8785 offers a very compact solution that achieves up to
+40A output current per phase, with excellent load and line regulation over a
+wide input supply range. The MPQ8785 operates at high efficiency over a wide
+output current load range.
+
+The PMBus interface provides converter configurations and key parameters
+monitoring.
+
+The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
+control, which provides fast transient response and eases loop stabilization.
+The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
+with excellent current sharing and phase interleaving for high-current
+applications.
+
+Fully integrated protection features include over-current protection (OCP),
+over-voltage protection (OVP), under-voltage protection (UVP), and
+over-temperature protection (OTP).
+
+The MPQ8785 requires a minimal number of readily available, standard external
+components, and is available in a TLGA (5mmx6mm) package.
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
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
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
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index b4e93bd5835e..705cf1cc07cc 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -349,6 +349,15 @@ config SENSORS_MPQ7932
 	  This driver can also be built as a module. If so, the module will
 	  be called mpq7932.
 
+config SENSORS_MPQ8785
+	tristate "MPS MPQ8785"
+	help
+	  If you say yes here you get hardware monitoring functionality support
+	  for power management IC MPS MPQ8785.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mpq8785.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 84ee960a6c2d..14f004c26a3f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
+obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
new file mode 100644
index 000000000000..4e2549cc8120
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MPQ8785 Step-Down Converter
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static int mpq8785_identify(struct i2c_client *client,
+			    struct pmbus_driver_info *info)
+{
+	int vout_mode;
+
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode < 0 || vout_mode == 0xff)
+		return vout_mode < 0 ? vout_mode : -ENODEV;
+	switch (vout_mode >> 5) {
+	case 0:
+		info->format[PSC_VOLTAGE_OUT] = linear;
+		break;
+	case 1:
+	case 2:
+		info->format[PSC_VOLTAGE_OUT] = direct,
+		info->m[PSC_VOLTAGE_OUT] = 64;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = 1;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+};
+
+static struct pmbus_driver_info mpq8785_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 4,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 1,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	.identify = mpq8785_identify,
+};
+
+static int mpq8785_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mpq8785_info);
+};
+
+static const struct i2c_device_id mpq8785_id[] = {
+	{ "mpq8785", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, mpq8785_id);
+
+static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpq8785" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mpq8785_of_match);
+
+static struct i2c_driver mpq8785_driver = {
+	.driver = {
+		   .name = "mpq8785",
+		   .of_match_table = of_match_ptr(mpq8785_of_match),
+	},
+	.probe = mpq8785_probe,
+	.id_table = mpq8785_id,
+};
+
+module_i2c_driver(mpq8785_driver);
+
+MODULE_AUTHOR("Charles Hsu <ythsu0511@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MPQ8785");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.49.0


