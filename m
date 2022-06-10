Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D215546B78
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 19:08:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKS8x0NWJz3bxt
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 03:08:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpcUxeLQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpcUxeLQ;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKS3q3k1yz3bmS
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 03:04:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654880647; x=1686416647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cedDuWJ1o5WzrQ7/mFOQkYqmkZRy7tIGsqftIplAouU=;
  b=VpcUxeLQ5LpYj62E60WzafhOsHpdVhP1SBOU7eEAR1hhS64I+eTE8KY+
   DOU/4Nbp5dn5l5t1kQ5PKlKPADs0pMmFeBVJzHivo2MakAYeAqUZ+0pTJ
   P3KIuuFCedeXlTNgVz418QO/qhHMzUZ3tt14Mns4BC6UuZZm65YBXrt3s
   37KaN9geptjbbtRP/DCd9iQ2B36tF3TVkv2k3VI0hOvjVBJGiAfcV/ytn
   Cru+gDYkPqFXJPR5ApGqD0EiScb0QulEUybapVA7G+fRlA3DcBmuQ4HsF
   +xNaKlA5T0w1XoO47zXMzf+D7W2koQD9+BuzuPmcdrVmRzcYgLna5wpNi
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341743861"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341743861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:04:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="638218818"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:04:05 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 6/6] net/ncsi: Support VLAN mode configuration
Date: Sat, 11 Jun 2022 00:59:40 +0800
Message-Id: <20220610165940.2326777-7-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

NCSI specification defines 4 VLAN modes, currently kernel NCSI driver
only supports the "VLAN + non-VLAN" mode (Mode #2), and there is no
way to detect which modes are supported by the device. This patch adds
support for configuring VLAN mode via the "ncsi,vlan-mode" devicetree
node.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 41 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 7f384f841019..6a988c898a8d 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -334,6 +334,7 @@ struct ncsi_dev_priv {
 	struct work_struct  work;            /* For channel management     */
 	struct packet_type  ptype;           /* NCSI packet Rx handler     */
 	struct list_head    node;            /* Form NCSI device list      */
+	u32                 vlan_mode;       /* VLAN mode                  */
 #define NCSI_MAX_VLAN_VIDS	15
 	struct list_head    vlan_vids;       /* List of active VLAN IDs */
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 3fb95f29e3e2..a398b0eb72b2 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -10,6 +10,7 @@
 #include <linux/skbuff.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <dt-bindings/net/ncsi.h>
 
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
@@ -1042,7 +1043,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		nd->state = ncsi_dev_state_config_oem_gma;
 		break;
 	case ncsi_dev_state_config_oem_gma:
-		nd->state = ncsi_dev_state_config_clear_vids;
+		/* Only set up hardware VLAN filters in filtered mode */
+		if (ndp->vlan_mode == NCSI_VLAN_MODE_FILTERED)
+			nd->state = ncsi_dev_state_config_clear_vids;
+		else
+			nd->state = ncsi_dev_state_config_ev;
 		ret = -1;
 
 #if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
@@ -1094,11 +1099,15 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			nd->state = ncsi_dev_state_config_svf;
 		/* Enable/Disable the VLAN filter */
 		} else if (nd->state == ncsi_dev_state_config_ev) {
-			if (list_empty(&ndp->vlan_vids)) {
-				nca.type = NCSI_PKT_CMD_DV;
-			} else {
+			if (ndp->vlan_mode == NCSI_VLAN_MODE_FILTERED &&
+			    !list_empty(&ndp->vlan_vids)) {
 				nca.type = NCSI_PKT_CMD_EV;
 				nca.bytes[3] = NCSI_CAP_VLAN_FILTERED;
+			} else if (ndp->vlan_mode == NCSI_VLAN_MODE_ANY) {
+				nca.type = NCSI_PKT_CMD_EV;
+				nca.bytes[3] = NCSI_CAP_VLAN_ANY;
+			} else {
+				nca.type = NCSI_PKT_CMD_DV;
 			}
 			nd->state = ncsi_dev_state_config_sma;
 		} else if (nd->state == ncsi_dev_state_config_sma) {
@@ -1800,15 +1809,33 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	ndp->ptype.dev = dev;
 	dev_add_pack(&ndp->ptype);
 
+	/* Set default VLAN mode (filtered) */
+	ndp->vlan_mode = NCSI_VLAN_MODE_FILTERED;
+
 	pdev = to_platform_device(dev->dev.parent);
 	if (pdev) {
 		np = pdev->dev.of_node;
-		if (np && of_get_property(np, "mlx,multi-host", NULL))
-			ndp->mlx_multi_host = true;
+		if (np) {
+			u32 vlan_mode;
+
+			if (!of_property_read_u32(np, "ncsi,vlan-mode", &vlan_mode)) {
+				if (vlan_mode > NCSI_VLAN_MODE_ANY ||
+				    vlan_mode == NCSI_VLAN_MODE_ONLY)
+					dev_warn(&pdev->dev, "NCSI: Unsupported VLAN mode %u",
+						 vlan_mode);
+				else
+					ndp->vlan_mode = vlan_mode;
+				dev_info(&pdev->dev, "NCSI: Configured VLAN mode %u",
+					 ndp->vlan_mode);
+			}
+			if (of_get_property(np, "mlx,multi-host", NULL))
+				ndp->mlx_multi_host = true;
+		}
 	}
 
 	/* Enable hardware VLAN filtering */
-	if (dev->netdev_ops->ndo_vlan_rx_add_vid == ncsi_vlan_rx_add_vid &&
+	if (ndp->vlan_mode == NCSI_VLAN_MODE_FILTERED &&
+	    dev->netdev_ops->ndo_vlan_rx_add_vid == ncsi_vlan_rx_add_vid &&
 	    dev->netdev_ops->ndo_vlan_rx_kill_vid == ncsi_vlan_rx_kill_vid)
 		dev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 
-- 
2.34.1

