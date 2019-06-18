Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C649702
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 03:40:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SW3t1fSNzDqY0
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 11:40:10 +1000 (AEST)
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
 header.b="PkuOBtps"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AU0nPQo0"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SW1G4fB2zDqVK
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:37:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EE3922200;
 Mon, 17 Jun 2019 21:37:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Jun 2019 21:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=mWuOVU83gG9UX6CL+eRDKj4/r9omUHKpb4qityQf/mM=; b=PkuOB
 tpsNzkTB/81ew7NfF3iPJpLzazoDgH4VVm3LzkTqMnUKOdMlQu1uHLE3wgpPuYw6
 eFos8OxyGd7OTsHyVUIHi3F1HnSDRO7hG2X9UxOkQP2RK+FXcwUgPH/niK3lSdS2
 3QkngTI7odkdYAwJ7QAnhxCVMJgoIevvVKW1qlhJ+WcRvsl1Amf1Z3bmd7xC6LM0
 sB76MTvcCBFcYGy3h3EP+UjWnm6ho6XEBzE1ZDSMatzYmPYXRXg2wSoaHJfC+5uP
 qhD6IjjmBAOTZXo5U0FQVEqVMxaJTcn6WJrBYXG41RH/f8rB1Dt+lFcohfPk7FX9
 wJbGUGl6PeJx3Q0kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mWuOVU83gG9UX6CL+eRDKj4/r9omUHKpb4qityQf/mM=; b=AU0nPQo0
 +im0k6s9/5GPGGaLKjkZ7PIjj7fMdOcd/1fqdiNyBrF5U5MbnxxvKn3IXFwNbjpf
 oPXJwCBeXNQO0rBggVToimOFFnaoHTqwtLWX6pkjQADKIJn09oo36qUqZ3GaTCft
 ZdPeBQrdsBClw4lRd4mKrKGkxyeuCATNVTbQYeOYcv4NSeat8YaCas/uR3v1ofzx
 bYf1cw6eWbMtcZhAzjFsYKDtVqnfvWvuygM6rtEA2OhYL7Br/vTO8d/kf6RcIOLL
 4hEDXcao1s2Ko6LvCnoWO/yBd9oEmQXWa/9AuRncPJUOUn/qJncHzImGhZR0Cfd5
 YZV1l7KK1mCzzQ==
X-ME-Sender: <xms:cEAIXbwjT8TZ_JHNR_GXAfJXfbtFd_vGHLMjOu9hJxJI8IS_4tln_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeikedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cEAIXV3_0NulIhrG2kivpdArGX4mUhT24MUsDcK75oLkQukb4jtt6Q>
 <xmx:cEAIXY8dRPRRN0pSUJDNgyCQuSn6dY5lhyujYt55lzCegozQ6cm-Sg>
 <xmx:cEAIXVrF74KVg5reFA0q2op1IA2WAIdvCGHJ5LuiX2zkkujW6YzB1Q>
 <xmx:cEAIXcBLQFcSVofarv4A7sVvhRRC3udMLAB1Ev4nYR7ftmojAuzJBg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C12B380086;
 Mon, 17 Jun 2019 21:37:49 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH v2 2/4] phy: Include NC-SI in phy setup
Date: Tue, 18 Jun 2019 11:37:18 +1000
Message-Id: <20190618013720.2823-3-sam@mendozajonas.com>
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

Add NC-SI to the usual phy handling. This makes two notable changes:
- Somewhat similar to a fixed phy, phy_connect() will create an NC-SI
phy if CONFIG_PHY_NCSI is defined.
- An early return is added to phy_read() and phy_write() to handle a
case like the NC-SI phy which does not define a bus.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/phy/phy.c   |  7 +++++++
 include/phy.h           | 11 +++++++++++
 include/phy_interface.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index c1c1af9abd..dc68f25ebf 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -539,6 +539,9 @@ int phy_init(void)
 #endif
 #ifdef CONFIG_PHY_FIXED
 	phy_fixed_init();
+#endif
+#ifdef CONFIG_PHY_NCSI
+	phy_ncsi_init();
 #endif
 	return 0;
 }
@@ -947,6 +950,10 @@ struct phy_device *phy_connect(struct mii_dev *bus, int addr,
 	phydev = phy_connect_fixed(bus, dev, interface);
 #endif
 
+#ifdef CONFIG_PHY_NCSI
+	phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
+#endif
+
 	if (!phydev)
 		phydev = phy_find_by_mask(bus, mask, interface);
 
diff --git a/include/phy.h b/include/phy.h
index 297fc7a78e..56bd146e2c 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -163,6 +163,11 @@ static inline int phy_read(struct phy_device *phydev, int devad, int regnum)
 {
 	struct mii_dev *bus = phydev->bus;
 
+	if (!bus || !bus->read) {
+		debug("%s: No bus configured\n", __func__);
+		return -1;
+	}
+
 	return bus->read(bus, phydev->addr, devad, regnum);
 }
 
@@ -171,6 +176,11 @@ static inline int phy_write(struct phy_device *phydev, int devad, int regnum,
 {
 	struct mii_dev *bus = phydev->bus;
 
+	if (!bus || !bus->read) {
+		debug("%s: No bus configured\n", __func__);
+		return -1;
+	}
+
 	return bus->write(bus, phydev->addr, devad, regnum, val);
 }
 
@@ -312,6 +322,7 @@ int phy_vitesse_init(void);
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

