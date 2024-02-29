Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8586D686
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 23:05:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IftRM2kb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm4z45c3fz3vb0
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 09:05:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IftRM2kb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tllll1tMNz3bsJ;
	Thu, 29 Feb 2024 20:09:21 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e571666804so421422b3a.2;
        Thu, 29 Feb 2024 01:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709197759; x=1709802559; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3EH79m2zjg+0l2Fo/85HOfKEzKcJTEn64bTAoTpEgA=;
        b=IftRM2kb2kC/h4PmdIBZuQUN3YbOnLVJMkak/Qes9ZOOkeg/GFp/nkFAlsfjRIfjo6
         6YFwiw37zeX6reQnj6Vu0q4Rlv32PQBSpYUFcbeMpnAmnIs5usyWLQ7MBz4kVuuGnsfY
         7Vb7ZoDLSxhuOBlhs9Q5FUekBzqdRrPSru62BMBvtGjnRfQzthcw+Frs5nLOaO8og5WO
         9OVS7sweeww3STQ4WmIDpPXw0SunRHoUuU3toDTEWP7JRprXCsr9DvAMOrRPEIeOODxp
         aJGLJqQUwxXq3FHZZOqs9k36hb9vKFLUvrBIMqTs0t0X039mnhYlH2Ki29stwrV5d/Hv
         KcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197759; x=1709802559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3EH79m2zjg+0l2Fo/85HOfKEzKcJTEn64bTAoTpEgA=;
        b=cqZKQvNd46z77avcsu1Lz7Q8ROtBm2nx9z4i3NznrCMdF52tnadg655KWCFYyiDkng
         TRuWhTQoBjhZXxFYVuGFY6KbF6N0M/E2dMO3EoTY3T7OVt7bHSN2llcVXTIJKnNKikwR
         ev1Y3tKqn3H72nnho1nX7vhMtTNXzVSGfQsu2wJe1uxZ6nm35bvgUQjqQuilNMzQNnmi
         5EqFeJz5vVqWiT+dTV/3aQowtW0MbXkPIl4Pw6oFbxjwl7N5pgBBYYa3sQWdApzX1Xoe
         ZgM854qFUwQTiQI/WdYqhFe96zgLNih08aJg9rAqnLNm6auSnHVQ7MRSrFxWhbfjHxw5
         iEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoSyJEgUscjQ5cYItFb0quIxZIZrdeAVrDtnxPuQp2/GwnKnVFNgabnBPtQAd+/ii4/5DwkTctjejkclEwYJlbww/PIgJwbX6c1wdacDj3yvsg/rz3K59173T4PnSzoQoNe4IabTan
X-Gm-Message-State: AOJu0Yy5X67d7q+/1Qu4MkO1HfJVYwYy3H1z2RHBpvTZ1pyYg5fYsksZ
	rrqQD1JTRiud2+AKxlKuU0/k3APn+I1WPVha1n+gqxGwZeP5Xpil
X-Google-Smtp-Source: AGHT+IFxXPuQx2ANlQfZU8eDVwwYhTH173O/ISHyhBeYCFuuLoI0Y3/MzddDlU5+xfQcysXl6i6noQ==
X-Received: by 2002:a05:6a00:985:b0:6e5:584d:e511 with SMTP id u5-20020a056a00098500b006e5584de511mr1925870pfg.17.1709197758834;
        Thu, 29 Feb 2024 01:09:18 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id e6-20020aa78c46000000b006e0447d48b0sm805883pfd.23.2024.02.29.01.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 01:09:18 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Thu, 29 Feb 2024 17:09:12 +0800
Message-Id: <20240229090913.1892215-1-Kelly_Hung@asus.com>
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
Changes in v4:
- The new compatible is a BMC for a ASUS X4TF server which use a ast2600-a3 chip,
so correct string to asus,x4tf-bmc.
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

