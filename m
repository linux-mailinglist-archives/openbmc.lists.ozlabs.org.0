Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8122F7F49
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 16:18:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHPvG0XbBzDsXX
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 02:18:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=imzwgcAU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHPlr5kfnzDsgJ
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 02:11:36 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FF1nCL191345; Fri, 15 Jan 2021 10:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=POp1HH9geZBUA3gUTDx48bb6ZsLeFbaFJz6tzywCOa0=;
 b=imzwgcAUcSQprVMlk7gTDINGv7DNmBA0d4oFgcRb8oO5492Z+PM+8oHigeLFFZOSUfwe
 V0QQbhNtxHHAZRIVIvyc+NspnmkUzDgX4jV6ivzHj3RwBeiDeJcLponq8lutTxNa/xnb
 xmLFFeRJrKreiiunTaFcHCUH44r0WccdcWm2QftOACA8GdF/OwZIk64mxX6GJspctNC7
 LZG/pN09V8CbYS9Arfr5ysw5hQA2Lwfx4IpVpQnSbE+iWyO1av5f3++KvuHBgy0YCPR2
 HJSlimGc77/n9swgnd+Wx17KkKXobJQ5QdOXVIWasvoylj00oYln+POxH8+itl6DsjW+ QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363cnaskvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:32 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FF2Cbx196192;
 Fri, 15 Jan 2021 10:11:32 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363cnaskvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:32 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FF89V7010528;
 Fri, 15 Jan 2021 15:11:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 35y44a0sx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:11:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFBTDc23003572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:11:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11D0BE053;
 Fri, 15 Jan 2021 15:11:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 862BEBE056;
 Fri, 15 Jan 2021 15:11:28 +0000 (GMT)
Received: from klaus-virtual-ubuntu.aus.stglabs.ibm.com (unknown [9.80.230.10])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:11:28 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8 3/9] tpm: tpm_tis: Add retry in case of protocol
 failure.
Date: Fri, 15 Jan 2021 12:10:42 -0300
Message-Id: <20210115151048.15965-4-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
References: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150091
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
Cc: Amir Mizinski <amirmizi6@gmail.com>,
 Christophe Ricard <christophe-h.ricard@st.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Amir Mizinski <amirmizi6@gmail.com>

Added a retry mechanism on any protocol error when sending a command or
receiving a response. This was changed to comply with
the TCG PC Client Device Driver Design Principles for TPM 2.0.

When sending a command, a loop is added in "tpm_tis_send_main()" that calls
"tpm_tis_send_data()" and then issues a retry attempt if any error occurs.
When receiving a response, the following new function derived from
"tpm_tis_recv()" is added: "__tpm_tis_recv()". "tpm_tis_recv()" is modified
to call "__tpm_tis_recv()" in a loop. If any error occurs, a retry is
initiated by setting TPM_STS.responseRetry and "__tpm_tis_recv()" is
called again.
In both cases a retry is attempted up to "TPM_RETRY" times.

Co-developed-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
---
 drivers/char/tpm/tpm_tis_core.c | 62 +++++++++++++++++++++------------
 drivers/char/tpm/tpm_tis_core.h |  1 +
 2 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 83004fcc93ff..931240674579 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -305,29 +305,24 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	return size;
 }
 
-static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+static int __tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 {
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 	int size = 0;
 	int status;
 	u32 expected;
 
-	if (count < TPM_HEADER_SIZE) {
-		size = -EIO;
-		goto out;
-	}
-
 	size = recv_data(chip, buf, TPM_HEADER_SIZE);
 	/* read first 10 bytes, including tag, paramsize, and result */
 	if (size < TPM_HEADER_SIZE) {
 		dev_err(&chip->dev, "Unable to read header\n");
-		goto out;
+		return size;
 	}
 
 	expected = be32_to_cpu(*(__be32 *) (buf + 2));
 	if (expected > count || expected < TPM_HEADER_SIZE) {
 		size = -EIO;
-		goto out;
+		return size;
 	}
 
 	size += recv_data(chip, &buf[TPM_HEADER_SIZE],
@@ -335,22 +330,45 @@ static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	if (size < expected) {
 		dev_err(&chip->dev, "Unable to read remainder of result\n");
 		size = -ETIME;
-		goto out;
+		return size;
 	}
 
 	if (tpm_tis_wait_for_stat(chip, TPM_STS_VALID, TPM_STS_VALID,
 				  chip->timeout_c, &priv->int_queue,
 				  false) < 0) {
 		size = -ETIME;
-		goto out;
+		return size;
 	}
+
 	status = tpm_tis_status(chip);
 	if (status & TPM_STS_DATA_AVAIL) {	/* retry? */
 		dev_err(&chip->dev, "Error left over data\n");
+		size = -EIO;
+		return size;
+	}
+
+	return size;
+}
+
+static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
+	int size;
+	int i;
+
+	if (count < TPM_HEADER_SIZE) {
 		size = -EIO;
 		goto out;
 	}
 
+	for (i = 0; i < TPM_RETRY; i++) {
+		size = __tpm_tis_recv(chip, buf, count);
+		if (size <= 0)
+			tpm_tis_write8(priv, TPM_STS(priv->locality),
+				       TPM_STS_RESPONSE_RETRY);
+		else
+			goto out;
+	}
 out:
 	tpm_tis_ready(chip);
 	return size;
@@ -375,7 +393,7 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 					  chip->timeout_b, &priv->int_queue,
 					  false) < 0) {
 			rc = -ETIME;
-			goto out_err;
+			return rc;
 		}
 	}
 
@@ -384,13 +402,13 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 		if (burstcnt < 0) {
 			dev_err(&chip->dev, "Unable to read burstcount\n");
 			rc = burstcnt;
-			goto out_err;
+			return rc;
 		}
 		burstcnt = min_t(int, burstcnt, len - count);
 		rc = tpm_tis_write_bytes(priv, TPM_DATA_FIFO(priv->locality),
 					 burstcnt, buf + count);
 		if (rc < 0)
-			goto out_err;
+			return rc;
 
 		count += burstcnt;
 	}
@@ -398,14 +416,10 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 				  TPM_STS_VALID, chip->timeout_a,
 				  &priv->int_queue, false) < 0) {
 		rc = -ETIME;
-		goto out_err;
+		return rc;
 	}
 
 	return 0;
-
-out_err:
-	tpm_tis_ready(chip);
-	return rc;
 }
 
 static void disable_interrupts(struct tpm_chip *chip)
@@ -437,13 +451,17 @@ static void disable_interrupts(struct tpm_chip *chip)
 static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
 {
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
-	int rc;
+	int rc, i;
 	u32 ordinal;
 	unsigned long dur;
 
-	rc = tpm_tis_send_data(chip, buf, len);
-	if (rc < 0)
-		return rc;
+	for (i = 0; i < TPM_RETRY; i++) {
+		rc = tpm_tis_send_data(chip, buf, len);
+		if (rc >= 0)
+			break;
+	}
+	if (i == TPM_RETRY)
+		goto out_err;
 
 	/* go and do it */
 	rc = tpm_tis_write8(priv, TPM_STS(priv->locality), TPM_STS_GO);
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index d06c65b63cf5..6cc6b761a095 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -34,6 +34,7 @@ enum tis_status {
 	TPM_STS_GO = 0x20,
 	TPM_STS_DATA_AVAIL = 0x10,
 	TPM_STS_DATA_EXPECT = 0x08,
+	TPM_STS_RESPONSE_RETRY = 0x02,
 };
 
 enum tis_int_flags {
-- 
2.20.1

