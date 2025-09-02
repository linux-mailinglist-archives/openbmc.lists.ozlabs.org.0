Return-Path: <openbmc+bounces-561-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81280B40D33
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 20:32:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGZ916J6Fz30P3;
	Wed,  3 Sep 2025 04:32:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756837941;
	cv=none; b=ZpnizQ4gn07yNpYnPaiUilFD1qL1E2LQmmMN0e7ul1C37jrnOO8T4bz4LO5FhjC3l9Bv2raSlrLJnzGg2uzEHYvlGpX0tLrLva4JuszAAzsslixAahwvTxdrD27FTEKefQKXV+bw3M1WqwaB1NLLdBwbsJVXPF0NLjI5JD9Lf7hfns9KoFfa6Q/HgW1Bd6TPwRvGieBUUYkaxzFU51eih9FN/tlB2InDnDUpTqgM+wxpkYPVO42j3VoSYfzlHeIO7JKSvgg5un4dv2eqdr8BoKzGzCMwyk0auQv9YHd8rj8ZK3ly20G5JMnCZMxStws3MiTzODeWD33n/psYC94Mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756837941; c=relaxed/relaxed;
	bh=Th3t9TP3cbI4Kvucfvy9bd34XvRV0QnUvBxu2BAMliA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1S+Dq4YePbf2uFNP9B9vmhQzeLdxVD6veDQ6wrqTTt8Rr1IJNb0jwapo4uInloXSrIIJ2PZQdVPfVO17fcMs8AY7fjzXHymOKA7XH0F88ZyXBQwpjSZfwgr2ydfgigiCrRkBAYrRCiH9HqKVONUG2j1PP08Rm9Ee53kWA8amGRt/53ReBkwwW4CIiE7x03Ikn6QyMvKnTLTRs+cvztRWRkRg0p4QNcYzAlLkt3yor2dxT5T2JqZ2DIIdJW7+2swjoqz1+V2tU8YRx1T1yGQmOBRhwKhYhBLEA+LFuGemQ4MjZKg+rEs2nMs6QlmGL0z5K6hXeHLKBL6zutqjWlVvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IL+P9oC4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IL+P9oC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGZ903FQpz307q
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 04:32:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AOL1K031771;
	Tue, 2 Sep 2025 18:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Th3t9TP3cbI4Kvucf
	vy9bd34XvRV0QnUvBxu2BAMliA=; b=IL+P9oC4RzJ1mRn45K56ga/TSuco76egS
	VOTsbYQgfNOtQvUNJrlU8UYHLW7M13XNKmnwiSYHE42M/PGwL5jyCWxnNR+UPyvh
	sH8IAzoEj6V6zUlLlME+LaYK+6bKmPdvVZ6R9UNxSapShHC3MRKdH5noLKWR6NqI
	41ga2/dmTpnCZ7QDxNU4VQ527OIondQKRx5VfshmQYAeI0H4VKtroaUASjcHp/fW
	XOjDMFAPi+2JZqu3fkJ7yJ2sEyd8pqMXm3GmFGwz+2JwMyKwfe7KCFHmm8JFRcwd
	S6Y6vZDk938KA/siiTtvIr74m+uReVXocCAqFT/1Vsk3i7rLrjCkA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usur04y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 582G9mq1021170;
	Tue, 2 Sep 2025 18:32:05 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmpkxq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 582IW4Yw18547216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Sep 2025 18:32:04 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A52258045;
	Tue,  2 Sep 2025 18:32:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5C5E58050;
	Tue,  2 Sep 2025 18:32:03 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Sep 2025 18:32:03 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v1 4/6] soc: aspeed: xdma: Add trace events
Date: Tue,  2 Sep 2025 13:31:45 -0500
Message-ID: <20250902183155.2988560-5-ninad@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfX8ziq5xednIsm
 t3fOog8KI1eMGJSLTEEkE8I3nL8+9M5f91zR+iTbJWFHZOkpw4nuGAkoFAjZYNHuop9qILU6bR2
 +hntTEAdXtECQ00odJm4o5m4bUcxapSE5Rp9nhR+eAiaDYXHPfJjkxUixjHaJwpE4BqrR4rOSn+
 g1E4QLB2JWChTJAfDR0Vs68ksTL/+eH/SqHUNCOImZ+vrcgyVOiTjOmWe2PWYCvAnAYD2tE8k9+
 2wIKRNcONjzXvEFdK+HIjZTyAYPyJWIs76ngCH/J8tvZnJURduKBWbnrIr8Qrsh9VXfIRgGry2c
 +qdbYdOimXshZjfa2omwL3hi+aUuIp7Of5vPiCgloJOsYZmHgpJPu9UgGjg0VP3q7swrj09HbQ8
 p0zFXEOT
X-Proofpoint-GUID: KLs3rxXUJ4S_NxfsRArZZdsPLBg2M60q
X-Proofpoint-ORIG-GUID: KLs3rxXUJ4S_NxfsRArZZdsPLBg2M60q
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68b73826 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=MRrR7M2QgdDii1iFpLUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030
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
---
 drivers/soc/aspeed/aspeed-xdma.c |  18 +++-
 include/trace/events/xdma.h      | 139 +++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/xdma.h

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 565486ddb3b52..33310e55eb1ce 100644
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
index 0000000000000..bf515ad3d8e50
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
2.48.1


