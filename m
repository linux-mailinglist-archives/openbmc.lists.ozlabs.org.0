Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A85E969C
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 00:11:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbKqQ5MFMz3bZs
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 08:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iFPGAf/q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iFPGAf/q;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbKpM6p51z2xjj
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 08:10:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 83FCC72C;
	Sun, 25 Sep 2022 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1664143472;
	bh=szDrpMqpfTmd0bTtV19FrnGKTXelxS1H2D5cEIKOuFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFPGAf/qPA0PJjjaVSDRzpu0I92XjBaDPXzKaAznxrBuAyrK/ljD2JK71va+W5Zve
	 inJnZ1p0tufMh6dJExFcnwCw3eQG1xwYTh8xwo62kF3Sk5AQ4POeJcYKVbuyWc9af5
	 cVKFTw2NTwkYhmHQyeOtoAeEOc0Oyz3Tg8dykseQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: regulator: Add regulator-output binding
Date: Sun, 25 Sep 2022 15:03:18 -0700
Message-Id: <20220925220319.12572-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925220319.12572-1-zev@bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naresh Solanki <naresh.solanki@9elements.com>, Laxman Dewangan <ldewangan@nvidia.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This describes a power output supplied by a regulator, such as a
power outlet on a power distribution unit (PDU).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../bindings/regulator/regulator-output.yaml  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml

diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
new file mode 100644
index 000000000000..40953ec48e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/regulator/regulator-output.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulator output connector
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+description: |
+  This describes a power output connector supplied by a regulator,
+  such as a power outlet on a power distribution unit (PDU).  The
+  connector may be standalone or merely one channel or set of pins
+  within a ganged physical connector carrying multiple independent
+  power outputs.
+
+properties:
+  compatible:
+    const: regulator-output
+
+  vout-supply:
+    description:
+      Phandle of the regulator supplying the output.
+
+  regulator-leave-on:
+    description: |
+      If the regulator is enabled when software relinquishes control
+      of it (such as when shutting down) it should be left enabled
+      instead of being turned off.
+    type: boolean
+
+required:
+  - compatible
+  - vout-supply
+
+additionalProperties: false
+
+examples:
+  - |
+      output {
+          compatible = "regulator-output";
+          vout-supply = <&output_reg>;
+          regulator-leave-on;
+      };
-- 
2.37.3

