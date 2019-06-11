Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0C3FAAC
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 22:31:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NhVX63VlzDqh2
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 06:31:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NhTr1hmYzDqfP
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 06:30:54 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5BKQh1c018838
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:49 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t2jaqavfk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:30:49 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 11 Jun 2019 21:30:48 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 21:30:47 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5BKUkkT31916518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 20:30:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 690CF28066;
 Tue, 11 Jun 2019 20:30:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F5B32805A;
 Tue, 11 Jun 2019 20:30:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 20:30:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] OCC: FSI and hwmon: Add sequence numbering
Date: Tue, 11 Jun 2019 20:30:38 +0000
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19061120-0060-0000-0000-0000034F5597
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011247; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216582; UDB=6.00639677; IPR=6.00997682; 
 MB=3.00027269; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 20:30:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061120-0061-0000-0000-000049BD0CCA
Message-Id: <1560285038-24233-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906110132
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sequence numbering of the commands submitted to the OCC is required by
the OCC interface specification. Add sequence numbering and check for
the correct sequence number on the response.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c      | 15 ++++++++++++---
 drivers/hwmon/occ/common.c |  4 ++--
 drivers/hwmon/occ/common.h |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index a2301ce..7da9c81 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -412,6 +412,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 		msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_response *resp = response;
+	u8 seq_no;
 	u16 resp_data_length;
 	unsigned long start;
 	int rc;
@@ -426,6 +427,8 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 
 	mutex_lock(&occ->occ_lock);
 
+	/* Extract the seq_no from the command (first byte) */
+	seq_no = *(const u8 *)request;
 	rc = occ_putsram(occ, OCC_SRAM_CMD_ADDR, request, req_len);
 	if (rc)
 		goto done;
@@ -441,11 +444,17 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 		if (rc)
 			goto done;
 
-		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
+		if (resp->return_status == OCC_RESP_CMD_IN_PRG ||
+		    resp->seq_no != seq_no) {
 			rc = -ETIMEDOUT;
 
-			if (time_after(jiffies, start + timeout))
-				break;
+			if (time_after(jiffies, start + timeout)) {
+				dev_err(occ->dev, "resp timeout status=%02x "
+					"resp seq_no=%d our seq_no=%d\n",
+					resp->return_status, resp->seq_no,
+					seq_no);
+				goto done;
+			}
 
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			schedule_timeout(wait_time);
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d7cc0d2..e9d7167 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -122,12 +122,12 @@ struct extended_sensor {
 static int occ_poll(struct occ *occ)
 {
 	int rc;
-	u16 checksum = occ->poll_cmd_data + 1;
+	u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
 	u8 cmd[8];
 	struct occ_poll_response_header *header;
 
 	/* big endian */
-	cmd[0] = 0;			/* sequence number */
+	cmd[0] = occ->seq_no++;		/* sequence number */
 	cmd[1] = 0;			/* cmd type */
 	cmd[2] = 0;			/* data length msb */
 	cmd[3] = 1;			/* data length lsb */
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index fc13f3c..67e6968 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -95,6 +95,7 @@ struct occ {
 	struct occ_sensors sensors;
 
 	int powr_sample_time_us;	/* average power sample time */
+	u8 seq_no;
 	u8 poll_cmd_data;		/* to perform OCC poll command */
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
 
-- 
1.8.3.1

