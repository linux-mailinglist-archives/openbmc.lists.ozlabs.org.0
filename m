Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FA39F458
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznFh1Njlz3c0N
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 20:55:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=GGOzTYAd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vopNBcOu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GGOzTYAd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=vopNBcOu; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzn7F3xnSz3btH;
 Tue,  8 Jun 2021 20:49:45 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD45C58060C;
 Tue,  8 Jun 2021 06:49:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Jun 2021 06:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0l+GZyXdXC+1Z
 kgtdXxZQ+svGegfZcRtgMiZtfOVFlc=; b=GGOzTYAd0Z0nRmxlfFdCGAXz1bBOx
 vJIy2ajJPEf1U25c0CE4QDfpbwY8kRCwqyL3r5l2fRJt0tdDmERB7xCf7iOWOAAH
 mo33P6W+scu/2c5jozOGLMLJSWpDd8pWVwcdpzu86QMFSRfc43Fn08dgr2fxU1An
 1U/cTqkeWzHU9lklQOYvCUqtGQm3nXCPK/DZ/cgyuHmGKzZSApMUAJXQZlXVuwsr
 OSREQVtWJy+gc4x5cAb8YbyjI5NO2724SdVhRlomryCH/28ziZEXX/BbPQ9uA3k7
 5oOgOU5+uBUwmMpl0Kx/PdO1IPVz0rKsyIyFJaDPGCltSjw12AExCy2/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0l+GZyXdXC+1ZkgtdXxZQ+svGegfZcRtgMiZtfOVFlc=; b=vopNBcOu
 fQT7xwqtOq6+AWfS5wYI9ZUhSOHU38J1siZPION/Yk0Y2q+YFKW+JETgniy7SGrE
 BZ333akWUl7QVpLMrMHivQLocoNJezhvhw60Td8Tf3uBHO8nibFj+8u2tkeHq4LF
 DXTJhSmzk4HjnabNEg1SeU2rbc4Glsvatj1REhYPlA+OsVRmBxkgf93k9bBTB57f
 UcsX/t/IyDRbUHkAIaICRH3vK0VDeknFnFzjszQoEIjffq6U+uyBLDS/j2yfwToj
 VhbAPaBXhjgCCWsah5ukTrxKprJgR/XBqokBq3TqdHuahy6tcE8JkQZgjgjEVI+7
 RhTH5JHoxwdzVQ==
X-ME-Sender: <xms:Rku_YKcCdbzhQglDMV5ca0aJvMj2NJ-FgTwPDUh3B467ew5uZFTiWA>
 <xme:Rku_YENHHuo4Nxd4IYEqjanqQUqqVHAu3E7ARFOupPwxuBXBPJbNqDP6LyiNf2cC6
 Q7yp0kEpP3twpEkHw>
X-ME-Received: <xmr:Rku_YLjhDqZ3LvHv15rGQIzh2B2xeq0jSAfR5dp1zon9TQeWtIigGlc_2meS0bn66Q0gLjjK4d0yWC8V7krbstmTT5UvHE6lThA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeeluedvvedtgffggefggfeugeevgffhjeefiedtvdehvdfhtefftefffeeihfev
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:Rku_YH_XpP1OB46yJ4H9JC2inw_CnCobMRST3vcCAGpP76fBjI8N2Q>
 <xmx:Rku_YGufIyC2DcJpvnGw8HezP18sx9MR_rV1lSuYYsozUSw30Vvlmw>
 <xmx:Rku_YOGe7_HQQ7edFwkn0muCxZf01xtPRyz--xxQVNr6JSPvxthbaw>
 <xmx:Rku_YOQvzVtf3HLGabkDUGwyzah9_RLrLQc3XyrVslN7iw5Lcx_WZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 06:49:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v4 12/16] dt-bindings: ipmi: Convert ASPEED KCS binding to
 schema
Date: Tue,  8 Jun 2021 20:17:53 +0930
Message-Id: <20210608104757.582199-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608104757.582199-1-andrew@aj.id.au>
References: <20210608104757.582199-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Given the deprecated binding, improve the ability to detect issues in
the platform devicetrees. Further, a subsequent patch will introduce a
new interrupts property for specifying SerIRQ behaviour, so convert
before we do any further additions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
 2 files changed, 92 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
new file mode 100644
index 000000000000..697ca575454f
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED BMC KCS Devices
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |
+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
+  interfaces on the LPC bus for in-band IPMI communication with their host.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Channel ID derived from reg
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc-v2
+            - aspeed,ast2500-kcs-bmc-v2
+            - aspeed,ast2600-kcs-bmc
+
+      - description: Old-style with explicit channel ID, no reg
+        deprecated: true
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc
+            - aspeed,ast2500-kcs-bmc
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    # maxItems: 3
+    items:
+      - description: IDR register
+      - description: ODR register
+      - description: STR register
+
+  aspeed,lpc-io-reg:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    minItems: 1
+    maxItems: 2
+    description: |
+      The host CPU LPC IO data and status addresses for the device. For most
+      channels the status address is derived from the data address, but the
+      status address may be optionally provided.
+
+  kcs_chan:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: The LPC channel number in the controller
+
+  kcs_addr:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: The host CPU IO map address
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2400-kcs-bmc
+              - aspeed,ast2500-kcs-bmc
+    then:
+      required:
+        - kcs_chan
+        - kcs_addr
+    else:
+      required:
+        - reg
+        - aspeed,lpc-io-reg
+
+examples:
+  - |
+    kcs3: kcs@24 {
+        compatible = "aspeed,ast2600-kcs-bmc";
+        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
+        aspeed,lpc-io-reg = <0xca2>;
+        interrupts = <8>;
+    };
diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
deleted file mode 100644
index 193e71ca96b0..000000000000
--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-# Aspeed KCS (Keyboard Controller Style) IPMI interface
-
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
-(Baseboard Management Controllers) and the KCS interface can be
-used to perform in-band IPMI communication with their host.
-
-## v1
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc"
-    "aspeed,ast2500-kcs-bmc"
-- interrupts : interrupt generated by the controller
-- kcs_chan : The LPC channel number in the controller
-- kcs_addr : The host CPU IO map address
-
-## v2
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc-v2"
-    "aspeed,ast2500-kcs-bmc-v2"
-- reg : The address and size of the IDR, ODR and STR registers
-- interrupts : interrupt generated by the controller
-- aspeed,lpc-io-reg : The host CPU LPC IO address for the device
-
-Example:
-
-    kcs3: kcs@24 {
-        compatible = "aspeed,ast2500-kcs-bmc-v2";
-        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
-        aspeed,lpc-reg = <0xca2>;
-        interrupts = <8>;
-        status = "okay";
-    };
-- 
2.30.2

