Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD63C7A62
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 02:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPd5y4lJwz30G7
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 10:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CGJ7cJ10;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CGJ7cJ10; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPVMD5KYcz2yj1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 05:00:24 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DIXc5C111517
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 15:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lk85c+zJI//ry9RinrNw4TJXtgBz4icb8QF6T30NrWs=;
 b=CGJ7cJ10J5ICIV9pfKVWvhcaz8unt9/hCGayJhzf0knqRLSbRxGHQiBABjRtJo5/sGPj
 LRWyd9SjoBfeDBsaKiTevzs+IQA2PMWMNYFc/3pnueJK9TgvB2HPAAUd60CP9kOlqZEm
 jwoGIFPD8+Lkq2q1zQqrWfOoU5dZonHyO507ka9tDu/hBGOGrJPS01yaTvH+W9ipu9HY
 UqzswckG8gFQ281f3t0ydOQqBYMstigLYVGjDbmFztur5DhVbT6tpgBoDWYifTgYjT2r
 bcUt4oQUlGfU1G1kbJE6zrqEwrWNqtwk3vHNHtEwXaR3ofuGrypdm87haBLAiWGEWZp/ lQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc8j9y29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 15:00:22 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DIufHS030641
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:00:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 39q36c29u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:00:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DJ0Kh026673590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 19:00:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ECC528068;
 Tue, 13 Jul 2021 19:00:20 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D284928059;
 Tue, 13 Jul 2021 19:00:19 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.77.159.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 19:00:19 +0000 (GMT)
From: Ben Tyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 3/3] ARM: dts: everest: Define name for gpio
 line B6
Date: Tue, 13 Jul 2021 14:00:14 -0500
Message-Id: <20210713190014.8142-3-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713190014.8142-1-bentyner@linux.ibm.com>
References: <20210713190014.8142-1-bentyner@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DdCZXq2SH54XfN98yA1HUjfsCOqqVS1I
X-Proofpoint-ORIG-GUID: DdCZXq2SH54XfN98yA1HUjfsCOqqVS1I
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_10:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=985 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130117
X-Mailman-Approved-At: Wed, 14 Jul 2021 10:03:01 +1000
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ben Tyner <ben.tyner@ibm.com>

gpio-line-names B6 set to checkstop

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3a6ea412a6b0..0be7a9861eef 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -236,7 +236,7 @@ led-pcieslot-power {
 &gpio0 {
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
-	/*B0-B7*/	"USERSPACE_RSTIND_BUFF","","","","","","","",
+	/*B0-B7*/	"USERSPACE_RSTIND_BUFF","","","","","","checkstop","",
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-- 
2.25.1

