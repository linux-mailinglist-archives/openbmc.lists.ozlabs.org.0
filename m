Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD44DD2BB
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:03:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS3J0Sqhz2xsc
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:03:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=e/R4vJeE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=e/R4vJeE; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hm1890z2ynx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:56 +1100 (AEDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1407640019
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518272;
 bh=rNPhuRf5ngVysv5h7hhTqAiAE83hQk2gXfYYF3Wf2Pw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=e/R4vJeE+t7fG34KL8XTtwldn6p042kIiEK2zcs+D3qCoKWhKuDsXXH+0WnERbw20
 kUVErdMqzMpXCMOmpJDbGiUeAz1HQwuesas8PXk4bprGf5Li/XW9pULn/6ARt8YR3B
 o0vhjTh2JZkff7PtjU1a+gqlqWdx7+G+PGOGBizEmAirgi3U3SO7ydT93kQlvXhGRo
 khCQPjq3eh+Y0FvoHRBBEc9wTq9OigMnzor1UgALvvypEIGzqArDW4jtaWq86GrcJM
 6+AhmTSqXVijHQn/GZg0wqP0gxrsxTyXkMKceXGQAnmdW0ef882nOaoLmxX36sD+RO
 DpbRbG5Sj1RjQ==
Received: by mail-ej1-f72.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so2754042ejc.19
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rNPhuRf5ngVysv5h7hhTqAiAE83hQk2gXfYYF3Wf2Pw=;
 b=enFjNLgdUGshSUo8lt9aon/GWSuyOFiTfQnsjRN8VmgmQOkPK/UUf7+e6qtSmhruCF
 2AEo7JxMPAaSlA8z/bzTo7C5BVhOZdVI9qz5yMLi1kQQECPQ98IwDh/k0JmAlzSra6jG
 OJK3rzL7u0Ud5WFAVl8LwMzmemqG3LUZrXNFkR7fp3nNAVoWUGln8qRnTByvGiAuE2+s
 o8YEwiwlN/8O+GV9GbkdqnsKDbVMDcUzjhtqD3bTc6xjeQCkn2pGk1BxA09IbmvaNGkK
 QLO+COpQBqvMddsCc+hkSM5UHPwYW0vHO4s6ogaes9KTn3v7dyX+mSSN96Xbv0iMRLdV
 vPNw==
X-Gm-Message-State: AOAM530JFHfFxAuekAniYpz7aJ/e5XmO4sQcMNy8ecujHN4ObnmA+56e
 rARvkdr4lPS1NSZRzyhBPRpvc+u0ygeWw8GnlNK6TWE5F/K0sLay+TUCFJaKPWWEdXdKRjmX1vu
 evzP/yWITLM7uXVTfR3mby/YKulYUukvo1oCk
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr2873016wrr.626.1647518255821; 
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJWLmgNrQUKThJV49TI08A7H7CIaB1l7x6JOg6T/2nRMoUdn5TzspKyhMYRW0dfNfwamk6BQ==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr2872982wrr.626.1647518255579; 
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
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
Subject: [PATCH 10/18] dt-bindings: irqchip: microchip,
 eic: include generic schema
Date: Thu, 17 Mar 2022 12:56:57 +0100
Message-Id: <20220317115705.450427-9-krzysztof.kozlowski@canonical.com>
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
 .../bindings/interrupt-controller/microchip,eic.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
index 50003880ee6f..6ef8632b3f5e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
@@ -13,6 +13,9 @@ description:
   This interrupt controller is found in Microchip SoCs (SAMA7G5) and provides
   support for handling up to 2 external interrupt lines.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -51,7 +54,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

