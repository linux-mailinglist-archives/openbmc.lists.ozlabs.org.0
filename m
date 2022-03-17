Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C24DD2C1
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:07:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS7Y6XG4z2xtb
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:07:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=bVVJIB3F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=bVVJIB3F; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hv4bjDz30Cm
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:58:03 +1100 (AEDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D6E54001E
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518277;
 bh=KFmifwXJp5W4UT7dzRYgwV6FTL9sctX1thCEx5C+nkM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=bVVJIB3FkauszyqfmODUBc6BD0qp4hCpumD5Ej1Z0ALr0yQtrgkLlxNvu7io4oWLy
 wJMTPN3szveTJ9AmtqGcB3BsZn2w9lEGVMeE+r8J1Go8Zy5BEqkVZhjkYp/+zyx05W
 4jHOOgwixhNQu0mfJarojK+IYuxfRudvoFYTiHHhnfkvdGPE9xCjfJaO18VhY37T8r
 Y8KIRF5PfxlzRPXUWit+mExOdKQXHZDx87nEyLbPzenyHeesZYJrLCMj6av6fvNqR8
 3ydJ5sR4If8ucw64yls7gj8kK0aN+aMbDN2ZCnq1XHNl6HokiVIq9GWkOFKz0iwN84
 HI8XM9HpbCyHg==
Received: by mail-wm1-f70.google.com with SMTP id
 r83-20020a1c4456000000b00385c3f3defaso201078wma.3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFmifwXJp5W4UT7dzRYgwV6FTL9sctX1thCEx5C+nkM=;
 b=vbHk5QONxx510z8yuiUKzXxHMyqUXuHNi9FfIKEUMOxkvav0x6O7np14k4OZSBLrmq
 bzmYCihnaCZkMDLeMNEADDEfWBJDBEktRTaB8NzFpUhQECRZl6jTs0XN7HSW3jTVuY7M
 en5115Z0jEQFyzZGNNh+eVN3GbH5LtKKm4mb69lZJIxBER2stYYxFtcorIEwtsgTKYyX
 Y3M2viGE7XOqZwbob0YMUzfp0vGuFWr/IG/E3m3dCyoBBBBqDXGlaLZeP6/zGRv9trKe
 8TmWVad0tb8+QjSLHjdP7cOSID6nPPW+m0zJqB+Q70Wjb3nZo1A6umAj7u7kH1R+3T5h
 zekw==
X-Gm-Message-State: AOAM53028FMS5diY4XuXlzOSafDHrxv0W8t2CW4HoHKFng2YoIrOkBF+
 n0ingZsEld82tVAwy62f3+myAdinFOcxvBuJ5lk3D8gvyCwWIxEvuObsiZl9/enjhM/YjOAU2kP
 Dzfya+fQWhFPmswL5+NFpUdKMD0FUEEVVacOk
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3663310wry.293.1647518274492; 
 Thu, 17 Mar 2022 04:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQvKKHcnhZqthCpzLO2USNLVXIsLYfJdNKGccVKarN3fEhfI5+MqhVsRHbxfF78ndbEuW0XA==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3663274wry.293.1647518274258; 
 Thu, 17 Mar 2022 04:57:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: [PATCH 17/18] dt-bindings: irqchip: sifive: include generic schema
Date: Thu, 17 Mar 2022 12:57:04 +0100
Message-Id: <20220317115705.450427-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 27092c6a86c4..e3c08cff89d2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -44,6 +44,9 @@ maintainers:
   - Paul Walmsley  <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@dabbelt.com>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -91,7 +94,7 @@ required:
   - interrupts-extended
   - riscv,ndev
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

