Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85458608FB
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:46:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kAq3mint;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvYB6BsKz3f0P
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kAq3mint;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgRsV1Jq6z30Q3;
	Thu, 22 Feb 2024 19:59:25 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c0a36077a5so4554073b6e.0;
        Thu, 22 Feb 2024 00:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708592360; x=1709197160; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dug1XgLbh8Sb0ZiHV0LuAfIHY/1jxdnm6P7dtGz/eSM=;
        b=kAq3mintPxc3KnCQcnGn12eei3sZe/TooEx/SoM5OXM8LOzHLTSIvmrf5It3yuy2B2
         aGVVhbk8nqS8wbHFVfwRIh7Pb7VOLC7OEkTfRYGqTqruJG43e6hEpP/pJsPMYhvOXyK5
         b6CsMP/Br8IlYtqN8QGFbBF85rRNIYiYa3LnEIOfqin22iqXjrk0zgMhhdFD5GqbjKyP
         WVkXxEfDs5Vu3sV78ttw+CLqC3KUb4cdBm3AawW9ZXQdUp3rxEqY2ibizprIXINPcT0w
         cKmMmwef1XiLVT2mCVYMOXaNeWsyjAsFLW2XRR91eWDQW1qpb962DfJS6RGbjP5aiPtF
         P+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592360; x=1709197160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dug1XgLbh8Sb0ZiHV0LuAfIHY/1jxdnm6P7dtGz/eSM=;
        b=cMn07XVw9ICBhPGTQoOig8GHG7aGMAV99vWqjgaIr66oCmVk6COopq93z1hWBaOxME
         mvvAnFBQ5UQrhNx/dpkMl/6LcFTgdrE+oyfgnDNewFQdJo4rTfrz/LaTmfNpy2CA1VZl
         0qEVEJXU7XOY4HRXHsa5r94D7D2GGwQ7KVhCZaixGvTTQF+rXv6/XemhQXVoYtcgbxUf
         Tmd9C7GUxctDR01x1EeNAh6QIECwgs0HPD4UrVLrc0dVOwYOa05nxwfDFDfX8YP4wQTj
         FIFN9Avx3u3nalyzpD/hT9ZYNQYnsEEnYhkAcaO0Z9lTtikReO5r/rgOlVdSbyjENrEx
         y2zg==
X-Forwarded-Encrypted: i=1; AJvYcCVJfw2H70+aWR4BvspA6pSovZ3uoggK5ue4FjduXB6QkTiJdccUYq43xDmfRwuSZDvi8AqTjoOO5z4qJXR8270WkNICqTfm9s1MhxTP2D2ee3gXiG7fwr/yjSc0uBH48OBD9bFcoI3I
X-Gm-Message-State: AOJu0Ywb7r5UgFQFDJfgcNOgZIlbjC0KRsq9SIpCyhaPN/UkGMcqLgXz
	Y4xbU0l8BgDhTdpteaRHlWsnYnl1cXCVL7F2V2k9ArcOJix6D3qV
X-Google-Smtp-Source: AGHT+IH09LjjSmuZp7oaAj1rWPbM0EwTzWDF80+d1tcfK0+B60TIkJ4txhqEo3VGbqEXT3k3nGSXvg==
X-Received: by 2002:a54:4898:0:b0:3be:d897:2880 with SMTP id r24-20020a544898000000b003bed8972880mr19100999oic.52.1708592359909;
        Thu, 22 Feb 2024 00:59:19 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id k18-20020aa788d2000000b006e4cb7f4393sm922356pff.165.2024.02.22.00.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:59:19 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Thu, 22 Feb 2024 16:59:13 +0800
Message-Id: <20240222085914.1218037-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
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
index 749ee54a3..80009948e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,x4tf
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

