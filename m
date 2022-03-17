Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B34DD2AC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 02:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRz34dPDz30Q1
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:59:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=RwNRdCkN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=RwNRdCkN; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HJ2Ywhz305j
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:32 +1100 (AEDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 819343F366
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518248;
 bh=nSwS54FLcijToE2aK+yEI4OGn17JP6PMWHAMiQXMIj8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=RwNRdCkNSpsMDR7zPvErdI7DyjgDHTgMA7YOlRq1H+U9xs9JInOCUIztJgN+bvtj6
 h2quGNz/Nidr3NAGAQZoV0T6vGctUqIHl1VKOHBpHTiOyUAvRQidZgZ4mkyxDOV9qV
 E8C9BoSzbqjzRLGr/uI4NoV2U6TplHzSa8KkB+QxF0fZRGJeaSnyFv8YRWWcTyOdaq
 YGxjKbilkTC/E0D4b15mmLrzyWHuzSyh4CjpAJ/RBd/d5D+15yd8yW/PNfOefuP0iH
 ri0QchYRn54HAbGJLrQ5MeKPtAzLf52LnLlepuBed7+z9mwSl2NUXUjHDxfPoSw2xN
 HezqYi1anQpLA==
Received: by mail-wm1-f70.google.com with SMTP id
 2-20020a1c0202000000b0038c71e8c49cso1933196wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSwS54FLcijToE2aK+yEI4OGn17JP6PMWHAMiQXMIj8=;
 b=rsSCuvDOeAVOFl3c/qrU8FEDIQxyqJ8S/chedRQSCqzskS+JYp3n815Zs5mkZ1DGYN
 3yZIDVDAUTToGNYAIqIy1wvOtBidwcPChU75qql3RUoue1kBzFHdBm0gbmZddopHZjIT
 16ePZJlrtlwSg61E1Q0G8zTym3NrGwXJC9hBDK6QEzJGKb5wTcc+Zn33LAh/vbuj+QV0
 fiIV3O2V+ThtkelwIiz/aLlvPFQuFMXcwoIQzyYRHhJK+adfMQU4k3I7GNdu6dGiaUy6
 CSY4wVK0ReMmalMgfzrdM9JEgQTKOSTkout5nRuJr8n1R6Xeb3MAPLZkUlpvY96thSr7
 XWpQ==
X-Gm-Message-State: AOAM532RgrJ1USMo49B+Dcd0QCp7sPQvJZosz1VpBqgFstvcKgSqgKfR
 kmfCyNEZRzD/3QpJo2NICMBIJv25sPwzARNX/StsK0xVaNVZF5CYkN9u9768GTREsjUTWSEHqlw
 Nm/HqO2TG2X3h4yGEHQVHRj59PPV0Z0GZdVAU
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3661597wry.293.1647518247284; 
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG3c2rG8wtLfvYQbJABDH6zuNp51t36w+nKsTHklu2oA2xBjTj2AvcWZKYkNP1t4hn/llH6w==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3661557wry.293.1647518247090; 
 Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:25 -0700 (PDT)
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
Subject: [PATCH 07/18] dt-bindings: irqchip: intel,
 ixp4xx: include generic schema
Date: Thu, 17 Mar 2022 12:56:54 +0100
Message-Id: <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
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
 .../interrupt-controller/intel,ixp4xx-interrupt.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
index 14dced11877b..38290b38e13e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -21,6 +21,9 @@ description: |
   families were the only ones to reach the developer and consumer
   market.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -44,7 +47,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

