Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE3546AE0
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKRm73fXKz3c81
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 02:50:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQIEldzS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQIEldzS;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKRlk3tYkz3bnT
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 02:50:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654879810; x=1686415810;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ASHUK70l3jcIuhh1boRG1NOD4kHVjzcknTDu0uZ1whM=;
  b=HQIEldzSRsTnwsd6Pgtz370eKbYQjH0YozVL4gXkmxQ2UG8l0zXwUz3S
   2BA/TUKBwbbyJdD38QC6OfNiWGKh4yRWM386NBvi4MEr5tZyI317Boeu0
   yJ3GtN5zbFpVGo4SWR9zbAWGslNXXhVz1TIyI/ImmfNDpeQyBhHxtZtgG
   5wEtBNzlIT22QvQ49xH1Vt4wKaF54h2GaaFaI23QQNnKgrebfKfGiEAne
   uX/ZACFA1v+1duHYoHnnraJPpSU3t8mfuY43bDrHvY5iFkaZJlJ2sxVF/
   lFSlb2xBZU3II2K06t/clEP50Esh40xfkmBQ8ufQoHOw1RFAp5BKlfOz9
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341739911"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341739911"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:49:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="760587687"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:49:48 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/6] Configurable VLAN mode for NCSI driver
Date: Sat, 11 Jun 2022 00:48:02 +0800
Message-Id: <20220610164808.2323340-1-jiaqing.zhao@linux.intel.com>
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently kernel kernel NCSI driver only supports the "VLAN + non-VLAN"
mode (Mode #2), but this mode is an optional mode [1] defined in NCSI
specification and some NCSI devices like Intel E810 Network Adapter [2]
does not support that mode. This patchset adds a new "ncsi,vlan-mode"
device tree property for configuring the VLAN mode of NCSI device.

[1] Table 58 - VLAN Enable Modes
    https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf
[2] 12.6.5.4.3 VLAN
    https://cdrdv2.intel.com/v1/dl/getContent/613875

Jiaqing Zhao (6):
  net/ncsi: Fix value of NCSI_CAP_VLAN_ANY
  net/ncsi: Rename NCSI_CAP_VLAN_NO to NCSI_CAP_VLAN_FILTERED
  net/ncsi: Enable VLAN filtering when callback is registered
  ftgmac100: Remove enable NCSI VLAN filtering
  dt-bindings: net: Add NCSI bindings
  net/ncsi: Support VLAN mode configuration

 .../devicetree/bindings/net/ncsi.yaml         | 34 ++++++++++++++
 MAINTAINERS                                   |  2 +
 drivers/net/ethernet/faraday/ftgmac100.c      |  3 --
 include/dt-bindings/net/ncsi.h                | 15 ++++++
 net/ncsi/internal.h                           |  5 +-
 net/ncsi/ncsi-manage.c                        | 46 ++++++++++++++++---
 6 files changed, 93 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
 create mode 100644 include/dt-bindings/net/ncsi.h

-- 
2.34.1

