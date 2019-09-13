Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67077B23FE
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 18:22:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VLWy35y9zF5bJ
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 02:22:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VLNR4r7LzF5fD
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 02:16:07 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DGF0jL030450; Fri, 13 Sep 2019 12:15:59 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0bptferr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 12:15:59 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8DGEeAw010032;
 Fri, 13 Sep 2019 16:15:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 2uytdx85c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:15:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DGFvda60031306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:15:57 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EFCD136055;
 Fri, 13 Sep 2019 16:15:57 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1FB3136051;
 Fri, 13 Sep 2019 16:15:56 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 16:15:56 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 v2 2/4] i2c: Aspeed: Avoid invalid resource
 warning for byte mode
Date: Fri, 13 Sep 2019 11:15:51 -0500
Message-Id: <1568391353-32584-3-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130163
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
Cc: andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If the Aspeed I2C busses don't have the buffer memory specified in the
devicetree, the probe function will throw a warning for non-AST2500
SOCs. This is unnecessary and confusing since operating in byte mode
is perfectly valid. Avoid this by checking the resource pointer before
attempting to map it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1943977..464c86a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1393,17 +1393,19 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		struct resource *res = platform_get_resource(pdev,
 							     IORESOURCE_MEM, 1);
 
-		bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(bus->buf_base) || resource_size(res) < 2) {
-			bus->buf_base = NULL;
-		} else {
-			bus->buf_size = resource_size(res);
-			if (of_device_is_compatible(pdev->dev.of_node,
-						    "aspeed,ast2400-i2c-bus")) {
-				bus->buf_page = ((res->start >> 8) &
-						 GENMASK(3, 0)) - 8;
-				bus->buf_offset = (res->start >> 2) &
-						  ASPEED_I2CD_BUF_OFFSET_MASK;
+		if (res) {
+			bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(bus->buf_base) || resource_size(res) < 2) {
+				bus->buf_base = NULL;
+			} else {
+				bus->buf_size = resource_size(res);
+				if (of_device_is_compatible(pdev->dev.of_node,
+							    "aspeed,ast2400-i2c-bus")) {
+					bus->buf_page = ((res->start >> 8) &
+						GENMASK(3, 0)) - 8;
+					bus->buf_offset = (res->start >> 2) &
+						ASPEED_I2CD_BUF_OFFSET_MASK;
+				}
 			}
 		}
 	}
-- 
1.8.3.1

