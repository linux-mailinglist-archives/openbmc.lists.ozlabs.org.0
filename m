Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41E6727AC
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxw7W456sz3fJJ
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:00:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6Z01hYz3c46;
	Thu, 19 Jan 2023 05:59:33 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id cm26-20020a056830651a00b00684e5c0108dso6450672otb.9;
        Wed, 18 Jan 2023 10:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHSFrwryn6fPv+cT/r2Gmm/cJBn2LuFhBNelG0ms7lQ=;
        b=i/dc4EhXllvCwPraN+TSdNI5U82bneUCCHVs5gq8kLDf8b02ExZt5RuTNQPVjTYxu4
         nCjZsj/+7eBHAh2j7o2fHBEHNCPZxkz8sCcRoi4xwLRJRkNqF8tMSni6gcIaJgJdTGZs
         T25vRhzYeLiGIct3LurOEjLdTOdsr85kSUWvj6INe+IvTh6s7lPBMPJFAXYqxFPGj+f7
         +vcdcGSe2Pmme+37Pjj+nwUmiSsXZ2cbRnyPkCJf4K1jigUYzQPB235jjRgb8XjiSH+z
         suEOc99JJ9cQy6oYpaa9t9ohFA7qBk6HZ+UhsusaR9Y/ve62J17fbmdrEtlSio74gDjB
         6H8g==
X-Gm-Message-State: AFqh2kqclWDrEfgpEIv+Hp6gXgOQ8FEqRD5DIsLY+Fg/pjVZgSm257Wg
	gs9+VYzA5Y+VApLtedsNqQ==
X-Google-Smtp-Source: AMrXdXsXsibVi/mXBx5wpLNup3wGFrSwbUKQ5EbaZJM3qDLNOiUndqkGVOrWW3O789IRP6ncH5I1sA==
X-Received: by 2002:a05:6830:26c5:b0:686:41a1:4c16 with SMTP id m5-20020a05683026c500b0068641a14c16mr5435393otu.24.1674068370410;
        Wed, 18 Jan 2023 10:59:30 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id o15-20020a9d764f000000b0066b9a6bf3bcsm18688925otl.12.2023.01.18.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:29 -0800 (PST)
Received: (nullmailer pid 629743 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/5] dt-bindings: usb: Convert some more simple
 OHCI/EHCI bindings
Date: Wed, 18 Jan 2023 12:59:23 -0600
Message-Id: <20230110-dt-usb-v2-0-926bc1260e51@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItByGMC/2WNywqDMBBFf0Vm3Sl5YJSu+h/iItGpCZVYJiotk
 n9v6rbLc7ice0AiDpTgVh3AtIcUllhAXSoYvI0TYRgLgxJKCykFjituyaEcjG6aWtlWOyhjZxO
 hYxsHX+Zxm+ciX0yP8D7rXV/Yh7Qu/DnPdvmzf91dosCWtDGklamlvj+JI83XhSfoc85f7/lOX
 bIAAAA=
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

The 'ohci-usb' compatible is another 'generic' compatible for OHCI, but 
isn't documented with a schema. Let's add it to generic-ohci.yaml 
schema. While looking at this, I found a few other USB host bindings 
which are simple enough to use the 'generic' schemas.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Fix schema error for 'transceiver'
- Split OMAP changes to separate patch and convert omap-ehci
- Link to v1: https://lore.kernel.org/r/20230110-dt-usb-v1-0-8e366e326513@kernel.org

---
Rob Herring (5):
      dt-bindings: usb: Remove obsolete brcm,bcm3384-usb.txt
      dt-bindings: usb: Convert multiple "usb-ohci" bindings to DT schema
      dt-bindings: usb: Convert OMAP OHCI/EHCI bindings to schema
      dt-bindings: usb: Convert Marvell Orion EHCI to DT schema
      dt-bindings: usb: Convert Nuvoton EHCI to DT schema

 .../devicetree/bindings/mfd/omap-usb-host.txt      |  8 ++---
 .../devicetree/bindings/powerpc/nintendo/wii.txt   | 10 -------
 .../devicetree/bindings/usb/brcm,bcm3384-usb.txt   | 11 -------
 .../devicetree/bindings/usb/ehci-omap.txt          | 31 -------------------
 .../devicetree/bindings/usb/ehci-orion.txt         | 22 --------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  5 ++++
 .../devicetree/bindings/usb/generic-ohci.yaml      | 32 +++++++++++++++++---
 .../devicetree/bindings/usb/npcm7xx-usb.txt        | 20 -------------
 Documentation/devicetree/bindings/usb/ohci-nxp.txt | 24 ---------------
 .../devicetree/bindings/usb/ohci-omap3.txt         | 15 ----------
 Documentation/devicetree/bindings/usb/pxa-usb.txt  |  2 +-
 .../devicetree/bindings/usb/spear-usb.txt          | 35 ----------------------
 12 files changed, 38 insertions(+), 177 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230110-dt-usb-1c637752a83b

Best regards,
-- 
Rob Herring <robh@kernel.org>

