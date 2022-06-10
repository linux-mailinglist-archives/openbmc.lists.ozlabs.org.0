Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0614546B46
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 19:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKS7V6Jg1z3bwg
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 03:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E8+XksOL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E8+XksOL;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKS3l4Dmwz3c8B
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 03:04:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654880643; x=1686416643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tfHmXri7R6Bw+I2ET1tz+X8i7YZFY1rCt76KxR+OC/A=;
  b=E8+XksOLWlMBV7it16pnT3lfGkhiLJzTA0sXlmoe6IbyJW18uRY3GiLQ
   VKfMygUSLOpuqB74uJN9Xtoo5k61T9QUJaqovReElhUYosVjeWHHxCFEu
   vy1guNDdtSmcqtCMKXuXj+3l51dBkdPd2dl2XSS7uB8NF4Woh9m3Ch6oU
   yGgK5TwKXGp6FEkfH7wJLO6J/4TyreDZnKkYfIn6kEfh8TR2o70grVHo5
   0s0MV/T6MSbkZ9B7+nfTLxrg5D2az5PPDXvSZxKxRSnbEnbs05LZGO4Id
   Zim/e4+XUsJu9/2/uwdjp55j1iYRDR239MahDUqk5nviCNqEPdYn/XgIy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341743846"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341743846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:04:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="638218799"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:04:01 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/6] ftgmac100: Remove enable NCSI VLAN filtering
Date: Sat, 11 Jun 2022 00:59:38 +0800
Message-Id: <20220610165940.2326777-5-jiaqing.zhao@linux.intel.com>
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

Setting NETIF_F_HW_VLAN_CTAG_FILTER flag to enable NCSI VLAN filtering
has been moved to the NCSI driver, the logic in ftgmac100 driver is no
longer needed.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 5231818943c6..18821ca38795 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1922,9 +1922,6 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
 		NETIF_F_HW_VLAN_CTAG_TX;
 
-	if (priv->use_ncsi)
-		netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-
 	/* AST2400  doesn't have working HW checksum generation */
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
 		netdev->hw_features &= ~NETIF_F_HW_CSUM;
-- 
2.34.1

