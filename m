Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7B83B1B2
	for <lists+openbmc@lfdr.de>; Wed, 24 Jan 2024 20:01:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GvuTAwEw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKtc00M5sz3cSN
	for <lists+openbmc@lfdr.de>; Thu, 25 Jan 2024 06:01:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GvuTAwEw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKtbQ5M8sz3bvX
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2024 06:01:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 568CD61D15;
	Wed, 24 Jan 2024 19:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA974C433F1;
	Wed, 24 Jan 2024 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706122880;
	bh=tOgsZRXU9rRQFmddKn9J6mSGDO3A5r9Xtx6Ag8uTw0U=;
	h=From:To:Cc:Subject:Date:From;
	b=GvuTAwEwBlmIaZvxxby4E//caeJa+m9jb6A6jf1IR/4Qrdij11PglW5ZLz94g9aqM
	 rwtcZYQSCvb78UR2KaycjDifkQwqeQBQlCAf1VKvbVCUp0a42xmub369OdjfdAdXkO
	 trn43tCZBE/BYImrD58p+LtIthpbyovHXb5oVF4pzGYPIua+tHZvszUfNnnwAslW2j
	 Ykh26hHQG0hYValJobzSo1U+biPNI6GR9ygDNKf2rlyMpWXQARLd5WhwDf/lIOyAbC
	 tmCIvhQgvQ05qDaypf5VWeZ+rq+b3dy7V2tuHl+haIAje9RW4+6TAtzXJW+bQ7RQH3
	 Ir6J0QvybvE/Q==
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	patches@opensource.cirrus.com
Subject: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
Date: Wed, 24 Jan 2024 13:01:04 -0600
Message-ID: <20240124190106.1540585-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
an array rather than an scalar. Update the common definition to expand
it to an uint32-array, and update all the users of the property with
array constraints.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml   | 3 ++-
 .../devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml   | 1 -
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml   | 3 ++-
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml     | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index bb61a30321a1..482acda88e73 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -93,7 +93,8 @@ properties:
 
           input-schmitt-disable: true
 
-          input-debounce: true
+          input-debounce:
+            maxItems: 1
 
           output-low: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 3e8472898800..20cf0102aa63 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -152,7 +152,6 @@ patternProperties:
         description:
           Debouncing periods in microseconds, one period per interrupt
           bank found in the controller
-        $ref: /schemas/types.yaml#/definitions/uint32-array
         minItems: 1
         maxItems: 4
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 7b7f840ffc4c..08442c880f07 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -103,7 +103,8 @@ patternProperties:
         items:
           pattern: "^gpio1?[0-9]{1,2}$"
 
-      input-debounce: true
+      input-debounce:
+        maxItems: 1
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index be81ed22a036..d0af21a564b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -97,7 +97,7 @@ properties:
     description: disable schmitt-trigger mode
 
   input-debounce:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
-- 
2.43.0

