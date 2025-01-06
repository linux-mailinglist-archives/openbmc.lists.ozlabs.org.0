Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A9A02EB3
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 18:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgnH1YDcz3dJC
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 04:16:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736183755;
	cv=none; b=NtkcImcKEJ/n3KGDGbaAZpZmhphIS5Eb+BMmufm9A8F304YhWoEeVnRm6qkJIO81Rb+C7ZNAkYutH/Jvu5au0qJMtt0C1sGUe2BH9NiXC2jlNj0gcAqn5mcOy+S91LNaikQz85MrNlCUUXWHD6iaZcd/Y/A+9UC0XyMxLq6wnRgCoHfzQguyj5dr6pnUPY0tMqJ2owpVqz2jkzZV1erg2fxA3E3fts7QDw9cl4/vdi68CW5lOQrk3xtCuwqGd4S3QLoIY86usYhraQdcSjDUjykLSX9phBuhqF+esGwEjGd0eriKAAniZe+nayDgYRCZX6w2TYgLCA8vBFHM5dS/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736183755; c=relaxed/relaxed;
	bh=hyPM9J5rIIQ8paB0uL8qh8xj/vN1MwR/KKgJKUXpjQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJoVo0bdfuTzCOJ2knPllURPVGr9g/nPTB/N2ZFdbVv590q6aPa8vgA+fMkyse8t4lEa8W+6E0YUoc9lTZEX1ZsRSgDVMgsoJdJiWM3KHZiEiLy2Ml2jIuKKabtCjENrquEeWrJhuxw6soOzNyJE0iZG/tCLTVpsIoq7itz0Gqu+/fk4EuYw2kcTLycBdxZ9gnz3e0C0jYHb6RWaXiqhPkNdNM9NkOn6AiVt3uePDnOv3dUGR/RriQE/lKKx57uwhWcZFDQHAcNICQvk5k6shUe+3A2TyB/L4oEIC1QIUDQF1KmR5zNsVmmWz+keWjdN1kpwF5DJirayL95Oos9Ulg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YN787+ID; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YN787+ID;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRgn65HT8z30TQ
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 04:15:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506FFTuM016320;
	Mon, 6 Jan 2025 17:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hyPM9J5rIIQ8paB0u
	L8qh8xj/vN1MwR/KKgJKUXpjQE=; b=YN787+ID6PHeMcs1ynvsF/72enlpcXrnT
	BjcYu6Pdw/gHM50I+hBeuE6iXrfzkN3Q6Yv36X5t/u6jo1KYo5Rncv2DMMYHlyyi
	qr0+TEd5Gi80zSU7LfSZyyoqINKKYT8lNqbfM1rs8HnKOe+vKpL23/YLveIeATvX
	qTU/nbypkMe4VWnbwLCnYOzC8e9gDEnllDmgREF8NvkgSFrVUoGilsqa1Jd00arQ
	V9IAXtVz9pQbluYu7Cm4eppR6lzp4hH9QBq1RLDjtwCAcoADbj/Qxgacgxr/tAsZ
	RDMBYmWQv22g0nfoTh7z719iGSpsA6HsHMkUWIU1ve+3sbYquW+Vw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4407nh37g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506ElUoR008861;
	Mon, 6 Jan 2025 17:15:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfpyps1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:41 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506HFeeS63701328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 17:15:40 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EA6B58064;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FFD05805F;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v1 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Date: Mon,  6 Jan 2025 11:15:26 -0600
Message-ID: <20250106171530.1063148-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106171530.1063148-1-ninad@linux.ibm.com>
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TlukrMCyUe5hfMY6T5oVBRD1Oxczp81u
X-Proofpoint-GUID: TlukrMCyUe5hfMY6T5oVBRD1Oxczp81u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1011 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060150
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Ninad Palsule <ninad@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the driver to monitor Intel common redundant power supply (crps185)
with hwmon over pmbus.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/hwmon/crps.rst  | 97 +++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst |  1 +
 MAINTAINERS                   |  7 +++
 drivers/hwmon/pmbus/Kconfig   |  9 ++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/crps.c    | 74 ++++++++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
new file mode 100644
index 000000000000..87380b496558
--- /dev/null
+++ b/Documentation/hwmon/crps.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver crps
+==================
+
+Supported chips:
+
+  * Intel CRPS185
+
+    Prefix: 'crps185'
+
+    Addresses scanned: -
+
+    Datasheet: Only available under NDA.
+
+Authors:
+    Ninad Palsule <ninad@linux.ibm.com>
+
+
+Description
+-----------
+
+This driver implements support for Intel Common Redundant Power supply with
+PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max		Maximum input current
+curr1_max_alarm		Input maximum current high alarm
+curr1_crit		Critial high input current
+curr1_crit_alarm	Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output maximum current high alarm
+curr2_crit		Critial high output current
+curr2_crit_alarm	Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical input over voltage
+in1_crit_alarm		Critical input over voltage alarm
+in1_max			Maximum input over voltage
+in1_max_alarm		Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit		Critical input over voltage
+in2_crit_alarm		Critical input over voltage alarm
+in2_lcrit		Critical input under voltage fault
+in2_lcrit_alarm		Critical input under voltage fault alarm
+in2_max			Maximum input over voltage
+in2_max_alarm		Maximum input over voltage alarm
+in2_min			Minimum input under voltage warning
+in2_min_alarm		Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max	Maximum rated input power
+
+temp[1-2]_input		Measured temperature
+temp[1-2]_crit 		Critical temperature
+temp[1-2]_crit_alarm	Critical temperature alarm
+temp[1-2]_max		Maximum temperature
+temp[1-2]_max_alarm	Maximum temperature alarm
+temp[1-2]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target		Fan 1 target.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 3259106afc57..946a380210ef 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -55,6 +55,7 @@ Hardware Monitoring Kernel Drivers
    coretemp
    corsair-cpro
    corsair-psu
+   crps
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index 12b61e60e2e9..40b29234f4ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5479,6 +5479,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
 
+INTEL CRPS COMMON REDUNDANT PSU DRIVER
+M:	Ninad Palsule <ninad@linux.ibm.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/crps.rst
+F:	drivers/hwmon/pmbus/crps.c
+
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 1030e94f9766..fb6bf3fa9b6e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -75,6 +75,15 @@ config SENSORS_BPA_RS600
 	  This driver can also be built as a module. If so, the module will
 	  be called bpa-rs600.
 
+config SENSORS_CRPS
+	tristate "Intel Common Redundant Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Intel
+	  Common Redundant Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called crps.
+
 config SENSORS_DELTA_AHE50DC_FAN
 	tristate "Delta AHE-50DC fan control module"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 9dbda31d3343..6807e06c5662 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
+obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
diff --git a/drivers/hwmon/pmbus/crps.c b/drivers/hwmon/pmbus/crps.c
new file mode 100644
index 000000000000..164b33fed312
--- /dev/null
+++ b/drivers/hwmon/pmbus/crps.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 IBM Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+static const struct i2c_device_id crps_id[] = {
+	{ "intel_crps185" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, crps_id);
+
+static struct pmbus_driver_info crps_info = {
+	.pages = 1,
+	/* PSU uses default linear data format. */
+	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_IIN |
+		PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+		PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+};
+
+static int crps_probe(struct i2c_client *client)
+{
+	int rc;
+	struct device *dev = &client->dev;
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (rc != 7 || strncmp(buf, "03NK260", 7)) {
+		buf[rc] = '\0';
+		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n", buf);
+	}
+
+	rc = pmbus_do_probe(client, &crps_info);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to probe\n");
+
+	return 0;
+}
+
+static const struct of_device_id crps_of_match[] = {
+	{
+		.compatible = "intel,crps185",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, crps_of_match);
+
+static struct i2c_driver crps_driver = {
+	.driver = {
+		.name = "crps",
+		.of_match_table = crps_of_match,
+	},
+	.probe = crps_probe,
+	.id_table = crps_id,
+};
+
+module_i2c_driver(crps_driver);
+
+MODULE_AUTHOR("Ninad Palsule");
+MODULE_DESCRIPTION("PMBus driver for Intel Common Redundant power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0

