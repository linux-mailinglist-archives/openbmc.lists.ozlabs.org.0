Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74314759A
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 01:28:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483g3m2qTYzDqXf
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 11:28:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hs7VVAp4; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483g304CxfzDqT6
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 11:27:56 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d15so250211pjw.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 16:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNrdnaREA4m3+yo3CikO7Mn+YDaIFzYU06x6GksmKfQ=;
 b=hs7VVAp4TaUkKfVKXN586snVY04uVaL1eZeTuZId4Z6Rnyu6yOqI7fH7tg0RqW9Cxl
 245BLqNPQ6+OAml62SZgvvRoGGIg8bV1YbwV9EqObOxSNx4cLfd65FWA+kzqu5ypsV8y
 8diwsx6UazNeYTg2wazkkFrlekEYuc+S4eU8rBefjDH63dX8LfMwNMkbAXZ/k2iE3x0n
 bvAt29Fh/10CX5k9k3+KUqG/hkgryqoZh27B0v/wO3j5thGg08fD15qkL39aHtytjI/B
 dKpOsDmTIOsuANFu9ep4nFIgjZLUynvNcGelUO6Pm/bOlO2a/SzIxm9mnwDV3zdnfUDe
 GJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gNrdnaREA4m3+yo3CikO7Mn+YDaIFzYU06x6GksmKfQ=;
 b=MAeyPGG/+Tn1iPLwD+t9CEjrrBTvOsFSynEJ/0UVM4zh64idwN0k46WS9MZCeXIw4Q
 IpHFwxWhFSN4GSCHP5C8tWjuImR7oGAOOJpjiOnSeX3gouFXI2lX9QXOaIueE6dZDx4w
 OSJZKGkRHIRmr+CVA/g6cmmUc8cAbYgYn4SvuyBoPy8ahjRW7QREnBALBI05/VlMTn8U
 kChJLw/zYqKiouJbpwxxni6s5JVmbLbIprZLT/EirYpF1VTc8eSXwJ90FW5ZcGIVrcIv
 zmD93AnhzvZhEgcpbS74a542D8vSsVGVaOtIY6FXSO/zZVNZra9SadiPtvCEfnT/jZEq
 CjsA==
X-Gm-Message-State: APjAAAUzHyCKua+y8aX6ZOmm8okVqKguxrE+J0IOZTEuT1nUThzhc/Pd
 tvvrl0VN/yvV784X+DMTbo0FZ88l
X-Google-Smtp-Source: APXvYqzDkiDPzN3X3bJwQ+MShPA2Kftg475+h4xC3rcu1hvXOYJffHmRpPVMvwqqMGs+sBirm5utWg==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr349816pjj.84.1579825671965; 
 Thu, 23 Jan 2020 16:27:51 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j28sm4372581pgb.36.2020.01.23.16.27.49
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 16:27:51 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] fsi: aspeed: Add clock debugfs
Date: Fri, 24 Jan 2020 10:57:42 +1030
Message-Id: <20200124002742.251946-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The bus clock speed is commonly tweaked during bringup and testing.

This could be come a device tree property in the future.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f49742b310c2..24563bbba8ff 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -4,6 +4,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/debugfs.h>
 #include <linux/fsi.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -21,6 +22,7 @@ struct fsi_master_aspeed {
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
+	struct dentry           *debugfs_dir;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -419,6 +421,49 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static int fsi_master_aspeed_clock_debugfs_get(void *data, u64 *val)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	__be32 out;
+	int rc;
+
+	rc = opb_readl(aspeed, ctrl_base, &out);
+	if (rc)
+		return rc;
+
+	*val = (be32_to_cpu(out) >> FSI_MMODE_CRS0SHFT) & FSI_MMODE_CRS0MASK;
+
+	return 0;
+}
+
+static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	u32 reg, rc;
+	__be32 raw;
+
+	if (val > 0x3ff)
+		return -EINVAL;
+
+	rc = opb_readl(aspeed, ctrl_base, &raw);
+	if (rc)
+		return rc;
+
+	reg = be32_to_cpu(raw);
+
+	reg &= ~(FSI_MMODE_CRS0MASK << FSI_MMODE_CRS0SHFT);
+	reg |= fsi_mmode_crs0(val);
+
+	rc = opb_writel(aspeed, ctrl_base, cpu_to_be32(reg));
+	if (rc)
+		return rc;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_clock_debugfs_ops,
+			 fsi_master_aspeed_clock_debugfs_get,
+			 fsi_master_aspeed_clock_debugfs_set, "0x%llx\n");
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -509,6 +554,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	 * we're ready.
 	 */
 	get_device(&aspeed->master.dev);
+
+	aspeed->debugfs_dir = debugfs_create_dir("fsi-master-aspeed", NULL);
+	debugfs_create_file("clock_div", 0644, aspeed->debugfs_dir,
+			    aspeed, &fsi_master_aspeed_clock_debugfs_ops);
+
 	return 0;
 
 err_release:
@@ -523,6 +573,8 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
+	debugfs_remove_recursive(aspeed->debugfs_dir);
+
 	return 0;
 }
 
-- 
2.24.1

