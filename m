Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40391194884
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 21:16:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pGTX2V0mzDr2j
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:16:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pGRF5hSdzDqys
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 07:14:17 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QK4TcD033065; Thu, 26 Mar 2020 16:14:14 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2kva83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 16:14:14 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02QKAJwS022257;
 Thu, 26 Mar 2020 20:14:13 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2ywawmfg27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 20:14:13 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QKEBhN29229438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 20:14:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06CBBE058;
 Thu, 26 Mar 2020 20:14:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6867DBE059;
 Thu, 26 Mar 2020 20:14:11 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.163.52.120])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 20:14:11 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/4] soc: aspeed: xdma: Switch to reserved memory
Date: Thu, 26 Mar 2020 15:14:00 -0500
Message-Id: <1585253643-23634-2-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585253643-23634-1-git-send-email-eajames@linux.ibm.com>
References: <1585253643-23634-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_12:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=1 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=735 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260144
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

Use a reserved memory node with no-map for the memory used by the XDMA
engine. This replaces the memory property previously used to access the
reserved VGA memory space.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 5d97919..470fe6d 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
@@ -845,10 +846,11 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	int rc;
 	int irq;
 	int pcie_irq;
-	u32 memory[2];
 	struct regmap *sdmc;
 	struct aspeed_xdma *ctx;
+	struct reserved_mem *mem;
 	struct device *dev = &pdev->dev;
+	struct device_node *memory_region;
 	const void *md = of_device_get_match_data(dev);
 
 	if (!md)
@@ -910,19 +912,25 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rc = of_property_read_u32_array(dev->of_node, "memory", memory, 2);
-	if (rc) {
-		dev_err(dev, "Unable to get memory space.\n");
-		return rc;
+	memory_region = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!memory_region) {
+		dev_err(dev, "Unable to get memory-region.\n");
+		return -ENOMEM;
 	}
 
-	ctx->mem_phys = memory[0];
-	ctx->mem_size = memory[1];
+	mem = of_reserved_mem_lookup(memory_region);
+	if (!mem) {
+		dev_err(dev, "Unable to find reserved memory.\n");
+		return -ENOMEM;
+	}
+
+	ctx->mem_phys = mem->base;
+	ctx->mem_size = mem->size;
 
 	ctx->mem_virt = devm_ioremap(dev, ctx->mem_phys, ctx->mem_size);
-	if (IS_ERR(ctx->mem_virt)) {
+	if (!ctx->mem_virt) {
 		dev_err(dev, "Failed to map memory space.\n");
-		return PTR_ERR(ctx->mem_virt);
+		return -ENOMEM;
 	}
 
 	rc = gen_pool_add_virt(ctx->pool, (unsigned long)ctx->mem_virt,
-- 
1.8.3.1

