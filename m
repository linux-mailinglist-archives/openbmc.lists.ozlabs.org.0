Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA193E94DB
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDfQ2dVmz30MX
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MI9KLneg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MI9KLneg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl0nn9z2xZm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFbpcn080236; Wed, 11 Aug 2021 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2uQDZNNA0gqlrwG4uz94dkel5GoGAO0Sxp66kG6QGsU=;
 b=MI9KLnegD+RebQ6LbZKJ/h0hPFJw3qVs3O4zQM1wI+3vwBtYcxXqd59vMmnAcJbwkwNS
 lxEkNdjiVUpBtXAnl1l8bXg6TbEl9c3M27zo00fhDm2TSiO07OLcHtYzQX5fpJINAdAh
 HfeQ5H/mWlznOdgC7S4T1PizxkyhAMXunY3VDqyCm++a/Wa6E0AFkhOWFb/p0Ki/0md0
 Vr/q3T4KrtPX8oeQnUkUaD0gMY2m+AkRaWS2Qof/4FgJAxikyMdtlS6iC78jrtQyK/lA
 2/VabxYnwCxrrD7JSkHKpjecU/4ezYS+Nqq+YO7RUDR8co2aOrokGwzRN9A2T8sHUPWf 0A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acgg71nxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:37 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFYtxd019489;
 Wed, 11 Aug 2021 15:42:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3a9hteyt1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgZTx8978906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16CE36A047;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E9B6A064;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 03/14] ucd9000: Add a throttle delay attribute
 in debugfs
Date: Wed, 11 Aug 2021 10:42:21 -0500
Message-Id: <20210811154232.12649-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HJDVldU7NrWFbz_TSzFOIkemIrYdjOFJ
X-Proofpoint-ORIG-GUID: HJDVldU7NrWFbz_TSzFOIkemIrYdjOFJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110104
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/ucd9000.c | 37 ++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 9687bc3609d1..cbfafebf1ded 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -401,6 +401,37 @@ static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_bit,
 			 ucd9000_debugfs_show_mfr_status_bit, NULL, "%1lld\n");
 
+#define UCD9000_SMBUS_THROTTLE_US	1000
+static int throttle_delay_us = UCD9000_SMBUS_THROTTLE_US;
+
+static int ucd9000_debugfs_show_smbus_throttle_delay(void *data,
+						     u64 *val)
+{
+	struct i2c_client *client = data;
+	unsigned long ulval;
+	int rc;
+
+	rc = i2c_smbus_throttle_value(client, &ulval);
+	if (rc)
+		return rc;
+
+	*val = ulval;
+
+	return 0;
+}
+
+static int ucd9000_debugfs_store_smbus_throttle_delay(void *data,
+						      u64 val)
+{
+	struct i2c_client *client = data;
+
+	throttle_delay_us = val;
+	return i2c_smbus_throttle_client(client, val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_smbus_throttle_delay,
+			 ucd9000_debugfs_show_smbus_throttle_delay,
+			 ucd9000_debugfs_store_smbus_throttle_delay, "%llu\n");
+
 static ssize_t ucd9000_debugfs_read_mfr_status(struct file *file,
 					       char __user *buf, size_t count,
 					       loff_t *ppos)
@@ -475,6 +506,8 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 	scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
 	debugfs_create_file(name, 0444, data->debugfs, client,
 			    &ucd9000_debugfs_show_mfr_status_fops);
+	debugfs_create_file("smbus_throttle_delay", 0664, data->debugfs, client,
+			    &ucd9000_debugfs_smbus_throttle_delay);
 
 	return 0;
 }
@@ -503,7 +536,9 @@ static int ucd9000_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	i2c_smbus_throttle_client(client, UCD9000_SMBUS_THROTTLE_US);
+	ret = i2c_smbus_throttle_client(client, throttle_delay_us);
+	if (ret)
+		return ret;
 
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
 					block_buffer);
-- 
2.27.0

