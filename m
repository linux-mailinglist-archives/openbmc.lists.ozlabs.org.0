Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC027D61E
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 20:50:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C17k00dcLzDqXq
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 04:50:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xp+oQ7/F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C17j42gtDzDqVK
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 04:49:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TIZKO9171969; Tue, 29 Sep 2020 14:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=E5cY1/tjOEoeCJNAjelZAr+oxtXfR0fCeruUpai2mZE=;
 b=Xp+oQ7/F2jg7IwqzX03Q2mIO56gxcY8sbZyIXDX7tTZxOGC3+USYQJvS7awUzfnefxpo
 dWJTiqtl/ITq3U6a1DA0UamjYnHNsSK+FDJo6d10J0FjUhkzTKtkME+Lv+/zMzWPIphC
 pwNuY9Djzcvt4uDEPTE1JNmvfckhgVZjxN9C9bs73PtvRRhDUSdE4xSc8KlHx+zbbtr+
 BOOMX59vW0wwVN4kHcCF46Xkeg2smprPChlhWZgTraLCYBz5Hw4AmjdUML2E7ModLvn3
 evcRl5eaKyZDHE/jPSpH0Jte/7GBREAa23+WFaPRnlsHAHXDnD+lHdl8BeY0Oeg0IUes tg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33v8p83nn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 14:49:22 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TIl3BV010034;
 Tue, 29 Sep 2020 18:49:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 33sw996nm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 18:49:21 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08TInKcM30736818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 18:49:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7510AC05F;
 Tue, 29 Sep 2020 18:49:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CCD0AC05B;
 Tue, 29 Sep 2020 18:49:20 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.100.223])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 Sep 2020 18:49:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] fsi: Aspeed: Add mutex to protect HW access
Date: Tue, 29 Sep 2020 13:49:16 -0500
Message-Id: <20200929184916.33247-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_11:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=995 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=1 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290153
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

There is nothing to prevent multiple commands being executed
simultaneously. Add a mutex to prevent this.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 48 ++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c006ec008a1a..c71d7e9a32b0 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -8,6 +8,7 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -19,6 +20,7 @@
 
 struct fsi_master_aspeed {
 	struct fsi_master	master;
+	struct mutex		lock;	/* protect HW access */
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
@@ -254,6 +256,8 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
+	mutex_lock(&aspeed->lock);
+
 	switch (size) {
 	case 1:
 		ret = opb_readb(aspeed, fsi_base + addr, val);
@@ -265,14 +269,14 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		ret = opb_readl(aspeed, fsi_base + addr, val);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto done;
 	}
 
 	ret = check_errors(aspeed, ret);
-	if (ret)
-		return ret;
-
-	return 0;
+done:
+	mutex_unlock(&aspeed->lock);
+	return ret;
 }
 
 static int aspeed_master_write(struct fsi_master *master, int link,
@@ -287,6 +291,8 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	addr |= id << 21;
 	addr += link * FSI_HUB_LINK_SIZE;
 
+	mutex_lock(&aspeed->lock);
+
 	switch (size) {
 	case 1:
 		ret = opb_writeb(aspeed, fsi_base + addr, *(u8 *)val);
@@ -298,14 +304,14 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		ret = opb_writel(aspeed, fsi_base + addr, *(__be32 *)val);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto done;
 	}
 
 	ret = check_errors(aspeed, ret);
-	if (ret)
-		return ret;
-
-	return 0;
+done:
+	mutex_unlock(&aspeed->lock);
+	return ret;
 }
 
 static int aspeed_master_link_enable(struct fsi_master *master, int link,
@@ -317,20 +323,23 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link,
 
 	idx = link / 32;
 	bit = link % 32;
-
 	reg = cpu_to_be32(0x80000000 >> bit);
 
-	if (!enable)
-		return opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx),
-				  reg);
+	mutex_lock(&aspeed->lock);
 
-	ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
+	if (!enable)
+		ret = opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx),
+				 reg);
+	else
+		ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx),
+				 reg);
 	if (ret)
-		return ret;
+		goto done;
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	return 0;
+done:
+	mutex_unlock(&aspeed->lock);
+	return ret;
 }
 
 static int aspeed_master_term(struct fsi_master *master, int link, uint8_t id)
@@ -431,9 +440,11 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 {
 	struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
 
+	mutex_lock(&aspeed->lock);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
 	usleep_range(900, 1000);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
+	mutex_unlock(&aspeed->lock);
 
 	return count;
 }
@@ -597,6 +608,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
+	mutex_init(&aspeed->lock);
 	aspeed_master_init(aspeed);
 
 	rc = fsi_master_register(&aspeed->master);
-- 
2.26.2

