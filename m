Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F1546B45
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 19:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKS6n4kLlz3c1g
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 03:06:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbCVM6s0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbCVM6s0;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKS3j41Lyz3bxY
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 03:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654880641; x=1686416641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nS9jBzEdJm76RP0LAjTlMRfAbVC9/X57Mw2W3mH7Yrc=;
  b=mbCVM6s0CgSVpeZXWapyxg+BzDLeoHOSAdGkxL9Q5R1Pq7x6nLOBMSVw
   qwBbYlLiZrYpOQcQaBGE9MmrPuYek/4lc0ru7GcZFJa2sJMqKsRX1+Uyh
   SM+u02mA/ALJLRdg+uitlgtkJP1N0T1tqu7TF/VAbdO8vP0jqU8+/qdgL
   P5W8ITrG8RJuxqsMIRXnb1yT1ere8tGy24flL1kqSGOiwrzQLhyoFncU5
   7D864K180D56kp9LqCudVVR+Qzwhk9JRIMz2SaJhZvYRXP519Cfnb6h02
   LACjBNCQYjEac2vib4gnX9IrZ6ETiY/nPwYkyxU2rnH+H0jIRGAA/dBF/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341743832"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341743832"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:04:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="638218788"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 10:03:59 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/6] net/ncsi: Enable VLAN filtering when callback is registered
Date: Sat, 11 Jun 2022 00:59:37 +0800
Message-Id: <20220610165940.2326777-4-jiaqing.zhao@linux.intel.com>
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

Sets NETIF_F_HW_VLAN_CTAG_FILTER flag to enable hardware VLAN filtering
of NCSI when the ndo_vlan_rx_{add,kill}_vid callbacks are registered to
the NCSI handlers. Previously it was done in the mac driver, this patch
puts it to the NCSI drvier to make it more general.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 net/ncsi/ncsi-manage.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index a8f7a2ff52a0..3fb95f29e3e2 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1807,6 +1807,11 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 			ndp->mlx_multi_host = true;
 	}
 
+	/* Enable hardware VLAN filtering */
+	if (dev->netdev_ops->ndo_vlan_rx_add_vid == ncsi_vlan_rx_add_vid &&
+	    dev->netdev_ops->ndo_vlan_rx_kill_vid == ncsi_vlan_rx_kill_vid)
+		dev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	return nd;
 }
 EXPORT_SYMBOL_GPL(ncsi_register_dev);
-- 
2.34.1

