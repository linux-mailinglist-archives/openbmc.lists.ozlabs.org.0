Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2463308BF9
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 18:55:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS4kt1mV0zDsTQ
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 04:55:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OZUzRog1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS4jn1lp5zDrqC
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2021 04:54:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10THWKrV083995; Fri, 29 Jan 2021 12:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wxklQA0QR4IBsqURQOzxwX4TtHDjMwAmJwLEWM88nCQ=;
 b=OZUzRog1gX6V3Ckz48l4mRX5UEHNICHuuYCsnzbSbuHObc6zvQgOm18TEBAngQhjvTE1
 CZCqEinkDo+uJ0VZgAqC/7OADKRKp/D/JmpkPxJtgOU/Os19Ns0404sjAg+clsYyYzWs
 Vg2+zviAzUbXmaQ4I+JYu6Xvmu8tVJjjQ77IdIVZaK0JNaiVQ8u49WIc8au+LoXdD9W2
 gnNEWD/ZgrIEunZ51nq52JyljS7GxK3dUGcMDArlP2i8V+N/NXRWGyERFoY6V8wjeKcr
 PgCr2GqdiBpHFqWhTS5RLUQl1eylH4hrzvcxONI/2yUSfuuyZofL+kGxTLJ3g5ZSGuPI bg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36cjcvh8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 12:54:41 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10THqj12024642;
 Fri, 29 Jan 2021 17:54:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 368bea2a3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 17:54:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10THsdWh21954904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 17:54:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91B4F7805E;
 Fri, 29 Jan 2021 17:54:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3B4778063;
 Fri, 29 Jan 2021 17:54:38 +0000 (GMT)
Received: from MSBARTH-P50.rch.stglabs.ibm.com (unknown [9.211.103.243])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 17:54:38 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au
Subject: [PATCH linux dev-5.8] pmbus:max31785: Support revision "B"
Date: Fri, 29 Jan 2021 11:54:35 -0600
Message-Id: <20210129175435.2241080-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_06:2021-01-29,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290083
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

There was an issue in how the tach feedbacks of dual rotor fans were
reported during any change in fan speeds with revision "A" of the
MAX31785. When the fan speeds would transition to a new target speed,
the rotor not wired to the TACH input when TACHSEL = 0 would report a
speed of 0 until the new target was reached. This has been fixed,
resulting in a revision "B" update where the MFR_REVISION of "B" is
0x3061.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 drivers/hwmon/pmbus/max31785.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index cbcd0b2301f4..4de226670069 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -20,6 +20,7 @@ enum max31785_regs {
 
 #define MAX31785			0x3030
 #define MAX31785A			0x3040
+#define MAX31785B			0x3061
 
 #define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
 #define MFR_FAN_CONFIG_TSFO		BIT(9)
@@ -749,12 +750,13 @@ static int max31785_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	if (ret == MAX31785A) {
+	if (ret == MAX31785A || ret == MAX31785B) {
 		dual_tach = true;
 	} else if (ret == MAX31785) {
 		if (!strcmp("max31785a", id->name))
 			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
 	} else {
+		dev_err(dev, "Unrecognized MAX31785 revision: %x\n", ret);
 		return -ENODEV;
 	}
 
@@ -813,6 +815,7 @@ static int max31785_probe(struct i2c_client *client,
 static const struct i2c_device_id max31785_id[] = {
 	{ "max31785", 0 },
 	{ "max31785a", 0 },
+	{ "max31785b", 0 },
 	{ },
 };
 
@@ -821,6 +824,7 @@ MODULE_DEVICE_TABLE(i2c, max31785_id);
 static const struct of_device_id max31785_of_match[] = {
 	{ .compatible = "maxim,max31785" },
 	{ .compatible = "maxim,max31785a" },
+	{ .compatible = "maxim,max31785b" },
 	{ },
 };
 
-- 
2.29.2

