Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E153CB998
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 17:19:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRFKN2x1tz3bW9
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 01:19:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kRPQO3uL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kRPQO3uL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRFJZ6rLFz2yP1;
 Sat, 17 Jul 2021 01:19:10 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GFJ51u109546; Fri, 16 Jul 2021 11:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QEHYKodf8ZaZaIP+SS+nDoaBFiwQBDIEqz2HvYA1sLg=;
 b=kRPQO3uLHXiN+AQePKcQHGn7IIDeGQB4Tq4Vrkd5QONMyd6JDpIiUpjxtiJ+6FD7IqcT
 oFLXfIKt+Z7EAHBRH8p0GsUNxiz+FMk/qL7bcxis0teRkvIzLGgTdhZ0dA90y+3M8ZM/
 Z8ivHnrsYSOqmhFKnZvOiwp4OYnAJFTbGH0rNh+zxgDHjJWyAZFTFFioSrVV72jYHhHT
 Nsb2x6igA0O3sFHCvNHfzXXP8//sNGffgP6LNnGr8HmgV5jLGOj8KExMFTJVkQCqR5dI
 zZhb2pGr5mpka0Wgg1beEHjdewpRLB4YgeOoG9ij53dZh5Zifj7zuyg9/oTjp2Av3mhe hQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tyncnbep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:19:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GFI157012325;
 Fri, 16 Jul 2021 15:19:02 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgy1f1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 15:19:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GFJ1Ow34537804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 15:19:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F2E7C6055;
 Fri, 16 Jul 2021 15:19:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D85F8C605F;
 Fri, 16 Jul 2021 15:19:00 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 15:19:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (occ) Remove sequence numbering and checksum
 calculation
Date: Fri, 16 Jul 2021 10:18:49 -0500
Message-Id: <20210716151850.28973-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716151850.28973-1-eajames@linux.ibm.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1HlkeQb6RQ-v-OdW932wlBdaiTsjj0zC
X-Proofpoint-ORIG-GUID: 1HlkeQb6RQ-v-OdW932wlBdaiTsjj0zC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_05:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160092
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
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Checksumming of the request and sequence numbering is now done in the
OCC interface driver in order to keep unique sequence numbers. So
remove those in the hwmon driver.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
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
index 0cf8588be35a..22af189eafa6 100644
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
+	memcpy(&data0, data, min(len, 4UL));
+	if (len > 4UL) {
+		len -= 4;
+		memcpy(&data1, data + 4, min(len, 4UL));
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

