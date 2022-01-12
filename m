Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A848BE7D
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 07:07:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYcXs3xGHz30DM
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 17:07:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=ZhDOnDIU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.90;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ZhDOnDIU; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300090.outbound.protection.outlook.com [40.107.130.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYcWy4n84z2xsc
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 17:06:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbsZoWnAaS6DVsXPvUNM98qVT+aO303C8YhPQuZTbiAXIRv9RvCXyOvFafcg7dxQoyVsza+jrAbtJTi9WwqIojf9yuz0bYXCJWBKhpCbBOGdGmpUigrv3WGnk3kbMm211m075cFtkceQHv1uQQnH8L6/JRO4Y2MWKTUl0v3BDumLKNqdBR46uNJWHQ+oxOqnOtCMYc9lQClRE1yFvF4iN2xm8Rry8WIs9N+VSCIlxQgpOrW380wT82ufJeNacs+oJ6bB8kcW2J4BtoT/348a/ZHkrSyzVojbVkE5Y0SfCNdBv3K6MiRWgcQPv7A8efTp+MZI5kZ/W36YvXztCdgdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtpGeAFkhga1Ntx+A3R3E/xz26neso5n71fjWD8x9Pw=;
 b=hKkScKR8LEwAL0G+31ZHS+nzZIWlwTZMBpMW3OTMpThaj95Ph3fiRM9FBnNXISU5bZ3Q8ny8CF2z0yko1q+O5HxV0tSq5RP06MS+9qCldli0wnUwo7S5/lOm/AO9OMtpA8rwQNXGeB0rvMmiv6H+dMPWrlFE8JWEs0vu0lbUBb2YiwUhLr+KY9D1OM5pD2xrE/JX36BSgWbePNKgXRG4Yv7p9gwxKbyBaArif7/KvuwO9xzR36Wtw0HnxlWo5B46t1ovWm5+LX/Vh5cNewTy+Ayt9DqfUaui50H4b8JlPJcy2AiQVUtEHZtGTVbRBoG8x1miJcynTORuHk8Bl9g21g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtpGeAFkhga1Ntx+A3R3E/xz26neso5n71fjWD8x9Pw=;
 b=ZhDOnDIUQXilaLb6m3m3365KRbnm0LFrGG6jsd8tKpCUhpP6th6h8yimwrfgxDb1nZhiiw67c9Cqw0s2i1UiVfY/rvUbSIArCLd4lpxqxB36XCQ74EFjMgrIR8m5NxDqRmREUdrBJfzZGZYo/X3n2JnotLfGnzDJfxITPbtl6UI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 06:06:17 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4867.011; Wed, 12 Jan 2022
 06:06:17 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/1] Add support for mp5023 device from
 Monolithic Power Systems, Inc. (MPS) vendor. This is a Hot-Swap Controller.
Date: Wed, 12 Jan 2022 14:05:59 +0800
Message-Id: <20220112060559.28883-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a4c2f5f-3ec2-49f7-0771-08d9d591a567
X-MS-TrafficTypeDiagnostic: HK0PR04MB3282:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB32828A5A7BAD2423E4CE65738E529@HK0PR04MB3282.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RcomFHEA9izwmLIPTXJNr8SWNyrrBjijbL2VTNcLWk/dGXYM6nKpdHf7XDSTKbLQ2OTz+P8XuUzZjyiL1Qphp+uVhhHsmbS32Bu3vrzisvrJ2uOOQr9GFyfQzf/BqHRw1LRpJdwgOyNvfrr3UV+B8AFm7oxGc+6d2/7AO0l7YAxn7a+J7KQx7wfQbg31Tqzt7i1UkuKydd7f++LIS5jNmiL+vBDBCLeENTyw3BX8QES7/L/juti6zklE4xd8YhOqnOY2L0AGmYLclDG+fIGU0xbP229kHZb2q4iLsAo+vpLQrD+/D6SVEigXGAVyNBp7qnoCnPeXF9eaDnQlrUoOh32wUbK2cikeeu/KVrIMtG79PqY6s2OsZVOSBl/cPdth0xgSa2Jg3A5SE0hHaKcUrZqsEFseTwo7mPFCQnxKc9uLKyPBF4dwtX/RmLxAsFF2kaGTsDQ+eIsqD6XFyFPtrp6eCL0pbXyCg5XNBA155UtiC6WzFUlFIZbubZ7/4GsZH0qF92zzFxO5Q8V0TDi1ZaslxyizuRnW5/1JemGCK/O3Dv0Dx/rSzTL2T4eQm5xfcN9/jzpj5rPdFVclsXzqfNcvOH38xIum346BNY659QcvjY8kt27qxSdYfJq33IvAeIQ9lycm+T4Cs49tvYu3x2WRNZjAyo8H9E44khyH/wHs9Z+quQaRCD5g8CmF5kMgXqo/gHcvowh+CyaYgxFu0a8GwbeeqI4Q7LdgXLrBfkpLx6f3Ur1K+SttgnxpJhqO5m6ES+m8INtC8VRYkhdMbLtCpNlPr+LTCK3FodSz3TY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6512007)(8676002)(966005)(8936002)(6486002)(44832011)(52116002)(508600001)(26005)(2906002)(2616005)(5660300002)(83380400001)(1076003)(38350700002)(316002)(86362001)(4326008)(6506007)(36756003)(38100700002)(6666004)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EtvfPK2+I2d5kspKYGZmVYTr41/IlYP9dYGcfwYa78W81slwgC1ZwUnRqJSu?=
 =?us-ascii?Q?hRI8zijKb1/WHpBKCzNscqHasKG0EvHCkb2ZL4lZf8xTPEpRlL9MGu9tjHJP?=
 =?us-ascii?Q?V360C1M8BbYdGP3DEKK8G7Kkp1eG+KkQfVtj9k3Q+03dtJEEoXsmjXfpGQHy?=
 =?us-ascii?Q?dJhIf/l8ZPagdpUAx4au/kIped+KKNHB+aEY/EL1WXJ66uKrvVklnIs/xrUp?=
 =?us-ascii?Q?i70Qcdolu1drWS/Xtoj3EaVQlAxHovEjtcfiG8zGvu6S/zSwQD9ZrEpUsKNW?=
 =?us-ascii?Q?4YYNJErYUiKa0Gjcf1mnKa/3xv09mmxiqYgqnNdo3LSLn96uvx1iYIErsTBb?=
 =?us-ascii?Q?y3xuBE1x2WGZqVQsdQWysIgn06xpUTDa1yO9PlLjyG0X2wSuwfuXrnf+v4s0?=
 =?us-ascii?Q?4HwL8V4U/dLVxNkIzXlvxvS7cjWVxyWki4wMo4WYOo1+gZODKq95W7iMor2J?=
 =?us-ascii?Q?obL+AwbrXzbnKqX5HQfbfzrovmhBfguAOgfXaAIl5NDCzSXktcpmKYcmUKI9?=
 =?us-ascii?Q?0a8c1TnLdE68a4+CMUmeGl4+cmVVopwZ4iblKPzv++w9BNoUDPUs2Uz+Ocpv?=
 =?us-ascii?Q?vlh0z2XH3VGAGZqpduOW+ZBa/MZKLY+jI12lKjFKTHh9ekrG+Obs88QunsMz?=
 =?us-ascii?Q?hrqZdSiCiKKjPqGfm/UWI/LnRdjkw955L3rs8n19H2s8UBRcrgdo6myypbRk?=
 =?us-ascii?Q?QtXDjDYLushGOw89wweOQMtjq1Ljh/WBed7xBBRqQZeyWoMXK9MGXX76Beng?=
 =?us-ascii?Q?1TPN8cIlsGJSELRG+HFqTsgq8NbYPMap/cBQq983CbaRQ61I5iuICMpgdsjk?=
 =?us-ascii?Q?lrxF0QmT4vVyelIBaM+oGtxDkfYT01fkTTzmLFoyo93Ee+S893Jt0gt+0/SX?=
 =?us-ascii?Q?rCcYQJyel+I2XQ+IqRgrK52f2YgoYsnllJOhP50tIcInDmi52Wy6gWvi6LSs?=
 =?us-ascii?Q?Fq3NvkkI8pgzsEYnAXmBjcjS6/+r3mRTR34DDnxVqHbGED+Rke8pWOXTKK0D?=
 =?us-ascii?Q?xNa7mSdzrSZxKJQihLDFJa6M1OLeJcXY1SdWlRow6lQnRM+eneeYI5voLKCt?=
 =?us-ascii?Q?vzTJRBrL0zzmr0rTiZrsu9INqFbvzMoOCKBA0KDLElFrWZ4QmO+b9upnxd/D?=
 =?us-ascii?Q?uf8jK8VCOt6ptNg1KPVcuAw3Gext3ZSgwQjm5uku6hcHtyUReNjdh5kYZerF?=
 =?us-ascii?Q?nOOBWV4miA1DIWFcy1Bhbw/5Ymf9gBks5bkduTaaZa4ikfC8UhcKbyXRERg0?=
 =?us-ascii?Q?0Zy7zGVK+M7SxIBc4+DkrFKRpDpXVcpLfniqiEr9mod0MnuxYzYL/i+1aK7N?=
 =?us-ascii?Q?7BXgjVKxVcHLp1GvFnunSxX8cCexaY5TmjjF2CYktOzyqPpIqWiqfbdnGE0Y?=
 =?us-ascii?Q?dg7xP6wmz0KpuGeQ93hTntMwr/kFFMxsNYjnM11YtbJQZ4CiGx1uBMAGsSOX?=
 =?us-ascii?Q?Qi+ZBkECUpDOFMkq0Sovz2xNb5GAkDTZAlrRK6/cKn2Wam8AEVRbpXkVUjDA?=
 =?us-ascii?Q?/A5SNMRFzdOezGvaoi3Us7ADNyNld7p+uoFmhn4k76wivletpNUZObCDEDYJ?=
 =?us-ascii?Q?ZukEYaSJPwJobTQrvaYFVK6MESP0oJ5WlCJFKG/oZgDozURgna3Ilh3dwDcM?=
 =?us-ascii?Q?/7PNOiNQVEps6GFd7J61OVI=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4c2f5f-3ec2-49f7-0771-08d9d591a567
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:06:17.4258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVzcxBOx2MYLDem6otizJcAnlsc6+wKvTUHdiS+jo2vV9ct8lPaiUudNrX/LXpaXBV0Y5dNWcPRKm57jSF90iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3282
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
Cc: potin.lai@quantatw.com, Howard Chiu <howard.chiu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Howard Chiu <howard.chiu@quantatw.com>

Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
---
 Documentation/hwmon/mp5023.rst | 84 ++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/mp5023.c   | 66 ++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 Documentation/hwmon/mp5023.rst
 create mode 100644 drivers/hwmon/pmbus/mp5023.c

diff --git a/Documentation/hwmon/mp5023.rst b/Documentation/hwmon/mp5023.rst
new file mode 100644
index 000000000000..af5ab1345a91
--- /dev/null
+++ b/Documentation/hwmon/mp5023.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5023
+====================
+
+Supported chips:
+
+  * MPS MP5023
+
+    Prefix: 'mp5023'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5023.html
+
+Author:
+
+	Howard Chiu <howard.chiu@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5023 Hot-Swap Controller.
+
+Device complaint with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading input voltage, output voltage,
+output current, input power and temperature.
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
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
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
index ffb609cee3a4..b56bd8542864 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -276,6 +276,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP5023
+	tristate "MPS MP5023"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP5023.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5023.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..61cdc24b1309 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
new file mode 100644
index 000000000000..14d3934aa099
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP5023 Hot-Swap Controller
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5023_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 2,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mp5023_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mp5023_info);
+}
+
+static const struct of_device_id __maybe_unused mp5023_of_match[] = {
+	{ .compatible = "mps,mp5023", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mp5023_of_match);
+
+static struct i2c_driver mp5023_driver = {
+	.driver = {
+		   .name = "mp5023",
+		   .of_match_table = of_match_ptr(mp5023_of_match),
+	},
+	.probe_new = mp5023_probe,
+};
+
+module_i2c_driver(mp5023_driver);
+
+MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
+MODULE_LICENSE("GPL");
-- 
2.17.1

