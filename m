Return-Path: <openbmc+bounces-302-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC44AF06E9
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 01:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWzXP19Xfz2yRn;
	Wed,  2 Jul 2025 09:20:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751370348;
	cv=none; b=dLIlcOSA5alDq9SVyY+R196Hwv4IcCXXm5o6x4YOA+QY+Ha6j6+Y16RUzdBlDnuNeIiSZl9vWeMjWQttua9I/9Gt9lINDKYD0erhaH45saikrTsl6+RovlWS2YvLDLei6Zu10j7GlvOS4XTDEyqJOtEm/mlMavledAwwpyKZZUL6I3hZI8mJw9HkG2BT0yzUlX9EPGZMgwcXfl3aq+W5UXJ/3WZ/ocht/7MxmXyJmSIsW3NF6dF8NIXIfbbiCAP+Q+gnfNnoEv90Q+RQLtWUksoRentt2CgKXow/s+vW4o4fHW362AIoKgN+V5gnaF/j/mn4B1BYluy8eRbLJ9YtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751370348; c=relaxed/relaxed;
	bh=vBUFCCnMnGhpRdYZIiDLAf1KdTJ6d9KQfZF3op4aQUE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lu3gDP3tG/CyrnYddXJaqrWJ3hdQmXQmHn+VC/st+zFibq6GOUAdisuh9NOtoC7cAmdESaJ05veZufbFc8tp9H/IaiUgkEmcoFDqxPEndPSCrwr/RazOIkn9NkkzhOOelMJ8EgmnEwlpzNJ17CU+Xcm9ZbllFkw/+NV/syNgnfAUwXDIFU9L0G1L8SWN2SgXSUR5lk8RKKSaOCXu/ezMsQLAxU5k+tVBj6hbD4s9xwlXb6diK4vdyJKmy2Md6zQe6nfOylK5lFaWpHK5JsBn5gqHQ+VL0vJgcJnU20AtRkmoqULKclrxGD6gs68lCINJfRvI9ze5R4ebb5I3YUt1Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRwJPt68; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRwJPt68;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWh6y4nzcz2xHY
	for <openbmc@lists.ozlabs.org>; Tue,  1 Jul 2025 21:45:46 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2353a2bc210so27416885ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 01 Jul 2025 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370344; x=1751975144; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBUFCCnMnGhpRdYZIiDLAf1KdTJ6d9KQfZF3op4aQUE=;
        b=NRwJPt68gIk6hDSOArWoATNH/hWCYNUXSKGfWgRtn/0jg6Lk4z805sHVweseFOPL8N
         HaZPgMSwi/VdIEfEoDNB8cngt4xIn9AWug32Xn6pKxblqpgaP06XDLsL9z0k167c5iEY
         OY4IU0i8pqgxBmkrNweDnbSe+i1jm080b7OgpzhiZGcoqZXkoTB4rAvwpdDDEptO3Z3D
         VNWlWyScRT436bOVcSxCEDJyZpjDMWSGNrspheQlZPN5JbzMRq2YjgjapvO/iZ+gURdj
         J4lbh4WywS8nRiUi3IKrmxPYJBFbCgzP/ExH4KFgTgKRNU5KVeu2D7/mtFtau/GY1g+E
         HaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370344; x=1751975144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBUFCCnMnGhpRdYZIiDLAf1KdTJ6d9KQfZF3op4aQUE=;
        b=CtzClRkSEd8c5EVK63mn4D3YQWauefVzGPtNXJQTl2xYC07IslU6gadSBpzJMRHrM5
         qedQeg1s6DS5tuPudqEPixKd3CRboC8P1q4WvGR5ik14bTy1KxUnBEE3ctTIjjke94bw
         NaWnwNeUY6mYOtd5UOzB1Ugw1+UAfctQCNxI1lF/uAP9q1EWbgqxv/o2C1tNQ8OESQOf
         doB9kgU2LSgFwH+mTVMr6/OYaFMbqKTTiPhpAyJpakkyW1sRUnMFIUi1smwpfxjyas7V
         gf5/gtlGTp/hlue5bXHnjHdZ25L7guJdG5/n9xvAsbkhnx3oLF+JDcNhIO0G5n1iW0io
         yzmg==
X-Forwarded-Encrypted: i=1; AJvYcCUvMctMQXeBLzD5qQfUSTO2eeSLinzBa/KwirdLy/RUo1NpC5xjf7xYvbve1mItbPTygtvaYtUN@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxE4poXSXqD8DfTw2+dLyAn3t3/6OOmvT7mWYZNlvkQUQPntO//
	DcAuwdpUy8QeGXxbhmAJXj8uZXb6b/BAJxivr2rpSVVNDrMQeWUFYC/H
X-Gm-Gg: ASbGncvrn8qwXHOwQoPeayn6X4c6NeX8Jpfqd0QtBseCDNy0B3hW50u+Dfv/WirMfiI
	GZcEc74WnW7OkMaywtRn9QA9WmLXhOm+WvCTdPVs2AWsggC4aaPbD+z+uIsmTSECqIjmJsC2gjw
	QUP/gxlcV0Wk/8h63s67Q2G5P8XmLkxIFpGauKmuvDpEyOScuEwGzZkG+Z0MpYFK2FL/dmAaive
	4u9rYGQcqoNIpLSCwQAw0QRTlkbde3JuARfe2Df1mHdrU/lpJ+KLrDgqsY3lYYUpnSzFxCRk1AV
	IgOpybB+qYcr8gJPVXIRw1qPQ5DPkZsRvoHPQ8XiEDzfTrNW+cLBdwpv4NE8tV0Tc3L/wk9Sa1h
	SPSrgEPs641BbN+lYS3+WVstJqwNmeY13rJh2ST1n8aAkm54lCEe4wDSFDgcVMnarDsO+DZKrCy
	9hgHOWzyzoG7PSgmzytaMTyrqi
X-Google-Smtp-Source: AGHT+IEX1oCF2rEjODNoYxi8ddm7buMByV24he7ZUf+J2E4GMA0mIRkgvEwyaLGRU9bvSKKhUuYbMg==
X-Received: by 2002:a17:902:d488:b0:235:225d:3083 with SMTP id d9443c01a7336-23ac381734fmr208969975ad.6.1751370344412;
        Tue, 01 Jul 2025 04:45:44 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-52d0-167f-4c41-9344.emome-ip6.hinet.net. [2001:b400:e389:b6b2:52d0:167f:4c41:9344])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f0b63sm103987835ad.61.2025.07.01.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:45:44 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 2/2] hwmon: (pmbus/tps25990) Add initial support
Date: Tue,  1 Jul 2025 19:45:39 +0800
Message-ID: <20250701114539.1463404-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701114539.1463404-1-fredchen.openbmc@gmail.com>
References: <20250701114539.1463404-1-fredchen.openbmc@gmail.com>
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
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add initial support for the Texas Instruments TPS25990 eFuse.
This adds the basic PMBUS telemetry support for the device.

From Karol Przybylski:
  The tps25990_read_word_data function contains a block of unreachable code
  caused by the syntactic structure in the PMBUS_VIRT_READ_IIN_MAX case.

  Specifically, the return TPS25990_READ_IIN_PEAK; statement immediately
  exits the function, making the next lines unreachable.

  This patch removes the return statement, leaving the expected handling.
  Discovered in coverity: CID 1602227

Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
[groeck: Adjust to MODULE_IMPORT_NS API change]
[karprzy7@gmail.com: Fix unreachable code in tps25990_read_word_data]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 339bca4ffdaa7267b1597e634ac6002a133ad7b8)
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/tps25990.rst | 147 +++++++++++
 MAINTAINERS                      |   2 +
 drivers/hwmon/pmbus/Kconfig      |  17 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/tps25990.c   | 436 +++++++++++++++++++++++++++++++
 6 files changed, 604 insertions(+)
 create mode 100644 Documentation/hwmon/tps25990.rst
 create mode 100644 drivers/hwmon/pmbus/tps25990.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8da1591aa247..7d41710ea4e3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -221,6 +221,7 @@ Hardware Monitoring Kernel Drivers
    tmp464
    tmp513
    tps23861
+   tps25990
    tps40422
    tps53679
    tps546d24
diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
new file mode 100644
index 000000000000..04faec780d26
--- /dev/null
+++ b/Documentation/hwmon/tps25990.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver tps25990
+======================
+
+Supported chips:
+
+  * TI TPS25990
+
+    Prefix: 'tps25990'
+
+  * Datasheet
+
+    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+
+Author:
+
+	Jerome Brunet <jbrunet@baylibre.com>
+
+Description
+-----------
+
+This driver implements support for TI TPS25990 eFuse.
+This is an integrated, high-current circuit protection and power
+management device with PMBUS interface
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading input voltages,
+output voltage, input current, input power and temperature.
+
+Due to the specificities of the chip, all history reset attributes
+are tied together. Resetting the history of a sensor, resets the
+history of all the sensors.
+
+The driver exports the following attributes via the 'sysfs' files
+for input current:
+
+**curr1_average**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+**curr1_highest**
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+**curr1_reset_history**
+
+The driver provides the following attributes for main input voltage:
+
+**in1_average**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+**in1_highest**
+
+**in1_input**
+
+**in1_label**
+
+**in1_lcrit**
+
+**in1_lcrit_alarm**
+
+**in1_lowest**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+**in1_reset_history**
+
+The driver provides the following attributes for auxiliary input voltage:
+
+**in2_input**
+
+**in2_label**
+
+The driver provides the following attributes for output voltage:
+
+**in3_average**
+
+**in3_input**
+
+**in3_label**
+
+**in3_lowest**
+
+**in3_min**
+
+**in3_min_alarm**
+
+**in3_reset_history**
+
+The driver provides the following attributes for input power:
+
+**power1_alarm**
+
+**power1_average**
+
+**power1_input**
+
+**power1_input_highest**
+
+**power1_label**
+
+**power1_max**
+
+**power1_reset_history**
+
+The driver provides the following attributes for temperature:
+
+**temp1_average**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_highest**
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_reset_history**
+
+The driver provides the following attributes for sampling:
+
+**samples**
diff --git a/MAINTAINERS b/MAINTAINERS
index a56dd5b45487..9729423e1ddb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21368,6 +21368,8 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+F:	Documentation/hwmon/tps25990.rst
+F:	drivers/hwmon/pmbus/tps25990.c
 
 TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index cc829c6fe113..0fc15130a4ea 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -473,6 +473,23 @@ config SENSORS_TDA38640_REGULATOR
 	  If you say yes here you get regulator support for Infineon
 	  TDA38640 as regulator.
 
+config SENSORS_TPS25990
+	tristate "TI TPS25990"
+	help
+	  If you say yes here you get hardware monitoring support for TI
+	  TPS25990.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tps25990.
+
+config SENSORS_TPS25990_REGULATOR
+	bool "Regulator support for TPS25990 and compatibles"
+	depends on SENSORS_TPS25990 && REGULATOR
+	default SENSORS_TPS25990
+	help
+	  If you say yes here you get regulator support for Texas Instruments
+	  TPS25990.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3d1363006a21..25fbd8c4435f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
+obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
new file mode 100644
index 000000000000..0d2655e69549
--- /dev/null
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2024 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+#define TPS25990_READ_VAUX		0xd0
+#define TPS25990_READ_VIN_MIN		0xd1
+#define TPS25990_READ_VIN_PEAK		0xd2
+#define TPS25990_READ_IIN_PEAK		0xd4
+#define TPS25990_READ_PIN_PEAK		0xd5
+#define TPS25990_READ_TEMP_AVG		0xd6
+#define TPS25990_READ_TEMP_PEAK		0xd7
+#define TPS25990_READ_VOUT_MIN		0xda
+#define TPS25990_READ_VIN_AVG		0xdc
+#define TPS25990_READ_VOUT_AVG		0xdd
+#define TPS25990_READ_IIN_AVG		0xde
+#define TPS25990_READ_PIN_AVG		0xdf
+#define TPS25990_VIREF			0xe0
+#define TPS25990_PK_MIN_AVG		0xea
+#define  PK_MIN_AVG_RST_PEAK		BIT(7)
+#define  PK_MIN_AVG_RST_AVG		BIT(6)
+#define  PK_MIN_AVG_RST_MIN		BIT(5)
+#define  PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
+#define TPS25990_MFR_WRITE_PROTECT	0xf8
+#define  TPS25990_UNLOCKED		BIT(7)
+
+#define TPS25990_8B_SHIFT		2
+#define TPS25990_VIN_OVF_NUM		525100
+#define TPS25990_VIN_OVF_DIV		10163
+#define TPS25990_VIN_OVF_OFF		155
+#define TPS25990_IIN_OCF_NUM		953800
+#define TPS25990_IIN_OCF_DIV		129278
+#define TPS25990_IIN_OCF_OFF		157
+
+#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
+					 PK_MIN_AVG_RST_AVG  | \
+					 PK_MIN_AVG_RST_MIN)
+
+/*
+ * Arbitrary default Rimon value: 1kOhm
+ * This correspond to an overcurrent limit of 55A, close to the specified limit
+ * of un-stacked TPS25990 and makes further calculation easier to setup in
+ * sensor.conf, if necessary
+ */
+#define TPS25990_DEFAULT_RIMON		1000000000
+
+static void tps25990_set_m(int *m, u32 rimon)
+{
+	u64 val = ((u64)*m) * rimon;
+
+	/* Make sure m fits the s32 type */
+	*m = DIV_ROUND_CLOSEST_ULL(val, 1000000);
+}
+
+static int tps25990_mfr_write_protect_set(struct i2c_client *client,
+					  u8 protect)
+{
+	u8 val;
+
+	switch (protect) {
+	case 0:
+		val = 0xa2;
+		break;
+	case PB_WP_ALL:
+		val = 0x0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
+				     val);
+}
+
+static int tps25990_mfr_write_protect_get(struct i2c_client *client)
+{
+	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret & TPS25990_UNLOCKED) ? 0 : PB_WP_ALL;
+}
+
+static int tps25990_read_word_data(struct i2c_client *client,
+				   int page, int phase, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VOUT_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VOUT_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_IIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_IIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_TEMP_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_TEMP_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_PIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_PIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VMON:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VAUX);
+		break;
+
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * These registers provide an 8 bits value instead of a
+		 * 10bits one. Just shifting twice the register value is
+		 * enough to make the sensor type conversion work, even
+		 * if the datasheet provides different m, b and R for
+		 * those.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			break;
+		ret <<= TPS25990_8B_SHIFT;
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
+					TPS25990_VIN_OVF_DIV);
+		ret += TPS25990_VIN_OVF_OFF;
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		/*
+		 * VIREF directly sets the over-current limit at which the eFuse
+		 * will turn the FET off and trigger a fault. Expose it through
+		 * this generic property instead of a manufacturer specific one.
+		 */
+		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
+					TPS25990_IIN_OCF_DIV);
+		ret += TPS25990_IIN_OCF_OFF;
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		ret = pmbus_read_byte_data(client, page, TPS25990_PK_MIN_AVG);
+		if (ret < 0)
+			break;
+		ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		ret = 0;
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_write_word_data(struct i2c_client *client,
+				    int page, int reg, u16 value)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		value >>= TPS25990_8B_SHIFT;
+		value = clamp_val(value, 0, 0xff);
+		ret = pmbus_write_word_data(client, page, reg, value);
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		value -= TPS25990_VIN_OVF_OFF;
+		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
+					  TPS25990_VIN_OVF_NUM);
+		value = clamp_val(value, 0, 0xf);
+		ret = pmbus_write_word_data(client, page, reg, value);
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		value -= TPS25990_IIN_OCF_OFF;
+		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
+					  TPS25990_IIN_OCF_NUM);
+		value = clamp_val(value, 0, 0x3f);
+		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		value = clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);
+		value = ilog2(value);
+		ret = pmbus_update_byte_data(client, page, TPS25990_PK_MIN_AVG,
+					     PK_MIN_AVG_AVG_CNT,
+					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		/*
+		 * TPS25990 has history resets based on MIN/AVG/PEAK instead of per
+		 * sensor type. Exposing this quirk in hwmon is not desirable so
+		 * reset MIN, AVG and PEAK together. Even is there effectively only
+		 * one reset, which resets everything, expose the 5 entries so
+		 * userspace is not required map a sensor type to another to trigger
+		 * a reset
+		 */
+		ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
+					     PK_MIN_AVG_RST_MASK,
+					     PK_MIN_AVG_RST_MASK);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_read_byte_data(struct i2c_client *client,
+				   int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = tps25990_mfr_write_protect_get(client);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_write_byte_data(struct i2c_client *client,
+				    int page, int reg, u8 byte)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = tps25990_mfr_write_protect_set(client, byte);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+static const struct regulator_desc tps25990_reg_desc[] = {
+	PMBUS_REGULATOR_ONE("vout"),
+};
+#endif
+
+static const struct pmbus_driver_info tps25990_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 5251,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 5251,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 140,
+	.b[PSC_TEMPERATURE] = 32100,
+	.R[PSC_TEMPERATURE] = -2,
+	/*
+	 * Current and Power measurement depends on the ohm value
+	 * of Rimon. m is multiplied by 1000 below to have an integer
+	 * and -3 is added to R to compensate.
+	 */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 9538,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = -6,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 4901,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -7,
+	.func[0] = (PMBUS_HAVE_VIN |
+		    PMBUS_HAVE_VOUT |
+		    PMBUS_HAVE_VMON |
+		    PMBUS_HAVE_IIN |
+		    PMBUS_HAVE_PIN |
+		    PMBUS_HAVE_TEMP |
+		    PMBUS_HAVE_STATUS_VOUT |
+		    PMBUS_HAVE_STATUS_IOUT |
+		    PMBUS_HAVE_STATUS_INPUT |
+		    PMBUS_HAVE_STATUS_TEMP |
+		    PMBUS_HAVE_SAMPLES),
+	.read_word_data = tps25990_read_word_data,
+	.write_word_data = tps25990_write_word_data,
+	.read_byte_data = tps25990_read_byte_data,
+	.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+	.reg_desc = tps25990_reg_desc,
+	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+};
+
+static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ "tps25990" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
+
+static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps25990" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tps25990_of_match);
+
+static int tps25990_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	u32 rimon = TPS25990_DEFAULT_RIMON;
+	int ret;
+
+	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "failed to get rimon\n");
+
+	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Adapt the current and power scale for each instance */
+	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&info->m[PSC_POWER], rimon);
+
+	return pmbus_do_probe(client, info);
+}
+
+static struct i2c_driver tps25990_driver = {
+	.driver = {
+		.name = "tps25990",
+		.of_match_table = tps25990_of_match,
+	},
+	.probe = tps25990_probe,
+	.id_table = tps25990_i2c_id,
+};
+module_i2c_driver(tps25990_driver);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("PMBUS driver for TPS25990 eFuse");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.49.0


