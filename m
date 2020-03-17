Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A318913F
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 23:21:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnh21rwWzDqlZ
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 09:21:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnWF60V7zDqXt
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 09:13:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HM5nBL021964; Tue, 17 Mar 2020 18:13:43 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru54v8vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 18:13:43 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HMA9AV011089;
 Tue, 17 Mar 2020 22:13:42 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 2yrpw6bneh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 22:13:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HMDgEB30998942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 22:13:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B961112069;
 Tue, 17 Mar 2020 22:13:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFEB0112067;
 Tue, 17 Mar 2020 22:13:41 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.52.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 22:13:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 07/16] soc: aspeed: xdma: Add user interface
Date: Tue, 17 Mar 2020 17:13:27 -0500
Message-Id: <20200317221336.19973-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200317221336.19973-1-eajames@linux.ibm.com>
References: <20200317221336.19973-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_09:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 suspectscore=4 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170082
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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
---
 drivers/soc/aspeed/aspeed-xdma.c | 208 +++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index edd1ae514155..4950068a6ff5 100644
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
@@ -201,6 +202,8 @@ struct aspeed_xdma {
 	struct clk *clock;
 	struct reset_control *reset;
 
+	/* file_lock serializes reads of current_client */
+	struct mutex file_lock;
 	/* client_lock protects error and in_progress of the client */
 	spinlock_t client_lock;
 	struct aspeed_xdma_client *current_client;
@@ -223,6 +226,8 @@ struct aspeed_xdma {
 	void __iomem *mem_virt;
 	dma_addr_t cmdq_phys;
 	struct gen_pool *pool;
+
+	struct miscdevice misc;
 };
 
 struct aspeed_xdma_client {
@@ -527,6 +532,191 @@ static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
+				 size_t len, loff_t *offset)
+{
+	int rc;
+	struct aspeed_xdma_op op;
+	struct aspeed_xdma_client *client = file->private_data;
+	struct aspeed_xdma *ctx = client->ctx;
+
+	if (len != sizeof(op))
+		return -EINVAL;
+
+	rc = copy_from_user(&op, buf, len);
+	if (rc)
+		return rc;
+
+	if (!op.len || op.len > client->size ||
+	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
+		return -EINVAL;
+
+	if (file->f_flags & O_NONBLOCK) {
+		if (READ_ONCE(ctx->in_reset))
+			return -EBUSY;
+
+		if (!mutex_trylock(&ctx->file_lock))
+			return -EAGAIN;
+
+		if (READ_ONCE(ctx->current_client)) {
+			mutex_unlock(&ctx->file_lock);
+			return -EBUSY;
+		}
+	} else {
+		mutex_lock(&ctx->file_lock);
+
+		rc = wait_event_interruptible(ctx->wait, !ctx->current_client);
+		if (rc) {
+			mutex_unlock(&ctx->file_lock);
+			return -EINTR;
+		}
+	}
+
+	aspeed_xdma_start(ctx, &op, client->phys, client);
+
+	mutex_unlock(&ctx->file_lock);
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
+		if (client->in_progress)
+			poll_wait(file, &ctx->wait, wait);
+
+		if (!client->in_progress) {
+			if (client->error)
+				mask |= EPOLLERR;
+			else
+				mask |= EPOLLIN | EPOLLRDNORM;
+		}
+	}
+
+	if (req & (EPOLLOUT | EPOLLWRNORM)) {
+		if (ctx->current_client)
+			poll_wait(file, &ctx->wait, wait);
+
+		if (!ctx->current_client)
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
+	client->ctx = ctx;
+	file->private_data = client;
+	return 0;
+}
+
+static int aspeed_xdma_release(struct inode *inode, struct file *file)
+{
+	struct aspeed_xdma_client *client = file->private_data;
+
+	kfree(client);
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
@@ -593,6 +783,7 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	ctx->chip = md;
 	ctx->dev = dev;
 	platform_set_drvdata(pdev, ctx);
+	mutex_init(&ctx->file_lock);
 	mutex_init(&ctx->start_lock);
 	INIT_WORK(&ctx->reset_work, aspeed_xdma_reset_work);
 	spin_lock_init(&ctx->client_lock);
@@ -689,6 +880,22 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 
 	aspeed_xdma_init_eng(ctx);
 
+	ctx->misc.minor = MISC_DYNAMIC_MINOR;
+	ctx->misc.fops = &aspeed_xdma_fops;
+	ctx->misc.name = "aspeed-xdma";
+	ctx->misc.parent = dev;
+	rc = misc_register(&ctx->misc);
+	if (rc) {
+		dev_err(dev, "Failed to register xdma miscdevice.\n");
+
+		gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq,
+			      XDMA_CMDQ_SIZE);
+
+		reset_control_assert(ctx->reset);
+		clk_disable_unprepare(ctx->clock);
+		return rc;
+	}
+
 	/*
 	 * This interrupt could fire immediately so only request it once the
 	 * engine and driver are initialized.
@@ -710,6 +917,7 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
 {
 	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
 
+	misc_deregister(&ctx->misc);
 	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
 
 	reset_control_assert(ctx->reset);
-- 
2.24.0

