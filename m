Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D589246DBEF
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:19:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8RmS5KPhz307j
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:19:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UPf2Zinc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UPf2Zinc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RlL5glmz2ywX
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:18:06 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JBnc3032057; 
 Wed, 8 Dec 2021 19:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lypwGfiJPdICNdslIqJAD/ffK39CXB247aCc4sIoUK4=;
 b=UPf2ZincqYRvMAAMLT6xBxKUjwCUq8hRNVms1aPoROHuyQ4S8JMQPyWTwuAHaIyTZ689
 UcrHxSuH+eC0m/qntkCOunSeBkYUeeEBIsXxb7RP1rw6ACiSv6sXtcwTk8l7Ii/xoKUc
 EEkvxnpdHAjMvqJ7XnK6eVYDJHKS6HEXdLrMQwrK95cQY8u/cExPSFD66Ojv1Z13zVmy
 /UokiHsRLWma9PtBaLypTga/XvilkCzvSB6/XBrvmCy6Cfh0bEKyyHOB2UD32FsbuWC5
 8GWteDqYPxv/3+OSM8kCq0FD+RvmLqplKp2wPY1nzI+rvPvHwPuRDAU+qIhQ+LxPJCf1 CQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu2n8036k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDsps003130;
 Wed, 8 Dec 2021 19:18:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3cqyycv5f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JI0p932571694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 19:18:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF550B206C;
 Wed,  8 Dec 2021 19:18:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34FBCB2075;
 Wed,  8 Dec 2021 19:18:00 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.84.65])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 19:18:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 1/7] tpm_tis: Fix expected bit handling
Date: Wed,  8 Dec 2021 13:17:52 -0600
Message-Id: <20211208191758.20517-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211208191758.20517-1-eajames@linux.ibm.com>
References: <20211208191758.20517-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5S3GHDVBZRma1NGxiazUFNWeZJQwnN0T
X-Proofpoint-ORIG-GUID: 5S3GHDVBZRma1NGxiazUFNWeZJQwnN0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently, the driver polls the TPM_STS.stsValid field until TRUE; then it
reads TPM_STS register again to verify only that TPM_STS.expect field is
FALSE (i.e., it ignores TPM_STS.stsValid).
Since TPM_STS.stsValid represents the TPM_STS.expect validity, a check of
only one of these fields is wrong. Fix this condition so that both fields
are checked in the same TPM_STS register read.

Modify the signature of wait_for_tpm_stat() to tpm_tis_wait_for_stat(),
adding an additional "expected" parameter to its call.
tpm_tis_wait_for_stat() is now polling the TPM_STS with a mask and waits
for the value in "expected". This modification adds the ability to check if
certain TPM_STS bits have been cleared.
For example, use the new parameter to check in status that TPM_STS_VALID
is set and also that TPM_STS_EXPECT is zeroed. This prevents a racy
check.

Suggested-by: Benoit Houyere <benoit.houyere@st.com>
Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_tis_core.c | 61 +++++++++++++++------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index b2659a4c4016..adb086b6df7c 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -44,9 +44,9 @@ static bool wait_for_tpm_stat_cond(struct tpm_chip *chip, u8 mask,
 	return false;
 }
 
-static int wait_for_tpm_stat(struct tpm_chip *chip, u8 mask,
-		unsigned long timeout, wait_queue_head_t *queue,
-		bool check_cancel)
+static int tpm_tis_wait_for_stat(struct tpm_chip *chip, u8 mask, u8 expected,
+				 unsigned long timeout,
+				 wait_queue_head_t *queue, bool check_cancel)
 {
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 	unsigned long stop;
@@ -56,7 +56,7 @@ static int wait_for_tpm_stat(struct tpm_chip *chip, u8 mask,
 
 	/* check current status */
 	status = chip->ops->status(chip);
-	if ((status & mask) == mask)
+	if ((status & mask) == expected)
 		return 0;
 
 	stop = jiffies + timeout;
@@ -84,7 +84,7 @@ static int wait_for_tpm_stat(struct tpm_chip *chip, u8 mask,
 			usleep_range(priv->timeout_min,
 				     priv->timeout_max);
 			status = chip->ops->status(chip);
-			if ((status & mask) == mask)
+			if ((status & mask) == expected)
 				return 0;
 		} while (time_before(jiffies, stop));
 	}
@@ -260,10 +260,11 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	int size = 0, burstcnt, rc;
 
 	while (size < count) {
-		rc = wait_for_tpm_stat(chip,
-				 TPM_STS_DATA_AVAIL | TPM_STS_VALID,
-				 chip->timeout_c,
-				 &priv->read_queue, true);
+		rc = tpm_tis_wait_for_stat(chip,
+					   TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+					   TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+					   chip->timeout_c, &priv->read_queue,
+					   true);
 		if (rc < 0)
 			return rc;
 		burstcnt = get_burstcount(chip);
@@ -316,8 +317,9 @@ static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 		goto out;
 	}
 
-	if (wait_for_tpm_stat(chip, TPM_STS_VALID, chip->timeout_c,
-				&priv->int_queue, false) < 0) {
+	if (tpm_tis_wait_for_stat(chip, TPM_STS_VALID, TPM_STS_VALID,
+				  chip->timeout_c, &priv->int_queue,
+				  false) < 0) {
 		size = -ETIME;
 		goto out;
 	}
@@ -343,14 +345,14 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 	int rc, status, burstcnt;
 	size_t count = 0;
-	bool itpm = priv->flags & TPM_TIS_ITPM_WORKAROUND;
 
 	status = tpm_tis_status(chip);
 	if ((status & TPM_STS_COMMAND_READY) == 0) {
 		tpm_tis_ready(chip);
-		if (wait_for_tpm_stat
-		    (chip, TPM_STS_COMMAND_READY, chip->timeout_b,
-		     &priv->int_queue, false) < 0) {
+		if (tpm_tis_wait_for_stat(chip, TPM_STS_COMMAND_READY,
+					  TPM_STS_COMMAND_READY,
+					  chip->timeout_b, &priv->int_queue,
+					  false) < 0) {
 			rc = -ETIME;
 			goto out_err;
 		}
@@ -370,34 +372,24 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 			goto out_err;
 
 		count += burstcnt;
-
-		if (wait_for_tpm_stat(chip, TPM_STS_VALID, chip->timeout_c,
-					&priv->int_queue, false) < 0) {
+		if (tpm_tis_wait_for_stat(chip, TPM_STS_VALID | TPM_STS_DATA_EXPECT,
+					  TPM_STS_VALID | TPM_STS_DATA_EXPECT, chip->timeout_a,
+					  &priv->int_queue, false) < 0) {
 			rc = -ETIME;
 			goto out_err;
 		}
-		status = tpm_tis_status(chip);
-		if (!itpm && (status & TPM_STS_DATA_EXPECT) == 0) {
-			rc = -EIO;
-			goto out_err;
-		}
 	}
 
 	/* write last byte */
 	rc = tpm_tis_write8(priv, TPM_DATA_FIFO(priv->locality), buf[count]);
 	if (rc < 0)
 		goto out_err;
-
-	if (wait_for_tpm_stat(chip, TPM_STS_VALID, chip->timeout_c,
-				&priv->int_queue, false) < 0) {
+	if (tpm_tis_wait_for_stat(chip, TPM_STS_VALID | TPM_STS_DATA_EXPECT,
+				  TPM_STS_VALID, chip->timeout_a,
+				  &priv->int_queue, false) < 0) {
 		rc = -ETIME;
 		goto out_err;
 	}
-	status = tpm_tis_status(chip);
-	if (!itpm && (status & TPM_STS_DATA_EXPECT) != 0) {
-		rc = -EIO;
-		goto out_err;
-	}
 
 	return 0;
 
@@ -452,9 +444,10 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
 		ordinal = be32_to_cpu(*((__be32 *) (buf + 6)));
 
 		dur = tpm_calc_ordinal_duration(chip, ordinal);
-		if (wait_for_tpm_stat
-		    (chip, TPM_STS_DATA_AVAIL | TPM_STS_VALID, dur,
-		     &priv->read_queue, false) < 0) {
+		if (tpm_tis_wait_for_stat(chip,
+					  TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+					  TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+					  dur, &priv->read_queue, false) < 0) {
 			rc = -ETIME;
 			goto out_err;
 		}
-- 
2.27.0

