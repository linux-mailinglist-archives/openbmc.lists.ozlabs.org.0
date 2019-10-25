Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B4E40D7
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:09:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmGP33qTzDqY5
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:09:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uXWbg/EZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8s3CmdzDqlW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:13 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 21so382333pfj.9
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XPF2DIyO14fi1JYvcaZsyqKvKScZ8tNNAk4x4OQ2S38=;
 b=uXWbg/EZ9oE2Qx6u9/K7XAFa5bE4Hcq5fwYEjYvIA3CIpzEEqp8DQXl4To8llgoXoK
 2CSTKEpnhowEL5nnZPVo0jbSygEbCFM4L7MxoxA7HzIHg+H4VEnPL2fr46cbsJAoPg1m
 j8RaSfpklJ6nqbUwrtt1sxDC1VRsNEmUYI6B9hqTtDLo84w+pldQVpWK4eLkDuIUBf5C
 Pu14ckJPuA0+vxkDjtID7FNL3VG3m8PIEK9dT8QHJ8g2/uTQkU5JjnBPd0hSxDvU+a2y
 yWyZtZwcAzl1R/O/fcleIfcn0FiHXdvrv49G/c74vTBI4Y3DRiPxwvGOw746SZiJWMpO
 0ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XPF2DIyO14fi1JYvcaZsyqKvKScZ8tNNAk4x4OQ2S38=;
 b=EGXU2ZueHgPCYo662Cw7NlcPmlKwYuFjiaHNgAM/7VSxxhvkIVrOXK3XVxDJx7/yt7
 FL6whaOwBNvH3r1tHMaMbKTJU72Z1BDFj/E8ya1xFT/3afF6AlH5Juz92/JMJ0sG+GDw
 qQToiQFQbyhwSmeq3m6YtxN6MxWcjFBcpGYk5IaFcXb9YlTfuf9HHsXv821opZc7bLLb
 ghfGkMcRjSH4Sk9bXFks3kVMoN0X2cKKXm/YcClbz57ZRVD5IW8NgtJLrFOtlZBZax2p
 1nggiIR3Ivbw10C6EXr0ygyWpvphC+U3jBDb1/edJAr4TeFIEXeg1x/AFAS6MidyPbQ4
 98Qg==
X-Gm-Message-State: APjAAAXWXu8ltqJC46VcqrO53pFIWtNgAyPk/aaXfUiUMO1zE3NB7mth
 g83UbuSSDBjQtK+p1JyPPHm1EZd5On4=
X-Google-Smtp-Source: APXvYqzjyYsmiXNfpNxdkdtd4EhEiHOkdaFv/SU6LPLHx2pjKROZsw0hhBsc906NMxCNH1HQJOiNVw==
X-Received: by 2002:a63:4f1d:: with SMTP id d29mr1066093pgb.115.1571965449843; 
 Thu, 24 Oct 2019 18:04:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 4/7] fsi: aspeed: Only select OPB0 once
Date: Fri, 25 Oct 2019 12:03:48 +1100
Message-Id: <20191025010351.30298-5-joel@jms.id.au>
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

The driver can leve OPB0 selected to save a AHB write per OPB operation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index d2c01956663f..58b090e2cf46 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -197,7 +197,6 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 	if (xfer_size < 0)
 		return xfer_size;
 
-	writel(0x1, base + OPB0_SELECT);
 	writel(CMD_WRITE, base + OPB0_RW);
 	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
@@ -233,7 +232,6 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 	if (xfer_size < 0)
 		return xfer_size;
 
-	writel(0x1, base + OPB0_SELECT);
 	writel(CMD_READ, base + OPB0_RW);
 	writel(xfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
@@ -596,6 +594,13 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(0x0011bb1b, aspeed->base + OPB0_W_ENDIAN);
 	writel(0xffaa5500, aspeed->base + 0x50);
 
+	/*
+	 * Select OPB0 for all operations.
+	 * Will need to be reworked when enabling DMA or anything that uses
+	 * OPB1.
+	 */
+	writel(0x1, aspeed->base + OPB0_SELECT);
+
 	rc = opb_read(aspeed->base, ctrl_base + FSI_MVER, 4, &raw);
 	if (rc) {
 		dev_err(&pdev->dev, "failed to read hub version\n");
-- 
2.23.0

