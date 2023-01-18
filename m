Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05E6727C9
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxwCs5GTrz3fQK
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:04:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6g5ckZz3fC0;
	Thu, 19 Jan 2023 05:59:39 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id f88-20020a9d03e1000000b00684c4041ff1so10494422otf.8;
        Wed, 18 Jan 2023 10:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/w7cp6YVGNbkVTPnnS6fPAfMJMQm9O9TtAZyHYNnBw=;
        b=OjBR6AFSj1uy7Z/DGrPE6viH5XtIcZ/uCr0bTlU1UBRPWp1+a5HJNTLs+kfcGyaEZp
         Ikz2kPgiqqffgqx+YfAjvfB5ZV1lsG9Lvq9EYnBznTyjCDYO5NsyHpnrpBaul+zdmiFw
         ZLrfE69Lk6hjxaUiWBvDUS0djz4g1kIKruBYMTuY6bsbpU8Gv51Qy/8bswgEb9k1ixms
         vQwRCC0XSUjv8hKecEO6xS7Sefqp4o8m5intdQA3PbfgL7NoalnIlydC0L7SbbbpyU5A
         OA8I1zbn2xdfrtDySOEfARmHfXxVWVCXd3Cl231KQkogBqeEXgbNC8RA2Y5mUiZ8I0/G
         +6Mw==
X-Gm-Message-State: AFqh2kp4d0UX3owgDxQvnWkyjrWxby6xpi6eqkWuzWsSRR1sOmURGY11
	cMcnEy3ClE6q7PkyzDAwSQ==
X-Google-Smtp-Source: AMrXdXte0bYZFLFpbx1SB+TuluJMNIGkayFObGKl8ktRZeTlQi80dYuVH04jQYvzqTsrgPgipC8SMg==
X-Received: by 2002:a9d:196:0:b0:66e:c736:ef9a with SMTP id e22-20020a9d0196000000b0066ec736ef9amr3720906ote.1.1674068377180;
        Wed, 18 Jan 2023 10:59:37 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id e18-20020a9d6e12000000b00684c5211c58sm10143809otr.60.2023.01.18.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:36 -0800 (PST)
Received: (nullmailer pid 629752 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 12:59:26 -0600
Subject: [PATCH v2 4/5] dt-bindings: usb: Convert Marvell Orion EHCI to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v2-4-926bc1260e51@kernel.org>
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

The Marvell Orion EHCI binding is just some compatible strings, so add it
to the generic-ehci.yaml schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/ehci-orion.txt         | 22 ----------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ehci-orion.txt b/Documentation/devicetree/bindings/usb/ehci-orion.txt
deleted file mode 100644
index 2855bae79fda..000000000000
--- a/Documentation/devicetree/bindings/usb/ehci-orion.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* EHCI controller, Orion Marvell variants
-
-Required properties:
-- compatible: must be one of the following
-	"marvell,orion-ehci"
-	"marvell,armada-3700-ehci"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The EHCI interrupt
-
-Optional properties:
-- clocks: reference to the clock
-- phys: reference to the USB PHY
-- phy-names: name of the USB PHY, should be "usb"
-
-Example:
-
-	ehci@50000 {
-		compatible = "marvell,orion-ehci";
-		reg = <0x50000 0x1000>;
-		interrupts = <19>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 2d382ae424da..ebbb01b39a92 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,8 @@ properties:
           - const: usb-ehci
       - enum:
           - generic-ehci
+          - marvell,armada-3700-ehci
+          - marvell,orion-ehci
           - ti,ehci-omap
           - usb-ehci
 

-- 
2.39.0

