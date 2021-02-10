Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6973171A2
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 21:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbWz70xSNzDskR
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 07:47:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rqoIKV+K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbWyB2SRtzDrgT
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 07:46:25 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11AKh1FK009634; Wed, 10 Feb 2021 15:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=62mSej+8zTQ4S1I7q8inVdVoo2ZUxdI7kCjg5lna8z4=;
 b=rqoIKV+KTRIdYosS4mMENjLZpjJqCUYvrtJGJ7wPrH49vGnpxotQZquydhrkt2XvC788
 ZMEnqAfQK1s8phxSbNcWYA1xRA6th70QanM/sxartjOaG5moTv41NT42CTx/u3cN9Gw8
 FvULlCeVMlR6/XsO8SxWmMY8YUxhY5k0mnJ5ayEj0t/EP9tb0juQKiphTgTaOHMCCPqK
 CQ9BghVJlftaCeZhy3yYzpGPZf7eiFEFySNaCdAtxnEStZl/usWnhU47xg2CrwIJzfPj
 Y0T5rd39YZkd/MJkF35bmOV+wUUsweJz5lsjcGktOVxDgVWZL2GTfKPUOcX7GwPfS7GH 9w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mprq82dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 15:46:20 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11AKh8PE001142;
 Wed, 10 Feb 2021 20:46:19 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 36hjr9grhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 20:46:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11AKkHBQ20971902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 20:46:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE74C78060;
 Wed, 10 Feb 2021 20:46:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 836817805F;
 Wed, 10 Feb 2021 20:46:17 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.70.250])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 20:46:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] fsi: aspeed: Set poll timeout based on clock
 divider
Date: Wed, 10 Feb 2021 14:46:13 -0600
Message-Id: <20210210204613.49560-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_10:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100178
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

The timeout for polling for transfer acknowledgment on the OPB
was very long, occasionally resulting in scheduling problems.
Instead, use a timeout based on the clock divider specified with
the module parameter. In benchmarking, the worst case poll times
didn't increase significantly with increased divider until it
reached 16 and higher. The average poll time increased linearly
with the divider.

div  1: max:150us avg: 2us
div  2: max:155us avg: 3us
div  4: max:149us avg: 7us
div  8: max:153us avg:13us
div 16: max:197us avg:21us
div 32: max:181us avg:50us
div 64: max:262us avg:100us

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c71d7e9a32b0..13f7e07beacc 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -25,6 +25,7 @@ struct fsi_master_aspeed {
 	void __iomem		*base;
 	struct clk		*clk;
 	struct gpio_desc	*cfam_reset_gpio;
+	int			timeout_us;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -92,8 +93,6 @@ static const u32 fsi_base = 0xa0000000;
 static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
 module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
 
-#define OPB_POLL_TIMEOUT		10000
-
 static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 		       u32 val, u32 transfer_size)
 {
@@ -110,7 +109,7 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 				(reg & OPB0_XFER_ACK_EN) != 0,
-				0, OPB_POLL_TIMEOUT);
+				0, aspeed->timeout_us);
 
 	status = readl(base + OPB0_STATUS);
 
@@ -157,7 +156,7 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 			   (reg & OPB0_XFER_ACK_EN) != 0,
-			   0, OPB_POLL_TIMEOUT);
+			   0, aspeed->timeout_us);
 
 	status = readl(base + OPB0_STATUS);
 
@@ -609,6 +608,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, aspeed);
 
 	mutex_init(&aspeed->lock);
+	aspeed->timeout_us = min(10000, max(1, aspeed_fsi_divisor / 8) * 300);
 	aspeed_master_init(aspeed);
 
 	rc = fsi_master_register(&aspeed->master);
-- 
2.27.0

