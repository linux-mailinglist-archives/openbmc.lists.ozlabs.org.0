Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3D5197A6
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSGq3R31z3bbG
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:53:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CBZa54Pq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=CBZa54Pq; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSFp2CTfz2yJQ
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 16:53:02 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 50BF9223;
 Tue,  3 May 2022 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651647180;
 bh=NGgm9ZytERpttgSYTz22XkDyLz7akFtC0NdMbrSk3Qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBZa54PqXgXcLE6/k/HrFbeNJv4F6EzjUtzedbwiSK6Ap7+y1MjNaXUgqluZA8Ogc
 3HWlcIB9V3AOqIT0ylHmV7qVu6qk1oC9wW7yCtJBqt/egcUXeUapVuDVO2E64hpJ+0
 V/O0Pns/givWDrHjDLhDjz7XbCJkOq7YQ2VjHolg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output binding
Date: Tue,  3 May 2022 23:52:48 -0700
Message-Id: <20220504065252.6955-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504065252.6955-1-zev@bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This describes an external output supplied by a regulator, such as a
power outlet on a power distribution unit (PDU).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../regulator/reg-external-output.yaml        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/reg-external-output.yaml

diff --git a/Documentation/devicetree/bindings/regulator/reg-external-output.yaml b/Documentation/devicetree/bindings/regulator/reg-external-output.yaml
new file mode 100644
index 000000000000..c00bee5bd9f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/reg-external-output.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/regulator/reg-external-output.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulator external output
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+description: |
+  This describes an external output supplied by a regulator, such as
+  a power outlet on a power distribution unit (PDU).
+
+properties:
+  compatible:
+    const: reg-external-output
+
+  vout-supply:
+    description:
+      Phandle of the regulator supplying the output, which should have
+      the regulator-external-output property.
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
+          compatible = "reg-external-output";
+          vout-supply = <&output_reg>;
+      };
-- 
2.36.0

