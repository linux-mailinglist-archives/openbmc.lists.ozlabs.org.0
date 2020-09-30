Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CE27F519
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 00:28:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1rW16QSXzDqSy
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 08:28:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.223.52;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=lGnfD8kL; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1rTt697RzDqSc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 08:27:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOsoe7TGDHJD6iKT3nZue5EgjRIE4S/cHJJWtUdop245MSIM9aZwJK+Gdwvahfjz1m0g+0IuQA8NofLPBUrAGD7XMmXMNr3Q0v0wmsp7JcOrHczstmoQz4TDySJnwSDyUSodsHiRzEJTyHzyzruW/CjdXcohEFUhZSxdkJN8H1hZPyrxoCc4g0FiG06hw0ff9IoishD5E5Pzy/Sch5jd3npIt1tlsw6TS65oMeAUlUtk8YCzuixqj6c/ugn0As63X/zEeFAb4HGTLkL1zXwQHfImX64852Au30a62fZWItAH/S7zz9nsk7UOJUNzjoHHff17rYMe3/WVAOLlQmi1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn3XUpf3VwxmKLTnrN0RQG0FqGmWcDTroewNSQ2VJHo=;
 b=T1G99tYNFZU4sCkEr0ei9zIgt7tzycWwVfn7bGWi8JLq9CEci11yhAQ/N3AFscu1kuC/Tn+JORrCat7emK5VFd3t+g181SeDQnkqNnrNndvfRdD1OK1R3+JxkL2eInJoJ5I991mZH4wQWLaN5NVxZezXR5upw9fQ8+6aDrc4+xZ0x6ON6PoNhMlVYtGhJPYduLJOEx9rAiECVjhy4U/8vQpwzoBdfUn+iJP0CJ8VPC99QPPAHhQZ7CEa0QMgHarAQ4HQwpBIvdEi6bf4a3cAmDF+76DBq7c32RE/eRUj71RKEuGE1wzawWL7PxZSAGySHozihDLmCHEOF7Z9cn38Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn3XUpf3VwxmKLTnrN0RQG0FqGmWcDTroewNSQ2VJHo=;
 b=lGnfD8kLqsW9jUaBX83gTe4HpGOsbWEPwP4hGjQjW1MVbwKm8/euc6T4dJ5A4dlPPiPK0L1GlBpZFQJjxUgiWCeFYYlnw+OW1WthxI5BdIhn8fIyaJM57Y8Ewwps1PmdnuLGY010O4MnTlyeU/714amryGEc/d2RwoqjyCCt7hnkTK8IFTKsUVZwZLsxyrA+Xp2KBYBCA71dwQK1IWU6WN9l4pFarY7s4qiIWtD2d51tuDYlZ0nB/+UJK+95nkSjLfrgl0X16Bncs6SN5DV90sXXK/gElJUD9d12eUkFw6B9mAzozAWJA2pAged4Zk7kF1y+SOf6JlVXxSV+A8TIOw==
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fii-usa.com;
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DM6PR08MB5257.namprd08.prod.outlook.com (2603:10b6:5:50::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.26; Wed, 30 Sep 2020 22:27:00 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::1033:6c33:3328:bd4a]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::1033:6c33:3328:bd4a%3]) with mapi id 15.20.3412.028; Wed, 30 Sep 2020
 22:27:00 +0000
From: Lancelot <lancelot.kao@fii-usa.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] hwmon: Ampere Computing ALTRA SMPMPRO sensor
 driver
Date: Wed, 30 Sep 2020 17:26:57 -0500
Message-Id: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [71.66.12.58]
X-ClientProxiedBy: CH2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:610:59::23) To DM6PR08MB4890.namprd08.prod.outlook.com
 (2603:10b6:5:43::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from obmc.google.com (71.66.12.58) by
 CH2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:610:59::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 22:27:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0155513e-2966-4ada-a9e6-08d8658ff30f
X-MS-TrafficTypeDiagnostic: DM6PR08MB5257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR08MB52571DD1AD2327DA2E601641C0330@DM6PR08MB5257.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2CevoBsWARDUaPNz5HxuyDE5hnLQErNr0Q35/FurLsurLjJO/J1t3QkzEjQ9ZZgQYRKut35v+cQsosiUg44ZBkmMAzXrVnIeup5M5B9UHgufazPfmvim//DwubtReiWR17gPq8DJkhVlO0CyY9sxLf9AWWL7g26g9ubftoqrdHaZSKWFtfFZ3WM54VaMg2Yl9IkCW5ZCTr1nYfuNb3teUJwYyFUqGPVtUdQimqlpKi4T6uUk/P5ITM0TyEtWcvojLH99OvsRiN/o12IRddIW/xs/wq2zrXxyXMmJmFfX943iEbfMbUkoxEmylW/BhX3+D5z+Ixq3v0ekokdDrM9p1W6D+qsHNnnbNfzdiMcc8U68eOapXZE7Evzq9Yx+DrqV7DgNwLP52KshZ8Ko+trGw5DSByqBhntkhOSsH1IMyuOw6G8dgjmrlQDo7L/A0CaXI+b5aibFcTbGHlTc0j6DjPbCDtyeEgkNhaiFB8TKL9AN8fFyOdQCC3y2EZ9mZbL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(30864003)(316002)(5660300002)(107886003)(66946007)(8676002)(66556008)(66476007)(8936002)(83380400001)(4326008)(36756003)(2906002)(6486002)(956004)(6512007)(86362001)(52116002)(186003)(6506007)(26005)(6666004)(16526019)(54906003)(2616005)(478600001)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +VeXLalxU64MiFV6pQ6Q9ihu2EdqhICTVnLalwMx/rnX7Egl79V2XVnxdXLUaSwHH5YYrfzQGhYlsoN/tT4GmO3QCkGDdI1c28M99jw1aMSCsFWmvF9sU+zzV790aHNO2pY22hLM0nw3yUBaO6IaBTV2pbPlFK7URvvrjhzI5brExKWQIhkRMozYUvQXiWuIs81OvKH2UPTJDjtp4lryMuUtCYhatHSF57cdvAzJ9VNFKXtKEHBjlb+WiRZJUYvkHbIiUm7LdRDJdaLxnJznbaiXCQJxWoKl3bURBjbUVYMXwSFW+9y7jtovIdsmFCpp4jQOF3aZ3z/LpaDYqZ/2yWHg7WdvHjJGMNwMIRmeRcn3wGOYN4Al79ZecPAi3Xd85XYB0HSoMJOE5XiygQkHeG/12bfHCF6LG5UbqIWJQEJ7X8QsRMu1IWsgeX0WtFGdAZJ5SewLhfkqSbM/fQuLLUWDlWXKj7VGhmrk7lgtgOeK8gogoNovhq8uh5k1gfUPxniQ/DGCQLErMDWir4ij0LGy4GjDlHpzocoRzU1KRBkw8w59wcRp4rhrcvh7EGhfP1mrSl80t3m4jmSIy9ooXpEchkJ4Zp1lQfeag4IfUbEb3pAin3KaX0dMbL/fquvQGLL1oHsfWKJSL//Crl6d4A==
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0155513e-2966-4ada-a9e6-08d8658ff30f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 22:27:00.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzC4V6Mz/ixPtszAsZ3MSUYqDVi8ZE3tp/dXSlPoU1pVHLtY9VWJyMdcGUun3BlfwHWRKhkgE1gpPV7S0NpxINKTyohRG9shCsopMEq/AXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5257
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
Cc: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lancelot Kao <lancelot.kao@fii-usa.com>

Add SMPMPro-hwmon driver to monitor Ampere CPU/Memory/VR via an
i2c interface of the CPU's smpmpro management device.

Signed-off-by: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
---
 MAINTAINERS                   |   8 +
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/smpmpro-hwmon.c | 903 ++++++++++++++++++++++++++++++++++
 4 files changed, 922 insertions(+)
 create mode 100644 drivers/hwmon/smpmpro-hwmon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5fecb388d073..c169fd9a4d7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15759,6 +15759,14 @@ S:	Maintained
 F:	Documentation/hwmon/smm665.rst
 F:	drivers/hwmon/smm665.c
 
+SMPMPRO HARDWARE MONITOR DRIVER
+M:	Lancelot Kao <lancelot.kao@fii-usa.com>
+M:	Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
+M:	Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/smpmpro-hwmon.c
+
 SMSC EMC2103 HARDWARE MONITOR DRIVER
 M:	Steve Glendinning <steve.glendinning@shawell.net>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9aa89d7d4193..50881ebcb022 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1777,6 +1777,16 @@ config SENSORS_INA3221
 	  This driver can also be built as a module. If so, the module
 	  will be called ina3221.
 
+config SENSORS_SMPMPRO
+	tristate "Ampere Computing Altra SMPMPRO sensor chip"
+	depends on I2C
+	help
+	  If you say yes here you get support for Ampere Computing Altra SMPMPRO
+	  sensor chip. This will enable monitoring of Ampere CPU Sensors; via hwmon.
+
+	  This driver can also be built as a module. If so, the module 
+	  will be called smpmpro-hwmon.
+
 config SENSORS_TC74
 	tristate "Microchip TC74"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index ae41ee71a71b..49a1a8e0c73f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPMPRO)	+= smpmpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpmpro-hwmon.c b/drivers/hwmon/smpmpro-hwmon.c
new file mode 100644
index 000000000000..37b48c42a372
--- /dev/null
+++ b/drivers/hwmon/smpmpro-hwmon.c
@@ -0,0 +1,903 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC Hardware Monitoring Driver
+ *
+ * Copyright (c) 2019-2020, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+/* Identification Registers */
+#define REG_SPEC_VERSION_REG	0x00
+#define SCP_VERSION_REG	        0x01
+#define MANUFACTURER_ID_REG	    0x02
+#define DEVICE_ID_REG	        0x03
+#define SCP_BUILD_ID_LO_REG	    0x09
+#define SCP_BUILD_ID_HI_REG	    0x0A
+
+/* Capability Registers  */
+#define TEMP_SENSOR_SUPPORT_REG	0x05
+#define PWR_SENSOR_SUPPORT_REG	0x06
+#define VOLT_SENSOR_SUPPORT_REG	0x07
+#define OTHER_CAP_REG		    0x08
+#define CORE_CLUSTER_CNT_REG	0x0B
+#define SYS_CACHE_PCIE_CNT_REG	0x0C
+#define SOCKET_INFO_REG	        0x0D
+
+/* Logical Power Sensor Registers */
+#define SOC_TEMP_REG		0x10
+#define SOC_VRD_TEMP_REG	0x11
+#define DIMM_VRD_TEMP_REG	0x12
+#define CORE_VRD_TEMP_REG	0x13
+#define CH0_DIMM_TEMP_REG	0x14
+#define CH1_DIMM_TEMP_REG	0x15
+#define CH2_DIMM_TEMP_REG	0x16
+#define CH3_DIMM_TEMP_REG	0x17
+#define CH4_DIMM_TEMP_REG	0x18
+#define CH5_DIMM_TEMP_REG	0x19
+#define CH6_DIMM_TEMP_REG	0x1A
+#define CH7_DIMM_TEMP_REG	0x1B
+#define CORE_VRD_PWR_REG		0x20
+#define SOC_VRD_PWR_REG		0x21
+#define DIMM_VRD1_PWR_REG	0x22
+#define DIMM_VRD2_PWR_REG	0x23
+#define CORE_VRD_PWR_MW_REG	0x26
+#define SOC_VRD_PWR_MW_REG	0x27
+#define DIMM_VRD1_PWR_MW_REG	0x28
+#define DIMM_VRD2_PWR_MW_REG	0x29
+#define MEM_HOT_THRESHOLD_REG	0x32
+#define SOC_VR_HOT_THRESHOLD_REG	0x33
+#define CORE_VRD_VOLT_REG	0x34
+#define SOC_VRD_VOLT_REG	0x35
+#define DIMM_VRD1_VOLT_REG	0x36
+#define DIMM_VRD2_VOLT_REG	0x37
+#define DIMM_CE_THRESHOLD_REG	0x38
+
+/* GPI Control set  Registers */
+#define GPI_CTRL0_REG		0x50
+#define GPI_CTRL1_REG		0x51
+#define GPI_CTRL2_REG		0x52
+#define GPI_CTRL3_REG		0x53
+#define GPI_CE_UE_MASK_REG		0x54
+
+/* GPI data set Registers */
+#define GPI_DATA_SET_REG	0x60
+#define GPI_DATA_SET0_REG	0x61
+#define GPI_DATA_SET1_REG	0x62
+#define GPI_DATA_SET2_REG	0x63
+#define GPI_DATA_SET3_REG	0x64
+
+/* GPI Status Registers */
+#define GPI_CLUSTER_ERR_SET0_REG	0x70
+#define GPI_CLUSTER_ERR_SEL_REG	 0x71
+#define GPI_MCU_ERR_REG		0x72
+#define GPI_PCIE_ERR_REG	0x73
+#define GPI_SYS_CACHE_ERR_SEL_REG	0x74
+#define GPI_SYS_CACHE_ERR_REG	0x75
+#define GPI_PCIE_ERR_SEL_REG	0x76
+#define GPI_VRD_FAULT_ERR_REG	0x78
+#define GPI_VRD_HOT_ERR_REG	0x79
+#define GPI_DIMM_HOT_ERR_REG	0x7A
+#define GPI_BOOT_ERR1_REG	0x7B
+#define GPI_BOOT_ERR2_REG	0x7C
+
+/* GPI RAS Error Registers */
+#define GPI_WDT_STS_REG		0x7D
+#define GPI_RAS_ERR_REG		0x7E
+
+/* Core and L2C Error Registers */
+#define GPI_CORE_CLUSTER_SEL_REG	0x80
+#define GPI_CORE_L1_ERR_REG	0x81
+#define GPI_CORE_L2_ERR_REG	0x82
+#define GPI_SYS_CACHE_INST_SEL_REG	0x86
+#define GPI_SYS_CACHE_ERR_REG	0x87
+
+/* Memory Error Registers */
+#define GPI_MCU_DIMM_SELECT_REG	0x90
+#define GPI_MCU_DIMM_ERR_REG	0x91
+
+/* RAS Error/Warning Registers */
+#define GPI_RAS_ERR_SMPRO_TYPE_REG	0xA0
+#define GPI_RAS_ERR_PMPRO_TYPE_REG	0xA1
+#define GPI_RAS_ERR_SMPRO_INFO_LO_REG	0xA2
+#define GPI_RAS_ERR_SMPRO_INFO_HI_REG	0xA3
+#define GPI_RAS_ERR_SMPRO_DATA_LO_REG	0xA4
+#define GPI_RAS_ERR_SMPRO_DATA_HI_REG	0xA5
+#define GPI_RAS_WARN_SMPRO_INFO_LO_REG	0xAA
+#define GPI_RAS_WARN_SMPRO_INFO_HI_REG	0xAB
+#define GPI_RAS_ERR_PMPRO_INFO_LO_REG	0xA6
+#define GPI_RAS_ERR_PMPRO_INFO_HI_REG	0xA7
+#define GPI_RAS_ERR_PMPRO_DATA_LO_REG	0xA8
+#define GPI_RAS_ERR_PMPRO_DATA_HI_REG	0xA9
+#define GPI_RAS_WARN_PMPRO_INFO_LO_REG	0xAC
+#define GPI_RAS_WARN_PMPRO_INFO_HI_REG	0xAD
+
+/* Boot Stage/Progress Registers */
+#define GPI_BOOT_STAGE_SELECT_REG	0xB0
+#define GPI_BOOT_STAGE_STATUS_LO_REG	0xB1
+#define GPI_BOOT_STAGE_CUR_STAGE_REG	0xB2
+
+/* PCIE Error Registers */
+#define GPI_PCIE_ERR_SEL_REG		0xC0
+#define GPI_PCIE_ERR_TYPE_REG		0xC1
+#define GPI_PCIE_ERR_DEVICE_REG	0xC2
+
+/* Other Error Registers */
+#define OTHER_CE_ERR_CNT_REG	0xD0
+#define OTHER_CE_ERR_LEN_REG	0xD1
+#define OTHER_CE_ERR_DATA_REG	0xD2
+#define OTHER_UE_ERR_CNT_REG	0xD0
+#define OTHER_UE_ERR_LEN_REG	0xD1
+#define OTHER_UE_ERR_DATA_REG	0xD2
+
+/* ACPI State Registers */
+#define ACPI_SYSTEM_STATE_REG		0xE0
+#define ACPI_CPPC_CLUSTER_SEL_REG	0xE3
+#define ACPI_CPPC_CLUSTER_DATA_REG		0xE4
+#define ACPI_POWER_LIMIT_REG		0xE5
+
+
+struct smpmpro_data {
+	struct i2c_client *client;
+
+	u16 temp_support_regs;
+	u16 pwr_support_regs;
+	u16 volt_support_regs;
+	u16 other_caps;
+	u16 core_cluster_cnt_reg;
+	u16 sys_cache_pcie_cnt_reg;
+	u16 socket_info_reg;
+};
+
+static const u8 temp_regs[] = {
+	SOC_TEMP_REG,
+	SOC_VRD_TEMP_REG,
+	DIMM_VRD_TEMP_REG,
+	CORE_VRD_TEMP_REG,
+	CH0_DIMM_TEMP_REG,
+	CH1_DIMM_TEMP_REG,
+	CH2_DIMM_TEMP_REG,
+	CH3_DIMM_TEMP_REG,
+	CH4_DIMM_TEMP_REG,
+	CH5_DIMM_TEMP_REG,
+	CH6_DIMM_TEMP_REG,
+	CH7_DIMM_TEMP_REG,
+	MEM_HOT_THRESHOLD_REG,
+	SOC_VR_HOT_THRESHOLD_REG
+};
+
+static const u8 volt_regs[] = {
+	CORE_VRD_VOLT_REG,
+	SOC_VRD_VOLT_REG,
+	DIMM_VRD1_VOLT_REG,
+	DIMM_VRD2_VOLT_REG
+};
+
+enum pwr_regs {
+	PMD_VRD_PWR,
+	SOC_VRD_PWR,
+	DIMM_VRD1_PWR,
+	DIMM_VRD2_PWR,
+	CPU_VRD_PWR,
+	DIMM_VRD_PWR,
+};
+
+static const char * const label[] = {
+	"SoC",
+	"SoC VRD",
+	"DIMM VRD",
+	"DIMM VRD1",
+	"DIMM VRD2",
+	"PMD VRD",
+	"CH0 DIMM",
+	"CH1 DIMM",
+	"CH2 DIMM",
+	"CH3 DIMM",
+	"CH4 DIMM",
+	"CH5 DIMM",
+	"CH6 DIMM",
+	"CH7 DIMM",
+	"MEM HOT",
+	"SoC VR HOT",
+	"CPU VRD",
+};
+
+static const char * const gpi_label[] = {
+	"GPI CTRL 0",
+	"GPI CTRL 1",
+	"GPI CTRL 2",
+	"GPI CTRL 3",
+	"GPI CE UE MASK",
+	"GPI DATA SET",
+	"GPI DATA SET 0",
+	"GPI DATA SET 1",
+	"GPI DATA SET 2",
+	"GPI DATA SET 3",
+	"CLUSTER ERROR SET 0",
+	"CLUSTER ERROR SEL",
+	"MCU ERROR",
+	"PCIE ERROR",
+	"SYS CACHE ERR SEL",
+	"SYS CACHE ERR",
+	"PCIE ERR SEL",
+	"VRD FAULT ERR",
+	"VRD HOT ERROR",
+	"DIMM HOT ERROR",
+	"BOOT 1 ERROR",
+	"BOOT 2 ERROR",
+	"WATCHDOG STATUS",
+	"RAS INTERNAL ERROR",
+};
+
+static void smpmpro_init_device(struct i2c_client *client,
+				struct smpmpro_data *data)
+{
+	u16 ret;
+
+	ret = i2c_smbus_read_word_swapped(client, TEMP_SENSOR_SUPPORT_REG);
+	if (ret < 0)
+		return;
+	data->temp_support_regs = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, PWR_SENSOR_SUPPORT_REG);
+	if (ret < 0)
+		return;
+	data->pwr_support_regs = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, VOLT_SENSOR_SUPPORT_REG);
+	if (ret < 0)
+		return;
+	data->volt_support_regs = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, OTHER_CAP_REG);
+	if (ret < 0)
+		return;
+	data->other_caps = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, CORE_CLUSTER_CNT_REG);
+	if (ret < 0)
+		return;
+	data->core_cluster_cnt_reg = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, SYS_CACHE_PCIE_CNT_REG);
+	if (ret < 0)
+		return;
+	data->sys_cache_pcie_cnt_reg = ret;
+
+	ret = i2c_smbus_read_word_swapped(client, SOCKET_INFO_REG);
+	if (ret < 0)
+		return;
+	data->socket_info_reg = ret;
+}
+
+static int smpmpro_read_temp(struct device *dev, u32 attr, int channel,
+			     long *val)
+{
+	struct smpmpro_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = i2c_smbus_read_word_swapped(client, temp_regs[channel]);
+		if (ret < 0)
+			return ERR_PTR(ret);
+		*val = (ret & 0x1ff) * 1000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t smpmpro_temp_is_visible(const void *_data, u32 attr, int channel)
+{
+	return 0444;
+}
+
+static int smpmpro_read_in(struct device *dev, u32 attr, int channel,
+			     long *val)
+{
+	struct smpmpro_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = i2c_smbus_read_word_swapped(client, volt_regs[channel]);
+		if (ret < 0)
+			return ERR_PTR(ret);
+		*val = ret & 0x7fff;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t smpmpro_in_is_visible(const void *_data, u32 attr, int channel)
+{
+	return 0444;
+}
+
+static int smpmpro_read_power(struct device *dev, u32 attr, int channel,
+			     long *val)
+{
+	struct smpmpro_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret, ret_mw;
+	int ret2 = 0, ret2_mw = 0;
+
+	switch (attr) {
+	case hwmon_power_input:
+		switch (channel) {
+		case PMD_VRD_PWR:
+			ret = i2c_smbus_read_word_swapped(client, CORE_VRD_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, CORE_VRD_PWR_MW_REG);
+			break;
+		case SOC_VRD_PWR:
+			ret = i2c_smbus_read_word_swapped(client, SOC_VRD_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, SOC_VRD_PWR_MW_REG);
+			break;
+		case DIMM_VRD1_PWR:
+			ret = i2c_smbus_read_word_swapped(client, DIMM_VRD1_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, DIMM_VRD1_PWR_MW_REG);
+			break;
+		case DIMM_VRD2_PWR:
+			ret = i2c_smbus_read_word_swapped(client, DIMM_VRD2_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, DIMM_VRD2_PWR_MW_REG);
+			break;
+		case CPU_VRD_PWR:
+			ret = i2c_smbus_read_word_swapped(client, CORE_VRD_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, CORE_VRD_PWR_MW_REG);
+			ret2 = i2c_smbus_read_word_swapped(client, SOC_VRD_PWR_REG);
+			ret2_mw = i2c_smbus_read_word_swapped(client, SOC_VRD_PWR_MW_REG);
+			break;
+		case DIMM_VRD_PWR:
+			ret = i2c_smbus_read_word_swapped(client, DIMM_VRD1_PWR_REG);
+			ret_mw = i2c_smbus_read_word_swapped(client, DIMM_VRD1_PWR_MW_REG);
+			ret2 = i2c_smbus_read_word_swapped(client, DIMM_VRD2_PWR_REG);
+			ret2_mw = i2c_smbus_read_word_swapped(client, DIMM_VRD2_PWR_MW_REG);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		if (ret < 0 || ret_mw < 0 || ret2 < 0 || ret2_mw < 0)
+			return ERR_PTR(ret < 0 ? ret : ret_mw < 0 ? ret_mw
+					: ret2 < 0 ? ret2 : ret2_mw);
+		*val = (ret + ret2)*1000000 + (ret_mw + ret2_mw)*1000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t smpmpro_power_is_visible(const void *_data, u32 attr, int channel)
+{
+	return 0444;
+}
+
+
+static int smpmpro_read_gpi(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct smpmpro_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	ret = i2c_smbus_read_word_swapped(client, attr->index);
+
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", ret);
+}
+
+static int smpmpro_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_temp:
+		return smpmpro_read_temp(dev, attr, channel, val);
+	case hwmon_in:
+		return smpmpro_read_in(dev, attr, channel, val);
+	case hwmon_power:
+		return smpmpro_read_power(dev, attr, channel, val);
+//	case hwmon_dimm_ce_thres:
+//		return smpmpro_read_dimm_ce_thres(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpmpro_write_gpi(struct device *dev,
+				   struct device_attribute *da,
+				   const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct smpmpro_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 16, &val);
+
+	ret = i2c_smbus_write_word_swapped(client, attr->index, val);
+	if (ret < 0)
+		return -EPROTO;
+
+	return count;
+}
+
+static int smpmpro_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long val)
+{
+	return -EOPNOTSUPP;
+}
+
+static umode_t smpmpro_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		return smpmpro_temp_is_visible(data, attr, channel);
+	case hwmon_in:
+		return smpmpro_in_is_visible(data, attr, channel);
+	case hwmon_power:
+		return smpmpro_power_is_visible(data, attr, channel);
+//	case hwmon_dimm_ce_thres:
+//		return smpmpro_dimm_ce_thres_is_visible(data, attr, channel);
+	default:
+		return 0;
+	}
+}
+
+static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
+				 char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+
+	return sprintf(buf, "%s\n", label[index]);
+}
+
+static ssize_t show_gpi_label(struct device *dev,
+		struct device_attribute *devattr, char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+
+	return sprintf(buf, "%s\n", gpi_label[index]);
+}
+
+static const u32 smpmpro_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpmpro_temp = {
+	.type = hwmon_temp,
+	.config = smpmpro_temp_config,
+};
+
+static const u32 smpmpro_in_config[] = {
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpmpro_in = {
+	.type = hwmon_in,
+	.config = smpmpro_in_config,
+};
+
+static const u32 smpmpro_power_config[] = {
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpmpro_power = {
+	.type = hwmon_power,
+	.config = smpmpro_power_config,
+};
+
+static const struct hwmon_channel_info *smpmpro_info[] = {
+	&smpmpro_temp,
+	&smpmpro_in,
+	&smpmpro_power,
+	NULL
+};
+
+static const struct hwmon_ops smpmpro_hwmon_ops = {
+	.is_visible = smpmpro_is_visible,
+	.read = smpmpro_read,
+	.write = smpmpro_write,
+};
+
+static const struct hwmon_chip_info smpmpro_chip_info = {
+	.ops = &smpmpro_hwmon_ops,
+	.info = smpmpro_info,
+};
+
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, show_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, show_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp5_label, 0444, show_label, NULL, 6);
+static SENSOR_DEVICE_ATTR(temp6_label, 0444, show_label, NULL, 7);
+static SENSOR_DEVICE_ATTR(temp7_label, 0444, show_label, NULL, 8);
+static SENSOR_DEVICE_ATTR(temp8_label, 0444, show_label, NULL, 9);
+static SENSOR_DEVICE_ATTR(temp9_label, 0444, show_label, NULL, 10);
+static SENSOR_DEVICE_ATTR(temp10_label, 0444, show_label, NULL, 11);
+static SENSOR_DEVICE_ATTR(temp11_label, 0444, show_label, NULL, 12);
+static SENSOR_DEVICE_ATTR(temp12_label, 0444, show_label, NULL, 13);
+static SENSOR_DEVICE_ATTR(temp13_label, 0444, show_label, NULL, 14);
+static SENSOR_DEVICE_ATTR(temp14_label, 0444, show_label, NULL, 15);
+
+static SENSOR_DEVICE_ATTR(in0_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(in1_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(in2_label, 0444, show_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(in3_label, 0444, show_label, NULL, 4);
+
+static SENSOR_DEVICE_ATTR(power1_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(power2_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(power3_label, 0444, show_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(power4_label, 0444, show_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(power5_label, 0444, show_label, NULL, 16);
+static SENSOR_DEVICE_ATTR(power6_label, 0444, show_label, NULL, 2);
+
+static SENSOR_DEVICE_ATTR(gpi0_label, 0444, show_gpi_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(gpi0_input, 0644, smpmpro_read_gpi, smpmpro_write_gpi, GPI_CTRL0_REG);
+static SENSOR_DEVICE_ATTR(gpi1_label, 0444, show_gpi_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(gpi1_input, 0644, smpmpro_read_gpi, smpmpro_write_gpi, GPI_CTRL1_REG);
+static SENSOR_DEVICE_ATTR(gpi2_label, 0444, show_gpi_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(gpi2_input, 0644, smpmpro_read_gpi, smpmpro_write_gpi, GPI_CTRL2_REG);
+static SENSOR_DEVICE_ATTR(gpi3_label, 0444, show_gpi_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(gpi3_input, 0644, smpmpro_read_gpi, smpmpro_write_gpi, GPI_CTRL3_REG);
+static SENSOR_DEVICE_ATTR(gpi4_label, 0444, show_gpi_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(gpi4_input, 0644, smpmpro_read_gpi,
+	       smpmpro_write_gpi, GPI_CE_UE_MASK_REG);
+static SENSOR_DEVICE_ATTR(gpi5_label, 0444, show_gpi_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(gpi5_input, 0444, smpmpro_read_gpi, NULL, GPI_DATA_SET_REG);
+static SENSOR_DEVICE_ATTR(gpi6_label, 0444, show_gpi_label, NULL, 6);
+static SENSOR_DEVICE_ATTR(gpi6_input, 0444, smpmpro_read_gpi, NULL, GPI_DATA_SET0_REG);
+static SENSOR_DEVICE_ATTR(gpi7_label, 0444, show_gpi_label, NULL, 7);
+static SENSOR_DEVICE_ATTR(gpi7_input, 0444, smpmpro_read_gpi, NULL, GPI_DATA_SET1_REG);
+static SENSOR_DEVICE_ATTR(gpi8_label, 0444, show_gpi_label, NULL, 8);
+static SENSOR_DEVICE_ATTR(gpi8_input, 0444, smpmpro_read_gpi, NULL, GPI_DATA_SET2_REG);
+static SENSOR_DEVICE_ATTR(gpi9_label, 0444, show_gpi_label, NULL, 9);
+static SENSOR_DEVICE_ATTR(gpi9_input, 0444, smpmpro_read_gpi, NULL, GPI_DATA_SET3_REG);
+static SENSOR_DEVICE_ATTR(gpi10_label, 0444, show_gpi_label, NULL, 10);
+static SENSOR_DEVICE_ATTR(gpi10_input, 0444, smpmpro_read_gpi, NULL, GPI_CLUSTER_ERR_SET0_REG);
+static SENSOR_DEVICE_ATTR(gpi11_label, 0444, show_gpi_label, NULL, 11);
+static SENSOR_DEVICE_ATTR(gpi11_input, 0444, smpmpro_read_gpi, NULL, GPI_CLUSTER_ERR_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi12_label, 0444, show_gpi_label, NULL, 12);
+static SENSOR_DEVICE_ATTR(gpi12_input, 0444, smpmpro_read_gpi, NULL, GPI_MCU_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi13_label, 0444, show_gpi_label, NULL, 13);
+static SENSOR_DEVICE_ATTR(gpi13_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_PCIE_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi14_label, 0444, show_gpi_label, NULL, 14);
+static SENSOR_DEVICE_ATTR(gpi14_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_SYS_CACHE_ERR_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi15_label, 0444, show_gpi_label, NULL, 15);
+static SENSOR_DEVICE_ATTR(gpi15_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_SYS_CACHE_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi16_label, 0444, show_gpi_label, NULL, 16);
+static SENSOR_DEVICE_ATTR(gpi16_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_PCIE_ERR_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi17_label, 0444, show_gpi_label, NULL, 17);
+static SENSOR_DEVICE_ATTR(gpi17_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_VRD_FAULT_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi18_label, 0444, show_gpi_label, NULL, 18);
+static SENSOR_DEVICE_ATTR(gpi18_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_VRD_HOT_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi19_label, 0444, show_gpi_label, NULL, 19);
+static SENSOR_DEVICE_ATTR(gpi19_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_DIMM_HOT_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi20_label, 0444, show_gpi_label, NULL, 20);
+static SENSOR_DEVICE_ATTR(gpi20_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_BOOT_ERR1_REG);
+static SENSOR_DEVICE_ATTR(gpi21_label, 0444, show_gpi_label, NULL, 21);
+static SENSOR_DEVICE_ATTR(gpi21_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_BOOT_ERR2_REG);
+static SENSOR_DEVICE_ATTR(gpi22_label, 0444, show_gpi_label, NULL, 22);
+static SENSOR_DEVICE_ATTR(gpi22_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_WDT_STS_REG);
+static SENSOR_DEVICE_ATTR(gpi23_label, 0444, show_gpi_label, NULL, 23);
+static SENSOR_DEVICE_ATTR(gpi23_input, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_REG);
+
+static SENSOR_DEVICE_ATTR(gpi_core_cluster_sel, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_CORE_CLUSTER_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi_core_l1_err, 0444,
+	smpmpro_read_gpi, NULL, GPI_CORE_L1_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi_core_l2_err, 0444,
+	smpmpro_read_gpi, NULL, GPI_CORE_L2_ERR_REG);
+static SENSOR_DEVICE_ATTR(gpi_sys_cache_inst_sel, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_SYS_CACHE_INST_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi_sys_cache_err, 0444,
+	smpmpro_read_gpi, NULL, GPI_SYS_CACHE_ERR_REG);
+
+static SENSOR_DEVICE_ATTR(gpi_mcu_dimm_select, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_MCU_DIMM_SELECT_REG);
+static SENSOR_DEVICE_ATTR(gpi_mcu_dimm_err, 0444,
+	smpmpro_read_gpi, NULL, GPI_MCU_DIMM_ERR_REG);
+
+static SENSOR_DEVICE_ATTR(gpi_ras_err_smpro_type, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_SMPRO_TYPE_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_pmpro_type, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_PMPRO_TYPE_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_smpro_info_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_SMPRO_INFO_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_smpro_info_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_SMPRO_INFO_HI_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_smpro_data_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_SMPRO_DATA_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_smpro_data_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_SMPRO_DATA_HI_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_warn_smpro_info_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_WARN_SMPRO_INFO_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_warn_smpro_info_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_WARN_SMPRO_INFO_HI_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_pmpro_info_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_PMPRO_INFO_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_pmpro_info_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_PMPRO_INFO_HI_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_pmpro_data_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_PMPRO_DATA_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_err_pmpro_data_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_ERR_PMPRO_DATA_HI_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_warn_pmpro_info_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_WARN_PMPRO_INFO_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_ras_warn_pmpro_info_hi, 0444,
+	smpmpro_read_gpi, NULL, GPI_RAS_WARN_PMPRO_INFO_HI_REG);
+
+static SENSOR_DEVICE_ATTR(gpi_boot_stage_select, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_BOOT_STAGE_SELECT_REG);
+static SENSOR_DEVICE_ATTR(gpi_boot_stage_status_lo, 0444,
+	smpmpro_read_gpi, NULL, GPI_BOOT_STAGE_STATUS_LO_REG);
+static SENSOR_DEVICE_ATTR(gpi_boot_stage_cur_stage, 0444,
+	smpmpro_read_gpi, NULL, GPI_BOOT_STAGE_CUR_STAGE_REG);
+
+static SENSOR_DEVICE_ATTR(gpi_pcie_err_sel, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_PCIE_ERR_SEL_REG);
+static SENSOR_DEVICE_ATTR(gpi_pcie_err_type, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_PCIE_ERR_TYPE_REG);
+static SENSOR_DEVICE_ATTR(gpi_pcie_err_device, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, GPI_PCIE_ERR_DEVICE_REG);
+
+static SENSOR_DEVICE_ATTR(other_ce_err_cnt, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_CE_ERR_CNT_REG);
+static SENSOR_DEVICE_ATTR(other_ce_err_len, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_CE_ERR_LEN_REG);
+static SENSOR_DEVICE_ATTR(other_ce_err_data, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_CE_ERR_DATA_REG);
+static SENSOR_DEVICE_ATTR(other_ue_err_cnt, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_UE_ERR_CNT_REG);
+static SENSOR_DEVICE_ATTR(other_ue_err_len, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_UE_ERR_LEN_REG);
+static SENSOR_DEVICE_ATTR(other_ue_err_data, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, OTHER_UE_ERR_DATA_REG);
+
+static SENSOR_DEVICE_ATTR(acpi_system_state, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, ACPI_SYSTEM_STATE_REG);
+static SENSOR_DEVICE_ATTR(acpi_cppc_cluster_sel, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, ACPI_CPPC_CLUSTER_SEL_REG);
+static SENSOR_DEVICE_ATTR(acpi_cppc_cluster_data, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, ACPI_CPPC_CLUSTER_DATA_REG);
+static SENSOR_DEVICE_ATTR(acpi_power_limit, 0644,
+	smpmpro_read_gpi, smpmpro_write_gpi, ACPI_POWER_LIMIT_REG);
+
+static struct attribute *smpmpro_attrs[] = {
+	&sensor_dev_attr_gpi0_label.dev_attr.attr,
+	&sensor_dev_attr_gpi0_input.dev_attr.attr,
+	&sensor_dev_attr_gpi1_label.dev_attr.attr,
+	&sensor_dev_attr_gpi1_input.dev_attr.attr,
+	&sensor_dev_attr_gpi2_label.dev_attr.attr,
+	&sensor_dev_attr_gpi2_input.dev_attr.attr,
+	&sensor_dev_attr_gpi3_label.dev_attr.attr,
+	&sensor_dev_attr_gpi3_input.dev_attr.attr,
+	&sensor_dev_attr_gpi4_label.dev_attr.attr,
+	&sensor_dev_attr_gpi4_input.dev_attr.attr,
+	&sensor_dev_attr_gpi5_label.dev_attr.attr,
+	&sensor_dev_attr_gpi5_input.dev_attr.attr,
+	&sensor_dev_attr_gpi6_label.dev_attr.attr,
+	&sensor_dev_attr_gpi6_input.dev_attr.attr,
+	&sensor_dev_attr_gpi7_label.dev_attr.attr,
+	&sensor_dev_attr_gpi7_input.dev_attr.attr,
+	&sensor_dev_attr_gpi8_label.dev_attr.attr,
+	&sensor_dev_attr_gpi8_input.dev_attr.attr,
+	&sensor_dev_attr_gpi9_label.dev_attr.attr,
+	&sensor_dev_attr_gpi9_input.dev_attr.attr,
+	&sensor_dev_attr_gpi10_label.dev_attr.attr,
+	&sensor_dev_attr_gpi10_input.dev_attr.attr,
+	&sensor_dev_attr_gpi11_label.dev_attr.attr,
+	&sensor_dev_attr_gpi11_input.dev_attr.attr,
+	&sensor_dev_attr_gpi12_label.dev_attr.attr,
+	&sensor_dev_attr_gpi12_input.dev_attr.attr,
+	&sensor_dev_attr_gpi13_label.dev_attr.attr,
+	&sensor_dev_attr_gpi13_input.dev_attr.attr,
+	&sensor_dev_attr_gpi14_label.dev_attr.attr,
+	&sensor_dev_attr_gpi14_input.dev_attr.attr,
+	&sensor_dev_attr_gpi15_label.dev_attr.attr,
+	&sensor_dev_attr_gpi15_input.dev_attr.attr,
+	&sensor_dev_attr_gpi16_label.dev_attr.attr,
+	&sensor_dev_attr_gpi16_input.dev_attr.attr,
+	&sensor_dev_attr_gpi17_label.dev_attr.attr,
+	&sensor_dev_attr_gpi17_input.dev_attr.attr,
+	&sensor_dev_attr_gpi18_label.dev_attr.attr,
+	&sensor_dev_attr_gpi18_input.dev_attr.attr,
+	&sensor_dev_attr_gpi19_label.dev_attr.attr,
+	&sensor_dev_attr_gpi19_input.dev_attr.attr,
+	&sensor_dev_attr_gpi20_label.dev_attr.attr,
+	&sensor_dev_attr_gpi20_input.dev_attr.attr,
+	&sensor_dev_attr_gpi21_label.dev_attr.attr,
+	&sensor_dev_attr_gpi21_input.dev_attr.attr,
+	&sensor_dev_attr_gpi22_label.dev_attr.attr,
+	&sensor_dev_attr_gpi22_input.dev_attr.attr,
+	&sensor_dev_attr_gpi23_label.dev_attr.attr,
+	&sensor_dev_attr_gpi23_input.dev_attr.attr,
+
+	&sensor_dev_attr_temp1_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp3_label.dev_attr.attr,
+	&sensor_dev_attr_temp4_label.dev_attr.attr,
+	&sensor_dev_attr_temp5_label.dev_attr.attr,
+	&sensor_dev_attr_temp6_label.dev_attr.attr,
+	&sensor_dev_attr_temp7_label.dev_attr.attr,
+	&sensor_dev_attr_temp8_label.dev_attr.attr,
+	&sensor_dev_attr_temp9_label.dev_attr.attr,
+	&sensor_dev_attr_temp10_label.dev_attr.attr,
+	&sensor_dev_attr_temp11_label.dev_attr.attr,
+	&sensor_dev_attr_temp12_label.dev_attr.attr,
+	&sensor_dev_attr_temp13_label.dev_attr.attr,
+	&sensor_dev_attr_temp14_label.dev_attr.attr,
+
+	&sensor_dev_attr_in0_label.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+
+	&sensor_dev_attr_power1_label.dev_attr.attr,
+	&sensor_dev_attr_power2_label.dev_attr.attr,
+	&sensor_dev_attr_power3_label.dev_attr.attr,
+	&sensor_dev_attr_power4_label.dev_attr.attr,
+	&sensor_dev_attr_power5_label.dev_attr.attr,
+	&sensor_dev_attr_power6_label.dev_attr.attr,
+
+	&sensor_dev_attr_gpi_core_cluster_sel.dev_attr.attr,
+	&sensor_dev_attr_gpi_core_l1_err.dev_attr.attr,
+	&sensor_dev_attr_gpi_core_l2_err.dev_attr.attr,
+	&sensor_dev_attr_gpi_sys_cache_inst_sel.dev_attr.attr,
+	&sensor_dev_attr_gpi_sys_cache_err.dev_attr.attr,
+
+	&sensor_dev_attr_gpi_mcu_dimm_select.dev_attr.attr,
+	&sensor_dev_attr_gpi_mcu_dimm_err.dev_attr.attr,
+
+	&sensor_dev_attr_gpi_ras_err_smpro_type.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_pmpro_type.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_smpro_info_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_smpro_info_hi.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_smpro_data_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_smpro_data_hi.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_warn_smpro_info_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_warn_smpro_info_hi.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_pmpro_info_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_pmpro_info_hi.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_pmpro_data_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_err_pmpro_data_hi.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_warn_pmpro_info_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_ras_warn_pmpro_info_hi.dev_attr.attr,
+
+	&sensor_dev_attr_gpi_boot_stage_select.dev_attr.attr,
+	&sensor_dev_attr_gpi_boot_stage_status_lo.dev_attr.attr,
+	&sensor_dev_attr_gpi_boot_stage_cur_stage.dev_attr.attr,
+
+	&sensor_dev_attr_gpi_pcie_err_sel.dev_attr.attr,
+	&sensor_dev_attr_gpi_pcie_err_type.dev_attr.attr,
+	&sensor_dev_attr_gpi_pcie_err_device.dev_attr.attr,
+
+	&sensor_dev_attr_other_ce_err_cnt.dev_attr.attr,
+	&sensor_dev_attr_other_ce_err_len.dev_attr.attr,
+	&sensor_dev_attr_other_ce_err_data.dev_attr.attr,
+	&sensor_dev_attr_other_ue_err_cnt.dev_attr.attr,
+	&sensor_dev_attr_other_ue_err_len.dev_attr.attr,
+	&sensor_dev_attr_other_ue_err_data.dev_attr.attr,
+
+	&sensor_dev_attr_acpi_system_state.dev_attr.attr,
+	&sensor_dev_attr_acpi_cppc_cluster_sel.dev_attr.attr,
+	&sensor_dev_attr_acpi_cppc_cluster_data.dev_attr.attr,
+	&sensor_dev_attr_acpi_power_limit.dev_attr.attr,
+
+	NULL
+};
+ATTRIBUTE_GROUPS(smpmpro);
+
+static int smpmpro_i2c_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	struct device *dev = &client->dev;
+	struct smpmpro_data *data;
+	struct device *hwmon_dev;
+
+	if (!i2c_check_functionality(adapter,
+			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(struct smpmpro_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+
+	/* Initialize the Altra SMPMPro chip */
+	smpmpro_init_device(client, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &smpmpro_chip_info,
+							 smpmpro_groups);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id smpmpro_i2c_id[] = {
+	{ "smpmpro", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, smpmpro_i2c_id);
+
+static struct i2c_driver smpmpro_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.probe		= smpmpro_i2c_probe,
+	.driver = {
+		.name	= "smpmpro",
+	},
+	.id_table	= smpmpro_i2c_id,
+};
+
+module_i2c_driver(smpmpro_driver);
+
+MODULE_AUTHOR("Thinh Pham <thinh.pham@amperecomputing.com>");
+MODULE_AUTHOR("Dien Nguyen <dinguyen@amperecomputing.com>");
+MODULE_AUTHOR("Hoang Nguyen <hnguyen@amperecomputing.com>");
+MODULE_DESCRIPTION("Altra SMPMPro driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

