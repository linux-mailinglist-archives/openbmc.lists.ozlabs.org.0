Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7812549D
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 22:28:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dSml0hMNzDqKs
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 08:28:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dSjt2lfyzDqkm
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 08:26:09 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBILC5eW060524; Wed, 18 Dec 2019 16:26:07 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy7ubgke9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 16:26:06 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBILBuZL001348;
 Wed, 18 Dec 2019 21:26:05 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 2wvqc6rqfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 21:26:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBILQ5i742205460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 21:26:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4090428060;
 Wed, 18 Dec 2019 21:26:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D04C928059;
 Wed, 18 Dec 2019 21:26:04 +0000 (GMT)
Received: from wrightj-ThinkPad-W520.rchland.ibm.com (unknown [9.10.101.53])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 21:26:04 +0000 (GMT)
From: Jim Wright <wrightj@linux.vnet.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 2/2] hwmon: Add support for UCD90320 Power
 Sequencer
Date: Wed, 18 Dec 2019 15:24:46 -0600
Message-Id: <20191218212446.22676-3-wrightj@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218212446.22676-1-wrightj@linux.vnet.ibm.com>
References: <20191218212446.22676-1-wrightj@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_07:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180163
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
Cc: Jim Wright <wrightj@linux.vnet.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for the UCD90320 chip and its expanded set of GPIO pins.

Signed-off-by: Jim Wright <wrightj@linux.vnet.ibm.com>
Link: https://lore.kernel.org/r/20191205232411.21492-3-wrightj@linux.vnet.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ucd9000.rst | 12 ++++++++--
 drivers/hwmon/pmbus/Kconfig     |  6 ++---
 drivers/hwmon/pmbus/ucd9000.c   | 39 +++++++++++++++++++++++----------
 3 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/Documentation/hwmon/ucd9000.rst b/Documentation/hwmon/ucd9000.rst
index 746f21fcb48c..704f0cbd95d3 100644
--- a/Documentation/hwmon/ucd9000.rst
+++ b/Documentation/hwmon/ucd9000.rst
@@ -3,9 +3,10 @@ Kernel driver ucd9000
 
 Supported chips:
 
-  * TI UCD90120, UCD90124, UCD90160, UCD9090, and UCD90910
+  * TI UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, and UCD90910
 
-    Prefixes: 'ucd90120', 'ucd90124', 'ucd90160', 'ucd9090', 'ucd90910'
+    Prefixes: 'ucd90120', 'ucd90124', 'ucd90160', 'ucd90320', 'ucd9090',
+              'ucd90910'
 
     Addresses scanned: -
 
@@ -14,6 +15,7 @@ Supported chips:
 	- http://focus.ti.com/lit/ds/symlink/ucd90120.pdf
 	- http://focus.ti.com/lit/ds/symlink/ucd90124.pdf
 	- http://focus.ti.com/lit/ds/symlink/ucd90160.pdf
+	- http://focus.ti.com/lit/ds/symlink/ucd90320.pdf
 	- http://focus.ti.com/lit/ds/symlink/ucd9090.pdf
 	- http://focus.ti.com/lit/ds/symlink/ucd90910.pdf
 
@@ -45,6 +47,12 @@ power-on reset signals, external interrupts, cascading, or other system
 functions. Twelve of these pins offer PWM functionality. Using these pins, the
 UCD90160 offers support for margining, and general-purpose PWM functions.
 
+The UCD90320 is a 32-rail PMBus/I2C addressable power-supply sequencer and
+monitor. The 24 integrated ADC channels (AMONx) monitor the power supply
+voltage, current, and temperature. Of the 84 GPIO pins, 8 can be used as
+digital monitors (DMONx), 32 to enable the power supply (ENx), 24 for margining
+(MARx), 16 for logical GPO, and 32 GPIs for cascading, and system function.
+
 The UCD9090 is a 10-rail PMBus/I2C addressable power-supply sequencer and
 monitor. The device integrates a 12-bit ADC for monitoring up to 10 power-supply
 voltage inputs. Twenty-three GPIO pins can be used for power supply enables,
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index d62d69bb7e49..61062632b22b 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -200,11 +200,11 @@ config SENSORS_TPS53679
 	  be called tps53679.
 
 config SENSORS_UCD9000
-	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
+	tristate "TI UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, UCD90910"
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  UCD90120, UCD90124, UCD90160, UCD9090, UCD90910, Sequencer and System
-	  Health Controllers.
+	  UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, UCD90910, Sequencer
+	  and System Health Controllers.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9000.
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index a9229c6b0e84..23ea3415f166 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -18,7 +18,8 @@
 #include <linux/gpio/driver.h>
 #include "pmbus.h"
 
-enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
+enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
+	     ucd90910 };
 
 #define UCD9000_MONITOR_CONFIG		0xd5
 #define UCD9000_NUM_PAGES		0xd6
@@ -38,7 +39,7 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
 #define UCD9000_GPIO_OUTPUT		1
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
-#define UCD9000_MON_PAGE(x)	((x) & 0x0f)
+#define UCD9000_MON_PAGE(x)	((x) & 0x1f)
 
 #define UCD9000_MON_VOLTAGE	1
 #define UCD9000_MON_TEMPERATURE	2
@@ -50,10 +51,12 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
 #define UCD9000_GPIO_NAME_LEN	16
 #define UCD9090_NUM_GPIOS	23
 #define UCD901XX_NUM_GPIOS	26
+#define UCD90320_NUM_GPIOS	84
 #define UCD90910_NUM_GPIOS	26
 
 #define UCD9000_DEBUGFS_NAME_LEN	24
 #define UCD9000_GPI_COUNT		8
+#define UCD90320_GPI_COUNT		32
 
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
@@ -131,6 +134,7 @@ static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd90120", ucd90120},
 	{"ucd90124", ucd90124},
 	{"ucd90160", ucd90160},
+	{"ucd90320", ucd90320},
 	{"ucd9090", ucd9090},
 	{"ucd90910", ucd90910},
 	{}
@@ -154,6 +158,10 @@ static const struct of_device_id __maybe_unused ucd9000_of_match[] = {
 		.compatible = "ti,ucd90160",
 		.data = (void *)ucd90160
 	},
+	{
+		.compatible = "ti,ucd90320",
+		.data = (void *)ucd90320
+	},
 	{
 		.compatible = "ti,ucd9090",
 		.data = (void *)ucd9090
@@ -322,6 +330,9 @@ static void ucd9000_probe_gpio(struct i2c_client *client,
 	case ucd90160:
 		data->gpio.ngpio = UCD901XX_NUM_GPIOS;
 		break;
+	case ucd90320:
+		data->gpio.ngpio = UCD90320_NUM_GPIOS;
+		break;
 	case ucd90910:
 		data->gpio.ngpio = UCD90910_NUM_GPIOS;
 		break;
@@ -372,17 +383,18 @@ static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
 	struct ucd9000_debugfs_entry *entry = data;
 	struct i2c_client *client = entry->client;
 	u8 buffer[I2C_SMBUS_BLOCK_MAX];
-	int ret;
+	int ret, i;
 
 	ret = ucd9000_get_mfr_status(client, buffer);
 	if (ret < 0)
 		return ret;
 
 	/*
-	 * Attribute only created for devices with gpi fault bits at bits
-	 * 16-23, which is the second byte of the response.
+	 * GPI fault bits are in sets of 8, two bytes from end of response.
 	 */
-	*val = !!(buffer[1] & BIT(entry->index));
+	i = ret - 3 - entry->index / 8;
+	if (i >= 0)
+		*val = !!(buffer[i] & BIT(entry->index % 8));
 
 	return 0;
 }
@@ -422,7 +434,7 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 {
 	struct dentry *debugfs;
 	struct ucd9000_debugfs_entry *entries;
-	int i;
+	int i, gpi_count;
 	char name[UCD9000_DEBUGFS_NAME_LEN];
 
 	debugfs = pmbus_get_debugfs_dir(client);
@@ -435,18 +447,21 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 
 	/*
 	 * Of the chips this driver supports, only the UCD9090, UCD90160,
-	 * and UCD90910 report GPI faults in their MFR_STATUS register, so only
-	 * create the GPI fault debugfs attributes for those chips.
+	 * UCD90320, and UCD90910 report GPI faults in their MFR_STATUS
+	 * register, so only create the GPI fault debugfs attributes for those
+	 * chips.
 	 */
 	if (mid->driver_data == ucd9090 || mid->driver_data == ucd90160 ||
-	    mid->driver_data == ucd90910) {
+	    mid->driver_data == ucd90320 || mid->driver_data == ucd90910) {
+		gpi_count = mid->driver_data == ucd90320 ? UCD90320_GPI_COUNT
+							 : UCD9000_GPI_COUNT;
 		entries = devm_kcalloc(&client->dev,
-				       UCD9000_GPI_COUNT, sizeof(*entries),
+				       gpi_count, sizeof(*entries),
 				       GFP_KERNEL);
 		if (!entries)
 			return -ENOMEM;
 
-		for (i = 0; i < UCD9000_GPI_COUNT; i++) {
+		for (i = 0; i < gpi_count; i++) {
 			entries[i].client = client;
 			entries[i].index = i;
 			scnprintf(name, UCD9000_DEBUGFS_NAME_LEN,
-- 
2.17.1

