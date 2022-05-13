Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99A5267F3
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FZt6brQz3c8C
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKy34PDH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PKy34PDH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSY5fNkz3c80
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:25 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DGj7Y2010539;
 Fri, 13 May 2022 17:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8YCVYejiNNstWWSChFY4Iz1R0hQi1v0NVTC3Qz6Pet4=;
 b=PKy34PDHoyPUFCVUkbUd66YrGTdW14Dqr4wwY3zkUxl6gRACnZQFG8Ma8uM/IOH87OZ4
 nc5cVTueVvcD2asrxQ054cQoiWUqPUEL8SBC2cf3vM7uNiRp4lcT9mfasCfKKKWB1VZk
 RqUG12opKKTFUpCDlivmKqfHQqCbmScYqK6sA54zbGMo19htsdZ1ereADidwEWzPKsBu
 1yOy5NmWpsvUlDw5DgRFn7mKc/ULS7UYtFkmpT6kBSZ8uP1mE7huaq6z9j9aik/+W8vJ
 qZbvgboassQP07rq/aDtOZAqf3ArHQpBzevhSgHLaeCIX70dGyiK9m72Un6eG0ZdvWr/ gA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1u4k8cgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DH7J5A029817;
 Fri, 13 May 2022 17:07:22 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3fwgdbeh68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7KLl16843194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA4F1AC059;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 400F7AC062;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 7/9] tpm: add support for
 TPMv2.x I2C chips
Date: Fri, 13 May 2022 12:07:13 -0500
Message-Id: <20220513170715.43475-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X6xaBDil3_RID8oQVjTywTyYbEpQW8Xv
X-Proofpoint-ORIG-GUID: X6xaBDil3_RID8oQVjTywTyYbEpQW8Xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the tpm2_tis_i2c driver that should support any TPMv2 compliant
I2C chips, such as the NPCT75X chip.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/tpm/Kconfig        |   9 ++
 drivers/tpm/Makefile       |   1 +
 drivers/tpm/tpm2_tis_i2c.c | 171 +++++++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/tpm/tpm2_tis_i2c.c

diff --git a/drivers/tpm/Kconfig b/drivers/tpm/Kconfig
index 94629dffd2..6fd98ac057 100644
--- a/drivers/tpm/Kconfig
+++ b/drivers/tpm/Kconfig
@@ -145,6 +145,15 @@ config TPM2_TIS_SPI
 	  to the device using the standard TPM Interface Specification (TIS)
 	  protocol.
 
+config TPM2_TIS_I2C
+	bool "Enable support for TPMv2.x I2C chips"
+	depends on TPM_V2 && DM_I2C
+	help
+	  This driver supports TPMv2.x devices connected on the I2C bus.
+	  The usual TPM operations and the 'tpm' command can be used to talk
+	  to the device using the standard TPM Interface Specification (TIS)
+	  protocol.
+
 endif # TPM_V2
 
 endmenu
diff --git a/drivers/tpm/Makefile b/drivers/tpm/Makefile
index 94c337b8ed..33bc0784f6 100644
--- a/drivers/tpm/Makefile
+++ b/drivers/tpm/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_TPM_ST33ZP24_SPI) += tpm_tis_st33zp24_spi.o
 
 obj-$(CONFIG_TPM2_TIS_SANDBOX) += tpm2_tis_sandbox.o
 obj-$(CONFIG_TPM2_TIS_SPI) += tpm2_tis_spi.o
+obj-$(CONFIG_TPM2_TIS_I2C) += tpm2_tis_core.o tpm2_tis_i2c.o
diff --git a/drivers/tpm/tpm2_tis_i2c.c b/drivers/tpm/tpm2_tis_i2c.c
new file mode 100644
index 0000000000..33cd5bb84b
--- /dev/null
+++ b/drivers/tpm/tpm2_tis_i2c.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2022 IBM Corp.
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <fdtdec.h>
+#include <i2c.h>
+#include <log.h>
+#include <tpm-v2.h>
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/unaligned/be_byteshift.h>
+#include <asm-generic/gpio.h>
+
+#include "tpm_tis.h"
+#include "tpm_internal.h"
+
+struct tpm_tis_chip_data {
+	unsigned int pcr_count;
+	unsigned int pcr_select_min;
+};
+
+static uint tpm_tis_i2c_address_to_register(u32 addr)
+{
+	addr &= 0xFFF;
+
+	/*
+	 * Adapt register addresses that have changed compared to older TIS
+	 * version.
+	 */
+	switch (addr) {
+	case TPM_ACCESS(0):
+		return 0x04;
+	case TPM_DID_VID(0):
+		return 0x48;
+	case TPM_RID(0):
+		return 0x4C;
+	default:
+		return addr;
+	}
+}
+
+static int tpm_tis_i2c_read(struct udevice *dev, u32 addr, u16 len, u8 *in)
+{
+	int rc;
+	int count = 0;
+	uint reg = tpm_tis_i2c_address_to_register(addr);
+
+	do {
+		rc = dm_i2c_read(dev, reg, in, len);
+		udelay(SLEEP_DURATION_US);
+	} while (rc && count++ < MAX_COUNT);
+
+	return rc;
+}
+
+static int tpm_tis_i2c_write(struct udevice *dev, u32 addr, u16 len,
+			     const u8 *out)
+{
+	int rc;
+	int count = 0;
+	uint reg = tpm_tis_i2c_address_to_register(addr);
+
+	do {
+		rc = dm_i2c_write(dev, reg, out, len);
+		udelay(SLEEP_DURATION_US);
+	} while (rc && count++ < MAX_COUNT);
+
+	return rc;
+}
+
+static int tpm_tis_i2c_read32(struct udevice *dev, u32 addr, u32 *result)
+{
+	__le32 result_le;
+	int rc;
+
+	rc = tpm_tis_i2c_read(dev, addr, sizeof(u32), (u8 *)&result_le);
+	if (!rc)
+		*result = le32_to_cpu(result_le);
+
+	return rc;
+}
+
+static int tpm_tis_i2c_write32(struct udevice *dev, u32 addr, u32 value)
+{
+	__le32 value_le = cpu_to_le32(value);
+
+	return tpm_tis_i2c_write(dev, addr, sizeof(value), (u8 *)&value_le);
+}
+
+static struct tpm_tis_phy_ops phy_ops = {
+	.read_bytes = tpm_tis_i2c_read,
+	.write_bytes = tpm_tis_i2c_write,
+	.read32 = tpm_tis_i2c_read32,
+	.write32 = tpm_tis_i2c_write32,
+};
+
+static int tpm_tis_i2c_probe(struct udevice *udev)
+{
+	struct tpm_tis_chip_data *drv_data = (void *)dev_get_driver_data(udev);
+	struct tpm_chip_priv *priv = dev_get_uclass_priv(udev);
+	int rc;
+	u8 loc = 0;
+
+	tpm_tis_ops_register(udev, &phy_ops);
+
+	/*
+	 * Force locality 0. The core driver doesn't actually write the
+	 * locality register and instead just reads/writes various access
+	 * bits of the selected locality.
+	 */
+	rc = dm_i2c_write(udev, 0, &loc, 1);
+	if (rc)
+		return rc;
+
+	rc = tpm_tis_init(udev);
+	if (rc)
+		return rc;
+
+	priv->pcr_count = drv_data->pcr_count;
+	priv->pcr_select_min = drv_data->pcr_select_min;
+	priv->version = TPM_V2;
+
+	return 0;
+}
+
+static int tpm_tis_i2c_remove(struct udevice *udev)
+{
+	return tpm_tis_cleanup(udev);
+}
+
+static const struct tpm_ops tpm_tis_i2c_ops = {
+	.open = tpm_tis_open,
+	.close = tpm_tis_close,
+	.get_desc = tpm_tis_get_desc,
+	.send = tpm_tis_send,
+	.recv = tpm_tis_recv,
+	.cleanup = tpm_tis_cleanup,
+};
+
+static const struct tpm_tis_chip_data tpm_tis_std_chip_data = {
+	.pcr_count = 24,
+	.pcr_select_min = 3,
+};
+
+static const struct udevice_id tpm_tis_i2c_ids[] = {
+	{
+		.compatible = "nuvoton,npct75x",
+		.data = (ulong)&tpm_tis_std_chip_data,
+	},
+	{
+		.compatible = "tcg,tpm-tis-i2c",
+		.data = (ulong)&tpm_tis_std_chip_data,
+	},
+	{ }
+};
+
+U_BOOT_DRIVER(tpm_tis_i2c) = {
+	.name = "tpm_tis_i2c",
+	.id = UCLASS_TPM,
+	.of_match = tpm_tis_i2c_ids,
+	.ops = &tpm_tis_i2c_ops,
+	.probe = tpm_tis_i2c_probe,
+	.remove = tpm_tis_i2c_remove,
+	.priv_auto_alloc_size = sizeof(struct tpm_chip),
+};
-- 
2.27.0

