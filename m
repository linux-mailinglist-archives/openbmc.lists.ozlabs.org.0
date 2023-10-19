Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228347CFDD3
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 17:28:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NjI5vCNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBBSC0QXqz3dJw
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 02:28:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NjI5vCNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBBRZ1t1pz3cRd
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 02:27:37 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFOhKv016110;
	Thu, 19 Oct 2023 15:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iHcnUYkQ8Y+frXLKkpsPD4qln7fPdLzWLevqtmmFUIc=;
 b=NjI5vCNQfWs/qokfEl+Q92jHVw/Gwm8a7GFbJiRhhR5rEeWjyc5Nqr2QzCuhgGzQdlSC
 bQJWEzhhXOCTexhXriP2tMKyZpS6JPuNu5fkNKnf4zdBquz/IRXtCS8uT33VPCGX5aom
 w4S0UDn62oU9Z+DJV2tXlE1P5DRhsAklTJpjo9Ell3PnLxf7StdumLL5BmYOYhBJ+5yM
 +vk4GKkxkdTt6BS1Ln08GgvocDxk2+0Co3sEQz9zp6PiIg81+RyFnR2j2mWhtRtm/Y0J
 J5EcuHcK7HCfyRmEAXF6ZIfiu9F6l6I5Ve2d0umj3SuUmYWq3V7x6pW9SPHwp4vNdgFU uQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu72pr7wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:27:28 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JDXrH4012900;
	Thu, 19 Oct 2023 15:26:56 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pysucq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:26:56 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JFQtAa51380536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 15:26:55 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEDD65805D;
	Thu, 19 Oct 2023 15:26:55 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87FD958065;
	Thu, 19 Oct 2023 15:26:55 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.89.2])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 15:26:55 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5] leds: pca955x: Set default trigger state
Date: Thu, 19 Oct 2023 10:26:46 -0500
Message-Id: <20231019152646.75597-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CgNf3Ykwcv6S0V9D72RUP7rJ4AiH32vz
X-Proofpoint-ORIG-GUID: CgNf3Ykwcv6S0V9D72RUP7rJ4AiH32vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190129
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

If the LED is set to keep the default state, the blink state
needs to be set in the core when the LED device is added so the
state is kept in sync.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 240a31e813e7..b96f3a6b636e 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -708,6 +708,7 @@ static int pca955x_probe(struct i2c_client *client)
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
 			else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
 				keep_psc0 = true;
+				led->default_trigger = "timer";
 				set_bit(i, &pca955x->active_blink);
 			}
 
-- 
2.39.3

