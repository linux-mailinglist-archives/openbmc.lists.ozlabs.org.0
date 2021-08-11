Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5C3E950D
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDpr2Rh1z30F3
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=piveu8Wj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=piveu8Wj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbp5p5dz30KN
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:46 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFY6S4118413; Wed, 11 Aug 2021 11:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=92nLnKl98FZ+iXmxqKs2ZXjmagaOi04ZGtvuVBRuUic=;
 b=piveu8WjjVLd6t/9E0kc/Dr2hBlYGjC9S1Lntw93ucdnI+XOPVZnaOeXtPxzDhMKRLhr
 bo9svAhbOvFT4KmnKNV1Ge5C+zjHu1Bhh/nxFj25sSgboPPpTq00XtfBtQKnvIfcLCY/
 r7IVcLLf5J/ANhcLFjuyKetqyHRbIuicpdUW7+L2Rbat859TUvp8uQ+DN6KlAfRLOn27
 AdnYpglpaKybKKAvvnhSePdVLpNSDtSlq17/Vb+wtHvOWjVMqEB3aFr2QZQNj2Tdk8dL
 rZjQyvkljYOo6F6zGBpvqU7daSSI7ebOD2rlvi8MBGPoqeiPpJss1xLiIQDh8rcE9Z1v Ww== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abt14mgpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFYtxl019489;
 Wed, 11 Aug 2021 15:42:37 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3a9hteyt2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgaMM36307346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 019206A051;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C31286A05A;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 06/14] pmbus: (max31785) Add a local
 pmbus_set_page() implementation
Date: Wed, 11 Aug 2021 10:42:24 -0500
Message-Id: <20210811154232.12649-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Os1jcGXVTQey9WUAQfjKX0wHOIYXjxCD
X-Proofpoint-GUID: Os1jcGXVTQey9WUAQfjKX0wHOIYXjxCD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110104
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

Extensive testing and tracing has shown that the MAX31785 is unreliable
in the face of PAGE write commands, ACK'ing the PAGE request but
reporting a value of 0 on some subsequent PAGE reads. The trace data
suggests that a one-shot retry of the PAGE write is enough to get the
requested value to stick.

As we configure the device before registering with the PMBus core,
centralise PAGE handling inside the driver and implement the one-shot
retry semantics there.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index d097f72d4d47..7518fff356f9 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -362,6 +362,27 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 	return -ENXIO;
 }
 
+static int max31785_pmbus_set_page(struct i2c_client *client, int page)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		if (ret < 0)
+			return ret;
+
+		ret = max31785_i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		if (ret < 0)
+			return ret;
+
+		if (ret == page)
+			return 0;
+	}
+
+	return -EIO;
+}
+
 /*
  * Returns negative error codes if an unrecoverable problem is detected, 0 if a
  * recoverable problem is detected, or a positive value on success.
@@ -392,7 +413,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_pmbus_set_page(client, page);
 	if (ret < 0)
 		return ret;
 
@@ -599,7 +620,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_pmbus_set_page(client, page);
 	if (ret < 0)
 		return ret;
 
@@ -700,7 +721,7 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
 	int i;
 
 	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
-		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_pmbus_set_page(client, i);
 		if (ret < 0)
 			return ret;
 
@@ -741,7 +762,7 @@ static int max31785_probe(struct i2c_client *client)
 
 	*info = max31785_info;
 
-	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_pmbus_set_page(client, 255);
 	if (ret < 0)
 		return ret;
 
@@ -785,8 +806,7 @@ static int max31785_probe(struct i2c_client *client)
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
-							 i);
+		ret = max31785_pmbus_set_page(client, i);
 		if (ret < 0)
 			return ret;
 
-- 
2.27.0

