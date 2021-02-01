Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819030B222
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 22:34:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV1Rs67Z4zDr4m
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 08:34:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PowQLSCx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV1Qy46KtzDqqm
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 08:33:45 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 111LW84d030721; Mon, 1 Feb 2021 16:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=E9TyH6Gk3AuM2jxFlrYQ8feI8ttp7rx+wn0gWHqGTrU=;
 b=PowQLSCxF0zVa4E3FrYiOpumTUA/5ncipbkFgjLTnhrkQlvY5nRp+HJbORLulwI/N6k3
 bR/0iJdYZ7MmlrBWtF/8PfoPxOH6MDshA41KGntx8R1bU2uyaP7/HhT5LTRHDXE1pa99
 KFIBNl06goq6KEBn3jjw4m+sklZs/NmjOUbnvjYY9g0WASVrAND5+ZTaufkyJKH2LVh6
 +d2uHiBpET9yZ4S7h0rNVvV2SF3auSfu639rlQQusiUdy11uikM2FEu19h698Dey4Zdj
 3IWCMVpOJrpaLZJvq1QTjX185OnXq/BH5gK7n2iuTbcsNK7yZZJkBaZvxf+Kp/AvOnwP Dw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36erft9x66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 16:33:38 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 111LS2eh029859;
 Mon, 1 Feb 2021 21:33:37 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 36er4cgn6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 21:33:37 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 111LXaeu25756018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Feb 2021 21:33:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92F5E112065;
 Mon,  1 Feb 2021 21:33:36 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61340112061;
 Mon,  1 Feb 2021 21:33:35 +0000 (GMT)
Received: from MSBARTH-P50.aus.stglabs.ibm.com (unknown [9.163.45.205])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Feb 2021 21:33:35 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au
Subject: [PATCH linux dev-5.8 v2] pmbus:max31785: Support revision "B"
Date: Mon,  1 Feb 2021 15:33:33 -0600
Message-Id: <20210201213333.76490-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_08:2021-01-29,
 2021-02-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010116
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
ChangeLog v1->v2
- Check for expected "max31785b" when MAX31785 single tach only found
---
 drivers/hwmon/pmbus/max31785.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index cbcd0b2301f4..9a94245cf766 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -20,6 +20,7 @@ enum max31785_regs {
 
 #define MAX31785			0x3030
 #define MAX31785A			0x3040
+#define MAX31785B			0x3061
 
 #define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
 #define MFR_FAN_CONFIG_TSFO		BIT(9)
@@ -749,12 +750,14 @@ static int max31785_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	if (ret == MAX31785A) {
+	if (ret == MAX31785A || ret == MAX31785B) {
 		dual_tach = true;
 	} else if (ret == MAX31785) {
-		if (!strcmp("max31785a", id->name))
-			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
+		if (!strcmp("max31785a", id->name) ||
+		    !strcmp("max31785b", id->name))
+			dev_warn(dev, "Expected max31785a/b, found max31785: cannot provide secondary tachometer readings\n");
 	} else {
+		dev_err(dev, "Unrecognized MAX31785 revision: %x\n", ret);
 		return -ENODEV;
 	}
 
@@ -813,6 +816,7 @@ static int max31785_probe(struct i2c_client *client,
 static const struct i2c_device_id max31785_id[] = {
 	{ "max31785", 0 },
 	{ "max31785a", 0 },
+	{ "max31785b", 0 },
 	{ },
 };
 
@@ -821,6 +825,7 @@ MODULE_DEVICE_TABLE(i2c, max31785_id);
 static const struct of_device_id max31785_of_match[] = {
 	{ .compatible = "maxim,max31785" },
 	{ .compatible = "maxim,max31785a" },
+	{ .compatible = "maxim,max31785b" },
 	{ },
 };
 
-- 
2.29.2

