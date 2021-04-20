Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4E3652D9
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 09:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZV26pCZz2yx9
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 17:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=TlihSUxo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=TlihSUxo; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZTp0zqfz2xZk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 17:06:05 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CFF7F223;
 Tue, 20 Apr 2021 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618902362;
 bh=g0xLinUXHY30s/oSJ/gr2qZ3DH90CdyHZFWyIo6gA5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlihSUxoYq+83iUyF9adfBlVqncR1YrbhzvCjP8uSHU1zCDV09Ta4hciJFhLn988J
 AyQDUNc6CQ8KIRqBGX21F4m7Ys7F+hdFTIyi+wVOoEgL7Ay6X8qpCT64I8Ig/86AN2
 2V1PygUsN/RU6nmP3zbuhB6XsFbd4vlcqHhoGRJw=
Date: Tue, 20 Apr 2021 02:06:00 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Enabling pmbus power control
Message-ID: <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
References: <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 01:00:25AM CDT, Guenter Roeck wrote:
>On 4/19/21 10:50 PM, Zev Weiss wrote:
>[ ... ]
>
>> I had a glance at the enclosure driver; it looks pretty geared toward SES-like things (drivers/scsi/ses.c being its only usage I can see in the kernel at the moment) and while it could perhaps be pressed into working for this it seems like it would probably drag in a fair amount of boilerplate and result in a somewhat gratuitously confusing driver arrangement (calling the things involved in the cases we're looking at "enclosures" seems like a bit of a stretch).
>>
>> As an alternative, would something like the patch below be more along the lines of what you're suggesting?  And if so, would it make sense to generalize it into something like 'pmbus-switch.c' and add a PMBUS_HAVE_POWERSWITCH functionality bit or similar in the pmbus code instead of hardcoding it for only LM25066 support?
>>
>>
>
>No. Don't access pmbus functions from outside drivers/hwmon/pmbus.
>
>I used to be opposed to function export restrictions (aka export namespaces),
>but you are making a good case that we need to introduce them for pmbus
>functions.
>
>Guenter

Okay -- I figured that was likely to be frowned upon, but the 
alternative seemed to be effectively duplicating non-trivial chunks of 
the pmbus code.  However, upon realizing that the LM25066 doesn't 
actually require any of the paging work the generic pmbus code provides, 
I suppose it can actually be done with a simple smbus read & write.  
Does this version look better?


Zev


 From 1662e1c59c498ad6b208e6ab450bd467d71def34 Mon Sep 17 00:00:00 2001
From: Zev Weiss <zev@bewilderbeest.net>
Date: Wed, 31 Mar 2021 01:58:35 -0500
Subject: [PATCH] misc: add lm25066-switch driver

This driver allows an lm25066 to be switched on and off from userspace
via sysfs.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
  drivers/misc/Kconfig          |   7 ++
  drivers/misc/Makefile         |   1 +
  drivers/misc/lm25066-switch.c | 126 ++++++++++++++++++++++++++++++++++
  3 files changed, 134 insertions(+)
  create mode 100644 drivers/misc/lm25066-switch.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index f532c59bb59b..384b6022ec15 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -445,6 +445,13 @@ config HISI_HIKEY_USB
  	  switching between the dual-role USB-C port and the USB-A host ports
  	  using only one USB controller.
  
+config LM25066_SWITCH
+	tristate "LM25066 power switch support"
+	depends on OF && SENSORS_LM25066
+	help
+	  This driver augments LM25066 hwmon support with power switch
+	  functionality controllable from userspace via sysfs.
+
  source "drivers/misc/c2port/Kconfig"
  source "drivers/misc/eeprom/Kconfig"
  source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 99b6f15a3c70..c948510d0cc9 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
  obj-$(CONFIG_UACCE)		+= uacce/
  obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
  obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
+obj-$(CONFIG_LM25066_SWITCH)	+= lm25066-switch.o
diff --git a/drivers/misc/lm25066-switch.c b/drivers/misc/lm25066-switch.c
new file mode 100644
index 000000000000..9adc67c320f9
--- /dev/null
+++ b/drivers/misc/lm25066-switch.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This module provides a thin wrapper around the lm25066 hwmon driver that
+ * additionally exposes a userspace-controllable on/off power switch via
+ * sysfs.
+ *
+ * Author: Zev Weiss <zweiss@equinix.com>
+ *
+ * Copyright (C) 2021 Equinix Services, Inc.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+
+/*
+ * The relevant PMBus command and data values for controlling the LM25066
+ * power state.  Because it's not a paged device we skip the usual paging
+ * business other PMBus devices might require.
+ */
+#define CMD_OPERATION 0x01
+#define OPERATION_ON 0x80
+#define OPERATION_OFF 0x00
+
+static ssize_t switch_show_state(struct device *dev, struct device_attribute *attr,
+                                 char *buf)
+{
+	struct i2c_client *pmic = dev_get_drvdata(dev);
+	ssize_t ret = i2c_smbus_read_byte_data(pmic, CMD_OPERATION);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (ret & OPERATION_ON) ? "on" : "off");
+}
+
+static ssize_t switch_set_state(struct device *dev, struct device_attribute *attr,
+                                const char *buf, size_t count)
+{
+	int status;
+	u8 value;
+	struct i2c_client *pmic = dev_get_drvdata(dev);
+	if (sysfs_streq(buf, "on"))
+		value = OPERATION_ON;
+	else if (sysfs_streq(buf, "off"))
+		value = OPERATION_OFF;
+	else
+		return -EINVAL;
+	status = i2c_smbus_write_byte_data(pmic, CMD_OPERATION, value);
+	return status ? : count;
+}
+
+static DEVICE_ATTR(state, 0644, switch_show_state, switch_set_state);
+
+static struct attribute *attributes[] = {
+	&dev_attr_state.attr,
+	NULL,
+};
+
+static const struct attribute_group attr_group = {
+	.attrs = attributes,
+};
+
+static int lm25066_switch_probe(struct platform_device *pdev)
+{
+	int status;
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *pmic_np;
+	struct i2c_client *pmic;
+
+	pmic_np = of_parse_phandle(np, "pmic", 0);
+	if (!pmic_np) {
+		dev_err(&pdev->dev, "Cannot parse lm25066-switch pmic\n");
+		return -ENODEV;
+	}
+
+	if (!of_device_is_compatible(pmic_np, "lm25066")) {
+		dev_err(&pdev->dev, "lm25066-switch pmic not lm25066 compatible");
+		status = -ENODEV;
+		goto out;
+	}
+
+	pmic = of_find_i2c_device_by_node(pmic_np);
+	if (!pmic) {
+		status = -EPROBE_DEFER;
+		goto out;
+	}
+
+	platform_set_drvdata(pdev, pmic);
+
+	status = sysfs_create_group(&pdev->dev.kobj, &attr_group);
+
+out:
+	of_node_put(pmic_np);
+	return status;
+}
+
+static int lm25066_switch_remove(struct platform_device *pdev)
+{
+	struct i2c_client *pmic = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&pdev->dev.kobj, &attr_group);
+	put_device(&pmic->dev);
+
+	return 0;
+}
+
+static const struct of_device_id lm25066_switch_table[] = {
+	{ .compatible = "lm25066-switch" },
+	{ },
+};
+
+static struct platform_driver lm25066_switch_driver = {
+	.driver = {
+		.name = "lm25066-switch",
+		.of_match_table = lm25066_switch_table,
+	},
+	.probe = lm25066_switch_probe,
+	.remove = lm25066_switch_remove,
+};
+
+module_platform_driver(lm25066_switch_driver);
+
+MODULE_AUTHOR("Zev Weiss <zweiss@equinix.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("LM25066 power-switch driver");
-- 
2.31.1


