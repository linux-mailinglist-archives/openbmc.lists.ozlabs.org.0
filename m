Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D2250B76
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:11:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb5vB3kNVzDqPW
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:11:50 +1000 (AEST)
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
 header.s=pp1 header.b=c/jBmCBq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb5tG0W0rzDqPC
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:11:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OM1d3u148238; Mon, 24 Aug 2020 18:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x0tq565f/IcyaHEkY2+oNRRmdXQ71HL5oRWzZqyx3NA=;
 b=c/jBmCBqYERidBRUC5ZBAQGYfiQzxIOKc6ynwDwm0SImD1MVoJkYuW4W4g74ReWivPc0
 V1m1en45QjpeDBXAvSAcWVugmgzvMdIS8vb0S2UEGWJYgnvMXyGr+TSK/FtmKPCnoRia
 ThSiaRamUg9qyCsb1r9BCxYWvR2ehX6k0tLz6Ecq5bMk2VawWPKNrgYGMq3Szb68IvUO
 ANB/k/UwX/Rw0BYi/jAU1zzp53/EFmNh+VWfeXTzmqox6lH5uMppQhLLPmwPrbW4rA/V
 UvK0C8Ehd0M2bxiBE/i18u8duOVfORytL4LUvtKI9sgGTdD7zKe0qvmHR9/8rOO4O6B7 3w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 334m6jugef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 18:10:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07OM2kqT022365;
 Mon, 24 Aug 2020 22:10:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 332uw74k04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 22:10:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07OMAsJm54198674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 22:10:54 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB3012408D;
 Mon, 24 Aug 2020 22:10:54 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BE1C124088;
 Mon, 24 Aug 2020 22:10:54 +0000 (GMT)
Received: from SHADE6A.ibmmodules.com (unknown [9.211.49.145])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Aug 2020 22:10:54 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 3/4] fsi: Aspeed master: Set clock frequency
 from devicetree
Date: Mon, 24 Aug 2020 17:10:50 -0500
Message-Id: <20200824221051.47972-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824221051.47972-1-eajames@linux.ibm.com>
References: <20200824221051.47972-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=1 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240170
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set the FSI clock frequency based on the value encoded in the
devicetree, if present.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c006ec008a1a..aedcc9be48ca 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -515,6 +515,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	struct fsi_master_aspeed *aspeed;
 	struct resource *res;
 	int rc, links, reg;
+	u32 clk_freq;
 	__be32 raw;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
@@ -539,6 +540,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		dev_err(aspeed->dev, "couldn't get clock\n");
 		return PTR_ERR(aspeed->clk);
 	}
+
+	if (!of_property_read_u32(pdev->dev.of_node, "clock-frequency",
+				  &clk_freq))
+		clk_set_rate(aspeed->clk, clk_freq);
+
 	rc = clk_prepare_enable(aspeed->clk);
 	if (rc) {
 		dev_err(aspeed->dev, "couldn't enable clock\n");
-- 
2.26.2

