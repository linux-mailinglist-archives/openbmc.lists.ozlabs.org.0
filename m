Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 226AF2E4DD
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 20:56:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dg1J4gl5zDqJB
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 04:56:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dg0r55ZpzDqC6
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 04:56:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TIqXXx114365
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 14:56:25 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sswvwmr9w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 14:56:25 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 29 May 2019 19:56:24 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 19:56:21 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TIuK7X38535320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 18:56:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB66AE064;
 Wed, 29 May 2019 18:56:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31AA7AE05F;
 Wed, 29 May 2019 18:56:20 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 18:56:20 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, clg@kaod.org, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed/flash: Add MX66L1G45G
 chip
Date: Wed, 29 May 2019 13:56:19 -0500
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19052918-0040-0000-0000-000004F607FE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210388; UDB=6.00635917; IPR=6.00991420; 
 MB=3.00027105; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 18:56:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052918-0041-0000-0000-0000090221A3
Message-Id: <1559156179-60850-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=911 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290122
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

The MX66L1G45G is a 128MB SPI NOR flash chip to be used in
Swift machines which are AST2500 systems.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/mach-aspeed/flash.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index db69d51..cc59707 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -78,6 +78,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
 #define MX25L12805D		0x1820C2
 #define MX25L25635E		0x1920C2
 #define MX66L51235F		0x1A20C2
+#define MX66L1G45G		0x1B20C2
 #define SST25VF016B		0x4125bf
 #define SST25VF064C		0x4b25bf
 #define SST25VF040B		0x8d25bf
@@ -1077,6 +1078,20 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 			ReadClk  = 50;
 			break;
 
+		case MX66L1G45G:
+			info->sector_count = 2048;
+			info->size = 0x8000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			info->address32 = 1;
+			break;
+
 		case SST25VF016B:
 			info->sector_count = 32;
 			info->size = 0x200000;
-- 
1.8.3.1

