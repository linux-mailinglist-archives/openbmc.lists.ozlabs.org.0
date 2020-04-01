Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946E19B0E1
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 18:32:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ssDL4SXTzDrBJ
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 03:32:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ssCJ450szDqDS
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 03:31:24 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031G21xG092145; Wed, 1 Apr 2020 12:31:21 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3020wf1eun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 12:31:21 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031GUJa0012663;
 Wed, 1 Apr 2020 16:31:20 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 301x7728xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 16:31:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031GVJcx53346678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 16:31:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AC2E112063;
 Wed,  1 Apr 2020 16:31:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B441112062;
 Wed,  1 Apr 2020 16:31:19 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.16.235])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 16:31:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2] soc: aspeed: xdma: Fix command buffer overrun
Date: Wed,  1 Apr 2020 11:31:17 -0500
Message-Id: <20200401163117.16921-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=1 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010135
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the case of an operation requiring two commands, the edge case at
the top of the command buffer was not handled, resulting in buffer
overrun. Fix this by using a loop to copy the commands into the buffer
and increment and modulo after each one.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 5d97919d38cf..7baeb20280b6 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -430,15 +430,19 @@ static void aspeed_xdma_start(struct aspeed_xdma *ctx,
 			      struct aspeed_xdma_op *op, u32 bmc_addr,
 			      struct aspeed_xdma_client *client)
 {
+	unsigned int i;
 	unsigned long flags;
 	struct aspeed_xdma_cmd cmds[2];
 	unsigned int rc = ctx->chip->set_cmd(ctx, cmds, op, bmc_addr);
 
 	mutex_lock(&ctx->start_lock);
 
-	memcpy(&ctx->cmdq[ctx->cmd_idx], cmds,
-	       rc * sizeof(struct aspeed_xdma_cmd));
-	ctx->cmd_idx = (ctx->cmd_idx + rc) % XDMA_NUM_CMDS;
+	for (i = 0; i < rc; ++i) {
+		memcpy(&ctx->cmdq[ctx->cmd_idx], &cmds[i],
+		       sizeof(struct aspeed_xdma_cmd));
+		ctx->cmd_idx = (ctx->cmd_idx + 1) % XDMA_NUM_CMDS;
+	}
+
 	ctx->upstream = !!op->direction;
 
 	spin_lock_irqsave(&ctx->client_lock, flags);
-- 
2.24.0

