Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B147546B3C
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 19:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKS5h2cVqz3bwg
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 03:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LKtZEpJ6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LKtZEpJ6;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKS3g38T2z2xZR
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 03:03:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654880639; x=1686416639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2DHPKG6LELctv9GPHh5MdlgXeZF+xfpjUKtxgbPNOI=;
  b=LKtZEpJ64QCoZdbWCorC8DNOkxW+txUFjSqj4BtIeNw1iQK2Z0ni5iMV
   iJRSGHpI0qz6JdL3BiVItmBqRhFMVACUywALzvCnAPXhxOCbUHGkXpspi
   tKgQtC/STMryWigsvqHuYUWgZXpDsnqml4tg7TaRGsJXf/bkCO6sQAhRV
   uNx0cCGUC1KDn9gyARA72fvuTWOOr5xqVKrCltVcCmkE/xlpKhXd3l/+N
   Fi8273be3OguiE3tlaTCQBwTTLH9hXKfmmTD/qUEH87nd9IuG8+5QwtQ7
   QkSHCDt+O7vFbvdmfyYXS6U0Jv1sSTEvxwA0fgetC/Ot/cxsHruosMNkW
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341743822"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341743822"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:03:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="638218765"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:03:57 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/6] net/ncsi: Rename NCSI_CAP_VLAN_NO to NCSI_CAP_VLAN_FILTERED
Date: Sat, 11 Jun 2022 00:59:36 +0800
Message-Id: <20220610165940.2326777-3-jiaqing.zhao@linux.intel.com>
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

The NCSI_CAP_VLAN_NO actually stands for the "VLAN + non-VLAN" mode
defined in NCSI spec, which accepts both VLAN-tagged packets that match
the enabled VLAN filter settings and non-VLAN-tagged packets. It would
be more clear to rename it to NCSI_CAP_VLAN_FILTERED.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 net/ncsi/internal.h    | 2 +-
 net/ncsi/ncsi-manage.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index bc4a00e41695..7f384f841019 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -46,7 +46,7 @@ enum {
 	NCSI_CAP_AEN_HDS                 = 0x04, /* HNC driver status        */
 	NCSI_CAP_AEN_MASK                = 0x07,
 	NCSI_CAP_VLAN_ONLY               = 0x01, /* Filter VLAN packet only  */
-	NCSI_CAP_VLAN_NO                 = 0x02, /* Filter VLAN and non-VLAN */
+	NCSI_CAP_VLAN_FILTERED           = 0x02, /* Filter VLAN and non-VLAN */
 	NCSI_CAP_VLAN_ANY                = 0x03, /* Filter Any-and-non-VLAN  */
 	NCSI_CAP_VLAN_MASK               = 0x07
 };
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 78814417d753..a8f7a2ff52a0 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1098,7 +1098,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 				nca.type = NCSI_PKT_CMD_DV;
 			} else {
 				nca.type = NCSI_PKT_CMD_EV;
-				nca.bytes[3] = NCSI_CAP_VLAN_NO;
+				nca.bytes[3] = NCSI_CAP_VLAN_FILTERED;
 			}
 			nd->state = ncsi_dev_state_config_sma;
 		} else if (nd->state == ncsi_dev_state_config_sma) {
-- 
2.34.1

