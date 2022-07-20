Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F197857BF1E
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 22:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp6S86SQ2z3cC1
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 06:17:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kAUph8dM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kAUph8dM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp6Qt3rD7z3bk8
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 06:16:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KIrjGF003743;
	Wed, 20 Jul 2022 20:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=u7EjeHd8sCL/LXqocs02FQiCo3OFqQvE5P0o7b5MxBc=;
 b=kAUph8dMib2sjqx9aCS8NyHatx0U+8xfXzXcts5HmYq9VMnttGLqomcwc9u4Skb5yUe3
 4+lmd7jps3lfrnaLh/Slv1pbT5lb7SXe52GsptIfWaJ7citqZxJ0DoCU7Uv1gyjAo+k1
 z22E25w21Y0O1dHhFq2mRLunfrso4M3JYNR0Mf0pcSXT22WmT+roKY/uWWx5wUxou3V6
 WSXZWrOBcjOs5YPlVqsQghuRJs8oGCX/Uak9V+eTa0B0IneMoDjURg1aPde8oo01FTkR
 /kzHXvN0fcPdIy0bphGftdldf9xHnMlEImGSrhdn+2okS/pT5mKBJdc7ykPLHT0Iw7kp 4w== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3heqcp2ed7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 20:16:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26KK4kB6001770;
	Wed, 20 Jul 2022 20:16:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01dal.us.ibm.com with ESMTP id 3hbmy9tj35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 20:16:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26KKFxBg64749870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Jul 2022 20:15:59 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC90B124054;
	Wed, 20 Jul 2022 20:15:59 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29B9A12405A;
	Wed, 20 Jul 2022 20:15:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.160.104.49])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed, 20 Jul 2022 20:15:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 1/2] hwmon: (occ) Prevent power cap command overwriting poll response
Date: Wed, 20 Jul 2022 15:15:57 -0500
Message-Id: <20220720201558.11337-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kdQJtcd54pmVvy0QDsWGVrdn374_TyGC
X-Proofpoint-ORIG-GUID: kdQJtcd54pmVvy0QDsWGVrdn374_TyGC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200080
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently, the response to the power cap command overwrites the
first eight bytes of the poll response, since the commands use
the same buffer. This means that user's get the wrong data between
the time of sending the power cap and the next poll response update.
Fix this by specifying a different buffer for the power cap command
response.

Fixes: 5b5513b88002 ("hwmon: Add On-Chip Controller (OCC) hwmon driver")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20220628203029.51747-1-eajames@linux.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/occ/common.c |  5 +++--
 drivers/hwmon/occ/common.h |  3 ++-
 drivers/hwmon/occ/p8_i2c.c | 13 +++++++------
 drivers/hwmon/occ/p9_sbe.c | 10 ++++------
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index f00cd59f1d19..1757f3ab842e 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -145,7 +145,7 @@ static int occ_poll(struct occ *occ)
 	cmd[6] = 0;			/* checksum lsb */
 
 	/* mutex should already be locked if necessary */
-	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
+	rc = occ->send_cmd(occ, cmd, sizeof(cmd), &occ->resp, sizeof(occ->resp));
 	if (rc) {
 		occ->last_error = rc;
 		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
@@ -182,6 +182,7 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
 	int rc;
 	u8 cmd[8];
+	u8 resp[8];
 	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
 
 	cmd[0] = 0;	/* sequence number */
@@ -198,7 +199,7 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	if (rc)
 		return rc;
 
-	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
+	rc = occ->send_cmd(occ, cmd, sizeof(cmd), resp, sizeof(resp));
 
 	mutex_unlock(&occ->lock);
 
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 2dd4a4d240c0..726943af9a07 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -96,7 +96,8 @@ struct occ {
 
 	int powr_sample_time_us;	/* average power sample time */
 	u8 poll_cmd_data;		/* to perform OCC poll command */
-	int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len);
+	int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len, void *resp,
+			size_t resp_len);
 
 	unsigned long next_update;
 	struct mutex lock;		/* lock OCC access */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 9e61e1fb5142..c35c07964d85 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -111,7 +111,8 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
 				      be32_to_cpu(data1));
 }
 
-static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
+static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
+			       void *resp, size_t resp_len)
 {
 	int i, rc;
 	unsigned long start;
@@ -120,7 +121,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 	const long wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
 	struct p8_i2c_occ *ctx = to_p8_i2c_occ(occ);
 	struct i2c_client *client = ctx->client;
-	struct occ_response *resp = &occ->resp;
+	struct occ_response *or = (struct occ_response *)resp;
 
 	start = jiffies;
 
@@ -151,7 +152,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 			return rc;
 
 		/* wait for OCC */
-		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
+		if (or->return_status == OCC_RESP_CMD_IN_PRG) {
 			rc = -EALREADY;
 
 			if (time_after(jiffies, start + timeout))
@@ -163,7 +164,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 	} while (rc);
 
 	/* check the OCC response */
-	switch (resp->return_status) {
+	switch (or->return_status) {
 	case OCC_RESP_CMD_IN_PRG:
 		rc = -ETIMEDOUT;
 		break;
@@ -192,8 +193,8 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 	if (rc < 0)
 		return rc;
 
-	data_length = get_unaligned_be16(&resp->data_length);
-	if (data_length > OCC_RESP_DATA_BYTES)
+	data_length = get_unaligned_be16(&or->data_length);
+	if ((data_length + 7) > resp_len)
 		return -EMSGSIZE;
 
 	/* fetch the rest of the response data */
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index d34d6a007e8d..ad2fcc31db78 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -79,13 +79,11 @@ static bool p9_sbe_occ_save_ffdc(struct p9_sbe_occ *ctx, const void *resp,
 	return notify;
 }
 
-static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
+static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
+			       void *resp, size_t resp_len)
 {
-	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
-	size_t resp_len = sizeof(*resp);
-	int i;
-	int rc;
+	int rc, i;
 
 	for (i = 0; i < OCC_CHECKSUM_RETRIES; ++i) {
 		rc = fsi_occ_submit(ctx->sbe, cmd, len, resp, &resp_len);
@@ -102,7 +100,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
 			return rc;
 	}
 
-	switch (resp->return_status) {
+	switch (((struct occ_response *)resp)->return_status) {
 	case OCC_RESP_CMD_IN_PRG:
 		rc = -ETIMEDOUT;
 		break;
-- 
2.31.1

