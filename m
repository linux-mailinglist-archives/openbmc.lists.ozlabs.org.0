Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAFE2E7AC8
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 16:56:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5bVk6RgyzDqLd
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 02:56:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.220.62;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=d6EbA6KZ; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5bTW0vwNzDqLG
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 02:55:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzhi4fCgPSmeDmBHwWqq5q2rgjff5jV0N+3VysQk+oynJQ7aTltXSnB9+JDg91XuzczzRCl9vXonTlT7zN0FF7Xb7suh2DCuZWbn1fNKHkIaDO1BSM1+Wda9gsHC5asXKcFCJaoNbI+aTA5VTpdZNcETIpaXtEsTp3LA3dwSJCsm9SqExoWKFI0Sq/udpHoIbOsl/zjXRnQT27HTgBFEbO2OQqgxnx0MtZZBhgbKgwL+vZwCGXFguaKhhJaARim0SoU6eghPVNeZddJfQiywMSKxdQLSre6x4KaqxyWuPHVc1lZeWgDUnj3SXvz95s9G9VBIpbAEWtYsgCZF4R77Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IChSwWKZybSwWrUYUN1IudzGL01dkz+ofDXRCzABzWY=;
 b=emPXk+LjFJSpZfyQ/kvHkhEnykVHE0rf9w2abZ2O8eb1Ed6mhLauHMW38HIWWFmWiLcMp3Phe3LNxEHZ840FP65cv7GuU4RSbHxUjhRy/hiiAD1rnvbXyf9DFR12N5djK6g9Dekh+XnvTHrQ0v4qBEK5GgK8d67J2tK0N/eOUq9OpConwAF8629yAbmdyKjWMkm6IZNtgtMocmgOGuzwDVsKVoVC5kBxvmWQKi+AaTvaRsiImc/ssPOsLl1qWgmrfxogiwtsC6gFlvZF4O2VYLtGqYghRdRjyOj1TzPwNc5KbOZ7SVgIi3b32q94PjaQzEQLNuoizKsACaxVqjuzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IChSwWKZybSwWrUYUN1IudzGL01dkz+ofDXRCzABzWY=;
 b=d6EbA6KZu4tuozlILRozIB2rjQO1MIH9uKuiXsZmpGtWnTL3Y4oatzjNYsRLPjE3vtHHBlllxJgKapongrnQXCFwdOEUsjpo0jj6NXQu2xU/DV4YBfNZQ/pCsJ1yihypPMJ2DnI3P7Kf196hYojBYU+I2Ncv8Q1AchOx1PtMS7gBumAekzxZSUU5fLeOiT09uAaWYNKbkrv7nYXlYVWL6rsoD8IvwxCkuYllx2dbh90doqKXluySyWAFYWfVkxOrq65/DTMwe4hNJ7DD1+NTqq/u1VTaX1HJsGXNllGdHX1UTj5VbPkZQJQgPqY7lNXc+MDvRnYf12tQO8k798mLlA==
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fii-usa.com;
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DM6PR08MB6300.namprd08.prod.outlook.com (2603:10b6:5:1ed::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27; Wed, 30 Dec 2020 15:55:01 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e%7]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 15:55:01 +0000
From: Lancelot Kao <lancelot.kao@fii-usa.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Mustafa Shehabi <Mustafa.shehabi@fii-na.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>
Subject: [PATCH linux dev-5.8] Support Hwmon ADM1266 Driver
Date: Wed, 30 Dec 2020 09:54:40 -0600
Message-Id: <20201230155440.15721-1-lancelot.kao@fii-usa.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [216.63.87.86]
X-ClientProxiedBy: SN4PR0401CA0042.namprd04.prod.outlook.com
 (2603:10b6:803:2a::28) To DM6PR08MB4890.namprd08.prod.outlook.com
 (2603:10b6:5:43::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from OpenSystem.houston.foxconn.com (216.63.87.86) by
 SN4PR0401CA0042.namprd04.prod.outlook.com (2603:10b6:803:2a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Wed, 30 Dec 2020 15:55:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a200a5-c9f7-466b-bbb9-08d8acdb43f9
X-MS-TrafficTypeDiagnostic: DM6PR08MB6300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR08MB6300F528D029081E70A2CF14C0D70@DM6PR08MB6300.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlvm2Gyq4/FcQIqul2y58/UzCs2O/sG+rcdOCQD5CfqheEUtGkdt+CH6KbO3bR5vfZWgT4SmS3TGm6umukQqBXuwadeLspS6qOK8FmeOFBXkfhXIspZLcZfDLi7g+pKzVwN1m9NAzZxqTeJXCMrj0cpf+v5ODxwbt8SSwUl4qxjbxLXwFabM4SEMuoqeGBZ4MBFoTh5G9OZ39oMqIWMP7aIJWX5IH2tnUaog9n2eE14aHuKLJrsiYDrFri0U1VheA6ER1uUTt5pZREGuxGTgCYYKw41DcPF2+DoBTzmO+6M6AwfCptJCqHgtqCbDY7FLbVKmRDfsRu86A1VoH6hSTfa1aqH9nM0zIOUpURhnjstiwK5XWOzE2dyYJeObsG4rLETO8sa5CbsajA1ef4pKTOMoaeR36I6N5V6Msw3tGFpYmnOtJW+CYem8dhiXeIUnjv6l5/IbXVAH2+M7TE4wBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(366004)(346002)(376002)(136003)(66476007)(86362001)(966005)(36756003)(5660300002)(8936002)(107886003)(26005)(1076003)(66946007)(6512007)(6486002)(110136005)(66556008)(6506007)(6666004)(8676002)(2906002)(52116002)(956004)(83380400001)(186003)(4326008)(44832011)(2616005)(478600001)(16526019)(30864003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xsUmeH/MdY4X8umIdKKFmOLlhwhDSg87yTIpq9ypzjAWadrUBm66JwRVLK/y?=
 =?us-ascii?Q?RYZm0s9ETOyi8Z3t/hA0TZmYJ+0hRb1u06fU/Hvv7+KMRQTwBxAextVf4KGu?=
 =?us-ascii?Q?U23pYhJrweU81sOWcexJfQWXnANK/Yy1400EdJjAzJcL8oaH2svkuoANa4F6?=
 =?us-ascii?Q?9wUbV0N/bbBkih/WgHv1v0/M4CT4fatg4inDfd0OPg7/VdNBgTuJnhEhuvs2?=
 =?us-ascii?Q?hTj+Huhu40n+T6FP5wFzz7WAtJJPO0P84lqY3pcB0GW12tYsH9seQWzFYFSA?=
 =?us-ascii?Q?aKvbO09XhUZdkOMSv8nxB4HjOcittrdNboiakC4Lg4tXRnccPRzyQT5QE6vz?=
 =?us-ascii?Q?Uevuoi1NQoEUA32my+qw3amvs4jdVPX/2v/oshEeStBz6YUHX0Nu4auIgSNl?=
 =?us-ascii?Q?aCJDd8xRc4kj3eQ2h93TU5E5/dVFqmeV+MdATqHHC4ChWeaNVeIe8OWnWRQI?=
 =?us-ascii?Q?gESLeu/1PDWyqMcr9TMzNZW23dLqdUosrAiKYPUO167YD+eR72SxXVlhNMUw?=
 =?us-ascii?Q?yhbBl25++wfb1C5prCThMM2hiOEuyvNZTztaXG9LiIzDMy0eQjepri+juIl6?=
 =?us-ascii?Q?GwFQynjqXweBKbtCvWt0aMKs8LUaiXkoXjGqaM5qU6WCSAf+V4p8eBLm7A4y?=
 =?us-ascii?Q?udecaEzDYja3/f7y9BHYnSdhm2+DIUFYClNuX7ZJ0ZsPtRHs16A5yPt7SGdl?=
 =?us-ascii?Q?MBAT4tqsen4EvBNU4BIPfLlMrFnKGaHtoovbZLgh+KsfqBLNR8H2dZRr1+Ql?=
 =?us-ascii?Q?1jNIw/WjtTz0LSRUaz/W+3fWJhvofSthbadHuMrUH2Tt9gYlkJzYcJ39ghc+?=
 =?us-ascii?Q?+oZKxlehQ3y6b1jkOIT/jNe5z6D6jZfimRtghO93S7dqbiB55AL3vpvXaib1?=
 =?us-ascii?Q?yGinBPzWUwA5xnf0/JFy+yatjm5p7YuWlMlbqIFyTSvYSge/EXxHoJBTExOa?=
 =?us-ascii?Q?I5LYXRvZZvoF07TO2jpc57qTcW2xG5KyHJ5vFAb7cSY=3D?=
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 15:55:00.9361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a200a5-c9f7-466b-bbb9-08d8acdb43f9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xd1nGbNdTHimgSydiuOalRM9HGyqkco1jcWE5/1TU5vwedx+XoyFGQR8Lg4gJ2DpgBlO2H4Hj4ZiKOWvZcKH89F81QkyILCVKPBhkHoKMXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6300
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
Cc: mustafa <mustafa.shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: mustafa <mustafa.shehabi@fii-na.com>

This hwmon/pmbus driver supports ADM1266 device
It modified from linux kernel 5.10 and Fii modified
it to fit openbmc kernel 5.8

Signed-off-by: Mustafa Shehabi <Mustafa.shehabi@fii-na.com>
---
 .../bindings/hwmon/adi,adm1266.yaml           |  51 ++
 Documentation/hwmon/adm1266.rst               |  37 ++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/pmbus/Kconfig                   |  11 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/adm1266.c                 | 513 ++++++++++++++++++
 6 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,adm1266.yaml
 create mode 100644 Documentation/hwmon/adm1266.rst
 create mode 100644 drivers/hwmon/pmbus/adm1266.c

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1266.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1266.yaml
new file mode 100644
index 000000000000..d088c744d53a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1266.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,adm1266.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADM1266 Cascadable Super Sequencer with Margin
+  Control and Fault Recording
+
+maintainers:
+  - Alexandru Tachici <alexandru.tachici@analog.com>
+
+description: |
+  Analog Devices ADM1266 Cascadable Super Sequencer with Margin
+  Control and Fault Recording.
+  https://www.analog.com/media/en/technical-documentation/d...
+
+properties:
+  compatible:
+    enum:
+      - adi,adm1266
+
+  reg:
+    description: |
+      I2C address of slave device.
+    items:
+      minimum: 0x40
+      maximum: 0x4F
+
+  avcc-supply:
+    description: |
+      Phandle to the Avcc power supply.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adm1266@40 {
+                compatible = "adi,adm1266";
+                reg = <0x40>;
+        };
+    };
+...
diff --git a/Documentation/hwmon/adm1266.rst b/Documentation/hwmon/adm1266.rst
new file mode 100644
index 000000000000..c7e5b0fab381
--- /dev/null
+++ b/Documentation/hwmon/adm1266.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver adm1266
+=====================
+
+Supported chips:
+  * Analog Devices ADM1266
+    Prefix: 'adm1266'
+    Datasheet: https://www.analog.com/media/en/technical-documentation/d...
+
+Author: Alexandru Tachici <alexandru.tachici@analog.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices ADM1266 sequencer.
+
+ADM1266 is a sequencer that features voltage readback from 17 channels via an
+integrated 12 bit SAR ADC, accessed using a PMBus interface.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus for details on PMBus client drivers.
+
+
+Sysfs entries
+-------------
+
+The following attributes are supported. Limits are read-write, history reset
+attributes are write-only, all other attributes are read-only.
+
+inX_label		"voutx"
+inX_input		Measured voltage.
+inX_min			Minimum Voltage.
+inX_max			Maximum voltage.
+inX_min_alarm		Voltage low alarm.
+inX_max_alarm		Voltage high alarm.
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 89e1a824021f..37e1925735c7 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -30,6 +30,7 @@ Hardware Monitoring Kernel Drivers
    adm1026
    adm1031
    adm1177
+   adm1266
    adm1275
    adm9240
    ads7828
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ea516cec1d35..63b9d1ec200b 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -26,6 +26,17 @@ config SENSORS_PMBUS
 	  This driver can also be built as a module. If so, the module will
 	  be called pmbus.
 
+config SENSORS_ADM1266
+	tristate "Analog Devices ADM1266 Sequencer"
+	select CRC8
+	depends on GPIOLIB
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices ADM1266 Cascadable Super Sequencer.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called adm1266.
+
 config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index c4b15db996ad..da41d22be1c9 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -5,6 +5,7 @@
 
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
+obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
new file mode 100644
index 000000000000..1d83c4f42eaf
--- /dev/null
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADM1266 - Cascadable Super Sequencer with Margin
+ * Control and Fault Recording
+ *
+ * Copyright 2020 Analog Devices Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/crc8.h>
+#include <linux/debugfs.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/nvmem-provider.h>
+#include "pmbus.h"
+#include <linux/slab.h>
+#include <linux/timekeeping.h>
+
+#define ADM1266_BLACKBOX_CONFIG	0xD3
+#define ADM1266_PDIO_CONFIG	0xD4
+#define ADM1266_READ_STATE	0xD9
+#define ADM1266_READ_BLACKBOX	0xDE
+#define ADM1266_SET_RTC		0xDF
+#define ADM1266_GPIO_CONFIG	0xE1
+#define ADM1266_BLACKBOX_INFO	0xE6
+#define ADM1266_PDIO_STATUS	0xE9
+#define ADM1266_GPIO_STATUS	0xEA
+
+/* ADM1266 GPIO defines */
+#define ADM1266_GPIO_NR			9
+#define ADM1266_GPIO_FUNCTIONS(x)	FIELD_GET(BIT(0), x)
+#define ADM1266_GPIO_INPUT_EN(x)	FIELD_GET(BIT(2), x)
+#define ADM1266_GPIO_OUTPUT_EN(x)	FIELD_GET(BIT(3), x)
+#define ADM1266_GPIO_OPEN_DRAIN(x)	FIELD_GET(BIT(4), x)
+
+/* ADM1266 PDIO defines */
+#define ADM1266_PDIO_NR			16
+#define ADM1266_PDIO_PIN_CFG(x)		FIELD_GET(GENMASK(15, 13), x)
+#define ADM1266_PDIO_GLITCH_FILT(x)	FIELD_GET(GENMASK(12, 9), x)
+#define ADM1266_PDIO_OUT_CFG(x)		FIELD_GET(GENMASK(2, 0), x)
+
+#define ADM1266_BLACKBOX_OFFSET		0
+#define ADM1266_BLACKBOX_SIZE		64
+
+#define ADM1266_PMBUS_BLOCK_MAX		255
+
+struct adm1266_data {
+	struct pmbus_driver_info info;
+	struct gpio_chip gc;
+	const char *gpio_names[ADM1266_GPIO_NR + ADM1266_PDIO_NR];
+	struct i2c_client *client;
+	struct dentry *debugfs_dir;
+	struct nvmem_config nvmem_config;
+	struct nvmem_device *nvmem;
+	u8 *dev_mem;
+	struct mutex buf_mutex;
+	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
+	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
+};
+
+static const struct nvmem_cell_info adm1266_nvmem_cells[] = {
+	{
+		.name           = "blackbox",
+		.offset         = ADM1266_BLACKBOX_OFFSET,
+		.bytes          = 2048,
+	},
+};
+
+DECLARE_CRC8_TABLE(pmbus_crc_table);
+
+/*
+ * Different from Block Read as it sends data and waits for the slave to
+ * return a value dependent on that data. The protocol is simply a Write Block
+ * followed by a Read Block without the Read-Block command field and the
+ * Write-Block STOP bit.
+ */
+static int adm1266_pmbus_block_xfer(struct adm1266_data *data, u8 cmd, u8 w_len, u8 *data_w,
+				    u8 *data_r)
+{
+	struct i2c_client *client = data->client;
+	struct i2c_msg msgs[2] = {
+		{
+			.addr = client->addr,
+			.flags = I2C_M_DMA_SAFE,
+			.buf = data->write_buf,
+			.len = w_len + 2,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD | I2C_M_DMA_SAFE,
+			.buf = data->read_buf,
+			.len = ADM1266_PMBUS_BLOCK_MAX + 2,
+		}
+	};
+	u8 addr;
+	u8 crc;
+	int ret;
+
+	mutex_lock(&data->buf_mutex);
+
+	msgs[0].buf[0] = cmd;
+	msgs[0].buf[1] = w_len;
+	memcpy(&msgs[0].buf[2], data_w, w_len);
+
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2) {
+		if (ret >= 0)
+			ret = -EPROTO;
+
+		mutex_unlock(&data->buf_mutex);
+
+		return ret;
+	}
+
+	if (client->flags & I2C_CLIENT_PEC) {
+		addr = i2c_8bit_addr_from_msg(&msgs[0]);
+		crc = crc8(pmbus_crc_table, &addr, 1, 0);
+		crc = crc8(pmbus_crc_table, msgs[0].buf,  msgs[0].len, crc);
+
+		addr = i2c_8bit_addr_from_msg(&msgs[1]);
+		crc = crc8(pmbus_crc_table, &addr, 1, crc);
+		crc = crc8(pmbus_crc_table, msgs[1].buf,  msgs[1].buf[0] + 1, crc);
+
+		if (crc != msgs[1].buf[msgs[1].buf[0] + 1]) {
+			mutex_unlock(&data->buf_mutex);
+			return -EBADMSG;
+		}
+	}
+
+	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
+
+	ret = msgs[1].buf[0];
+	mutex_unlock(&data->buf_mutex);
+
+	return ret;
+}
+
+static const unsigned int adm1266_gpio_mapping[ADM1266_GPIO_NR][2] = {
+	{1, 0},
+	{2, 1},
+	{3, 2},
+	{4, 8},
+	{5, 9},
+	{6, 10},
+	{7, 11},
+	{8, 6},
+	{9, 7},
+};
+
+static const char *adm1266_names[ADM1266_GPIO_NR + ADM1266_PDIO_NR] = {
+	"GPIO1", "GPIO2", "GPIO3", "GPIO4", "GPIO5", "GPIO6", "GPIO7", "GPIO8",
+	"GPIO9", "PDIO1", "PDIO2", "PDIO3", "PDIO4", "PDIO5", "PDIO6",
+	"PDIO7", "PDIO8", "PDIO9", "PDIO10", "PDIO11", "PDIO12", "PDIO13",
+	"PDIO14", "PDIO15", "PDIO16",
+};
+
+static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct adm1266_data *data = gpiochip_get_data(chip);
+	u8 read_buf[I2C_SMBUS_BLOCK_MAX + 1];
+	unsigned long pins_status;
+	unsigned int pmbus_cmd;
+	int ret;
+
+	if (offset < ADM1266_GPIO_NR)
+		pmbus_cmd = ADM1266_GPIO_STATUS;
+	else
+		pmbus_cmd = ADM1266_PDIO_STATUS;
+
+	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
+	if (ret < 0)
+		return ret;
+
+	pins_status = read_buf[0] + (read_buf[1] << 8);
+	if (offset < ADM1266_GPIO_NR)
+		return test_bit(adm1266_gpio_mapping[offset][1], &pins_status);
+
+	return test_bit(offset - ADM1266_GPIO_NR, &pins_status);
+}
+
+static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				     unsigned long *bits)
+{
+	struct adm1266_data *data = gpiochip_get_data(chip);
+	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1];
+	unsigned long status;
+	unsigned int gpio_nr;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
+	if (ret < 0)
+		return ret;
+
+	status = read_buf[0] + (read_buf[1] << 8);
+
+	*bits = 0;
+	for_each_set_bit(gpio_nr, mask, ADM1266_GPIO_NR) {
+		if (test_bit(adm1266_gpio_mapping[gpio_nr][1], &status))
+			set_bit(gpio_nr, bits);
+	}
+
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_buf);
+	if (ret < 0)
+		return ret;
+
+	status = read_buf[0] + (read_buf[1] << 8);
+
+	*bits = 0;
+	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
+		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
+			set_bit(gpio_nr, bits);
+	}
+
+	return 0;
+}
+
+static void adm1266_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
+{
+	struct adm1266_data *data = gpiochip_get_data(chip);
+	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1];
+	unsigned long gpio_config;
+	unsigned long pdio_config;
+	unsigned long pin_cfg;
+	u8 write_cmd;
+	int ret;
+	int i;
+
+	for (i = 0; i < ADM1266_GPIO_NR; i++) {
+		write_cmd = adm1266_gpio_mapping[i][1];
+		ret = adm1266_pmbus_block_xfer(data, ADM1266_GPIO_CONFIG, 1, &write_cmd, read_buf);
+		if (ret != 2)
+			return;
+
+		gpio_config = read_buf[0];
+		seq_puts(s, adm1266_names[i]);
+
+		seq_puts(s, " ( ");
+		if (!ADM1266_GPIO_FUNCTIONS(gpio_config)) {
+			seq_puts(s, "high-Z )\n");
+			continue;
+		}
+		if (ADM1266_GPIO_INPUT_EN(gpio_config))
+			seq_puts(s, "input ");
+		if (ADM1266_GPIO_OUTPUT_EN(gpio_config))
+			seq_puts(s, "output ");
+		if (ADM1266_GPIO_OPEN_DRAIN(gpio_config))
+			seq_puts(s, "open-drain )\n");
+		else
+			seq_puts(s, "push-pull )\n");
+	}
+
+	write_cmd = 0xFF;
+	ret = adm1266_pmbus_block_xfer(data, ADM1266_PDIO_CONFIG, 1, &write_cmd, read_buf);
+	if (ret != 32)
+		return;
+
+	for (i = 0; i < ADM1266_PDIO_NR; i++) {
+		seq_puts(s, adm1266_names[ADM1266_GPIO_NR + i]);
+
+		pdio_config = read_buf[2 * i];
+		pdio_config += (read_buf[2 * i + 1] << 8);
+		pin_cfg = ADM1266_PDIO_PIN_CFG(pdio_config);
+
+		seq_puts(s, " ( ");
+		if (!pin_cfg || pin_cfg > 5) {
+			seq_puts(s, "high-Z )\n");
+			continue;
+		}
+
+		if (pin_cfg & BIT(0))
+			seq_puts(s, "output ");
+
+		if (pin_cfg & BIT(1))
+			seq_puts(s, "input ");
+
+		seq_puts(s, ")\n");
+	}
+}
+
+static int adm1266_config_gpio(struct adm1266_data *data)
+{
+	const char *name = dev_name(&data->client->dev);
+	char *gpio_name;
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(data->gpio_names); i++) {
+		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%s",
+					   data->client->addr, adm1266_names[i]);
+		if (!gpio_name)
+			return -ENOMEM;
+
+		data->gpio_names[i] = gpio_name;
+	}
+
+	data->gc.label = name;
+	data->gc.parent = &data->client->dev;
+	data->gc.owner = THIS_MODULE;
+	data->gc.base = -1;
+	data->gc.names = data->gpio_names;
+	data->gc.ngpio = ARRAY_SIZE(data->gpio_names);
+	data->gc.get = adm1266_gpio_get;
+	data->gc.get_multiple = adm1266_gpio_get_multiple;
+	data->gc.dbg_show = adm1266_gpio_dbg_show;
+
+	ret = devm_gpiochip_add_data(&data->client->dev, &data->gc, data);
+	if (ret)
+		dev_err(&data->client->dev, "GPIO registering failed (%d)\n", ret);
+
+	return ret;
+}
+
+static int adm1266_state_read(struct seq_file *s, void *pdata)
+{
+	struct device *dev = s->private;
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_read_word_data(client, ADM1266_READ_STATE);
+	if (ret < 0)
+		return ret;
+
+	seq_printf(s, "%d\n", ret);
+
+	return 0;
+}
+
+static void adm1266_init_debugfs(struct adm1266_data *data)
+{
+	struct dentry *root;
+
+	root = pmbus_get_debugfs_dir(data->client);
+	if (!root)
+		return;
+
+	data->debugfs_dir = debugfs_create_dir(data->client->name, root);
+	if (!data->debugfs_dir)
+		return;
+
+	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
+				    adm1266_state_read);
+}
+
+static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
+{
+	int record_count;
+	char index;
+	u8 buf[5];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret != 4)
+		return -EIO;
+
+	record_count = buf[3];
+
+	for (index = 0; index < record_count; index++) {
+		ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, read_buff);
+		if (ret < 0)
+			return ret;
+
+		if (ret != ADM1266_BLACKBOX_SIZE)
+			return -EIO;
+
+		read_buff += ADM1266_BLACKBOX_SIZE;
+	}
+
+	return 0;
+}
+
+static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+{
+	struct adm1266_data *data = priv;
+	int ret;
+
+	if (offset + bytes > data->nvmem_config.size)
+		return -EINVAL;
+
+	if (offset == 0) {
+		memset(data->dev_mem, 0, data->nvmem_config.size);
+
+		ret = adm1266_nvmem_read_blackbox(data, data->dev_mem);
+		if (ret) {
+			dev_err(&data->client->dev, "Could not read blackbox!");
+			return ret;
+		}
+	}
+
+	memcpy(val, data->dev_mem + offset, bytes);
+
+	return 0;
+}
+
+static int adm1266_config_nvmem(struct adm1266_data *data)
+{
+	data->nvmem_config.name = dev_name(&data->client->dev);
+	data->nvmem_config.dev = &data->client->dev;
+	data->nvmem_config.root_only = true;
+	data->nvmem_config.read_only = true;
+	data->nvmem_config.owner = THIS_MODULE;
+	data->nvmem_config.reg_read = adm1266_nvmem_read;
+	data->nvmem_config.cells = adm1266_nvmem_cells;
+	data->nvmem_config.ncells = ARRAY_SIZE(adm1266_nvmem_cells);
+	data->nvmem_config.priv = data;
+	data->nvmem_config.stride = 1;
+	data->nvmem_config.word_size = 1;
+	data->nvmem_config.size = adm1266_nvmem_cells[0].bytes;
+
+	data->dev_mem = devm_kzalloc(&data->client->dev, data->nvmem_config.size, GFP_KERNEL);
+	if (!data->dev_mem)
+		return -ENOMEM;
+
+	data->nvmem = devm_nvmem_register(&data->client->dev, &data->nvmem_config);
+	if (IS_ERR(data->nvmem)) {
+		dev_err(&data->client->dev, "Could not register nvmem!");
+		return PTR_ERR(data->nvmem);
+	}
+
+	return 0;
+}
+
+static int adm1266_set_rtc(struct adm1266_data *data)
+{
+	time64_t kt;
+	char write_buf[6];
+	int i;
+
+	kt = ktime_get_seconds();
+
+	memset(write_buf, 0, sizeof(write_buf));
+
+	for (i = 0; i < 4; i++)
+		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
+
+	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
+					  write_buf);
+}
+
+static int adm1266_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct adm1266_data *data;
+	int ret;
+	int i;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct adm1266_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	data->info.pages = 17;
+	data->info.format[PSC_VOLTAGE_OUT] = linear;
+	for (i = 0; i < data->info.pages; i++)
+		data->info.func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+
+	crc8_populate_msb(pmbus_crc_table, 0x7);
+	mutex_init(&data->buf_mutex);
+
+	ret = adm1266_config_gpio(data);
+	if (ret < 0)
+		return ret;
+
+	ret = adm1266_set_rtc(data);
+	if (ret < 0)
+		return ret;
+
+	ret = adm1266_config_nvmem(data);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_do_probe(client, id, &data->info);
+	if (ret)
+		return ret;
+
+	adm1266_init_debugfs(data);
+
+	return 0;
+}
+
+static const struct of_device_id adm1266_of_match[] = {
+	{ .compatible = "adi,adm1266" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adm1266_of_match);
+
+static const struct i2c_device_id adm1266_id[] = {
+	{ "adm1266", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, adm1266_id);
+
+static struct i2c_driver adm1266_driver = {
+	.driver = {
+		   .name = "adm1266",
+		   .of_match_table = adm1266_of_match,
+		  },
+	.probe = adm1266_probe,
+	.remove = pmbus_do_remove,
+	.id_table = adm1266_id,
+};
+
+module_i2c_driver(adm1266_driver);
+
+MODULE_AUTHOR("Alexandru Tachici <alexandru.tachici@analog.com>");
+MODULE_DESCRIPTION("PMBus driver for Analog Devices ADM1266");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

