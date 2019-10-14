Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7CD5C9D
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 09:48:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s9fG6nC1zDqZB
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 18:48:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dt6lCsvn"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s9c76jl4zDqWp
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 18:46:31 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q21so9889441pfn.11
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UTwHLeu7tu1TDu9kjsKgBgyowrx1YJyw8V5vY2g9xGE=;
 b=dt6lCsvnncMOXEfftkX65m+Kvvjc22P6p5LuPVyZREUV3x1oJZ0k6l0bdwJ8FYbpSn
 MoBhoZ3F/fxkLjOqS5MLux9wAHD/F6FUSPznkNFd7FDbZtHdTcNJU6EfurtIG1CRA8F3
 1RrQGlr9om0Hz9Lu6qAMIZ6y6pP9ibuOy+906NvnCjLbenu+Tt1dt1ng/GFThdbwPUXs
 4I//mbc0Lmm5smbkAQ5Iisz7vNgzrrGNG2+uEErOUjJG2sgQM8OmOyxIxnr5Up4NppQP
 oNTJMwz5L8xqQzT7U/ai1r01YQSuaKrkR0kWUHEIXGS4uZOkZeNPIe/C2xyj4Hvn4Sxt
 DhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UTwHLeu7tu1TDu9kjsKgBgyowrx1YJyw8V5vY2g9xGE=;
 b=nVT/c37VoVtoJxnV1vKLGaOf4QzZ+X6aSBZATtCavsZL8+wRNy2x8aN1HBzJQuK0Va
 AmSAczRzXFy7/9OMNidoVc87CbDiXej0HpzVgcgoHqkDd+wwB34F1SC+UHvVC+5Y/gkp
 goSLSGArPMLnOC29QjJ9zFxHggWctVCPNRHpJNNsUWxOEu6vaJdJKk315L73hsQbL/8Y
 qb0R5McWOvxISXQufHwjWISgr+zmQdh0x5pQyahXakdIYGUHV6FASzhWLuRrRJBBjFqW
 1oXLYB0p23CmyDUfhYHP918eht3ufWkxXMSCrTcg2QjAs7Q28klu3iaZY0gEYIfu6QS1
 OOGQ==
X-Gm-Message-State: APjAAAWfjww7KTL+hW7CeCTS/IxQLL2TdeKotjB/exzH2ZjRQ+cbAC7C
 FZeNbFqz4zxA5SDOu9BJpnlp9Cs8Agc=
X-Google-Smtp-Source: APXvYqz7r9e8sO7N1CiAKTBXkc75ZTANtigRxas1xryo8lJ7s+ZDSqI247X+It+d5tBrxN/NK4tEhw==
X-Received: by 2002:a65:6207:: with SMTP id d7mr32185878pgv.227.1571039188736; 
 Mon, 14 Oct 2019 00:46:28 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id z12sm16714146pfj.41.2019.10.14.00.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 00:46:28 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] fsi: aspeed: Configure optional GPIOs
Date: Mon, 14 Oct 2019 18:16:17 +1030
Message-Id: <20191014074618.15506-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014074618.15506-1-joel@jms.id.au>
References: <20191014074618.15506-1-joel@jms.id.au>
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

On Tacoma the enable and mux GPIOs allow the BMC to enable FSI and
control if the clock and data should come from the BMC, or from the
debug connector.

Configure these as optional GPIOs which will fail without error for
systems that do not have these GPIOs in their device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 6496d2972944..2048e38e7200 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
+#include <linux/gpio/consumer.h>
 
 #include "fsi-master.h"
 
@@ -85,6 +86,9 @@ struct fsi_master_aspeed {
 	void __iomem		*base;
 	struct clk		*clk;
 
+	struct gpio_desc	*gpio_enable;
+	struct gpio_desc	*gpio_mux;
+
 	struct dentry		*debugfs_dir;
 	struct fsi_master_aspeed_debugfs_entry debugfs[FSI_NUM_DEBUGFS_ENTRIES];
 };
@@ -471,6 +475,30 @@ DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
 			 fsi_master_aspeed_debugfs_get,
 			 fsi_master_aspeed_debugfs_set, "0x%08llx\n");
 
+static int aspeed_master_gpio_init(struct fsi_master_aspeed *master)
+{
+	struct device *dev = master->dev;
+	struct gpio_desc *gpio;
+
+	gpio = devm_gpiod_get_optional(dev, "fsi-enable", 0);
+	if (IS_ERR(gpio)) {
+		dev_err(dev, "failed to get fsi enable gpio\n");
+		return PTR_ERR(gpio);
+	}
+	master->gpio_enable = gpio;
+	gpiod_direction_output(master->gpio_enable, 1);
+
+	gpio = devm_gpiod_get_optional(dev, "fsi-mux", 0);
+	if (IS_ERR(gpio)) {
+		dev_err(dev, "failed to get fsi mux gpio\n");
+		return PTR_ERR(gpio);
+	}
+	master->gpio_mux = gpio;
+	gpiod_direction_output(master->gpio_mux, 1);
+
+	return 0;
+}
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -540,6 +568,8 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
+	aspeed_master_gpio_init(aspeed);
+
 	aspeed_master_init(aspeed);
 
 	aspeed->debugfs_dir = debugfs_create_dir("fsi-master-aspeed", NULL);
-- 
2.23.0

