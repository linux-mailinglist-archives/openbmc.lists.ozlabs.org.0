Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830B4DD2BC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS413FtSz2xsc
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=KwhLc4y7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=KwhLc4y7; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hn5H0tz307B
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:57 +1100 (AEDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2AFEA3F61D
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518275;
 bh=AiHDlYAYl7vWuI/w9+Je6flygausyauwLZYAswD6HM8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=KwhLc4y73Mf4HtCDdMvC6jw0ZN/G2+tRBUitJ/D+jnQ55NF5F8p/zdpGcwr3VjvFN
 Kqb46C4Io25YIr9U47FMw2+3pMXGfVTRHma8dpIoV7VqoTl980u7YJV2OF7QNE6MvS
 rLwDcMYMDM437EEmP2Yqehe7mvxXwbSFWrY+Ur9SNdBIJRi8ZbhMe9MCwZoUsfYLZ+
 ekrvz8TuH99YoRQFYVwCJWzq7ofgsx07iGJFq3Us5WTVMuOvrlkC9KR1G1GFgUtQ5r
 6BYpxBV/dW2MbUwJjbCEXS2MoIZJt3B6TAMtlJ1G1CXeGo6Fgc+HvfcUa+/Uy5s/Fu
 BcGgOqJ4UxOqw==
Received: by mail-lf1-f70.google.com with SMTP id
 w25-20020a0565120b1900b004489048b5d9so1741490lfu.8
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiHDlYAYl7vWuI/w9+Je6flygausyauwLZYAswD6HM8=;
 b=cS4Au6YgRelK7Ct3jOrMMqWMYjpThulxyHmHe1lKb7fGY/CGIjOYP26pyHkDQI6kzB
 IdBv2UNVwMuRXhSRQGK5iQEaTW9c/2ILlHch3TAcp1chvHzASNjlAMXuJLzGsQPqW1S2
 6f20SbiSxyO8XIF6pXGzVGNCgpHsVNxbwHC/6SzMkFCy9pwp56D1Flh6ai/oYcuYx4oU
 AlQqf+wux7fRt+jZaEvSnnrKxbxt/aqs9FvJmY/usGR0ajxDa7ITlvH5LxJ62fJVI7+u
 VclTXyhbFyM6GBOycJmilf15LoBeZlac4IcuzOcMozhY9Tyf8Q3qTvlK2UAl+TnnsDgM
 rb4A==
X-Gm-Message-State: AOAM531JenxS4mhXwt0t6wAcvRyqpSFQ2tvsQ9JN3rInXghscRM8FXN/
 5c1i+REsHQ4AYhMDD2nxXK6EKaofKU9oOSYRHTTNcImNJbYPKuvxEAqFyIcm5Efi9Spcq7rHI0f
 45dSPalq+N7Sqd2gA2MWV8UfDYAOAo3+hYztD
X-Received: by 2002:adf:9123:0:b0:1ef:9b6d:60c1 with SMTP id
 j32-20020adf9123000000b001ef9b6d60c1mr3679233wrj.169.1647518264136; 
 Thu, 17 Mar 2022 04:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy83F7kPkAkGVyjO+KTdOeUdR+4CCrIBL1sfHo6WvsJ744fdOezCreCsgf4wqag4r59ItpL0g==
X-Received: by 2002:adf:9123:0:b0:1ef:9b6d:60c1 with SMTP id
 j32-20020adf9123000000b001ef9b6d60c1mr3679179wrj.169.1647518263842; 
 Thu, 17 Mar 2022 04:57:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:43 -0700 (PDT)
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
Subject: [PATCH 13/18] dt-bindings: irqchip: mti,gic: include generic schema
Date: Thu, 17 Mar 2022 12:57:00 +0100
Message-Id: <20220317115705.450427-12-krzysztof.kozlowski@canonical.com>
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
 .../devicetree/bindings/interrupt-controller/mti,gic.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
index 91bb3c2307a7..d29c2a924acd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
@@ -16,6 +16,9 @@ description: |
   interrupts which can be used as IPIs. The GIC also includes a free-running
   global timer, per-CPU count/compare timers, and a watchdog.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: mti,gic
@@ -95,7 +98,7 @@ properties:
 
     additionalProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.32.0

