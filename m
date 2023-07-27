Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B7765D2E
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 22:24:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n1DWgO79;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBj0c3Fs4z3cPR
	for <lists+openbmc@lfdr.de>; Fri, 28 Jul 2023 06:24:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n1DWgO79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBhzK3BKqz3cPm
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2023 06:23:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690489389; x=1722025389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=syGttct7/MMhyRZ0y8XJZbRtPo5+VsMlS6W5J8vJio8=;
  b=n1DWgO79tergWJoBMuEkIKlXhBY2W+/hbuTMpyLqmHqo0flbCfBFEnEz
   EdS1+XPAZerpdJTb9Yq5E8zz3MkqyE0CkNrmpgRirf0HLycsxXwpNYXJO
   4x9z+miPvV68h0qgRxhB2KxkYOGQLlm2IMW34gg0KYhvRgNBQKOXwES1R
   FB9g9kMkdHnRFGbS3cnC7hBSnlsizDihOCeoQjKzh+JheNYAMjeIsb2Ec
   ykCV/PC2u50u7+u0IadDajxkv0LRf07EyPHXtzwMPAXTAAp2tQWrvKfj5
   WcOipd27leCMb4TbgS8SKFuAPJvsWelkpzIkdMyZILQGqAIkkQ4yadRxo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358441172"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="358441172"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="850915735"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="850915735"
Received: from mtyszka-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.133.203])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:02 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: Add bindings for peci-npcm
Date: Thu, 27 Jul 2023 22:21:23 +0200
Message-Id: <20230727202126.1477515-2-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727202126.1477515-1-iwona.winiarska@intel.com>
References: <20230727202126.1477515-1-iwona.winiarska@intel.com>
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
Changes v2 -> v3:

* Fixed dt_binding_check error (Rob)

Changes v1 -> v2:

* Renamed binding filename to match compatible (Krzysztof)
---
 .../bindings/peci/nuvoton,npcm-peci.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml

diff --git a/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml b/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
new file mode 100644
index 000000000000..087e02a9ade3
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/nuvoton,npcm-peci.yaml#
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

