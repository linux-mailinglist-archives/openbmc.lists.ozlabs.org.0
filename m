Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 067543ACE66
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 17:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G62Y05Zjmz3c0W
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:15:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bO0FgY0K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bO0FgY0K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G62Xd4pVPz2ykM
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 01:14:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IF3A4U192595; Fri, 18 Jun 2021 11:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=II8Hfa4VyIxB3XoGjAPfMNK6xL0rYUI7aWtYrNZimc8=;
 b=bO0FgY0KRmJcIGMRo3/wBB+oFVlJO9GFotN3XurcHZWRDhMoP1MUnXjYhWRWiHyxKX8V
 Lhy7DlcE5NGPEFI7OjgHnvMTvGfJ1yKb0h4Zd7nmVyWh/2YRjaq3UM2bmp5HyA7M0GCt
 w/FTUmjcV50/5/zL7txp4OSdCyYTflct6TLaus73ekXQtDifld3wIlGOkYa2sZuGfte6
 7tZuqvezsOseNMKWq0kyoOwJPV5vur8Dy7RdrLUcvVeGOHWsAukZFX24u2u6TNDvNEAR
 y9y19L7Y8k2VnQ3rYFHeDgV2tdKMVhdXVnDw51f4NY+G0gBCv+KtceYsOfEkl7iMlzNW Fw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398w6q1sf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 11:14:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15IF8Cdf013817;
 Fri, 18 Jun 2021 15:14:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 394mjb6muv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 15:14:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15IFEogg9568888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 15:14:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2764C124054;
 Fri, 18 Jun 2021 15:14:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6BEF124052;
 Fri, 18 Jun 2021 15:14:49 +0000 (GMT)
Received: from fstone04p1.aus.stglabs.ibm.com (unknown [9.3.116.247])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 15:14:49 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed-common: Add
 redundant env for mmc
Date: Fri, 18 Jun 2021 15:14:36 +0000
Message-Id: <20210618151436.2266046-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1xs3HE6lvu59c5pkATBCU7M-xMgvjqv5
X-Proofpoint-GUID: 1xs3HE6lvu59c5pkATBCU7M-xMgvjqv5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180089
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
Cc: Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

If the env is in MMC, specify the location of the redundant environment.
Per the ast2600_openbmc_spl_emmc_defconfig, the environment is located
at byte offset 0x5000 in the user data partition, and is sized at
0x10000. The redundant environment follows it immediately and is the
same size.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 include/configs/aspeed-common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
index 8f404570b1..59449d36d0 100644
--- a/include/configs/aspeed-common.h
+++ b/include/configs/aspeed-common.h
@@ -83,6 +83,7 @@
 #ifdef CONFIG_ENV_IS_IN_MMC
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		0
+#define CONFIG_ENV_OFFSET_REDUND	0x15000
 #endif
 
 #endif	/* __ASPEED_COMMON_CONFIG_H */
-- 
2.25.1

