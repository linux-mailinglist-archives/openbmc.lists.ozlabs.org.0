Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F66BEA6D
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 14:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdQRg1F1Xz3cjN
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 00:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fjoKN/x0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fjoKN/x0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdQR116mGz2yWN;
	Sat, 18 Mar 2023 00:46:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HDBJUc002313;
	Fri, 17 Mar 2023 13:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PlqlzntpHLPj36p2Jm0RQSOWvLZkc6dnkzTHliS6Kio=;
 b=fjoKN/x0cFtimfoiwdi67tbUygQLc0G6XAO5KD/898VGLzTQCHAz/nXv8JqtlmO8qO/G
 tGF+aQvXZzSUP/ElP252+P3zvXnKk5cYKQH2kFhbENdrIX0gIKAYFGWd2hnaFTsQ3Q4V
 tSez2x+BmbXV2lzPgHKZvfSveckQSwPccPat9tp6ccgX3rrv6abFWTQYQvHMHU+d7cJG
 GFS4AKSLmsUDeaInuVP1m3bb0BIKg1nGDE5T3Wjkukw6PnWEqXNLNOeEBDA2XZBvrsJ2
 BRGS/XOKO4msIWR6pc+IULKLclGWrOzJ5pGivuaPD4KOdCVPGZNoxSXzfItjhObuxZ8W dg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcpq9cq3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 13:46:44 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32HCoaGl026757;
	Fri, 17 Mar 2023 13:46:43 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pbsa02w40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 13:46:43 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32HDkgQ038339032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Mar 2023 13:46:42 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 509655803F;
	Fri, 17 Mar 2023 13:46:42 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47BAE58066;
	Fri, 17 Mar 2023 13:46:41 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.25.240])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Mar 2023 13:46:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH] fsi: sbefifo: Add configurable in-command timeout
Date: Fri, 17 Mar 2023 08:46:38 -0500
Message-Id: <20230317134638.3128232-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w8Dqacc40-QrNOl2G9XG8wHKDOieIolH
X-Proofpoint-GUID: w8Dqacc40-QrNOl2G9XG8wHKDOieIolH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_08,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303170092
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A new use case for the SBEFIFO requires a long in-command timeout
as the SBE processes each part of the command before clearing the
upstream FIFO for the next part of the command. Add ioctl support
to configure this timeout in a similar way to the existing read
timeout.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 33 ++++++++++++++++++++++++++++++++-
 include/uapi/linux/fsi.h  | 10 ++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 9912b7a6a4b9..223486b3cfcb 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -127,6 +127,7 @@ struct sbefifo {
 	bool			dead;
 	bool			async_ffdc;
 	bool			timed_out;
+	u32			timeout_in_cmd_ms;
 	u32			timeout_start_rsp_ms;
 };
 
@@ -136,6 +137,7 @@ struct sbefifo_user {
 	void			*cmd_page;
 	void			*pending_cmd;
 	size_t			pending_len;
+	u32			cmd_timeout_ms;
 	u32			read_timeout_ms;
 };
 
@@ -508,7 +510,7 @@ static int sbefifo_send_command(struct sbefifo *sbefifo,
 		rc = sbefifo_wait(sbefifo, true, &status, timeout);
 		if (rc < 0)
 			return rc;
-		timeout = msecs_to_jiffies(SBEFIFO_TIMEOUT_IN_CMD);
+		timeout = msecs_to_jiffies(sbefifo->timeout_in_cmd_ms);
 
 		vacant = sbefifo_vacant(status);
 		len = chunk = min(vacant, remaining);
@@ -802,6 +804,7 @@ static int sbefifo_user_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 	}
 	mutex_init(&user->file_lock);
+	user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
 	user->read_timeout_ms = SBEFIFO_TIMEOUT_START_RSP;
 
 	return 0;
@@ -845,9 +848,11 @@ static ssize_t sbefifo_user_read(struct file *file, char __user *buf,
 	rc = mutex_lock_interruptible(&sbefifo->lock);
 	if (rc)
 		goto bail;
+	sbefifo->timeout_in_cmd_ms = user->cmd_timeout_ms;
 	sbefifo->timeout_start_rsp_ms = user->read_timeout_ms;
 	rc = __sbefifo_submit(sbefifo, user->pending_cmd, cmd_len, &resp_iter);
 	sbefifo->timeout_start_rsp_ms = SBEFIFO_TIMEOUT_START_RSP;
+	sbefifo->timeout_in_cmd_ms = SBEFIFO_TIMEOUT_IN_CMD;
 	mutex_unlock(&sbefifo->lock);
 	if (rc < 0)
 		goto bail;
@@ -937,6 +942,28 @@ static int sbefifo_user_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int sbefifo_cmd_timeout(struct sbefifo_user *user, void __user *argp)
+{
+	struct device *dev = &user->sbefifo->dev;
+	u32 timeout;
+
+	if (get_user(timeout, (__u32 __user *)argp))
+		return -EFAULT;
+
+	if (timeout == 0) {
+		user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
+		dev_dbg(dev, "Command timeout reset to %u\n", user->cmd_timeout_ms);
+		return 0;
+	}
+
+	if (timeout > 120)
+		return -EINVAL;
+
+	user->cmd_timeout_ms = timeout * 1000; /* user timeout is in sec */
+	dev_dbg(dev, "Command timeout set to %u\n", user->cmd_timeout_ms);
+	return 0;
+}
+
 static int sbefifo_read_timeout(struct sbefifo_user *user, void __user *argp)
 {
 	struct device *dev = &user->sbefifo->dev;
@@ -971,6 +998,9 @@ static long sbefifo_user_ioctl(struct file *file, unsigned int cmd, unsigned lon
 
 	mutex_lock(&user->file_lock);
 	switch (cmd) {
+	case FSI_SBEFIFO_CMD_TIMEOUT_SECONDS:
+		rc = sbefifo_cmd_timeout(user, (void __user *)arg);
+		break;
 	case FSI_SBEFIFO_READ_TIMEOUT_SECONDS:
 		rc = sbefifo_read_timeout(user, (void __user *)arg);
 		break;
@@ -1025,6 +1055,7 @@ static int sbefifo_probe(struct device *dev)
 	sbefifo->fsi_dev = fsi_dev;
 	dev_set_drvdata(dev, sbefifo);
 	mutex_init(&sbefifo->lock);
+	sbefifo->timeout_in_cmd_ms = SBEFIFO_TIMEOUT_IN_CMD;
 	sbefifo->timeout_start_rsp_ms = SBEFIFO_TIMEOUT_START_RSP;
 
 	/*
diff --git a/include/uapi/linux/fsi.h b/include/uapi/linux/fsi.h
index b2f1977378c7..a2e730fc6309 100644
--- a/include/uapi/linux/fsi.h
+++ b/include/uapi/linux/fsi.h
@@ -59,6 +59,16 @@ struct scom_access {
  * /dev/sbefifo* ioctl interface
  */
 
+/**
+ * FSI_SBEFIFO_CMD_TIMEOUT sets the timeout for writing data to the SBEFIFO.
+ *
+ * The command timeout is specified in seconds.  The minimum value of command
+ * timeout is 1 seconds (default) and the maximum value of command timeout is
+ * 120 seconds.  A command timeout of 0 will reset the value to the default of
+ * 1 seconds.
+ */
+#define FSI_SBEFIFO_CMD_TIMEOUT_SECONDS		_IOW('s', 0x01, __u32)
+
 /**
  * FSI_SBEFIFO_READ_TIMEOUT sets the read timeout for response from SBE.
  *
-- 
2.31.1

