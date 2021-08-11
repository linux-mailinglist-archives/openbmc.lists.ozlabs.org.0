Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC823E94FD
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDkD42l0z2ymZ
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dotd+F6Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Dotd+F6Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl58nKz3002
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFYeuW024189; Wed, 11 Aug 2021 11:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4FAUI0S1u3Mme5TExbHwHw3w3SUD76M41Vobecxwh7A=;
 b=Dotd+F6YN+OYifiThsAtT2Y9nTw48tBxrRhR5O3y9F6yDx4gROeD01G7VzS9D3MZFEkm
 gaViTmTxlkqHOiftrrjvqE7KZE4MbI0JrE9IIV/f17CtrRhvGS9MBd8W/jQaP27/IJlQ
 2f+o6OjKFJot4dVbTAqoBkmpJVO/z2Fi4KQmGroRTNJIa8WdrBuTdNot8/RaWl3z1tIh
 ndjyabJA0I0LaUjZ4kbdeEgvckEYu2n18pEpTaNQIUXe1ilTnOSfCrtkR0n506yleWvI
 6TpgSRNqtpHHJ/gkjZ6OSW3jRON8txwxM1xx+e4Hp4i7xZzNVjNK1nL1JB8WcE7xE8TM yg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acby5sc4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFY60K006577;
 Wed, 11 Aug 2021 15:42:37 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3a9htefv4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFga0A13042066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 456D96A051;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11A966A058;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 07/14] pmbus: (max31785) Retry enabling fans
 after writing MFR_FAN_CONFIG
Date: Wed, 11 Aug 2021 10:42:25 -0500
Message-Id: <20210811154232.12649-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DGa9Uieg971nf4tdS1hBEvF9Iyav5t8M
X-Proofpoint-ORIG-GUID: DGa9Uieg971nf4tdS1hBEvF9Iyav5t8M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110104
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
index 7518fff356f9..b37da2ec1ce4 100644
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

