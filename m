Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E335B2C50
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 04:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP10B35dWz3blb
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 12:58:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHOQAp0c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bHOQAp0c;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP0zp02q5z2xbK
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 12:58:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662692294; x=1694228294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I9n+WM9Wx9T7J9l3ZjPpBz81L1+PfNaApAGPvBNmItY=;
  b=bHOQAp0cmYsGO8PkCwXrTarjgmFtr+8SnHMJJKVt9A0G96nIpgJTCUY1
   aNd0Th8rY7xVWPMwQmTtV4Q63oXSzYsU5FgS5J+1LjG2eLvF6GCKWTV1I
   /8Inu8W3HnlekWBs0tuXqxMTc3qXbmu3E6VuacrSxO1r+v+m1tSdrLrTI
   S54VYWtbPG7vID8mSadCz5sNOX3Xvbhk+d1nqmQb3YPF12YVC/dtn4I/F
   kIzvQE1PMjMB8SQ0dWapeIhK38ecujff1zBGCzzUofAajpZbTVeD/Ze/L
   vkVyRc8mxw0zVZ811RFNzGzadxRniqHsyO8lJHektQGWW6UKL3VRUVTuw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359107400"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="359107400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 19:57:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="645360094"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com) ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 19:57:50 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Date: Fri,  9 Sep 2022 10:57:17 +0800
Message-Id: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Intel OS2BMC OEM NCSI command is used for controlling whether
network traffic between host and sideband is allowed or not. By
default such traffic is disallowed, meaning that if the device using
NCS (usually BMC) does not have extra active connection, it cannot
reach the host.

This patch enables the host-sideband traffic by sending the Enable
OS2BMC flow OEM NCSI command, which is controlled by kernel option
CONFIG_NCSI_OEM_CMD_INTEL_OS2BMC.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 net/ncsi/Kconfig       |  6 ++++++
 net/ncsi/internal.h    |  4 ++++
 net/ncsi/ncsi-manage.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
index ea1dd32b6b1f..faeddbd48fe9 100644
--- a/net/ncsi/Kconfig
+++ b/net/ncsi/Kconfig
@@ -23,3 +23,9 @@ config NCSI_OEM_CMD_KEEP_PHY
 	help
 	  This allows to keep PHY link up and prevents any channel resets during
 	  the host load.
+config NCSI_OEM_CMD_INTEL_OS2BMC
+	bool "Allow traffic between host and sideband (Intel-specific)"
+	depends on NET_NCSI
+	help
+	  This allows network traffic between host and sideband, specific to
+	  Intel network controllers.
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 03757e76bb6b..d730f435d136 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -82,6 +82,8 @@ enum {
 /* Intel specific OEM command */
 #define NCSI_OEM_INTEL_CMD_GMA          0x06   /* CMD ID for Get MAC */
 #define NCSI_OEM_INTEL_CMD_KEEP_PHY     0x20   /* CMD ID for Keep PHY up */
+#define NCSI_OEM_INTEL_CMD_OS2BMC	0x40   /* CMD ID for Enable OS2BMC traffic */
+#define NCSI_OEM_INTEL_CMD_OS2BMC_PARAM	0x03   /* Parameter for Enable OS2BMC */
 /* Broadcom specific OEM Command */
 #define NCSI_OEM_BCM_CMD_GMA            0x01   /* CMD ID for Get MAC */
 /* Mellanox specific OEM Command */
@@ -92,6 +94,7 @@ enum {
 /* OEM Command payload lengths*/
 #define NCSI_OEM_INTEL_CMD_GMA_LEN      5
 #define NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN 7
+#define NCSI_OEM_INTEL_CMD_OS2BMC_LEN   6
 #define NCSI_OEM_BCM_CMD_GMA_LEN        12
 #define NCSI_OEM_MLX_CMD_GMA_LEN        8
 #define NCSI_OEM_MLX_CMD_SMAF_LEN        60
@@ -285,6 +288,7 @@ enum {
 	ncsi_dev_state_probe_dp,
 	ncsi_dev_state_config_sp	= 0x0301,
 	ncsi_dev_state_config_cis,
+	ncsi_dev_state_config_intel_os2bmc,
 	ncsi_dev_state_config_oem_gma,
 	ncsi_dev_state_config_clear_vids,
 	ncsi_dev_state_config_svf,
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 80713febfac6..d8b9fcedf7ec 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -718,6 +718,34 @@ static int ncsi_oem_keep_phy_intel(struct ncsi_cmd_arg *nca)
 
 #endif
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_INTEL_OS2BMC)
+
+static int ncsi_oem_enable_os2bmc_intel(struct ncsi_cmd_arg *nca)
+{
+	unsigned char data[NCSI_OEM_INTEL_CMD_OS2BMC_LEN];
+	int ret = 0;
+
+	nca->payload = NCSI_OEM_INTEL_CMD_OS2BMC_LEN;
+
+	memset(data, 0, NCSI_OEM_INTEL_CMD_OS2BMC_LEN);
+	*(unsigned int *)data = ntohl((__force __be32)NCSI_OEM_MFR_INTEL_ID);
+	data[4] = NCSI_OEM_INTEL_CMD_OS2BMC;
+
+	/* Enable both Network-to-BMC and Host-to-BMC traffic */
+	data[5] = NCSI_OEM_INTEL_CMD_OS2BMC_PARAM;
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
@@ -1039,6 +1067,20 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		}
 
+#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_INTEL_OS2BMC)
+		nd->state = ncsi_dev_state_config_intel_os2bmc;
+		break;
+	case ncsi_dev_state_config_intel_os2bmc:
+		nca.type = NCSI_PKT_CMD_OEM;
+		nca.package = np->id;
+		nca.channel = nc->id;
+		ndp->pending_req_num = 1;
+		ret = ncsi_oem_enable_os2bmc_intel(&nca);
+
+		if (ret)
+			goto error;
+#endif /* CONFIG_NCSI_OEM_CMD_INTEL_OS2BMC */
+
 		nd->state = ncsi_dev_state_config_oem_gma;
 		break;
 	case ncsi_dev_state_config_oem_gma:
-- 
2.34.1

