Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C2EAA69
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:40:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z140x3gzF40t
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:40:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vf1odBPs"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywb3VJkzF42H
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:47 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id l3so3192606pgr.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBs2Zdq/pdhigl8moMHVMmKScgDUSBnLW1FO42JaBS4=;
 b=Vf1odBPs/ierhNsVCqAYUKL9nu7Ioxwy4f/kF1+O0zC6ytBz6bBSTa395vn9TiY14x
 sEP5lMsGBF31Xtvh/sE+ifymjycZFHQl1Y7qXjVFC2QPA4Zj7tyeC8cb8+DvS205Tz/E
 OsX8E8OPFjsekQ2b+guS0v54zcBVw1WBiaB5LMYViW+EJFGeJPWu+uU4vUi8wFwAgYRv
 gxjRURAmkkwTzUCxkoVVgOcXCfgZzBLmcxPmma74HQ07vzJLww2mXeZUIQB3JKnTrCq/
 c6eg7hyVKGnvFUsvGBub8l+YXcN2fNNeM7TaBTqJmTnn/dOlPs2y0ozACY+JQDlJ/hRI
 Zi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WBs2Zdq/pdhigl8moMHVMmKScgDUSBnLW1FO42JaBS4=;
 b=tJJa9NKrM0UA48xwZKnRJGeh93Ug4w3DQPckBGHSoun6UUEDERqo+TLqbjnKTAnQ+c
 84+9LG2bJWW7vqFdwKOtO7c11mEMkqnlAGOWq07dMT/wOT52L3KSfPn0i090IJgNB/w0
 owgW55Lxx7l3c3APQP3M3O9HzWQESIMSmiY4l7zxM4FRAX7e8Y84dKMkfWv7d6+H72ZI
 6Qu1A70UlojCX/AtbbcXVIph+w4FaVVCaxiOd7eOXOemSIuNfPcc6szNtG7DdmFNeYhv
 RuCmeQa8Dqp6XJMF8bzzMD581IoymFtJ6mD7T8BDTc2BAiHMBc/c1fytXrAGeBOUnEl1
 ftfQ==
X-Gm-Message-State: APjAAAW285iQ+wUSZFq09/Wn/FOa2OIMRQBtWP8xWkYwP5XGw3IwxH0P
 DYOI3k5Yk6G7m+jwf1Gjo3E=
X-Google-Smtp-Source: APXvYqwBAh0uJZ0BWzQWSiO73jpZ3X4/+7kMD+JH3K9mHDhES/nlR3l7J6RkUBXAN+pBqBHrCGytGg==
X-Received: by 2002:a17:90a:22a6:: with SMTP id
 s35mr4332495pjc.3.1572500204419; 
 Wed, 30 Oct 2019 22:36:44 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 2/8] fsi: aspeed: Implement byte and half
 word reads
Date: Thu, 31 Oct 2019 16:06:19 +1030
Message-Id: <20191031053625.422-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191031053625.422-1-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A similar rationale to the writes, where we create helpers for each size
to ensure the callee gets type checking and allows the lookup of the size
to be done once, in aspeed_master_read.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 80 ++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 21 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 8d6deb6994fb..b520f5df567c 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -222,18 +222,15 @@ static int opb_writel(struct fsi_master_aspeed *aspeed, u32 addr, __be32 val)
 	return __opb_write(aspeed, addr, (__force u32)val, XFER_WORD);
 }
 
-static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
-		    size_t size, u32 *out)
+static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
+		      u32 transfer_size, void *out)
 {
 	void __iomem *base = aspeed->base;
 	u32 result, reg;
 	int status, ret;
 
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
-
 	writel(CMD_READ, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(transfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
@@ -246,7 +243,7 @@ static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	result = readl(base + OPB0_FSI_DATA_R);
 
-	trace_fsi_master_aspeed_opb_read(addr, size, result,
+	trace_fsi_master_aspeed_opb_read(addr, transfer_size, result,
 			readl(base + OPB0_STATUS),
 			reg);
 
@@ -258,12 +255,41 @@ static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	if (status & STATUS_ERR_ACK)
 		return -EIO;
 
-	if (out)
-		*out = result;
+	if (out) {
+		switch (transfer_size) {
+		case XFER_BYTE:
+			*(u8 *)out = result;
+			break;
+		case XFER_HALFWORD:
+			*(u16 *)out = result;
+			break;
+		case XFER_WORD:
+			*(u32 *)out = result;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+	}
 
 	return 0;
 }
 
+static int opb_readl(struct fsi_master_aspeed *aspeed, uint32_t addr, __be32 *out)
+{
+	return __opb_read(aspeed, addr, XFER_WORD, out);
+}
+
+static int opb_readw(struct fsi_master_aspeed *aspeed, uint32_t addr, __be16 *out)
+{
+	return __opb_read(aspeed, addr, XFER_HALFWORD, (void *)out);
+}
+
+static int opb_readb(struct fsi_master_aspeed *aspeed, uint32_t addr, u8 *out)
+{
+	return __opb_read(aspeed, addr, XFER_BYTE, (void *)out);
+}
+
 static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
@@ -271,9 +297,9 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 	 if (trace_fsi_master_aspeed_opb_error_enabled()) {
 		 __be32 mresp0, mstap0, mesrb0;
 
-		 opb_read(aspeed, ctrl_base + FSI_MRESP0, 4, &mresp0);
-		 opb_read(aspeed, ctrl_base + FSI_MSTAP0, 4, &mstap0);
-		 opb_read(aspeed, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+		 opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
+		 opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
+		 opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
 
 		 trace_fsi_master_aspeed_opb_error(
 				 be32_to_cpu(mresp0),
@@ -308,7 +334,20 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_read(aspeed, fsi_base + addr, size, val);
+
+	switch (size) {
+	case 1:
+		ret = opb_readb(aspeed, fsi_base + addr, val);
+		break;
+	case 2:
+		ret = opb_readw(aspeed, fsi_base + addr, val);
+		break;
+	case 4:
+		ret = opb_readl(aspeed, fsi_base + addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
@@ -364,8 +403,7 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	ret = opb_read(aspeed, ctrl_base + FSI_MENP0 + (4 * idx),
-			4, &result);
+	ret = opb_readl(aspeed, ctrl_base + FSI_MENP0 + (4 * idx), &result);
 	if (ret)
 		return ret;
 
@@ -467,12 +505,12 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 
 	opb_writel(aspeed, ctrl_base + FSI_MCENP0, reg);
 
-	opb_read(aspeed, ctrl_base + FSI_MAEB, 4, NULL);
+	opb_readl(aspeed, ctrl_base + FSI_MAEB, NULL);
 
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
 	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
 
-	opb_read(aspeed, ctrl_base + FSI_MLEVP0, 4, NULL);
+	opb_readl(aspeed, ctrl_base + FSI_MLEVP0, NULL);
 
 	/* Reset the master bridge */
 	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
@@ -490,7 +528,7 @@ static int fsi_master_aspeed_debugfs_get(void *data, u64 *val)
 	u32 out;
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
 
-	rc = opb_read(entry->aspeed, ctrl_base + entry->addr, 4, &out);
+	rc = opb_readl(entry->aspeed, ctrl_base + entry->addr, &out);
 	if (rc)
 		return rc;
 
@@ -519,7 +557,7 @@ static int fsi_master_aspeed_clock_debugfs_get(void *data, u64 *val)
 	u32 out;
 	int rc;
 
-	rc = opb_read(aspeed, ctrl_base, 4, &out);
+	rc = opb_readl(aspeed, ctrl_base, &out);
 	if (rc)
 		return rc;
 
@@ -537,7 +575,7 @@ static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
 	if (val > 0x3ff)
 		return -EINVAL;
 
-	rc = opb_read(aspeed, ctrl_base, 4, &raw);
+	rc = opb_readl(aspeed, ctrl_base, &raw);
 	if (rc)
 		return rc;
 
@@ -610,7 +648,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 */
 	writel(0x1, aspeed->base + OPB0_SELECT);
 
-	rc = opb_read(aspeed, ctrl_base + FSI_MVER, 4, &raw);
+	rc = opb_readl(aspeed, ctrl_base + FSI_MVER, &raw);
 	if (rc) {
 		dev_err(&pdev->dev, "failed to read hub version\n");
 		return rc;
-- 
2.24.0.rc1

