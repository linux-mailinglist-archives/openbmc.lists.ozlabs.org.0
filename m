Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C446251FB
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 04:59:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7lMF2RDvz3cGH
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 14:59:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MZ6qjLgz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MZ6qjLgz;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7lKf6DjSz2xmg
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 14:57:58 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 668A1BF1;
	Thu, 10 Nov 2022 19:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668139075;
	bh=cYD6Qd7fy43ovlQmZkAUu0Q0fKPcHu7dk4wN5kVOqB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZ6qjLgzFVrVGFe/Zu8t142wBO/CoWZ9lc0k1xk/Mmq/D7hRMTio9lYd04WTRERY8
	 kMjX/nb0u3dKSpFR2nze0l0U46KpJQQR3xYgW73wF07PuxhUJSSpxKrxsEWWGk9G5I
	 LItiwKhWCngjOvU1AKK+J65p0PbAxIarXh3PUmr8=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 3/7] regulator: Add regulator-output binding
Date: Thu, 10 Nov 2022 19:57:43 -0800
Message-Id: <20221111035747.31663-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111035747.31663-1-zev@bewilderbeest.net>
References: <20221111035747.31663-1-zev@bewilderbeest.net>
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
Cc: Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This describes a power output supplied by a regulator, such as a
power outlet on a power distribution unit (PDU).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20221031233704.22575-3-zev@bewilderbeest.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/regulator-output.yaml  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml

diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
new file mode 100644
index 000000000000..078b37a1a71a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
@@ -0,0 +1,39 @@
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
+      };
-- 
2.38.1

