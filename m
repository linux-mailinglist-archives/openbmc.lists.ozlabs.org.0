Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E3E40DB
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:12:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmLp4N1wzDqg5
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:12:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f0CjRVk1"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm9075QpzDqll
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:20 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 15so378224pgt.7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5auRmtaEk9cyj8O+bA/pjEj1sOtqSs7hhGUsEfKBrk=;
 b=f0CjRVk1igUy3ZnmzujkzwosgDNoOYvbVuVgM0MycIId2jaB/RYfUz3H0dlRPxAMEw
 erj0kOTiZsfNgd2W3F/CyuHVfpZc/GNOUGjTU/lc5aKANDb5ldJAebfGuxBUfkuKVw8N
 i7pP43sSiIxpwbvf2z8u8D9ITLajWCBC3KMKvF+HlPhY5V3U0u+5le4uglSoHEdyx9tS
 Cgj1VO23kWMb5ALOH76J0OQIx8NxRDMWupNtk54++V04yoGK8gCKQ2vNuLrd1BZO14dt
 7rtI7W5dZwcXrm1zINVu0H1hM8ZeRbARFLG9hZEGBJACWhWtIZvvNKN/GNjqQElFMwG1
 5pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C5auRmtaEk9cyj8O+bA/pjEj1sOtqSs7hhGUsEfKBrk=;
 b=Jy2aB9zLFFgsLPi8vTO8PzD7g5ioJiRu7/oKtnqgEI2t+jWdRgZuWBvzkUuIWFKhFO
 5ET+S/kVHvqbqabUsJ3BbCRELLjS/uGXQWg83v0JqgW27/SoY1BdogaFCDBPiFYZKYva
 l23c6CiFKZm+GH2UonJJzawNmf9P3bv7jw5e2KmJ4VAMuSkZbrE5HDZKzhbxMiKAmFhA
 I8ij6cBimrbuh/G2qOKcMwu3U4Dbc6rgilxt9Z0o9g0RlnDczHlGN9a24t0ABve6QbzY
 CiE6QvHHcNF+UUdnkHNg/+O4f3H2E5N/mLBrpXSwGwTZ2zla5cQX7iGdEKuJptIPXJSK
 gEsg==
X-Gm-Message-State: APjAAAUyT2lq/DVzY8sGxWLCeBLQvp5QPysjsEpwvC4rPQHH7UMCT9G/
 YttJg98Mfxd5tcFf4vE3Oaw=
X-Google-Smtp-Source: APXvYqwvWHRR5zyVxVVBYtnVsKxxMgmAG2QvQLvAWt/t/Bl+hFEXKc1yyNvn6Kb61V/tRQVqnE6Sow==
X-Received: by 2002:a17:90a:ad95:: with SMTP id
 s21mr613907pjq.11.1571965458310; 
 Thu, 24 Oct 2019 18:04:18 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 7/7] fsi: aspeed: Special case repeated full
 word reads
Date: Fri, 25 Oct 2019 12:03:51 +1100
Message-Id: <20191025010351.30298-8-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025010351.30298-1-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
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

The driver can skip doing some of the AHB2OPB setup if the operation is
of the same type. Experiment with this for full word reads, which could
be extended to writes if it shows an improvement.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 50 ++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 7e515b43b7a6..30e818728402 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -92,6 +92,8 @@ struct fsi_master_aspeed {
 	void __iomem		*base;
 	struct clk		*clk;
 
+	bool			last_was_fw_read;
+
 	struct dentry		*debugfs_dir;
 	struct fsi_master_aspeed_debugfs_entry debugfs[FSI_NUM_DEBUGFS_ENTRIES];
 };
@@ -205,6 +207,8 @@ static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
 
+	aspeed->last_was_fw_read = false;
+
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 				(reg & OPB0_XFER_ACK_EN) != 0,
 				0, 10000);
@@ -224,6 +228,43 @@ static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	return 0;
 }
 
+static int opb_read_repeat_fullword(struct fsi_master_aspeed *aspeed,
+		                    uint32_t addr, u32 *out)
+{
+	void __iomem *base = aspeed->base;
+	u32 result, reg;
+	int status, ret;
+
+	writel(addr, base + OPB0_FSI_ADDR);
+	writel(0x1, base + OPB_IRQ_CLEAR);
+	writel(0x1, base + OPB_TRIGGER);
+
+	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
+			   (reg & OPB0_XFER_ACK_EN) != 0,
+			   0, 10000);
+
+	status = readl(base + OPB0_STATUS);
+
+	result = readl(base + OPB0_FSI_DATA_R);
+
+	trace_fsi_master_aspeed_opb_read(addr, 4, result,
+			readl(base + OPB0_STATUS),
+			reg);
+
+	/* Return error when poll timed out */
+	if (ret)
+		return ret;
+
+	/* Command failed, master will reset */
+	if (status & STATUS_ERR_ACK)
+		return -EIO;
+
+	if (out)
+		memcpy(out, &result, 4);
+
+	return 0;
+}
+
 static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 		    size_t size, u32 *out)
 {
@@ -241,6 +282,9 @@ static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel(0x1, base + OPB_IRQ_CLEAR);
 	writel(0x1, base + OPB_TRIGGER);
 
+	if (size == 4)
+		aspeed->last_was_fw_read = true;
+
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 			   (reg & OPB0_XFER_ACK_EN) != 0,
 			   0, 10000);
@@ -311,7 +355,11 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_read(aspeed, fsi_base + addr, size, val);
+
+	if (aspeed->last_was_fw_read)
+		ret = opb_read_repeat_fullword(aspeed, fsi_base + addr, val);
+	else
+		ret = opb_read(aspeed, fsi_base + addr, size, val);
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
-- 
2.23.0

