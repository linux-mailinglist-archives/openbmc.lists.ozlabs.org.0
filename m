Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35C4DD2AB
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 02:59:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRyL4H2Vz2yyf
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:59:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Fo7DIXt2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Fo7DIXt2; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HJ13Mpz2ynx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:32 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE8AF3FCA3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518249;
 bh=q6L0pTvWqCbYxp4ud2xHQC7gNboKzwtZb8Qa+W91MLY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Fo7DIXt2CuI2A+yUTzEH7v6aQoKqFRzwvlxyc4/zdeOdlAJjnEWHtvp9OSV9Mrz+w
 7FfS852KsE0cH42IhGDXdLZGsQ7Ypf0B4Y15lleAoLZLwgl6vWtnz1IZ8P1AemNi3b
 QRGn6yAn4bi2w0zQffaxyp85KKqeVpv6V/nYnQopD2ttibi4rrLthaxVZUDnpQTqt8
 8IB3D6ljY9jluKLL/IDg6XobLpGEn26cElKaKzYUma+uPvQeGVroL5LWAFFd8993LM
 QDI1VjSfbsvUaodMIkRrbI14MPOBtrQZzdkt+xMNasa54dQP9MAV6lAbWBtsJXK6v5
 60z4+Sf7R9BJg==
Received: by mail-wm1-f69.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso2181140wma.7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6L0pTvWqCbYxp4ud2xHQC7gNboKzwtZb8Qa+W91MLY=;
 b=EFjZBlm1rowHTKrvO4u3xjhl/AWEf+KnZfpyJ896Wz7zuqmwL9QVDoEwO3T+l6ug09
 tQ5Sckgy8HeWBnXvWuBVLTjoEEHPHo9MuN6i/zmTTzBEVHAPnR9vNRpBzL2kvRDGp9fW
 vR7KFHFVIi+rqXhjJul5Y1KMGFmO9sjGvHJY2gi5ddgmmmd+NFppsfdXxMYrDk7QNU4X
 Tg/HruxrGprufKXqQDFhf23eoTHQ6GKk5CaQNLMxX3fnvxL/xzFdXhGni7KgSnrQDHzW
 6lyeiPUmwExTehLt48QhMHW5OcVhrmeGWncQMsngyhNsXITpdIUJI7wqqexOtii59yS4
 CG9w==
X-Gm-Message-State: AOAM533Q/LD98C0HotqnrYGm05XL9+xSQp23u1/tPAbNYLNsD68jD+bm
 Je1Dj2tGJzHQnY2au2rNiD8/Jzzjesh48cDaEiyhyKYuMRwvpzSjtTB3hBMH7XukRsHIBoBIHh2
 5y295TpeyRLm9THZaKyC7vHYgDkpMUUPAXbhU
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2376106wmc.94.1647518249486; 
 Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX1jxnKZiD0NuCgy5RBXKK6my/n/GYxN3iuUU96hXmDCoERczZgFOzB2MQI7Nkvxk6j0Zexw==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2376082wmc.94.1647518249282; 
 Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
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
Subject: [PATCH 08/18] dt-bindings: irqchip: kontron,
 sl28cpld: include generic schema
Date: Thu, 17 Mar 2022 12:56:55 +0100
Message-Id: <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
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
 .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
index e8dfa6507f64..1d0939390631 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
@@ -29,6 +29,9 @@ description: |
     7  n/a           not used
   ==== ============= ==================================
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -51,4 +54,4 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
 
-additionalProperties: false
+unevaluatedProperties: false
-- 
2.32.0

