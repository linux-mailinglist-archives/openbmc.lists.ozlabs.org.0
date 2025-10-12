Return-Path: <openbmc+bounces-727-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B3BD0037
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 09:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cksKJ3r6cz2yqh;
	Sun, 12 Oct 2025 18:18:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760253524;
	cv=none; b=mvH2AIwwKrexgAACFnGSnVffLn5gdODe0EiSscMna0BayGcH1SFcyw4IP2OjuCLxA4U69Ed/udQeEHNqxGkMgZen4Fb18kyVkUFmhE7AIU1ChUKYXVGOg+0olbd6sclF5n7SsmXKZzTu7MRZK+vrEfVNUFhtlIFfQm4PViHaQiER+ijJjKkotu58FRbLQBqlIwYk6f8NcftvEf0Ey5pKcBnqDyECpZySuVN5M+eHhhrjD1zIiHsdzzvDvS+Ym1bChkZhu+eW4lR8P8pyowN90KWeGj+VLzsB0IhdjPGw4sgvWlRTEOTGiCWzcmU0K0qM+9jQ4AaEQRpwY5nXD1J/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760253524; c=relaxed/relaxed;
	bh=D5T7MVoGopPH3NdLP+kKORFv/D5+5R3n6GVQcUSCQBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fD3Xb68iOFNmYtKS4MMbkd6wW0K/HGIsHfQD6XtWcfytErbLtlr+G4SNQJHhLF/O3KbTYhLsUM6felQ/reXwoQ0+Uq1lFjN0/g+p4jHRMIaNqwmOe4pCxkEd5NKmO90R7NrPx74UAINJ76jzeAKizOKbkSAHnXEq+4hfc4HAOsfPbnd0pITYtX0IBgIlGfLVI8AXlXqr4D1I383oib9LEu1GaCN/77pQllQBITkHIvjvJtVywqFxFGKRt5nf/hc3y7SyAA1CcgK62JvEv2UQd2HlNEXdkLRujWXM1BgnQvlogoW18on1c1aqqW/upZ+EMiQPQLziIUuwHMf6WbAMEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TK6Jp3iN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TK6Jp3iN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cksKH2yVlz2yGM
	for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 18:18:42 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b57bf560703so2130601a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760253520; x=1760858320; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5T7MVoGopPH3NdLP+kKORFv/D5+5R3n6GVQcUSCQBY=;
        b=TK6Jp3iNDpe0DAgw6J/umisUjzweliCIzRnS/bQcF8iBsVnqC+Ak8x6a7cg/zHckIE
         RtqRn5vCc/P2QM8VsySsLtFfPlbaZFB/UcOC7zqNYOL1U3wShxD8Cs1K8CaYi/KlanCr
         sAihp/u+Il4ST4Dpvg+ctD8Wmty1QXuSi2dbZrAk+KTqx0EvXNzH4cFrwRYByRjesqGi
         EQKTQJMf2kUGft/OED3C9wE6/mg6hR++v5r3uqxvoIwY2GiGtA5COSNvD6uPyU7gkq8c
         d86/66lB0KRcLkVOzrP5E9uQ9dRFch0fswi7T93JJfujVH0D5ZcFIBj/2T2HMN9dYwiy
         lj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760253520; x=1760858320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5T7MVoGopPH3NdLP+kKORFv/D5+5R3n6GVQcUSCQBY=;
        b=rHPq02ko6BBu56Nf6hU8tR74w61wRp3ynnbFty0mHbu7rSDAFjeIwCsvSjMRrbu4Kq
         T3myq2tc/WtE0cMID224gV+A1PoKGzZDvEOeWDBHeivitypXthAiI/pNgIhiS/WirIHl
         lK4tFpqk3Ise82Ygb+esToSmjhOJpetYlJXy7aeNI+Siob4XgJcUf98r/7xljm5l0hFQ
         qIiIReMqsF0doohIF94b+JarPvCiLnh7VcGPIjkGs9pfy+q0iptlM+7ScUUjGCAyfbFi
         xiAlkGyLgoi0yd83DrqMmjwCHxPfyhOubTSZCgIYAzLanaUZtn2pZTCM/txOmWMx9eQ2
         qonw==
X-Forwarded-Encrypted: i=1; AJvYcCXuI0ARmg+lt/hctniTE8njF77aNuOf2IkGBYLGQlWcR4LY/EJLr24jpNJtxvWz1ZubP1UsgxBb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbH+Sl6uC164rOs6RWV4NpULkfqUDswpB94aQUUrfTdVh/DxJG
	CJCj98eYhztt9rh0a5tlMye5Tj49uv797SHJCy5eVvE+5f06sgiaSF3m
X-Gm-Gg: ASbGncvM+uSFEu9ao5uttdpGpM3I58UI/hHlMFZj8EA8INYTrGNHpv24u+0MoOh91pT
	TN4odb+J+b5CDRha//4hBFWq32aLDSFjmka7ne1QaylGpBnxrem1IWL9lg3wsugs/LOl2f9ygZb
	MeeGHH34U6WlEp5ajp/xUqx462lnvVCZtpwo8OxrDrMh0yCzQxyk625XR5j4YMBez+xwsqzTgEX
	fYkrkrhBPD6sbFuJvT9W0Js7T7Ad8lIsF40RMrJb77ceLYphNywDIPqKqhQtjBd9FfTJqIFo/Cd
	hqj6T0eC0ONKZwMWDGNOc5hpr+hjE/wF0VQgFmw28Ci4Pg35OcPHnqE1fSNMYoByhre2/wUDD8M
	9x3aLxrgeAM/PXZcckXwsEs9D93epxet0cAnO9WHv1fROglcEhhwNkMEZgqYTwhs3LvuOiGoSeQ
	szKShwKqrrG1jY2KLSaHZ6m3ameI5QRjfn4ohdX3bI/PvMOFtmlxBC
X-Google-Smtp-Source: AGHT+IH6Jltyok7q2r3zeZB89QuJnqmVRCgEUac77t0FjqJipqTmtSjgCp+6az1Nq3DFAgKHCrTKsQ==
X-Received: by 2002:a17:90b:350e:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-33b5127abc8mr24213105a91.19.1760253520474;
        Sun, 12 Oct 2025 00:18:40 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b6192995asm8437897a91.0.2025.10.12.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 00:18:40 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.12 1/2] dt-bindings: trivial-devices: add mps,mp5998
Date: Sun, 12 Oct 2025 15:16:32 +0800
Message-ID: <20251012071633.503539-1-chou.cosmo@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add dt-bindings for MPS mp5998 hot-swap controller.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20250916095026.800164-1-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index edaba5cd8434..12cb7f64b988 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -297,6 +297,8 @@ properties:
           - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5998
+          - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-- 
2.43.0


