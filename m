Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8765267EE
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FYN4Rnvz3cC8
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:11:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r32Qfyiz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r32Qfyiz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSY3WkWz3c7h
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:25 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DFg66c032595;
 Fri, 13 May 2022 17:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CGK6jVjA5dP+r1maCFQL7NxOA7RUqgbKFTwYT1tTsl4=;
 b=r32QfyizPw8iLEWuNXgnVygbJ1c9uk8X0qkwZSHM9BT6lcW5opEPYcFeOIZSrdlSQng6
 q2Lc4/lMbIuv5qE3ZYVOCbrqCYjonhP3RGXQUchutIEtzRdnvBITfBnRMADoOYeDAlqj
 IInHE/kHIAG5p2BwVo9QwfUwmYpBTW0RK+5XSUH3KGDFeCRykbvuaRqclwzMrhfJDxoy
 0a3t00i9rrywILRdLIZLX4g+GxSmmCQ3fl+kyhrhe6miQ/suWxSA6iUY21lLQUbgFKMT
 Mp177c0RQOBrdd96/r6vAbyr0hZKXC7b3J8IYqWv103RrMyJYLuxzBjcnBhXCrMp/l0u bw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1t6qsms8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:22 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGhQ12026231;
 Fri, 13 May 2022 17:07:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3fwgda3qdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:21 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7KT623658978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A0C8AC060;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91A11AC059;
 Fri, 13 May 2022 17:07:19 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 6/9] i2c: ast_i2c: Remove
 SCL direct drive mode
Date: Fri, 13 May 2022 12:07:12 -0500
Message-Id: <20220513170715.43475-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ns0TSMjm2ywwLxSLJ_8xDo33oNVoQ1A5
X-Proofpoint-GUID: ns0TSMjm2ywwLxSLJ_8xDo33oNVoQ1A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=901
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SCL direct drive mode prevents communication with devices that
do clock stretching, so disable. The Linux driver doesn't use
this mode, and the engine can handle clock stretching.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/ast_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
index bbc32d6cdb..13420ade84 100644
--- a/drivers/i2c/ast_i2c.c
+++ b/drivers/i2c/ast_i2c.c
@@ -73,7 +73,7 @@ static void ast_i2c_init_bus(struct udevice *dev)
 	/* Enable Master Mode. Assuming single-master */
 	writel(I2CD_MASTER_EN
 	       | I2CD_M_SDA_LOCK_EN
-	       | I2CD_MULTI_MASTER_DIS | I2CD_M_SCL_DRIVE_EN,
+	       | I2CD_MULTI_MASTER_DIS,
 	       &priv->regs->fcr);
 	/* Enable Interrupts */
 	writel(I2CD_INTR_TX_ACK
-- 
2.27.0

