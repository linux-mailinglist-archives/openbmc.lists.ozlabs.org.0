Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23E540F24
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 21:02:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHfql5RM9z3bmH
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 05:02:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xhsjc0wg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xhsjc0wg;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHfpZ4Jn8z3bfC
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 05:01:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 257HEPQI016183;
	Tue, 7 Jun 2022 19:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=D+2Zk6IfY6zUqx0DXFyoqGRM6KyDeW+r/kZgx9D8NQA=;
 b=Xhsjc0wgimJAUDP30WTNHI6Dn1KfecB8/td4NuUgvazy3BWb18rTTGMpx1mznzdjfcKT
 SIxGH4JthiRYO8EBNBRCHCn+o5vUk7KYNJWzlgevDGVRKzR5y0ynwJiSQxPY+oaluC4s
 fYNXK2WbmjfgGdHqFalkLbFD1ec16fAI0fogDI28EeZ52ihAmeckOkPmDxD6I9Y3wKwk
 y5vyGxw4y6J4keeSxpd8YVTkapJCVLvg8yHv5guq89JYRXvXUUfAoJ5P89H1Hxen8dB4
 F3uVGa01Tzi9gx4OxnFxEiYOg/L4TF156JarGGA65nu/etxv+7mGtSB/gQ5cwh1kWlSj 9g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjaw99yy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 19:01:22 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 257IpE3t001470;
	Tue, 7 Jun 2022 19:01:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04wdc.us.ibm.com with ESMTP id 3gfy19p7h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 19:01:21 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 257J1K9F14221754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jun 2022 19:01:20 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDF196E050;
	Tue,  7 Jun 2022 19:01:20 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6204C6E04E;
	Tue,  7 Jun 2022 19:01:20 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.160.188.159])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jun 2022 19:01:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 2/2] hwmon: (occ) Lock mutex in shutdown to prevent race with occ_active
Date: Tue,  7 Jun 2022 14:01:18 -0500
Message-Id: <20220607190118.5078-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220607190118.5078-1-eajames@linux.ibm.com>
References: <20220607190118.5078-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y-oqJoyfwO-yRMHIgP5STWCX340QnLjP
X-Proofpoint-ORIG-GUID: y-oqJoyfwO-yRMHIgP5STWCX340QnLjP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_08,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070076
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Unbinding the driver or removing the parent device at the same time
as using the OCC active sysfs file can cause the driver to unregister
the hwmon device twice. Prevent this by locking the occ mutex in the
shutdown function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20220606185455.21126-1-eajames@linux.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/occ/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d78f4bebc718..ea070b91e5b9 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1228,10 +1228,15 @@ EXPORT_SYMBOL_GPL(occ_setup);
 
 void occ_shutdown(struct occ *occ)
 {
+	mutex_lock(&occ->lock);
+
 	occ_shutdown_sysfs(occ);
 
 	if (occ->hwmon)
 		hwmon_device_unregister(occ->hwmon);
+	occ->hwmon = NULL;
+
+	mutex_unlock(&occ->lock);
 }
 EXPORT_SYMBOL_GPL(occ_shutdown);
 
-- 
2.31.1

