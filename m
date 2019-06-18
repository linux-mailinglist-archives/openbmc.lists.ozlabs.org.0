Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A049708
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 03:41:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SW54304xzDqXt
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 11:41:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="SlGZ4u9n"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kFWrHxTZ"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SW1K4B2hzDqSk
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:37:57 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F64922205;
 Mon, 17 Jun 2019 21:37:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Jun 2019 21:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=wFAn+qFuDoz4MSlCXGphjce6sQayOAqKAew4nc01p2E=; b=SlGZ4
 u9n6QQj2FWKKLidFHM7RZ4S0WmBQOmduQyB+2oOTFfVYSx/KrlZ8Jz/hXBjfdJdX
 FqugkqUYTNXIEg7IvT0kL+tYHmsXt/TwbaX03vqU2ytE3AOZwnK63f01CUglWVK4
 L3jDBSr6lcvoR8OLPjaggt9bEJicKm2g44sIB1Cau3DtuVkUD8aORfiOy5C6BlIP
 2ibszvJ9emagdIxHl8Kt23A7WuM3iymZdwaryeL8/E2Jh3cmOGhhqbn5hNfmozle
 SfkbaCVWD07/53xl60u7hbDGJavr4yLNoz2lk/REdCxAR1m51ZvVTlIJBZeqnf3s
 x2RNPkjWR8UK0w1zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wFAn+qFuDoz4MSlCXGphjce6sQayOAqKAew4nc01p2E=; b=kFWrHxTZ
 RUNkKrSuVQhp1ggLyO7ExsV+CrWPJgW+o5HWWaN4lO7usuiQQX/z4G5VY9N2PSsi
 fNRvDxZQqGO0bcVWUFpqoLLCbpMNx3wBSZFoK5Hj06ijcPmMbbYkhEH8bsMwI29Q
 PkaN4p/eMLaMchUt0iyMYh57+PnSt2e2Zh9HH6E+LA5AVdLJ+6caEdA0+tDmKl/n
 xL57hKqRhFXjDILa1HaKgTmlMR7xv6Bu1ti8bAsLtpar6kRWZ7pjmtJJQs2xFMgV
 TZwEmbZBalTiFhz/KOQ4yJZrfBkcEUP0vvpGF3qM0Lj55KYI0w/Zz/Cq0+Pi45zd
 OM6heHfjmV4TGw==
X-ME-Sender: <xms:ckAIXVgSMVfZxDh-SI5wm1RYlR2CVYSN7YVXtA6Gr_7Jw2E0TPo9wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeikedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ckAIXWXMKjGaNlrNzlzdVZs1xfN4X00y3ijkK0p4uKiJq9CHl-p_YQ>
 <xmx:ckAIXX3O9nTuwt_QdShlF_YEqD41PpFbpIM8NqKtTYDP2nHysh92dA>
 <xmx:ckAIXcHYaSRdBFwhfhHC_Y0Y14kMwy3Z93BCQ_cYEnfyIRgCYzT5yw>
 <xmx:c0AIXRiFUb1dB6-YCmRrNtpz_QWVF9zNkgiBYn1TPS4_LBWyY4WKNA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 650F8380083;
 Mon, 17 Jun 2019 21:37:52 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH v2 3/4] net/ftgmac100: Add NC-SI mode support
Date: Tue, 18 Jun 2019 11:37:19 +1000
Message-Id: <20190618013720.2823-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618013720.2823-1-sam@mendozajonas.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
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
Cc: openbmc@lists.ozlabs.org, joe.hershberger@ni.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, sjg@chromium.org, clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update the ftgmac100 driver to support NC-SI instead of an mdio phy
where available. This is a common setup for Aspeed AST2x00 platforms.

NC-SI mode is determined from the device-tree if either phy-mode sets it
or the use-ncsi property exists. If set then normal mdio setup is
skipped in favour of the NC-SI phy.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/ftgmac100.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 92c38a81bd..c0100e91c7 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -18,6 +18,7 @@
 #include <wait_bit.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <net/ncsi.h>
 
 #include "ftgmac100.h"
 
@@ -81,6 +82,7 @@ struct ftgmac100_data {
 	struct mii_dev *bus;
 	u32 phy_mode;
 	u32 max_speed;
+	bool ncsi_mode;
 
 	struct clk_bulk clks;
 
@@ -181,7 +183,7 @@ static int ftgmac100_phy_adjust_link(struct ftgmac100_data *priv)
 	struct phy_device *phydev = priv->phydev;
 	u32 maccr;
 
-	if (!phydev->link) {
+	if (!phydev->link && !priv->ncsi_mode) {
 		dev_err(phydev->dev, "No link\n");
 		return -EREMOTEIO;
 	}
@@ -217,7 +219,8 @@ static int ftgmac100_phy_init(struct udevice *dev)
 	if (!phydev)
 		return -ENODEV;
 
-	phydev->supported &= PHY_GBIT_FEATURES;
+	if (!priv->ncsi_mode)
+		phydev->supported &= PHY_GBIT_FEATURES;
 	if (priv->max_speed) {
 		ret = phy_set_supported(phydev, priv->max_speed);
 		if (ret)
@@ -275,7 +278,8 @@ static void ftgmac100_stop(struct udevice *dev)
 
 	writel(0, &ftgmac100->maccr);
 
-	phy_shutdown(priv->phydev);
+	if (!priv->ncsi_mode)
+		phy_shutdown(priv->phydev);
 }
 
 static int ftgmac100_start(struct udevice *dev)
@@ -513,6 +517,7 @@ static int ftgmac100_ofdata_to_platdata(struct udevice *dev)
 	pdata->iobase = devfdt_get_addr(dev);
 	pdata->phy_interface = -1;
 	phy_mode = dev_read_string(dev, "phy-mode");
+
 	if (phy_mode)
 		pdata->phy_interface = phy_get_interface_by_name(phy_mode);
 	if (pdata->phy_interface == -1) {
@@ -537,8 +542,13 @@ static int ftgmac100_probe(struct udevice *dev)
 {
 	struct eth_pdata *pdata = dev_get_platdata(dev);
 	struct ftgmac100_data *priv = dev_get_priv(dev);
+	const char *phy_mode;
 	int ret;
 
+	phy_mode = dev_read_string(dev, "phy-mode");
+	priv->ncsi_mode = dev_read_bool(dev, "use-ncsi") ||
+		(phy_mode && strcmp(phy_mode, "NC-SI") == 0);
+
 	priv->iobase = (struct ftgmac100 *)pdata->iobase;
 	priv->phy_mode = pdata->phy_interface;
 	priv->max_speed = pdata->max_speed;
@@ -548,10 +558,15 @@ static int ftgmac100_probe(struct udevice *dev)
 	if (ret)
 		goto out;
 
-	ret = ftgmac100_mdio_init(dev);
-	if (ret) {
-		dev_err(dev, "Failed to initialize mdiobus: %d\n", ret);
-		goto out;
+	if (priv->ncsi_mode) {
+		printf("%s - NCSI detected\n", __func__);
+	} else {
+		ret = ftgmac100_mdio_init(dev);
+		if (ret) {
+			dev_err(dev, "Failed to initialize mdiobus: %d\n", ret);
+			goto out;
+		}
+
 	}
 
 	ret = ftgmac100_phy_init(dev);
@@ -571,9 +586,13 @@ static int ftgmac100_remove(struct udevice *dev)
 {
 	struct ftgmac100_data *priv = dev_get_priv(dev);
 
-	free(priv->phydev);
-	mdio_unregister(priv->bus);
-	mdio_free(priv->bus);
+	if (!priv->ncsi_mode) {
+		free(priv->phydev);
+		mdio_unregister(priv->bus);
+		mdio_free(priv->bus);
+	} else {
+		free(priv->phydev);
+	}
 	clk_release_bulk(&priv->clks);
 
 	return 0;
-- 
2.21.0

