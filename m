Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BDD591C
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 02:45:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s0G73WtXzDqvN
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 11:45:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lT14U6+W"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s0FV2lrszDqsb
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 11:44:45 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id i76so9067614pgc.0
 for <openbmc@lists.ozlabs.org>; Sun, 13 Oct 2019 17:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82ynF9Okn2oVAqXhbsFEQR/mHbceO1shRp3zAbJBG54=;
 b=lT14U6+WrjFWEWktcqrcYa8MmIaFx9i+UA2xsYkIii1XIazSci36vNLd6KZxUMkm3Q
 NLZ/n6vhDsQWoBp0ZyaL4cF558CcnJvdt63UksHfOvNb59zo+Ake9ie8Bvp7aSZuIhjx
 l/yoL3MKCLBMJP/13lWsp9ipHnCmkaWPmcMv5DgmXOcoGU4xM80Wi20lTqlvBSWGSVtz
 GocAuXGGupXqo8eUpGt5VNHUrMZwC6VuHhiiZfKd113inuPiSwfuRcQ0KfRKwnXp63oK
 2Do8mHC7Rj9pw0TjRI9qlwtkGa1ijJQPSbfddc8dWAmkhbG7jbzoOlZHA+fsK13OrhoU
 ZXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=82ynF9Okn2oVAqXhbsFEQR/mHbceO1shRp3zAbJBG54=;
 b=AM/MZN/vC/mipDYfiSuE5H6/GMLSHfHD8o9W/ZBNfKKd6iCPp4m/qNKrACT4piSjAc
 woH+lCXI8sTAcTcqB6llvtO+Oq60cFaKWosPxKP6XqOlR7Bi1kWPapi7EzGZCbFeVWcR
 JzYeZzaWjeRvvsXv1PFGVt9+AYB0tjBnnunmHALxHccNPoq9lLgSiHVVDg3ByJOtr3Fx
 BgQXeeqjPhIG4JV8927Z+9hhni44ph8JoIwmAr8F1Co57ibFovxZvhwfpVq4JpyNojRh
 r0tdz9n+G064y/6aXMaf04YMVubNa296ILVTAEUsBLe7BiuvWFhrPKUlaR7A1YepK3VZ
 K21w==
X-Gm-Message-State: APjAAAWJu0qdUid9AbA/LmVxCjSybvUDw14O8T6W66D2dM/QjC7bpknT
 rRaYbqKWGlaLVxmDlx3kk4itnuiuZP4=
X-Google-Smtp-Source: APXvYqwmQR5mW0hPqYkxHKahoUYbCCc0FccoGDm3q7Q6B+WmE14DTERC0VCkyHje0rGRyUE/qvsGVQ==
X-Received: by 2002:a17:90a:e987:: with SMTP id
 v7mr33371913pjy.86.1571013881548; 
 Sun, 13 Oct 2019 17:44:41 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id v5sm17450262pfv.76.2019.10.13.17.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 17:44:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] fsi: aspeed: Add debugfs entries
Date: Mon, 14 Oct 2019 11:14:33 +1030
Message-Id: <20191014004433.28180-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James <eajames@linux.ibm.com>

Add debugfs entries for the FSI master registers.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 135 ++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index dce61f08425e..6496d2972944 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -3,6 +3,7 @@
 // FSI master driver for AST2600
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/fsi.h>
 #include <linux/io.h>
@@ -28,6 +29,7 @@
 #define FSI_MCENP0		0x20		/* C: Clear enable */
 #define FSI_MAEB		0x70		/* R: Error address */
 #define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MSTAP0		0xd0		/* R: Port status */
 #define FSI_MRESP0		0xd0		/* W: Port reset */
 #define FSI_MESRB0		0x1d0		/* R: Master error status */
 #define FSI_MRESB0		0x1d0		/* W: Reset bridge */
@@ -68,11 +70,23 @@
 
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
+#define FSI_NUM_DEBUGFS_ENTRIES		14
+
+struct fsi_master_aspeed;
+
+struct fsi_master_aspeed_debugfs_entry {
+	struct fsi_master_aspeed *aspeed;
+	uint32_t addr;
+};
+
 struct fsi_master_aspeed {
 	struct fsi_master	master;
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
+
+	struct dentry		*debugfs_dir;
+	struct fsi_master_aspeed_debugfs_entry debugfs[FSI_NUM_DEBUGFS_ENTRIES];
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -428,6 +442,35 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static int fsi_master_aspeed_debugfs_get(void *data, u64 *val)
+{
+	int rc;
+	u32 out;
+	struct fsi_master_aspeed_debugfs_entry *entry = data;
+
+	rc = opb_read(entry->aspeed->base, ctrl_base + entry->addr, 4, &out);
+	if (rc)
+		return rc;
+
+	*val = (u64)be32_to_cpu(out);
+	return 0;
+}
+static int fsi_master_aspeed_debugfs_set(void *data, u64 val)
+{
+	u32 rc;
+	u32 in = cpu_to_be32((u32)(val & 0xFFFFFFFFULL));
+	struct fsi_master_aspeed_debugfs_entry *entry = data;
+
+	rc = opb_write(entry->aspeed->base, ctrl_base + entry->addr, in, 4);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
+			 fsi_master_aspeed_debugfs_get,
+			 fsi_master_aspeed_debugfs_set, "0x%08llx\n");
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -499,6 +542,96 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	aspeed_master_init(aspeed);
 
+	aspeed->debugfs_dir = debugfs_create_dir("fsi-master-aspeed", NULL);
+	if (aspeed->debugfs_dir) {
+		int idx = 0;
+		struct fsi_master_aspeed_debugfs_entry *etrs = aspeed->debugfs;
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MMODE;
+		debugfs_create_file("mmode", 0644, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MDLYR;
+		debugfs_create_file("mdlyr", 0644, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MCRSP;
+		debugfs_create_file("mcrsp0", 0644, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MENP0;
+		debugfs_create_file("menp0", 0644, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MLEVP0;
+		debugfs_create_file("mlevp0", 0444, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MSENP0;
+		debugfs_create_file("msenp0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MCENP0;
+		debugfs_create_file("mcenp0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MAEB;
+		debugfs_create_file("maeb", 0444, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MVER;
+		debugfs_create_file("mver", 0444, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MSTAP0;
+		debugfs_create_file("mstap0", 0444, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MRESP0;
+		debugfs_create_file("mresp0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MESRB0;
+		debugfs_create_file("mesrb0", 0444, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MRESB0;
+		debugfs_create_file("mresb0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MECTRL;
+		debugfs_create_file("mectrl", 0644, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+	}
+
 	rc = fsi_master_register(&aspeed->master);
 	if (rc)
 		goto err_release;
@@ -522,6 +655,8 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed = platform_get_drvdata(pdev);
 
+	debugfs_remove_recursive(aspeed->debugfs_dir);
+
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
-- 
2.23.0

