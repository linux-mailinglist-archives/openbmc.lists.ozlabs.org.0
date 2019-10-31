Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2FEAA67
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:39:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Yzq26PYzF5KC
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:39:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eEJutff0"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YwX2Jx3zF3gN
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:43 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id l24so3187312pgh.10
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SuNQHgfPloUEBeaGA9apvVWUrhi1gWfkBNZxgXEXMY=;
 b=eEJutff0ceyR34G1hLiv5yasuvLN6UCclWkExz2jCo7NejuLzMOrcXTRUuY1nc9PiP
 Z4E1uFARR8Kyp2dAwp1xyg/+wPyeNDyTa+gJH0xRIrxQGbsrzP5E/v8uDmhVdcMPjUDS
 Dh+RHh1l7aH1au/bMIBnnvAZXW/g/r9nGy5oYsRZ1TEynR0IiO0E4FTFqD3NP+lNMDfu
 KJz+u8Uf/C914btqBF7knHPYTnQxjGHAzmCDng4qnfFaOZPxrahzRNFeKcbGw6RmBmCM
 u1RK7oU0TAIltBAy7DxJag6qFZBbwDGS+02SPyP/XyroeqMIT1BdbAFWp7LfR68qR3sz
 9Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/SuNQHgfPloUEBeaGA9apvVWUrhi1gWfkBNZxgXEXMY=;
 b=ic8chBvUAgBoAZHQ1T6xpESh/aavZGN0LlsHglQNcng/Ea2KQBNbHbJcjkU0bH4d0Q
 qnLrvz9YzNCNSBYsTU93oGA9/2vsfCDweDuJMv/mBRzV7+cB8ts9hJNf0DgKXIgn+MB9
 PyDKSrSSLyV36Uc/J0kroj6GQJ3acrc48lZM73gVBz0YKV4huo8T+TGu4ZGwGiXpJQ6A
 JRSUTudHlQG7BMuPfCq9EyQUf4JHK/2GpOg3rjdo8H5y209mvJHssyis9v6Yyv/TvU2E
 jTxTN1xP+0UHbeAuZZ12HYhmqWWZT5p2o+cvr+1zGGsUihpOJaF1jXA8A43lqktdWNzp
 f3zA==
X-Gm-Message-State: APjAAAUyQrX2hgKDGbaK7NrX7zd2e1PV6BSHHBPmHxagNAql/fQveUmx
 egA4dT8Mr36hLZNqt3woX9mVEV7Feu8=
X-Google-Smtp-Source: APXvYqzvTjAhr541vgC6VNuEn2rDUoo2PmCUCmhMW7naSfcYr528oUSePCjHsJ9b3buRmicErjP7yw==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr4458528pjk.75.1572500201384; 
 Wed, 30 Oct 2019 22:36:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 1/8] fsi: aspeed: Implement byte and half
 word writes
Date: Thu, 31 Oct 2019 16:06:18 +1030
Message-Id: <20191031053625.422-2-joel@jms.id.au>
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

The driver did not previously support non-word size transfers. The
fsi-i2c driver attempts accesses of this size, so we require it now.

This creates three functions for doing word, half word and byte
writes. This was done to avoid having to decide which length the
transfer was twice: both in aspeed_master_write to determine how much of
the void * to copy, and again in opb_write to look up the opcode.

It we could have passed the opcode in aspeed_master_write, but this
allows the majority of opb_writes in this driver to omit the opcode/size
parameter, as most writes are full words. It also means call sites get
the types checked.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 97d2cac94291..8d6deb6994fb 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -168,23 +168,21 @@ static const u32 fsi_base = 0xa0000000;
 
 /* OPBx_XFER_SIZE */
 #define XFER_WORD	(BIT(1) | BIT(0))
-#define XFER_NIBBLE	(BIT(0))
+#define XFER_HALFWORD	(BIT(0))
 #define XFER_BYTE	(0)
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
 
-static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
-		     uint32_t val, size_t size)
+static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
+		       u32 val, u32 transfer_size)
 {
 	void __iomem *base = aspeed->base;
-	u32 reg, ret, status;
-
-	/* TODO: implement other sizes, see 0x18 */
-	WARN_ON(size != 4);
+	u32 reg, status;
+	int ret;
 
 	writel(CMD_WRITE, base + OPB0_RW);
-	writel(XFER_WORD, base + OPB0_XFER_SIZE);
+	writel(transfer_size, base + OPB0_XFER_SIZE);
 	writel(addr, base + OPB0_FSI_ADDR);
 	writel(val, base + OPB0_FSI_DATA_W);
 	writel(0x1, base + OPB_IRQ_CLEAR);
@@ -196,7 +194,7 @@ static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	status = readl(base + OPB0_STATUS);
 
-	trace_fsi_master_aspeed_opb_write(addr, val, size, status, reg);
+	trace_fsi_master_aspeed_opb_write(addr, val, transfer_size, status, reg);
 
 	/* Return error when poll timed out */
 	if (ret)
@@ -209,6 +207,21 @@ static u32 opb_write(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	return 0;
 }
 
+static int opb_writeb(struct fsi_master_aspeed *aspeed, u32 addr, u8 val)
+{
+	return __opb_write(aspeed, addr, val, XFER_BYTE);
+}
+
+static int opb_writew(struct fsi_master_aspeed *aspeed, u32 addr, __be16 val)
+{
+	return __opb_write(aspeed, addr, (__force u16)val, XFER_HALFWORD);
+}
+
+static int opb_writel(struct fsi_master_aspeed *aspeed, u32 addr, __be32 val)
+{
+	return __opb_write(aspeed, addr, (__force u32)val, XFER_WORD);
+}
+
 static int opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 		    size_t size, u32 *out)
 {
@@ -272,8 +285,8 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 		/* Check MAEB (0x70) ? */
 
 		/* Then clear errors in master */
-		ret = opb_write(aspeed, ctrl_base + 0xd0,
-				cpu_to_be32(0x20000000), 4);
+		ret = opb_writel(aspeed, ctrl_base + 0xd0,
+				cpu_to_be32(0x20000000));
 		if (ret) {
 			/* TODO: log? return different code? */
 			return ret;
@@ -314,7 +327,20 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_write(aspeed, fsi_base + addr, *(uint32_t *)val, size);
+
+	switch (size) {
+	case 1:
+		ret = opb_writeb(aspeed, fsi_base + addr, *(u8 *)val);
+		break;
+	case 2:
+		ret = opb_writew(aspeed, fsi_base + addr, *(__be16 *)val);
+		break;
+	case 4:
+		ret = opb_writel(aspeed, fsi_base + addr, *(__be32 *)val);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
@@ -334,8 +360,7 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	reg = cpu_to_be32(0x80000000 >> bit);
 
-	result = opb_write(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx),
-			reg, 4);
+	result = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
@@ -415,46 +440,46 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
 			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
 
 	/* Initialize the MFSI (hub master) engine */
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
 			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
 
 	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
-	opb_write(aspeed, ctrl_base + FSI_MECTRL, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MECTRL, reg);
 
 	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
 			| fsi_mmode_crs0(DEFAULT_DIVISOR)
 			| fsi_mmode_crs1(DEFAULT_DIVISOR)
 			| FSI_MMODE_P8_TO_LSB);
-	opb_write(aspeed, ctrl_base + FSI_MMODE, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MMODE, reg);
 
 	reg = cpu_to_be32(0xffff0000);
-	opb_write(aspeed, ctrl_base + FSI_MDLYR, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MDLYR, reg);
 
 	reg = cpu_to_be32(~0);
-	opb_write(aspeed, ctrl_base + FSI_MSENP0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MSENP0, reg);
 
 	/* Leave enabled long enough for master logic to set up */
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	opb_write(aspeed, ctrl_base + FSI_MCENP0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MCENP0, reg);
 
 	opb_read(aspeed, ctrl_base + FSI_MAEB, 4, NULL);
 
 	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	opb_write(aspeed, ctrl_base + FSI_MRESP0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MRESP0, reg);
 
 	opb_read(aspeed, ctrl_base + FSI_MLEVP0, 4, NULL);
 
 	/* Reset the master bridge */
 	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
 
 	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	opb_write(aspeed, ctrl_base + FSI_MRESB0, reg, 4);
+	opb_writel(aspeed, ctrl_base + FSI_MRESB0, reg);
 
 	return 0;
 }
@@ -478,7 +503,7 @@ static int fsi_master_aspeed_debugfs_set(void *data, u64 val)
 	u32 in = cpu_to_be32((u32)(val & 0xFFFFFFFFULL));
 	struct fsi_master_aspeed_debugfs_entry *entry = data;
 
-	rc = opb_write(entry->aspeed, ctrl_base + entry->addr, in, 4);
+	rc = opb_writel(entry->aspeed, ctrl_base + entry->addr, in);
 	if (rc)
 		return rc;
 
@@ -521,7 +546,7 @@ static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
 	reg &= ~(0x3ff << 18);
 	reg |= (val & 0x3ff) << 18;
 
-	rc = opb_write(aspeed, ctrl_base, cpu_to_be32(reg), 4);
+	rc = opb_writel(aspeed, ctrl_base, cpu_to_be32(reg));
 	if (rc)
 		return rc;
 
-- 
2.24.0.rc1

