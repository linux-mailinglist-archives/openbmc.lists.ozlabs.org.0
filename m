Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E00957043D4
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1N65pbrz3fGH
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AGmJEnX5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AGmJEnX5;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFx0q66wqz3c8f
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:35:23 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efe9a98736so6546072e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632120; x=1686224120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ9PB/UjgQdEomLsQFjCrSpNBCkBCgqrAFyhnpB0P5Q=;
        b=AGmJEnX5lM99SSQkFuTItq4ndHX2KRpXyqZvV0gG2r8ACzzjDEUaMa9gGMcROf1TdF
         FwUqjU7T0m6o6qMrqVrDjrvmtotNEkJRFsTKldLFyJHw8y20SkkoNZNmttmBkkeVC534
         MYFi15xzLOwd/yuV0Moral/BgTbCAWCKRqFsWSzog/WqeGJzorm4TX1WtfL5sij1fdT8
         bp+mpdyipj2Kdm75szKLNI80mOz8zdf3qcOphWXTlTXLlIUNBzFe7U2g5LVkvYWf3bhO
         uph4mNsQYNl+bylVL0YS+1l+23S7iCUqBHO/dHGLoTnhtzGFm8Kn9CmyakMjHwGo3Pr2
         7q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632120; x=1686224120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ9PB/UjgQdEomLsQFjCrSpNBCkBCgqrAFyhnpB0P5Q=;
        b=gE4ujG35bsrnBeK5xQIls8dpBNJPMEhBswjrKgeImj/PJFRKG2Rkdv4vpX17LVe1Sd
         k/q7roZvZ6AyjMwNWZw0MSCqHEEp8wQdAz/YMiQg0mHGyDyi4B3FOlrVpYD53KzETiP2
         fOPeQg6GxWQ68kd6mmPs+foexicmraR6DuerLiSR7pAnhCdhf/oDMHp10H4LtjfyIDSE
         dbIXpQ+QY9BM+0gBK92WSZvqVL1MvYTdFN/NybrV7rjeU/3oOCpo643aR9I4++qPrSIx
         u/KhVj1PWTGWh/u5MK8KJQa5RCNoCKOl5aWF0ugaQc1j+OSpw8FSx6YFhnv4IM5CmKZ4
         BB7A==
X-Gm-Message-State: AC+VfDxKVH/clrblRPKRp6Y6Vnfz9Z46Ex7VU/SNnaisOAM/dR1ImTqN
	HkVYIxHu6KGrtigYcf/w7O8=
X-Google-Smtp-Source: ACHHUZ6GvZGEid83w6782Tu4dK7RhRUtad1gNRgpAbl5QMHkN490GGttEB3yPd9qZJ+bmNOmx9T/JA==
X-Received: by 2002:ac2:5638:0:b0:4f1:26f5:7814 with SMTP id b24-20020ac25638000000b004f126f57814mr649736lff.20.1683632120413;
        Tue, 09 May 2023 04:35:20 -0700 (PDT)
Received: from localhost.localdomain (93-80-66-133.broadband.corbina.ru. [93.80.66.133])
        by smtp.googlemail.com with ESMTPSA id k16-20020ac24570000000b004f25ccac240sm108940lfm.74.2023.05.09.04.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:35:20 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/5] dt-bindings: net: add mac-address-increment option
Date: Tue,  9 May 2023 14:35:02 +0000
Message-Id: <20230509143504.30382-4-fr0st61te@gmail.com>
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
Cc: devicetree@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the mac-address-increment option for specify MAC address taken by
any other sources.

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 .../devicetree/bindings/net/ethernet-controller.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 00be387984ac..6900098c5105 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -34,6 +34,14 @@ properties:
     minItems: 6
     maxItems: 6
 
+  mac-address-increment:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      Specifies the MAC address increment to be added to the MAC address.
+      Should be used in cases when there is a need to use MAC address
+      different from one obtained by any other level, like u-boot or the
+      NC-SI stack.
+
   max-frame-size:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.40.1

