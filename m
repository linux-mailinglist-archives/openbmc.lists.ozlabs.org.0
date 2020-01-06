Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F21318EC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 20:56:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s5qy5fNczDqGn
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 06:56:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s5kz6bjWzDqFw
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 06:52:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006JqL31092383; Mon, 6 Jan 2020 14:52:23 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8s7xc66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 14:52:22 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006Jo8SR031966;
 Mon, 6 Jan 2020 19:52:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 2xajb722x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 19:52:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006JqKFP50987288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 19:52:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF2C4124052;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EE03124053;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/3] hwmon: (pmbus/ibm-cffps) Add new
 manufacturer debugfs entries
Date: Mon,  6 Jan 2020 13:52:17 -0600
Message-Id: <1578340339-15125-2-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578340339-15125-1-git-send-email-eajames@linux.ibm.com>
References: <1578340339-15125-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_06:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060165
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

Add support for a number of manufacturer-specific registers in the
debugfs entries, as well as support to read and write the
PMBUS_ON_OFF_CONFIG register through debugfs.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 74 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d359b76..a564be9 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -20,7 +20,9 @@
 
 #define CFFPS_FRU_CMD				0x9A
 #define CFFPS_PN_CMD				0x9B
+#define CFFPS_HEADER_CMD			0x9C
 #define CFFPS_SN_CMD				0x9E
+#define CFFPS_MAX_POWER_OUT_CMD			0xA7
 #define CFFPS_CCIN_CMD				0xBD
 #define CFFPS_FW_CMD				0xFA
 #define CFFPS1_FW_NUM_BYTES			4
@@ -57,9 +59,12 @@ enum {
 	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
 	CFFPS_DEBUGFS_FRU,
 	CFFPS_DEBUGFS_PN,
+	CFFPS_DEBUGFS_HEADER,
 	CFFPS_DEBUGFS_SN,
+	CFFPS_DEBUGFS_MAX_POWER_OUT,
 	CFFPS_DEBUGFS_CCIN,
 	CFFPS_DEBUGFS_FW,
+	CFFPS_DEBUGFS_ON_OFF_CONFIG,
 	CFFPS_DEBUGFS_NUM_ENTRIES
 };
 
@@ -136,15 +141,15 @@ static ssize_t ibm_cffps_read_input_history(struct ibm_cffps *psu,
 				       psu->input_history.byte_count);
 }
 
-static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
-				    size_t count, loff_t *ppos)
+static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
+				      size_t count, loff_t *ppos)
 {
 	u8 cmd;
 	int i, rc;
 	int *idxp = file->private_data;
 	int idx = *idxp;
 	struct ibm_cffps *psu = to_psu(idxp, idx);
-	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
+	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
 	pmbus_set_page(psu->client, 0);
 
@@ -157,9 +162,20 @@ static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
 	case CFFPS_DEBUGFS_PN:
 		cmd = CFFPS_PN_CMD;
 		break;
+	case CFFPS_DEBUGFS_HEADER:
+		cmd = CFFPS_HEADER_CMD;
+		break;
 	case CFFPS_DEBUGFS_SN:
 		cmd = CFFPS_SN_CMD;
 		break;
+	case CFFPS_DEBUGFS_MAX_POWER_OUT:
+		rc = i2c_smbus_read_word_swapped(psu->client,
+						 CFFPS_MAX_POWER_OUT_CMD);
+		if (rc < 0)
+			return rc;
+
+		rc = snprintf(data, I2C_SMBUS_BLOCK_MAX, "%d", rc);
+		goto done;
 	case CFFPS_DEBUGFS_CCIN:
 		rc = i2c_smbus_read_word_swapped(psu->client, CFFPS_CCIN_CMD);
 		if (rc < 0)
@@ -199,6 +215,14 @@ static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
 			return -EOPNOTSUPP;
 		}
 		goto done;
+	case CFFPS_DEBUGFS_ON_OFF_CONFIG:
+		rc = i2c_smbus_read_byte_data(psu->client,
+					      PMBUS_ON_OFF_CONFIG);
+		if (rc < 0)
+			return rc;
+
+		rc = snprintf(data, 3, "%02x", rc);
+		goto done;
 	default:
 		return -EINVAL;
 	}
@@ -214,9 +238,42 @@ static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
 	return simple_read_from_buffer(buf, count, ppos, data, rc);
 }
 
+static ssize_t ibm_cffps_debugfs_write(struct file *file,
+				       const char __user *buf, size_t count,
+				       loff_t *ppos)
+{
+	u8 data;
+	ssize_t rc;
+	int *idxp = file->private_data;
+	int idx = *idxp;
+	struct ibm_cffps *psu = to_psu(idxp, idx);
+
+	switch (idx) {
+	case CFFPS_DEBUGFS_ON_OFF_CONFIG:
+		pmbus_set_page(psu->client, 0);
+
+		rc = simple_write_to_buffer(&data, 1, ppos, buf, count);
+		if (rc < 0)
+			return rc;
+
+		rc = i2c_smbus_write_byte_data(psu->client,
+					       PMBUS_ON_OFF_CONFIG, data);
+		if (rc)
+			return rc;
+
+		rc = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return rc;
+}
+
 static const struct file_operations ibm_cffps_fops = {
 	.llseek = noop_llseek,
-	.read = ibm_cffps_debugfs_op,
+	.read = ibm_cffps_debugfs_read,
+	.write = ibm_cffps_debugfs_write,
 	.open = simple_open,
 };
 
@@ -486,15 +543,24 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	debugfs_create_file("part_number", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_PN],
 			    &ibm_cffps_fops);
+	debugfs_create_file("header", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_HEADER],
+			    &ibm_cffps_fops);
 	debugfs_create_file("serial_number", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_SN],
 			    &ibm_cffps_fops);
+	debugfs_create_file("max_power_out", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_MAX_POWER_OUT],
+			    &ibm_cffps_fops);
 	debugfs_create_file("ccin", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_CCIN],
 			    &ibm_cffps_fops);
 	debugfs_create_file("fw_version", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_FW],
 			    &ibm_cffps_fops);
+	debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
+			    &ibm_cffps_fops);
 
 	return 0;
 }
-- 
1.8.3.1

