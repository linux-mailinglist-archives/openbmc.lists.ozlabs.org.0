Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98B4FEA08
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 23:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdKHd3y4dz3bbV
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 07:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esHksH9F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=esHksH9F; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdKH84j3Bz2yjS
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 07:53:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CIq62s008918; 
 Tue, 12 Apr 2022 21:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5ZkrzaTrlAKgPKE+Khh+8AGo56o/+j6RgYnel+Ywr6I=;
 b=esHksH9FqMEPLJadvjLr3j4dsYVaLqVDcfUi4bpIWj0RIkq7RzXyLfI6Ep+G7Iw0JCfh
 mrtrPDhaO807Eblj+n0y0rTifYBw1dMyr0FSVHVnMpDlBtnjHtkPO4ExA+kXvd49XZ03
 9JYq0TiqVweaMsZaQ8gThI3dHBwLC6jW4wf8nWxYs0nKtjf6BD7Eg464+cH+DpXSgaP/
 bsyqQt1DENURaZwy9fzdH2TrjfeXh6jpsFXg2JtFqMeVru8RqqMSo1/goeQoiuliIiH+
 Icwg2gQnhDXYQ91ptzvj7mxQRhER+k2LcKOgc/UsaV/4f/bd/bP8KTDA9YLEu7McxY6I mA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdf30bchq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 21:53:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CLhff0028621;
 Tue, 12 Apr 2022 21:53:36 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3fb1s9u8h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 21:53:36 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CLrZ2e25821552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 21:53:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47AF3AE05F;
 Tue, 12 Apr 2022 21:53:35 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8428AE060;
 Tue, 12 Apr 2022 21:53:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.113.187])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 21:53:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] soc: aspeed: xdma: Add trace events
Date: Tue, 12 Apr 2022 16:53:31 -0500
Message-Id: <20220412215331.42491-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z2xP_R_UROlmyBNM-2669BZL0E3q50sN
X-Proofpoint-ORIG-GUID: z2xP_R_UROlmyBNM-2669BZL0E3q50sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120099
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Trace the flow of the driver to aid debugging after an error.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c |  18 +++-
 include/trace/events/xdma.h      | 139 +++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/xdma.h

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 48cfe30c90ad..579937ee3745 100644
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
@@ -448,6 +451,7 @@ static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned int num_cmds,
 
 	ctx->upstream = upstream;
 	for (i = 0; i < num_cmds; ++i) {
+		trace_xdma_start(ctx, &cmds[i]);
 		/*
 		 * Use memcpy_toio here to get some barriers before starting
 		 * the operation. The command(s) need to be in physical memory
@@ -490,6 +494,8 @@ static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
 	spin_lock(&ctx->engine_lock);
 	status = aspeed_xdma_readl(ctx, ctx->chip->regs.status);
 
+	trace_xdma_irq(status);
+
 	if (status & ctx->chip->status_bits.ds_dirty) {
 		aspeed_xdma_done(ctx, true);
 	} else {
@@ -514,6 +520,8 @@ static void aspeed_xdma_reset(struct aspeed_xdma *ctx)
 {
 	unsigned long flags;
 
+	trace_xdma_reset(ctx);
+
 	reset_control_assert(ctx->reset);
 	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
 		     XDMA_ENGINE_SETUP_TIME_MAX_US);
@@ -544,7 +552,7 @@ static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
 {
 	struct aspeed_xdma *ctx = arg;
 
-	dev_dbg(ctx->dev, "PCI-E reset requested.\n");
+	trace_xdma_perst(ctx);
 
 	spin_lock(&ctx->engine_lock);
 	if (ctx->in_reset) {
@@ -682,6 +690,7 @@ static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
 
 	gen_pool_free(client->ctx->pool, (unsigned long)client->virt,
 		      client->size);
+	trace_xdma_unmap(client);
 
 	client->virt = NULL;
 	client->phys = 0;
@@ -706,6 +715,7 @@ static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
 	client->virt = gen_pool_dma_alloc(ctx->pool, client->size,
 					  &client->phys);
 	if (!client->virt) {
+		trace_xdma_mmap_error(client, 0UL);
 		client->phys = 0;
 		client->size = 0;
 		return -ENOMEM;
@@ -725,12 +735,14 @@ static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
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
 
@@ -776,9 +788,11 @@ static int aspeed_xdma_release(struct inode *inode, struct file *file)
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
index 000000000000..bf515ad3d8e5
--- /dev/null
+++ b/include/trace/events/xdma.h
@@ -0,0 +1,139 @@
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
+	TP_PROTO(const struct aspeed_xdma *ctx, const struct aspeed_xdma_cmd *cmd),
+	TP_ARGS(ctx, cmd),
+	TP_STRUCT__entry(
+		__field(bool,	dir_upstream)
+		__field(unsigned int,	index)
+		__field(__u64,	host)
+		__field(__u64,	pitch)
+		__field(__u64,	cmd)
+	),
+	TP_fast_assign(
+		__entry->dir_upstream = ctx->upstream;
+		__entry->index = ctx->cmd_idx;
+		__entry->host = cmd->host_addr;
+		__entry->pitch = cmd->pitch;
+		__entry->cmd = cmd->cmd;
+	),
+	TP_printk("%s cmd:%u [%08llx %016llx %016llx]",
+		__entry->dir_upstream ? "upstream" : "downstream",
+		__entry->index,
+		__entry->host,
+		__entry->pitch,
+		__entry->cmd
+	)
+);
+
+TRACE_EVENT(xdma_irq,
+	TP_PROTO(u32 sts),
+	TP_ARGS(sts),
+	TP_STRUCT__entry(
+		__field(__u32,	status)
+	),
+	TP_fast_assign(
+		__entry->status = sts;
+	),
+	TP_printk("sts:%08x",
+		__entry->status
+	)
+);
+
+TRACE_EVENT(xdma_reset,
+	TP_PROTO(const struct aspeed_xdma *ctx),
+	TP_ARGS(ctx),
+	TP_STRUCT__entry(
+		__field(bool,	dir_upstream)
+		__field(bool,	in_progress)
+	),
+	TP_fast_assign(
+		__entry->dir_upstream = ctx->upstream;
+		__entry->in_progress =
+			ctx->current_client ? ctx->current_client->in_progress : false;
+	),
+	TP_printk("%sin progress%s",
+		__entry->in_progress ? "" : "not ",
+		__entry->in_progress ? (__entry->dir_upstream ? " upstream" : " downstream") : ""
+	)
+);
+
+TRACE_EVENT(xdma_perst,
+	TP_PROTO(const struct aspeed_xdma *ctx),
+	TP_ARGS(ctx),
+	TP_STRUCT__entry(
+		__field(bool,	in_reset)
+	),
+	TP_fast_assign(
+		__entry->in_reset = ctx->in_reset;
+	),
+	TP_printk("%s",
+		__entry->in_reset ? "in reset" : ""
+	)
+);
+
+TRACE_EVENT(xdma_unmap,
+	TP_PROTO(const struct aspeed_xdma_client *client),
+	TP_ARGS(client),
+	TP_STRUCT__entry(
+		__field(__u32,	phys)
+		__field(__u32,	size)
+	),
+	TP_fast_assign(
+		__entry->phys = client->phys;
+		__entry->size = client->size;
+	),
+	TP_printk("p:%08x s:%08x",
+		__entry->phys,
+		__entry->size
+	)
+);
+
+TRACE_EVENT(xdma_mmap_error,
+	TP_PROTO(const struct aspeed_xdma_client *client, unsigned long vm_start),
+	TP_ARGS(client, vm_start),
+	TP_STRUCT__entry(
+		__field(__u32,	phys)
+		__field(__u32,	size)
+		__field(unsigned long,	vm_start)
+	),
+	TP_fast_assign(
+		__entry->phys = client->phys;
+		__entry->size = client->size;
+		__entry->vm_start = vm_start;
+	),
+	TP_printk("p:%08x s:%08x v:%08lx",
+		__entry->phys,
+		__entry->size,
+		__entry->vm_start
+	)
+);
+
+TRACE_EVENT(xdma_mmap,
+	TP_PROTO(const struct aspeed_xdma_client *client),
+	TP_ARGS(client),
+	TP_STRUCT__entry(
+		__field(__u32,	phys)
+		__field(__u32,	size)
+	),
+	TP_fast_assign(
+		__entry->phys = client->phys;
+		__entry->size = client->size;
+	),
+	TP_printk("p:%08x s:%08x",
+		__entry->phys,
+		__entry->size
+	)
+);
+
+#endif /* _TRACE_XDMA_H */
+
+#include <trace/define_trace.h>
-- 
2.27.0

