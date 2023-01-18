Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5E6727C7
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:03:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxwC6100Kz3fH5
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:03:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.179; helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6f2gysz3c46;
	Thu, 19 Jan 2023 05:59:38 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id p185so8324294oif.2;
        Wed, 18 Jan 2023 10:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/498OiMZPHbFbvFSKtUIhHhTesngR9MYr2wpHtuKiUI=;
        b=QiHijkiZjEyqQxqqctzBcOuRHNmwg6JpdZ4Pvj/tiymo+LY14KOSTA7OoOZdRT8cQ/
         Ydh9cVsro0JwCOwXw3LG0ZQjsLMgJ56s5xbEDPPCXdVbg8BoYejSUY6KAJ3WJsjoL8Os
         WDOu1URUgoslcLCs5sRKlNaFK7W+727xpZU26Ch4DkgnicgVIBKdE2kHapH2efL53CAz
         DDfrtXZEYlXQEfUJLvWvTb2M/kUF50RZwJ2klVMYNLiV6KKf3RHilBcB2+9TxRie1dEP
         Kfe1Kc1igJM6V4K8Iqp+TB6JanYVvX84aY+814h7xreIj8U5jiJ5Cx9v0V5YIA3331Tl
         cngQ==
X-Gm-Message-State: AFqh2kpvW5Gd5sB/p0VwrkOk6Pm98S+ZUjTqVcZeyfyoVUcFsL9sfyKb
	qkE6skqwdO7iwtCvCxGfQA==
X-Google-Smtp-Source: AMrXdXvc70DFsiA2pntRri38rws+2fLrYDsxkQrHaqfeU1sFs4J2tC6t9tH8CPlf2dEY9/epVtwQ3g==
X-Received: by 2002:a05:6808:2204:b0:367:1c4f:cb13 with SMTP id bd4-20020a056808220400b003671c4fcb13mr5480278oib.37.1674068375759;
        Wed, 18 Jan 2023 10:59:35 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id bj23-20020a056808199700b0036718f58b7esm4148788oib.15.2023.01.18.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:35 -0800 (PST)
Received: (nullmailer pid 629750 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 12:59:25 -0600
Subject: [PATCH v2 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings
 to schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v2-3-926bc1260e51@kernel.org>
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

The OMAP OHCI and EHCI USB host bindings follow the generic binding, so
add the compatibles and remove the old txt binding docs.

The examples in omap-usb-host.txt don't match actual users, so update
them dropping the fallback compatible.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - New patch
---
 .../devicetree/bindings/mfd/omap-usb-host.txt      |  8 +++---
 .../devicetree/bindings/usb/ehci-omap.txt          | 31 ----------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |  4 ++-
 .../devicetree/bindings/usb/ohci-omap3.txt         | 15 -----------
 5 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
index aa1eaa59581b..7ce5800dd36d 100644
--- a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
+++ b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
@@ -64,8 +64,8 @@ Required properties if child node exists:
 Properties for children:
 
 The OMAP HS USB Host subsystem contains EHCI and OHCI controllers.
-See Documentation/devicetree/bindings/usb/ehci-omap.txt and
-Documentation/devicetree/bindings/usb/ohci-omap3.txt.
+See Documentation/devicetree/bindings/usb/ehci-generic.yaml and
+Documentation/devicetree/bindings/usb/ohci-generic.yaml.
 
 Example for OMAP4:
 
@@ -78,14 +78,14 @@ usbhshost: usbhshost@4a064000 {
 	ranges;
 
 	usbhsohci: ohci@4a064800 {
-		compatible = "ti,ohci-omap3", "usb-ohci";
+		compatible = "ti,ohci-omap3";
 		reg = <0x4a064800 0x400>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 76 0x4>;
 	};
 
 	usbhsehci: ehci@4a064c00 {
-		compatible = "ti,ehci-omap", "usb-ehci";
+		compatible = "ti,ehci-omap";
 		reg = <0x4a064c00 0x400>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 77 0x4>;
diff --git a/Documentation/devicetree/bindings/usb/ehci-omap.txt b/Documentation/devicetree/bindings/usb/ehci-omap.txt
deleted file mode 100644
index d77e11a975a2..000000000000
--- a/Documentation/devicetree/bindings/usb/ehci-omap.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-OMAP HS USB EHCI controller
-
-This device is usually the child of the omap-usb-host
-Documentation/devicetree/bindings/mfd/omap-usb-host.txt
-
-Required properties:
-
-- compatible: should be "ti,ehci-omap"
-- reg: should contain one register range i.e. start and length
-- interrupts: description of the interrupt line
-
-Optional properties:
-
-- phys: list of phandles to PHY nodes.
-  This property is required if at least one of the ports are in
-  PHY mode i.e. OMAP_EHCI_PORT_MODE_PHY
-
-To specify the port mode, see
-Documentation/devicetree/bindings/mfd/omap-usb-host.txt
-
-Example for OMAP4:
-
-usbhsehci: ehci@4a064c00 {
-	compatible = "ti,ehci-omap";
-	reg = <0x4a064c00 0x400>;
-	interrupts = <0 77 0x4>;
-};
-
-&usbhsehci {
-	phys = <&hsusb1_phy 0 &hsusb3_phy>;
-};
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 994818cb6044..2d382ae424da 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,7 @@ properties:
           - const: usb-ehci
       - enum:
           - generic-ehci
+          - ti,ehci-omap
           - usb-ehci
 
   reg:
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 8492d809ba40..a9ba7257b884 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -46,7 +46,9 @@ properties:
               - ingenic,jz4740-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
-      - const: generic-ohci
+      - enum:
+          - generic-ohci
+          - ti,ohci-omap3
       - items:
           - enum:
               - cavium,octeon-6335-ohci
diff --git a/Documentation/devicetree/bindings/usb/ohci-omap3.txt b/Documentation/devicetree/bindings/usb/ohci-omap3.txt
deleted file mode 100644
index ce8c47cff6d0..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-omap3.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-OMAP HS USB OHCI controller (OMAP3 and later)
-
-Required properties:
-
-- compatible: should be "ti,ohci-omap3"
-- reg: should contain one register range i.e. start and length
-- interrupts: description of the interrupt line
-
-Example for OMAP4:
-
-usbhsohci: ohci@4a064800 {
-	compatible = "ti,ohci-omap3";
-	reg = <0x4a064800 0x400>;
-	interrupts = <0 76 0x4>;
-};

-- 
2.39.0

