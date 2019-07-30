Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A479D5E
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:32:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yHZr5Kg6zDqQS
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 10:32:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3114af11f6=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="IsLkuTDz"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yHYF00d7zDqPS
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 10:31:25 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6U0NM8u000480
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 17:31:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=iczxuLQA64H3q/ACTwH6WMkfTp6P5uAhLFBn9cH6w5c=;
 b=IsLkuTDzhlWCgP3qNKMuvQFclbLhc2H24MhAqwOXupDGEmk2lO/s8Nr6z6aFtJepxB5E
 R1ZCdg90s6pXWc78ocRF2hhXd1b3dE4la2yyMCXaJvmJObuGnqELULxBP/7hihoOuYLt
 0FCQnDJ/N/r211YsQQarkTZEXu+Dhja6MpE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u27a1gv7r-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 17:31:20 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 29 Jul 2019 17:31:17 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id 772F5184F3660; Mon, 29 Jul 2019 17:25:51 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net-next 2/2] net: phy: broadcom: add 1000Base-X support for
 BCM54616S
Date: Mon, 29 Jul 2019 17:25:49 -0700
Message-ID: <20190730002549.86824-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=692 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300001
X-FB-Internal: deliver
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Configure the BCM54616S for 1000Base-X mode when "brcm-phy-mode-1000bx"
is set in device tree. This is needed when the PHY is used for fiber and
backplane connections.

The patch is inspired by commit cd9af3dac6d1 ("PHYLIB: Add 1000Base-X
support for Broadcom bcm5482").

Signed-off-by: Tao Ren <taoren@fb.com>
---
 drivers/net/phy/broadcom.c | 58 +++++++++++++++++++++++++++++++++++---
 include/linux/brcmphy.h    |  4 +--
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 2b4e41a9d35a..6c22ac3a844b 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -383,9 +383,9 @@ static int bcm5482_config_init(struct phy_device *phydev)
 		/*
 		 * Select 1000BASE-X register set (primary SerDes)
 		 */
-		reg = bcm_phy_read_shadow(phydev, BCM5482_SHD_MODE);
-		bcm_phy_write_shadow(phydev, BCM5482_SHD_MODE,
-				     reg | BCM5482_SHD_MODE_1000BX);
+		reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
+		bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
+				     reg | BCM54XX_SHD_MODE_1000BX);
 
 		/*
 		 * LED1=ACTIVITYLED, LED3=LINKSPD[2]
@@ -451,6 +451,34 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
 	return ret;
 }
 
+static int bcm54616s_config_init(struct phy_device *phydev)
+{
+	int err, reg;
+	struct device_node *np = phydev->mdio.dev.of_node;
+
+	err = bcm54xx_config_init(phydev);
+
+	if (of_property_read_bool(np, "brcm-phy-mode-1000bx")) {
+		/* Select 1000BASE-X register set. */
+		reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
+		bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
+				     reg | BCM54XX_SHD_MODE_1000BX);
+
+		/* Auto-negotiation doesn't seem to work quite right
+		 * in this mode, so we disable it and force it to the
+		 * right speed/duplex setting.  Only 'link status'
+		 * is important.
+		 */
+		phydev->autoneg = AUTONEG_DISABLE;
+		phydev->speed = SPEED_1000;
+		phydev->duplex = DUPLEX_FULL;
+
+		phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
+	}
+
+	return err;
+}
+
 static int bcm54616s_config_aneg(struct phy_device *phydev)
 {
 	int ret;
@@ -464,6 +492,27 @@ static int bcm54616s_config_aneg(struct phy_device *phydev)
 	return ret;
 }
 
+static int bcm54616s_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_read_status(phydev);
+	if (ret < 0)
+		return ret;
+
+	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX) {
+		/* Only link status matters for 1000Base-X mode, so force
+		 * 1000 Mbit/s full-duplex status.
+		 */
+		if (phydev->link) {
+			phydev->speed = SPEED_1000;
+			phydev->duplex = DUPLEX_FULL;
+		}
+	}
+
+	return 0;
+}
+
 static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
 {
 	int val;
@@ -651,8 +700,9 @@ static struct phy_driver broadcom_drivers[] = {
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "Broadcom BCM54616S",
 	.features       = PHY_GBIT_FEATURES,
-	.config_init	= bcm54xx_config_init,
+	.config_init	= bcm54616s_config_init,
 	.config_aneg	= bcm54616s_config_aneg,
+	.read_status	= bcm54616s_read_status,
 	.ack_interrupt	= bcm_phy_ack_intr,
 	.config_intr	= bcm_phy_config_intr,
 }, {
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index 6db2d9a6e503..82030155558c 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -200,8 +200,8 @@
 #define BCM5482_SHD_SSD		0x14	/* 10100: Secondary SerDes control */
 #define BCM5482_SHD_SSD_LEDM	0x0008	/* SSD LED Mode enable */
 #define BCM5482_SHD_SSD_EN	0x0001	/* SSD enable */
-#define BCM5482_SHD_MODE	0x1f	/* 11111: Mode Control Register */
-#define BCM5482_SHD_MODE_1000BX	0x0001	/* Enable 1000BASE-X registers */
+#define BCM54XX_SHD_MODE	0x1f	/* 11111: Mode Control Register */
+#define BCM54XX_SHD_MODE_1000BX	0x0001	/* Enable 1000BASE-X registers */
 
 
 /*
-- 
2.17.1

