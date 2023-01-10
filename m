Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CFA664FD9
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:20:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns6HH13z4z3fG6
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:20:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.50; helo=mail-oo1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns6DV19Wmz3c5D;
	Wed, 11 Jan 2023 10:18:01 +1100 (AEDT)
Received: by mail-oo1-f50.google.com with SMTP id y4-20020a4ab404000000b004f21c72be42so362402oon.8;
        Tue, 10 Jan 2023 15:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkffzaMKgEkAFzow+1H0ViuhO0ELE5aDY2zTJCKAxL8=;
        b=YplnferknMngq7s10z6z6iZvyGi4gqok9URfJwax3ZTsOzIseM/0pJdW6zB4Dco8El
         /HNSklN4e1dWoOZxiHPghGCHpTDgyChQ2OWppjJ0FHk6sNcHSQjVXoj8PZqoVFJGf6Ye
         eo2hTLfzZaKNN5RtK4YZomfwXVuQy7i1CZj9TZ3LtosHmi0QHr7MxLo0AvwoVZUFrgq9
         BhLGAybpWYYblEJ3lpy9hZBcBC6cQ6np1MssekM1P/myEsjVcR94ol81b/WYo1nUkBr9
         FIAa1dw8yEK3wpZSc6rEVvePmrPoeJwoewQYP74ajAdRVIBPVC831qXoQI0osCz6802h
         +4Fg==
X-Gm-Message-State: AFqh2kpIIgJm5fpxpHdfFbdAAdj704711FyJyi31vetVddlJtgC+yCZX
	PjxoJuJoO8sTRG/W1rutqw==
X-Google-Smtp-Source: AMrXdXsPUnlihCfZ58pdMoiErSCAf5PyyC5YskkNloNog96Pmb6ECnLgmGoZIrhTMwzUfjZO2S7H/A==
X-Received: by 2002:a05:6820:387:b0:4f1:e2d8:47e4 with SMTP id r7-20020a056820038700b004f1e2d847e4mr75789ooj.9.1673392679634;
        Tue, 10 Jan 2023 15:17:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q6-20020a4a9606000000b004a388af96f9sm6330128ooi.4.2023.01.10.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:17:58 -0800 (PST)
Received: (nullmailer pid 3145662 invoked by uid 1000);
	Tue, 10 Jan 2023 23:17:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 17:17:46 -0600
Subject: [PATCH 3/4] dt-bindings: usb: Convert Marvell Orion EHCI to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v1-3-8e366e326513@kernel.org>
References: <20230110-dt-usb-v1-0-8e366e326513@kernel.org>
In-Reply-To: <20230110-dt-usb-v1-0-8e366e326513@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
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
index 994818cb6044..85e41609b09b 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,8 @@ properties:
           - const: usb-ehci
       - enum:
           - generic-ehci
+          - marvell,armada-3700-ehci
+          - marvell,orion-ehci
           - usb-ehci
 
   reg:

-- 
2.39.0

