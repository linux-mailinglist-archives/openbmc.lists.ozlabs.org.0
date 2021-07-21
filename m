Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679B3D16DE
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 21:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVQ3P3g6yz3bgf
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 05:03:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xv7Hig/z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xv7Hig/z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVQ283Hwlz2yXb;
 Thu, 22 Jul 2021 05:02:40 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LIihuO163366; Wed, 21 Jul 2021 15:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xtNXNqMO5OLbCw0sxHCdPrsZH2E3Isb/dz2BYRKzrhg=;
 b=Xv7Hig/zU2xaDcZxO55h8vGYgFQ4IBGSPbJkkmUIT2J5iDirSVf+JX5RMaOdz1JiEf95
 VwTDhRCQHlKqmCcXFWbp9ud1xDKf1G9gA3ZILdPMWw6mXqcLX8QKrR18ah7e8ahB9Njr
 xbQMnuketAWNeTrbuHlQFC79hEA5oZshBvViReePt6E6G9LaTWPHooEuSIsHrzIpT/Lu
 rpPNa/EmnKA6vdsy1mknoeuyu0Ir++cTdB3qfn+ylUA/CtorYFHaOBJE3yzY28Ql8ZTp
 9IfL/gF3cYAT2K1UL5XcUnodDUdKViURCcfZnZB7O7CKLa5bn2vrxvLINyDxaCWrzOvw lQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39xs4j8e7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 15:02:36 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LIvHET024544;
 Wed, 21 Jul 2021 19:02:35 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 39upue3tn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 19:02:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LJ2YHs53739958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:02:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE08628066;
 Wed, 21 Jul 2021 19:02:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D403528065;
 Wed, 21 Jul 2021 19:02:33 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.68.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 19:02:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v2 2/3] hwmon: (occ) Remove sequence numbering and checksum
 calculation
Date: Wed, 21 Jul 2021 14:02:30 -0500
Message-Id: <20210721190231.117185-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210721190231.117185-1-eajames@linux.ibm.com>
References: <20210721190231.117185-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t0w9CnKxlXRh9iRSZo6D1Vy1RK7j0EYR
X-Proofpoint-ORIG-GUID: t0w9CnKxlXRh9iRSZo6D1Vy1RK7j0EYR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_10:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210109
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

Checksumming of the request and sequence numbering is now done in the
OCC interface driver in order to keep unique sequence numbers. So
remove those in the hwmon driver. Also, add the command length to the
send_cmd function pointer, since the checksum must be placed in the
last two bytes of the command. The submit interface must receive the
exact size of the command - previously it could be rounded to the
nearest 8 bytes with no consequence.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v1:
 - Use min_t to avoid type comparison warnings with some platforms/configs

 drivers/hwmon/occ/common.c | 30 ++++++++++++------------------
 drivers/hwmon/occ/common.h |  3 +--
 drivers/hwmon/occ/p8_i2c.c | 15 +++++++++------
 drivers/hwmon/occ/p9_sbe.c |  4 ++--
 4 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 0d68a78be980..fc298268c89e 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -132,22 +132,20 @@ struct extended_sensor {
 static int occ_poll(struct occ *occ)
 {
 	int rc;
-	u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
-	u8 cmd[8];
+	u8 cmd[7];
 	struct occ_poll_response_header *header;
 
 	/* big endian */
-	cmd[0] = occ->seq_no++;		/* sequence number */
+	cmd[0] = 0;			/* sequence number */
 	cmd[1] = 0;			/* cmd type */
 	cmd[2] = 0;			/* data length msb */
 	cmd[3] = 1;			/* data length lsb */
 	cmd[4] = occ->poll_cmd_data;	/* data */
-	cmd[5] = checksum >> 8;		/* checksum msb */
-	cmd[6] = checksum & 0xFF;	/* checksum lsb */
-	cmd[7] = 0;
+	cmd[5] = 0;			/* checksum msb */
+	cmd[6] = 0;			/* checksum lsb */
 
 	/* mutex should already be locked if necessary */
-	rc = occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
 	if (rc) {
 		occ->last_error = rc;
 		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
@@ -184,25 +182,23 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
 	int rc;
 	u8 cmd[8];
-	u16 checksum = 0x24;
 	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
 
-	cmd[0] = 0;
-	cmd[1] = 0x22;
-	cmd[2] = 0;
-	cmd[3] = 2;
+	cmd[0] = 0;	/* sequence number */
+	cmd[1] = 0x22;	/* cmd type */
+	cmd[2] = 0;	/* data length msb */
+	cmd[3] = 2;	/* data length lsb */
 
 	memcpy(&cmd[4], &user_power_cap_be, 2);
 
-	checksum += cmd[4] + cmd[5];
-	cmd[6] = checksum >> 8;
-	cmd[7] = checksum & 0xFF;
+	cmd[6] = 0;	/* checksum msb */
+	cmd[7] = 0;	/* checksum lsb */
 
 	rc = mutex_lock_interruptible(&occ->lock);
 	if (rc)
 		return rc;
 
-	rc = occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
 
 	mutex_unlock(&occ->lock);
 
@@ -1151,8 +1147,6 @@ int occ_setup(struct occ *occ, const char *name)
 {
 	int rc;
 
-	/* start with 1 to avoid false match with zero-initialized SRAM buffer */
-	occ->seq_no = 1;
 	mutex_init(&occ->lock);
 	occ->groups[0] = &occ->group;
 
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index e6df719770e8..5020117be740 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -95,9 +95,8 @@ struct occ {
 	struct occ_sensors sensors;
 
 	int powr_sample_time_us;	/* average power sample time */
-	u8 seq_no;
 	u8 poll_cmd_data;		/* to perform OCC poll command */
-	int (*send_cmd)(struct occ *occ, u8 *cmd);
+	int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len);
 
 	unsigned long next_update;
 	struct mutex lock;		/* lock OCC access */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 0cf8588be35a..9e61e1fb5142 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -97,18 +97,21 @@ static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
 }
 
 static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
-				 u8 *data)
+				 u8 *data, size_t len)
 {
-	__be32 data0, data1;
+	__be32 data0 = 0, data1 = 0;
 
-	memcpy(&data0, data, 4);
-	memcpy(&data1, data + 4, 4);
+	memcpy(&data0, data, min_t(size_t, len, 4));
+	if (len > 4) {
+		len -= 4;
+		memcpy(&data1, data + 4, min_t(size_t, len, 4));
+	}
 
 	return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
 				      be32_to_cpu(data1));
 }
 
-static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
+static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 {
 	int i, rc;
 	unsigned long start;
@@ -127,7 +130,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 		return rc;
 
 	/* write command (expected to already be BE), we need bus-endian... */
-	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd);
+	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd, len);
 	if (rc)
 		return rc;
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index f6387cc0b754..9709f2b9c052 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -16,14 +16,14 @@ struct p9_sbe_occ {
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
-static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
+static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 {
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 	size_t resp_len = sizeof(*resp);
 	int rc;
 
-	rc = fsi_occ_submit(ctx->sbe, cmd, 8, resp, &resp_len);
+	rc = fsi_occ_submit(ctx->sbe, cmd, len, resp, &resp_len);
 	if (rc < 0)
 		return rc;
 
-- 
2.27.0

