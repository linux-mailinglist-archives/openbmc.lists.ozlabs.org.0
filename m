Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599051CA98
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 22:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvQKc1bmBz3by0
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 06:29:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gDUdb66r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gDUdb66r; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQJT2VT6z3brQ
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 06:28:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245KKmhl020491;
 Thu, 5 May 2022 20:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CGK6jVjA5dP+r1maCFQL7NxOA7RUqgbKFTwYT1tTsl4=;
 b=gDUdb66rXGYHaSJTYqO7n2r/tSguPIvPUDnZNQ41mGjYlq8mo4hKpqw+d7M7Y2oQHHpl
 q9Xxjn0EtM9R8d6n7e1PRed8dHZ/sTn3nVrtthnwrx5t6enF+VqbtgIHZsZJJP+rju4z
 TaU3aDMPp8hQKL2U3SJsekiGVVDxKEvRT+lWZtVrptxjzTWCAFP4mE3MbEvtFhoDa/nF
 qOdgg87CIvpD8sK5GFvpP4cNWD81sSfs46xlwi6sI/GTjb3VBIk4GhR5jk/8n4f/yKWa
 EAMQfKwUai/icrLZNuY4Rp3DIwV6uPLPrN0bFqY1A9KiXcNW27273BI/E6pt1v7fgPas SQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvnhq03p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:37 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245KSJmM003151;
 Thu, 5 May 2022 20:28:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3frvr9v0yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:37 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245KSadb19726682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 20:28:36 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDB41136061;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0DC3136059;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.0.208])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/5] i2c: ast_i2c: Remove SCL
 direct drive mode
Date: Thu,  5 May 2022 15:28:25 -0500
Message-Id: <20220505202829.31466-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220505202829.31466-1-eajames@linux.ibm.com>
References: <20220505202829.31466-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lj-2-MFUThJndSEFCRgCFFrZDN-9QIG5
X-Proofpoint-GUID: Lj-2-MFUThJndSEFCRgCFFrZDN-9QIG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_08,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=896 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050132
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

