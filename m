Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2910446DBF4
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8Rpl0gJhz3bXP
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F/oLN5dd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F/oLN5dd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RlN6v7Mz2yV7
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:18:08 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8HJ72S012455; 
 Wed, 8 Dec 2021 19:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=foHW1lKle9jMRp5q99BznjSW0yr6NaQWtDY/IpvB4N8=;
 b=F/oLN5dd5Vi7KrSn4gCT8B0qyy01hp4fZ3qFx+bqPHpOGUKreK1GS0Hpg1vqJ1fr3XXO
 IGxw21OD9dLXoiREacNjdBtGqoQ12dU6U+DW0x3iAwk6WVgtcKR6oKMmpjYJvktOpv0Z
 EswJdptdVNWIkxqMDDLElctPWFnmrE/Crp0v2Nnp66qda/8O+tabhq6TSeYMuMR1vqrW
 a7WBEUcMD2HRifG/5986vWQOIxPcOLeeWxSvQwKKoZfpX2TlIvJPg9EKMKzjXSYCXT6C
 tmlEYop1IiQ6vxeNqUrnTFUTuIFHNwcgH7Ri9J3L9HeNZKd9SSj6GE30AmQNcMSDneLl MQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu10a255f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDCOc016587;
 Wed, 8 Dec 2021 19:18:04 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3cqyybv52h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:04 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JI3SB27263474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 19:18:03 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6610DB2068;
 Wed,  8 Dec 2021 19:18:03 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA24DB2066;
 Wed,  8 Dec 2021 19:18:02 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.84.65])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 19:18:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 4/7] tpm: tpm_tis: Add tpm_tis_i2c driver
Date: Wed,  8 Dec 2021 13:17:55 -0600
Message-Id: <20211208191758.20517-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211208191758.20517-1-eajames@linux.ibm.com>
References: <20211208191758.20517-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fRNvEVpnwfTs8leUtSN01qFeemybnd9x
X-Proofpoint-ORIG-GUID: fRNvEVpnwfTs8leUtSN01qFeemybnd9x
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080108
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Amir Mizinski <amirmizi6@gmail.com>

I2C support for TPM devices on the TIS interface is currently available
only as a proprietary driver implementation for each TPM vendor.
This patch implements the infrastructure for a TCG-compliant TPM TIS I2C
driver with the functionality required to communicate with a TPM device
over I2C according to the "TCG PC Client PTP Interface Specification"
and "Device Driver Design Principles for TPM 2.0"

References:
[1] "TCG PC Client Platform TPM Profile(PTP) Interface Specification for
TPM 2.0" Version 01.03 Revision 22 at:
https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
[2] "TCG PC Client Device Driver Design Principles for TPM 2.0"
Version 1.0 Revision 27 at:
https://trustedcomputinggroup.org/resource/tcg-pc-client-device-driver-design-principles-for-tpm-2-0/

Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
Tested-by: Eddie James <eajames@linux.ibm.com>
Tested-by: Joel Stanley <joel@jms.id.au>
---
 drivers/char/tpm/Kconfig       |  12 ++
 drivers/char/tpm/Makefile      |   1 +
 drivers/char/tpm/tpm_tis_i2c.c | 263 +++++++++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_tis_i2c.c

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index d6ba644f6b00..f07ae63298ec 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -86,6 +86,18 @@ config TCG_TIS_SYNQUACER
 	  To compile this driver as a module, choose  M here;
 	  the module will be called tpm_tis_synquacer.
 
+config TCG_TIS_I2C
+	tristate "TPM I2C Interface Specification"
+	depends on I2C
+	select CRC_CCITT
+	select TCG_TIS_CORE
+	help
+	  If you have a TPM security chip, compliant with the TCG TPM PTP
+	  (I2C interface) specification and connected to an I2C bus master,
+	  say Yes and it will be accessible from within Linux.
+	  To compile this driver as a module, choose M here;
+	  the module will be called tpm_tis_i2c.
+
 config TCG_TIS_I2C_CR50
 	tristate "TPM Interface Specification 2.0 Interface (I2C - CR50)"
 	depends on I2C
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 66d39ea6bd10..0222b1ddb310 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -29,6 +29,7 @@ tpm_tis_spi-$(CONFIG_TCG_TIS_SPI_CR50) += tpm_tis_spi_cr50.o
 
 obj-$(CONFIG_TCG_TIS_I2C_CR50) += tpm_tis_i2c_cr50.o
 
+obj-$(CONFIG_TCG_TIS_I2C) += tpm_tis_i2c.o
 obj-$(CONFIG_TCG_TIS_I2C_ATMEL) += tpm_i2c_atmel.o
 obj-$(CONFIG_TCG_TIS_I2C_INFINEON) += tpm_i2c_infineon.o
 obj-$(CONFIG_TCG_TIS_I2C_NUVOTON) += tpm_i2c_nuvoton.o
diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
new file mode 100644
index 000000000000..12984a3be327
--- /dev/null
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014-2021 Nuvoton Technology corporation
+ *
+ * TPM TIS I2C Device Driver Interface for devices that implement the TPM
+ * I2C Interface defined by "TCG PC Client Platform TPM Profile (PTP)
+ * Specification version 01.05 r14" and "TCG PC Client Device Driver
+ * Design Principles version 1.0 r27" for TPM 2.0 at
+ * www.trustedcomputinggroup.org
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/wait.h>
+#include <linux/acpi.h>
+#include <linux/freezer.h>
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/tpm.h>
+#include "tpm_tis_core.h"
+
+#define TPM_LOC_SEL			0x04
+#define TPM_I2C_INTERFACE_CAPABILITY	0x30
+#define TPM_I2C_DEVICE_ADDRESS		0x38
+#define TPM_DATA_CSUM_ENABLE		0x40
+#define TPM_I2C_DID_VID			0x48
+#define TPM_I2C_RID			0x4C
+
+struct tpm_tis_i2c_phy {
+	struct tpm_tis_data priv;
+	struct i2c_client *i2c_client;
+	u8 *iobuf;
+};
+
+static inline struct tpm_tis_i2c_phy *to_tpm_tis_i2c_phy(struct tpm_tis_data *data)
+{
+	return container_of(data, struct tpm_tis_i2c_phy, priv);
+}
+
+static u8 address_to_register(u32 addr)
+{
+	addr &= 0xFFF;
+
+	switch (addr) {
+		// adapt register addresses that have changed compared to
+		// older TIS versions
+	case TPM_ACCESS(0):
+		return 0x04;
+	case TPM_LOC_SEL:
+		return 0x00;
+	case TPM_DID_VID(0):
+		return 0x48;
+	case TPM_RID(0):
+		return 0x4C;
+	default:
+		return addr;
+	}
+}
+
+static int tpm_tis_i2c_read_bytes(struct tpm_tis_data *data, u32 addr, u16 len, u8 *result)
+{
+	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	u8 reg = address_to_register(addr);
+	int ret;
+	int i = 0;
+	struct i2c_msg msgs[] = {
+		{
+			.addr = phy->i2c_client->addr,
+			.len = sizeof(reg),
+			.buf = &reg,
+		},
+		{
+			.addr = phy->i2c_client->addr,
+			.len = len,
+			.buf = result,
+			.flags = I2C_M_RD,
+		},
+	};
+
+	do {
+		ret = i2c_transfer(phy->i2c_client->adapter, msgs,
+				   ARRAY_SIZE(msgs));
+		usleep_range(250, 300); // wait default GUARD_TIME of 250µs
+
+	} while (ret < 0 && i++ < TPM_RETRY);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr,
+				   u16 len, const u8 *value)
+{
+	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	int ret = 0;
+	int i = 0;
+
+	if (phy->iobuf) {
+		if (len > TPM_BUFSIZE - 1)
+			return -EIO;
+
+		phy->iobuf[0] = address_to_register(addr);
+		memcpy(phy->iobuf + 1, value, len);
+
+		struct i2c_msg msgs[] = {
+			{
+				.addr = phy->i2c_client->addr,
+				.len = len + 1,
+				.buf = phy->iobuf,
+			},
+		};
+
+		do {
+			ret = i2c_transfer(phy->i2c_client->adapter,
+					   msgs, ARRAY_SIZE(msgs));
+			// wait default GUARD_TIME of 250µs
+			usleep_range(250, 300);
+		} while (ret < 0 && i++ < TPM_RETRY);
+	} else {
+		u8 reg = address_to_register(addr);
+
+		struct i2c_msg msgs[] = {
+			{
+				.addr = phy->i2c_client->addr,
+				.len = sizeof(reg),
+				.buf = &reg,
+			},
+			{
+				.addr = phy->i2c_client->addr,
+				.len = len,
+				.buf = (u8 *)value,
+				.flags = I2C_M_NOSTART,
+			},
+		};
+
+		do {
+			ret = i2c_transfer(phy->i2c_client->adapter, msgs,
+					   ARRAY_SIZE(msgs));
+			// wait default GUARD_TIME of 250µs
+			usleep_range(250, 300);
+		} while (ret < 0 && i++ < TPM_RETRY);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int tpm_tis_i2c_read16(struct tpm_tis_data *data, u32 addr, u16 *result)
+{
+	__le16 result_le;
+	int rc;
+
+	rc = data->phy_ops->read_bytes(data, addr, sizeof(u16),
+				       (u8 *)&result_le);
+	if (!rc)
+		*result = le16_to_cpu(result_le);
+
+	return rc;
+}
+
+int tpm_tis_i2c_read32(struct tpm_tis_data *data, u32 addr, u32 *result)
+{
+	__le32 result_le;
+	int rc;
+
+	rc = data->phy_ops->read_bytes(data, addr, sizeof(u32),
+				       (u8 *)&result_le);
+	if (!rc)
+		*result = le32_to_cpu(result_le);
+
+	return rc;
+}
+
+int tpm_tis_i2c_write32(struct tpm_tis_data *data, u32 addr, u32 value)
+{
+	__le32 value_le;
+	int rc;
+
+	value_le = cpu_to_le32(value);
+
+	rc = data->phy_ops->write_bytes(data, addr, sizeof(u32),
+					(u8 *)&value_le);
+
+	return rc;
+}
+
+static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
+
+static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
+	.read_bytes = tpm_tis_i2c_read_bytes,
+	.write_bytes = tpm_tis_i2c_write_bytes,
+	.read16 = tpm_tis_i2c_read16,
+	.read32 = tpm_tis_i2c_read32,
+	.write32 = tpm_tis_i2c_write32,
+};
+
+static int tpm_tis_i2c_probe(struct i2c_client *dev, const struct i2c_device_id *id)
+{
+	struct tpm_tis_i2c_phy *phy;
+	const u8 loc_init = 0;
+	int rc;
+
+	phy = devm_kzalloc(&dev->dev, sizeof(struct tpm_tis_i2c_phy),
+			   GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->i2c_client = dev;
+
+	if (!i2c_check_functionality(dev->adapter, I2C_FUNC_NOSTART)) {
+		phy->iobuf = devm_kmalloc(&dev->dev, TPM_BUFSIZE, GFP_KERNEL);
+		if (!phy->iobuf)
+			return -ENOMEM;
+	}
+
+	/*select locality 0 (the driver will access only via locality 0)*/
+	rc = tpm_tis_i2c_write_bytes(&phy->priv, TPM_LOC_SEL, 1, &loc_init);
+	if (rc < 0)
+		return rc;
+
+	return tpm_tis_core_init(&dev->dev, &phy->priv, -1, &tpm_i2c_phy_ops,
+					NULL);
+}
+
+static const struct i2c_device_id tpm_tis_i2c_id[] = {
+	{"tpm_tis_i2c", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
+
+static const struct of_device_id of_tis_i2c_match[] = {
+	{ .compatible = "nuvoton,npct75x", },
+	{ .compatible = "tcg,tpm-tis-i2c", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
+
+static struct i2c_driver tpm_tis_i2c_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "tpm_tis_i2c",
+		.pm = &tpm_tis_pm,
+		.of_match_table = of_match_ptr(of_tis_i2c_match),
+	},
+	.probe = tpm_tis_i2c_probe,
+	.id_table = tpm_tis_i2c_id,
+};
+
+module_i2c_driver(tpm_tis_i2c_driver);
+
+MODULE_DESCRIPTION("TPM Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

