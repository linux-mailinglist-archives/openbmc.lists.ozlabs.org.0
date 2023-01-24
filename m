Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B478A678ED9
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 04:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1BnC465yz3fNL
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 14:10:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bfy5KHPz3c9T;
	Tue, 24 Jan 2023 14:05:30 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id a1-20020a056830008100b006864df3b1f8so8497293oto.3;
        Mon, 23 Jan 2023 19:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/w7cp6YVGNbkVTPnnS6fPAfMJMQm9O9TtAZyHYNnBw=;
        b=tkh73S6szkffFrzKhDtdtuSfSgfp7To2mRcjcx99WlwO9yNWO7CZ7p3ViB6oVyfuO/
         ko2/wwia/mGAALji6oZUky06izeN+vc0t7N8zoJHNjZtI3mbQ+6+qDrEjhvLGYxecuaA
         3R08ev9JCT1Uhnn4hqmFnNJv8dmh3e7J5DitQ0Ljrt+kWyDIMpny7mA4mnP410eRlzpu
         SsCui61Gl6njva3AV7ZG+Uwc9BaYPF+7jsz/OndVd29Pt1ZrjEJsQauTGyfVQV+Ib7Hs
         W63mV43pcYyRVBup9Q9zCEZidYghwm+Jl9Ti8f2dzUcMuCBYrzzYHqgrYbwsjKfat6Te
         nvJw==
X-Gm-Message-State: AFqh2kq/wu+3TST2FiJtIf6zRjlFBzTHXt96dsej3GIODmp8Br+pUG4O
	foAszG/ehAX6aaA+Pp2FJopO/cY/sg==
X-Google-Smtp-Source: AMrXdXvQH0sqj/L9JBEQUzQ6OMqA602/d6xDzeDJd2iqRHh2295yqrVgSM/VJdjsM0K9Fx0dwIY4/A==
X-Received: by 2002:a05:6830:670a:b0:684:e1cb:df87 with SMTP id cr10-20020a056830670a00b00684e1cbdf87mr15320609otb.8.1674529528074;
        Mon, 23 Jan 2023 19:05:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cr11-20020a056830670b00b00661a3f4113bsm419338otb.64.2023.01.23.19.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:05:27 -0800 (PST)
Received: (nullmailer pid 3266346 invoked by uid 1000);
	Tue, 24 Jan 2023 03:05:20 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 21:05:18 -0600
Subject: [PATCH v3 4/5] dt-bindings: usb: Convert Marvell Orion EHCI to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v3-4-5af0541fcf8c@kernel.org>
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
In-Reply-To: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
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

