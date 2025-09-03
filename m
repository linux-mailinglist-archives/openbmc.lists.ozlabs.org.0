Return-Path: <openbmc+bounces-583-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E46B42615
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j73QD9z3020;
	Thu,  4 Sep 2025 01:58:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915115;
	cv=none; b=Ei8cvqzswi9I87YSy3iucEDLEL/VnVzNR3z/m9PU5CEfHm0I0bvhcTntDSDoDWhdfNKYTQyn0iYSFfc7bPw4S81psABLTpmd7WMnTC7fMfAsVmN/YReiS35SZ8xS+GBs0SeUM/AJ1TZ/ki+zeLwEMWu7XQzCXxhZxA+jsYlzjWMUqnz/rG4p/joSTmyFciiIN5wjHH9k2QwGp0dwR2rfYr+BzPduJS9A42DPFh8HHDoY3eGmgSS0ofrqj/7JcqaYAlEgu+K+c00KD8ufv0lRY2gQHXhiicZog0Ww0U6SYl5Ca4o/Dw2inEk50jZEPqAR6swTY6tsNPuUFHbmylEx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915115; c=relaxed/relaxed;
	bh=zj4buNYtkzkyP+bI2+Zu0Z7q1Yt1aNyseCRAiOtc7u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gl88FJ6hfQV2dIo+PWauUaAYgZ+/lIGpWhRdi7wHMTo0PK8BaxJ3BoGfYdKGbnQTu6Uc76T+nteU4f8wu2ke1Y8y1ypBPNmxi/WIiG7y8UjOMcfou+5+GoMV3CmI34OonqH8BmDyvyHMlgWv8150O80XRCGH7ZAH70jT84lg/h0NGQ7+6cUw1nPdJ9+aSPELEqBHHQ0yD44WTPyaLWuy7O1q0dMr/26bGvFaoi1bH08a9y0qHwLR8y/NXqFog37ZAIJ1mAkHCDNKRUg/MreJPnR9WcaCe1thIhfqIr8eLndWOkPXQSthcLowKJ8gn49NPvSA7oRH43G+jGrAOVzmog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlaLlDis; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlaLlDis;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j53RpDz3050
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:33 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dpu3P001199;
	Wed, 3 Sep 2025 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zj4buNYtkzkyP+bI2
	+Zu0Z7q1Yt1aNyseCRAiOtc7u8=; b=rlaLlDis49XcpZHqZJuUBzY7e110uYOux
	jTEKmZmWhsF1+YoGDUmXUYEcSwpLyDiM0NLresOsrmuxdZnWCXwZhbnE37j9OKCt
	vKcpwSFDGeqiIYNbVfAc13eXOyDS6YQrZJhC60xdmIfrtE4XZzD4B4JmDb1uSvx9
	4+lPhrh81zHAsVz70cxnINZm5idiSRx714eLeHPNHz4fehV3mJCZRo/wclkieaZp
	qeI/UbJDF5detsiUafMlE3gNzytdP8zYKnG/2LGoatuCtChH1c7euex75QNRmi3D
	0iUhFsYv4qFkT6pKnCC485lHS2a/FT0V17zDFoaLaRRd1sD5Qi13Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf136d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583EZWEq021150;
	Wed, 3 Sep 2025 15:58:15 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmpr6kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwELp64160250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:14 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6C8958055;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60C1F5804E;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v2 4/6] soc: aspeed: xdma: Add trace events
Date: Wed,  3 Sep 2025 10:58:06 -0500
Message-ID: <20250903155810.2839634-5-ninad@linux.ibm.com>
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
X-Proofpoint-GUID: HVnf2_8gcnvHPoP239gc6HdxhTwjCZFV
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b86598 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=SK-G7dFLjMP9LiK210wA:9
X-Proofpoint-ORIG-GUID: HVnf2_8gcnvHPoP239gc6HdxhTwjCZFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfXwYtPEgVoFXuL
 /Mo6QbBt2A5lS5B0Uaj1EcFRoj/ytKj5J9icA2J9k0inT33j1/EHmPtojzt9gkyAAD03TtV1h5F
 bEz9bd0ktC51KEc7xsjA+9eJAZP+hsy2XlMQ5lO7btHXKSpiXHudGRq3I1czHcjZQE+gYrcl7xQ
 WIL7hGruXUUTCrXg5PaFBitvxcDf+Kp0Qq5uJ7l6U6WAQkYQ73GyPmi9BdB96+c5ef00M+XQuE3
 rsXo3JIm2Nog3KQS3Kzg82u0sVG4rlesJXszthc7GQK7M4CpY8PWTH1CpsI6VTC4vASGhaG5H5F
 nTNgHGdCgny7P2cDeqiFcX12XxZsN8MQFhcBtj2LtYmFN0RH1f+RyMV2JjNteDQEQynn4eKAdWD
 PFJCmZVY
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

Trace the flow of the driver to aid debugging after an error.

OpenBMC-Staging-Count: 6
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
Link: https://lore.kernel.org/r/20220412215331.42491-1-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c |  18 ++++-
 include/trace/events/xdma.h      | 126 +++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/xdma.h

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 40104602f5a2c..cb9bcfc44bc28 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -253,6 +253,9 @@ struct aspeed_xdma_client {
 	u32 size;
 };
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/xdma.h>
+
 static u32 aspeed_xdma_readl(struct aspeed_xdma *ctx, u8 reg)
 {
 	u32 v = readl(ctx->base + reg);
@@ -449,6 +452,7 @@ static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned int num_cmds,
 
 	ctx->upstream = upstream;
 	for (i = 0; i < num_cmds; ++i) {
+		trace_xdma_start(ctx, &cmds[i]);
 		/*
 		 * Use memcpy_toio here to get some barriers before starting
 		 * the operation. The command(s) need to be in physical memory
@@ -491,6 +495,8 @@ static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
 	spin_lock(&ctx->engine_lock);
 	status = aspeed_xdma_readl(ctx, ctx->chip->regs.status);
 
+	trace_xdma_irq(status);
+
 	if (status & ctx->chip->status_bits.ds_dirty) {
 		aspeed_xdma_done(ctx, true);
 	} else {
@@ -515,6 +521,8 @@ static void aspeed_xdma_reset(struct aspeed_xdma *ctx)
 {
 	unsigned long flags;
 
+	trace_xdma_reset(ctx);
+
 	reset_control_assert(ctx->reset);
 	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
 		     XDMA_ENGINE_SETUP_TIME_MAX_US);
@@ -545,7 +553,7 @@ static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
 {
 	struct aspeed_xdma *ctx = arg;
 
-	dev_dbg(ctx->dev, "PCI-E reset requested.\n");
+	trace_xdma_perst(ctx);
 
 	spin_lock(&ctx->engine_lock);
 	if (ctx->in_reset) {
@@ -683,6 +691,7 @@ static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
 
 	gen_pool_free(client->ctx->pool, (unsigned long)client->virt,
 		      client->size);
+	trace_xdma_unmap(client);
 
 	client->virt = NULL;
 	client->phys = 0;
@@ -707,6 +716,7 @@ static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
 	client->virt = gen_pool_dma_alloc(ctx->pool, client->size,
 					  &client->phys);
 	if (!client->virt) {
+		trace_xdma_mmap_error(client, 0UL);
 		client->phys = 0;
 		client->size = 0;
 		return -ENOMEM;
@@ -726,12 +736,14 @@ static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
 		gen_pool_free(ctx->pool, (unsigned long)client->virt,
 			      client->size);
 
+		trace_xdma_mmap_error(client, vma->vm_start);
 		client->virt = NULL;
 		client->phys = 0;
 		client->size = 0;
 		return rc;
 	}
 
+	trace_xdma_mmap(client);
 	dev_dbg(ctx->dev, "mmap: v[%08lx] to p[%08x], s[%08x]\n",
 		vma->vm_start, (u32)client->phys, client->size);
 
@@ -777,9 +789,11 @@ static int aspeed_xdma_release(struct inode *inode, struct file *file)
 	if (reset)
 		aspeed_xdma_reset(ctx);
 
-	if (client->virt)
+	if (client->virt) {
 		gen_pool_free(ctx->pool, (unsigned long)client->virt,
 			      client->size);
+		trace_xdma_unmap(client);
+	}
 
 	kfree(client);
 	kobject_put(&ctx->kobj);
diff --git a/include/trace/events/xdma.h b/include/trace/events/xdma.h
new file mode 100644
index 0000000000000..ac3cdd3ee898e
--- /dev/null
+++ b/include/trace/events/xdma.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xdma
+
+#if !defined(_TRACE_XDMA_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_XDMA_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(xdma_start,
+	    TP_PROTO(const struct aspeed_xdma *ctx, const struct aspeed_xdma_cmd *cmd),
+	    TP_ARGS(ctx, cmd),
+	    TP_STRUCT__entry(__field(bool,	dir_upstream)
+			     __field(unsigned int,	index)
+			     __field(__u64,	host)
+			     __field(__u64,	pitch)
+			     __field(__u64,	cmd)
+	    ),
+	    TP_fast_assign(__entry->dir_upstream = ctx->upstream;
+			   __entry->index = ctx->cmd_idx;
+			   __entry->host = cmd->host_addr;
+			   __entry->pitch = cmd->pitch;
+			   __entry->cmd = cmd->cmd;
+	    ),
+	    TP_printk("%s cmd:%u [%08llx %016llx %016llx]",
+		      __entry->dir_upstream ? "upstream" : "downstream",
+		      __entry->index,
+		      __entry->host,
+		      __entry->pitch,
+		      __entry->cmd
+	    )
+);
+
+TRACE_EVENT(xdma_irq,
+	    TP_PROTO(u32 sts),
+	    TP_ARGS(sts),
+	    TP_STRUCT__entry(__field(__u32,	status)
+	    ),
+	    TP_fast_assign(__entry->status = sts;
+	    ),
+	    TP_printk("sts:%08x",
+		      __entry->status
+	    )
+);
+
+TRACE_EVENT(xdma_reset,
+	    TP_PROTO(const struct aspeed_xdma *ctx),
+	    TP_ARGS(ctx),
+	    TP_STRUCT__entry(__field(bool,	dir_upstream)
+			     __field(bool,	in_progress)
+	    ),
+	    TP_fast_assign(__entry->dir_upstream = ctx->upstream;
+			   __entry->in_progress =
+			ctx->current_client ? ctx->current_client->in_progress : false;
+	    ),
+	    TP_printk("%sin progress%s",
+		      __entry->in_progress ? "" : "not ",
+		      __entry->in_progress ? (__entry->dir_upstream ?
+			" upstream" : " downstream") : ""
+	    )
+);
+
+TRACE_EVENT(xdma_perst,
+	    TP_PROTO(const struct aspeed_xdma *ctx),
+	    TP_ARGS(ctx),
+	    TP_STRUCT__entry(__field(bool,	in_reset)
+	    ),
+	    TP_fast_assign(__entry->in_reset = ctx->in_reset;
+	    ),
+	    TP_printk("%s",
+		      __entry->in_reset ? "in reset" : ""
+	    )
+);
+
+TRACE_EVENT(xdma_unmap,
+	    TP_PROTO(const struct aspeed_xdma_client *client),
+	    TP_ARGS(client),
+	    TP_STRUCT__entry(__field(__u32,	phys)
+			     __field(__u32,	size)
+	    ),
+	    TP_fast_assign(__entry->phys = client->phys;
+			   __entry->size = client->size;
+	    ),
+	    TP_printk("p:%08x s:%08x",
+		      __entry->phys,
+		      __entry->size
+	    )
+);
+
+TRACE_EVENT(xdma_mmap_error,
+	    TP_PROTO(const struct aspeed_xdma_client *client, unsigned long vm_start),
+	    TP_ARGS(client, vm_start),
+	    TP_STRUCT__entry(__field(__u32,	phys)
+			     __field(__u32,	size)
+			     __field(unsigned long,	vm_start)
+	    ),
+	    TP_fast_assign(__entry->phys = client->phys;
+			   __entry->size = client->size;
+			   __entry->vm_start = vm_start;
+	    ),
+	    TP_printk("p:%08x s:%08x v:%08lx",
+		      __entry->phys,
+		      __entry->size,
+		      __entry->vm_start
+	    )
+);
+
+TRACE_EVENT(xdma_mmap,
+	    TP_PROTO(const struct aspeed_xdma_client *client),
+	    TP_ARGS(client),
+	    TP_STRUCT__entry(__field(__u32,	phys)
+			     __field(__u32,	size)
+	    ),
+	    TP_fast_assign(__entry->phys = client->phys;
+			   __entry->size = client->size;
+	    ),
+	    TP_printk("p:%08x s:%08x",
+		      __entry->phys,
+		      __entry->size
+	    )
+);
+
+#endif /* _TRACE_XDMA_H */
+
+#include <trace/define_trace.h>
-- 
2.48.1


