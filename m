Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7F6727DA
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxwFf4M9Jz3fdJ
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:05:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.45; helo=mail-oa1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6k1hnJz3fBZ;
	Thu, 19 Jan 2023 05:59:41 +1100 (AEDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-15ebfdf69adso45299fac.0;
        Wed, 18 Jan 2023 10:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODJnN8bRpnIpOcq/j8GhrdGyRWH1W8cT3IRjCv4ER3A=;
        b=4g7k1SaaTXw5+lB0jz5Ycl2zFLNwYj9bIWbEnx+1yWxGjnhJhOg8LmoLoruVQ+ngAX
         3XOOWzrz7j/HdLptN08ZM4TgJXAlUF3qD+lLrLIYQB5nQtzGzXulT/JlLWSf5rtlb4aK
         UUeL4M3YVHNZygFxzN+MeZpwt/ujdYEO/nURtXPPrIef/HfXKtBenFf2PMNz46fp50iJ
         VkqO3tqkdtNXd0r/gBUkmxxR84Yb0aon6hf1SrwGVFn0/+mgqb6sHBLPYmGM28R6ysqA
         36LlaEzb88czFRMa+kV/Z5MN9aMUV+1jR9OpRx6zq4rvj7yuJFZ3E1ywrXie7rI+BDgz
         NnPg==
X-Gm-Message-State: AFqh2kokpw3mLe92WfnmTxhIGWAAWbrCIFli3ITmXeQpjS9kMFEYH2mA
	5vJx5RlH7NIMQKPNMiNFkVKzrAVW0Q==
X-Google-Smtp-Source: AMrXdXu9zG06IMZpgmtOQ7L1h11dhjdNyBorEjEBZFjLS2nvmomm0VUxvyDl9ThG87aTiuEVVvZMlg==
X-Received: by 2002:a05:6871:4186:b0:15e:e77b:b2fd with SMTP id lc6-20020a056871418600b0015ee77bb2fdmr4189474oab.41.1674068379430;
        Wed, 18 Jan 2023 10:59:39 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id f15-20020a056870548f00b0015f1024d322sm7378767oan.37.2023.01.18.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:38 -0800 (PST)
Received: (nullmailer pid 629748 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 12:59:24 -0600
Subject: [PATCH v2 2/5] dt-bindings: usb: Convert multiple "usb-ohci"
 bindings to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v2-2-926bc1260e51@kernel.org>
References: <20230110-dt-usb-v2-0-926bc1260e51@kernel.org>
In-Reply-To: <20230110-dt-usb-v2-0-926bc1260e51@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.12-dev
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"usb-ohci" is another "generic" OHCI controller compatible string used by
several platforms. Add it to the generic-ohci.yaml schema and remove all
the old binding docs.

Marvell pxa-usb.txt has "usb-ohci" in the example, but actual users don't,
so drop it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix transceiver property in if/then schema
 - Move OMAP to separate patch
---
 .../devicetree/bindings/powerpc/nintendo/wii.txt   | 10 -------
 .../devicetree/bindings/usb/generic-ohci.yaml      | 28 +++++++++++++++--
 Documentation/devicetree/bindings/usb/ohci-nxp.txt | 24 ---------------
 Documentation/devicetree/bindings/usb/pxa-usb.txt  |  2 +-
 .../devicetree/bindings/usb/spear-usb.txt          | 35 ----------------------
 5 files changed, 26 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt b/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
index c4d78f28d23c..3ff6ebbb4998 100644
--- a/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wii.txt
@@ -97,16 +97,6 @@ Nintendo Wii device tree
    - reg : should contain the EXI registers location and length
    - interrupts : should contain the EXI interrupt
 
-1.g) The Open Host Controller Interface (OHCI) nodes
-
-  Represent the USB 1.x Open Host Controller Interfaces.
-
-  Required properties:
-
-   - compatible : should be "nintendo,hollywood-usb-ohci","usb-ohci"
-   - reg : should contain the OHCI registers location and length
-   - interrupts : should contain the OHCI interrupt
-
 1.h) The Enhanced Host Controller Interface (EHCI) node
 
   Represents the USB 2.0 Enhanced Host Controller Interface.
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 4fcbd0add49d..8492d809ba40 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: USB OHCI Controller
 
-allOf:
-  - $ref: "usb-hcd.yaml"
-
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
@@ -50,6 +47,13 @@ properties:
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
       - const: generic-ohci
+      - items:
+          - enum:
+              - cavium,octeon-6335-ohci
+              - nintendo,hollywood-usb-ohci
+              - nxp,ohci-nxp
+              - st,spear600-ohci
+          - const: usb-ohci
 
   reg:
     maxItems: 1
@@ -119,11 +123,29 @@ properties:
       - host
       - otg
 
+  transceiver:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The associated ISP1301 device. Necessary for the UDC controller for
+      connecting to the USB physical layer.
+
 required:
   - compatible
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: nxp,ohci-nxp
+    then:
+      properties:
+        transceiver: false
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/ohci-nxp.txt b/Documentation/devicetree/bindings/usb/ohci-nxp.txt
deleted file mode 100644
index 71e28c1017ed..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-nxp.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* OHCI controller, NXP ohci-nxp variant
-
-Required properties:
-- compatible: must be "nxp,ohci-nxp"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The OHCI interrupt
-- transceiver: phandle of the associated ISP1301 device - this is necessary for
-               the UDC controller for connecting to the USB physical layer
-
-Example (LPC32xx):
-
-	isp1301: usb-transceiver@2c {
-		compatible = "nxp,isp1301";
-		reg = <0x2c>;
-	};
-
-	ohci@31020000 {
-		compatible = "nxp,ohci-nxp";
-		reg = <0x31020000 0x300>;
-		interrupt-parent = <&mic>;
-		interrupts = <0x3b 0>;
-		transceiver = <&isp1301>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
index 9c331799b87c..53fdae4fa6f6 100644
--- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
+++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
@@ -22,7 +22,7 @@ Optional properties:
 Example:
 
 	usb0: ohci@4c000000 {
-		compatible = "marvell,pxa-ohci", "usb-ohci";
+		compatible = "marvell,pxa-ohci";
 		reg = <0x4c000000 0x100000>;
 		interrupts = <18>;
 		marvell,enable-port1;
diff --git a/Documentation/devicetree/bindings/usb/spear-usb.txt b/Documentation/devicetree/bindings/usb/spear-usb.txt
deleted file mode 100644
index 1dc91cc459c0..000000000000
--- a/Documentation/devicetree/bindings/usb/spear-usb.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-ST SPEAr SoC USB controllers:
------------------------------
-
-EHCI:
------
-
-Required properties:
-- compatible: "st,spear600-ehci"
-- interrupts: Should contain the EHCI interrupt
-
-Example:
-
-	ehci@e1800000 {
-		compatible = "st,spear600-ehci", "usb-ehci";
-		reg = <0xe1800000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <27>;
-	};
-
-
-OHCI:
------
-
-Required properties:
-- compatible: "st,spear600-ohci"
-- interrupts: Should contain the OHCI interrupt
-
-Example:
-
-	ohci@e1900000 {
-		compatible = "st,spear600-ohci", "usb-ohci";
-		reg = <0xe1800000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <26>;
-	};

-- 
2.39.0

