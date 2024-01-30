Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70F844EB9
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 02:37:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xeio42WZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQM2t1qh7z3cSJ
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 12:37:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xeio42WZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPK4T0HD5z2xWS
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 20:04:56 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d8dd580f3dso8079955ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706605491; x=1707210291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csHtYc18T35qzB25mdonMqPpqm2KB0P8ynV8OZQpVBc=;
        b=Xeio42WZ/nPLNmHJ0sekAKFWt+ahnWUi/fFVTFjHR3LJHIZkgJxQYwtlDXsNPsFADn
         67LZIPXIiXRlwvPyF0AWrYa2PNWgz8Qk7IJC3bBe0Gy7qj01qCPKwdUSFdoLEgFMpRYR
         LSWdSHVuRlRr2ul8EB8t0muHJQF9Bflvzdtljkgp4TARBi/fkWzJ2poJ0O0Uq+jMPMAi
         CHtqXg+wi9uEoOt6Ts7DdNYwYJEeZhMkXXtodphVKwg7NTwRfCdC3l4Jo4ga2G7zGbFb
         gaeGj6byTgcxh0i2XL69ZXxZcJ3q/5fX057rKQiyEA+Kl1ylsGle+B+9gKDYMY7z+Tpr
         qcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605491; x=1707210291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csHtYc18T35qzB25mdonMqPpqm2KB0P8ynV8OZQpVBc=;
        b=Hm1TKv3qPb87c+tg3O8qXjP4s2XRR3bXa3YULr1TiBkr+lwMdSCxu5zjfHlFz+Z3bR
         HS0Etw3K8feD/PaOs1GVFtfY74BYsBFt4yXcxog/FC9KPbdCqcWUEnx2TDkd2yPD1ZPg
         V2hNXvhcCcNsekXebmAq0F267bQkEd6388XkZypmPduOl/zR+RXibTTB+xInXYzv6oy4
         CnVaSqi9kT8OJIto58FjcA7CRAC1pc44uhjEDaN94GSNduZM3AwOKEFRZLxGS+ZJKCAL
         hzQnZfFgYBkqWdj9XO/amODTycxJQV5A+KFoO/Rrom8iSVa63YSR0IJVL580sRJJNeYY
         9ncg==
X-Gm-Message-State: AOJu0Yy4uYWYZVrwfNBRbatZVZMlp3gzjsvb79+jLOIToG6y42uxERQ4
	cOyk+AYlmfeUAfpoqRnjDEUgQegksN87NXM+G1vMd/2+TIt0DXfxWOkGmAnmK3Y=
X-Google-Smtp-Source: AGHT+IGnKScVf4U9Cc1qMLheCwUJP1ZIJGI9XtPHcVK1zZgi/NJXc7CTaBrPH7xBVW3EMJmWKiZs5w==
X-Received: by 2002:a17:903:2b0c:b0:1d4:c7d5:3587 with SMTP id mc12-20020a1709032b0c00b001d4c7d53587mr5246157plb.9.1706605490921;
        Tue, 30 Jan 2024 01:04:50 -0800 (PST)
Received: from localhost.localdomain ([124.218.12.74])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090331ce00b001d8fcbbf323sm1553089ple.158.2024.01.30.01.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:04:50 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Date: Tue, 30 Jan 2024 17:04:46 +0800
Message-Id: <20240130090447.198103-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Feb 2024 12:36:43 +1100
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
Cc: Kelly Hung <Kelly_Hung@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This initial device-tree provides the necessary configuration for
basic BMC functionality and work on ASUS X4TF production.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..80009948e14a 100644
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

