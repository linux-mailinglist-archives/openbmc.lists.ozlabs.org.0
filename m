Return-Path: <openbmc+bounces-581-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED748B42613
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j51yMlz303F;
	Thu,  4 Sep 2025 01:58:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915113;
	cv=none; b=c17VQdN5/IxcwrA9rxbxjapHIUmr07ghV1EL0/pR2FPvFZNECrGfJQzN215Qjhly52pItMcC0R2zwMxlV3+VjLqSs3cAn0BVXCEHb8nuF6i/oiVhRf9Y0xtRXsG0ENOxEW6H092vHozULayplMkDZDSJWNydXoZcolTgs+4Du8KUaCKwZ4Sn5XW6xcPgOMhzss1FuCfypxtq5rzM4stwbA6a3sI3gT0+KRxKXGHLGfMVaK0Xkh06FpMK/DyL/Xb5qEV0z9Q99Q/SWYFg4xQ+0q2KZLPmzqP4xe2jULFTH0u8/86tlhyPlq79Jrm1E8agBs6FVB5b4YcJDWR93+tqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915113; c=relaxed/relaxed;
	bh=46xct8dWUe4eOORIoqlUrNms+fA0574uoK1SEGPxYEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzdSu2QFh9jCNlCym++BcLuOudkOMUWP0PhhyZZjaEOkElrCLuN4Rtihp4ZTQmV0YQZfwGX8QAQ+sDKTTurqdrlgPDUu63qPSvtzHU/i+r+qZfiwB2zI5P+V1bdJNY+fZcFYMNhsGkU5zyXqOoVOdjC55bPOC35LJhGXylUrX/zJfnFSTE4wS6as93HP0dlXf+xZUmr9trULS3NpNkqlyCPG8elaYqvhzdj6QIn6H5m4OAIZpk+uqUjYnx/9Ut8ZHMtso/Qi83upTB5R7G7/mTEnYPWYO03aWU/f0P4Z5qo4YPmPPONUUr1N5F160hKtwD+0cgdESOsecFckfowmbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BIsW/0q8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BIsW/0q8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j40vtwz2ykc
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:31 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5837Ii2I031771;
	Wed, 3 Sep 2025 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=46xct8dWUe4eOORIo
	qlUrNms+fA0574uoK1SEGPxYEw=; b=BIsW/0q8uCGodlDCLTg+tPjRkHYjVq6ZM
	MGD0sC4TD16Skc1rRFb5QNI3+BYQKqM3mH5/68AfW9MmxM77LbPfMWXbx14LReJw
	C5+Zpy3wxKDKHvVjZcymCG+0NMymuBjVQoAasg2Y/UJLHyusLr4xd45qZMV8k6IA
	vVRuc0FbrtVIqe0ipiExpfT9toGRAQRs81lfkagzRmtl6eAGYX+9CucX+gBMuBqU
	4Xv4kSw8JGwqZjp7a3Yfb8/thqIXfYrRxAnmlt/2DOsvcKhhG2L5ktvVr836e8an
	nPO4imktRwzHaWZCrmUaXiV1D4Sa+jAO7WBnv5GZEawEM63mIwHMw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usur5bdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583DuIsq019926;
	Wed, 3 Sep 2025 15:58:15 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmu8e3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwDoB6619886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:14 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51FD5803F;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A8A358054;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v2 2/6] soc: aspeed: xdma: Add user interface
Date: Wed,  3 Sep 2025 10:58:04 -0500
Message-ID: <20250903155810.2839634-3-ninad@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfX0eAOVhFxXs/J
 5WNhu759hINCp6g2PNLZwoYyq89ixKUgs+y4p4e9eKAnNI9oYpzgvg/SfAbSaVEP5Uo1RL5OXAo
 +HJ8VvxxlRMI2R0AiWSdZ/atn6l9K/nsxDHH85hXucB5YND6qPujxPZF3sGA07sd8aDnek6xz4v
 FXhTOkyYRaFE5mp66cH2cl9qOa9C3Wu2p3B0b55TrCN6dmK7g8fMJoxLksL3D8e90KOHXHr999d
 FlQO3pR312th8dRnirHsSsRgr9Jc/UHB1BjBZodzNKiObYQdVkftP/B+njHCy/4/vmKpfaWxXan
 PHAmLfrGl8CWFT8/x8yFEY2hzCQo/ePRg1eWYqbu4zf+bvO44P8gK7lJTUUUvNPQrG3Y0meWOdo
 NIBCmFFW
X-Proofpoint-GUID: IyAARiMg8Y78XWujcgX0R9nMVoHXVT_3
X-Proofpoint-ORIG-GUID: IyAARiMg8Y78XWujcgX0R9nMVoHXVT_3
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68b86597 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=2z96zy1_ARudCJHCz_cA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eddie James <eajames@linux.ibm.com>

This commits adds a miscdevice to provide a user interface to the XDMA
engine. The interface provides the write operation to start DMA
operations. The DMA parameters are passed as the data to the write call.
The actual data to transfer is NOT passed through write. Note that both
directions of DMA operation are accomplished through the write command;
BMC to host and host to BMC.

The XDMA driver reserves an area of physical memory for DMA operations,
as the XDMA engine is restricted to accessing certain physical memory
areas on some platforms. This memory forms a pool from which users can
allocate pages for their usage with calls to mmap. The space allocated
by a client will be the space used in the DMA operation. For an
"upstream" (BMC to host) operation, the data in the client's area will
be transferred to the host. For a "downstream" (host to BMC) operation,
the host data will be placed in the client's memory area.

Poll is also provided in order to determine when the DMA operation is
complete for non-blocking IO.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/1588697905-23444-4-git-send-email-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 264 +++++++++++++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 947e19323a1b5..d1b0a047c8798 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
@@ -238,6 +239,8 @@ struct aspeed_xdma {
 	dma_addr_t mem_coherent;
 	dma_addr_t cmdq_phys;
 	struct gen_pool *pool;
+
+	struct miscdevice misc;
 };
 
 struct aspeed_xdma_client {
@@ -421,6 +424,50 @@ static unsigned int aspeed_xdma_ast2600_set_cmd(struct aspeed_xdma *ctx,
 	return rc;
 }
 
+static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned int num_cmds,
+			     struct aspeed_xdma_cmd cmds[2], bool upstream,
+			     struct aspeed_xdma_client *client)
+{
+	unsigned int i;
+	int rc = -EBUSY;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->engine_lock, flags);
+	if (ctx->in_reset)
+		goto unlock;
+
+	spin_lock(&ctx->client_lock);
+	if (ctx->current_client) {
+		spin_unlock(&ctx->client_lock);
+		goto unlock;
+	}
+
+	client->error = false;
+	client->in_progress = true;
+	ctx->current_client = client;
+	spin_unlock(&ctx->client_lock);
+
+	ctx->upstream = upstream;
+	for (i = 0; i < num_cmds; ++i) {
+		/*
+		 * Use memcpy_toio here to get some barriers before starting
+		 * the operation. The command(s) need to be in physical memory
+		 * before the XDMA engine starts.
+		 */
+		memcpy_toio(&ctx->cmdq[ctx->cmd_idx], &cmds[i],
+			    sizeof(struct aspeed_xdma_cmd));
+		ctx->cmd_idx = (ctx->cmd_idx + 1) % XDMA_NUM_CMDS;
+	}
+
+	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep,
+			   ctx->cmd_idx * ctx->chip->queue_entry_size);
+	rc = 0;
+
+unlock:
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
+	return rc;
+}
+
 static void aspeed_xdma_done(struct aspeed_xdma *ctx, bool error)
 {
 	unsigned long flags;
@@ -513,6 +560,210 @@ static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
+				 size_t len, loff_t *offset)
+{
+	int rc;
+	unsigned int num_cmds;
+	struct aspeed_xdma_op op;
+	struct aspeed_xdma_cmd cmds[2];
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	if (len != sizeof(op))
+		return -EINVAL;
+
+	if (copy_from_user(&op, buf, len))
+		return -EFAULT;
+
+	if (!op.len || op.len > client->size ||
+	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
+		return -EINVAL;
+
+	num_cmds = ctx->chip->set_cmd(ctx, cmds, &op, client->phys);
+	do {
+		rc = aspeed_xdma_start(ctx, num_cmds, cmds, !!op.direction,
+				       client);
+		if (!rc)
+			break;
+
+		if ((file->f_flags & O_NONBLOCK) || rc != -EBUSY)
+			return rc;
+
+		rc = wait_event_interruptible(ctx->wait,
+					      !(ctx->current_client ||
+						ctx->in_reset));
+	} while (!rc);
+
+	if (rc)
+		return -EINTR;
+
+	if (!(file->f_flags & O_NONBLOCK)) {
+		rc = wait_event_interruptible(ctx->wait, !client->in_progress);
+		if (rc)
+			return -EINTR;
+
+		if (client->error)
+			return -EIO;
+	}
+
+	return len;
+}
+
+static __poll_t aspeed_xdma_poll(struct file *file,
+				 struct poll_table_struct *wait)
+{
+	__poll_t mask = 0;
+	__poll_t req = poll_requested_events(wait);
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	if (req & (EPOLLIN | EPOLLRDNORM)) {
+		if (READ_ONCE(client->in_progress))
+			poll_wait(file, &ctx->wait, wait);
+
+		if (!READ_ONCE(client->in_progress)) {
+			if (READ_ONCE(client->error))
+				mask |= EPOLLERR;
+			else
+				mask |= EPOLLIN | EPOLLRDNORM;
+		}
+	}
+
+	if (req & (EPOLLOUT | EPOLLWRNORM)) {
+		if (READ_ONCE(ctx->current_client))
+			poll_wait(file, &ctx->wait, wait);
+
+		if (!READ_ONCE(ctx->current_client))
+			mask |= EPOLLOUT | EPOLLWRNORM;
+	}
+
+	return mask;
+}
+
+static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
+{
+	int rc;
+	struct aspeed_xdma_client *client = vma->vm_private_data;
+
+	rc = wait_event_interruptible(client->ctx->wait, !client->in_progress);
+	if (rc)
+		return;
+
+	gen_pool_free(client->ctx->pool, (unsigned long)client->virt,
+		      client->size);
+
+	client->virt = NULL;
+	client->phys = 0;
+	client->size = 0;
+}
+
+static const struct vm_operations_struct aspeed_xdma_vm_ops = {
+	.close =	aspeed_xdma_vma_close,
+};
+
+static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	int rc;
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	/* restrict file to one mapping */
+	if (client->size)
+		return -EBUSY;
+
+	client->size = vma->vm_end - vma->vm_start;
+	client->virt = gen_pool_dma_alloc(ctx->pool, client->size,
+					  &client->phys);
+	if (!client->virt) {
+		client->phys = 0;
+		client->size = 0;
+		return -ENOMEM;
+	}
+
+	vma->vm_pgoff = (client->phys - ctx->mem_phys) >> PAGE_SHIFT;
+	vma->vm_ops = &aspeed_xdma_vm_ops;
+	vma->vm_private_data = client;
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	rc = io_remap_pfn_range(vma, vma->vm_start, client->phys >> PAGE_SHIFT,
+				client->size, vma->vm_page_prot);
+	if (rc) {
+		dev_warn(ctx->dev, "mmap err: v[%08lx] to p[%08x], s[%08x]\n",
+			 vma->vm_start, (u32)client->phys, client->size);
+
+		gen_pool_free(ctx->pool, (unsigned long)client->virt,
+			      client->size);
+
+		client->virt = NULL;
+		client->phys = 0;
+		client->size = 0;
+		return rc;
+	}
+
+	dev_dbg(ctx->dev, "mmap: v[%08lx] to p[%08x], s[%08x]\n",
+		vma->vm_start, (u32)client->phys, client->size);
+
+	return 0;
+}
+
+static int aspeed_xdma_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *misc = file->private_data;
+	struct aspeed_xdma *ctx = container_of(misc, struct aspeed_xdma, misc);
+	struct aspeed_xdma_client *client = kzalloc(sizeof(*client),
+						    GFP_KERNEL);
+
+	if (!client)
+		return -ENOMEM;
+
+	kobject_get(&ctx->kobj);
+	client->ctx = ctx;
+	file->private_data = client;
+	return 0;
+}
+
+static int aspeed_xdma_release(struct inode *inode, struct file *file)
+{
+	bool reset = false;
+	unsigned long flags;
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	spin_lock_irqsave(&ctx->client_lock, flags);
+	if (client == ctx->current_client) {
+		spin_lock(&ctx->engine_lock);
+		if (ctx->in_reset) {
+			ctx->current_client = NULL;
+		} else {
+			ctx->in_reset = true;
+			reset = true;
+		}
+		spin_unlock(&ctx->engine_lock);
+	}
+	spin_unlock_irqrestore(&ctx->client_lock, flags);
+
+	if (reset)
+		aspeed_xdma_reset(ctx);
+
+	if (client->virt)
+		gen_pool_free(ctx->pool, (unsigned long)client->virt,
+			      client->size);
+
+	kfree(client);
+	kobject_put(&ctx->kobj);
+	return 0;
+}
+
+static const struct file_operations aspeed_xdma_fops = {
+	.owner			= THIS_MODULE,
+	.write			= aspeed_xdma_write,
+	.poll			= aspeed_xdma_poll,
+	.mmap			= aspeed_xdma_mmap,
+	.open			= aspeed_xdma_open,
+	.release		= aspeed_xdma_release,
+};
+
 static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 {
 	struct regmap *scu = syscon_regmap_lookup_by_phandle(dev->of_node,
@@ -779,6 +1030,16 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 
 	aspeed_xdma_init_eng(ctx);
 
+	ctx->misc.minor = MISC_DYNAMIC_MINOR;
+	ctx->misc.fops = &aspeed_xdma_fops;
+	ctx->misc.name = "aspeed-xdma";
+	ctx->misc.parent = dev;
+	rc = misc_register(&ctx->misc);
+	if (rc) {
+		dev_err(dev, "Failed to register xdma miscdevice.\n");
+		goto err_misc;
+	}
+
 	/*
 	 * This interrupt could fire immediately so only request it once the
 	 * engine and driver are initialized.
@@ -798,6 +1059,8 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	kobject_init(&ctx->kobj, &aspeed_xdma_kobject_type);
 	return 0;
 
+err_misc:
+	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
 err_pool:
 	reset_control_assert(ctx->reset);
 err_reset:
@@ -837,6 +1100,7 @@ static void aspeed_xdma_remove(struct platform_device *pdev)
 
 	aspeed_xdma_done(ctx, true);
 
+	misc_deregister(&ctx->misc);
 	kobject_put(&ctx->kobj);
 }
 
-- 
2.48.1


