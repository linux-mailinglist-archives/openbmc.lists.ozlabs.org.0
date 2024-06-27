Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DF91B29A
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:18:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jM55sWQ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dy1478Wz3cZv
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:18:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jM55sWQ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdm3nyfz3cW5
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:28 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f9b523a15cso10424795ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469947; x=1720074747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=770f2s193tecuqJzO0rEDeOzzz/M/ipXn0oDb/92wqA=;
        b=jM55sWQ+gCk+KH+BI3JXmUFFUkHBk6zXAdwPJnQtrStEdbtjj8slKWngNQjUpfJdwK
         1fI7z4lb9BnMgCZSPUjpUKL1D90qOxC0dYb4QSzwMm3MRQ1gnryponMI27Red54dRxMm
         OnTw0MXXqfLiBPyrplV9ozpHxjQE2d5jY705fJDxf9ODY6syNLsfuLuieDakNPJXoPGm
         xwQv5XpK2vPo8N89O9RjAFt3Nlh9JkklrDAUID9zGY5dZ9/08UqSGUiKhVIdfiNVFAC/
         CKnR1muOQoQEPN4CjgzTdhGCvTDbbLbAr2JbWSY5SrffGz32L8u85OE63FKAKorVq+Ke
         BB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469947; x=1720074747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=770f2s193tecuqJzO0rEDeOzzz/M/ipXn0oDb/92wqA=;
        b=H60wn31Dpni0pmcKykzHbZKX9ZWi2xWO9KeE/J7DIP8ENnkPCy9tR5qyYB3XCve/4P
         DyzQqt7vvQHDSatk6eSEZy72a+0+X3kqTgDVTuFOoe8C/LdGTG/dLkMEFU+gaWC8rMtV
         ZuzGobMZVBvWgkOTBQu2e+Zwmd470ZFG34m75tkhyz2h0B01m3BO9/bDiW9ssUifbW4O
         tSOp/PhEC9G3b2WBd3SSBfJJKcxtd21oHXMjjF3KIrNL6fxJDaTJ6E5UaFbl/uvbfJ3l
         54/BkWXi+POyZTDQqjelJW6A+187uA/DR7CXZVhZ3rsUSVIRYyW4QYW71AvdS8I95d+i
         en0w==
X-Gm-Message-State: AOJu0Yw85ar1UTYWIVk31kCGdjPdS7oTIxQc9HHwGb4YV3mDOy320c/H
	jPT6g2L3F2eUkPa74QXncCkkc9ByHOJ9ZVyUzAAvChndmVWje1OQhTD3+hjm
X-Google-Smtp-Source: AGHT+IEU+CBXKzJiK4ecFSMXx6A+TNIO6aP7UcSQE4+4lmcY6xeZC3UpS4nMJjHouqm3eja2gBtj9w==
X-Received: by 2002:a17:902:db08:b0:1fa:918e:ec9 with SMTP id d9443c01a7336-1fa918e1169mr46408535ad.64.1719469946860;
        Wed, 26 Jun 2024 23:32:26 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:26 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 16/17] ARM: dts: aspeed: minerva: add ltc4287 device
Date: Thu, 27 Jun 2024 14:29:50 +0800
Message-Id: <20240627062951.936256-17-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable LTC4287 device on i2c-0.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 093305b598dc..8180fa5c1854 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -144,6 +144,12 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@44 {
+		compatible = "lltc,ltc4287";
+		reg = <0x44>;
+		shunt-resistor-micro-ohms = <2000>;
+	};
+
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

