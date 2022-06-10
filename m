Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A055F546AE6
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKRqf3LBtz2xgx
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 02:53:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KbWkwsVv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KbWkwsVv;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKRlp58Svz3bsq
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 02:50:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654879814; x=1686415814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xfml1NwpVsO1qKFhuV1kEyknIGEvUDk3GH8dIhLg1z4=;
  b=KbWkwsVvHudEVSMV3hfUfZUmWDpErcynL/6oTDLRkCi9tJIs1B7O1ZqI
   5gRxsYEGFDYyYHP8sMM191Z8dN6l7QYmMlCFUjOVLTvONVPlahJqV+Amg
   BQVpBFd/hjEzWVyAEptR/etGzH6mxscGQrmyvGR6v/C4zM+vM4fosmD5O
   /UFiEG8QKT5wR1qR/ZxTgCaFE28HBV1cMqYF1yV20L4/0gk5pq3geco39
   UgtHbaOg0C6nFWemPPKl0aC+Yz+Ds/URtRtqi48h2qLz04LCHuqe/3R4w
   iZxfng0851/IDjT1h9ADXbO68nlMVRaU3pTlUzpW7+OnxT5XGSHRIfWyw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341739959"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341739959"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="760587734"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:49:59 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 5/6] dt-bindings: net: Add NCSI bindings
Date: Sat, 11 Jun 2022 00:48:07 +0800
Message-Id: <20220610164808.2323340-6-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610164808.2323340-1-jiaqing.zhao@linux.intel.com>
References: <20220610164808.2323340-1-jiaqing.zhao@linux.intel.com>
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

Add devicetree bindings for NCSI VLAN modes. This allows VLAN mode to
be configured in devicetree.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../devicetree/bindings/net/ncsi.yaml         | 34 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 include/dt-bindings/net/ncsi.h                | 15 ++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
 create mode 100644 include/dt-bindings/net/ncsi.h

diff --git a/Documentation/devicetree/bindings/net/ncsi.yaml b/Documentation/devicetree/bindings/net/ncsi.yaml
new file mode 100644
index 000000000000..ec76ae9a77a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ncsi.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ncsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Network Controller Sideband Interface (NCSI)
+
+maintainers:
+  - Samuel Mendoza-Jonas <sam@mendozajonas.com>
+
+description: |
+  Bindings for the Network Controller Sideband Interface (NCSI) driver
+
+properties:
+  ncsi,vlan-mode:
+    description: VLAN mode used on the NCSI device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+examples:
+  - |
+    #include <dt-bindings/net/ncsi.h>
+
+    mac0: ethernet@1e660000 {
+      compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+      reg = <0x1e660000 0x180>;
+      status = "okay";
+
+      use-ncsi;
+      ncsi,vlan-mode = <NCSI_VLAN_MODE_ANY>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f468864fd268..199e4b5bceab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13534,6 +13534,8 @@ F:	drivers/scsi/sun3_scsi_vme.c
 NCSI LIBRARY
 M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/ncsi.yaml
+F:	include/dt-bindings/net/ncsi.h
 F:	net/ncsi/
 
 NCT6775 HARDWARE MONITOR DRIVER
diff --git a/include/dt-bindings/net/ncsi.h b/include/dt-bindings/net/ncsi.h
new file mode 100644
index 000000000000..19eb9a5db08b
--- /dev/null
+++ b/include/dt-bindings/net/ncsi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Device Tree constants for NCSI
+ */
+
+#ifndef _DT_BINDINGS_NCSI_H
+#define _DT_BINDINGS_NCSI_H
+
+/* VLAN Modes */
+#define NCSI_VLAN_MODE_DISABLED	0
+#define NCSI_VLAN_MODE_ONLY	1
+#define NCSI_VLAN_MODE_FILTERED	2
+#define NCSI_VLAN_MODE_ANY	3
+
+#endif
-- 
2.34.1

