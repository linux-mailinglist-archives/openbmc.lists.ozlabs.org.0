Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA51A6C002
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 17:36:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7Pj0N8Fz3cK4
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 03:36:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742574998;
	cv=none; b=OOx7WIa7knwsYNkRBGJ9/dQpT15W5CGiGp29eFPtqSqElX3R6HoCO522TN/HjBXJU0mPJaJ5ikqlSEvww/fVhP4ycxjYhpTx8JKUoL0kyuCWIlbkg+oHgGH+X4qgW0977hzDpHq5zfenzJif5DxitgjR+LGiF5b2nNFeyo6F0b8N7CuJQTl9sT5htGC7Q4duG34PmO6nPYn2UpM4qV8gBHwQbJJeoFNksRLs8qUsocaS09DTwZgEyUPc1tGphuW8/EgimHCvh0eQv8lBMKKlgVx/XY/Efx3zvGuQuKb73xnm9rkTZFH0Uy3S/6VCY1eZaftVlmZdyQ85cUDMd4dlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742574998; c=relaxed/relaxed;
	bh=X3ZsUCboUWiiA4bCuxSnz/hejCnEGamuorGomu7OJHk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=bywrr5x+Dm6HW8edvvBtAWgxv8zF5/ay65ww97lTzRCHF6GKFYqCwU8+Ui+TEo9PQjxIbXqp06001iHOfO/ekoi5b+Lod/9OcHwRpktuzm/gAR3BzDDsKYFXEmL5Ai6DTUlw97t1+WgmzUoP8VJYasPkLbabWvC+6Cih9wIdNWqsKyj30atsGo0uIiVTAdUjDiCqbfGJHFWf6d6uiKljw9z0/z8nZHpxJHC23F07jhPS+VgpMNcB3qbVO+4ZsC7RQwNE76OILdX7o4l9I7JuAlgaf/3WeaHf0hkg6tu4UgyHt646AJZ1VwNnViHZof6bf1OYimzU+Hf4PnB5AWr8AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=eHyReLle; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=eHyReLle;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK7Pd24wlz2yft
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 03:36:37 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2194A8287960
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ccx_lV7CuGNd for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:30:22 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8B41F8287F15
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:22 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8B41F8287F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742574622; bh=X3ZsUCboUWiiA4bCuxSnz/hejCnEGamuorGomu7OJHk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=eHyReLleODkBz+rs28SWgP5CIvAiocVQOG5REgm6jsQMrZ5UaVj0mF2iukzJHzJL5
	 SH2hWiPMZTBXcuX08S0MEQlA0sGSt13oOamPWJiYr/ADUwXY/msMjG6D+z6HNyLbIO
	 wbnSMXx2sXHC1CluG9IncxOfq2WkGstYOFMWo3SY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Hkes91vgkEEH for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:30:22 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6B51B8287E9C
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:30:22 -0500 (CDT)
Date: Fri, 21 Mar 2025 11:30:22 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <1874125483.19587856.1742574622381.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 3/4] net: phy: marvell 88e151x: Allow board-level override
 of
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Index: MkUZhBk7PvUiyBJYuFxmBTM3DlAwWQ==
Thread-Topic: marvell 88e151x: Allow board-level override of
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

 LED configuration

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/net/phy/marvell.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 345d3a65104..896e67c8043 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -412,12 +412,8 @@ static int m88e1518_config(struct phy_device *phydev)
 }
 
 /* Marvell 88E1510 */
-static int m88e1510_config(struct phy_device *phydev)
+int __weak m88e1510_led_config(struct phy_device *phydev)
 {
-	/* Select page 3 */
-	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_88E1118_PHY_PAGE,
-		  MIIM_88E1118_PHY_LED_PAGE);
-
 	/* Enable INTn output on LED[2] */
 	m88e1518_phy_writebits(phydev, MIIM_88E151x_LED_TIMER_CTRL,
 			       MIIM_88E151x_INT_EN_OFFS, 1, 1);
@@ -432,9 +428,26 @@ static int m88e1510_config(struct phy_device *phydev)
 			       MIIM_88E151x_LED1_OFFS, MIIM_88E151x_LED_FLD_SZ,
 			       MIIM_88E151x_LED1_100_1000_LINK);
 
+	return 0;
+}
+
+static int m88e1510_config(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Select page 3 */
+	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_88E1118_PHY_PAGE,
+		  MIIM_88E1118_PHY_LED_PAGE);
+
+	/* Configure LEDs */
+	ret = m88e1510_led_config(phydev);
+
 	/* Reset page selection */
 	phy_write(phydev, MDIO_DEVAD_NONE, MIIM_88E1118_PHY_PAGE, 0);
 
+	if (ret)
+		return ret;
+
 	return m88e1518_config(phydev);
 }
 
-- 
2.39.5
