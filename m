Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F55267E9
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FVR2Vmgz3cBT
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:09:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JLN+LBxn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JLN+LBxn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSW1t2Bz3byG
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:22 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DEwQiv005747;
 Fri, 13 May 2022 17:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AFFJ6pMW6byF6mwk7YxMj05a06oUULmDkJ+qkJaIHrQ=;
 b=JLN+LBxn7Y31i9jxzXGg59aCerKluYcZmg0odoCrpCmYqSQtW45UmpAvsYuqZcLg8dLG
 VszqhTg+GeGTBs7BHlhf4j/2Tl5dhcQF28HS0GYiQjt5m91mkxRRRmfB36kWCEzfQG7N
 TbOLKFgd9RHsVyULBVUjcXL0w7PskVf+vo/FD6m3ZiBHqy6EQissit7zCPabv8agOTib
 o9UmnGhwts1qHbVOBnnK8ft5lwN2SL+fWAmXWY6V1XmW8WjkSwnsGhKja1hEd9OiA4hg
 7w+QO3BYs9PMJqP5kv7jEuZInq8Ks/8FDA4QqgLoZcLN/zeXpvM9MC5Bk7pyQXWuP0ry mw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1sjkafx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:19 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGhf2s021709;
 Fri, 13 May 2022 17:07:19 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3fwgd9uqfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7IlF28049808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28985AC05E;
 Fri, 13 May 2022 17:07:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A67DAC059;
 Fri, 13 May 2022 17:07:17 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/9] tpm2: Introduce TIS tpm
 core
Date: Fri, 13 May 2022 12:07:09 -0500
Message-Id: <20220513170715.43475-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8MhhJ6yAWACcIyywzLsDe15mo7nb9ciB
X-Proofpoint-ORIG-GUID: 8MhhJ6yAWACcIyywzLsDe15mo7nb9ciB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205130073
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

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>

There's a lot of code duplication in U-Boot right now.  All the TPM TIS
compatible drivers we have at the moment have their own copy of a TIS
implementation.

So let's create a common layer which implements the core TIS functions.
Any driver added from now own, which is compatible with the TIS spec, will
only have to provide the underlying bus communication mechanisms.

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
 drivers/tpm/tpm2_tis_core.c | 463 ++++++++++++++++++++++++++++++++++++
 drivers/tpm/tpm_tis.h       | 136 +++++++++++
 include/tpm-v2.h            |   1 +
 3 files changed, 600 insertions(+)
 create mode 100644 drivers/tpm/tpm2_tis_core.c

diff --git a/drivers/tpm/tpm2_tis_core.c b/drivers/tpm/tpm2_tis_core.c
new file mode 100644
index 0000000000..ec8c730fe9
--- /dev/null
+++ b/drivers/tpm/tpm2_tis_core.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, Linaro Limited
+ *
+ * Based on the Linux TIS core interface and U-Boot original SPI TPM driver
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <tpm-v2.h>
+#include <linux/delay.h>
+#include <linux/unaligned/be_byteshift.h>
+#include "tpm_tis.h"
+
+int tpm_tis_get_desc(struct udevice *dev, char *buf, int size)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	if (size < 80)
+		return -ENOSPC;
+
+	return snprintf(buf, size,
+			"%s v2.0: VendorID 0x%04x, DeviceID 0x%04x, RevisionID 0x%02x [%s]",
+			dev->name, chip->vend_dev & 0xFFFF,
+			chip->vend_dev >> 16, chip->rid,
+			(chip->is_open ? "open" : "closed"));
+}
+
+/**
+ * tpm_tis_check_locality - Check the current TPM locality
+ *
+ * @dev: TPM device
+ * @loc:  locality
+ *
+ * Return: True if the tested locality matches
+ */
+static bool tpm_tis_check_locality(struct udevice *dev, int loc)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	u8 locality;
+
+	phy_ops->read_bytes(dev, TPM_ACCESS(loc), 1, &locality);
+	if ((locality & (TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID |
+	    TPM_ACCESS_REQUEST_USE)) ==
+	    (TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) {
+		chip->locality = loc;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * tpm_tis_request_locality - Request a locality from the TPM
+ *
+ * @dev:  TPM device
+ * @loc:  requested locality
+ *
+ * Return: 0 on success -1 on failure
+ */
+int tpm_tis_request_locality(struct udevice *dev, int loc)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	u8 buf = TPM_ACCESS_REQUEST_USE;
+	unsigned long start, stop;
+
+	if (tpm_tis_check_locality(dev, loc))
+		return 0;
+
+	phy_ops->write_bytes(dev, TPM_ACCESS(loc), 1, &buf);
+	start = get_timer(0);
+	stop = chip->timeout_a;
+	do {
+		if (tpm_tis_check_locality(dev, loc))
+			return 0;
+		mdelay(TPM_TIMEOUT_MS);
+	} while (get_timer(start) < stop);
+
+	return -1;
+}
+
+/**
+ * tpm_tis_status - Check the current device status
+ *
+ * @dev:   TPM device
+ * @status: return value of status
+ *
+ * Return: 0 on success, negative on failure
+ */
+static int tpm_tis_status(struct udevice *dev, u8 *status)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+
+	if (chip->locality < 0)
+		return -EINVAL;
+
+	phy_ops->read_bytes(dev, TPM_STS(chip->locality), 1, status);
+
+	if ((*status & TPM_STS_READ_ZERO)) {
+		log_err("TPM returned invalid status\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * tpm_tis_release_locality - Release the requested locality
+ *
+ * @dev: TPM device
+ * @loc:  requested locality
+ *
+ * Return: 0 on success, negative on failure
+ */
+int tpm_tis_release_locality(struct udevice *dev, int loc)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	u8 buf = TPM_ACCESS_ACTIVE_LOCALITY;
+	int ret;
+
+	if (chip->locality < 0)
+		return 0;
+
+	ret = phy_ops->write_bytes(dev, TPM_ACCESS(loc), 1, &buf);
+	chip->locality = -1;
+
+	return ret;
+}
+
+/**
+ * tpm_tis_wait_for_stat - Wait for TPM to become ready
+ *
+ * @dev:     TPM device
+ * @mask:    mask to match
+ * @timeout: timeout for retries
+ * @status:  current status
+ *
+ * Return: 0 on success, negative on failure
+ */
+static int tpm_tis_wait_for_stat(struct udevice *dev, u8 mask,
+				 unsigned long timeout, u8 *status)
+{
+	unsigned long start = get_timer(0);
+	unsigned long stop = timeout;
+	int ret;
+
+	do {
+		mdelay(TPM_TIMEOUT_MS);
+		ret = tpm_tis_status(dev, status);
+		if (ret)
+			return ret;
+
+		if ((*status & mask) == mask)
+			return 0;
+	} while (get_timer(start) < stop);
+
+	return -ETIMEDOUT;
+}
+
+/**
+ * tpm_tis_get_burstcount - Get the burstcount for the data FIFO
+ *
+ * @dev:        TPM device
+ * @burstcount: current burstcount
+ *
+ * Return: 0 on success, negative on failure
+ */
+static int tpm_tis_get_burstcount(struct udevice *dev, size_t *burstcount)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	unsigned long start, stop;
+	u32 burst;
+
+	if (chip->locality < 0)
+		return -EINVAL;
+
+	/* wait for burstcount */
+	start = get_timer(0);
+	/*
+	 * This is the TPMv2 defined timeout. Change this in case you want to
+	 * make the driver compatile to TPMv1
+	 */
+	stop = chip->timeout_a;
+	do {
+		phy_ops->read32(dev, TPM_STS(chip->locality), &burst);
+		*burstcount = (burst >> 8) & 0xFFFF;
+		if (*burstcount)
+			return 0;
+
+		mdelay(TPM_TIMEOUT_MS);
+	} while (get_timer(start) < stop);
+
+	return -ETIMEDOUT;
+}
+
+/**
+ * tpm_tis_ready - Cancel pending comands and get the device on a ready state
+ *
+ * @dev: TPM device
+ *
+ * Return: 0 on success, negative on failure
+ */
+static int tpm_tis_ready(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	u8 data = TPM_STS_COMMAND_READY;
+
+	/* This will cancel any pending commands */
+	return phy_ops->write_bytes(dev, TPM_STS(chip->locality), 1, &data);
+}
+
+int tpm_tis_send(struct udevice *dev, const u8 *buf, size_t len)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	size_t burstcnt, wr_size, sent = 0;
+	u8 data = TPM_STS_GO;
+	u8 status;
+	int ret;
+
+	if (!chip)
+		return -ENODEV;
+
+	ret = tpm_tis_request_locality(dev, 0);
+	if (ret < 0)
+		return -EBUSY;
+
+	ret = tpm_tis_status(dev, &status);
+	if (ret)
+		goto release_locality;
+
+	if (!(status & TPM_STS_COMMAND_READY)) {
+		ret = tpm_tis_ready(dev);
+		if (ret) {
+			log_err("Can't cancel previous TPM operation\n");
+			goto release_locality;
+		}
+		ret = tpm_tis_wait_for_stat(dev, TPM_STS_COMMAND_READY,
+					    chip->timeout_b, &status);
+		if (ret) {
+			log_err("TPM not ready\n");
+			goto release_locality;
+		}
+	}
+
+	while (len > 0) {
+		ret = tpm_tis_get_burstcount(dev, &burstcnt);
+		if (ret)
+			goto release_locality;
+
+		wr_size = min(len, burstcnt);
+		ret = phy_ops->write_bytes(dev, TPM_DATA_FIFO(chip->locality),
+					   wr_size, buf + sent);
+		if (ret < 0)
+			goto release_locality;
+
+		ret = tpm_tis_wait_for_stat(dev, TPM_STS_VALID,
+					    chip->timeout_c, &status);
+		if (ret)
+			goto release_locality;
+
+		sent += wr_size;
+		len -= wr_size;
+		/* make sure the TPM expects more data */
+		if (len && !(status & TPM_STS_DATA_EXPECT)) {
+			ret = -EIO;
+			goto release_locality;
+		}
+	}
+
+	/*
+	 * Make a final check ensuring everything is ok and the TPM expects no
+	 * more data
+	 */
+	ret = tpm_tis_wait_for_stat(dev, TPM_STS_VALID, chip->timeout_c,
+				    &status);
+	if (ret)
+		goto release_locality;
+
+	if (status & TPM_STS_DATA_EXPECT) {
+		ret = -EIO;
+		goto release_locality;
+	}
+
+	ret = phy_ops->write_bytes(dev, TPM_STS(chip->locality), 1, &data);
+	if (ret)
+		goto release_locality;
+
+	return sent;
+
+release_locality:
+	tpm_tis_ready(dev);
+	tpm_tis_release_locality(dev, chip->locality);
+
+	return ret;
+}
+
+static int tpm_tis_recv_data(struct udevice *dev, u8 *buf, size_t count)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	int size = 0, len, ret;
+	size_t burstcnt;
+	u8 status;
+
+	while (size < count &&
+	       tpm_tis_wait_for_stat(dev, TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+				     chip->timeout_c, &status) == 0) {
+		ret = tpm_tis_get_burstcount(dev, &burstcnt);
+		if (ret)
+			return ret;
+
+		len = min_t(int, burstcnt, count - size);
+		ret = phy_ops->read_bytes(dev, TPM_DATA_FIFO(chip->locality),
+					  len, buf + size);
+		if (ret < 0)
+			return ret;
+
+		size += len;
+	}
+
+	return size;
+}
+
+/**
+ * tpm_tis_recv - Receive data from a device
+ *
+ * @dev:  TPM device
+ * @buf:  buffer to copy data
+ * @size: buffer size
+ *
+ * Return: bytes read or negative on failure
+ */
+int tpm_tis_recv(struct udevice *dev, u8 *buf, size_t count)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int size, expected;
+
+	if (count < TPM_HEADER_SIZE)
+		return -E2BIG;
+
+	size = tpm_tis_recv_data(dev, buf, TPM_HEADER_SIZE);
+	if (size < TPM_HEADER_SIZE) {
+		log_err("TPM error, unable to read header\n");
+		goto out;
+	}
+
+	expected = get_unaligned_be32(buf + TPM_CMD_COUNT_OFFSET);
+	if (expected > count) {
+		size = -EIO;
+		log_warning("Too much data: %d > %zu\n", expected, count);
+		goto out;
+	}
+
+	size += tpm_tis_recv_data(dev, &buf[TPM_HEADER_SIZE],
+				   expected - TPM_HEADER_SIZE);
+	if (size < expected) {
+		log(LOGC_NONE, LOGL_ERR,
+		    "TPM error, unable to read remaining bytes of result\n");
+		size = -EIO;
+		goto out;
+	}
+
+out:
+	tpm_tis_ready(dev);
+	/* acquired in tpm_tis_send */
+	tpm_tis_release_locality(dev, chip->locality);
+
+	return size;
+}
+
+int tpm_tis_cleanup(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	tpm_tis_ready(dev);
+	tpm_tis_release_locality(dev, chip->locality);
+
+	return 0;
+}
+
+int tpm_tis_open(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int ret;
+
+	if (chip->is_open)
+		return -EBUSY;
+
+	ret = tpm_tis_request_locality(dev, 0);
+	if (!ret)
+		chip->is_open = 1;
+
+	return ret;
+}
+
+void tpm_tis_ops_register(struct udevice *dev, struct tpm_tis_phy_ops *ops)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	chip->phy_ops = ops;
+}
+
+static bool tis_check_ops(struct tpm_tis_phy_ops *phy_ops)
+{
+	if (!phy_ops || !phy_ops->read_bytes || !phy_ops->write_bytes ||
+	    !phy_ops->read32 || !phy_ops->write32)
+		return false;
+
+	return true;
+}
+
+int tpm_tis_init(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	struct tpm_tis_phy_ops *phy_ops = chip->phy_ops;
+	int ret;
+	u32 tmp;
+
+	if (!tis_check_ops(phy_ops)) {
+		log_err("Driver bug. No bus ops defined\n");
+		return -1;
+	}
+	ret = tpm_tis_request_locality(dev, 0);
+	if (ret)
+		return ret;
+
+	chip->timeout_a = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_b = TIS_LONG_TIMEOUT_MS;
+	chip->timeout_c = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_d = TIS_SHORT_TIMEOUT_MS;
+
+	/* Disable interrupts */
+	phy_ops->read32(dev, TPM_INT_ENABLE(chip->locality), &tmp);
+	tmp |= TPM_INTF_CMD_READY_INT | TPM_INTF_LOCALITY_CHANGE_INT |
+	       TPM_INTF_DATA_AVAIL_INT | TPM_INTF_STS_VALID_INT;
+	tmp &= ~TPM_GLOBAL_INT_ENABLE;
+	phy_ops->write32(dev, TPM_INT_ENABLE(chip->locality), tmp);
+
+	phy_ops->read_bytes(dev, TPM_RID(chip->locality), 1, &chip->rid);
+	phy_ops->read32(dev, TPM_DID_VID(chip->locality), &chip->vend_dev);
+
+	return tpm_tis_release_locality(dev, chip->locality);
+}
+
+int tpm_tis_close(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int ret = 0;
+
+	if (chip->is_open) {
+		ret = tpm_tis_release_locality(dev, chip->locality);
+		chip->is_open = 0;
+	}
+
+	return ret;
+}
diff --git a/drivers/tpm/tpm_tis.h b/drivers/tpm/tpm_tis.h
index 2a160fe05c..93f622f291 100644
--- a/drivers/tpm/tpm_tis.h
+++ b/drivers/tpm/tpm_tis.h
@@ -21,6 +21,73 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
+/**
+ * struct tpm_tis_phy_ops - low-level TPM bus operations
+ */
+struct tpm_tis_phy_ops {
+	/* read_bytes() - Read a number of bytes from the device
+	 *
+	 * @udev:   TPM device
+	 * @addr:   offset from device base
+	 * @len:    len to read
+	 * @result: data read
+	 *
+	 * @return: 0 on success, negative on failure
+	 */
+	int (*read_bytes)(struct udevice *udev, u32 addr, u16 len,
+			  u8 *result);
+	/* write_bytes() - Read a number of bytes from the device
+	 *
+	 * @udev:   TPM device
+	 * @addr:   offset from device base
+	 * @len:    len to read
+	 * @value:  data to write
+	 *
+	 * @return: 0 on success, negative on failure
+	 */
+	int (*write_bytes)(struct udevice *udev, u32 addr, u16 len,
+			   const u8 *value);
+	/* read32() - Read a 32bit value of the device
+	 *
+	 * @udev:   TPM device
+	 * @addr:   offset from device base
+	 * @result: data read
+	 *
+	 * @return: 0 on success, negative on failure
+	 */
+	int (*read32)(struct udevice *udev, u32 addr, u32 *result);
+	/* write32() - write a 32bit value to the device
+	 *
+	 * @udev: TPM device
+	 * @addr: offset from device base
+	 * @src:  data to write
+	 *
+	 * @return: 0 on success, negative on failure
+	 */
+	int (*write32)(struct udevice *udev, u32 addr, u32 src);
+};
+
+enum tis_int_flags {
+	TPM_GLOBAL_INT_ENABLE = 0x80000000,
+	TPM_INTF_BURST_COUNT_STATIC = 0x100,
+	TPM_INTF_CMD_READY_INT = 0x080,
+	TPM_INTF_INT_EDGE_FALLING = 0x040,
+	TPM_INTF_INT_EDGE_RISING = 0x020,
+	TPM_INTF_INT_LEVEL_LOW = 0x010,
+	TPM_INTF_INT_LEVEL_HIGH = 0x008,
+	TPM_INTF_LOCALITY_CHANGE_INT = 0x004,
+	TPM_INTF_STS_VALID_INT = 0x002,
+	TPM_INTF_DATA_AVAIL_INT = 0x001,
+};
+
+#define TPM_ACCESS(l)                   (0x0000 | ((l) << 12))
+#define TPM_INT_ENABLE(l)               (0x0008 | ((l) << 12))
+#define TPM_STS(l)                      (0x0018 | ((l) << 12))
+#define TPM_DATA_FIFO(l)                (0x0024 | ((l) << 12))
+#define TPM_DID_VID(l)                  (0x0f00 | ((l) << 12))
+#define TPM_RID(l)                      (0x0f04 | ((l) << 12))
+#define TPM_INTF_CAPS(l)                (0x0014 | ((l) << 12))
+
 enum tpm_timeout {
 	TPM_TIMEOUT_MS			= 5,
 	TIS_SHORT_TIMEOUT_MS		= 750,
@@ -43,6 +110,7 @@ struct tpm_chip {
 	u8 rid;
 	unsigned long timeout_a, timeout_b, timeout_c, timeout_d;  /* msec */
 	ulong chip_type;
+	struct tpm_tis_phy_ops *phy_ops;
 };
 
 struct tpm_input_header {
@@ -130,4 +198,72 @@ enum tis_status {
 };
 #endif
 
+/**
+ * tpm_tis_open - Open the device and request locality 0
+ *
+ * @dev:  TPM device
+ *
+ * @return: 0 on success, negative on failure
+ */
+int tpm_tis_open(struct udevice *udev);
+/**
+ * tpm_tis_close - Close the device and release locality
+ *
+ * @dev:  TPM device
+ *
+ * @return: 0 on success, negative on failure
+ */
+int tpm_tis_close(struct udevice *udev);
+/** tpm_tis_cleanup - Get the device in ready state and release locality
+ *
+ * @dev:  TPM device
+ *
+ * @return: always 0
+ */
+int tpm_tis_cleanup(struct udevice *udev);
+/**
+ * tpm_tis_send - send data to the device
+ *
+ * @dev:  TPM device
+ * @buf:  buffer to send
+ * @len:  size of the buffer
+ *
+ * @return: number of bytes sent or negative on failure
+ */
+int tpm_tis_send(struct udevice *udev, const u8 *buf, size_t len);
+/**
+ * tpm_tis_recv_data - Receive data from a device. Wrapper for tpm_tis_recv
+ *
+ * @dev:  TPM device
+ * @buf:  buffer to copy data
+ * @size: buffer size
+ *
+ * @return: bytes read or negative on failure
+ */
+int tpm_tis_recv(struct udevice *udev, u8 *buf, size_t count);
+/**
+ * tpm_tis_get_desc - Get the TPM description
+ *
+ * @dev:  TPM device
+ * @buf:  buffer to fill data
+ * @size: buffer size
+ *
+ * @return: Number of characters written (or would have been written) in buffer
+ */
+int tpm_tis_get_desc(struct udevice *udev, char *buf, int size);
+/**
+ * tpm_tis_init - inititalize the device
+ *
+ * @dev:  TPM device
+ *
+ * @return: 0 on success, negative on failure
+ */
+int tpm_tis_init(struct udevice *udev);
+/**
+ * tpm_tis_ops_register - register the PHY ops for the device
+ *
+ * @dev: TPM device
+ * @ops: tpm_tis_phy_ops ops for the device
+ */
+void tpm_tis_ops_register(struct udevice *udev, struct tpm_tis_phy_ops *ops);
 #endif
diff --git a/include/tpm-v2.h b/include/tpm-v2.h
index d53d2e4023..b65f2ce55a 100644
--- a/include/tpm-v2.h
+++ b/include/tpm-v2.h
@@ -184,6 +184,7 @@ enum {
 	TPM_STS_DATA_EXPECT		= 1 << 3,
 	TPM_STS_SELF_TEST_DONE		= 1 << 2,
 	TPM_STS_RESPONSE_RETRY		= 1 << 1,
+	TPM_STS_READ_ZERO               = 0x23
 };
 
 enum {
-- 
2.27.0

