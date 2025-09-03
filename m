Return-Path: <openbmc+bounces-585-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE53B4261A
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j84HPPz30RJ;
	Thu,  4 Sep 2025 01:58:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915116;
	cv=none; b=ndx2ru33r+zsaUWs6wxOIhOe13tFsJvOLrQwfiOkwLQGA4UzZeEfo2RJVDdGRhvEWDZrZ+1db2mQuMQlAlTqfjoCIDReYsgqhdPShORYZfGOH7nP1AQH6NAUZtxbRsam14raGMCfpAhEppkV7Lq43dJJNGtKyUp+HSQBx/pWsmd00L1ov9HhXCLFDwTjFSSUxtg+l2QmvYvoLP60mrmMgZtffy5TWaNy+QFm8kg8eg7IZmw7ktMa+9kux1QBvZJfRGa9tD/cg2IXrekMJ6hhUQqUGxG4zYztwgxp9EVvzXkaJ/0jkUy3vNOLHC9rGLKdLPTu3VzZV8NSSBwB7dxGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915116; c=relaxed/relaxed;
	bh=pKcXsQePEJuzNAegopJRv16TDmpqhASwIMPf0d49eOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQ6GwCYzVLX6wwjUmaN9vSbTmczCWi1pnY4sQYmineL7wP5w1zuVltAr6xlp9RwvNoi6bVEVTrjU5E/YbH6f6egwWsg/KH3TqYLkTqkCOhxim6NuNgs6MGsYiq+eCwPUAnF/RDINncB35o0fsa0a3nwtJFtDiMuwJVj7zdaPiJBhjk4JfTgiIdHPcNGhdNJ8E/TMCbQJ66BNkqfJogMEhKBE3NnGdHU3ZQ1rawexHPSuPPorB0JBp6vd0cHC2+4tvuAIGNPvti5n7QnL0SE7v40LnuAV1Xpd3KCaSqrEe75r4AloF9t0ihsI5VhnV0XlGh1sTEKqvfk7zxFbqO0JsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kXrWxUeu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kXrWxUeu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j61gzpz30Bd
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:33 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583CpCj7032366;
	Wed, 3 Sep 2025 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pKcXsQePEJuzNAego
	pJRv16TDmpqhASwIMPf0d49eOw=; b=kXrWxUeuVPUrKNB4g8mL+uQUVDDp3a+Ck
	hrqWN9Yjq5jZaq55jWv1rvfuXk6H0dMa6ztw5KCzukF9p6ODeD2HNtxJTM0wq/Aa
	GZlxso3esUhjZCrEev+D+0UzlClhtPMNv1kY4zLd93evqhUoAOaK+PL5Wy8YtOKI
	rrTSXAf7MywxVO6GgQEPrcK0UghMZIVYxlxB3tGaIhjz6rAOKSMaB2vtl/AXPyFj
	3rXsX58JaOXySkwXyUYJyOumISPepZg04EiSlN7fPXBBJeqN0opGPLpObOZOylrs
	Y8ZnCsjBNZKfgWnQoTTWbpiwylEvh94+xmFAChmst3lt1LaLNxSAA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf136a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583EaCrO019363;
	Wed, 3 Sep 2025 15:58:15 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vd4n0427-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwEOO14942866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:14 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B98058054;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9D145804E;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v2 3/6] soc: aspeed: xdma: Add reset ioctl
Date: Wed,  3 Sep 2025 10:58:05 -0500
Message-ID: <20250903155810.2839634-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903155810.2839634-1-ninad@linux.ibm.com>
References: <20250903155810.2839634-1-ninad@linux.ibm.com>
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
X-Proofpoint-GUID: eZYx50jyWOQ_KZ7FdyyS5IGbFN7OMMnc
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b86597 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=0oV1QDMFOXbsLJkSypIA:9
X-Proofpoint-ORIG-GUID: eZYx50jyWOQ_KZ7FdyyS5IGbFN7OMMnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX49OdMTwhFOUI
 TDL5LE0qBvS/D9FF3vFSS8JUXKq1a8DwDoXxjUYAmvmQMEfY7oWQ4o0eUf2NRrea27LBXbqqZK2
 dl/t9CRsus9JDVs6haRIarAO43CanfIrR1uDtSrjnf8hTHROreYNZ4/C+aCG37A1uaxD08ulV+D
 /UY8GAiRFnD8frlZpQzy/+3ZKP4SUh8HezZwhcc36Mpd4WEjUk7ZOhPYdX2z0/W/zBZ9DREHCGT
 l8J/pb5V6avaid6A4fl/nL8mexxvh55EOitMoYrw3uZMDViq6KXKW55/MOH2XaYWW3CXTgdjJDC
 mzvca3cf7ShmApgWFGLFL6G4aldYzmnm7gosuWerChVF/LvL1Rr1jQOit6xQX7r+LBhMu/LR6q+
 iUozyIsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
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
index d1b0a047c8798..40104602f5a2c 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -641,6 +641,37 @@ static __poll_t aspeed_xdma_poll(struct file *file,
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
@@ -759,6 +790,7 @@ static const struct file_operations aspeed_xdma_fops = {
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


