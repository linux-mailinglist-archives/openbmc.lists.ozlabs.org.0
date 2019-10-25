Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25763E40D9
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:11:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmK73MdfzDqgD
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:11:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FvCGTGL8"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8x4fJJzDqlf
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:17 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id f19so358723pgn.13
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QbSV3kOSC3Q0zbJogYNKiHw9Cu3WR58c54PYFvFMNyQ=;
 b=FvCGTGL84Ay4RQadiysNkI/8vAZdPcgFClB1ftG1F7XX3lAoLzGs9F0G05Av+3h0t1
 7HWv+nj3EWZvUgEwcC6PRFR2cJh7uLM3JtNeC5m2nE3A+MtDfq/HJvshk8PwVaWVq0BG
 P3WbuCbiIpD9VZyQwAemgLYdsfmGlVvjtotIB/y0Qe33b8FIU+yZlSn6/9RLg6Bi4V1N
 AoxNvAnZ9z+EQm/3dOunA623h9xuaWskJog5XaBjAxUho1OmpshFfPMQ71IC2vO/QG22
 gpaT+JWPxyjDR6Eo8H5JiQ1xTYssotWKn+BUcP+23eGlkjwMwEFRzZIgFGqJcLAsyiIm
 OCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QbSV3kOSC3Q0zbJogYNKiHw9Cu3WR58c54PYFvFMNyQ=;
 b=Oii8ClVr8FISYizCEd699k0S9Kyv1x2a+FcIP+H2eAkgopNX5JKqfb+cUGd2PPNbHy
 n0qN2klLbukOLXQloQl5x7r2uoyqiP6kw8XGkH6+ZYqlqTFHC4lDm+XkS9+NUwVUfW2K
 nQ43YWYrilXgkotD9TXLnXgU6XpqqPDZ9wD2IBthl2MnFKsOEVAEanHFG03xoSg8O1GC
 fYTcw1WRqCf3UEbTuZ0GwkQQxB80cX9SWPF3vkbA4WZKu3c77CXVnTwNgj/UHmWxI7/V
 JoBSRDHC7pDbo6Vl+XYI0kxXAxUGMZFAPF5xeaMPgbqAtCSkUOY4gmJIwxi1SGp6/0rq
 CImw==
X-Gm-Message-State: APjAAAVB7p7N3TFVd+qlaLKw5QXEXaSZO0WD8K4Mqn2TcdTAHgq5Shos
 ebpfelz5VxbN9Tx/G8Pgz0Z/dFh7QvA=
X-Google-Smtp-Source: APXvYqzS0jvMq9xmOOco/oiK6W6a1/YTpkG/RdPwx5KxPn5KFZX+hA5i46WcnPyJa2lNpIrdx1+9sw==
X-Received: by 2002:a63:2348:: with SMTP id u8mr1066020pgm.422.1571965455531; 
 Thu, 24 Oct 2019 18:04:15 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 6/7] fsi: aspeed: Pass fsi_master_aspeed insead
 of base
Date: Fri, 25 Oct 2019 12:03:50 +1100
Message-Id: <20191025010351.30298-7-joel@jms.id.au>
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

In preparation for a future change.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 61 +++++++++++++++++----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c98b1bf179a8..7e515b43b7a6 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -188,9 +188,10 @@ static u32 get_xfer_size(size_t size) {
 	}
 }
 
-static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
-		     size_t size)
+static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
+		     uint32_t val, size_t size)
 {
+	void __iomem *base = aspeed->base;
 	u32 reg, ret, status, xfer_size;
 
 	xfer_size = get_xfer_size(size);
@@ -223,8 +224,10 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 	return 0;
 }
 
-static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
+static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
+		    size_t size, u32 *out)
 {
+	void __iomem *base = aspeed->base;
 	u32 result, reg, xfer_size;
 	int status, ret;
 
@@ -271,9 +274,9 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 	 if (trace_fsi_master_aspeed_opb_error_enabled()) {
 		 __be32 mresp0, mstap0, mesrb0;
 
-		 opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
-		 opb_read(aspeed->base, ctrl_base + FSI_MSTAP0, 4, &mstap0);
-		 opb_read(aspeed->base, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+		 opb_read(aspeed, ctrl_base + FSI_MRESP0, 4, &mresp0);
+		 opb_read(aspeed, ctrl_base + FSI_MSTAP0, 4, &mstap0);
+		 opb_read(aspeed, ctrl_base + FSI_MESRB0, 4, &mesrb0);
 
 		 trace_fsi_master_aspeed_opb_error(
 				 be32_to_cpu(mresp0),
@@ -285,7 +288,7 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 		/* Check MAEB (0x70) ? */
 
 		/* Then clear errors in master */
-		ret = opb_write(aspeed->base, ctrl_base + 0xd0,
+		ret = opb_write(aspeed, ctrl_base + 0xd0,
 				cpu_to_be32(0x20000000), 4);
 		if (ret) {
 			/* TODO: log? return different code? */
@@ -308,7 +311,7 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_read(aspeed->base, fsi_base + addr, size, val);
+	ret = opb_read(aspeed, fsi_base + addr, size, val);
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
@@ -327,7 +330,7 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_write(aspeed->base, fsi_base + addr, *(uint32_t *)val, size);
+	ret = opb_write(aspeed, fsi_base + addr, *(uint32_t *)val, size);
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
@@ -347,12 +350,12 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	reg = cpu_to_be32(0x80000000 >> bit);
 
-	result = opb_write(aspeed->base, ctrl_base + FSI_MSENP0 + (4 * idx),
+	result = opb_write(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx),
 			reg, 4);
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	ret = opb_read(aspeed->base, ctrl_base + FSI_MENP0 + (4 * idx),
+	ret = opb_read(aspeed, ctrl_base + FSI_MENP0 + (4 * idx),
 			4, &result);
 	if (ret)
 		return ret;
@@ -428,46 +431,46 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
 			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_write(aspeed->base, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
 
 	/* Initialize the MFSI (hub master) engine */
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
 			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_write(aspeed->base, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
 
 	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
-	opb_write(aspeed->base, ctrl_base + FSI_MECTRL, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MECTRL, reg, 4);
 
 	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
 			| fsi_mmode_crs0(DEFAULT_DIVISOR)
 			| fsi_mmode_crs1(DEFAULT_DIVISOR)
 			| FSI_MMODE_P8_TO_LSB);
-	opb_write(aspeed->base, ctrl_base + FSI_MMODE, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MMODE, reg, 4);
 
 	reg = cpu_to_be32(0xffff0000);
-	opb_write(aspeed->base, ctrl_base + FSI_MDLYR, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MDLYR, reg, 4);
 
 	reg = cpu_to_be32(~0);
-	opb_write(aspeed->base, ctrl_base + FSI_MSENP0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MSENP0, reg, 4);
 
 	/* Leave enabled long enough for master logic to set up */
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	opb_write(aspeed->base, ctrl_base + FSI_MCENP0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MCENP0, reg, 4);
 
-	opb_read(aspeed->base, ctrl_base + FSI_MAEB, 4, NULL);
+	opb_read(aspeed, ctrl_base + FSI_MAEB, 4, NULL);
 
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	opb_write(aspeed->base, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
 
-	opb_read(aspeed->base, ctrl_base + FSI_MLEVP0, 4, NULL);
+	opb_read(aspeed, ctrl_base + FSI_MLEVP0, 4, NULL);
 
 	/* Reset the master bridge */
 	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	opb_write(aspeed->base, ctrl_base + FSI_MRESB0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
 
 	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	opb_write(aspeed->base, ctrl_base + FSI_MRESB0, reg, 4);
+	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
 
 	return 0;
 }
@@ -478,7 +481,7 @@ static int fsi_master_aspeed_debugfs_get(void *data, u64 *val)
 	u32 out;
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
 
-	rc = opb_read(entry->aspeed->base, ctrl_base + entry->addr, 4, &out);
+	rc = opb_read(entry->aspeed, ctrl_base + entry->addr, 4, &out);
 	if (rc)
 		return rc;
 
@@ -491,7 +494,7 @@ static int fsi_master_aspeed_debugfs_set(void *data, u64 val)
 	u32 in = cpu_to_be32((u32)(val & 0xFFFFFFFFULL));
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
 
-	rc = opb_write(entry->aspeed->base, ctrl_base + entry->addr, in, 4);
+	rc = opb_write(entry->aspeed, ctrl_base + entry->addr, in, 4);
 	if (rc)
 		return rc;
 
@@ -507,7 +510,7 @@ static int fsi_master_aspeed_clock_debugfs_get(void *data, u64 *val)
 	u32 out;
 	int rc;
 
-	rc = opb_read(aspeed->base, ctrl_base, 4, &out);
+	rc = opb_read(aspeed, ctrl_base, 4, &out);
 	if (rc)
 		return rc;
 
@@ -525,7 +528,7 @@ static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
 	if (val > 0x3ff)
 		return -EINVAL;
 
-	rc = opb_read(aspeed->base, ctrl_base, 4, &raw);
+	rc = opb_read(aspeed, ctrl_base, 4, &raw);
 	if (rc)
 		return rc;
 
@@ -534,7 +537,7 @@ static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
 	reg &= ~(0x3ff << 18);
 	reg |= (val & 0x3ff) << 18;
 
-	rc = opb_write(aspeed->base, ctrl_base, cpu_to_be32(reg), 4);
+	rc = opb_write(aspeed, ctrl_base, cpu_to_be32(reg), 4);
 	if (rc)
 		return rc;
 
@@ -598,7 +601,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 */
 	writel(0x1, aspeed->base + OPB0_SELECT);
 
-	rc = opb_read(aspeed->base, ctrl_base + FSI_MVER, 4, &raw);
+	rc = opb_read(aspeed, ctrl_base + FSI_MVER, 4, &raw);
 	if (rc) {
 		dev_err(&pdev->dev, "failed to read hub version\n");
 		return rc;
-- 
2.23.0

