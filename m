Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 794734DD2BD
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS4k2gZzz30Dv
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=PX+BNk7A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=PX+BNk7A; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hp5Sjsz307B
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:58 +1100 (AEDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 11C134003D
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518273;
 bh=nw83rNQU0DG2T5abexM+HrA3AT5FpHyglSBWAvBerB4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=PX+BNk7AXBlFX3rexADzGUt6CS9XYQXADMOUzPojwWzpDNnZOTar4JxU/KG5dAywp
 CH8Fg91XihluSVGPzph+ds09XXGTU6woJxjHyV5pRSzW/bmT0ymPtmOULzVZpVrzmg
 golHaNluiKh3wOxdACw2q5/0ZI8osYiFyJKtKMOCPydCBgyJzylPpY/MVUquCdklQB
 v3gI+PvoOZlzKXFacxUGQJUGTxl2PYo50Zklm7+/SbW1yVUUxN+gX1m6eXjn/o0KiN
 /2p+6dFxugyAZGX20AHRoC5RYPp+wrzZi3GFoHpaNb/gUFPZIb8fz+Ga48ntyhukDv
 WjMgABwgZYJFw==
Received: by mail-wm1-f72.google.com with SMTP id
 o33-20020a05600c512100b0038a1d06e525so4197568wms.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nw83rNQU0DG2T5abexM+HrA3AT5FpHyglSBWAvBerB4=;
 b=ws5HT1F/TlQEC98c2gLCe9DJq4zUV4mPto+UxxaEw5/UHz1UrK+C9Zm6zJTMyEUcwT
 JsxE1PddD8dep8WZKZMVfZ1U4kYlr1MUDX86ScZZyxvb9xBgkIqCZcQrkaAEuOX0HosG
 M98QbIO+dWU59+4e4XkUsg6Q3OSMB1AqRGXWqlDjFG90smZR8y9PWfX3ms/nThSkjGxT
 +utz7ITc5NURae9eELqPVDhl5HcDuk3EwXXLqTMCi/KstZLUw/WRG5RD2RMmW/EK5Xxm
 4aye8LKG2CiG2/7GoWWV4SJipiHhuHLKtsmYUQYOvn/WUi1gpADx+qKp5BtOvU9yAQqn
 8IKg==
X-Gm-Message-State: AOAM533LNmC6jyeb6NLKkpa73uTlnUMoaE6X8sDG0MSJGx/ZpXuOv7/w
 al8k8V9UZt/E9NlpM9r/0OYsSwrBov8G5sAFH4eZ9D62L9gp7mFNQNHZ4psaJbgkWUkSnbZ/Tf5
 c7FsnyulpqOCzmLLs/yJ7JmjCjZbBn3eqDT+H
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr3610501wrd.675.1647518269081; 
 Thu, 17 Mar 2022 04:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjFXvDvHdQ01w0zg1EFDDh642eLMUzgHUDqkxXLdtcKH+7Ko3TzWiEFBj3msxkYp0Y5lUMFA==
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr3610457wrd.675.1647518268881; 
 Thu, 17 Mar 2022 04:57:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:47 -0700 (PDT)
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
Subject: [PATCH 15/18] dt-bindings: irqchip: realtek,
 rtl-intc: include generic schema
Date: Thu, 17 Mar 2022 12:57:02 +0100
Message-Id: <20220317115705.450427-14-krzysztof.kozlowski@canonical.com>
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
 .../bindings/interrupt-controller/realtek,rtl-intc.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
index 9e76fff20323..4c00d44923b9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
@@ -11,6 +11,9 @@ maintainers:
   - Bert Vermeulen <bert@biot.com>
   - John Crispin <john@phrozen.org>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: realtek,rtl-intc
@@ -40,7 +43,7 @@ required:
   - "#address-cells"
   - interrupt-map
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

