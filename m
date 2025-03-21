Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E84AAA6C007
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 17:37:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7Pp0Yyhz3fQq
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 03:36:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742574998;
	cv=none; b=SjynM4R2mediXrTrZcUQcZzBpI9bTish/Sv23vGYz1Nt4iHf/BIadOs1H+MQe96xVRXpZwpmApmzQ9KmsNrmINrc9S1ePx7O2EwTjwHhChDoK5OsrIYpxZ2gv+AJWoe1nHCZLevsojf1TMJmM7THGfbLQwVLjDLmjbqJztHAqfdGNq1Wsa2dbJavbk9N68cYJwq/RJ3WxlyK5XS4DvaipT1bvwvvaP5bsBZZ82wfd1jkNx3y6GQ15+b+CXBu9H87Ek+XAB8reJm4KA3S48n2YFm1zTBh/Y3zonb8XAfbAhHLXBl4m3L7oIjBLuIbf0NShhiKKo0XlsUd68Ymn944/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742574998; c=relaxed/relaxed;
	bh=b0rJIz8mWF0HYH/Y6kJCCRP68Q4SGM9+5wuvq5kctzI=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=GPGhvyRur6pWBqOtfqu3XnAfpPiJvHil5y93MzElCIOQzcSqgMMSuDRir7c+9NUDIoFeYUNt0nm+Q+DOvFL7Y3Dx00GIX/WZXaWotBNci6H7QAnR6YKyA2u1KovGiixa+brv4gn/L+PW7lkW5nhDT0Cznuxpx3QWrFhasscOucpUhBKNUGwa7LbMHS8pTmB4FucPP0u4z0mmgICmhRnAjFp46xdJfYHzuMoNAppuU/bDiIOCA2gxtdm7PWn+8miRsnQcvxT+BtKNwEUBCiZaxsLajbZfAPSH6iW3VLjVAvVRypSOd0dY0OKvpK2yiaxhJPtfhIM0ZqKowCmuhwQPCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=CNQ4Pt5H; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=CNQ4Pt5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK7Pf190Wz3093
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 03:36:37 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E2E5282888F7
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lWve2xJVQyd5 for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:30:05 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 53A6982888FE
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:05 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 53A6982888FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742574605; bh=b0rJIz8mWF0HYH/Y6kJCCRP68Q4SGM9+5wuvq5kctzI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=CNQ4Pt5HxNLhkfoS9U4hgcKynzIT6WAbWhN0f2kByXGoSq+8qRaR2A0DGUO4ViZdz
	 h2f74IBb5ZNPxulzFYxh3uXJGhjiiDHvbX5RM0CZmY+FegQs7UWZHMlPFWSOaKjRMl
	 Hcw5yj2I5M170sDuqesxdy7NTLc+OXj4JaIn6EQw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FG4eqU-NW23W for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:30:05 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 795A682888F7
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:04 -0500 (CDT)
Date: Fri, 21 Mar 2025 11:30:04 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Index: lb4WNfqyAgIo6yiBXDgErDA7glxcHA==
Thread-Topic: marvell: Allow targets to skip MII RX/TX errata
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

 application

Upstream-Status: Pending
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/net/phy/Kconfig   |  8 ++++++++
 drivers/net/phy/marvell.c | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index f6dde8af1ce..c79883e4172 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -112,6 +112,14 @@ config PHY_LXT
 config PHY_MARVELL
 	bool "Marvell Ethernet PHYs support"
 
+if PHY_MARVELL
+
+config PHY_MARVELL_APPLY_MII_RXTX_ERRATA
+	bool
+	default n
+
+endif # PHY_MARVELL
+
 config PHY_MESON_GXL
 	bool "Amlogic Meson GXL Internal PHY support"
 
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index efbbd31ff71..345d3a65104 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -379,7 +379,15 @@ static int m88e1518_config(struct phy_device *phydev)
 		phy_write(phydev, MDIO_DEVAD_NONE, MII_MARVELL_PHY_PAGE, 2);
 
 		reg = phy_read(phydev, MDIO_DEVAD_NONE, MIIM_88E151x_PHY_MSCR);
+
 		reg &= ~MIIM_88E151x_RGMII_RXTX_DELAY;
+
+		/* Per the vendor, certain Marvell devices will not function if
+		 * the RGMII TX/RX delay registers are modified.  If an
+		 * affected design has been selected, do not write the
+		 * RX/TX delay registers.
+		 */
+#if !defined(CONFIG_PHY_MARVELL_APPLY_MII_RXTX_ERRATA)
 		if (phydev->interface == PHY_INTERFACE_MODE_RGMII ||
 		    phydev->interface == PHY_INTERFACE_MODE_RGMII_ID)
 			reg |= MIIM_88E151x_RGMII_RXTX_DELAY;
@@ -387,6 +395,8 @@ static int m88e1518_config(struct phy_device *phydev)
 			reg |= MIIM_88E151x_RGMII_RX_DELAY;
 		else if (phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID)
 			reg |= MIIM_88E151x_RGMII_TX_DELAY;
+#endif
+
 		phy_write(phydev, MDIO_DEVAD_NONE, MIIM_88E151x_PHY_MSCR, reg);
 
 		phy_write(phydev, MDIO_DEVAD_NONE, MII_MARVELL_PHY_PAGE, 0);
-- 
2.39.5
