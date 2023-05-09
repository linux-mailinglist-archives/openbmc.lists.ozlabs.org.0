Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD017043D6
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1Q70mgLz3f4v
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:07:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sam+crre;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sam+crre;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFx0s1wrPz3c8f
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:35:25 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso6433477e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632122; x=1686224122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QQeh9YjZzNjrXQibFSAmN6bJH27K6sErXcLxHfNpn8=;
        b=Sam+crretoYBxWHA4qS3k5/sYy/9YNnNDeOcT/ax6idvKykJaCktFYNZ0iU6e8debI
         B8DvJGdp1lL3Q7x5zbpU5gXoSw53k9Ch9CLd1ox4Z0XpstyGRuMY0jd47E1L/eoeTtLi
         hyCkyvBViRBW90AOQReNZeqrscn3rogJXPMFlMm3HeRi7zJGYsvW5u0Dw7CtEC/mJGve
         RS0Mg6lh3GQw0reca5/4SrH/9HdIWYtkje+PabbVny0Z158fzPPjMkcwOHo3XQEG2cVA
         SjPjIPX5M11qNKaKPNIeqAQOvqo0H0DPctFCbD2iK5JPG0LYGFH5dl9SQTIcaJra+uYW
         qqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632122; x=1686224122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QQeh9YjZzNjrXQibFSAmN6bJH27K6sErXcLxHfNpn8=;
        b=lBdOfZCKLDwxpOHpDtcQUdUPhorw9Dw/yz6ntuHVcpy3C5N/K0giOT6+5dWmYZNfPq
         0qyseYbHtyfojhI/Bba9B9X71CPg7gVBisRmW8TyS19j5FVayTbiZEXV7v+UCjq2gsKc
         gyIb4rABA1vSin5J9n6nSEGb4PaMEo5eh9LeUUnLNaOEXd6RC1u5JVZUUbzkEnIvSNtt
         iYvhlJV7riLJqYenFD58kgzewAMcV1lBeXBDuyBfkHhBpzDSEN1nuFQgIZU+vUMyApUZ
         5HI+Ysz/McKHQxKKV+NFhc86GYK9Y3gqJtivg+i3f/B7myiAdQgzvLuctxI9EeXgT8j1
         ehqQ==
X-Gm-Message-State: AC+VfDwTS7z08J0fvt8blvedP5OAXGc+fQ8bcIha+Oot/RLtkTip+sRa
	CT6siFGmCqjieFcOp+U4iCE=
X-Google-Smtp-Source: ACHHUZ53BaQ3IWMDiSD/9ydEo3S9fenNHEm7zgrZw941KuYic4L3B4+t1YiwvBZYRXPaOZh79K0r7Q==
X-Received: by 2002:ac2:5623:0:b0:4eb:30f9:eed7 with SMTP id b3-20020ac25623000000b004eb30f9eed7mr824674lff.22.1683632122133;
        Tue, 09 May 2023 04:35:22 -0700 (PDT)
Received: from localhost.localdomain (93-80-66-133.broadband.corbina.ru. [93.80.66.133])
        by smtp.googlemail.com with ESMTPSA id k16-20020ac24570000000b004f25ccac240sm108940lfm.74.2023.05.09.04.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:35:21 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 5/5] dt-bindings: net: ftgmac100: convert to yaml version from txt
Date: Tue,  9 May 2023 14:35:04 +0000
Message-Id: <20230509143504.30382-6-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509143504.30382-1-fr0st61te@gmail.com>
References: <20230509143504.30382-1-fr0st61te@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 May 2023 13:02:57 +1000
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Ivan Mikhaylov <fr0st61te@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 .../bindings/net/faraday,ftgmac100.yaml       | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
new file mode 100644
index 000000000000..98cd142f74bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday Technology FTGMAC100 gigabit ethernet controller
+
+allOf:
+  - $ref: "ethernet-controller.yaml#"
+
+maintainers:
+  - Po-Yu Chuang <ratbert@faraday-tech.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: faraday,ftgmac100
+      - items:
+          - enum:
+              - aspeed,ast2400-mac
+              - aspeed,ast2500-mac
+              - aspeed,ast2600-mac
+          - const: faraday,ftgmac100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      In accordance with the generic clock bindings. Must describe the MAC
+      IP clock, and optionally an RMII RCLK gate for the AST2500/AST2600. The
+      required MAC clock must be the first cell.
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - enum:
+          - MACCLK
+          - RCLK
+
+  phy-mode:
+    enum:
+      - rgmii
+      - rmii
+
+  phy-handle: true
+
+  use-ncsi:
+    description: |
+      Use the NC-SI stack instead of an MDIO PHY. Currently assumes
+      rmii (100bT) but kept as a separate property in case NC-SI grows support
+      for a gigabit link.
+    type: boolean
+
+  no-hw-checksum:
+    description: |
+      Used to disable HW checksum support. Here for backward
+      compatibility as the driver now should have correct defaults based on
+      the SoC.
+    type: boolean
+
+  mac-address-increment:
+    description: |
+      Increment the MAC address taken by GMA command via  NC-SI. Specifies
+      a signed number to be added to the host MAC address as obtained by
+      the OEM GMA command. If not specified, 1 is used by default for
+      Broadcom and Intel network cards, 0 otherwise.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mac0: ethernet@1e660000 {
+        compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
+        reg = <0x1e660000 0x180>;
+        interrupts = <2>;
+        use-ncsi;
+    };
+
+    mac1: ethernet@1e680000 {
+        compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
+        reg = <0x1e680000 0x180>;
+        interrupts = <2>;
+
+        phy-handle = <&phy>;
+        phy-mode = "rgmii";
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            phy: ethernet-phy@1 {
+                compatible = "ethernet-phy-ieee802.3-c22";
+                reg = <1>;
+            };
+        };
+    };
-- 
2.40.1

