Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A93D16CE
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 21:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVQ2V6Xbkz30Cm
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 05:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XX2Gv/FM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XX2Gv/FM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVQ266qkqz2ydJ;
 Thu, 22 Jul 2021 05:02:38 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LIXe15092860; Wed, 21 Jul 2021 15:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JkaL/JZG5JdE8NPIujIP07oAiEl0EvFgsEgD+KQUXQA=;
 b=XX2Gv/FMJVOGttKpW6uU/ZPiXZlhRxNF1qOA+Nt8QqEhxD1T7wJvPkt5PNE13edOWC68
 Aw3HEEwKsJ23HXNPlChFylUDKzPXoxyo1emE+nIRd9NDyIfLKu252+pkBX2zlw6TGknb
 +TM0tDEGJIDF4a2cDHphZTWewJ2czmMXkfZYHFNyGL9LyB6xEPUtY5YrT0pVZ0O9r6G/
 m3QtVKGhZ+3+g53oMgYAJ3McTzxZXGcTzCS22AVpHXTn6291+KmjLvQN9ceeywtOCIwG
 Lq1FZQLx6OiGVlLdV0qFROWLK7TtyuFxEOq113XAUOvSD2JCTW69msbNcfjWBAgGB0op 3w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xn8g8532-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 15:02:35 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LIumDj006161;
 Wed, 21 Jul 2021 19:02:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 39upucy7q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 19:02:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LJ2X7q16908794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:02:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEBF628060;
 Wed, 21 Jul 2021 19:02:33 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF8902807A;
 Wed, 21 Jul 2021 19:02:32 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.68.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 19:02:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v2 1/3] fsi: occ: Force sequence numbering per OCC
Date: Wed, 21 Jul 2021 14:02:29 -0500
Message-Id: <20210721190231.117185-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210721190231.117185-1-eajames@linux.ibm.com>
References: <20210721190231.117185-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EY0zGZyQ0GosRnS8WPci4r6nypz3H425
X-Proofpoint-ORIG-GUID: EY0zGZyQ0GosRnS8WPci4r6nypz3H425
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_10:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210109
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set and increment the sequence number during the submit operation.
This prevents sequence number conflicts between different users of
the interface. A sequence number conflict may result in a user
getting an OCC response meant for a different command. Since the
sequence number is now modified, the checksum must be calculated and
set before submitting the command.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-occ.c | 54 +++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index b223f0ef337b..ecf738411fe2 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -50,6 +50,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	u8 sequence_number;
 	enum versions version;
 	struct miscdevice mdev;
 	struct mutex occ_lock;
@@ -141,8 +142,7 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 {
 	struct occ_client *client = file->private_data;
 	size_t rlen, data_length;
-	u16 checksum = 0;
-	ssize_t rc, i;
+	ssize_t rc;
 	u8 *cmd;
 
 	if (!client)
@@ -156,9 +156,6 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	/* Construct the command */
 	cmd = client->buffer;
 
-	/* Sequence number (we could increment and compare with response) */
-	cmd[0] = 1;
-
 	/*
 	 * Copy the user command (assume user data follows the occ command
 	 * format)
@@ -178,14 +175,7 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 		goto done;
 	}
 
-	/* Calculate checksum */
-	for (i = 0; i < data_length + 4; ++i)
-		checksum += cmd[i];
-
-	cmd[data_length + 4] = checksum >> 8;
-	cmd[data_length + 5] = checksum & 0xFF;
-
-	/* Submit command */
+	/* Submit command; 4 bytes before the data and 2 bytes after */
 	rlen = PAGE_SIZE;
 	rc = fsi_occ_submit(client->occ->dev, cmd, data_length + 6, cmd,
 			    &rlen);
@@ -314,11 +304,13 @@ static int occ_getsram(struct occ *occ, u32 offset, void *data, ssize_t len)
 	return rc;
 }
 
-static int occ_putsram(struct occ *occ, const void *data, ssize_t len)
+static int occ_putsram(struct occ *occ, const void *data, ssize_t len,
+		       u8 seq_no, u16 checksum)
 {
 	size_t cmd_len, buf_len, resp_len, resp_data_len;
 	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
 	__be32 *buf;
+	u8 *byte_buf;
 	int idx = 0, rc;
 
 	cmd_len = (occ->version == occ_p10) ? 6 : 5;
@@ -358,6 +350,15 @@ static int occ_putsram(struct occ *occ, const void *data, ssize_t len)
 	buf[4 + idx] = cpu_to_be32(data_len);
 	memcpy(&buf[5 + idx], data, len);
 
+	byte_buf = (u8 *)&buf[5 + idx];
+	/*
+	 * Overwrite the first byte with our sequence number and the last two
+	 * bytes with the checksum.
+	 */
+	byte_buf[0] = seq_no;
+	byte_buf[len - 2] = checksum >> 8;
+	byte_buf[len - 1] = checksum & 0xff;
+
 	rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
 	if (rc)
 		goto free;
@@ -467,9 +468,12 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_response *resp = response;
 	u8 seq_no;
+	u16 checksum = 0;
 	u16 resp_data_length;
+	const u8 *byte_request = (const u8 *)request;
 	unsigned long start;
 	int rc;
+	size_t i;
 
 	if (!occ)
 		return -ENODEV;
@@ -479,11 +483,26 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 		return -EINVAL;
 	}
 
+	/* Checksum the request, ignoring first byte (sequence number). */
+	for (i = 1; i < req_len - 2; ++i)
+		checksum += byte_request[i];
+
 	mutex_lock(&occ->occ_lock);
 
-	/* Extract the seq_no from the command (first byte) */
-	seq_no = *(const u8 *)request;
-	rc = occ_putsram(occ, request, req_len);
+	/*
+	 * Get a sequence number and update the counter. Avoid a sequence
+	 * number of 0 which would pass the response check below even if the
+	 * OCC response is uninitialized. Any sequence number the user is
+	 * trying to send is overwritten since this function is the only common
+	 * interface to the OCC and therefore the only place we can guarantee
+	 * unique sequence numbers.
+	 */
+	seq_no = occ->sequence_number++;
+	if (!occ->sequence_number)
+		occ->sequence_number = 1;
+	checksum += seq_no;
+
+	rc = occ_putsram(occ, request, req_len, seq_no, checksum);
 	if (rc)
 		goto done;
 
@@ -574,6 +593,7 @@ static int occ_probe(struct platform_device *pdev)
 	occ->version = (uintptr_t)of_device_get_match_data(dev);
 	occ->dev = dev;
 	occ->sbefifo = dev->parent;
+	occ->sequence_number = 1;
 	mutex_init(&occ->occ_lock);
 
 	if (dev->of_node) {
-- 
2.27.0

