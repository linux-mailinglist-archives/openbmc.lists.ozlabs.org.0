Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A5733A09
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 21:37:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YZCRedIq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTvl4wSqz2ys1
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 05:37:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YZCRedIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjTtS3lT2z3bvn
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 05:36:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686944192; x=1718480192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJbvj9LAj1LSk3t+saD6otwmBUaaVW7m0HH928GdHjY=;
  b=YZCRedIqFGZY3Xu2l/kuCcldRIhl6ANcezWpzrcReP52RBQNJ2eOLxxO
   gLOYoCAlrICs1Uzk6Naum2NqbzSuqN/1c13z6GDlJDoQu76cG5ur5gOnr
   siBAFbNiz0ZUfKNeSpJqQQ1MqrT+9rf6ItAohcpCL2vUFtZfmv5sbHZIG
   4j9mNgOQeS/kC4Mn2Ly6Od3pIh3ErueA/UBOndXQU+mKYDM3cbO78iK1p
   k5jXcfGOI7UPjan+etdprpAmTT+Q6hhlwgcH36O+X8RwOGKX6J4x6hIDu
   RVIHOTulR5fipsvWxKHJWmcmY+okgU2JZ6uIcbpFkrYJ1rNaAwz04crop
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="356788748"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="356788748"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="802945199"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="802945199"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO localhost) ([10.249.144.95])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:35:26 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	Tomer Maimon <tmaimon77@gmail.com>,
	kfting <warp5tw@gmail.com>
Subject: [RFT PATCH 1/4] dt-bindings: Add bindings for peci-npcm
Date: Fri, 16 Jun 2023 21:34:47 +0200
Message-Id: <20230616193450.413366-2-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616193450.413366-1-iwona.winiarska@intel.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
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
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tomer Maimon <tmaimon77@gmail.com>

Add device tree bindings for the peci-npcm controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: kfting <warp5tw@gmail.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 .../devicetree/bindings/peci/peci-npcm.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
new file mode 100644
index 000000000000..6eafa9ccaa54
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton PECI Bus
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: peci-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-peci
+      - nuvoton,npcm845-peci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      Clock source for PECI controller. Should reference the APB clock.
+    maxItems: 1
+
+  cmd-timeout-ms:
+    minimum: 1
+    maximum: 1000
+    default: 1000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    peci-controller@f0100000 {
+      compatible = "nuvoton,npcm750-peci";
+      reg = <0xf0100000 0x200>;
+      interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk NPCM7XX_CLK_APB3>;
+      cmd-timeout-ms = <1000>;
+    };
+...
-- 
2.40.1

