Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64334A4EA1
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 06:29:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MHD85Y6xzDqV4
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 14:29:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nMCFMKow"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Fd6KmWft"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGXc4SMNzDqH4;
 Mon,  2 Sep 2019 13:58:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0CC4A44A;
 Sun,  1 Sep 2019 23:58:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 23:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6HpwFSX23/R6f
 qQ1Vmx0lv614ze3IiqChsWjpEUZsHk=; b=nMCFMKow35QSDhSi44FBntAkPCA8R
 hpr7mWF9BVlaK6uFQ+S1uhXImb1U+G+v3mccDCBLJuO9F5+e3ZJ6t9BbnT0Rzwlt
 a86bMHprPe+3qBZUZuZkH3jW2eAezjVbe0GDmKFwYLEFXDMm6Lztc4jyf2k39UBu
 zIkDJOKpud+rtQF7rMFGmOmYf7p5iVNm+VZnXRoROKBkrljzJ28ZXygnYib75kec
 mg+AtHsrd/BDjyzscQHq3iEjVsO/ZSbQ3p1hzZ0vqST2srjvFhDDMTotxzSzNo49
 EVh4siLSD+PUNnGKX74XHGNPafgwznWrIEoT83VD1sBmSEEfBJSI2o8YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6HpwFSX23/R6fqQ1Vmx0lv614ze3IiqChsWjpEUZsHk=; b=Fd6KmWft
 1gg/nvdFoYNWtvYbUu6e5NNroZYZra5us7LqGeTZEAXIqtbuGzGofL2YgjGyJI2B
 bieEE12Zak5D6qZotkQP7IccvSJYmv9JqOy/Vz83hRmozVFiVv9AohbAMLBvRBU7
 fl8TuzLUCVbDC8Jd+NmLF+TRzhtmXaiE40H/9E+B9GQ0zmV9tMN6xKF6w1KMfqxB
 Zr1GZ1DOJx5r7hayRkfb5LV+hEoeXgA9Odrm0ySgqdOvNUeJzDc0/DZtG0u2mJZu
 fFKzVu5+oiQbz2wPLN8qyus1b6VN+3kM5vwh8S3r9HvhFCdSL+guMpScvFOMazLu
 Oo7eqbim2SwDNw==
X-ME-Sender: <xms:apNsXRINKU-hEJclL32ZGTQSIqUyAjksgqsINnv_ZaXC8gja6RauSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:apNsXbqnNQg6UzznnOk2pKWxlMuuYqhqpWaPwfxavJ96zx7KQWNTRw>
 <xmx:apNsXQALeJMlZV3rwIJa5oHS3kVYvJLkJODDUKv81P4VhshN0ge2PQ>
 <xmx:apNsXY_qfw1QNrR2EAmrkCNKnzljNwHDJhkhOU0U3FdlJpEXT-a8sw>
 <xmx:apNsXXVYgpwm-tSXWW2Au-acbA2_x9x3X034qNeQLcghAbpdImqeog>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46C91D6005B;
 Sun,  1 Sep 2019 23:58:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 1/4] mmc: sdhci-of-aspeed: Fix link failure for SPARC
Date: Mon,  2 Sep 2019 13:28:39 +0930
Message-Id: <20190902035842.2747-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902035842.2747-1-andrew@aj.id.au>
References: <20190902035842.2747-1-andrew@aj.id.au>
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
Cc: ulf.hansson@linaro.org, kbuild test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Resolves the following build error reported by the 0-day bot:

    ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!

SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Guard the
callsite to maintain build coverage for the rest of the driver.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 38 ++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d5acb5afc50f..96ca494752c5 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -224,10 +224,30 @@ static struct platform_driver aspeed_sdhci_driver = {
 	.remove		= aspeed_sdhci_remove,
 };
 
-static int aspeed_sdc_probe(struct platform_device *pdev)
-
+static int aspeed_sdc_create_sdhcis(struct platform_device *pdev)
 {
+#if defined(CONFIG_OF_ADDRESS)
 	struct device_node *parent, *child;
+
+	parent = pdev->dev.of_node;
+
+	for_each_available_child_of_node(parent, child) {
+		struct platform_device *cpdev;
+
+		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
+		if (!cpdev) {
+			of_node_put(child);
+			return -ENODEV;
+		}
+	}
+#endif
+
+	return 0;
+}
+
+static int aspeed_sdc_probe(struct platform_device *pdev)
+
+{
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -256,17 +276,9 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, sdc);
 
-	parent = pdev->dev.of_node;
-	for_each_available_child_of_node(parent, child) {
-		struct platform_device *cpdev;
-
-		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
-		if (!cpdev) {
-			of_node_put(child);
-			ret = -ENODEV;
-			goto err_clk;
-		}
-	}
+	ret = aspeed_sdc_create_sdhcis(pdev);
+	if (ret)
+		goto err_clk;
 
 	return 0;
 
-- 
2.20.1

