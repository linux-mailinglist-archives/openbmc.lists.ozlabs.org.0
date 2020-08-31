Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68574258183
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:04:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKPm5rpPzDqD3
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:04:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YzWIo/+y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKLc4crrzDqTX
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:01:44 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VJ12WM125736; Mon, 31 Aug 2020 15:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yM65+Ng+gt0fpZ+t/McwEVwoWB7ZUOHovnhwbDyjy7U=;
 b=YzWIo/+ysaiyAIPFPEZn7EAVGsDzkevP7/g4DC59kMi34XLJQisKeHXtx4P+nGlf1eKM
 +31f0AlWYROl77Hv3iCYee3KlHC3akSs294jsot/DAW2+rs4MVzdyLXnKgj2t8OcgKMz
 Gqt54IX3IZyeXwp5qjuXP3uvaucivt9gIeW1SxKT5spgnzRU/doPxXqT6jG6Kjxodlla
 mYaZWA5Kpfike0u/3V1l4mzE2oFQyzle7v4ejFHZ4LBH3myl5vBOgx9JFV7BYa6v1IgQ
 Z/RhQ3SMU7Z6/l7P+yceZ3JxgAgvxobr62csly9D38F1Q5/ijoyeM8dAig2WojDxdm0g Og== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3395dt2hgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:01:41 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIv5FL014808;
 Mon, 31 Aug 2020 19:01:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 337en927ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1e9T51577330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78B8FAE05C;
 Mon, 31 Aug 2020 19:01:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05CB1AE05F;
 Mon, 31 Aug 2020 19:01:40 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/5] mmc: Add support for
 devicetree parameters for Aspeed controller
Date: Mon, 31 Aug 2020 14:01:28 -0500
Message-Id: <20200831190130.47060-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831190130.47060-1-eajames@linux.ibm.com>
References: <20200831190130.47060-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_09:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 suspectscore=13 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310110
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

The Aspeed SDHC needs some additional parameters set to function
correctly. These should be encoded in the devicetree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/mmc/aspeed_sdhci.c    |  2 ++
 drivers/mmc/aspeed_sdhci_ic.c | 16 ++++++++++++++++
 drivers/mmc/sdhci.c           |  8 ++++++++
 include/mmc.h                 |  1 +
 include/sdhci.h               |  6 +++++-
 5 files changed, 32 insertions(+), 1 deletion(-)
 mode change 100755 => 100644 drivers/mmc/aspeed_sdhci.c

diff --git a/drivers/mmc/aspeed_sdhci.c b/drivers/mmc/aspeed_sdhci.c
old mode 100755
new mode 100644
index f4cdfe039f..36cbf29db5
--- a/drivers/mmc/aspeed_sdhci.c
+++ b/drivers/mmc/aspeed_sdhci.c
@@ -93,6 +93,8 @@ static int aspeed_sdhci_probe(struct udevice *dev)
 	host->mmc = &plat->mmc;
 	if (ret)
 		return ret;
+
+	host->mmc->drv_type = dev_read_u32_default(dev, "sdhci-drive-type", 0);
 	host->mmc->priv = host;
 	host->mmc->dev = dev;
 	upriv->mmc = host->mmc;
diff --git a/drivers/mmc/aspeed_sdhci_ic.c b/drivers/mmc/aspeed_sdhci_ic.c
index fd62ab3eae..b8dd5d52f9 100644
--- a/drivers/mmc/aspeed_sdhci_ic.c
+++ b/drivers/mmc/aspeed_sdhci_ic.c
@@ -9,6 +9,10 @@
 #include <errno.h>
 #include <fdtdec.h>
 #include <asm/io.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+
+#define TIMING_PHASE_OFFSET 0xf4
 
 struct aspeed_sdhci_general_reg {
 	u32 genreal_info;
@@ -32,6 +36,9 @@ static int aspeed_sdhci_irq_probe(struct udevice *dev)
 {
 	struct aspeed_sdhci_general_data *priv = dev_get_priv(dev);
 	int ret = 0;
+	struct resource regs;
+	void __iomem  *sdhci_ctrl_base;
+	u32 timing_phase;
 
 	debug("%s(dev=%p) \n", __func__, dev);
 
@@ -41,6 +48,15 @@ static int aspeed_sdhci_irq_probe(struct udevice *dev)
 		return ret;
 	}
 
+	ret = dev_read_resource(dev, 0, &regs);
+	if (ret < 0)
+		return ret;
+
+	sdhci_ctrl_base = (void __iomem  *)regs.start;
+
+	timing_phase = dev_read_u32_default(dev, "timing-phase", 0);
+	writel(timing_phase, sdhci_ctrl_base + TIMING_PHASE_OFFSET);
+
 	return 0;
 }
 
diff --git a/drivers/mmc/sdhci.c b/drivers/mmc/sdhci.c
index ff506cdf9d..2505d5b8be 100644
--- a/drivers/mmc/sdhci.c
+++ b/drivers/mmc/sdhci.c
@@ -460,6 +460,7 @@ static int sdhci_set_ios(struct mmc *mmc)
 #endif
 	u32 ctrl;
 	u32 gen_addr, gen_ctrl;
+	u16 ctrl_2;
 	struct sdhci_host *host = mmc->priv;
 
 	if (host->ops && host->ops->set_control_reg)
@@ -518,6 +519,13 @@ static int sdhci_set_ios(struct mmc *mmc)
 
 	sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
 
+	if ((SDHCI_GET_VERSION(host) >= SDHCI_SPEC_300)) {
+		ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL_2);
+		ctrl_2 &= ~SDHCI_DRIVER_STRENGTH_MASK;
+		ctrl_2 |= host->mmc->drv_type << SDHCI_DRIVER_STRENGTH_SHIFT;
+		sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL_2);
+	}
+
 	/* If available, call the driver specific "post" set_ios() function */
 	if (host->ops && host->ops->set_ios_post)
 		host->ops->set_ios_post(host);
diff --git a/include/mmc.h b/include/mmc.h
index 1f30f71d25..4834dbaf81 100644
--- a/include/mmc.h
+++ b/include/mmc.h
@@ -639,6 +639,7 @@ struct mmc {
 				  * accessing the boot partitions
 				  */
 	u32 quirks;
+	int drv_type;
 };
 
 struct mmc_hwpart_conf {
diff --git a/include/sdhci.h b/include/sdhci.h
index 14884e4dbb..6f85895480 100644
--- a/include/sdhci.h
+++ b/include/sdhci.h
@@ -144,7 +144,11 @@
 
 #define SDHCI_ACMD12_ERR	0x3C
 
-/* 3E-3F reserved */
+#define SDHCI_HOST_CONTROL_2        0x3E
+#define SDHCI_DRIVER_STRENGTH_MASK  0x30
+#define SDHCI_DRIVER_STRENGTH_SHIFT 4
+
+/* 3F reserved */
 
 #define SDHCI_CAPABILITIES	0x40
 #define  SDHCI_TIMEOUT_CLK_MASK	0x0000003F
-- 
2.26.2

