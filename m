Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D91861C5EF5
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 19:36:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gn2r1DNbzDqSs
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 03:36:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GmvL0gf0zDqVp
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 03:30:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045H28be031333; Tue, 5 May 2020 13:30:03 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t60ssy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 13:30:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 045HP1IQ009164;
 Tue, 5 May 2020 17:30:01 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 30s0g6jgj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 17:30:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 045HU1rN14353082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 17:30:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72A45112065;
 Tue,  5 May 2020 17:30:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAA6F11206B;
 Tue,  5 May 2020 17:30:00 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.211.137.116])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 17:30:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 2/6] soc: aspeed: xdma: Update to v11 upstream
Date: Tue,  5 May 2020 12:29:54 -0500
Message-Id: <1588699798-26292-3-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588699798-26292-1-git-send-email-eajames@linux.ibm.com>
References: <1588699798-26292-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_09:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=3 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050129
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

Update to the latest on the upstream lists.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 491 +++++++++++++++++++++++----------------
 1 file changed, 296 insertions(+), 195 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index e800fea..fa2d968 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -31,14 +31,8 @@
 
 #define DEVICE_NAME				"aspeed-xdma"
 
-#define SCU_SILICON_REV_ID			0x004
-#define  SCU_SILICON_REV_ID_AST2600_A0		 0x05000303
-
 #define SCU_AST2600_MISC_CTRL			0x0c0
-#define  SCU_AST2600_MISC_CTRL_DISABLE_PCI	 BIT(8)
-
-#define SCU_AST2600_DBG_CTRL			0x0c8
-#define  SCU_AST2600_DBG_CTRL_DISABLE_PCI	 BIT(0)
+#define  SCU_AST2600_MISC_CTRL_XDMA_BMC		 BIT(8)
 
 #define SCU_AST2500_PCIE_CONF			0x180
 #define SCU_AST2600_PCIE_CONF			0xc20
@@ -57,8 +51,7 @@
 #define  SCU_PCIE_CONF_BMC_EN_DMA		 BIT(14)
 
 #define SCU_AST2500_BMC_CLASS_REV		0x19c
-#define SCU_AST2600_A0_BMC_CLASS_REV		0xc4c
-#define SCU_AST2600_A1_BMC_CLASS_REV		0xc68
+#define SCU_AST2600_BMC_CLASS_REV		0xc68
 #define  SCU_BMC_CLASS_REV_XDMA			 0xff000001
 
 #define SDMC_REMAP                             0x008
@@ -70,8 +63,9 @@
 #define XDMA_NUM_CMDS				\
 	(XDMA_CMDQ_SIZE / sizeof(struct aspeed_xdma_cmd))
 
-/* Aspeed specification requires 10ms after switching the reset line */
-#define XDMA_RESET_TIME_MS			10
+/* Aspeed specification requires 100us after disabling the reset */
+#define XDMA_ENGINE_SETUP_TIME_MAX_US          1000
+#define XDMA_ENGINE_SETUP_TIME_MIN_US          100
 
 #define XDMA_CMD_AST2500_PITCH_SHIFT		3
 #define XDMA_CMD_AST2500_PITCH_BMC		GENMASK_ULL(62, 51)
@@ -199,7 +193,6 @@ struct aspeed_xdma_status_bits {
 struct aspeed_xdma_chip {
 	u32 control;
 	u32 scu_bmc_class;
-	u32 scu_dbg_ctrl;
 	u32 scu_misc_ctrl;
 	u32 scu_pcie_conf;
 	u32 sdmc_remap;
@@ -214,36 +207,39 @@ struct aspeed_xdma_chip {
 struct aspeed_xdma_client;
 
 struct aspeed_xdma {
+	struct kobject kobj;
 	const struct aspeed_xdma_chip *chip;
 
+	int irq;
+	int pcie_irq;
+	struct clk *clock;
 	struct device *dev;
 	void __iomem *base;
-	struct clk *clock;
+	resource_size_t res_size;
+	resource_size_t res_start;
 	struct reset_control *reset;
 	struct reset_control *reset_rc;
 
-	/* file_lock serializes reads of current_client */
-	struct mutex file_lock;
-	/* client_lock protects error and in_progress of the client */
+	/* Protects current_client */
 	spinlock_t client_lock;
 	struct aspeed_xdma_client *current_client;
 
-	/* start_lock protects cmd_idx, cmdq, and the state of the engine */
-	struct mutex start_lock;
+	/* Protects engine configuration */
+	spinlock_t engine_lock;
 	struct aspeed_xdma_cmd *cmdq;
-	bool upstream;
 	unsigned int cmd_idx;
-
-	/* reset_lock protects in_reset and the reset state of the engine */
-	spinlock_t reset_lock;
 	bool in_reset;
+	bool upstream;
 
+	/* Queue waiters for idle engine */
 	wait_queue_head_t wait;
+
 	struct work_struct reset_work;
 
 	u32 mem_phys;
 	u32 mem_size;
-	void __iomem *mem_virt;
+	void *mem_virt;
+	dma_addr_t mem_coherent;
 	dma_addr_t cmdq_phys;
 	struct gen_pool *pool;
 
@@ -276,6 +272,9 @@ static void aspeed_xdma_writel(struct aspeed_xdma *ctx, u8 reg, u32 val)
 
 static void aspeed_xdma_init_eng(struct aspeed_xdma *ctx)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->engine_lock, flags);
 	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_endp,
 			   ctx->chip->queue_entry_size * XDMA_NUM_CMDS);
 	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_readp,
@@ -285,7 +284,7 @@ static void aspeed_xdma_init_eng(struct aspeed_xdma *ctx)
 	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_addr, ctx->cmdq_phys);
 
 	ctx->cmd_idx = 0;
-	ctx->current_client = NULL;
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
 }
 
 static unsigned int aspeed_xdma_ast2500_set_cmd(struct aspeed_xdma *ctx,
@@ -427,37 +426,48 @@ static unsigned int aspeed_xdma_ast2600_set_cmd(struct aspeed_xdma *ctx,
 	return rc;
 }
 
-static void aspeed_xdma_start(struct aspeed_xdma *ctx,
-			      struct aspeed_xdma_op *op, u32 bmc_addr,
-			      struct aspeed_xdma_client *client)
+static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned int num_cmds,
+			     struct aspeed_xdma_cmd cmds[2], bool upstream,
+			     struct aspeed_xdma_client *client)
 {
 	unsigned int i;
+	int rc = -EBUSY;
 	unsigned long flags;
-	struct aspeed_xdma_cmd cmds[2];
-	unsigned int rc = ctx->chip->set_cmd(ctx, cmds, op, bmc_addr);
 
-	mutex_lock(&ctx->start_lock);
+	spin_lock_irqsave(&ctx->engine_lock, flags);
+	if (ctx->in_reset)
+		goto unlock;
 
-	for (i = 0; i < rc; ++i) {
-		memcpy(&ctx->cmdq[ctx->cmd_idx], &cmds[i],
-		       sizeof(struct aspeed_xdma_cmd));
-		ctx->cmd_idx = (ctx->cmd_idx + 1) % XDMA_NUM_CMDS;
+	spin_lock(&ctx->client_lock);
+	if (ctx->current_client) {
+		spin_unlock(&ctx->client_lock);
+		goto unlock;
 	}
 
-	ctx->upstream = !!op->direction;
-
-	spin_lock_irqsave(&ctx->client_lock, flags);
-
 	client->error = false;
 	client->in_progress = true;
 	ctx->current_client = client;
-
-	spin_unlock_irqrestore(&ctx->client_lock, flags);
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
 
 	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep,
 			   ctx->cmd_idx * ctx->chip->queue_entry_size);
+	rc = 0;
 
-	mutex_unlock(&ctx->start_lock);
+unlock:
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
+	return rc;
 }
 
 static void aspeed_xdma_done(struct aspeed_xdma *ctx, bool error)
@@ -465,13 +475,11 @@ static void aspeed_xdma_done(struct aspeed_xdma *ctx, bool error)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctx->client_lock, flags);
-
 	if (ctx->current_client) {
 		ctx->current_client->error = error;
 		ctx->current_client->in_progress = false;
 		ctx->current_client = NULL;
 	}
-
 	spin_unlock_irqrestore(&ctx->client_lock, flags);
 
 	wake_up_interruptible_all(&ctx->wait);
@@ -480,7 +488,10 @@ static void aspeed_xdma_done(struct aspeed_xdma *ctx, bool error)
 static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
 {
 	struct aspeed_xdma *ctx = arg;
-	u32 status = aspeed_xdma_readl(ctx, ctx->chip->regs.status);
+	u32 status;
+
+	spin_lock(&ctx->engine_lock);
+	status = aspeed_xdma_readl(ctx, ctx->chip->regs.status);
 
 	if (status & ctx->chip->status_bits.ds_dirty) {
 		aspeed_xdma_done(ctx, true);
@@ -497,6 +508,7 @@ static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
 	}
 
 	aspeed_xdma_writel(ctx, ctx->chip->regs.status, status);
+	spin_unlock(&ctx->engine_lock);
 
 	return IRQ_HANDLED;
 }
@@ -506,18 +518,21 @@ static void aspeed_xdma_reset(struct aspeed_xdma *ctx)
 	unsigned long flags;
 
 	reset_control_assert(ctx->reset);
-	msleep(XDMA_RESET_TIME_MS);
-
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
 	reset_control_deassert(ctx->reset);
-	msleep(XDMA_RESET_TIME_MS);
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
 
 	aspeed_xdma_init_eng(ctx);
 
-	spin_lock_irqsave(&ctx->reset_lock, flags);
+	aspeed_xdma_done(ctx, true);
+
+	spin_lock_irqsave(&ctx->engine_lock, flags);
 	ctx->in_reset = false;
-	spin_unlock_irqrestore(&ctx->reset_lock, flags);
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
 
-	aspeed_xdma_done(ctx, true);
+	wake_up_interruptible(&ctx->wait);
 }
 
 static void aspeed_xdma_reset_work(struct work_struct *work)
@@ -525,32 +540,23 @@ static void aspeed_xdma_reset_work(struct work_struct *work)
 	struct aspeed_xdma *ctx = container_of(work, struct aspeed_xdma,
 					       reset_work);
 
-	/*
-	 * Lock to make sure operations aren't started while the engine is
-	 * in reset.
-	 */
-	mutex_lock(&ctx->start_lock);
-
 	aspeed_xdma_reset(ctx);
-
-	mutex_unlock(&ctx->start_lock);
 }
 
 static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
 {
-	unsigned long flags;
 	struct aspeed_xdma *ctx = arg;
 
-	dev_dbg(ctx->dev, "pcie reset\n");
+	dev_dbg(ctx->dev, "PCI-E reset requested.\n");
 
-	spin_lock_irqsave(&ctx->reset_lock, flags);
+	spin_lock(&ctx->engine_lock);
 	if (ctx->in_reset) {
-		spin_unlock_irqrestore(&ctx->reset_lock, flags);
+		spin_unlock(&ctx->engine_lock);
 		return IRQ_HANDLED;
 	}
 
 	ctx->in_reset = true;
-	spin_unlock_irqrestore(&ctx->reset_lock, flags);
+	spin_unlock(&ctx->engine_lock);
 
 	schedule_work(&ctx->reset_work);
 	return IRQ_HANDLED;
@@ -560,7 +566,9 @@ static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
 				 size_t len, loff_t *offset)
 {
 	int rc;
+	unsigned int num_cmds;
 	struct aspeed_xdma_op op;
+	struct aspeed_xdma_cmd cmds[2];
 	struct aspeed_xdma_client *client = file->private_data;
 	struct aspeed_xdma *ctx = client->ctx;
 
@@ -575,30 +583,23 @@ static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
 	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
 		return -EINVAL;
 
-	if (file->f_flags & O_NONBLOCK) {
-		if (READ_ONCE(ctx->in_reset))
-			return -EBUSY;
+	num_cmds = ctx->chip->set_cmd(ctx, cmds, &op, client->phys);
+	do {
+		rc = aspeed_xdma_start(ctx, num_cmds, cmds, !!op.direction,
+				       client);
+		if (!rc)
+			break;
 
-		if (!mutex_trylock(&ctx->file_lock))
-			return -EAGAIN;
-
-		if (READ_ONCE(ctx->current_client)) {
-			mutex_unlock(&ctx->file_lock);
-			return -EBUSY;
-		}
-	} else {
-		mutex_lock(&ctx->file_lock);
-
-		rc = wait_event_interruptible(ctx->wait, !ctx->current_client);
-		if (rc) {
-			mutex_unlock(&ctx->file_lock);
-			return -EINTR;
-		}
-	}
+		if ((file->f_flags & O_NONBLOCK) || rc != -EBUSY)
+			return rc;
 
-	aspeed_xdma_start(ctx, &op, client->phys, client);
+		rc = wait_event_interruptible(ctx->wait,
+					      !(ctx->current_client ||
+						ctx->in_reset));
+	} while (!rc);
 
-	mutex_unlock(&ctx->file_lock);
+	if (rc)
+		return -EINTR;
 
 	if (!(file->f_flags & O_NONBLOCK)) {
 		rc = wait_event_interruptible(ctx->wait, !client->in_progress);
@@ -621,11 +622,11 @@ static __poll_t aspeed_xdma_poll(struct file *file,
 	struct aspeed_xdma *ctx = client->ctx;
 
 	if (req & (EPOLLIN | EPOLLRDNORM)) {
-		if (client->in_progress)
+		if (READ_ONCE(client->in_progress))
 			poll_wait(file, &ctx->wait, wait);
 
-		if (!client->in_progress) {
-			if (client->error)
+		if (!READ_ONCE(client->in_progress)) {
+			if (READ_ONCE(client->error))
 				mask |= EPOLLERR;
 			else
 				mask |= EPOLLIN | EPOLLRDNORM;
@@ -633,10 +634,10 @@ static __poll_t aspeed_xdma_poll(struct file *file,
 	}
 
 	if (req & (EPOLLOUT | EPOLLWRNORM)) {
-		if (ctx->current_client)
+		if (READ_ONCE(ctx->current_client))
 			poll_wait(file, &ctx->wait, wait);
 
-		if (!ctx->current_client)
+		if (!READ_ONCE(ctx->current_client))
 			mask |= EPOLLOUT | EPOLLWRNORM;
 	}
 
@@ -652,24 +653,20 @@ static long aspeed_xdma_ioctl(struct file *file, unsigned int cmd,
 
 	switch (cmd) {
 	case ASPEED_XDMA_IOCTL_RESET:
-		spin_lock_irqsave(&ctx->reset_lock, flags);
+		spin_lock_irqsave(&ctx->engine_lock, flags);
 		if (ctx->in_reset) {
-			spin_unlock_irqrestore(&ctx->reset_lock, flags);
+			spin_unlock_irqrestore(&ctx->engine_lock, flags);
 			return 0;
 		}
 
 		ctx->in_reset = true;
-		spin_unlock_irqrestore(&ctx->reset_lock, flags);
+		spin_unlock_irqrestore(&ctx->engine_lock, flags);
 
-		if (ctx->current_client)
+		if (READ_ONCE(ctx->current_client))
 			dev_warn(ctx->dev,
 				 "User reset with transfer in progress.\n");
 
-		mutex_lock(&ctx->start_lock);
-
 		aspeed_xdma_reset(ctx);
-
-		mutex_unlock(&ctx->start_lock);
 		break;
 	default:
 		return -EINVAL;
@@ -754,6 +751,7 @@ static int aspeed_xdma_open(struct inode *inode, struct file *file)
 	if (!client)
 		return -ENOMEM;
 
+	kobject_get(&ctx->kobj);
 	client->ctx = ctx;
 	file->private_data = client;
 	return 0;
@@ -761,9 +759,33 @@ static int aspeed_xdma_open(struct inode *inode, struct file *file)
 
 static int aspeed_xdma_release(struct inode *inode, struct file *file)
 {
+	bool reset = false;
+	unsigned long flags;
 	struct aspeed_xdma_client *client = file->private_data;
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
 
 	kfree(client);
+	kobject_put(&ctx->kobj);
 	return 0;
 }
 
@@ -793,8 +815,8 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 			SCU_PCIE_CONF_VGA_EN_DMA;
 		const char *pcie = NULL;
 
-		if (!of_property_read_string(dev->of_node, "pcie-device",
-					     &pcie)) {
+		if (!of_property_read_string(dev->of_node,
+					     "aspeed,pcie-device", &pcie)) {
 			if (!strcmp(pcie, "vga")) {
 				pcie_device_bmc = false;
 			} else if (strcmp(pcie, "bmc")) {
@@ -806,21 +828,9 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 		}
 
 		if (pcie_device_bmc) {
-			u32 addr = ctx->chip->scu_bmc_class;
-
-			if (addr == SCU_AST2600_A0_BMC_CLASS_REV) {
-				u32 silicon_rev_id;
-
-				regmap_read(scu, SCU_SILICON_REV_ID,
-					    &silicon_rev_id);
-
-				if (silicon_rev_id !=
-				    SCU_SILICON_REV_ID_AST2600_A0)
-					addr = SCU_AST2600_A1_BMC_CLASS_REV;
-			}
-
 			selection = bmc;
-			regmap_write(scu, addr, SCU_BMC_CLASS_REV_XDMA);
+			regmap_write(scu, ctx->chip->scu_bmc_class,
+				     SCU_BMC_CLASS_REV_XDMA);
 		} else {
 			selection = vga;
 		}
@@ -828,15 +838,10 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc | vga,
 				   selection);
 
-		if (ctx->chip->scu_dbg_ctrl)
-			regmap_update_bits(scu, ctx->chip->scu_dbg_ctrl,
-					   SCU_AST2600_DBG_CTRL_DISABLE_PCI,
-					   SCU_AST2600_DBG_CTRL_DISABLE_PCI);
-
 		if (ctx->chip->scu_misc_ctrl)
 			regmap_update_bits(scu, ctx->chip->scu_misc_ctrl,
-					   SCU_AST2600_MISC_CTRL_DISABLE_PCI,
-					   SCU_AST2600_MISC_CTRL_DISABLE_PCI);
+					   SCU_AST2600_MISC_CTRL_XDMA_BMC,
+					   SCU_AST2600_MISC_CTRL_XDMA_BMC);
 	} else {
 		dev_warn(dev, "Unable to configure PCIe: %ld; continuing.\n",
 			 PTR_ERR(scu));
@@ -845,11 +850,66 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 	return 0;
 }
 
+static void aspeed_xdma_kobject_release(struct kobject *kobj)
+{
+	struct aspeed_xdma *ctx = container_of(kobj, struct aspeed_xdma, kobj);
+
+	if (ctx->pcie_irq >= 0)
+		free_irq(ctx->pcie_irq, ctx);
+
+	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
+
+	gen_pool_destroy(ctx->pool);
+
+	dma_free_coherent(ctx->dev, ctx->mem_size, ctx->mem_virt,
+			  ctx->mem_coherent);
+
+	if (ctx->reset_rc)
+		reset_control_put(ctx->reset_rc);
+	reset_control_put(ctx->reset);
+
+	clk_put(ctx->clock);
+
+	free_irq(ctx->irq, ctx);
+
+	iounmap(ctx->base);
+	release_mem_region(ctx->res_start, ctx->res_size);
+
+	kfree(ctx);
+}
+
+static struct kobj_type aspeed_xdma_kobject_type = {
+	.release = aspeed_xdma_kobject_release,
+};
+
+static int aspeed_xdma_iomap(struct aspeed_xdma *ctx,
+			     struct platform_device *pdev)
+{
+	resource_size_t size;
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res)
+		return -ENOMEM;
+
+	size = resource_size(res);
+	if (!request_mem_region(res->start, size, dev_name(ctx->dev)))
+		return -ENOMEM;
+
+	ctx->base = ioremap(res->start, size);
+	if (!ctx->base) {
+		release_mem_region(res->start, size);
+		return -ENOMEM;
+	}
+
+	ctx->res_start = res->start;
+	ctx->res_size = size;
+
+	return 0;
+}
+
 static int aspeed_xdma_probe(struct platform_device *pdev)
 {
 	int rc;
-	int irq;
-	int pcie_irq;
 	struct regmap *sdmc;
 	struct aspeed_xdma *ctx;
 	struct reserved_mem *mem;
@@ -860,88 +920,107 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	if (!md)
 		return -ENODEV;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
 	ctx->chip = md;
 	ctx->dev = dev;
 	platform_set_drvdata(pdev, ctx);
-	mutex_init(&ctx->file_lock);
-	mutex_init(&ctx->start_lock);
-	INIT_WORK(&ctx->reset_work, aspeed_xdma_reset_work);
 	spin_lock_init(&ctx->client_lock);
-	spin_lock_init(&ctx->reset_lock);
+	spin_lock_init(&ctx->engine_lock);
+	INIT_WORK(&ctx->reset_work, aspeed_xdma_reset_work);
 	init_waitqueue_head(&ctx->wait);
 
-	ctx->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(ctx->base)) {
+	rc = aspeed_xdma_iomap(ctx, pdev);
+	if (rc) {
 		dev_err(dev, "Failed to map registers.\n");
-		return PTR_ERR(ctx->base);
+		goto err_nomap;
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Unable to find IRQ.\n");
-		return irq;
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq < 0) {
+		dev_err(dev, "Failed to find IRQ.\n");
+		rc = ctx->irq;
+		goto err_noirq;
 	}
 
-	rc = devm_request_irq(dev, irq, aspeed_xdma_irq, 0, DEVICE_NAME, ctx);
+	rc = request_irq(ctx->irq, aspeed_xdma_irq, 0, DEVICE_NAME, ctx);
 	if (rc < 0) {
-		dev_err(dev, "Failed to request IRQ %d.\n", irq);
-		return rc;
+		dev_err(dev, "Failed to request IRQ %d.\n", ctx->irq);
+		goto err_noirq;
 	}
 
-	ctx->clock = devm_clk_get(dev, NULL);
+	ctx->clock = clk_get(dev, NULL);
 	if (IS_ERR(ctx->clock)) {
 		dev_err(dev, "Failed to request clock.\n");
-		return PTR_ERR(ctx->clock);
+		rc = PTR_ERR(ctx->clock);
+		goto err_noclk;
 	}
 
-	ctx->reset = devm_reset_control_get_exclusive(dev, NULL);
+	ctx->reset = reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ctx->reset)) {
 		dev_err(dev, "Failed to request reset control.\n");
-		return PTR_ERR(ctx->reset);
+		rc = PTR_ERR(ctx->reset);
+		goto err_noreset;
 	}
 
-	ctx->reset_rc = devm_reset_control_get_exclusive(dev, "rc");
+	ctx->reset_rc = reset_control_get_exclusive(dev, "root-complex");
 	if (IS_ERR(ctx->reset_rc)) {
 		dev_dbg(dev, "Failed to request reset RC control.\n");
 		ctx->reset_rc = NULL;
 	}
 
-	ctx->pool = devm_gen_pool_create(dev, ilog2(PAGE_SIZE), -1, NULL);
-	if (!ctx->pool) {
-		dev_err(dev, "Failed to setup genalloc pool.\n");
-		return -ENOMEM;
-	}
-
 	memory_region = of_parse_phandle(dev->of_node, "memory-region", 0);
 	if (!memory_region) {
-		dev_err(dev, "Unable to get memory-region.\n");
-		return -ENOMEM;
+		dev_err(dev, "Failed to find memory-region.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
 	}
 
 	mem = of_reserved_mem_lookup(memory_region);
+	of_node_put(memory_region);
 	if (!mem) {
-		dev_err(dev, "Unable to find reserved memory.\n");
-		return -ENOMEM;
+		dev_err(dev, "Failed to find reserved memory.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
 	}
 
 	ctx->mem_phys = mem->base;
 	ctx->mem_size = mem->size;
 
-	ctx->mem_virt = devm_ioremap(dev, ctx->mem_phys, ctx->mem_size);
+	rc = of_reserved_mem_device_init(dev);
+	if (rc) {
+		dev_err(dev, "Failed to init reserved memory.\n");
+		goto err_nomem;
+	}
+
+	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (rc) {
+		dev_err(dev, "Failed to mask DMA.\n");
+		goto err_nomem;
+	}
+
+	ctx->mem_virt = dma_alloc_coherent(dev, ctx->mem_size,
+					   &ctx->mem_coherent, 0);
 	if (!ctx->mem_virt) {
-		dev_err(dev, "Failed to map memory space.\n");
-		return -ENOMEM;
+		dev_err(dev, "Failed to allocate reserved memory.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
+	}
+
+	ctx->pool = gen_pool_create(ilog2(PAGE_SIZE), -1);
+	if (!ctx->pool) {
+		dev_err(dev, "Failed to setup genalloc pool.\n");
+		rc = -ENOMEM;
+		goto err_nopool;
 	}
 
 	rc = gen_pool_add_virt(ctx->pool, (unsigned long)ctx->mem_virt,
 			       ctx->mem_phys, ctx->mem_size, -1);
 	if (rc) {
 		dev_err(ctx->dev, "Failed to add memory to genalloc pool.\n");
-		return rc;
+		goto err_pool_scu_clk;
 	}
 
 	sdmc = syscon_regmap_lookup_by_phandle(dev->of_node, "sdmc");
@@ -953,41 +1032,38 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 
 	rc = aspeed_xdma_init_scu(ctx, dev);
 	if (rc)
-		return rc;
+		goto err_pool_scu_clk;
+
+	rc = clk_prepare_enable(ctx->clock);
+	if (rc) {
+		dev_err(dev, "Failed to enable the clock.\n");
+		goto err_pool_scu_clk;
+	}
 
 	if (ctx->reset_rc) {
 		rc = reset_control_deassert(ctx->reset_rc);
 		if (rc) {
 			dev_err(dev, "Failed to clear the RC reset.\n");
-			return rc;
+			goto err_reset_rc;
 		}
-		msleep(XDMA_RESET_TIME_MS);
-	}
-
-	rc = clk_prepare_enable(ctx->clock);
-	if (rc) {
-		dev_err(dev, "Failed to enable the clock.\n");
-		return rc;
+		usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+			     XDMA_ENGINE_SETUP_TIME_MAX_US);
 	}
-	msleep(XDMA_RESET_TIME_MS);
 
 	rc = reset_control_deassert(ctx->reset);
 	if (rc) {
-		clk_disable_unprepare(ctx->clock);
-
 		dev_err(dev, "Failed to clear the reset.\n");
-		return rc;
+		goto err_reset;
 	}
-	msleep(XDMA_RESET_TIME_MS);
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
 
 	ctx->cmdq = gen_pool_dma_alloc(ctx->pool, XDMA_CMDQ_SIZE,
 				       &ctx->cmdq_phys);
 	if (!ctx->cmdq) {
 		dev_err(ctx->dev, "Failed to genalloc cmdq.\n");
-
-		reset_control_assert(ctx->reset);
-		clk_disable_unprepare(ctx->clock);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto err_pool;
 	}
 
 	aspeed_xdma_init_eng(ctx);
@@ -999,44 +1075,71 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	rc = misc_register(&ctx->misc);
 	if (rc) {
 		dev_err(dev, "Failed to register xdma miscdevice.\n");
-
-		gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq,
-			      XDMA_CMDQ_SIZE);
-
-		reset_control_assert(ctx->reset);
-		clk_disable_unprepare(ctx->clock);
-		return rc;
+		goto err_misc;
 	}
 
 	/*
 	 * This interrupt could fire immediately so only request it once the
 	 * engine and driver are initialized.
 	 */
-	pcie_irq = platform_get_irq(pdev, 1);
-	if (pcie_irq < 0) {
-		dev_warn(dev, "Unable to find PCI-E IRQ.\n");
+	ctx->pcie_irq = platform_get_irq(pdev, 1);
+	if (ctx->pcie_irq < 0) {
+		dev_warn(dev, "Failed to find PCI-E IRQ.\n");
 	} else {
-		rc = devm_request_irq(dev, pcie_irq, aspeed_xdma_pcie_irq,
-				      IRQF_SHARED, DEVICE_NAME, ctx);
-		if (rc < 0)
+		rc = request_irq(ctx->pcie_irq, aspeed_xdma_pcie_irq,
+				 IRQF_SHARED, DEVICE_NAME, ctx);
+		if (rc < 0) {
 			dev_warn(dev, "Failed to request PCI-E IRQ %d.\n", rc);
+			ctx->pcie_irq = -1;
+		}
 	}
 
+	kobject_init(&ctx->kobj, &aspeed_xdma_kobject_type);
 	return 0;
+
+err_misc:
+	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
+err_pool:
+	reset_control_assert(ctx->reset);
+err_reset:
+	if (ctx->reset_rc)
+		reset_control_assert(ctx->reset_rc);
+err_reset_rc:
+	clk_disable_unprepare(ctx->clock);
+err_pool_scu_clk:
+	gen_pool_destroy(ctx->pool);
+err_nopool:
+	dma_free_coherent(ctx->dev, ctx->mem_size, ctx->mem_virt,
+			  ctx->mem_coherent);
+err_nomem:
+	if (ctx->reset_rc)
+		reset_control_put(ctx->reset_rc);
+	reset_control_put(ctx->reset);
+err_noreset:
+	clk_put(ctx->clock);
+err_noclk:
+	free_irq(ctx->irq, ctx);
+err_noirq:
+	iounmap(ctx->base);
+	release_mem_region(ctx->res_start, ctx->res_size);
+err_nomap:
+	kfree(ctx);
+	return rc;
 }
 
 static int aspeed_xdma_remove(struct platform_device *pdev)
 {
 	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
 
-	misc_deregister(&ctx->misc);
-	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
-
 	reset_control_assert(ctx->reset);
-	clk_disable_unprepare(ctx->clock);
-
 	if (ctx->reset_rc)
 		reset_control_assert(ctx->reset_rc);
+	clk_disable_unprepare(ctx->clock);
+
+	aspeed_xdma_done(ctx, true);
+
+	misc_deregister(&ctx->misc);
+	kobject_put(&ctx->kobj);
 
 	return 0;
 }
@@ -1046,7 +1149,6 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
 		XDMA_AST2500_CTRL_DS_DIRTY | XDMA_AST2500_CTRL_DS_SIZE_256 |
 		XDMA_AST2500_CTRL_DS_TIMEOUT | XDMA_AST2500_CTRL_DS_CHECK_ID,
 	.scu_bmc_class = SCU_AST2500_BMC_CLASS_REV,
-	.scu_dbg_ctrl = 0,
 	.scu_misc_ctrl = 0,
 	.scu_pcie_conf = SCU_AST2500_PCIE_CONF,
 	.sdmc_remap = SDMC_AST2500_REMAP_PCIE | SDMC_AST2500_REMAP_XDMA,
@@ -1070,8 +1172,7 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
 static const struct aspeed_xdma_chip aspeed_ast2600_xdma_chip = {
 	.control = XDMA_AST2600_CTRL_US_COMP | XDMA_AST2600_CTRL_DS_COMP |
 		XDMA_AST2600_CTRL_DS_DIRTY | XDMA_AST2600_CTRL_DS_SIZE_256,
-	.scu_bmc_class = SCU_AST2600_A0_BMC_CLASS_REV,
-	.scu_dbg_ctrl = SCU_AST2600_DBG_CTRL,
+	.scu_bmc_class = SCU_AST2600_BMC_CLASS_REV,
 	.scu_misc_ctrl = SCU_AST2600_MISC_CTRL,
 	.scu_pcie_conf = SCU_AST2600_PCIE_CONF,
 	.sdmc_remap = SDMC_AST2600_REMAP_XDMA,
-- 
1.8.3.1

