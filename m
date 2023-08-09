Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E9776F6E
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 07:16:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kCIHP/P/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwC60Dszz3cNk
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 15:16:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kCIHP/P/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLQLN45Thz2yts
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 19:51:24 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-687ca37628eso2014515b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691574682; x=1692179482;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMmvRAr3WJDJPERsTgA3XXQnHXs/O0R8IKemxQ6u/U8=;
        b=kCIHP/P//featsTbOj5vRMc05VJ+kesXTUsIbe4/v6sNPkqDMH63zPgGmpUU1iBURF
         XsNGeI2Rn4RfXLC/fPIjzPsvswPIdDw1B6a8QpAfJCaJFnzzQBDQ6/Bq1vwlcKCa7Nt3
         p6JTpwXtCm+O9YdYxRaJjBc4nQ7yk8vJp8BjaqTntF71fBOFz1rDd+L6K+LFQXFQm/47
         cJZlwrt3+AgNoXb3HKblRGs4sDZ3WJ8wgvHcF9yaKCwexhwxt5vqOYNrhOIfqlYHMvDB
         RlFWHZbc3G176ScMExI8MwqOyi4hELE/BzVJsc51x44B6ZMRPykzJaoN+N5WowQ71N22
         xw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691574682; x=1692179482;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMmvRAr3WJDJPERsTgA3XXQnHXs/O0R8IKemxQ6u/U8=;
        b=R3+ABRPE6YOdh+mH/ufEvU1e5tYxEJ2ytfLX56dy9cIYns6NEsK+R3VPTSoefXooqN
         ml34qxb/kReQcShlxmRiXzvurqxh3Ri3+5ZFtRiH9oq0qeQFN4AOkbQxhKQL0uU99qR3
         gIMxIkG0/fiQSbO5vS2Ii3ANdscmGKPQtsHqjy3m3l9XtWLDJm4rzWEq59Zxfcj3ywUZ
         e/Ew3HD4+lasWhjnLFbxtOZXjAs7hiIxcW3uNhzEEO38ejJTRSVOWx+I8MprpeJP1mZ4
         HwQxVK1FAOnllXdUNXwynsT0kpsSm4CnIN55mRGOSU2JLVP/EWBcFiS5iDykm3P8OHMB
         AdYg==
X-Gm-Message-State: AOJu0YxcVmQa7IwX2ulD7Uc3oCm3XxvMkpi3Lq4SibaP6Xmps6X2lsfr
	mrJ6XwYu/6duMLmZc8Xt7E8=
X-Google-Smtp-Source: AGHT+IFBps0WlArKN0bzaJSa2FqF89rO4p8pLeDZrE6fYEiZG2hIGrqyLrrFGjDdeegcOUWsdt1HyQ==
X-Received: by 2002:a05:6a20:4ce:b0:132:8620:8d21 with SMTP id 14-20020a056a2004ce00b0013286208d21mr1906030pzd.58.1691574681786;
        Wed, 09 Aug 2023 02:51:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j21-20020a62b615000000b00687375d9135sm9493822pff.4.2023.08.09.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:51:21 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: rtc: nuvoton: Add DT compatible
Date: Wed,  9 Aug 2023 17:51:11 +0800
Message-Id: <20230809095112.2836-2-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230809095112.2836-1-mimi05633@gmail.com>
References: <20230809095112.2836-1-mimi05633@gmail.com>
X-Mailman-Approved-At: Thu, 10 Aug 2023 15:15:25 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add DT compatible "nuvoton,nct3015y" to select

Signed-off-by: Mia Lin <mimi05633@gmail.com>
---
 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
index 4f9b5604acd9..67fc60fd395c 100644
--- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -15,7 +15,9 @@ maintainers:
 
 properties:
   compatible:
-    const: nuvoton,nct3018y
+    enum:
+      - nuvoton,nct3018y
+      - nuvoton,nct3015y
 
   reg:
     maxItems: 1
-- 
2.17.1

