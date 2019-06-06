Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4F36B30
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 06:53:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KCvw55x2zDqgS
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:53:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="IGtYkGR1"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="L1pBtnqG"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KCrp6fjhzDqf1
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 14:50:18 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B5556221F9;
 Thu,  6 Jun 2019 00:50:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Jun 2019 00:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=wFAn+qFuDoz4MSlCXGphjce6sQayOAqKAew4nc01p2E=; b=IGtYk
 GR1s6Tk8PCotIy9l1Og0+6fn3zV1/+W2dpt2iTKQM4146l/xMOknI1c/ZpIMZG00
 0Dl5FDSTrgR+hwRXnykY+A4hjUbdHuBufvcdDlQA+uBcHvBAcjnRxGl/FC/SwgsX
 ZWoj+uMFiWdUVdCuKNYPA9qQ4Kk8y487JD3/rxRx7XXmJfn/nvs/Qqm4LcdkgX5O
 2Q7ThLFfFYhtQNA9DfDWp5Orr7w6dCYGNcSxA3V8nF3xJeEhehF89gNItc4PbBqO
 Yvoq6aOT5EgsQGFIlCzn4vW22aSMPkEufvSozNddnYJP3nFfcd82ou6VlGF3WyoZ
 YgwP892BBVTdj7sFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wFAn+qFuDoz4MSlCXGphjce6sQayOAqKAew4nc01p2E=; b=L1pBtnqG
 yCe9qrSNNgEzDSJngnjZeJC3viXvxLfmlNaNASvLaM6V37/ctXasq/8m4Dv+PQ3Q
 PJwYOtVJbkNogbG8Jw9M99MhxQ78msvCFVYxH5g4pYkBndr6/wzXz9CrCvY0D/8X
 idBVSHZFjxvRFRlFvP7UePYNguX0s5Vl/f2mdc0ywb7exspzkR/wjILPOvfUEONL
 Oxl47J/KRiLMv5K88T7ddYByQriDfguoJHY+//Q5KDMZRPJOfcOWD0GnPMYXLtQ7
 tfYzqzRYUKSP/CFU82HX+peuluz/IyqKDLtARyLAATO0Zr8MynY1d87LYOacAd3h
 PkmEZRYzBnXkDQ==
X-ME-Sender: <xms:iJv4XFQdQGB_bggutV4cpADTqdvt55KaqOPAAF1EcpG_H4inHMCAhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:iJv4XNQynFb3PxAT8Gzpk1UQ6OlCzhMy6nQbgFmhLLDzcD77czAURw>
 <xmx:iJv4XBo4mF_beKpY-qOhV0Bo2H7rpGs5ogkYw4uMv3bcoRijWFApeQ>
 <xmx:iJv4XNCKlYtvtdMtYVRFQHP64UAdHFPBGiqQLZNZswOOFfjwblIs0g>
 <xmx:iJv4XB5dLUDciQWl-s8uuE1ukVvrY265yar5rrR6X559uW2l34WDdw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A843380073;
 Thu,  6 Jun 2019 00:50:13 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH 3/4] net/ftgmac100: Add NC-SI mode support
Date: Thu,  6 Jun 2019 14:49:49 +1000
Message-Id: <20190606044950.5930-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606044950.5930-1-sam@mendozajonas.com>
References: <20190606044950.5930-1-sam@mendozajonas.com>
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

