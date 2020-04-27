Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E101B966D
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 07:12:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Xw70Fr1zDqXd
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:12:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HglTsm3Z; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Xs3644jzDqQD
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 15:09:59 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id ms17so6958035pjb.0
 for <openbmc@lists.ozlabs.org>; Sun, 26 Apr 2020 22:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1MVj1WaKmkBFxy1FYY8FjRR4aHs3RKna3K0kU4tKmq8=;
 b=HglTsm3Zi/iJTJZiU/5/JcS8VHaNTFjQ/0ppJKvA6y+Rt8yepbyGjwu7SPcszZMhmu
 D5WIqpb8WpOCI7mwj4NO9d4HM6RBn/PZRUQY6MesM2Qy1ATUhnlDP6VrqPg00PA9OqRf
 EMHxBtsXJ8+5meWUGLd+LNL2qt+mNS4ghig1MDoRLesC9vznoEcz5/xcgo0YASr8FQ5c
 8EsvU38CeJqsUzaiTepaiKTBO6tRzQkSFU9ziqjypMYkJbabpte6erFR5CJeumu5tlD4
 m4+T+1QyykY26kqqMVDD4C/Lju/QJztMjt4aJzE6G31+mOOEvj5qbanIdEHIXdXdagbw
 06nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1MVj1WaKmkBFxy1FYY8FjRR4aHs3RKna3K0kU4tKmq8=;
 b=jRAu4/wtp4OcZsg8hdKUrRs9RoBdlsZS3j7/1Je7Bb7IlarIUtN1e6Zpi1khMthf1d
 XU3m8mFaPgMyzrHWIXSG12rKgCoJF9v9+wLApSjD+ol5QqSM4k3utSHcS2mugN7HFvoG
 TcCdEb10TNhhk5dzK/sq3VhMM0AzK87OfC2tZBFDym81uNYKU0EKK2NO1mznzpox4199
 m2jDoJnf2Vl0FHyfwoOhwHlO3AQASGeGjBZxnvDt0ZqUML04XgoLuylSwP7sHxwEFOPr
 ZiwsLJA5MKMEfTgEfSxOreEiHUFjiZ/UdWRt2FqwbMYgBWEIAoOTpI4+0lo4frl/3qsi
 sq8A==
X-Gm-Message-State: AGi0PuYif4ADxq+sUt/I7e3Ugc+W3jh1tccwmlANoK+UYHL3S22wzY79
 OF1C9gOQ12YouIrHdkDOLtU=
X-Google-Smtp-Source: APiQypKA6eY9RTy/gYD3SIXH0D7Yq8Mntj9SglTPM545k3Q+N8/IaOhym/ztp3E3F+kt+6LkRwM2+Q==
X-Received: by 2002:a17:90a:ce02:: with SMTP id
 f2mr22087994pju.144.1587964197220; 
 Sun, 26 Apr 2020 22:09:57 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id c2sm11395639pfp.118.2020.04.26.22.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 22:09:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: tacoma: Run DDR
 at 1333
Date: Mon, 27 Apr 2020 14:39:44 +0930
Message-Id: <20200427050944.2177237-3-joel@jms.id.au>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200427050944.2177237-1-joel@jms.id.au>
References: <20200427050944.2177237-1-joel@jms.id.au>
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Restrict M-PLL to 333MHz so DDR runs at 1333MHz. Failures were seen when
running M-PLL at 400MHz.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 302847b1a8e5..b56d0029c655 100644
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -39,7 +39,7 @@
 };
 
 &sdrammc {
-	clock-frequency = <400000000>;
+	clock-frequency = <333000000>;
 };
 
 &wdt2 {
-- 
2.26.1

