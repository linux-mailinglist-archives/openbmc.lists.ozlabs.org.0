Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCB4DD2B2
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRzl3qjsz2yyn
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:00:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=f0NqmQAJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=f0NqmQAJ; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HK6hnhz307B
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:33 +1100 (AEDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7DED03F312
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518250;
 bh=aSGezm1yIxV4XCs71xtI5EKoFHjXL820ywE13DRNOT4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=f0NqmQAJ23jClgd7si4juDKlxMxEL5b93VDk4MRehpsomhhXEtpNuoKTmOi9Dqe4v
 6TAchCgYzU4K+AMaHsK2OultVL96oVUF8CCMR73Z5zNJHborF/qo3L2mTt/5L6PNM7
 MiSdOV/DoFBkoMlP7Fs6oAgzqdfxaHKwX9YeQV8C4FY76gAkkPwVSa3XLdoH4Eb5hJ
 Uztpn6AFFRb45k4Z7dkBcl+m927SXlyhjxGoQEt5wsJjW1sehUSjU0G8xjlkQblYBr
 A8z8r+dm8XBqppB535TYgDNqnBKQvM1paHq5yUtO/+y2OrDl8kJnHs2UCyFJVpLduu
 kgzKbMcaOjo6A==
Received: by mail-lf1-f70.google.com with SMTP id
 w25-20020a0565120b1900b004489048b5d9so1741114lfu.8
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSGezm1yIxV4XCs71xtI5EKoFHjXL820ywE13DRNOT4=;
 b=v6jySm8eKmilwzx+ZdfR6bGs7PRmFi6aF5lqWwcr432nJ1zNByjUZzo/q9ST17hFz8
 0gKlpld4v2BB4P5atcB6b43FJCqLv016CT0AMyB3CCekrGSwnMsiy21ikANVSydcdAgf
 4a0/5F06Y8JnLXpKaCaKwz7XJKwgK+mGDU5c/F+ATr+5Iub9+L7QLWxrgUTqJf2WVTfS
 wAKI2+fRj0PJi6lWSE74g5pXTm+ptcUKmid+ipVWgME3fGknqG3XKSOe3eSY9NLNvKW3
 svP8HK7biYeH1L9q2rinFx4i9Nuekj85He622DrTZUAm0lV9C5zGqqOh4RWwWCkXi/tz
 evfA==
X-Gm-Message-State: AOAM530cqiV4chMAQrGlj7nv31lHFyT0etepYLzANoc7y7QhyAVs2g8Y
 tx1Ur7xvWYY0H9f8+rxtUagdNMj3LDycd18kVIiEwgKWX7kbPr0VVz0+TajQPgQrw4aVJTYbSR7
 6hkKGllFnNbvwzSOzUyY96Bxo/BF8GfIRlxEB
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr3777959wrb.270.1647518238540; 
 Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2T8BZ9r1cayLerGnUvxU9+ZIYyhi9vmiexAY/nI3LK3OqgvQvruoxbLO/RKMhjARnY2yv2A==
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr3777906wrb.270.1647518238317; 
 Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:17 -0700 (PDT)
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
Subject: [PATCH 04/18] dt-bindings: irqchip: actions,
 owl-sirq: include generic schema
Date: Thu, 17 Mar 2022 12:56:51 +0100
Message-Id: <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
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
 .../bindings/interrupt-controller/actions,owl-sirq.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
index 5da333c644c9..c058810cf475 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
@@ -14,6 +14,9 @@ description: |
   This interrupt controller is found in the Actions Semi Owl SoCs (S500, S700
   and S900) and provides support for handling up to 3 external interrupt lines.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -46,7 +49,7 @@ required:
   - '#interrupt-cells'
   - 'interrupts'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

