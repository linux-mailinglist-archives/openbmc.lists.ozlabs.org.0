Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F8E2F7F75
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 16:25:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHQ4K22w4zDshj
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 02:25:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aaXnOYcM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHPly6dNWzDsgf
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 02:11:42 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FF27NM019410; Fri, 15 Jan 2021 10:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=TmgJI+pDZ7i4otkN5P+lQ2nyJPd6yXn/KBC9Guvezf8=;
 b=aaXnOYcMJiXVLXHxaJTREbx7kZthjxEslz3y+6CGxffBoMjL+1U3D6T+R9azdhwSHc04
 YcH3pznQuvKX3PviGostCHY82mmJY4gp7j4urWmZ4Xk0l13ZR5Ou9g9pxBSvufZX6ptB
 QR1h/X0/8Q0BneDhqcyZsV5Yeoy0CTyXB7bh266U1rGS0+hUyoIKwFbUbhw6us2ieig5
 YrF0u13zTM2ReOc2iz5TBgyGoO+3FtL+pyLBfnBLxKWvdsA9j66oGqVMQnzlnEb6tH/j
 a251GgsL5vbZYAaZPHR3J2MQWRFNPdt4xWO6juWVKGSUa9vx/dIxuLSuzvPnHOrmq+jT 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363dajrc8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:40 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FF2wft022483;
 Fri, 15 Jan 2021 10:11:39 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363dajrc88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:39 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FFBF4Y005364;
 Fri, 15 Jan 2021 15:11:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 35y449nfuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:11:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFBcYO9765462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:11:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18E03BE062;
 Fri, 15 Jan 2021 15:11:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2911BE056;
 Fri, 15 Jan 2021 15:11:36 +0000 (GMT)
Received: from klaus-virtual-ubuntu.aus.stglabs.ibm.com (unknown [9.80.230.10])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:11:36 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8 8/9] tpm: tpm_tis: add tpm_tis_i2c driver
Date: Fri, 15 Jan 2021 12:10:47 -0300
Message-Id: <20210115151048.15965-9-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
References: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150091
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
Cc: Amir Mizinski <amirmizi6@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Amir Mizinski <amirmizi6@gmail.com>

Implements the functionality needed to communicate with an I2C TPM
according to the TCG TPM I2C Interface Specification.

Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
Tested-by: Eddie James <eajames@linux.ibm.com>
Tested-by: Joel Stanley <joel@jms.id.au>
---
 drivers/char/tpm/Kconfig       |  12 ++
 drivers/char/tpm/Makefile      |   1 +
 drivers/char/tpm/tpm_tis_i2c.c | 292 +++++++++++++++++++++++++++++++++
 3 files changed, 305 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_tis_i2c.c

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 58b4c573d176..0a8cc7dcb99f 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -74,6 +74,18 @@ config TCG_TIS_SPI_CR50
 	  If you have a H1 secure module running Cr50 firmware on SPI bus,
 	  say Yes and it will be accessible from within Linux.
 
+config TCG_TIS_I2C
+	tristate "TPM I2C Interface Specification"
+	depends on I2C
+	select CRC_CCITT
+	select TCG_TIS_CORE
+	help
+	  If you have a TPM security chip which is connected to a regular
+	  I2C master (i.e. most embedded platforms) that is compliant with the
+	  TCG TPM I2C Interface Specification say Yes and it will be accessible from
+	  within Linux. To compile this driver as a module, choose  M here;
+	  the module will be called tpm_tis_i2c.
+
 config TCG_TIS_I2C_ATMEL
 	tristate "TPM Interface Specification 1.2 Interface (I2C - Atmel)"
 	depends on I2C
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 9567e5197f74..97999cfd5b21 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_TCG_TIS_SPI) += tpm_tis_spi.o
 tpm_tis_spi-y := tpm_tis_spi_main.o
 tpm_tis_spi-$(CONFIG_TCG_TIS_SPI_CR50) += tpm_tis_spi_cr50.o
 
+obj-$(CONFIG_TCG_TIS_I2C) += tpm_tis_i2c.o
 obj-$(CONFIG_TCG_TIS_I2C_ATMEL) += tpm_i2c_atmel.o
 obj-$(CONFIG_TCG_TIS_I2C_INFINEON) += tpm_i2c_infineon.o
 obj-$(CONFIG_TCG_TIS_I2C_NUVOTON) += tpm_i2c_nuvoton.o
diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
new file mode 100644
index 000000000000..4c9bad06d111
--- /dev/null
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014-2019 Nuvoton Technology corporation
+ *
+ * TPM TIS I2C
+ *
+ * TPM TIS I2C Device Driver Interface for devices that implement the TPM I2C
+ * Interface defined by TCG PC Client Platform TPM Profile (PTP) Specification
+ * Revision 01.03 v22 at www.trustedcomputinggroup.org
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
+#include <linux/crc-ccitt.h>
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/tpm.h>
+#include "tpm.h"
+#include "tpm_tis_core.h"
+
+#define TPM_LOC_SEL                    0x04
+#define TPM_I2C_INTERFACE_CAPABILITY   0x30
+#define TPM_I2C_DEVICE_ADDRESS         0x38
+#define TPM_DATA_CSUM_ENABLE           0x40
+#define TPM_DATA_CSUM                  0x44
+#define TPM_I2C_DID_VID                        0x48
+#define TPM_I2C_RID                    0x4C
+
+//#define I2C_IS_TPM2 1
+
+struct tpm_tis_i2c_phy {
+	struct tpm_tis_data priv;
+	struct i2c_client *i2c_client;
+	bool data_csum;
+	u8 *iobuf;
+};
+
+static inline struct tpm_tis_i2c_phy *to_tpm_tis_i2c_phy(struct tpm_tis_data
+							 *data)
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
+static int tpm_tis_i2c_read_bytes(struct tpm_tis_data *data, u32 addr,
+				  u16 len, u8 *result)
+{
+	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	int ret = 0;
+	int i = 0;
+	u8 reg = address_to_register(addr);
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
+		{
+			struct i2c_msg msgs[] = {
+				{
+					.addr = phy->i2c_client->addr,
+					.len = len + 1,
+					.buf = phy->iobuf,
+				},
+			};
+
+			do {
+				ret = i2c_transfer(phy->i2c_client->adapter,
+						   msgs, ARRAY_SIZE(msgs));
+				// wait default GUARD_TIME of 250µs
+				usleep_range(250, 300);
+			} while (ret < 0 && i++ < TPM_RETRY);
+		}
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
+static bool tpm_tis_i2c_verify_data_integrity(struct tpm_tis_data *data,
+					      const u8 *buf, size_t len)
+{
+	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	u16 crc, crc_tpm;
+	int rc;
+
+	if (phy->data_csum) {
+		crc = crc_ccitt(0x0000, buf, len);
+		rc = tpm_tis_read16(data, TPM_DATA_CSUM, &crc_tpm);
+		if (rc < 0)
+			return false;
+
+		crc_tpm = be16_to_cpu(crc_tpm);
+		return crc == crc_tpm;
+	}
+
+	return true;
+}
+
+static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
+
+static int csum_state_store(struct tpm_tis_data *data, u8 new_state)
+{
+	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	u8 cur_state;
+	int rc;
+
+	rc = tpm_tis_i2c_write_bytes(&phy->priv, TPM_DATA_CSUM_ENABLE,
+				     1, &new_state);
+	if (rc < 0)
+		return rc;
+
+	rc = tpm_tis_i2c_read_bytes(&phy->priv, TPM_DATA_CSUM_ENABLE,
+				    1, &cur_state);
+	if (rc < 0)
+		return rc;
+
+	if (new_state == cur_state)
+		phy->data_csum = (bool)new_state;
+
+	return rc;
+}
+
+static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
+	.read_bytes = tpm_tis_i2c_read_bytes,
+	.write_bytes = tpm_tis_i2c_write_bytes,
+	.verify_data_integrity = tpm_tis_i2c_verify_data_integrity,
+};
+
+static int tpm_tis_i2c_probe(struct i2c_client *dev,
+			     const struct i2c_device_id *id)
+{
+	struct tpm_tis_i2c_phy *phy;
+	int rc;
+	int crc_checksum = 0;
+	const u8 loc_init = 0;
+	struct device_node *np;
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
+	// select locality 0 (the driver will access only via locality 0)
+	rc = tpm_tis_i2c_write_bytes(&phy->priv, TPM_LOC_SEL, 1, &loc_init);
+	if (rc < 0)
+		return rc;
+
+	// set CRC checksum calculation enable
+	np = dev->dev.of_node;
+	if (of_property_read_bool(np, "crc-checksum"))
+		crc_checksum = 1;
+
+	rc = csum_state_store(&phy->priv, crc_checksum);
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
+static const struct acpi_device_id acpi_tis_i2c_match[] = {
+	{"SMO0768", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_tis_i2c_match);
+
+static struct i2c_driver tpm_tis_i2c_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "tpm_tis_i2c",
+		.pm = &tpm_tis_pm,
+		.of_match_table = of_match_ptr(of_tis_i2c_match),
+		.acpi_match_table = ACPI_PTR(acpi_tis_i2c_match),
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
2.20.1

