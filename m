Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E688135014
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 00:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tQpB0jPxzDqWp
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 10:44:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=82764e2140=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=fXO/fr2F; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tQnM3fqVzDqJC
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 10:43:59 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008Ne15j002216
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 15:43:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=zkItAPuRvdWqFuaSnwRuHhLzPQYy7zZHZf8Q96gL7lk=;
 b=fXO/fr2Fk6lJdW063UYHcS2fk0Sucm5g8imiw4RfqRGqFV3+wntp/Okulh6Q1Ff0Hp83
 Z1pup1Om5n0dLKoCeJtVzjXh7SgL92iWgsMgdAJkeCWCEc0poWNmBouHtlw01jt6upFP
 p6TE0UwW3o114qxaE5T+hDTGutyZX+kERUg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xd5auwsjv-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 15:43:55 -0800
Received: from intmgw002.06.prn3.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Wed, 8 Jan 2020 15:43:53 -0800
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id 4AC391985925A; Wed,  8 Jan 2020 15:43:52 -0800 (PST)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [net-next PATCH] net/ncsi: Support for multi host mellanox card
Date: Wed, 8 Jan 2020 15:43:40 -0800
Message-ID: <20200108234341.2590674-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_07:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080186
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
Cc: openbmc@lists.ozlabs.org, vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Multi host Mellanox cards require MAC affinity to be set
before receiving any config commands. All config commands
should also have unicast address for source address in
command header.

Adding GMA and SMAF(Set Mac Affinity) for Mellanox card
and call these in channel probe state machine if it is
defined in device tree.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 net/ncsi/internal.h    | 20 ++++++++++++
 net/ncsi/ncsi-manage.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index ad3fd7f1da75..e37102546be6 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -64,6 +64,17 @@ enum {
 	NCSI_MODE_MAX
 };
 
+/* Supported media status bits for Mellanox Mac affinity command.
+ * Bit (0-2) for different protocol support; Bit 1 for RBT support,
+ * bit 1 for SMBUS support and bit 2 for PCIE support. Bit (3-5)
+ * for different protocol availability. Bit 4 for RBT, bit 4 for
+ * SMBUS and bit 5 for PCIE.
+ */
+enum {
+	MLX_MC_RBT_SUPPORT  = 0x01, /* MC supports RBT         */
+	MLX_MC_RBT_AVL      = 0x08, /* RBT medium is available */
+};
+
 /* OEM Vendor Manufacture ID */
 #define NCSI_OEM_MFR_MLX_ID             0x8119
 #define NCSI_OEM_MFR_BCM_ID             0x113d
@@ -72,9 +83,15 @@ enum {
 /* Mellanox specific OEM Command */
 #define NCSI_OEM_MLX_CMD_GMA            0x00   /* CMD ID for Get MAC */
 #define NCSI_OEM_MLX_CMD_GMA_PARAM      0x1b   /* Parameter for GMA  */
+#define NCSI_OEM_MLX_CMD_SMAF           0x01   /* CMD ID for Set MC Affinity */
+#define NCSI_OEM_MLX_CMD_SMAF_PARAM     0x07   /* Parameter for SMAF         */
 /* OEM Command payload lengths*/
 #define NCSI_OEM_BCM_CMD_GMA_LEN        12
 #define NCSI_OEM_MLX_CMD_GMA_LEN        8
+#define NCSI_OEM_MLX_CMD_SMAF_LEN        60
+/* Offset in OEM request */
+#define MLX_SMAF_MAC_ADDR_OFFSET         8     /* Offset for MAC in SMAF    */
+#define MLX_SMAF_MED_SUPPORT_OFFSET      14    /* Offset for medium in SMAF */
 /* Mac address offset in OEM response */
 #define BCM_MAC_ADDR_OFFSET             28
 #define MLX_MAC_ADDR_OFFSET             8
@@ -251,6 +268,8 @@ enum {
 	ncsi_dev_state_probe_deselect	= 0x0201,
 	ncsi_dev_state_probe_package,
 	ncsi_dev_state_probe_channel,
+	ncsi_dev_state_probe_mlx_gma,
+	ncsi_dev_state_probe_mlx_smaf,
 	ncsi_dev_state_probe_cis,
 	ncsi_dev_state_probe_gvi,
 	ncsi_dev_state_probe_gc,
@@ -311,6 +330,7 @@ struct ncsi_dev_priv {
 	struct list_head    vlan_vids;       /* List of active VLAN IDs */
 
 	bool                multi_package;   /* Enable multiple packages   */
+	bool                mlx_multi_host;  /* Enable multi host Mellanox */
 	u32                 package_whitelist; /* Packages to configure    */
 };
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index e20b81514029..1f387be7827b 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -8,6 +8,8 @@
 #include <linux/init.h>
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
@@ -730,6 +732,34 @@ static int ncsi_oem_gma_handler_mlx(struct ncsi_cmd_arg *nca)
 	return ret;
 }
 
+static int ncsi_oem_smaf_mlx(struct ncsi_cmd_arg *nca)
+{
+	union {
+		u8 data_u8[NCSI_OEM_MLX_CMD_SMAF_LEN];
+		u32 data_u32[NCSI_OEM_MLX_CMD_SMAF_LEN / sizeof(u32)];
+	} u;
+	int ret = 0;
+
+	memset(&u, 0, sizeof(u));
+	u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
+	u.data_u8[5] = NCSI_OEM_MLX_CMD_SMAF;
+	u.data_u8[6] = NCSI_OEM_MLX_CMD_SMAF_PARAM;
+	memcpy(&u.data_u8[MLX_SMAF_MAC_ADDR_OFFSET],
+	       nca->ndp->ndev.dev->dev_addr,	ETH_ALEN);
+	u.data_u8[MLX_SMAF_MED_SUPPORT_OFFSET] =
+		(MLX_MC_RBT_AVL | MLX_MC_RBT_SUPPORT);
+
+	nca->payload = NCSI_OEM_MLX_CMD_SMAF_LEN;
+	nca->data = u.data_u8;
+
+	ret = ncsi_xmit_cmd(nca);
+	if (ret)
+		netdev_err(nca->ndp->ndev.dev,
+			   "NCSI: Failed to transmit cmd 0x%x during probe\n",
+			   nca->type);
+	return ret;
+}
+
 /* OEM Command handlers initialization */
 static struct ncsi_oem_gma_handler {
 	unsigned int	mfr_id;
@@ -1310,8 +1340,38 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 			break;
 		}
 		nd->state = ncsi_dev_state_probe_cis;
+		if (IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC) &&
+		    ndp->mlx_multi_host)
+			nd->state = ncsi_dev_state_probe_mlx_gma;
+
 		schedule_work(&ndp->work);
 		break;
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+	case ncsi_dev_state_probe_mlx_gma:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_OEM;
+		nca.package = ndp->active_package->id;
+		nca.channel = 0;
+		ret = ncsi_oem_gma_handler_mlx(&nca);
+		if (ret)
+			goto error;
+
+		nd->state = ncsi_dev_state_probe_mlx_smaf;
+		break;
+	case ncsi_dev_state_probe_mlx_smaf:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_OEM;
+		nca.package = ndp->active_package->id;
+		nca.channel = 0;
+		ret = ncsi_oem_smaf_mlx(&nca);
+		if (ret)
+			goto error;
+
+		nd->state = ncsi_dev_state_probe_cis;
+		break;
+#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
 	case ncsi_dev_state_probe_cis:
 		ndp->pending_req_num = NCSI_RESERVED_CHANNEL;
 
@@ -1621,6 +1681,8 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 {
 	struct ncsi_dev_priv *ndp;
 	struct ncsi_dev *nd;
+	struct platform_device *pdev;
+	struct device_node *np;
 	unsigned long flags;
 	int i;
 
@@ -1667,6 +1729,13 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	/* Set up generic netlink interface */
 	ncsi_init_netlink(dev);
 
+	pdev = to_platform_device(dev->dev.parent);
+	if (pdev) {
+		np = pdev->dev.of_node;
+		if (np && of_get_property(np, "mlx,multi-host", NULL))
+			ndp->mlx_multi_host = true;
+	}
+
 	return nd;
 }
 EXPORT_SYMBOL_GPL(ncsi_register_dev);
-- 
2.17.1

