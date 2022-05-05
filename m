Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2951CAA5
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 22:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvQMq1lSRz3bw6
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 06:31:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9+4CmFQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O9+4CmFQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQJX73VSz3bxZ
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 06:28:44 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Jvqic006888;
 Thu, 5 May 2022 20:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OOOv4ue+LyX7OeqCQzeV+bxb+QRny7+JLJzBiKwgAz0=;
 b=O9+4CmFQSiI8qcME/J9MSQevEuRvD2oqX9lT/7bfMv/lm6vtbqnUlLXUWSdjJZ/Arspe
 mflNcW0Nj/loc84NowCTYtCcpwtjSoF1mHHR1/Rv+GWianhPnMsGgDXNmanDYQqDn5mA
 rd3byRBWLwdCEciYCjE2PUpO8TEr48KT7OF8QbjucJ7YFfljg0iih8UvtEmbwPIPefzS
 duD9QK/ofFZ5P34hZhjYxsIxHROYTJsk7IbVFW4EahmRn7WIycrjQKzVYk3VORNl6WWX
 yB911rkwTZhOBRl1p/tlX/9swTScc8yCpTp6EVBAK78oHoP9KNcea649TVFIbbI5mLRp 9w== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvn6w0k18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:38 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245KMU7h000675;
 Thu, 5 May 2022 20:28:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3frvramw8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:37 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245KSa5e22217008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 20:28:36 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C212136063;
 Thu,  5 May 2022 20:28:36 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ACE1136059;
 Thu,  5 May 2022 20:28:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.0.208])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/5] tpm: Add I2C driver for
 TPMv2 devices
Date: Thu,  5 May 2022 15:28:26 -0500
Message-Id: <20220505202829.31466-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220505202829.31466-1-eajames@linux.ibm.com>
References: <20220505202829.31466-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ugY13GZxV2xTYCHHq_YY_8jB-NbbGY7K
X-Proofpoint-ORIG-GUID: ugY13GZxV2xTYCHHq_YY_8jB-NbbGY7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_08,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050132
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a driver to communicate with TPMv2 chips over I2C, such
as the NPCT75X.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/tpm/Kconfig        |   9 +
 drivers/tpm/Makefile       |   1 +
 drivers/tpm/tpm2_tis_i2c.c | 593 +++++++++++++++++++++++++++++++++++++
 3 files changed, 603 insertions(+)
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
index 94c337b8ed..220f03253c 100644
--- a/drivers/tpm/Makefile
+++ b/drivers/tpm/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_TPM_ST33ZP24_SPI) += tpm_tis_st33zp24_spi.o
 
 obj-$(CONFIG_TPM2_TIS_SANDBOX) += tpm2_tis_sandbox.o
 obj-$(CONFIG_TPM2_TIS_SPI) += tpm2_tis_spi.o
+obj-$(CONFIG_TPM2_TIS_I2C) += tpm2_tis_i2c.o
diff --git a/drivers/tpm/tpm2_tis_i2c.c b/drivers/tpm/tpm2_tis_i2c.c
new file mode 100644
index 0000000000..5fab9122e6
--- /dev/null
+++ b/drivers/tpm/tpm2_tis_i2c.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <common.h>
+#include <dm.h>
+#include <fdtdec.h>
+#include <i2c.h>
+#include <tpm-v1.h>
+#include <linux/errno.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/unaligned/be_byteshift.h>
+
+#include "tpm_tis.h"
+#include "tpm_internal.h"
+
+enum i2c_chip_type {
+	NPCT75X,
+	UNKNOWN,
+};
+
+/* expected value for DIDVID register */
+#define TPM2_TIS_I2C_DID_VID_NPCT75X 0x5010FC00L
+
+static const char * const chip_name[] = {
+	[NPCT75X] = "npct75X",
+	[UNKNOWN] = "unknown/fallback to npct75X",
+};
+
+#define TPM_LOC_SEL		0x00
+#define	TPM_ACCESS		0x04
+#define	TPM_STS			0x18
+#define	TPM_DATA_FIFO		0x24
+#define	TPM_DID_VID		0x48
+
+/*
+ * tpm2_tis_i2c_read() - read from TPM register
+ * @addr: register address to read from
+ * @buffer: provided by caller
+ * @len: number of bytes to read
+ *
+ * Read len bytes from TPM register and put them into
+ * buffer (little-endian format, i.e. first byte is put into buffer[0]).
+ *
+ * NOTE: TPM is big-endian for multi-byte values. Multi-byte
+ * values have to be swapped.
+ *
+ * Return -EIO on error, 0 on success.
+ */
+static int tpm2_tis_i2c_read(struct udevice *dev, u8 addr, u8 *buffer,
+			     size_t len)
+{
+	int rc;
+	int count;
+
+	for (count = 0; count < MAX_COUNT; count++) {
+		rc = dm_i2c_read(dev, addr, buffer, len);
+		if (rc == 0) {
+			debug("read addr[%02x] len[%u] data[%02x %02x %02x %02x%s]\n", addr, len, len > 0 ? buffer[0] : 0, len > 1 ? buffer[1] : 0, len > 2 ? buffer[2] : 0, len > 3 ? buffer[3] : 0, len > 4 ? " ..." : "");
+			break;  /* break here to skip sleep */
+		}
+		udelay(SLEEP_DURATION_US);
+	}
+
+	/* Take care of 'guard time' */
+	udelay(SLEEP_DURATION_US);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int tpm2_tis_i2c_write_generic(struct udevice *dev, u8 addr,
+				      const u8 *buffer, size_t len,
+				      unsigned int sleep_time_us, u8 max_count)
+{
+	int rc = 0;
+	int count;
+
+	for (count = 0; count < max_count; count++) {
+		rc = dm_i2c_write(dev, addr, buffer, len);
+		if (rc == 0) {
+			debug("write addr[%02x] len[%u] data[%02x %02x %02x %02x%s]\n", addr, len, len > 0 ? buffer[0] : 0, len > 1 ? buffer[1] : 0, len > 2 ? buffer[2] : 0, len > 3 ? buffer[3] : 0, len > 4 ? " ..." : "");
+			break;  /* Success, break to skip sleep */
+		}
+		udelay(sleep_time_us);
+	}
+
+	/* take care of 'guard time' */
+	udelay(sleep_time_us);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/*
+ * tpm2_tis_i2c_write() - write to TPM register
+ * @addr: register address to write to
+ * @buffer: containing data to be written
+ * @len: number of bytes to write
+ *
+ * Write len bytes from provided buffer to TPM register (little
+ * endian format, i.e. buffer[0] is written as first byte).
+ *
+ * NOTE: TPM is big-endian for multi-byte values. Multi-byte
+ * values have to be swapped.
+ *
+ * NOTE: use this function instead of the tpm2_tis_i2c_write_generic function.
+ *
+ * Return -EIO on error, 0 on success
+ */
+static int tpm2_tis_i2c_write(struct udevice *dev, u8 addr, const u8 *buffer,
+			      size_t len)
+{
+	return tpm2_tis_i2c_write_generic(dev, addr, buffer, len,
+					  SLEEP_DURATION_US, MAX_COUNT);
+}
+
+/*
+ * This function is needed especially for the cleanup situation after
+ * sending TPM_READY
+ */
+static int tpm2_tis_i2c_write_long(struct udevice *dev, u8 addr, u8 *buffer,
+				   size_t len)
+{
+	return tpm2_tis_i2c_write_generic(dev, addr, buffer, len,
+					  SLEEP_DURATION_LONG_US,
+					  MAX_COUNT_LONG);
+}
+
+static int tpm2_tis_i2c_check_locality(struct udevice *dev, int loc)
+{
+	const u8 mask = TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID;
+	struct tpm_chip *chip = dev_get_priv(dev);
+	u8 buf;
+	int rc;
+
+	buf = loc;
+	rc = tpm2_tis_i2c_write(dev, TPM_LOC_SEL, &buf, 1);
+	if (rc < 0)
+		return rc;
+
+	rc = tpm2_tis_i2c_read(dev, TPM_ACCESS, &buf, 1);
+	if (rc < 0)
+		return rc;
+
+	if ((buf & mask) == mask) {
+		chip->locality = loc;
+		return loc;
+	}
+
+	return -ENOENT;
+}
+
+static void tpm2_tis_i2c_release_locality(struct udevice *dev, int loc,
+					 int force)
+{
+	const u8 mask = TPM_ACCESS_REQUEST_PENDING | TPM_ACCESS_VALID;
+	u8 buf;
+
+	buf = loc;
+	if (tpm2_tis_i2c_write(dev, TPM_LOC_SEL, &buf, 1) < 0)
+		return;
+
+	if (tpm2_tis_i2c_read(dev, TPM_ACCESS, &buf, 1) < 0)
+		return;
+
+	if (force || (buf & mask) == mask) {
+		buf = TPM_ACCESS_ACTIVE_LOCALITY;
+		tpm2_tis_i2c_write(dev, TPM_ACCESS, &buf, 1);
+	}
+}
+
+static int tpm2_tis_i2c_request_locality(struct udevice *dev, int loc)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	unsigned long start, stop;
+	u8 buf = 0;
+	int rc;
+
+	rc = tpm2_tis_i2c_check_locality(dev, loc);
+	if (rc >= 0) {
+		debug("%s: Already have locality\n", __func__);
+		return loc;  /* We already have the locality */
+	} else if (rc != -ENOENT) {
+		debug("%s: Failed to get locality: %d\n", __func__, rc);
+		return rc;
+	}
+
+	buf = loc;
+	rc = tpm2_tis_i2c_write(dev, TPM_LOC_SEL, &buf, 1);
+	if (rc) {
+		debug("%s: Failed to write to TPM: %d\n", __func__, rc);
+		return rc;
+	}
+
+	buf = TPM_ACCESS_REQUEST_USE;
+	rc = tpm2_tis_i2c_write(dev, TPM_ACCESS, &buf, 1);
+	if (rc) {
+		debug("%s: Failed to write to TPM: %d\n", __func__, rc);
+		return rc;
+	}
+
+	/* Wait for burstcount */
+	start = get_timer(0);
+	stop = chip->timeout_a;
+	do {
+		rc = tpm2_tis_i2c_check_locality(dev, loc);
+		if (rc >= 0) {
+			debug("%s: Have locality\n", __func__);
+			return loc;
+		} else if (rc != -ENOENT) {
+			debug("%s: Failed to get locality: %d\n", __func__, rc);
+			return rc;
+		}
+		mdelay(TPM_TIMEOUT_MS);
+	} while (get_timer(start) < stop);
+	debug("%s: Timeout getting locality: %d\n", __func__, rc);
+
+	return rc;
+}
+
+static u8 tpm2_tis_i2c_status(struct udevice *dev)
+{
+	/* NOTE: Since i2c read may fail, return 0 in this case --> time-out */
+	u8 buf;
+
+	if (tpm2_tis_i2c_read(dev, TPM_STS, &buf, 1) < 0)
+		return 0;
+	else
+		return buf;
+}
+
+static int tpm2_tis_i2c_ready(struct udevice *dev)
+{
+	int rc;
+
+	/* This causes the current command to be aborted */
+	u8 buf = TPM_STS_COMMAND_READY;
+
+	debug("%s\n", __func__);
+	rc = tpm2_tis_i2c_write_long(dev, TPM_STS, &buf, 1);
+	if (rc)
+		debug("%s: rc=%d\n", __func__, rc);
+
+	return rc;
+}
+
+static ssize_t tpm2_tis_i2c_get_burstcount(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	unsigned long start, stop;
+	ssize_t burstcnt;
+	u8 addr, buf[3];
+
+	/* Wait for burstcount */
+	/* XXX: Which timeout value? Spec has 2 answers (c & d) */
+	start = get_timer(0);
+	stop = chip->timeout_d;
+	do {
+		/* Note: STS is little endian */
+		addr = TPM_STS + 1;
+		if (tpm2_tis_i2c_read(dev, addr, buf, 2) < 0)
+			burstcnt = 0;
+		else
+			burstcnt = (buf[1] << 8) + buf[0];
+
+		if (burstcnt)
+			return burstcnt;
+		mdelay(TPM_TIMEOUT_MS);
+	} while (get_timer(start) < stop);
+
+	return -EBUSY;
+}
+
+static int tpm2_tis_i2c_wait_for_stat(struct udevice *dev, u8 mask,
+				      unsigned long timeout, int *status)
+{
+	unsigned long start, stop;
+
+	/* Check current status */
+	*status = tpm2_tis_i2c_status(dev);
+	if ((*status & mask) == mask)
+		return 0;
+
+	start = get_timer(0);
+	stop = timeout;
+	do {
+		mdelay(TPM_TIMEOUT_MS);
+		*status = tpm2_tis_i2c_status(dev);
+		if ((*status & mask) == mask)
+			return 0;
+	} while (get_timer(start) < stop);
+
+	return -ETIMEDOUT;
+}
+
+static int tpm2_tis_i2c_recv_data(struct udevice *dev, u8 *buf, size_t count)
+{
+	size_t size = 0;
+	ssize_t burstcnt;
+	int rc;
+
+	while (size < count) {
+		burstcnt = tpm2_tis_i2c_get_burstcount(dev);
+
+		/* burstcount < 0 -> tpm is busy */
+		if (burstcnt < 0)
+			return burstcnt;
+
+		/* Limit received data to max left */
+		if (burstcnt > (count - size))
+			burstcnt = count - size;
+
+		rc = tpm2_tis_i2c_read(dev, TPM_DATA_FIFO,
+				       &(buf[size]), burstcnt);
+		if (rc == 0)
+			size += burstcnt;
+	}
+
+	return size;
+}
+
+static int tpm2_tis_i2c_recv(struct udevice *dev, u8 *buf, size_t count)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int size = 0;
+	int status;
+	unsigned int expected;
+	int rc;
+
+	status = tpm2_tis_i2c_status(dev);
+	if (status == TPM_STS_COMMAND_READY)
+		return -EINTR;
+	if ((status & (TPM_STS_DATA_AVAIL | TPM_STS_VALID)) !=
+	    (TPM_STS_DATA_AVAIL | TPM_STS_VALID))
+		return -EAGAIN;
+
+	debug("...got it;\n");
+
+	/* Read first 10 bytes, including tag, paramsize, and result */
+	size = tpm2_tis_i2c_recv_data(dev, buf, TPM_HEADER_SIZE);
+	if (size < TPM_HEADER_SIZE) {
+		debug("Unable to read header\n");
+		return size < 0 ? size : -EIO;
+	}
+
+	expected = get_unaligned_be32(buf + TPM_RSP_SIZE_BYTE);
+	if ((size_t)expected > count || (size_t)expected < TPM_HEADER_SIZE) {
+		debug("Error size=%x, expected=%x, count=%x\n", size, expected,
+		      count);
+		return -ENOSPC;
+	}
+
+	size += tpm2_tis_i2c_recv_data(dev, &buf[TPM_HEADER_SIZE],
+				       expected - TPM_HEADER_SIZE);
+	if (size < expected) {
+		debug("Unable to read remainder of result\n");
+		return -ETIMEDOUT;
+	}
+
+	rc = tpm2_tis_i2c_wait_for_stat(dev, TPM_STS_VALID, chip->timeout_c,
+					&status);
+	if (rc)
+		return rc;
+	if (status & TPM_STS_DATA_AVAIL) {  /* Retry? */
+		debug("Error left over data\n");
+		return -EIO;
+	}
+
+	return size;
+}
+
+static int tpm2_tis_i2c_send(struct udevice *dev, const u8 *buf, size_t len)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int rc, status;
+	size_t burstcnt;
+	size_t count = 0;
+	int retry = 0;
+	u8 sts = TPM_STS_GO;
+
+	debug("%s: len=%d\n", __func__, len);
+	if (len > TPM_DEV_BUFSIZE)
+		return -E2BIG;  /* Command is too long for our tpm, sorry */
+
+	if (tpm2_tis_i2c_request_locality(dev, 0) < 0)
+		return -EBUSY;
+
+	status = tpm2_tis_i2c_status(dev);
+	if ((status & TPM_STS_COMMAND_READY) == 0) {
+		rc = tpm2_tis_i2c_ready(dev);
+		if (rc)
+			return rc;
+		rc = tpm2_tis_i2c_wait_for_stat(dev, TPM_STS_COMMAND_READY,
+						chip->timeout_b, &status);
+		if (rc)
+			return rc;
+	}
+
+	burstcnt = tpm2_tis_i2c_get_burstcount(dev);
+
+	/* burstcount < 0 -> tpm is busy */
+	if (burstcnt < 0)
+		return burstcnt;
+
+	while (count < len) {
+		udelay(300);
+		if (burstcnt > len - count)
+			burstcnt = len - count;
+
+#ifdef CONFIG_TPM2_TIS_I2C_BURST_LIMITATION
+		if (retry && burstcnt > CONFIG_TPM2_TIS_I2C_BURST_LIMITATION_LEN)
+			burstcnt = CONFIG_TPM2_TIS_I2C_BURST_LIMITATION_LEN;
+#endif /* CONFIG_TPM2_TIS_I2C_BURST_LIMITATION */
+
+		rc = tpm2_tis_i2c_write(dev, TPM_DATA_FIFO,
+					&(buf[count]), burstcnt);
+		if (rc == 0)
+			count += burstcnt;
+		else {
+			debug("%s: error\n", __func__);
+			if (retry++ > 10)
+				return -EIO;
+			rc = tpm2_tis_i2c_wait_for_stat(dev, TPM_STS_VALID,
+							chip->timeout_c,
+							&status);
+			if (rc)
+				return rc;
+
+			if ((status & TPM_STS_DATA_EXPECT) == 0)
+				return -EIO;
+		}
+	}
+
+	/* Go and do it */
+	rc = tpm2_tis_i2c_write(dev, TPM_STS, &sts, 1);
+	if (rc < 0)
+		return rc;
+	debug("%s: done, rc=%d\n", __func__, rc);
+
+	return len;
+}
+
+static int tpm2_tis_i2c_cleanup(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	tpm2_tis_i2c_ready(dev);
+	/*
+	 * The TPM needs some time to clean up here,
+	 * so we sleep rather than keeping the bus busy
+	 */
+	mdelay(2);
+	tpm2_tis_i2c_release_locality(dev, chip->locality, 0);
+
+	return 0;
+}
+
+static int tpm2_tis_i2c_init(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	u32 vendor;
+	u32 expected_did_vid;
+	int rc;
+
+	chip->is_open = 1;
+
+	/* Default timeouts - these could move to the device tree */
+	chip->timeout_a = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_b = TIS_LONG_TIMEOUT_MS;
+	chip->timeout_c = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_d = TIS_SHORT_TIMEOUT_MS;
+
+	rc = tpm2_tis_i2c_request_locality(dev, 0);
+	if (rc < 0)
+		return rc;
+
+	/* Read four bytes from DID_VID register */
+	if (tpm2_tis_i2c_read(dev, TPM_DID_VID, (uchar *)&vendor, 4) < 0) {
+		tpm2_tis_i2c_release_locality(dev, 0, 1);
+		return -EIO;
+	}
+
+	if (chip->chip_type == NPCT75X) {
+		vendor = be32_to_cpu(vendor);
+		expected_did_vid = TPM2_TIS_I2C_DID_VID_NPCT75X;
+	}
+
+	if (chip->chip_type != UNKNOWN && vendor != expected_did_vid) {
+		pr_err("Vendor id did not match! ID was %08x\n", vendor);
+		return -ENODEV;
+	}
+
+	chip->vend_dev = vendor;
+	debug("2.0 TPM (chip type %s device-id 0x%X)\n",
+	      chip_name[chip->chip_type], vendor >> 16);
+
+	/*
+	 * A timeout query to TPM can be placed here.
+	 * Standard timeout values are used so far
+	 */
+
+	return 0;
+}
+
+static int tpm2_tis_i2c_open(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+	int rc;
+
+	debug("%s: start\n", __func__);
+	if (chip->is_open)
+		return -EBUSY;
+	rc = tpm2_tis_i2c_init(dev);
+	if (rc < 0)
+		chip->is_open = 0;
+
+	return rc;
+}
+
+static int tpm2_tis_i2c_close(struct udevice *dev)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	if (chip->is_open) {
+		tpm2_tis_i2c_release_locality(dev, chip->locality, 1);
+		chip->is_open = 0;
+		chip->vend_dev = 0;
+	}
+
+	return 0;
+}
+
+static int tpm2_tis_get_desc(struct udevice *dev, char *buf, int size)
+{
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	if (size < 50)
+		return -ENOSPC;
+
+	return snprintf(buf, size, "2.0 TPM (%s, chip type %s device-id 0x%x)",
+			chip->is_open ? "open" : "closed",
+			chip_name[chip->chip_type],
+			chip->vend_dev >> 16);
+}
+
+static int tpm2_tis_i2c_probe(struct udevice *dev)
+{
+	struct tpm_chip_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct tpm_chip *chip = dev_get_priv(dev);
+
+	chip->chip_type = dev_get_driver_data(dev);
+	chip->locality = 0;
+	chip->timeout_a = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_b = TIS_LONG_TIMEOUT_MS;
+	chip->timeout_c = TIS_SHORT_TIMEOUT_MS;
+	chip->timeout_d = TIS_SHORT_TIMEOUT_MS;
+
+	/* TODO: These need to be checked and tuned */
+	uc_priv->duration_ms[TPM_SHORT] = TIS_SHORT_TIMEOUT_MS;
+	uc_priv->duration_ms[TPM_MEDIUM] = TIS_LONG_TIMEOUT_MS;
+	uc_priv->duration_ms[TPM_LONG] = TIS_LONG_TIMEOUT_MS;
+	uc_priv->retry_time_ms = TPM_TIMEOUT_MS;
+	uc_priv->pcr_count = 24;
+	uc_priv->pcr_select_min = 3;
+	uc_priv->version = TPM_V2;
+
+	return 0;
+}
+
+static const struct tpm_ops tpm2_tis_i2c_ops = {
+	.open		= tpm2_tis_i2c_open,
+	.close		= tpm2_tis_i2c_close,
+	.get_desc	= tpm2_tis_get_desc,
+	.send		= tpm2_tis_i2c_send,
+	.recv		= tpm2_tis_i2c_recv,
+	.cleanup	= tpm2_tis_i2c_cleanup,
+};
+
+static const struct udevice_id tpm2_tis_i2c_ids[] = {
+	{ .compatible = "nuvoton,npct75x", .data = NPCT75X },
+	{ }
+};
+
+U_BOOT_DRIVER(tpm2_tis_i2c) = {
+	.name   = "tpm2_tis_i2c",
+	.id     = UCLASS_TPM,
+	.of_match = tpm2_tis_i2c_ids,
+	.ops    = &tpm2_tis_i2c_ops,
+	.probe	= tpm2_tis_i2c_probe,
+	.priv_auto_alloc_size = sizeof(struct tpm_chip),
+};
-- 
2.27.0

