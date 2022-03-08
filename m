Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9E4D0D6A
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 02:18:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCHXc2SrDz3bN9
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 12:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=XAER39zX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=XAER39zX; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCHXB0Q7Yz2ymb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 12:18:33 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D33867C8;
 Mon,  7 Mar 2022 17:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646702311;
 bh=gr2x0McqUm6AttCXHBXmPoHrzYua62hvh5ryRZTRS7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XAER39zXNAdf6FGdGARa83+dH6IQkjhJlJA5pDlCxAqtAkj3qyC9htgGBj9YRAmXd
 q0G9hjEiCrEnPGCNW+LeA+RMLUZ3olqIArXDr/pYly7TNTpAbQNqw4oI9ysSmZPgvb
 jU2bPjXkIenCCshN6p1FHfYKEh2g5LIL0biM3SFM=
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: Add power-efuse binding
Date: Mon,  7 Mar 2022 17:18:09 -0800
Message-Id: <20220308011811.10353-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308011811.10353-1-zev@bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This can be used to describe a power output supplied by a regulator
device that the system controls.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../devicetree/bindings/misc/power-efuse.yaml | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml

diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
new file mode 100644
index 000000000000..5f8f0b21af0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic power efuse device
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+description: |
+  This binding describes a physical power output supplied by a
+  regulator providing efuse functionality (manual on/off control, and
+  auto-shutoff if current, voltage, or thermal limits are exceeded).
+
+  These may be found on systems such as "smart" network PDUs, and
+  typically supply power to devices entirely separate from the system
+  described by the device-tree by way of an external connector such as
+  an Open19 power cable:
+
+  https://www.open19.org/marketplace/coolpower-cable-assembly-8ru/
+
+properties:
+  compatible:
+    const: power-efuse
+
+  vout-supply:
+    description:
+      phandle to the regulator providing power for the efuse
+
+  error-flags-cache-ttl-ms:
+    description:
+      The number of milliseconds the vout-supply regulator's error
+      flags should be cached before re-fetching them.
+
+required:
+  - compatible
+  - vout-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "power-efuse";
+        vout-supply = <&efuse_reg>;
+        error-flags-cache-ttl-ms = <500>;
+    };
-- 
2.35.1

