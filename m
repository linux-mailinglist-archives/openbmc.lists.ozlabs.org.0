Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CF51CCB8
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 01:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvVGN111Wz3byF
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 09:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Etv1jejN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Etv1jejN; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVFK50Gyz3bq9
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 09:26:13 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B3929824;
 Thu,  5 May 2022 16:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651793169;
 bh=rjQ6bIFC7L3yFwYhOjGi4eWrvaaSejtl9wkPAzjsnU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Etv1jejNkYGu6jQ4YT3CN8ECZ5DCiA3jT85wfspeHOOCOOFXKNRQ/T3jUIGFg6HX1
 lyy5PSW6BIrsTwux1bh3c583bj0VWdAKkZ4PjVFUNvxRNaJK9vPNQN4Oo6hlQ+zxma
 wZahqHNPd7xZhYG4I4RHxTRVWgcGoouo1tT4vzLI=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 2/2] extcon: Add extcon-regulator driver
Date: Thu,  5 May 2022 16:25:57 -0700
Message-Id: <20220505232557.10936-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505232557.10936-1-zev@bewilderbeest.net>
References: <20220505232557.10936-1-zev@bewilderbeest.net>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver supports power connectors supplied by a regulator, such as
outlets on a power distribution unit (PDU).

Its extcon functionality is currently quite limited, since the
hardware it's initially targeting is very simple and doesn't really
provide anything for the driver to interact with, but it can be
extended as required for hardware that might offer more for it to do
(e.g. a presence-detection mechanism).

Its sole feature is a read/write sysfs attribute allowing userspace to
switch the output on and off by enabling and disabling the supply
regulator.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../ABI/testing/sysfs-driver-extcon-regulator |   8 ++
 MAINTAINERS                                   |   8 ++
 drivers/extcon/Kconfig                        |   8 ++
 drivers/extcon/Makefile                       |   1 +
 drivers/extcon/extcon-regulator.c             | 133 ++++++++++++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-extcon-regulator
 create mode 100644 drivers/extcon/extcon-regulator.c

diff --git a/Documentation/ABI/testing/sysfs-driver-extcon-regulator b/Documentation/ABI/testing/sysfs-driver-extcon-regulator
new file mode 100644
index 000000000000..b2f3141a1c49
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-extcon-regulator
@@ -0,0 +1,8 @@
+What:		/sys/bus/platform/drivers/extcon-regulator/*/state
+Date:		May 2022
+KernelVersion:	5.18
+Contact:	Zev Weiss <zev@bewilderbeest.net>
+Description:	When read, provides the current power state of the connector,
+		either "on" or "off".  Either string may also be written to
+		set the power state of the connector.
+Users:		OpenBMC <openbmc@lists.ozlabs.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index edc96cdb85e8..c30b6cf95ff1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16740,6 +16740,14 @@ F:	Documentation/devicetree/bindings/regmap/
 F:	drivers/base/regmap/
 F:	include/linux/regmap.h
 
+REGULATOR EXTCON DRIVER
+M:	Zev Weiss <zev@bewilderbeest.net>
+L:	openbmc@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-extcon-regulator
+F:	Documentation/devicetree/bindings/connector/regulator-connector.yaml
+F:	drivers/extcon/extcon-regulator.c
+
 REISERFS FILE SYSTEM
 L:	reiserfs-devel@vger.kernel.org
 S:	Supported
diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index 0d42e49105dd..19fe76da6c75 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -143,6 +143,14 @@ config EXTCON_QCOM_SPMI_MISC
 	  Say Y here to enable SPMI PMIC based USB cable detection
 	  support on Qualcomm PMICs such as PM8941.
 
+config EXTCON_REGULATOR
+	tristate "Regulator output extcon support"
+	depends on REGULATOR
+	help
+	  Say y here to enable support for regulator-supplied external
+	  power output connections, such as the outlets of a power
+	  distribution unit (PDU).
+
 config EXTCON_RT8973A
 	tristate "Richtek RT8973A EXTCON support"
 	depends on I2C
diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
index 1b390d934ca9..1a1c32d4b23e 100644
--- a/drivers/extcon/Makefile
+++ b/drivers/extcon/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_EXTCON_MAX8997)	+= extcon-max8997.o
 obj-$(CONFIG_EXTCON_PALMAS)	+= extcon-palmas.o
 obj-$(CONFIG_EXTCON_PTN5150)	+= extcon-ptn5150.o
 obj-$(CONFIG_EXTCON_QCOM_SPMI_MISC) += extcon-qcom-spmi-misc.o
+obj-$(CONFIG_EXTCON_REGULATOR)	+= extcon-regulator.o
 obj-$(CONFIG_EXTCON_RT8973A)	+= extcon-rt8973a.o
 obj-$(CONFIG_EXTCON_SM5502)	+= extcon-sm5502.o
 obj-$(CONFIG_EXTCON_USB_GPIO)	+= extcon-usb-gpio.o
diff --git a/drivers/extcon/extcon-regulator.c b/drivers/extcon/extcon-regulator.c
new file mode 100644
index 000000000000..eec1bb3f4c09
--- /dev/null
+++ b/drivers/extcon/extcon-regulator.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * extcon-regulator: extcon driver for regulator-supplied external power
+ * output connectors
+ *
+ * Copyright (C) 2022 Zev Weiss <zev@bewilderbeest.net>
+ */
+
+#include <linux/extcon-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+struct regulator_extcon_data {
+	struct extcon_dev *edev;
+	struct regulator *reg;
+	struct mutex lock;
+	unsigned int extcon_id;
+};
+
+static ssize_t state_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct regulator_extcon_data *data = dev_get_drvdata(dev);
+	int status = regulator_is_enabled(data->reg);
+
+	if (status < 0)
+		return status;
+
+	return sysfs_emit(buf, "%s\n", status ? "on" : "off");
+}
+
+static ssize_t state_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			   size_t count)
+{
+	int status, wantstate;
+	struct regulator_extcon_data *data = dev_get_drvdata(dev);
+	struct regulator *reg = data->reg;
+
+	if (sysfs_streq(buf, "on"))
+		wantstate = 1;
+	else if (sysfs_streq(buf, "off"))
+		wantstate = 0;
+	else
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+
+	status = regulator_is_enabled(reg);
+
+	/*
+	 * We need to ensure our enable/disable calls don't get imbalanced, so
+	 * bail if we can't determine the current state.
+	 */
+	if (status < 0)
+		goto out;
+
+	/* Nothing further needed if we're already in the desired state */
+	if (!!status == wantstate) {
+		status = 0;
+		goto out;
+	}
+
+	if (wantstate)
+		status = regulator_enable(reg);
+	else
+		status = regulator_disable(reg);
+
+out:
+	mutex_unlock(&data->lock);
+
+	return status ? : count;
+}
+
+static DEVICE_ATTR_RW(state);
+
+static struct attribute *regulator_extcon_attrs[] = {
+	&dev_attr_state.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(regulator_extcon);
+
+static int regulator_extcon_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct regulator_extcon_data *data;
+	struct device *dev = &pdev->dev;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg = devm_regulator_get_exclusive(&pdev->dev, "vout");
+	if (IS_ERR(data->reg))
+		return PTR_ERR(data->reg);
+
+	mutex_init(&data->lock);
+
+	/* No cables currently supported */
+	data->extcon_id = EXTCON_NONE;
+
+	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
+	if (IS_ERR(data->edev))
+		return PTR_ERR(data->edev);
+
+	ret = devm_extcon_dev_register(dev, data->edev);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static const struct of_device_id regulator_extcon_of_match_table[] = {
+	{ .compatible = "regulator-connector" },
+	{ },
+};
+
+static struct platform_driver regulator_extcon_driver = {
+	.driver = {
+		.name = "extcon-regulator",
+		.of_match_table = of_match_ptr(regulator_extcon_of_match_table),
+		.dev_groups = regulator_extcon_groups,
+	},
+	.probe = regulator_extcon_probe,
+};
+module_platform_driver(regulator_extcon_driver);
+
+MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
+MODULE_DESCRIPTION("Regulator extcon driver");
+MODULE_LICENSE("GPL");
-- 
2.36.0

