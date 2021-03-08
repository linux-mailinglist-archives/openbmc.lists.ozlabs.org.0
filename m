Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA3331ACE
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:09:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYtn1hF7z3clZ
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:09:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kzeh7V7u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kzeh7V7u; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYZ26DnSz3cPn
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MZPWp076033; Mon, 8 Mar 2021 17:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aWvWUhpStSVN/hPu3hb/yP4vhl3xoO1lt9P053FmBJU=;
 b=kzeh7V7u7JZoJ2BisqAYSV8XaP7rKp6kmSQ3481x/DCourbdxw5F1ti/LNHf3cuMPNce
 9NFQJ0gFCGI0Y5ng9R0MxzLswpOv6Oa2bvXcbSTfZZKYhj3QpxZZXK58XeyvFCjsZoEx
 c49qSn72CwUznUJ87Kg+Es4CiLfAmxdDr6rkOzaK6rYblCb9+Ave/3djTQd9qasgEwVV
 GgdNemewer/aTPpGcxZpmHdqAaEj19t3k6ev47hgslSsa/4lWNv5CJQDpyxV3bpEwhsH
 TRl9sv4C0plDERGA1z+J+dhIc6G5E0cSRhdPfdEmA+WyrNMJZyrkvBd8SSgIJICtQgaK qw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udq2cdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:32 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mpd4A025299;
 Mon, 8 Mar 2021 22:54:31 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3741c91xm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:31 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsUvm15794644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D0D7C605F;
 Mon,  8 Mar 2021 22:54:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A244C6062;
 Mon,  8 Mar 2021 22:54:30 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:30 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 35/35] pmbus: (max31785) Retry enabling fans
 after writing MFR_FAN_CONFIG
Date: Mon,  8 Mar 2021 16:54:19 -0600
Message-Id: <20210308225419.46530-36-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Andrew Jeffery <andrew@aj.id.au>

It has been observed across large fleets of systems that a small subset
of those systems occasionally loose control of some number of fans
across a BMC reboot (their hwmon fan attributes are missing from sysfs).

>From extensive testing and tracing it was discovered that writes
enabling a fan in FAN_CONFIG_1_2 failed to stick on the system under
test with a frequency of about 1 in 1000 re-binds of the driver.

The MAX31785 datasheet recommends in the documentation for
MFR_FAN_CONFIG that the asssociated fan(s) be disabled before updating
the register. The sequence in question implements this suggestion, and
the observed loss-of-fans symptom occurs when the write to re-enable the
fan in FAN_CONFIG_1_2 fails to stick.

The trace data suggests a one-shot retry is enough to successfully
update FAN_CONFIG_1_2. With the workaround, no loss of fans was observed
in over 20,000 consecutive rebinds of the driver.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 1e021c38d507..0c2fe22018a3 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -398,6 +398,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	u32 page;
 	u32 uval;
 	int ret;
+	int i;
 
 	if (!of_device_is_compatible(child, "pmbus-fan"))
 		return 0;
@@ -574,10 +575,24 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
-						 pb_cfg);
-	if (ret < 0)
-		return ret;
+	for (i = 0; i < 2; i++) {
+		ret = max31785_i2c_smbus_write_byte_data(client,
+							 PMBUS_FAN_CONFIG_12,
+							 pb_cfg);
+		if (ret < 0)
+			continue;
+
+		ret = max31785_i2c_smbus_read_byte_data(client,
+							PMBUS_FAN_CONFIG_12);
+		if (ret < 0)
+			continue;
+
+		if (ret == pb_cfg)
+			break;
+	}
+
+	if (i == 2)
+		return -EIO;
 
 	/*
 	 * Fans are on pages 0 - 5. If the page property of a fan node is
-- 
2.27.0

