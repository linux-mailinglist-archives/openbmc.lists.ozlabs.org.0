Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6458F037
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 18:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2w8C1mmzz3bkG
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 02:17:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.47; helo=mail-io1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2w6y54Blz3054;
	Thu, 11 Aug 2022 02:16:41 +1000 (AEST)
Received: by mail-io1-f47.google.com with SMTP id z145so12525156iof.9;
        Wed, 10 Aug 2022 09:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OymQtlIn9kZlALxo/zpxpVBZn4m4pQcHISZuq81uRio=;
        b=45j5hCRtqMUzI5CEdUATO+yF6I6GSQg45l2eT8yCQJ6/VplIjrS6zPfmrUh5C/s94p
         D0h3sn+XVlNkrxPyKuY19ddKVTZg3/7qf/qvtqeBd2/m3qlJ0EYZwXlkhDzSaw7StyIO
         PbJQm4LRQApA7jdHDpJg5Mu5w5Fud19mk5iDYV0mhhQo3ZXMyFmctw94t/WtTT10bobS
         G9FOM/f3KZPh7kdE36ZZPF2Mrt5JKWc9uoV3KNnb8DhjlsCW8zsQ/CNXtKNs1Trg9+jl
         pNgonnYOTmfn+NIsd0xmkcSuZOoDjQTbJZ3OfI4ix5PyE88NZHpcEvxKpzyxsAdkKTZD
         V3YQ==
X-Gm-Message-State: ACgBeo2XFuP2CXsmbDldGhqn+mso+u38FWtb0qtjXTuqOop7J3ziVhaf
	LJCIfBzpJTTzgb1uZQwmDQ==
X-Google-Smtp-Source: AA6agR4KUEtY0qAyGhNW2eFu0jzbjqmIighV7qcuqPWJtLkc+jLRcrx7+pJAVcN91xpZjv0I7uWyOg==
X-Received: by 2002:a05:6602:2b8a:b0:67b:c57f:b4bc with SMTP id r10-20020a0566022b8a00b0067bc57fb4bcmr11332902iov.55.1660148198176;
        Wed, 10 Aug 2022 09:16:38 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id z17-20020a056602081100b0067885c5fd94sm2496974iow.29.2022.08.10.09.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 09:16:37 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] dt-bindings: pinctrl: aspeed: Add missing properties to examples
Date: Wed, 10 Aug 2022 10:16:34 -0600
Message-Id: <20220810161635.73936-2-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810161635.73936-1-robh@kernel.org>
References: <20220810161635.73936-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The aspeed pinctrl parent node (SCU) in the examples is missing various
properties. Add the properties in preparation for the SCU schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml | 6 ++++++
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | 4 ++++
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index d3a8911728d0..f4f1ee6b116e 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -63,6 +63,12 @@ examples:
     syscon: scu@1e6e2000 {
         compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
         reg = <0x1e6e2000 0x1a8>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6e2000 0x1000>;
 
         pinctrl: pinctrl {
             compatible = "aspeed,ast2400-pinctrl";
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 5d2c1b1fb7fd..8168f0088471 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -82,6 +82,10 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6e2000 0x1000>;
+
         pinctrl: pinctrl {
             compatible = "aspeed,ast2500-pinctrl";
             aspeed,external-nodes = <&gfx>, <&lhc>;
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index e92686d2f062..62424c42c981 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -96,6 +96,12 @@ examples:
     syscon: scu@1e6e2000 {
         compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
         reg = <0x1e6e2000 0xf6c>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6e2000 0x1000>;
 
         pinctrl: pinctrl {
             compatible = "aspeed,ast2600-pinctrl";
-- 
2.34.1

