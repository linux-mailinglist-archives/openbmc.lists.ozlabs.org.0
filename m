Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A420C86D68F
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 23:07:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j7TEupPw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm5131rcNz3vdk
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 09:07:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j7TEupPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlpSk1fywz3cCc;
	Thu, 29 Feb 2024 22:11:32 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e5796d01c8so533708b3a.0;
        Thu, 29 Feb 2024 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709205090; x=1709809890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jO6eku8lXVRKAP6IeLQ8bJS8fk+8Lg2YNxQYKhinIjg=;
        b=j7TEupPwHkkzgZzSzVwx9huIqkrham3CjliJbn8gnbcb8DTJvTjQTlHkeRAOSMrNQ4
         Y3Y7I7OTRVZwB96iZlrIUQ7V/YOVefmESA2NBDgHgdkWEGARMfb346LFqH44IYambjWy
         FynAFOT1rPnCg/MEmKhIZqlDswhAGalamrihpbtU89OCu0XnA4f2luh8MjmlsT+2zH0C
         DeePChlgnmFPqpIKJFJpvb9VuUQ2KO3ytdgWfUVlZQxxpw7vwcruIgc+5S3hx4aL5vvt
         CQfFEjrnkvwvQogL8Y7CS7XjpGl9Q4JVGW/9aV3bwl7/XLNWcGqA/NBEvyQAbatcllUG
         JwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709205090; x=1709809890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jO6eku8lXVRKAP6IeLQ8bJS8fk+8Lg2YNxQYKhinIjg=;
        b=MrVhpW9d2XNhmVhQ0pAQTkTR2SfFFcE4d9kYS3iH57/19I3/Z/5hhQQ07e1HUDWRk2
         9gaiF8MRYswS2d6t9emVcwFgtBk9Q0pB9pblP/EAF2SJpldHxacTG3ctwJbKceCwAAUK
         CZ7xxGOABasThn9mJWsuyvFrYsbVZ0qzRxnI4PLiXP3Cr04YEwqdrew8V6ep4+sXJsEO
         2LqgN5tUfki9HO6I+OyuWhVZDR5bcAzwwSfWrSM87W8wnSAZerOmPKonk1SZuQAiUJdX
         MDhVxVCq2ZzqrpP5TME28Ash1OVW3pWlEQr7n1vE7iJEmWwM72uEhG49msCOY0TViJpk
         FA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj1APxFa57ZoLpbZE+OsPi4pvw3S/a1zqVzU5yrL17/HKcK21QoDuX9bxvmWV5C8LneMpGFtNjV0uahRIuN09y9vHa7nZwoB7RZnt12h51XK3WB7lYyciA0BUrWg8yRlTD8IEI4v4q
X-Gm-Message-State: AOJu0YxbSs/iqZiHryAAFUh45gZmN7XJa7vNuNy5chfXyEbzHE6YodPe
	9m+xIe7Jp/AXV+S1/rMvGdM30RgP7hI5dTVczdwf+EsOrx4mn8Sc
X-Google-Smtp-Source: AGHT+IEEUhledkGZQdNvS8ZfWsIcs1RBN17VYoP47ddRaH/RIRP8Ha9Yjztrg8wNgMQP8BGOPvGfxw==
X-Received: by 2002:a05:6a21:3a41:b0:1a1:2b0e:f23d with SMTP id zu1-20020a056a213a4100b001a12b0ef23dmr1034065pzb.62.1709205089685;
        Thu, 29 Feb 2024 03:11:29 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id k6-20020a63f006000000b005e4666261besm1059693pgh.50.2024.02.29.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 03:11:29 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Thu, 29 Feb 2024 19:11:22 +0800
Message-Id: <20240229111123.1932504-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Mar 2024 09:01:43 +1100
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on ASUS X4TF.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>

---
V4 -> V5: Update all changelog from v1 to v5.
V3 -> V4: The new compatible is a BMC for a ASUS X4TF server which use a ast2600-a3 chip,
so correct string to asus,x4tf-bmc.
V2 -> V3: Add a label to indicate it is new compatible for bmc.
V1 -> V2: Remove blank in front of the string x4tf.
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3..0047eb4ab 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

