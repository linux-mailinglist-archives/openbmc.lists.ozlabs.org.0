Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896D5EFDCD
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 21:19:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdjpl1jYyz3c4K
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 05:19:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1ixrJ/l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1ixrJ/l;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdjpG36JHz2xmw
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 05:19:01 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TJG1YL038496;
	Thu, 29 Sep 2022 19:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4pIGcKQXbrlKMND2es+RMAE4mep4F9B/AWRsVy2OwsA=;
 b=V1ixrJ/lbMkgt3Hj3pEMml/yafotdJGIknQ0ycXqtB9FbFBuVHm/RvR//8I8U3M0UxBX
 0hfy9G4XqTZtMiorGWyVf68lOtLpKjb3r62BxsdLC8dAitT+UYWR9qp+aFZ7LQ+cIUvH
 toRWrTm+oPVw56kXK3SxPeIhHWBWDjGhJOcbNFOZzA191MpP6nampjta/uzisdOP6xsa
 2gTjKVcqnoMV2LYnrDV+C/JBNT1tJ5EWhebe+z+QvRYqTfYkGvmIOiid2h6/afy6Tvo8
 rDcCfcGYlL2xjNzKMEOFYJOx60utHTz8haG6WyoJVJMZSXURNh4g8t1YDl2s4jO/g3cZ 1Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwh18rm0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 19:18:55 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TJDInK009375;
	Thu, 29 Sep 2022 19:18:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma05wdc.us.ibm.com with ESMTP id 3jssha43t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 19:18:53 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TJIqc464881048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 19:18:53 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BCE358055;
	Thu, 29 Sep 2022 19:18:52 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D173058054;
	Thu, 29 Sep 2022 19:18:51 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.146.111])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 19:18:51 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] leds: pca955x: Fix i2c_smbus_read_i2c_block_data return code check
Date: Thu, 29 Sep 2022 14:18:48 -0500
Message-Id: <20220929191848.247164-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Gqt6vSVt4fhFLqi6YF34946Wkmp_ypt
X-Proofpoint-ORIG-GUID: _Gqt6vSVt4fhFLqi6YF34946Wkmp_ypt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290120
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The function returns either a negative errno or the number of bytes
successfully read. So, only return for a negative return code.

Fixes: c9fb275212da ("leds: pca955x: Add HW blink support")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index cf0a9fe20086..cba9876b1187 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -689,7 +689,7 @@ static int pca955x_probe(struct i2c_client *client)
 	err = i2c_smbus_read_i2c_block_data(client,
 					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
 					    ls1);
-	if (err)
+	if (err < 0)
 		return err;
 
 	for (i = 0; i < nls; ++i)
-- 
2.31.1

