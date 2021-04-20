Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71E3651E9
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 07:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPXpd0v95z2yRF
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 15:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CjAFdpds;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=CjAFdpds; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPXpN24PZz2xZp
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 15:50:19 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 23C1B1D2;
 Mon, 19 Apr 2021 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618897813;
 bh=piKGRFQQ1+WMq7lkA3F/USBJvd80lNz4YwCXkXdkzgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CjAFdpdsxM2Ja4itF9J7Tb9EMQkfwHp5CPXzF7E+EA+Rc3V0IYi0JruZoL187OiJ4
 tXuKr3xDi80b3CB2s97Uwh9NgxcRDmddC8Czo1ghYQ6yS0iTAwIXk3+4NvLvu0Do5Z
 T4l81ESl3HT1ahhrJvJmDJA6dj1J4GkkjVLPwNQk=
Date: Tue, 20 Apr 2021 00:50:11 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Enabling pmbus power control
Message-ID: <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210420033648.GA227111@roeck-us.net>
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

On Mon, Apr 19, 2021 at 10:36:48PM CDT, Guenter Roeck wrote:
>On Mon, Apr 19, 2021 at 08:29:53PM -0500, Zev Weiss wrote:
>> On Tue, Mar 30, 2021 at 02:38:10PM CDT, Guenter Roeck wrote:
>> > On Tue, Mar 30, 2021 at 07:02:00PM +0100, Mark Brown wrote:
>> > > On Tue, Mar 30, 2021 at 12:56:56PM -0500, Zev Weiss wrote:
>> > >
>> > > > Okay, to expand a bit on the description in my initial message -- we've
>> > > > got a single chassis with multiple server boards and a single manager board
>> > > > that handles, among other things, power control for the servers.
>> > > > The manager board has one LM25066 for each attached server, which acts as
>> > > > the "power switch" for that server.  There thus really isn't any driver to
>> > > > speak of for the downstream device.
>> > >
>> > > This sounds like you need a driver representing those server boards (or
>> > > the slots they plug into perhaps) that represents everything about those
>> > > boards to userspace, including power switching.  I don't see why you
>> > > wouldn't have a driver for that - it's a thing that physically exists
>> > > and clearly has some software control, and you'd presumably also expect
>> > > to represent some labelling about the slot as well.
>> >
>> > Absolutely agree.
>> >
>> > Thanks,
>> > Guenter
>>
>> Hi Guenter, Mark,
>>
>> I wanted to return to this to try to explain why structuring the kernel
>> support for this in a way that's specific to the device behind the PMIC
>> seems like an awkward fit to me, and ultimately kind of artificial.
>>
>> In the system I described, the manager board with the LM25066 devices is its
>> own little self-contained BMC system running its own Linux kernel (though
>> "BMC" is perhaps a slightly misleading term because there's no host system
>> that it manages).  The PMICs are really the only relevant connection it has
>> to the servers it controls power for -- they have their own dedicated local
>> BMCs on board as well doing all the usual BMC tasks.  A hypothetical
>> dedicated driver for this on the manager board wouldn't have any other
>> hardware to touch aside from the pmbus interface of the LM25066 itself, so
>> calling it a server board driver seems pretty arbitrary -- and in fact the
>> same system also has another LM25066 that controls the power supply to the
>> chassis cooling fans (a totally different downstream device, but one that
>> would be equally well-served by the same software).
>>
>> More recently, another system has entered the picture for us that might
>> illustrate it more starkly -- the Delta Open19 power shelf [0] supported by
>> a recent code release from LinkedIn [1].  This is a rackmount power supply
>
>All I can see is that this code is a mess.
>
>> with fifty outputs, each independently switchable via an LM25066 attached to
>> an on-board BMC-style management controller (though again, no host system
>> involved).  We (Equinix Metal) are interested in porting a modern OpenBMC to
>> it to replace the dated, crufty, pre-Linux-Foundation version of OpenBMC it
>> currently runs (as found in the linked repo).  The exact nature of the
>> devices powered by its outputs is well outside the scope of the firmware
>> running on that controller (it could be any arbitrary thing that runs on
>> 12VDC), but we still want to be able to both (a) retrieve per-output
>> voltage/current/power readings as provided by the existing LM25066 hwmon
>> support, and (b) control the on/off state of those outputs from userspace.
>>
>> Given the array of possible use-cases, an approach of adding power-switch
>> functionality to the existing LM25066 support seems like the most obvious
>> way to support this, so I'm hoping to see if I can get some idea of what an
>> acceptable implementation of that might look like.
>>
>
>Sorry, that is simply a no-go for the LM25066 driver. I mentioned it before,
>and it is still true: The hwmon subsystem is not in the business of power
>control.
>
>Have you looked into enclosures (drivers/misc/enclosure.c) ? Maybe that
>or something similar could be used for your purposes.
>
>Thanks,
>Guenter

I had a glance at the enclosure driver; it looks pretty geared toward 
SES-like things (drivers/scsi/ses.c being its only usage I can see in 
the kernel at the moment) and while it could perhaps be pressed into 
working for this it seems like it would probably drag in a fair amount 
of boilerplate and result in a somewhat gratuitously confusing driver 
arrangement (calling the things involved in the cases we're looking at 
"enclosures" seems like a bit of a stretch).

As an alternative, would something like the patch below be more along 
the lines of what you're suggesting?  And if so, would it make sense to 
generalize it into something like 'pmbus-switch.c' and add a 
PMBUS_HAVE_POWERSWITCH functionality bit or similar in the pmbus code 
instead of hardcoding it for only LM25066 support?



Thanks,
Zev


 From f4c0a3637371d69a414b6fb882497d22e5de3ba0 Mon Sep 17 00:00:00 2001
From: Zev Weiss <zev@bewilderbeest.net>
Date: Wed, 31 Mar 2021 01:58:35 -0500
Subject: [PATCH] misc: add lm25066-switch driver

This driver allows an lm25066 to be switched on and off from userspace
via sysfs.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
  drivers/misc/Kconfig          |   7 ++
  drivers/misc/Makefile         |   1 +
  drivers/misc/lm25066-switch.c | 120 ++++++++++++++++++++++++++++++++++
  3 files changed, 128 insertions(+)
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
index 000000000000..85f3677dc277
--- /dev/null
+++ b/drivers/misc/lm25066-switch.c
@@ -0,0 +1,120 @@
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
+#include "../hwmon/pmbus/pmbus.h"
+
+static ssize_t switch_show_state(struct device *dev, struct device_attribute *attr,
+                                 char *buf)
+{
+	struct i2c_client *pmic = dev_get_drvdata(dev);
+	ssize_t ret = pmbus_read_byte_data(pmic, 0, PMBUS_OPERATION);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n",
+	                  (ret & PB_OPERATION_CONTROL_ON) ? "on" : "off");
+}
+
+static ssize_t switch_set_state(struct device *dev, struct device_attribute *attr,
+                                const char *buf, size_t count)
+{
+	int state, status;
+	struct i2c_client *pmic = dev_get_drvdata(dev);
+	if (sysfs_streq(buf, "on"))
+		state = PB_OPERATION_CONTROL_ON;
+	else if (sysfs_streq(buf, "off"))
+		state = 0;
+	else
+		return -EINVAL;
+	status = pmbus_update_byte_data(pmic, 0, PMBUS_OPERATION,
+	                                PB_OPERATION_CONTROL_ON, state);
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


