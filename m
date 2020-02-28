Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A81787E8
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 03:01:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHCx1lHczDqV8
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 13:01:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=grantpeltier93@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XBtcOnyv; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TjGC1Y0dzDrDT
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 08:23:59 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 7so2153213pgr.2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 13:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=BavgmzSDunkGnQtB4RjTodF7MWhgzfm6Vq6hYsR/Hxc=;
 b=XBtcOnyvWZBewgwmWvN/eD4gISNgn99811SPfDuVlxcUgJrweDOFpIFzsSZ6epTHRN
 YxJzEbQlAidoI4ejfS1cwtBk5L/nNxWezJdOsR/FUgBenhmSj8QfZbrUBr7o4TI2gwTT
 Sjo7474txsVYfW/fsFnnJZpsCYj1ShVVMaYCNocoJ4gMJVSe2/uleO2Vn6mEJ0ajZshX
 1DlKxZrEEBS5UDZbQ4C6U2Ka/AWKm+OIhvIjaoHgbqEJJxXjY+jUy9gZPcug/D+a6NVP
 LhySur3t5/bZPSoEzQJlLWv+cWMEfe5mlBFL3wWtrJ+k5QBdyCzNP7KhYZ9d+WKkZBq0
 CBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=BavgmzSDunkGnQtB4RjTodF7MWhgzfm6Vq6hYsR/Hxc=;
 b=pm7TKNJVAbbfOgovCeYK/i740c+lbpfub60F39vuWKLW4uj+NyXGAE8zhdp1R1kymh
 bCq27AXSz5qSsDIn7iv4F05hDgod/HNp9OgCdZiX/gL/5dbeqnOrr1faskyJ8l7iJ3Hc
 dtfm9HXrQJ19TY24IpzZ3tmbidzD06A7qsD4r+67YZJPDYOAM/riJhVDrb+xtF/cNUPX
 YuM5N4BY2SmAdIi5YVYvrpt2qkDaQupyJLiTB+hOL6MNzakJDdmHKxTkN3lNtDZsmKYo
 YUwSqlHcA1Ji2vxEyWZhcYkldBJbi9Gzf0Qj1INyeGYW9tnVZwPqNAoNAHS2q0RuHy2Z
 yXHA==
X-Gm-Message-State: APjAAAVZNZJHBGFAOzwLul9focYp6kR2s/uhMXTDv1/pr+OXBvCD1WMl
 r+AzkiQ/NZWWOAB9Y66mT7k=
X-Google-Smtp-Source: APXvYqzK4rkojELgKn3vIHA6jw4RQVHlkeIV+Zu96XR7P9XDC5Yugr59fcLJg94YRKg9cPZWs0PYQg==
X-Received: by 2002:a63:f455:: with SMTP id p21mr6380077pgk.430.1582925035732; 
 Fri, 28 Feb 2020 13:23:55 -0800 (PST)
Received: from raspberrypi (72-48-120-28.static.grandenetworks.net.
 [72.48.120.28])
 by smtp.gmail.com with ESMTPSA id a17sm11468510pgv.11.2020.02.28.13.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 13:23:55 -0800 (PST)
Date: Fri, 28 Feb 2020 15:23:49 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon: (pmbus) Add support for 2nd Gen Renesas digital
 multiphase
Message-ID: <20200228212349.GA1929@raspberrypi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Mar 2020 12:57:21 +1100
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
Cc: adam.vaughn.xh@renesas.com, grantpeltier93@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a driver to support 2nd generation Renesas digital multiphase power
regulators. The driver is meant to support a large family of part
numbers spanning isl682xx, isl692xx, and some raa228/9 part designations.

Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/isl692xx.c | 352 +++++++++++++++++++++++++++++++++
 3 files changed, 362 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/isl692xx.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a9ea06204767..fbe7bbc8b37c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -100,6 +100,15 @@ config SENSORS_ISL68137
 	  This driver can also be built as a module. If so, the module will
 	  be called isl68137.
 
+config SENSORS_ISL692XX
+        tristate "Renesas 2nd Gen Digital Multiphase"
+        help
+          If you say yes here you get hardware monitoring support for Renesas
+          2nd Generation Digital Multiphase power regulators.
+
+          This driver can also be built as a module. If so, the module will
+          be called isl692xx.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 5feb45806123..bf1ea99a6120 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
+obj-$(CONFIG_SENSORS_ISL692XX)	+= isl692xx.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/isl692xx.c b/drivers/hwmon/pmbus/isl692xx.c
new file mode 100644
index 000000000000..26f3d90a7ddc
--- /dev/null
+++ b/drivers/hwmon/pmbus/isl692xx.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Renesas Gen 2 Digital Multiphase Devices
+ *
+ * Copyright (c) 2020 Renesas Electronics America
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+
+#include "pmbus.h"
+
+#define ISL692XX_READ_VMON        0xc8
+
+enum parts {
+        isl68220,
+        isl68221,
+        isl68222,
+        isl68223,
+        isl68224,
+        isl68225,
+        isl68226,
+        isl68227,
+        isl68229,
+        isl68233,
+        isl68239,
+        isl69222,
+        isl69223,
+        isl69224,
+        isl69225,
+        isl69227,
+        isl69228,
+        isl69234,
+        isl69236,
+        isl69239,
+        isl69242,
+        isl69243,
+        isl69247,
+        isl69248,
+        isl69254,
+        isl69255,
+        isl69256,
+        isl69259,
+        isl69260,
+        isl69268,
+        isl69269,
+        isl69298,
+        raa228000,
+        raa228004,
+        raa228006,
+        raa228228,
+        raa229001,
+        raa229004,
+};
+
+enum rail_configs { high_voltage, one_rail, two_rail, three_rail };
+
+static const struct  i2c_device_id isl692xx_id[] = {
+        { "isl68220", isl68220 },
+        { "isl68221", isl68221 },
+        { "isl68222", isl68222 },
+        { "isl68223", isl68223 },
+        { "isl68224", isl68224 },
+        { "isl68225", isl68225 },
+        { "isl68226", isl68226 },
+        { "isl68227", isl68227 },
+        { "isl68229", isl68229 },
+        { "isl68233", isl68233 },
+        { "isl68239", isl68239 },
+        { "isl69222", isl69222 },
+        { "isl69223", isl69223 },
+        { "isl69224", isl69224 },
+        { "isl69225", isl69225 },
+        { "isl69227", isl69227 },
+        { "isl69228", isl69228 },
+        { "isl69234", isl69234 },
+        { "isl69236", isl69236 },
+        { "isl69239", isl69239 },
+        { "isl69242", isl69242 },
+        { "isl69243", isl69243 },
+        { "isl69247", isl69247 },
+        { "isl69248", isl69248 },
+        { "isl69254", isl69254 },
+        { "isl69255", isl69255 },
+        { "isl69256", isl69256 },
+        { "isl69259", isl69259 },
+        { "isl69260", isl69260 },
+        { "isl69268", isl69268 },
+        { "isl69269", isl69269 },
+        { "isl69298", isl69298 },
+        { "raa228000", raa228000 },
+        { "raa228004", raa228004 },
+        { "raa228006", raa228006 },
+        { "raa228228", raa228228 },
+        { "raa229001", raa229001 },
+        { "raa229004", raa229004 },
+        { },
+};
+
+MODULE_DEVICE_TABLE(i2c, isl692xx_id);
+
+static int isl692xx_read_word_data(struct i2c_client *client, int page, int reg)
+{
+        int ret;
+
+        switch (reg) {
+        case PMBUS_VIRT_READ_VMON:
+                ret = pmbus_read_word_data(client, page, ISL692XX_READ_VMON);
+                break;
+        default:
+                ret = -ENODATA;
+                break;
+        }
+        
+        return ret;
+}
+
+static struct pmbus_driver_info isl692xx_info[] = {
+        [high_voltage] = {
+                .pages = 1,
+                .format[PSC_VOLTAGE_IN] = direct,
+                .format[PSC_VOLTAGE_OUT] = direct,
+                .format[PSC_CURRENT_IN] = direct,
+                .format[PSC_CURRENT_OUT] = direct,
+                .format[PSC_POWER] = direct,
+                .format[PSC_TEMPERATURE] = direct,
+                .m[PSC_VOLTAGE_IN] = 1,
+                .b[PSC_VOLTAGE_IN] = 0,
+                .R[PSC_VOLTAGE_IN] = 1,
+                .m[PSC_VOLTAGE_OUT] = 2,
+                .b[PSC_VOLTAGE_OUT] = 0,
+                .R[PSC_VOLTAGE_OUT] = 2,
+                .m[PSC_CURRENT_IN] = 2,
+                .b[PSC_CURRENT_IN] = 0,
+                .R[PSC_CURRENT_IN] = 2,
+                .m[PSC_CURRENT_OUT] = 1,
+                .b[PSC_CURRENT_OUT] = 0,
+                .R[PSC_CURRENT_OUT] = 1,
+                .m[PSC_POWER] = 2,
+                .b[PSC_POWER] = 0,
+                .R[PSC_POWER] = -1,
+                .m[PSC_TEMPERATURE] = 1,
+                .b[PSC_TEMPERATURE] = 0,
+                .R[PSC_TEMPERATURE] = 0,
+                .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .read_word_data = isl692xx_read_word_data,
+        },
+        [one_rail] = {
+                .pages = 1,
+                .format[PSC_VOLTAGE_IN] = direct,
+                .format[PSC_VOLTAGE_OUT] = direct,
+                .format[PSC_CURRENT_IN] = direct,
+                .format[PSC_CURRENT_OUT] = direct,
+                .format[PSC_POWER] = direct,
+                .format[PSC_TEMPERATURE] = direct,
+                .m[PSC_VOLTAGE_IN] = 1,
+                .b[PSC_VOLTAGE_IN] = 0,
+                .R[PSC_VOLTAGE_IN] = 2,
+                .m[PSC_VOLTAGE_OUT] = 1,
+                .b[PSC_VOLTAGE_OUT] = 0,
+                .R[PSC_VOLTAGE_OUT] = 3,
+                .m[PSC_CURRENT_IN] = 1,
+                .b[PSC_CURRENT_IN] = 0,
+                .R[PSC_CURRENT_IN] = 2,
+                .m[PSC_CURRENT_OUT] = 1,
+                .b[PSC_CURRENT_OUT] = 0,
+                .R[PSC_CURRENT_OUT] = 1,
+                .m[PSC_POWER] = 1,
+                .b[PSC_POWER] = 0,
+                .R[PSC_POWER] = 0,
+                .m[PSC_TEMPERATURE] = 1,
+                .b[PSC_TEMPERATURE] = 0,
+                .R[PSC_TEMPERATURE] = 0,
+                .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .read_word_data = isl692xx_read_word_data,
+        },
+        [two_rail] = {
+                .pages = 2,
+                .format[PSC_VOLTAGE_IN] = direct,
+                .format[PSC_VOLTAGE_OUT] = direct,
+                .format[PSC_CURRENT_IN] = direct,
+                .format[PSC_CURRENT_OUT] = direct,
+                .format[PSC_POWER] = direct,
+                .format[PSC_TEMPERATURE] = direct,
+                .m[PSC_VOLTAGE_IN] = 1,
+                .b[PSC_VOLTAGE_IN] = 0,
+                .R[PSC_VOLTAGE_IN] = 2,
+                .m[PSC_VOLTAGE_OUT] = 1,
+                .b[PSC_VOLTAGE_OUT] = 0,
+                .R[PSC_VOLTAGE_OUT] = 3,
+                .m[PSC_CURRENT_IN] = 1,
+                .b[PSC_CURRENT_IN] = 0,
+                .R[PSC_CURRENT_IN] = 2,
+                .m[PSC_CURRENT_OUT] = 1,
+                .b[PSC_CURRENT_OUT] = 0,
+                .R[PSC_CURRENT_OUT] = 1,
+                .m[PSC_POWER] = 1,
+                .b[PSC_POWER] = 0,
+                .R[PSC_POWER] = 0,
+                .m[PSC_TEMPERATURE] = 1,
+                .b[PSC_TEMPERATURE] = 0,
+                .R[PSC_TEMPERATURE] = 0,
+                .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .read_word_data = isl692xx_read_word_data,
+        },
+        [three_rail] = {
+                .pages = 3,
+                .format[PSC_VOLTAGE_IN] = direct,
+                .format[PSC_VOLTAGE_OUT] = direct,
+                .format[PSC_CURRENT_IN] = direct,
+                .format[PSC_CURRENT_OUT] = direct,
+                .format[PSC_POWER] = direct,
+                .format[PSC_TEMPERATURE] = direct,
+                .m[PSC_VOLTAGE_IN] = 1,
+                .b[PSC_VOLTAGE_IN] = 0,
+                .R[PSC_VOLTAGE_IN] = 2,
+                .m[PSC_VOLTAGE_OUT] = 1,
+                .b[PSC_VOLTAGE_OUT] = 0,
+                .R[PSC_VOLTAGE_OUT] = 3,
+                .m[PSC_CURRENT_IN] = 1,
+                .b[PSC_CURRENT_IN] = 0,
+                .R[PSC_CURRENT_IN] = 2,
+                .m[PSC_CURRENT_OUT] = 1,
+                .b[PSC_CURRENT_OUT] = 0,
+                .R[PSC_CURRENT_OUT] = 1,
+                .m[PSC_POWER] = 1,
+                .b[PSC_POWER] = 0,
+                .R[PSC_POWER] = 0,
+                .m[PSC_TEMPERATURE] = 1,
+                .b[PSC_TEMPERATURE] = 0,
+                .R[PSC_TEMPERATURE] = 0,
+                .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .func[2] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN |
+                        PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT |
+                        PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+                        PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+                        PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+                        PMBUS_HAVE_VMON,
+                .read_word_data = isl692xx_read_word_data,
+        },
+};
+
+static int isl692xx_probe(struct i2c_client *client,
+                          const struct i2c_device_id *id)
+{
+        int ret;
+
+        switch (id->driver_data) {
+        case raa228000:
+        case raa228004:
+        case raa228006:
+                ret = pmbus_do_probe(client, id, &isl692xx_info[high_voltage]);
+                break;
+        case isl68227:
+        case isl69243:
+                ret = pmbus_do_probe(client, id, &isl692xx_info[one_rail]);
+                break;
+        case isl68220:
+        case isl68222:
+        case isl68223:
+        case isl68225:
+        case isl68233:
+        case isl69222:
+        case isl69224:
+        case isl69225:
+        case isl69234:
+        case isl69236:
+        case isl69242:
+        case isl69247:
+        case isl69248:
+        case isl69254:
+        case isl69255:
+        case isl69256:
+        case isl69259:
+        case isl69260:
+        case isl69268:
+        case isl69298:
+        case raa228228:
+        case raa229001:
+        case raa229004:
+                ret = pmbus_do_probe(client, id, &isl692xx_info[two_rail]);
+                break;
+        case isl68221:
+        case isl68224:
+        case isl68226:
+        case isl68229:
+        case isl68239:
+        case isl69223:
+        case isl69227:
+        case isl69228:
+        case isl69239:
+        case isl69269:
+                ret = pmbus_do_probe(client, id, &isl692xx_info[three_rail]);
+                break;
+        default:
+                ret = -ENODEV;
+        }
+
+        return ret;
+}
+
+static struct i2c_driver isl692xx_driver = {
+        .driver = {
+                .name = "isl692xx",
+        },
+        .probe = isl692xx_probe,
+        .remove = pmbus_do_remove,
+        .id_table = isl692xx_id,
+};
+
+module_i2c_driver(isl692xx_driver);
+
+MODULE_AUTHOR("Grant Peltier");
+MODULE_DESCRIPTION("PMBus driver for 2nd Gen Renesas digital multiphase "
+                   "devices");
+MODULE_LICENSE("GPL");
+
-- 
2.20.1

