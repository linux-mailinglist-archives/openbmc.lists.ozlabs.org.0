Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915391DD1E
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 12:53:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mzb5Q2Ck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCNFB5fg7z3fVV
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:53:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mzb5Q2Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCNDg5slxz3dXY;
	Mon,  1 Jul 2024 20:53:06 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id 5614622812f47-3c9cc681ee4so1930044b6e.0;
        Mon, 01 Jul 2024 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831183; x=1720435983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=njCe6+CvWxlUBbdA/hjLIinZuACUMkq7YSRJUSzqvbg=;
        b=Mzb5Q2CkR8FQ7dcnVyuBHd43O6rF2qZ5DlrlYElwXOe1h+25ZeTzZOSHkpTeSE1Q47
         kuVAcuHpJLb6t7eLGttt25BUOgstS05xLy0xTOQbOMl2GZ3cQA3VSVtvGatFQ8s/uHy4
         hpPbAwaOksX82vx8hea1TIrU8YjnQMorZvjpfSHGIH00p2BDWw210II1tOxIL2HSytR3
         UFXKxbgNLq84y4YSLMXaPX0gdVk/5/z4xgKSsX4dR0n0BFEiXT1H6VAnecHR9tvQTT53
         uLCQMShObuiYz89K/tgLGPO/8Ab5HgRjy4ylJwd5Rgunv0cjvGAQVTKni69WmOYG/FI/
         ovFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831183; x=1720435983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njCe6+CvWxlUBbdA/hjLIinZuACUMkq7YSRJUSzqvbg=;
        b=LF63sLwxQpopBdz+yUtRbkSVBoRbcC8ja378DEIuam4BqiyF6sMorJ92ogVI/30NnM
         s6BwNLWLAyjSHVqwrOFCk2tcTh+5lNP/i4nlw+EiuWqZoLZ1kJXmige7FrK2r4qHZH7l
         tmAeQSB18BAsznOW1ea+WtNa4/DAS/PZR4MfNQlaJI8FPYlR3tdwcQSeAEOhrzbnntWV
         z3pOeomXWyHEkeIAXn4nRcWRMW2Jt0ko51EXHohhMb6RYkOZE7LW2jprknUZjn9pAYhP
         NRbBqRKwifKLsk/iSZzm1k0luzL9gdnaCzhxtdB4NAcDUa4nQ4nUjT/TCuqh4DzsYQxY
         FmUA==
X-Forwarded-Encrypted: i=1; AJvYcCU80pJg38qkWws8e0njAIfAnHSyXula0FDZRDiPGYnGF8/8sikcoyy31sBtr+FoJ9ID7x+pJdC6XLqEgSVdcfEnAHLVWn/Wf7Q=
X-Gm-Message-State: AOJu0YyYnuwJFL58LgwhthBeaZPt50z7gTrllz620dncIv4AmmVQlGH8
	jplSyFiuMz3+SAKB7nffRcADzOdvUTrNd7qMuXLKydQZhrUbVRmZhSmXX4tI6Gw=
X-Google-Smtp-Source: AGHT+IG4c+IvrNyBN5N9rJ7s8WprtnzHujQLxXzxZpJmwSaQVdM0WGsZ2i1kl1zTbLXjd2sxrnmEDg==
X-Received: by 2002:a05:6808:1393:b0:3d5:63c2:17c1 with SMTP id 5614622812f47-3d6b2c1ebb3mr7720558b6e.8.1719831182871;
        Mon, 01 Jul 2024 03:53:02 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802564236sm6185399b3a.48.2024.07.01.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 03:53:02 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for ieisystems
Date: Mon,  1 Jul 2024 18:52:57 +0800
Message-Id: <20240701105259.972135-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a vendor prefix entry for ieisystems

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..0ffa8d06aea9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -609,6 +609,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^ieit,.*":
+    description: IEIT SYSTEMS Co.，Ltd.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.34.1

