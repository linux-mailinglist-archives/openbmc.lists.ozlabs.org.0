Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8439763FA0
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 21:30:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZpbM8RMG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB3s461X1z3bc7
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 05:30:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZpbM8RMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB3q60rmvz2yF7
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2023 05:28:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690399730; x=1721935730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fcZpoD7pysu21pr96a3/oNgTjK6roya1B0HquHldxI=;
  b=ZpbM8RMGFA1kbFJWfChm8+moDsQqK217HqVzq6UXmpfbJOcfUkjb04QI
   Dbf7J80IibcC+vyjYwxlYb0SgHy0wUOpP/BGAV8RTEnYdxyCQZr39v3E5
   X+9ZZFA6TPp2+PZkMk3b7tvzjzG6rDsqg808k23E0IFvMf8bASHsdfNJ+
   RzO47cWhHn+5ioBEsWF+xGrYD2Wgxt9M3LyYITOWEpuNf0i3wB2l/Fus6
   f/dwjNPvbRNxo/H5cA2eDwFICVJQO+x1NSJvXsjWQDg32Nws22QBuJsvX
   xkI1rtcugHcxEwYhzepKCIr14KeupcHdWCTPP94tKO7GmLYKMBZ395cF8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358110175"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="358110175"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726661966"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="726661966"
Received: from wfryca-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.133.1])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:28:45 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: Add bindings for peci-npcm
Date: Wed, 26 Jul 2023 21:27:37 +0200
Message-Id: <20230726192740.1383740-2-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726192740.1383740-1-iwona.winiarska@intel.com>
References: <20230726192740.1383740-1-iwona.winiarska@intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Conor Dooley <conor+dt@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tomer Maimon <tmaimon77@gmail.com>

Add device tree bindings for the peci-npcm controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
Changes v1 -> v2:

* Renamed binding filename to match compatible (Krzysztof)
---
 .../bindings/peci/nuvoton,npcm-peci.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml

diff --git a/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml b/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
new file mode 100644
index 000000000000..6eafa9ccaa54
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
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

