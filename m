Return-Path: <openbmc+bounces-752-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89DBE5B54
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 00:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnjbr5Nn7z3bjb;
	Fri, 17 Oct 2025 09:41:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760580888;
	cv=none; b=cRrUb8Yo+ycLOXGKi/6ECmxgzGOuuZ0VLoM5HbHqWxa5pPEN3ha+NP0i7OEsrncXqzy9sOdTWm3cydmWhdL3O2WZVRh0l7wBjaPzt7arakHy2q9FNj5KU/dqUl5h968R9dH4pLX/sAAegXTtDF0gAYR1fVGgmU/YgQtO9KZi4BuYpDL1SBdWA8TEX5AsftUvOw62+iJ9wIURxRBNu6MMOR7/WcDhpV8HHfZbjueWaI8iCYTMLFBbA4Eg7T85Hjz7W2NzYlaGt9sCUyfcuXX240s1fRiXaLHjnAGFrk81iXETm6jkp/F9bXqBmegX/9YMfaV3qBuNbAtldtg/3BRFew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760580888; c=relaxed/relaxed;
	bh=OBQuf2Elbm+K3OtRhvOrhRg9z4ROgtSeebPIp0flVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1+jUaIcCCRmgpHYDVcHULVGkSvrj0oj+rDtE73nTeEHyMt/+V9XPqrmuardYoptiybpSrgcztZFRZ9g7u/UvM5VSyCY2SFL+VbxfaZ6zc3IFOzbG0EHWsjegVg+X5DqtP6rfR1uTYSZKrMxTnDyIUeq9AcNOBApa6MpCFO6STRhk0iiuuN746Wuu3QE2tOLXAbqxpJf5iW/WHF0XJZoocCwGBiuWpWDWpOGBp+BIxThpomAjJm0yQ6VlNqzRbgrjknqbsMvhJzFhtVrdatmf7DN9yAkTAqZadnxzpWdPy00WJAspf/EHXVCgYfdW4uULrO/mscBYlHFR9IA+wGecQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GHhMLFkC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GHhMLFkC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=leo.yang.sy0@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnBNl58Z5z2yqq
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 13:14:46 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3352018e051so306637a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 19:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580884; x=1761185684; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQuf2Elbm+K3OtRhvOrhRg9z4ROgtSeebPIp0flVA4=;
        b=GHhMLFkCALtWoXeL7F4ic9G5KqG0P3zv4jM15gv8rKwEV6aQ1OH7d6bMqfziZwktLz
         s2sDP29ZrIWIvhovWzHOH1WuByCtf9Zch6D0i5O8fEAX9uKJc5qW7DcPTPyChFv2a4Gj
         bCnJr3YGCJDojk/d8YbLNqCzkzXV3SjDgtz+Slv/1JYHiTqDDQvxJfTlyOdTipnsjcox
         mzfmdll1znGQEuY4gppeBaFHu90gNEvvCNChDAv74QyOvnw3yx/CyipK1dp38RMQCinI
         46qZFCLNHsjXMmTu3U11s6erV7TFpVcyJ7eJ4MBcKCE6HZb8cHyxVHETkBGemTkwWEKk
         NTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580884; x=1761185684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBQuf2Elbm+K3OtRhvOrhRg9z4ROgtSeebPIp0flVA4=;
        b=HMhbyPVmCgTGOARRYHU9VHRYfPKj3uNpg/lUL8XL6VBYkQT05GJngYvts3XNs0cfnl
         GR+hw0/Uqk5zFo3sfqoyoC4UwiJEJShB5UTNYLUG6OB6mXv3hfClRu4fagD62tFSIMg7
         EXnDh5Up4bPgZ6+TfLNfmk2INzBQUNS0wrESte9eL2u/kqV+/JV7JxTp46LStLRU7K8z
         O9BUXMZFoPhu/2YYZMDAb4VUtmQQZ86w8Kjn5lqRhkKlKCKXSL1sjl1XcAEbFpJXvrKV
         Ygdrdc6KtjWMSPmLrNRFSrVaNr8srEgqiNnIDRjV4zqONuocf5aOyRPfrf3R8dGyqWD6
         fAwA==
X-Forwarded-Encrypted: i=1; AJvYcCUzyN0vgjYLL6TFv2JSD94toKR+fHbQ6TSrN4cXrYy2kzmfssC2sjyepAq3IO4HKnYljGQRhjrn@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxALJDW9+cutYpJ2BLx2Vqr3/Xcd0tD6FRv1tSSKxzjyKvTlKBM
	xJEasHGIZ+bk5lfw2D8+znqYWNfn8AZyxROkqCqQZIe7GJJk8J3XvjTj
X-Gm-Gg: ASbGncu88DnTFMxy1ZyRVEzVhkwlJ0Qpge8t68PpmzQqIR9brO1+MR0rJYdDS4nkpjQ
	U0xBfCA6zvm0erxVxFOLx5wFHD3hwmmWYso726F7DKDy+bqhVAv41RkUifeB1iZLCPshKqtmRT6
	AjJC4/aqQ9dE70b8eY1Jguk3V63U+o/znTkS74tsTtsSZ/VpmzTuymTvbQJlsTBLASPIj+zl6wd
	X4useNeJqjCppwRPn6VVZQXJ6pe8wEgAcLpACXcMkhFMJljjDtOaRdlfuYMrVGEAwWen+3JWypX
	ENIhX/KkX8CLL/ZseXzJ3jeWfhGtNulL450hXlBfcLwwIPUlQ7wBppknAg6JmjDU2L/YN+X8PCX
	j7iKARW+j782h8Vo1rY6aY1ecZd4CIDWGiOunVmgoM4TL9wSlpx86dnw/Kk+A5WUdzOVpPl4ygg
	UMUvEAcvO1wZF13b+W+CYf++AAkF3b9uv6vyaMSECqmxjiPF/PLioYVlkI4AjJ+Q==
X-Google-Smtp-Source: AGHT+IGhApyVJpbQy5WZoAI29MsApXNBkWZvYyyMDK0pQ6K7a+gNG6pVW2FfSA/6nvhqra03zt2p0Q==
X-Received: by 2002:a17:90b:38cb:b0:332:906a:85cd with SMTP id 98e67ed59e1d1-33b513757bemr43598609a91.19.1760580884522;
        Wed, 15 Oct 2025 19:14:44 -0700 (PDT)
Received: from leo.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7af3sm21140553a91.17.2025.10.15.19.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:14:44 -0700 (PDT)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: leo-yang@quantatw.com,
	leo.yang.sy0@gmail.com
Subject: [PATCH linux dev-6.12 1/3] dt-bindings: hwmon: Add MPS mp2869,mp29608,mp29612,mp29816 and mp29502
Date: Thu, 16 Oct 2025 10:12:34 +0800
Message-ID: <20251016021241.1873764-1-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2869/mp2869a,mp29608/mp29608a,mp29612/mp29612a,
mp29816/mp29816a/mp29816b/mp29816c and mp29502 controller.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20250805102020.749850-1-wenswang@yeah.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit c97c66e04c2294d59827835e6fd46e0e4a5e2c06)
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index b921e6a75a66..c12474b02718 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -281,6 +281,8 @@ properties:
           - mps,mp2856
             # Monolithic Power Systems Inc. multi-phase controller mp2857
           - mps,mp2857
+            # Monolithic Power Systems Inc. multi-phase controller mp2869
+          - mps,mp2869
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2891
@@ -299,6 +301,14 @@ properties:
           - mps,mp5990
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
+            # Monolithic Power Systems Inc. multi-phase controller mp29502
+          - mps,mp29502
+            # Monolithic Power Systems Inc. multi-phase controller mp29608
+          - mps,mp29608
+            # Monolithic Power Systems Inc. multi-phase controller mp29612
+          - mps,mp29612
+            # Monolithic Power Systems Inc. multi-phase controller mp29816
+          - mps,mp29816
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
           - mps,mpq8785
             # Temperature sensor with integrated fan control
-- 
2.43.0


