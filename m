Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7140EC91
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VXG22l8z2yQL
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:26:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rmFdwtKp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rmFdwtKp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQR29Fmz2yPg
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKYGRx025082; 
 Thu, 16 Sep 2021 17:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KsGrNaFFrSKODnq57VQ7iDRyHaKlfyvo4T8QP7MEQR4=;
 b=rmFdwtKpqlzubtxHlfqlj3bew/IGmPGwGU0YTREFxzpzBIsmE+lhNLvoG6uKNWXYw+7P
 R55G5KJhc0RplbrwYvOlMUwkIkwOJzEJuzoH2H0YS6Yl0ioRLqTammnvD2tBwilLzxIX
 Dg9wk2U9k9e6E1nilu8T26d0PrkfcD19KaDmnmALldAjLO6pF+3GOeF+dApB8N9L9t98
 0fp0OzVyQpRPMAgPj/otmN+10yqSmEYRZ7nmWCXwBo2MS8EhvyRaUL+LDmr+QB3sq6LT
 6PONgQV/D9g7u8wNjIc8Z+1ZQAl1ZoELa/YfcZqlqwt/Ka+Pj2r+Vp0/mOszmG6a+gTl Uw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4c4rtd8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:46 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GLB9xZ008292;
 Thu, 16 Sep 2021 21:21:45 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3b0m3bcsnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLjJP38928840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE1F7AC060;
 Thu, 16 Sep 2021 21:21:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9639DAC059;
 Thu, 16 Sep 2021 21:21:44 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 7/7] leds: pca955x: Switch to i2c probe_new
Date: Thu, 16 Sep 2021 16:21:40 -0500
Message-Id: <20210916212140.33915-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VXshvShP5NB553y0O4PuslNR-nryRtC9
X-Proofpoint-ORIG-GUID: VXshvShP5NB553y0O4PuslNR-nryRtC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109160122
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The deprecated i2c probe functionality doesn't work with OF
compatible strings, as it only checks for the i2c device id. Switch
to the new way of probing and grab the match data to select the
chip type.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-pca955x.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a6aa4b9abde8..a6b5699aeae4 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -479,8 +479,7 @@ static const struct of_device_id of_pca955x_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
 
-static int pca955x_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int pca955x_probe(struct i2c_client *client)
 {
 	struct pca955x *pca955x;
 	struct pca955x_led *pca955x_led;
@@ -494,8 +493,24 @@ static int pca955x_probe(struct i2c_client *client,
 	bool set_default_label = false;
 	bool keep_pwm = false;
 	char default_label[8];
+	enum pca955x_type chip_type;
+	const void *md = device_get_match_data(&client->dev);
 
-	chip = &pca955x_chipdefs[id->driver_data];
+	if (md) {
+		chip_type = (enum pca955x_type)md;
+	} else {
+		const struct i2c_device_id *id = i2c_match_id(pca955x_id,
+							      client);
+
+		if (id) {
+			chip_type = (enum pca955x_type)id->driver_data;
+		} else {
+			dev_err(&client->dev, "unknown chip\n");
+			return -ENODEV;
+		}
+	}
+
+	chip = &pca955x_chipdefs[chip_type];
 	adapter = client->adapter;
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata) {
@@ -670,7 +685,7 @@ static struct i2c_driver pca955x_driver = {
 		.name	= "leds-pca955x",
 		.of_match_table = of_pca955x_match,
 	},
-	.probe	= pca955x_probe,
+	.probe_new = pca955x_probe,
 	.id_table = pca955x_id,
 };
 
-- 
2.27.0

