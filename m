Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECD664FD3
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns6FS5cjDz3bWw
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:18:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns6DT4SH9z3bWw;
	Wed, 11 Jan 2023 10:17:59 +1100 (AEDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1433ef3b61fso13782388fac.10;
        Tue, 10 Jan 2023 15:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lkFM/UpYCvsam9zyZ1K3XdTYML8CgB63Y9WsqByvPo=;
        b=pWV2th9stlBD12Nal0rWABWEpgq+USu6owh5MJ/nmMPkUqRX531TfyxNbLLAbzF+5z
         PH6oEpPRn48nOgjd+wlbp4XEQIR5Rq507EkK04cJG9GJiiTWwp3OYzFPfikO/BhorT0D
         7VRM+uy6U4LG61j1JmGG7XkXSMPAoIcHWSGj4rihoBJmibmEMGWG+F/z72ZntLhkUycj
         413Ft2fy1AyH+uXm7OrKUhO2/r+NR6bhWxYwhoeJyOeryI42pVxe0ZTdpQxphf9+tirk
         4E++838BhewgY3W3nEEPz4ldXmVsw8M1wMgl2DFyIrPtKLOB96jfJm2TrXFZ7EE7nvNr
         kngQ==
X-Gm-Message-State: AFqh2krKmFfEyvCqqn0QxlQ5dG3rEuTJpQjjyBY59N7hGJtYTQXMd0LI
	FlcCsAcXjuG5/z265kR6PA==
X-Google-Smtp-Source: AMrXdXtGIZMyMSZw03e+bmOg9Y8Oj/r4cyRb0WnmOGtKu1/gqpAeEMcs5kC4BksNyAYUlDV9DBsVbQ==
X-Received: by 2002:a05:6871:460f:b0:14f:a68c:7c6a with SMTP id nf15-20020a056871460f00b0014fa68c7c6amr308944oab.20.1673392676411;
        Tue, 10 Jan 2023 15:17:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y9-20020a056871010900b00143065d3e99sm6496042oab.5.2023.01.10.15.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:17:56 -0800 (PST)
Received: (nullmailer pid 3145655 invoked by uid 1000);
	Tue, 10 Jan 2023 23:17:55 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] dt-bindings: usb: Convert some more simple OHCI/EHCI
 bindings
Date: Tue, 10 Jan 2023 17:17:44 -0600
Message-Id: <20230110-dt-usb-v1-0-8e366e326513@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjyvWMC/x2MywqEMAwAf0VyNtAHruKviIe2xjUgVRoVQfz3D
 XucYZgHhAqTQF89UOhi4S0r2LqCtIT8JeRJGZxx3lhrcDrwlIg2fXzbNi50PoLGMQhhLCGnRfN
 8rqvKvdDM9/8+jO/7AzcoPZdtAAAA
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

The 'ohci-usb' compatible is another 'generic' compatible for OHCI, but 
isn't documented with a schema. Let's add it to generic-ohci.yaml 
schema. While looking at this, I found a few other USB host bindings 
which are simple enough to use the 'generic' schemas.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (4):
      dt-bindings: usb: Remove obsolete brcm,bcm3384-usb.txt
      dt-bindings: usb: Convert multiple "usb-ohci" bindings to DT schema
      dt-bindings: usb: Convert Marvell Orion EHCI to DT schema
      dt-bindings: usb: Convert Nuvoton EHCI to DT schema

 .../devicetree/bindings/powerpc/nintendo/wii.txt   | 10 -------
 .../devicetree/bindings/usb/brcm,bcm3384-usb.txt   | 11 -------
 .../devicetree/bindings/usb/ehci-orion.txt         | 22 --------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  4 +++
 .../devicetree/bindings/usb/generic-ohci.yaml      | 31 ++++++++++++++++---
 .../devicetree/bindings/usb/npcm7xx-usb.txt        | 20 -------------
 Documentation/devicetree/bindings/usb/ohci-nxp.txt | 24 ---------------
 .../devicetree/bindings/usb/ohci-omap3.txt         | 15 ----------
 Documentation/devicetree/bindings/usb/pxa-usb.txt  |  2 +-
 .../devicetree/bindings/usb/spear-usb.txt          | 35 ----------------------
 10 files changed, 32 insertions(+), 142 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230110-dt-usb-1c637752a83b

Best regards,
-- 
Rob Herring <robh@kernel.org>

