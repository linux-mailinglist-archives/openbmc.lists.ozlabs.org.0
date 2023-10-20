Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2AF7D1478
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 19:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBrSm53SGz3dvs
	for <lists+openbmc@lfdr.de>; Sat, 21 Oct 2023 04:00:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.50; helo=mail-oo1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBrSR1ZJ6z3cVy
	for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2023 04:00:37 +1100 (AEDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57e4459aa29so537575eaf.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 10:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821235; x=1698426035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzgDuBFq97Xw3QhiJlj4wHN5k/h9ggUGNAdZwlEm5kY=;
        b=qGiQSGKaY9moUcelENFkWl4SfgYGSGxf5tu51x3+yds7JfbcDYjxK8gStpkDaFufd+
         0CKqjSk1T1Q7ONdnMqLON8byBWgbYdW6JyU5yn7PJo4x0nNsl9DMMxRgztG6HYaM9FWW
         qSuEc6TiMQFdIAG09vJ1oU6tO8LAatIbqwh3DePW5jN+C12bU5cggklqTXdc2oTtB4Eq
         NuFivAPAdubi+eyF+JHnYfCOERmXICKyamegUmK+Hx4VYtp3K6+ZytEhHoP9Z9DMPpaO
         kXmxRXMkDWUmazBOASO5R41Q/xPGXySaN9nUP13DJpEAcqc54eTSmInlFrt0bG+UZndU
         vtLg==
X-Gm-Message-State: AOJu0YxMKzvQmfWZuWU5ziRWjtFff+W4hsB3Fe23pebDSkYjGxTWs+B8
	gWidoPYB6ct+i+qDnriJ9g==
X-Google-Smtp-Source: AGHT+IFG7MQg/Qf1uISRBgyZiD5wS21l6aF1H40nmlPqP8OxAlGR4K8MKN3DrHBYbbg49jFjRIE3Ug==
X-Received: by 2002:a4a:c4ca:0:b0:581:f262:dde0 with SMTP id g10-20020a4ac4ca000000b00581f262dde0mr1202983ooq.3.1697821234626;
        Fri, 20 Oct 2023 10:00:34 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ce12-20020a056820218c00b0055975f57993sm409614oob.42.2023.10.20.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:00:33 -0700 (PDT)
Received: (nullmailer pid 3613652 invoked by uid 1000);
	Fri, 20 Oct 2023 17:00:32 -0000
From: Rob Herring <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: nuvoton,npcm845: Add missing additionalProperties on gpio child nodes
Date: Fri, 20 Oct 2023 12:00:16 -0500
Message-ID: <20231020170017.3610978-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node. Add the missing addtionalProperties to the 'gpio'
child nodes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index e4b9f3da2cf0..3e8472898800 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 patternProperties:
   '^gpio@':
     type: object
+    additionalProperties: false
 
     description:
       Eight GPIO banks that each contain 32 GPIOs.
-- 
2.42.0

