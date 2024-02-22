Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155938608F6
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:45:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gHrVtSc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvWJ67xRz2xm3
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:45:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gHrVtSc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgJRw5VKPz3cCb;
	Thu, 22 Feb 2024 14:25:16 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so6186530a12.1;
        Wed, 21 Feb 2024 19:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708572313; x=1709177113; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJjLHFzHOOxg5aRXQc96zwBJZ9WYrMKJ+K0shUjS2Ls=;
        b=gHrVtSc49RdIAqCJorSL3+Q9mLhL0fbWfuUQEvmjx03AyFJ2IeJYd6jdnZ130G8Zcz
         2l8FGXkAmlpcteRK78AhMyaF4s88RFghQyXZGuUN1HrXsWmVb7vxBG66gC9yudJKlGGo
         vpokHF52oeS5GZ8ovVIvbMI2BKj6XvSroU4xGTtUvjG6YBbak3rteajiGxtZafADp9n4
         KBtOuKvY5G6kFG9WaMXohiPgd0mcI/nCjtM5FGCWGec+jZXcxJYDiZWSqa2V9GxW7zZa
         oO3CAZyA+sptsJjE1DU85E1gsxtsk0bUu5JxxW5LmzCOTiV4jSGx7W6kD4Zi3Qo/vyz0
         CLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708572313; x=1709177113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJjLHFzHOOxg5aRXQc96zwBJZ9WYrMKJ+K0shUjS2Ls=;
        b=JGysNBpIT8kAEcSHQONs/OkqrPQhOzB3AOL5eNQmHvdrgHj2GsoiEA9RL5fSNWXIl5
         ppsZm74SoLJhAbUoDcOMp+y3SlZfa8M9zuGWtEUA9w7JINrbq1QU0jkHDu5dYsAyqqZK
         oDQzLBvNJyfzSn3VkgDqRYqH0bZABPIWumQ5AlODLSO+71sbYrOVhzeISPPSW+DBT8mI
         r/XCafP7c1g+3u9Hi2yT4RqVHxWGyJdHSScv2GsbhXusbO19JFHYd3do86oYueSuARRy
         9OOUAahGkJ4mQ/K3OIvu5AKxYhBllZ3saz8CPOKClsV+vkEZOQDMPji27p5ZWMDZzgQY
         Nl0A==
X-Forwarded-Encrypted: i=1; AJvYcCX7gc9RVO59F1MW/X/YuvXm5lW6rysZYGluvIjXVuy8F30HUKla9ZQFmMISMnriJyAy8rNHatiLD/jtxPUM0Ch9IGQVfeeElgBtIoLnA6X/a7wj0WakLQ8h+1K6dm/0zRpq6/bPzVF3
X-Gm-Message-State: AOJu0YzHhm9BFPUL63JmJFG5BQBEDvcmgBv64i+5Roq2YAecpCMI3cUV
	NWNkpxmIPZlLV/1WHSiAvfB+6H3alW+znkpQh0r7JarvZgj8nKNY
X-Google-Smtp-Source: AGHT+IEG/CFzCGbmOpgJHBmhgewL9gM9hzsrOSEcXfQgEffeWwtQjBoIKYJQnj72kGXSs/nyQbdZKA==
X-Received: by 2002:a05:6a20:c704:b0:19e:3a9f:f925 with SMTP id hi4-20020a056a20c70400b0019e3a9ff925mr19940646pzb.14.1708572313445;
        Wed, 21 Feb 2024 19:25:13 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902f7cf00b001db4433ef95sm8781580plw.152.2024.02.21.19.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:25:13 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Thu, 22 Feb 2024 11:25:04 +0800
Message-Id: <20240222032504.1147489-2-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222032504.1147489-1-Kelly_Hung@asus.com>
References: <20240222032504.1147489-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:36:41 +1100
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
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..60a494b7aaaf 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus, x4tf
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

