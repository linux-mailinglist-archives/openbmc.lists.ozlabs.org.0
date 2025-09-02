Return-Path: <openbmc+bounces-562-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A2B40D34
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 20:33:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGZ931ckzz307q;
	Wed,  3 Sep 2025 04:32:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756837943;
	cv=none; b=Bm1YPwk3eXHDWG0G1mTBmByRMBKmGBg/h2+0CN3RS0yr/dJA7rrqml4USfas4GvWdHOUfbP/P+DHdnV5i8leeLn76AjjIrcgFrso29Kx4eb9bXJwX+K/G/1TgbQ80QMzY/ydbprFIUiRjed0sjft1qs80fzQCDyQj0shCSsnGszjKL5mGniMfD/rwGVlurwpLJ6H4lYenfOKsXJsxxsKzkUoNDBBBdnAU6U3idyV4rGpFa0fACDp6Qj5crbgf/TBqLu7iynOlmdTdyGlvh11EkBlzX+mTVOp2V9KiAytM+I34Kpyqfab1tGJbARm8ggvdnioKPXWkGTYCN1INOp7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756837943; c=relaxed/relaxed;
	bh=tE6oY0p93lBoSLiyE+sLGx2WPDYLPQILOwJ9TH8Qacs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkLWbwWP2VSv32MEnjO/Uio8WIZMUIzdu/HAYZMq7UEWHxO6Mz1zGDmMOvpjVuS0fhxoY3rfHbOiT9bEsCeowFQhgFTX0pJmAnzJR9RmKX5KJRfr5YbGqDxNNPMOf/oB+mH0FHXB0LCOvjkOqYkt4XUEZ1KICcqxHLbyinCfQuFIwS/SlPWF5phmeotC1eKAEq25nlS2z9WWsqM/fndyBDIs8GB1QZcnPkVTwixCC/exMoe/oMODPISHk9+1hW0/fNuBobIPwVpt7B408Ult7OD/6dwkGCi9msw6Q02zSszoK2pZCIdiA+QGelx2n2w5AH+16vOpWUFxA9Glwtp+uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbD5d13f; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbD5d13f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGZ903XQrz30NF
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 04:32:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582CCHeE001387;
	Tue, 2 Sep 2025 18:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tE6oY0p93lBoSLiyE
	+sLGx2WPDYLPQILOwJ9TH8Qacs=; b=NbD5d13fNj1wXcIR4F6ejG8H9v8WV9hfo
	xcgFiQa7Uk9iqhXy4OJzJETDfaD/7gZz0qwoznl/iWF0XmUU62ajo2K5gcgTxqDT
	czC6Atn15PUG3C+4a3JwFDN2gM7/MMBDcaOTRN6IW9f9Y6U4fgtO1xwcQhurmCtp
	lA7bo1EJGHlT6YKdNC7zJ/FT5mTG825oxHDoDSbjWQ5euhjG/JGZm/p2tFmVAbIR
	1tpQzJPtR7G622gEOSBFsRIKRVX69DFM2DRyHurLiQksAXfUa3VbbezQMotLO0H0
	cow4IRZCajWf6/5aPd0gxyG2qwMI/PXq1I/70kgIGKBzFQbxeU0cw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvfqwe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 582Fl96l019926;
	Tue, 2 Sep 2025 18:32:05 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmu45x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 582IW3CX64880988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Sep 2025 18:32:03 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCFA258045;
	Tue,  2 Sep 2025 18:32:03 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FC8258050;
	Tue,  2 Sep 2025 18:32:03 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Sep 2025 18:32:03 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v1 3/6] soc: aspeed: xdma: Add reset ioctl
Date: Tue,  2 Sep 2025 13:31:44 -0500
Message-ID: <20250902183155.2988560-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902183155.2988560-1-ninad@linux.ibm.com>
References: <20250902183155.2988560-1-ninad@linux.ibm.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=behrUPPB c=1 sm=1 tr=0 ts=68b73826 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=0oV1QDMFOXbsLJkSypIA:9
X-Proofpoint-ORIG-GUID: 2MRU9DvPMXY76uVh97x7sPgM_2jCiWeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX2E6qfIHSIz/L
 pjbidAUniwJ5BErtPCSJLsi/+zdbRlkDx+2b+/JxLs0xCCAZffneZyKdFED7cMd4jPD29V+sQ6G
 8Rf4J9NvKcy9ZKBL3x8P3QXe6/dM6dSeMThDRlMlWum6gz3XziMPT220EaJi/tnAXdDU7IRRuOf
 ++2e3q1w4GHFW8uJT4dQjpEsOBHfic/JhqyAa8vBfHG97R46v6N2OgExAd8AIiDajJN6Uf+Zq+o
 k//Zo6rIAO+6Wy/xcsOL5kha6WY/5dMwgW2+91HelXABF1pwPO0KYQWoiHNrWQz93J7WJwcUKI2
 DFp/yfTFO2SX+ZKqbR51F5SdxJwEcLB7IOOMjtQvoAH+W/ewWB7iQ9L4ZCTD7e/cXihzjDelVKI
 bBsAHtLe
X-Proofpoint-GUID: 2MRU9DvPMXY76uVh97x7sPgM_2jCiWeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eddie James <eajames@linux.ibm.com>

Users of the XDMA engine need a way to reset it if something goes wrong.
Problems on the host side, or user error, such as incorrect host
address, may result in the DMA operation never completing and no way to
determine what went wrong. Therefore, add an ioctl to reset the engine
so that users can recover in this situation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/1588697905-23444-5-git-send-email-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-xdma.c | 32 ++++++++++++++++++++++++++++++++
 include/uapi/linux/aspeed-xdma.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 584038e69d49e..565486ddb3b52 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -640,6 +640,37 @@ static __poll_t aspeed_xdma_poll(struct file *file,
 	return mask;
 }
 
+static long aspeed_xdma_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long param)
+{
+	unsigned long flags;
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	switch (cmd) {
+	case ASPEED_XDMA_IOCTL_RESET:
+		spin_lock_irqsave(&ctx->engine_lock, flags);
+		if (ctx->in_reset) {
+			spin_unlock_irqrestore(&ctx->engine_lock, flags);
+			return 0;
+		}
+
+		ctx->in_reset = true;
+		spin_unlock_irqrestore(&ctx->engine_lock, flags);
+
+		if (READ_ONCE(ctx->current_client))
+			dev_warn(ctx->dev,
+				 "User reset with transfer in progress.\n");
+
+		aspeed_xdma_reset(ctx);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
 {
 	int rc;
@@ -758,6 +789,7 @@ static const struct file_operations aspeed_xdma_fops = {
 	.owner			= THIS_MODULE,
 	.write			= aspeed_xdma_write,
 	.poll			= aspeed_xdma_poll,
+	.unlocked_ioctl		= aspeed_xdma_ioctl,
 	.mmap			= aspeed_xdma_mmap,
 	.open			= aspeed_xdma_open,
 	.release		= aspeed_xdma_release,
diff --git a/include/uapi/linux/aspeed-xdma.h b/include/uapi/linux/aspeed-xdma.h
index 2efaa6067c39b..3a3646fd1e9ec 100644
--- a/include/uapi/linux/aspeed-xdma.h
+++ b/include/uapi/linux/aspeed-xdma.h
@@ -4,8 +4,12 @@
 #ifndef _UAPI_LINUX_ASPEED_XDMA_H_
 #define _UAPI_LINUX_ASPEED_XDMA_H_
 
+#include <linux/ioctl.h>
 #include <linux/types.h>
 
+#define __ASPEED_XDMA_IOCTL_MAGIC	0xb7
+#define ASPEED_XDMA_IOCTL_RESET		_IO(__ASPEED_XDMA_IOCTL_MAGIC, 0)
+
 /*
  * aspeed_xdma_direction
  *
-- 
2.48.1


