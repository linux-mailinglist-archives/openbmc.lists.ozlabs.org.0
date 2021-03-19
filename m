Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA883415FF
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vN33bfhz3ccK
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:37:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aKKxtWke;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Pr7RXhlX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=aKKxtWke; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Pr7RXhlX; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1vC46mLHz3c1h;
 Fri, 19 Mar 2021 17:30:08 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F2BC2580A85;
 Fri, 19 Mar 2021 02:30:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QRDiTNGJwy42h
 fOUMjmwo2Lxr+h4OGF8vd82Dnei0yg=; b=aKKxtWkePJOP9OvXvaQqpJcmnBjD3
 QLcjC6VhCh3bstlp3BeT8dbN3iw7wOTvgAlYrP6CwMllYSjzwKjhJ36Hdd5Z4zrJ
 hPQ23U1dSzbv4ZJn6jnw+brIZoeGIYnXok/vD0en4lYGWdbTFSiTC2r4hiTde26f
 i/eynZitLYZ92+VX1abe/ZHyvIk+zVaBcMGGmKsXMqbWH+eu3HCbUXy3j9AP8KJR
 Ae+cA5YZialf4g9cH4boJRbB38M9i3OfBzoPrDmqTFx1PiknNPDUMQiZ8Yh/aVVA
 JMSHz0r9Q7qCyFXW5wsDfdPtR3ZrOXOOtMOBb9zV6W28YnqDEOl3gaeVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QRDiTNGJwy42hfOUMjmwo2Lxr+h4OGF8vd82Dnei0yg=; b=Pr7RXhlX
 GP817mV0vLm6R7wuf2pubbnEco69DyrHkGoNglo5tOpBsp8bdcIlQOLq6jo2CZCc
 saiGrjX9dWQgvbgNPD5mhV4H5EkEaoBZhSJO7QzK4wcfT1O+VwVSNbYmLEZPVj02
 XJppEoGHvzr5BFLDGRZhHVqXVnGUKUa3X3lmzSJLjQYS91eitGtAh8WDzR0U/JCz
 /Bqb8VDsmChgYXoIc/bjhmo7okuXweAUvC5+Pnnf4LWvhpJ+VWMjXHylfqJFC2jO
 5o1CEyhEhGKrjiSCOrsfAZUBpQcGbgrp6rl/g4Ez/dzl2uIGHgBsrLKfBC7upJMv
 vTaZQVpUQBDasQ==
X-ME-Sender: <xms:7kRUYAPz2ssjNruzlDvnfIlV-DnZq5IFCjb70_aDFn032M8XalQ1PA>
 <xme:7kRUYP6nGA3tpM4ZgJiiEoOrWvz7vpjw2VBD1nGazCQIuthIHm4R-81JsFxT9e6PR
 _gtrR925tOAhp5PfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
 heenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7kRUYJOmLXqdlP0EBEawQTaCEZzuMSQya0Ar9eggXOQHRT8trQl86A>
 <xmx:7kRUYFmxMO5BS9hFFcN-eKtjRPLXfMWt_0eGEiyxWKvewyQWRoykBQ>
 <xmx:7kRUYIRw74ecXDgcW8IXSdR23G2lfmhsxagZ-9XcO_yARV1MbbWaKA>
 <xmx:7kRUYIx2gFbQh8I4aXgwoo8sWdgYiorT9_DzmcgoBFRFvIdWjz66hQ>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B13A240057;
 Fri, 19 Mar 2021 02:30:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 18/21] dt-bindings: ipmi: Add optional SerIRQ property to
 ASPEED KCS devices
Date: Fri, 19 Mar 2021 16:57:49 +1030
Message-Id: <20210319062752.145730-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Allocating IO and IRQ resources to LPC devices is in-theory an operation
for the host, however ASPEED don't appear to expose this capability
outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
registers for managing these resources, so introduce a devicetree
property for KCS devices to describe SerIRQ properties.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
index 697ca575454f..4ff6fabfcb30 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -49,6 +49,18 @@ properties:
       channels the status address is derived from the data address, but the
       status address may be optionally provided.
 
+  aspeed,lpc-interrupts:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 2
+    maxItems: 2
+    description: |
+      A 2-cell property expressing the LPC SerIRQ number and the interrupt
+      level/sense encoding (specified in the standard fashion).
+
+      Note that the generated interrupt is issued from the BMC to the host, and
+      thus the target interrupt controller is not captured by the BMC's
+      devicetree.
+
   kcs_chan:
     deprecated: true
     $ref: '/schemas/types.yaml#/definitions/uint32'
@@ -84,9 +96,11 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     kcs3: kcs@24 {
         compatible = "aspeed,ast2600-kcs-bmc";
         reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
         aspeed,lpc-io-reg = <0xca2>;
+        aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
         interrupts = <8>;
     };
-- 
2.27.0

