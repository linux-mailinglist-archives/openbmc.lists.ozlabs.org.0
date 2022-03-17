Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4784DD2B9
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:02:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS1s4Mz4z308B
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:02:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=b8cMpOSW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=b8cMpOSW; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HS73jXz30BV
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:40 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BAF273F603
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518258;
 bh=rPrab2m6ZRJ1Nq2pMdTzGXWaaBF6CBXynVgpKRpBOdQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=b8cMpOSWTDooaca4suw7GNt24B746mPD9wStpJxntOFReNdhOROcnC4WHPxjFpF4V
 lzyPoWiIdkRwliKyMXcEbzy52yKQVeTYhmiK1ItmsTJgfAVhYKs+QluopqzsvZHdfX
 aIksg0wZW9g9D7BNBqFeufUqPTpQcEw5tlcpnperKAzBoOo6aNNsg48nNp5bLxgvIW
 8pqVqk/aGOswVvabLTuvX5UhIsZ5TollZY6uijVoMtM5n9De3H4kouU9ashax2wgUm
 9wto/dXbfohnkF7VfhU1zjqSnJYOGT4cMNyVR35cKZ09j1C5rFwwbCECRglpAl9+W8
 FPox+HCYIFl2g==
Received: by mail-wm1-f69.google.com with SMTP id
 2-20020a1c0202000000b0038c71e8c49cso1933431wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPrab2m6ZRJ1Nq2pMdTzGXWaaBF6CBXynVgpKRpBOdQ=;
 b=6O4Io/eXskZs+jOpqmWgrgHdz6ZneD4iYh4R+zrbXfpJkOfuiz8jY9WposACV7psD2
 39q46tEE5lkUK0a2Q2QG7Kez62xLRkEPgtGjZtj/b44gfcrjMXCo5LoWLR507aLq9jLV
 eN97AGlcNEkjyyPFapjNhymanLE2yY0ufy0HFBUEGT7Bv/oPPnfb/C641EHQRbS8sdI0
 +0ogv/Mzw7GLRIdQpK8Cnl5ZlFgM73IHuaQV50H37IL0PkQ+IrVu65Q6hUsKde7ihbqq
 Y8flRDGQ35oA63ME/YuN48uR5XFnbKqXMhFH+ehs/vh8GlqVq8oyT07+KPinbe5zCyN5
 A1Xw==
X-Gm-Message-State: AOAM533uup/+1kMXG0VVkp1yliWOnqxZRql/naz8KX6G3lDPKvqu73Ys
 sU0zR+lnvjW3EKWcvY4aCgnplbz3HiVJ83G3sq+yHZaXgjtiLqdr1kc7F4w7N13o/HTdvVk2qqj
 9DUhMmFoqgFKERu18pxXNTynaf4vd3+bv1QBf
X-Received: by 2002:a5d:6d0c:0:b0:203:8aec:9676 with SMTP id
 e12-20020a5d6d0c000000b002038aec9676mr3866424wrq.601.1647518258333; 
 Thu, 17 Mar 2022 04:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCFbJKUv1ZFo1+EZDHVZjNF5kTsPX4saRLzzvod+Y5Qcc436Gbn7v60O8I+x1+ugbTJ8av2Q==
X-Received: by 2002:a5d:6d0c:0:b0:203:8aec:9676 with SMTP id
 e12-20020a5d6d0c000000b002038aec9676mr3866374wrq.601.1647518258073; 
 Thu, 17 Mar 2022 04:57:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:37 -0700 (PDT)
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
Subject: [PATCH 11/18] dt-bindings: irqchip: mrvl, intc: include generic schema
Date: Thu, 17 Mar 2022 12:56:58 +0100
Message-Id: <20220317115705.450427-10-krzysztof.kozlowski@canonical.com>
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
 .../devicetree/bindings/interrupt-controller/mrvl,intc.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
index 372ccbfae771..75d49c9e956f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
@@ -13,6 +13,7 @@ maintainers:
   - Rob Herring <robh+dt@kernel.org>
 
 allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
   - if:
       properties:
         compatible:
@@ -101,7 +102,7 @@ required:
   - reg
   - interrupt-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

