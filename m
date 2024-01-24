Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A166883B1B9
	for <lists+openbmc@lfdr.de>; Wed, 24 Jan 2024 20:02:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtrOHq/s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKtd0411Sz3cSn
	for <lists+openbmc@lfdr.de>; Thu, 25 Jan 2024 06:02:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtrOHq/s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKtbV5yMZz3c2b
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2024 06:01:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F93F61E9C;
	Wed, 24 Jan 2024 19:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86972C43390;
	Wed, 24 Jan 2024 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706122882;
	bh=dMObXyq0MBRE/uycOHgjqOdNUcF7nQX2Ho+KMxlPsXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtrOHq/se1guXLT7U4yisWLOI4M8hEOOfNKHh6jYGnWmGY8x/Fk+BwXOKJOtEwBwe
	 6jtsYOsQsCycofWpVO/AfO40OVu60FhKCU++W0/qT06ZKIDiGytIGa8+6p3/gWLiSO
	 FSFd2ZRL4yfowDYlU91IF/s6U1kBpGhaQFKNtIYYHK4UavbDaYgw+mw+wWgbwdNqAs
	 p1Kn3v2PnWPdd4ZwpJYoAPRClwSkgyYuo7XtIeCCVHqP2AI5og2fa7oJph4dVhZ9Sq
	 PzC9zOeQ5tCx90r78j32XpujfuHx6LoXxY2UFccrEC+mdWZOqAgyFzYfm4IzYCCBJW
	 j73dEwZG43dhQ==
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
Subject: [PATCH 2/2] dt-bindings: pinctrl: nuvoton,npcm845: Drop redundant type for "slew-rate"
Date: Wed, 24 Jan 2024 13:01:05 -0600
Message-ID: <20240124190106.1540585-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
References: <20240124190106.1540585-1-robh@kernel.org>
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

pincfg-node.yaml already defines the type for "slew-rate", so drop the
type from the nuvoton,npcm845-pinctrl binding.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 20cf0102aa63..b55d9c316659 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -159,7 +159,6 @@ patternProperties:
         description: |
           0: Low rate
           1: High rate
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1]
 
       drive-strength:
-- 
2.43.0

