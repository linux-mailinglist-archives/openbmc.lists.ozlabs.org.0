Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABC86A695
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:32:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z6sQsgis;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkz0S49yMz3vXv
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:32:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z6sQsgis;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkV6D1L5Dz3c3w;
	Tue, 27 Feb 2024 18:50:59 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dc49b00bdbso34306895ad.3;
        Mon, 26 Feb 2024 23:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709020257; x=1709625057; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExmgizukKPnIx/Jd8+Nc1AouYDtsU9zmeWHuFNKWB7Y=;
        b=Z6sQsgisR8ICo6rvFUOc2bV6KGJ4YXg7O5cHaTFUobarlybCkCNfgBLo/ybvgFjS3U
         X24lhLklkRsOWpnrU9wPjW9CR8WVUies5JUonxnjnSyr3E3dWgKxALeA3VrylJsxx9KV
         0HRXK4iFHGBS93VZ2axIq7/uAwejNZrB8ZjMVEuiclUGZ/N9flpqD2JANzh+kG4Cahbf
         68caEJ3CaIORAgV2Ay1DObvhXmma1JEgMzl3VAY+3mcOe50FrRc04Yf4hkmBV7aGAHB4
         jyH2jhwMFp1G5dRmVgx1KgG8cvTamOZy0ZXfjGH6sgGrIbyiIHOaDKEFuChR+zCfxW0y
         kbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020257; x=1709625057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExmgizukKPnIx/Jd8+Nc1AouYDtsU9zmeWHuFNKWB7Y=;
        b=fxp968JP4lOnDlJbllrwZ0WQHSgAqhuUZgR2k+OFjXHjr9GMeiXdXm+Se4TZLKkwP1
         5dyK+40QRMczY+yHJJCfwQrm4NvsbLi+xqEH7Ct8s6f8i+V2sLJCNIn0YRRigdoHQ1VJ
         gbP3Y1hdJwA/XI2ujIScDZcgjKmowSIfOiqvC8MjyJ2XETjR6Ncq3/FbB758UihypDjg
         flywEn9u+3xhUC2wU7C/xbXJIFCE6B1ma9mEwSHUPt9Y6fIVRSkZ/tdzSByemVgUBHr/
         MknUvxZA/qDcVCxSPvbKaccs1J1NgZkYJLKxUsmuJThZGLotZ1lvivn4iLyRYlFcpspW
         HY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQif0vqWGzE5ppgrk5GC0G4UppE4SD1G94AHqSrOVTopsAEyZck8yL4KyU/lVMJRuKC/TVvsE3JsvqXa3peyPA9RrIGFB+QbjDFl4caDOi0mejPYHqBUsi6rnLkmYHNHrTjFl2UiG4
X-Gm-Message-State: AOJu0YzWZHOhgU7frckqkJCX32H/6s/ErDwNg8Jkq7Mnm21991w06rYw
	V1CRyqghBg+XOmEljTNQOlGA8uyvSuql1Zm7q26w9kxiNOrnjibH
X-Google-Smtp-Source: AGHT+IHLm+Q43cnkgNUPohl9/qQKZ3tsPWyswxYw3q03WtrqmCJ4O2bIhb6EzdPpUXHCm0Mv6HHc1A==
X-Received: by 2002:a17:902:dacd:b0:1dc:b531:833 with SMTP id q13-20020a170902dacd00b001dcb5310833mr2214819plx.63.1709020257389;
        Mon, 26 Feb 2024 23:50:57 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b001dc8db3150asm892658plb.199.2024.02.26.23.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:50:57 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Tue, 27 Feb 2024 15:50:50 +0800
Message-Id: <20240227075051.1577877-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Feb 2024 13:28:58 +1100
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
index 749ee54a3..0d72a1a9d 100644
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

