Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CD894EB
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 01:44:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466FvW6KgCzDqg8
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 09:44:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=31263c8021=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MnTE4eRS"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Frk0ghJzDqdv
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 09:42:21 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7BNdrvO009876
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 16:42:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=1NH0L+QucuD5bSOkrvafcLhzAgbTVBXkB9rIOE7m9cc=;
 b=MnTE4eRSaEN1ythMa0/R5pYjl+6RKLD8ENeZhuuAPIpg3Ely9YJRh1UFYfFwFkQUavKy
 CMUtWJbEqwbAnANTldvMoyn9u/8UEMjUGaqHl5ggpogjKkuy06/O9Ztvx304zAmJ0fWO
 40ZtGWu6LcYPUs2X8xs/Wr8tVbavwWuC+Vo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uau4b07gv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 16:42:17 -0700
Received: from mx-out.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 11 Aug 2019 16:42:17 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
 id 2FD1E7BE8C4; Sun, 11 Aug 2019 16:40:17 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm1794.vll1.facebook.com
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: vll1c12
Subject: [PATCH net-next v7 3/3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
Date: Sun, 11 Aug 2019 16:40:16 -0700
Message-ID: <20190811234016.3674056-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=458 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908110264
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

The BCM54616S PHY cannot work properly in RGMII->1000Base-X mode, mainly
because genphy functions are designed for copper links, and 1000Base-X
(clause 37) auto negotiation needs to be handled differently.

This patch enables 1000Base-X support for BCM54616S by customizing 3
driver callbacks, and it's verified to be working on Facebook CMM BMC
platform (RGMII->1000Base-KX):

  - probe: probe callback detects PHY's operation mode based on
    INTERF_SEL[1:0] pins and 1000X/100FX selection bit in SerDES 100-FX
    Control register.

  - config_aneg: calls genphy_c37_config_aneg when the PHY is running in
    1000Base-X mode; otherwise, genphy_config_aneg will be called.

  - read_status: calls genphy_c37_read_status when the PHY is running in
    1000Base-X mode; otherwise, genphy_read_status will be called.

Note: BCM54616S PHY can also be configured in RGMII->100Base-FX mode, and
100Base-FX support is not available as of now.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 Changes in v7:
  - Add comment "BCM54616S 100Base-FX is not supported".
 Changes in v6:
  - nothing changed.
 Changes in v5:
  - include Heiner's patch "net: phy: add support for clause 37
    auto-negotiation" into the series.
  - use genphy_c37_config_aneg and genphy_c37_read_status in BCM54616S
    PHY driver's callback when the PHY is running in 1000Base-X mode.
 Changes in v4:
  - add bcm54616s_config_aneg_1000bx() to deal with auto negotiation in
    1000Base-X mode.
 Changes in v3:
  - rename bcm5482_read_status to bcm54xx_read_status so the callback can
    be shared by BCM5482 and BCM54616S.
 Changes in v2:
  - Auto-detect PHY operation mode instead of passing DT node.
  - move PHY mode auto-detect logic from config_init to probe callback.
  - only set speed (not including duplex) in read_status callback.
  - update patch description with more background to avoid confusion.
  - patch #1 in the series ("net: phy: broadcom: set features explicitly
    for BCM54616") is dropped.

 drivers/net/phy/broadcom.c | 57 +++++++++++++++++++++++++++++++++++---
 include/linux/brcmphy.h    | 10 +++++--
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 937d0059e8ac..5fd9293513d8 100644
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
@@ -451,12 +451,47 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
 	return ret;
 }
 
+static int bcm54616s_probe(struct phy_device *phydev)
+{
+	int val, intf_sel;
+
+	val = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
+	if (val < 0)
+		return val;
+
+	/* The PHY is strapped in RGMII-fiber mode when INTERF_SEL[1:0]
+	 * is 01b, and the link between PHY and its link partner can be
+	 * either 1000Base-X or 100Base-FX.
+	 * RGMII-1000Base-X is properly supported, but RGMII-100Base-FX
+	 * support is still missing as of now.
+	 */
+	intf_sel = (val & BCM54XX_SHD_INTF_SEL_MASK) >> 1;
+	if (intf_sel == 1) {
+		val = bcm_phy_read_shadow(phydev, BCM54616S_SHD_100FX_CTRL);
+		if (val < 0)
+			return val;
+
+		/* Bit 0 of the SerDes 100-FX Control register, when set
+		 * to 1, sets the MII/RGMII -> 100BASE-FX configuration.
+		 * When this bit is set to 0, it sets the GMII/RGMII ->
+		 * 1000BASE-X configuration.
+		 */
+		if (!(val & BCM54616S_100FX_MODE))
+			phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
+	}
+
+	return 0;
+}
+
 static int bcm54616s_config_aneg(struct phy_device *phydev)
 {
 	int ret;
 
 	/* Aneg firsly. */
-	ret = genphy_config_aneg(phydev);
+	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX)
+		ret = genphy_c37_config_aneg(phydev);
+	else
+		ret = genphy_config_aneg(phydev);
 
 	/* Then we can set up the delay. */
 	bcm54xx_config_clock_delay(phydev);
@@ -464,6 +499,18 @@ static int bcm54616s_config_aneg(struct phy_device *phydev)
 	return ret;
 }
 
+static int bcm54616s_read_status(struct phy_device *phydev)
+{
+	int err;
+
+	if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX)
+		err = genphy_c37_read_status(phydev);
+	else
+		err = genphy_read_status(phydev);
+
+	return err;
+}
+
 static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
 {
 	int val;
@@ -655,6 +702,8 @@ static struct phy_driver broadcom_drivers[] = {
 	.config_aneg	= bcm54616s_config_aneg,
 	.ack_interrupt	= bcm_phy_ack_intr,
 	.config_intr	= bcm_phy_config_intr,
+	.read_status	= bcm54616s_read_status,
+	.probe		= bcm54616s_probe,
 }, {
 	.phy_id		= PHY_ID_BCM5464,
 	.phy_id_mask	= 0xfffffff0,
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index 6db2d9a6e503..b475e7f20d28 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -200,9 +200,15 @@
 #define BCM5482_SHD_SSD		0x14	/* 10100: Secondary SerDes control */
 #define BCM5482_SHD_SSD_LEDM	0x0008	/* SSD LED Mode enable */
 #define BCM5482_SHD_SSD_EN	0x0001	/* SSD enable */
-#define BCM5482_SHD_MODE	0x1f	/* 11111: Mode Control Register */
-#define BCM5482_SHD_MODE_1000BX	0x0001	/* Enable 1000BASE-X registers */
 
+/* 10011: SerDes 100-FX Control Register */
+#define BCM54616S_SHD_100FX_CTRL	0x13
+#define	BCM54616S_100FX_MODE		BIT(0)	/* 100-FX SerDes Enable */
+
+/* 11111: Mode Control Register */
+#define BCM54XX_SHD_MODE		0x1f
+#define BCM54XX_SHD_INTF_SEL_MASK	GENMASK(2, 1)	/* INTERF_SEL[1:0] */
+#define BCM54XX_SHD_MODE_1000BX		BIT(0)	/* Enable 1000-X registers */
 
 /*
  * EXPANSION SHADOW ACCESS REGISTERS.  (PHY REG 0x15, 0x16, and 0x17)
-- 
2.17.1

