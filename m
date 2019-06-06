Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6836B2B
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 06:52:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KCv74px1zDqgn
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:52:19 +1000 (AEST)
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
 header.b="RgVS8GOL"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E/8ARIdm"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KCrm1DYyzDqf1
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 14:50:16 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EA7862213A;
 Thu,  6 Jun 2019 00:50:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Jun 2019 00:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=IWpdLjUzvoRnVVXjHpowZ4+f3XTXwLw24SEBMuioU4o=; b=RgVS8
 GOLL2mmPhmyKmCRgS/fU2ekgWDxzNOhDFlJpH45Nz3/H+4YNXhFLW0h3k/uEPwqG
 H7ytoM/8WoU/rgfkkSY98r9UVQ2vM1YR7Hv9bTZBJTspKi4S0wkvstI4TC47/Szc
 EETffXvpPwjzujYnIE/+dnar398gIKdUqlRlz2qvBhPn05Llql9sLig19Wz6aOEQ
 VEu4fmc9T3cGRCjP1X9F4LrPASLet4vxrMDAwlYcJgwIM2VoaxlPt2s1yWQTnqdO
 7+HNoK7PutcnO2qpcAXo09dtKBwC60q6RMWTkBxL4JBspkLfOHV4OlyfLtolfAT1
 I2KZ7tPWY8+eEk8Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IWpdLjUzvoRnVVXjHpowZ4+f3XTXwLw24SEBMuioU4o=; b=E/8ARIdm
 PJsFmsjZx7HYSrWE+4W3lrMy34p9au4YVMP6DilxHvbFEVRRHhLUgWSr5zAPl6jh
 sFuTfCdY2xiN8rKhtpL9rDssIPBe3TX/dTx10Rp3Sa5BCIg+idoLa7FD4kZ+Ngjw
 sGj+jnFC44qxSE2u+S9BRvNHsXsS+e28nsZwn7ouprNBTQHn0GJl/wJUywHliEUc
 wiVX+s5r6+FQafLIDo9rStd0EPdzU1Q4KgQpG8eXnweAlas4jIptSWX5BOKW3DSJ
 kDpLyaWH64ygwacz2x098e80UYjtuZBMdFqXhpOUiPZ8Kg3Sp/Uf/EgV3yRPU8/X
 g4qNsfLTaBe9oA==
X-ME-Sender: <xms:hZv4XNmQVlxCxDQpsc380GIDxzEPwkTnuor5vbcQqBtxn5xKRWp4DA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:hZv4XHSfzaAcTYA3n3eeHfJJCgqpcGMexxC-oQNg9KA0Co8iE8su6w>
 <xmx:hZv4XGandOi34hw23U6DUFANWzmYivPMqVOI2IKL7hqEcIaK6ZTvWg>
 <xmx:hZv4XCawj-VGAWe1ZxxNop1ITBpZxfgN7FxLtPyZx19H-f2v4-W-Pw>
 <xmx:hZv4XAsFM2xophLSOsGx_P1ylh687NltI5UQkNjKhCCxgYa1ozv6nw>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4334F380073;
 Thu,  6 Jun 2019 00:50:11 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH 2/4] phy: Include NC-SI in phy setup
Date: Thu,  6 Jun 2019 14:49:48 +1000
Message-Id: <20190606044950.5930-3-sam@mendozajonas.com>
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

Add NC-SI to the usual phy handling. This makes two notable changes:
- Somewhat similar to a fixed phy, phy_connect() will create an NC-SI
phy if CONFIG_PHY_NCSI is defined.
- An early return is added to phy_read() and phy_write() to handle a
case like the NC-SI phy which does not define a bus.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/phy/phy.c   |  8 ++++++++
 include/phy.h           | 11 +++++++++++
 include/phy_interface.h |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index cda4caa803..c2bc57c45d 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -527,6 +527,9 @@ int phy_init(void)
 #endif
 #ifdef CONFIG_PHY_FIXED
 	phy_fixed_init();
+#endif
+#ifdef CONFIG_PHY_NCSI
+	phy_ncsi_init();
 #endif
 	return 0;
 }
@@ -902,6 +905,11 @@ struct phy_device *phy_connect(struct mii_dev *bus, int addr,
 		sn = fdt_next_subnode(gd->fdt_blob, sn);
 	}
 #endif
+
+#ifdef CONFIG_PHY_NCSI
+	phydev = phy_device_create(bus, 0, PHY_NCSI_ID, interface);
+#endif
+
 	if (!phydev)
 		phydev = phy_find_by_mask(bus, 1 << addr, interface);
 
diff --git a/include/phy.h b/include/phy.h
index f0c9df46c6..e1d546a81f 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -154,6 +154,11 @@ static inline int phy_read(struct phy_device *phydev, int devad, int regnum)
 {
 	struct mii_dev *bus = phydev->bus;
 
+	if (!bus || !bus->read) {
+		debug("%s: No bus configured\n", __func__);
+		return -1;
+	}
+
 	return bus->read(bus, phydev->addr, devad, regnum);
 }
 
@@ -162,6 +167,11 @@ static inline int phy_write(struct phy_device *phydev, int devad, int regnum,
 {
 	struct mii_dev *bus = phydev->bus;
 
+	if (!bus || !bus->read) {
+		debug("%s: No bus configured\n", __func__);
+		return -1;
+	}
+
 	return bus->write(bus, phydev->addr, devad, regnum, val);
 }
 
@@ -241,6 +251,7 @@ int phy_vitesse_init(void);
 int phy_xilinx_init(void);
 int phy_mscc_init(void);
 int phy_fixed_init(void);
+int phy_ncsi_init(void);
 
 int board_phy_config(struct phy_device *phydev);
 int get_phy_id(struct mii_dev *bus, int addr, int devad, u32 *phy_id);
diff --git a/include/phy_interface.h b/include/phy_interface.h
index c6823189f8..9e334bb47d 100644
--- a/include/phy_interface.h
+++ b/include/phy_interface.h
@@ -31,6 +31,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_XLAUI,
 	PHY_INTERFACE_MODE_CAUI2,
 	PHY_INTERFACE_MODE_CAUI4,
+	PHY_INTERFACE_MODE_NCSI,
 	PHY_INTERFACE_MODE_NONE,	/* Must be last */
 
 	PHY_INTERFACE_MODE_COUNT,
@@ -58,6 +59,7 @@ static const char * const phy_interface_strings[] = {
 	[PHY_INTERFACE_MODE_XLAUI]		= "xlaui4",
 	[PHY_INTERFACE_MODE_CAUI2]		= "caui2",
 	[PHY_INTERFACE_MODE_CAUI4]		= "caui4",
+	[PHY_INTERFACE_MODE_NCSI]		= "NC-SI",
 	[PHY_INTERFACE_MODE_NONE]		= "",
 };
 
-- 
2.21.0

