Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F13BFA2D
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 14:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLFvq1YSmz3blT
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 22:28:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=CQBBR579;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=CQBBR579; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLFtk5NRRz2ymZ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 22:27:58 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7EB9449E11;
 Thu,  8 Jul 2021 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1625747274; x=1627561675; bh=PATKhG49byGh1Oih+WEKzcbwTbnhEk52nCK
 2584o3es=; b=CQBBR579oEnvD3pDvoojX0JNgXdGTqEzbifG3RyQDQ5RLjjdC+P
 IIjToeEqJUz6dWMJ521GgVolVSAFpppIXRpALu8qSEWcbe8GweSEMrvij2GOUoDY
 NXNTm5sENeyVjI1A25NQ8Fwbq2C7IGvQHI2qJA9Bu0naErvM1nN8Muhw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ged8blyKIZ79; Thu,  8 Jul 2021 15:27:54 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 10C0649F4D;
 Thu,  8 Jul 2021 15:18:27 +0300 (MSK)
Received: from fedora.mshome.net (10.199.0.196) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Jul
 2021 15:18:25 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 2/3] net/ncsi: add NCSI Intel OEM command to keep PHY up
Date: Thu, 8 Jul 2021 15:27:53 +0300
Message-ID: <20210708122754.555846-3-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708122754.555846-1-i.mikhaylov@yadro.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.196]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This allows to keep PHY link up and prevents any channel resets during
the host load.

It is KEEP_PHY_LINK_UP option(Veto bit) in i210 datasheet which
block PHY reset and power state changes.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 net/ncsi/Kconfig       |  6 ++++++
 net/ncsi/internal.h    |  5 +++++
 net/ncsi/ncsi-manage.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
index 93309081f5a4..ea1dd32b6b1f 100644
--- a/net/ncsi/Kconfig
+++ b/net/ncsi/Kconfig
@@ -17,3 +17,9 @@ config NCSI_OEM_CMD_GET_MAC
 	help
 	  This allows to get MAC address from NCSI firmware and set them back to
 		controller.
+config NCSI_OEM_CMD_KEEP_PHY
+	bool "Keep PHY Link up"
+	depends on NET_NCSI
+	help
+	  This allows to keep PHY link up and prevents any channel resets during
+	  the host load.
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index cbbb0de4750a..0b6cfd3b31e0 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -78,6 +78,9 @@ enum {
 /* OEM Vendor Manufacture ID */
 #define NCSI_OEM_MFR_MLX_ID             0x8119
 #define NCSI_OEM_MFR_BCM_ID             0x113d
+#define NCSI_OEM_MFR_INTEL_ID           0x157
+/* Intel specific OEM command */
+#define NCSI_OEM_INTEL_CMD_KEEP_PHY     0x20   /* CMD ID for Keep PHY up */
 /* Broadcom specific OEM Command */
 #define NCSI_OEM_BCM_CMD_GMA            0x01   /* CMD ID for Get MAC */
 /* Mellanox specific OEM Command */
@@ -86,6 +89,7 @@ enum {
 #define NCSI_OEM_MLX_CMD_SMAF           0x01   /* CMD ID for Set MC Affinity */
 #define NCSI_OEM_MLX_CMD_SMAF_PARAM     0x07   /* Parameter for SMAF         */
 /* OEM Command payload lengths*/
+#define NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN 7
 #define NCSI_OEM_BCM_CMD_GMA_LEN        12
 #define NCSI_OEM_MLX_CMD_GMA_LEN        8
 #define NCSI_OEM_MLX_CMD_SMAF_LEN        60
@@ -271,6 +275,7 @@ enum {
 	ncsi_dev_state_probe_mlx_gma,
 	ncsi_dev_state_probe_mlx_smaf,
 	ncsi_dev_state_probe_cis,
+	ncsi_dev_state_probe_keep_phy,
 	ncsi_dev_state_probe_gvi,
 	ncsi_dev_state_probe_gc,
 	ncsi_dev_state_probe_gls,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 42b54a3da2e6..89c7742cd72e 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -689,6 +689,35 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY)
+
+static int ncsi_oem_keep_phy_intel(struct ncsi_cmd_arg *nca)
+{
+	unsigned char data[NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN];
+	int ret = 0;
+
+	nca->payload = NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN;
+
+	memset(data, 0, NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN);
+	*(unsigned int *)data = ntohl((__force __be32)NCSI_OEM_MFR_INTEL_ID);
+
+	data[4] = NCSI_OEM_INTEL_CMD_KEEP_PHY;
+
+	/* PHY Link up attribute */
+	data[6] = 0x1;
+
+	nca->data = data;
+
+	ret = ncsi_xmit_cmd(nca);
+	if (ret)
+		netdev_err(nca->ndp->ndev.dev,
+			   "NCSI: Failed to transmit cmd 0x%x during configure\n",
+			   nca->type);
+	return ret;
+}
+
+#endif
+
 #if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
 
 /* NCSI OEM Command APIs */
@@ -1391,8 +1420,24 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 				goto error;
 		}
 
+		nd->state = ncsi_dev_state_probe_gvi;
+		if (IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY))
+			nd->state = ncsi_dev_state_probe_keep_phy;
+		break;
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY)
+	case ncsi_dev_state_probe_keep_phy:
+		ndp->pending_req_num = 1;
+
+		nca.type = NCSI_PKT_CMD_OEM;
+		nca.package = ndp->active_package->id;
+		nca.channel = 0;
+		ret = ncsi_oem_keep_phy_intel(&nca);
+		if (ret)
+			goto error;
+
 		nd->state = ncsi_dev_state_probe_gvi;
 		break;
+#endif /* CONFIG_NCSI_OEM_CMD_KEEP_PHY */
 	case ncsi_dev_state_probe_gvi:
 	case ncsi_dev_state_probe_gc:
 	case ncsi_dev_state_probe_gls:
-- 
2.31.1

