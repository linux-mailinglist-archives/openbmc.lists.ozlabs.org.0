Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74734678ECB
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 04:06:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Bgn2Dw4z3fB4
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 14:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.180; helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bft3MPmz30hl;
	Tue, 24 Jan 2023 14:05:24 +1100 (AEDT)
Received: by mail-oi1-f180.google.com with SMTP id r205so12180154oib.9;
        Mon, 23 Jan 2023 19:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk4+Vm8v4wzLEgMP6WlX8JSzRYNU6eFU1QUEyNlFosI=;
        b=nbctSJp5Ln7NrvG+wa99qIjfQnq5VLopYYBLHd5EeD6u9pzNf/rwDjrRcBiJP1QOWe
         Mj4sjBpsq4f+rgS0H88+2dklPlzpByq9SnIWbJ4XiXttsE8F7QALqvxN0t164s4ry2zi
         FmzEjmuv5tue8FtsbsqYfjTg6zG0yfCCum+CMiVA23hj3jfLziC7LY09N2VlIeYmCZYG
         D5au6nj2BQoTDXeoFvLQkuWMvt73qV5evKo68/jg0fvTwhm/Kjv1fKhuvcTg+0+vLNFr
         RPn+PMl95zO7tNgJOnUdnyMsO5gTpD+OQsP5z8677yu9/mT6Qp4onD5OW34F9jlrcEbd
         8iEA==
X-Gm-Message-State: AFqh2kqgTg9RNHtwRdP6QnT1xvrK1F7MxLNw0XoJzkgKAe3Or1KdTB4Z
	ulbZI98URDE+0tp4Os6NTQ==
X-Google-Smtp-Source: AMrXdXst3JoI2NBXuIrK65blr0cehJdMUewk4qoXF1Qd+FyS0toceDw915fLBXVpo2fyMR3DsMW4Hg==
X-Received: by 2002:a05:6808:228a:b0:364:4eb7:e873 with SMTP id bo10-20020a056808228a00b003644eb7e873mr12078336oib.7.1674529521530;
        Mon, 23 Jan 2023 19:05:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bj19-20020a056808199300b0035b4b6d1bbfsm503702oib.28.2023.01.23.19.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:05:21 -0800 (PST)
Received: (nullmailer pid 3266337 invoked by uid 1000);
	Tue, 24 Jan 2023 03:05:20 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/5] dt-bindings: usb: Convert some more simple
 OHCI/EHCI bindings
Date: Mon, 23 Jan 2023 21:05:15 -0600
Message-Id: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtKz2MC/22NQQ7CIBREr9KwFsP/BFpdeQ/jAui3JTbUQEs0T
 e8u7c7ocibz3iwsUfSU2LlaWKTskx9DCfJQMdeb0BH3bckMBUoBIHg78TlZDk7LulZoGmlZGVu
 TiNtoguvLPMzDUMpnpLt/7fbrreTep2mM7/0sw9b+eDNwwRuSWpNErUBeHhQDDccxdmxzZPzPY
 eFOqK0D1IIUfHHrun4Ally7aOoAAAA=
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
Changes in v3:
- Fix document references to generic-ehci.yaml and generic-ohci.yaml
- Link to v2: https://lore.kernel.org/r/20230110-dt-usb-v2-0-926bc1260e51@kernel.org

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

