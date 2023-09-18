Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58E7A5033
	for <lists+openbmc@lfdr.de>; Mon, 18 Sep 2023 19:01:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqB0K5mkpz3ccZ
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 03:01:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq9yl0b2Dz2yt0
	for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 03:00:13 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 38IH05FI011062
	for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2023 20:00:05 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Sep
 2023 20:00:05 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Sep
 2023 01:00:03 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 19 Sep 2023 01:00:03 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 617816473F; Mon, 18 Sep 2023 20:00:02 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <xu.yang_2@nxp.com>, <peng.fan@nxp.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton NPCM supprt
Date: Mon, 18 Sep 2023 19:59:57 +0300
Message-ID: <20230918165958.2659-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230918165958.2659-1-tmaimon77@gmail.com>
References: <20230918165958.2659-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvoton NPCM BMC SoCs use ChipIdea silicon IP for the USB device controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 1394557517b1..9de4dfe004d1 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -16,6 +16,7 @@ properties:
       - enum:
           - chipidea,usb2
           - lsi,zevio-usb
+          - nuvoton,npcm-udc
           - nvidia,tegra20-ehci
           - nvidia,tegra20-udc
           - nvidia,tegra30-ehci
@@ -325,6 +326,20 @@ properties:
     type: boolean
     deprecated: true
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that configures usb phy mux.
+          - description: offset of usb phy mux selection.
+          - description: mask usb phy mux selection.
+          - description: value usb phy mux selection.
+    description:
+      A phandle to syscon with three arguments that configure usb phy mux.
+      The argument one is the offset of usb phy mux selection, the argument two
+      is the mask usb phy mux selection, the argument three is the mask usb phy
+      mux selection.
+
   port:
     description:
       Any connector to the data bus of this controller should be modelled
@@ -388,6 +403,7 @@ allOf:
             enum:
               - chipidea,usb2
               - lsi,zevio-usb
+              - nuvoton,npcm-udc
               - nvidia,tegra20-udc
               - nvidia,tegra30-udc
               - nvidia,tegra114-udc
-- 
2.33.0

