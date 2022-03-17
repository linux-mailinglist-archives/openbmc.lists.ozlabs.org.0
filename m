Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B83704DD2B8
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:01:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS194CgXz30Df
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Xjvdv+Ok;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Xjvdv+Ok; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HP4jcgz30Bl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:37 +1100 (AEDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 64A153F625
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518255;
 bh=rkZlJ0igM03Y8VkMiNizWzNDbnqGn+aUyjhq4DWqgik=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Xjvdv+OkUwW7yZJeLNnCKGE5WEwOL7LyvwphAhGFP13EzvIgbkiWZ4LuPozL/XbSm
 hW3Svg4KotzhuoRm1WOGeH6/gG5fr+QSDloCh5N4bzrzAUTqJHEuxNpgI5L+trQOKd
 Ug99Ipse3lNuAnXjJtPpBIsxCROnvwXQN1ZkEBgWwWQrpR88Zth/pTrTRiFxqoWjEh
 H1Tj9qDn4neRqMdknlOT7mfrs1NpDqN88u3tPIyAZkkv7oW6T8EAfIDmxqJE85xDuJ
 RonMQowSEQWFA9M4wC52vld9Zb8OI1tA1HLxTaF3nzN2uUe90YIK3y6gg97VfKQd7F
 fFNYM6dbtNcEA==
Received: by mail-lf1-f69.google.com with SMTP id
 f27-20020ac251bb000000b004486c507f80so1742782lfk.10
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkZlJ0igM03Y8VkMiNizWzNDbnqGn+aUyjhq4DWqgik=;
 b=NbM6Nr4GBtIiDOoTWQiNf4uhDN/qPSnvDTa/fGSs8ayFPqblKEehf5VGfqSozOcAOL
 ylRUybpVCzLdTcvRZGPF/ggkUKq+1a8JIKq728zsZMJN6Wo+LziZ1MJg/osG43IJeDgW
 92i0yUU1rnBBApxmsuU7xI088TezQpLElf8zMVresClAiEV7T+xkr0Zh+yA8Rz8tgRoc
 /DmXXafz9Rg2uDSjbro6ASYhBDOUjpGiIgrxhacwa6i9cvaOGIJxGTzteUzIAGuGe9HK
 xDRlC3ilJ8RquOefB317xSPa8d+Lirp+5AxBUlQYQLCEUIkWTdbfaObZfMPVlpiw3Gqk
 bD7Q==
X-Gm-Message-State: AOAM531WDRmN+uanEv7nUo6lPP17R4OeXRivrFU6kDA5mgHX3zSh4W6L
 I4fDucfqjh6HzVgWFEN56H/WRe6w/UrMfdcdL8tqGwmb1MrnGmQQ+YJjD2wj4uItwerem6LafX8
 vAlDugfP78OUgsPNRlWM+fMIFaj8qJayV+U0X
X-Received: by 2002:a5d:608e:0:b0:203:e8a3:36f3 with SMTP id
 w14-20020a5d608e000000b00203e8a336f3mr2822216wrt.176.1647518244238; 
 Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPfOj+UeHfKmqSbS2Hx8bnxirl/NYvL3z9HsIpNergGiYK9EsV7ImtjHZaqXnE8okb/mRUOw==
X-Received: by 2002:a5d:608e:0:b0:203:e8a3:36f3 with SMTP id
 w14-20020a5d608e000000b00203e8a336f3mr2822186wrt.176.1647518244048; 
 Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:23 -0700 (PDT)
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
Subject: [PATCH 06/18] dt-bindings: irqchip: ingenic: include generic schema
Date: Thu, 17 Mar 2022 12:56:53 +0100
Message-Id: <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
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
 .../bindings/interrupt-controller/ingenic,intc.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
index 0358a7739c8e..74597a98f86c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -9,6 +9,9 @@ title: Ingenic SoCs interrupt controller devicetree bindings
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   $nodename:
     pattern: "^interrupt-controller@[0-9a-f]+$"
@@ -50,7 +53,7 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

