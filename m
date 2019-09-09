Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DFAE010
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 22:52:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S0hq2kmFzDqRL
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 06:52:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4155b2ef1b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XbDPgO5G"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S0h24LfdzDqNr
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 06:51:27 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x89Knh4B027363
 for <openbmc@lists.ozlabs.org>; Mon, 9 Sep 2019 13:51:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=facebook;
 bh=v3krHUirLIyJTJnRbdHJ6+jKvatjr+IVSoROk4nWTwo=;
 b=XbDPgO5GXGk2f+vbr+ThanDhb9VdE+DnwRzs9oEAkJPGgXlKptA2ED6E9XEtw5Q+E4ow
 xkhif/gp6tABF0RSKydeebEQym7qPd1m1olywTimuHPUIwQZO/n1GLFkIBL8/kU3wNvV
 Ha56GwUyH9LCazhaaH3hxguMwMO4Xvgd/0A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2uv820ha7s-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 13:51:24 -0700
Received: from mx-out.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Sep 2019 13:51:20 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
 id 91B5821AB933; Mon,  9 Sep 2019 13:49:11 -0700 (PDT)
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
Subject: [PATCH net-next v8 2/3] net: phy: add support for clause 37
 auto-negotiation
Date: Mon, 9 Sep 2019 13:49:06 -0700
Message-ID: <20190909204906.2191290-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_07:2019-09-09,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090204
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

From: Heiner Kallweit <hkallweit1@gmail.com>

This patch adds support for clause 37 1000Base-X auto-negotiation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Tao Ren <taoren@fb.com>
Tested-by: Ren=C3=A9 van Dorst <opensource@vdorst.com>
---
 Changes in v8:
  - Rebased the patch on top of net-next HEAD.
 Changes in v7:
  - Update "if (AUTONEG_ENABLE !=3D phydev->autoneg)" to
    "if (phydev->autoneg !=3D AUTONEG_ENABLE)" so checkpatch.pl is happy.
 Changes in v6:
  - add "Signed-off-by: Tao Ren <taoren@fb.com>"
 Changes in v1-v5:
  - nothing changed. It's given v5 just to align with the version of
    patch series.

 drivers/net/phy/phy_device.c | 139 +++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |   4 +
 2 files changed, 143 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 8933f07d39e9..dd05f750bb3f 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1607,6 +1607,40 @@ static int genphy_config_advert(struct phy_device =
*phydev)
 	return changed;
 }
=20
+/**
+ * genphy_c37_config_advert - sanitize and advertise auto-negotiation pa=
rameters
+ * @phydev: target phy_device struct
+ *
+ * Description: Writes MII_ADVERTISE with the appropriate values,
+ *   after sanitizing the values to make sure we only advertise
+ *   what is supported.  Returns < 0 on error, 0 if the PHY's advertisem=
ent
+ *   hasn't changed, and > 0 if it has changed. This function is intende=
d
+ *   for Clause 37 1000Base-X mode.
+ */
+static int genphy_c37_config_advert(struct phy_device *phydev)
+{
+	u16 adv =3D 0;
+
+	/* Only allow advertising what this PHY supports */
+	linkmode_and(phydev->advertising, phydev->advertising,
+		     phydev->supported);
+
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
+			      phydev->advertising))
+		adv |=3D ADVERTISE_1000XFULL;
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Pause_BIT,
+			      phydev->advertising))
+		adv |=3D ADVERTISE_1000XPAUSE;
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+			      phydev->advertising))
+		adv |=3D ADVERTISE_1000XPSE_ASYM;
+
+	return phy_modify_changed(phydev, MII_ADVERTISE,
+				  ADVERTISE_1000XFULL | ADVERTISE_1000XPAUSE |
+				  ADVERTISE_1000XHALF | ADVERTISE_1000XPSE_ASYM,
+				  adv);
+}
+
 /**
  * genphy_config_eee_advert - disable unwanted eee mode advertisement
  * @phydev: target phy_device struct
@@ -1715,6 +1749,54 @@ int __genphy_config_aneg(struct phy_device *phydev=
, bool changed)
 }
 EXPORT_SYMBOL(__genphy_config_aneg);
=20
+/**
+ * genphy_c37_config_aneg - restart auto-negotiation or write BMCR
+ * @phydev: target phy_device struct
+ *
+ * Description: If auto-negotiation is enabled, we configure the
+ *   advertising, and then restart auto-negotiation.  If it is not
+ *   enabled, then we write the BMCR. This function is intended
+ *   for use with Clause 37 1000Base-X mode.
+ */
+int genphy_c37_config_aneg(struct phy_device *phydev)
+{
+	int err, changed;
+
+	if (phydev->autoneg !=3D AUTONEG_ENABLE)
+		return genphy_setup_forced(phydev);
+
+	err =3D phy_modify(phydev, MII_BMCR, BMCR_SPEED1000 | BMCR_SPEED100,
+			 BMCR_SPEED1000);
+	if (err)
+		return err;
+
+	changed =3D genphy_c37_config_advert(phydev);
+	if (changed < 0) /* error */
+		return changed;
+
+	if (!changed) {
+		/* Advertisement hasn't changed, but maybe aneg was never on to
+		 * begin with?  Or maybe phy was isolated?
+		 */
+		int ctl =3D phy_read(phydev, MII_BMCR);
+
+		if (ctl < 0)
+			return ctl;
+
+		if (!(ctl & BMCR_ANENABLE) || (ctl & BMCR_ISOLATE))
+			changed =3D 1; /* do restart aneg */
+	}
+
+	/* Only restart aneg if we are advertising something different
+	 * than we were before.
+	 */
+	if (changed > 0)
+		return genphy_restart_aneg(phydev);
+
+	return 0;
+}
+EXPORT_SYMBOL(genphy_c37_config_aneg);
+
 /**
  * genphy_aneg_done - return auto-negotiation status
  * @phydev: target phy_device struct
@@ -1862,6 +1944,63 @@ int genphy_read_status(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(genphy_read_status);
=20
+/**
+ * genphy_c37_read_status - check the link status and update current lin=
k state
+ * @phydev: target phy_device struct
+ *
+ * Description: Check the link, then figure out the current state
+ *   by comparing what we advertise with what the link partner
+ *   advertises. This function is for Clause 37 1000Base-X mode.
+ */
+int genphy_c37_read_status(struct phy_device *phydev)
+{
+	int lpa, err, old_link =3D phydev->link;
+
+	/* Update the link, but return if there was an error */
+	err =3D genphy_update_link(phydev);
+	if (err)
+		return err;
+
+	/* why bother the PHY if nothing can have changed */
+	if (phydev->autoneg =3D=3D AUTONEG_ENABLE && old_link && phydev->link)
+		return 0;
+
+	phydev->duplex =3D DUPLEX_UNKNOWN;
+	phydev->pause =3D 0;
+	phydev->asym_pause =3D 0;
+
+	if (phydev->autoneg =3D=3D AUTONEG_ENABLE && phydev->autoneg_complete) =
{
+		lpa =3D phy_read(phydev, MII_LPA);
+		if (lpa < 0)
+			return lpa;
+
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+				 phydev->lp_advertising, lpa & LPA_LPACK);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
+				 phydev->lp_advertising, lpa & LPA_1000XFULL);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
+				 phydev->lp_advertising, lpa & LPA_1000XPAUSE);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+				 phydev->lp_advertising,
+				 lpa & LPA_1000XPAUSE_ASYM);
+
+		phy_resolve_aneg_linkmode(phydev);
+	} else if (phydev->autoneg =3D=3D AUTONEG_DISABLE) {
+		int bmcr =3D phy_read(phydev, MII_BMCR);
+
+		if (bmcr < 0)
+			return bmcr;
+
+		if (bmcr & BMCR_FULLDPLX)
+			phydev->duplex =3D DUPLEX_FULL;
+		else
+			phydev->duplex =3D DUPLEX_HALF;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(genphy_c37_read_status);
+
 /**
  * genphy_soft_reset - software reset the PHY via BMCR_RESET bit
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a7ecbe0e55aa..cd9786ccf630 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1104,6 +1104,10 @@ int genphy_read_mmd_unsupported(struct phy_device =
*phdev, int devad,
 int genphy_write_mmd_unsupported(struct phy_device *phdev, int devnum,
 				 u16 regnum, u16 val);
=20
+/* Clause 37 */
+int genphy_c37_config_aneg(struct phy_device *phydev);
+int genphy_c37_read_status(struct phy_device *phydev);
+
 /* Clause 45 PHY */
 int genphy_c45_restart_aneg(struct phy_device *phydev);
 int genphy_c45_check_and_restart_aneg(struct phy_device *phydev, bool re=
start);
--=20
2.17.1

