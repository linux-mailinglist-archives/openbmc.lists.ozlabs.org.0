Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC194DD2BF
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS6738jFz30CT
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=TWwjcdMC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=TWwjcdMC; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Ht33kXz30Bl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:58:02 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B2D173F62C
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518279;
 bh=9NVaJhFyk/7XIToYVXJ7m5aI93pLstb15hWUEyZBYi8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=TWwjcdMCFWiUs+KkO3v3X2hDgH9Ltol1uoouQPpPi0EULbzge4AgFgmOmHJ7OTpb0
 Tp2G6lJrMx89z7oeBVu3DylMF9oo0h+I279zBJNxwjPBEv9btGjGXvP2rgYCeemjOt
 CYoOaWVSeaI89qgDgahxpQXmJ9CrHplPFZNXEx0h8ncSPwM2ltRO6kJwH3NW/F6bjo
 XlLGdi+3u59wVIarv8s48rnr/9cUUNraVROj3ty0Vn8jn8BNpwIPJzjd8mzBl7j1aT
 9PhBUMHk7wE7bQqIk6ICsV0ET19iBpXg7Kwaj2+JfissmEJBjrkVWDhrJ+dzUtMUAf
 7e+Pjj6KAu4IQ==
Received: by mail-wr1-f69.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso1458580wrm.18
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NVaJhFyk/7XIToYVXJ7m5aI93pLstb15hWUEyZBYi8=;
 b=HEodY1xhXsA5Zd4CQdv7yRJihy5kmUTqLMCZsNG+37hU0s9oa6LYkvEK1ErpC1fl4z
 /8XUKuWm/SPWf4nERuqlYiEqXv+SIO4rIoaEpqE87xP/tH3Ec9JO3Wq23XrbaLdTP9vM
 W0APls8mCi03C9cDzFzfTjEK6Pf+3nwOi2jz01SFQLnht5cCmp2NMIkeyT8rXOvSeZyO
 AEMqral/c536l5aRr5JtEIGH2bi483CWZtG9mquNSVSMAQ88hU7slR7FSr6uZlZKjHr+
 Q4UkPmf/pXYMjDp8MMT+5LJOu2t3l6XjBt4Zo5M3IpMXPYOEezszxf/yVFGTsUf6PiM6
 ZONQ==
X-Gm-Message-State: AOAM5304Ga3xwlBpO+B4HccyKAxqwBUSwpV7uMLkBqMdAI/ZBrokpCLa
 uNdWp3JiDw7fT0IZi/4iQ6t/eJYaDhHWlCdrJJm7t4oDWRRerVFZGGG3rDueqmP5QKRi6YUxheX
 LBzTSLOGOhd607jlomnqasxkwZ5Ev2hBCPm9s
X-Received: by 2002:a05:6000:156f:b0:1f1:f99e:779e with SMTP id
 15-20020a056000156f00b001f1f99e779emr3699072wrz.99.1647518266500; 
 Thu, 17 Mar 2022 04:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVAcTeO15IweAkScwvNQ6HG8sMEO3vGt45XqrwFfDK9yidy0suv6zYu7bE0rR0hIs55pTgQ==
X-Received: by 2002:a05:6000:156f:b0:1f1:f99e:779e with SMTP id
 15-20020a056000156f00b001f1f99e779emr3699013wrz.99.1647518266228; 
 Thu, 17 Mar 2022 04:57:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:45 -0700 (PDT)
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
Subject: [PATCH 14/18] dt-bindings: irqchip: nuvoton,
 wpcm450-aic: include generic schema
Date: Thu, 17 Mar 2022 12:57:01 +0100
Message-Id: <20220317115705.450427-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 .../bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml
index 9ce6804bdb99..285c20de0962 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm450-aic.yaml
@@ -9,6 +9,9 @@ title: Nuvoton WPCM450 Advanced Interrupt Controller bindings
 maintainers:
   - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   '#interrupt-cells':
     const: 2
@@ -21,14 +24,14 @@ properties:
   reg:
     maxItems: 1
 
-additionalProperties: false
-
 required:
   - '#interrupt-cells'
   - compatible
   - reg
   - interrupt-controller
 
+unevaluatedProperties: false
+
 examples:
   - |
     aic: interrupt-controller@b8002000 {
-- 
2.32.0

