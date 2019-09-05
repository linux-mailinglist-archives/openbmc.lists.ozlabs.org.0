Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E73AA685
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 16:51:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNtz0l8yzDqhl
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 00:51:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::84a;
 helo=mail-qt1-x84a.google.com;
 envelope-from=3ph5xxqmkb5khld9hh9e7.5hfhi7g4f5eblml.hse34l.hk9@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kFQCO+IL"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNqP4JXtzDqT8
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 00:48:49 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id b9so2730852qti.20
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DBIgduCaugj8tqfaD9C0q1cOrYEMjHp+EVVP9xE+eQU=;
 b=kFQCO+ILTxycGD0xPpwoQ2n/kJ3/gIMamkdeAtF5gZONEcygdv6B8viIrHbUn7pAn1
 jsPrQfi+A5AUgpFzxVSBgYJY+wfn8U1b00aSKG/0puFKN9MDOdDuM3TRK06qBA8pViHf
 S3SVzRuVjVk+odURthKdo7VMqFnql4/SSn7EuZJhMyOedA76sMhZuNiTvFoQ5UOBXjTT
 dciBZ4RasmNWXIUULCEW+v9XFRolhBz3ew/8kAyesPCTnhxFhST6joqcANAAr6gi7w25
 aWy9TL/ETCspFPHhrreos5OCONl4Om8cu9vActrASMUIPHSt/+I4NnxIm7a/CUywGlAI
 Mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DBIgduCaugj8tqfaD9C0q1cOrYEMjHp+EVVP9xE+eQU=;
 b=UY6J9FQDLV/l/xVAQtFyS4nlR0fgh/0H3CwZEWHWS5FdbPGvlUUfMEkbQT2MKagi1W
 3cmfXykjFSNGqGFqORUCP3NuAUtL+tXVxPrf1hmId6vqiN/DI65k9DX50W6DyUt2ChDh
 19dK+u38eh0qLpErbUQBAd+buZJFfOLNFM9DjKKDdLV0Xv74m+DMpJDI4L2T4LaA+1Rp
 8u5RathjWLXq3J7XKfvHVQ3Z7ji4sSYpcYvjv3LA2c495tQ1SmFlcA8fYtZjjJeC8QLG
 08xzYjxJi4BZ6nZYUwK3aCO9xrZ3pyHcU35x/a1JVktfUyt8LNcT6RH/g04JHG3FiO6E
 9jaw==
X-Gm-Message-State: APjAAAUtWpsvNMWP3/WT/0wt3rWKB1mATL6tsKOoYekg62ZZa1fPJOl9
 jmL4B+IoaA+hkYB0Qd/MhQ9eLjU=
X-Google-Smtp-Source: APXvYqyNSVOy6oyG9DD0QBvBuTaufZmFloO9JVWmWZHMU1JZn5mMUAwUE7z3OJooXuAyecAHfFp7wjQ=
X-Received: by 2002:ac8:130d:: with SMTP id e13mr2670110qtj.287.1567694502968; 
 Thu, 05 Sep 2019 07:41:42 -0700 (PDT)
Date: Thu,  5 Sep 2019 10:41:30 -0400
In-Reply-To: <20190905144130.220713-1-osk@google.com>
Message-Id: <20190905144130.220713-3-osk@google.com>
Mime-Version: 1.0
References: <20190905144130.220713-1-osk@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v3 3/3] arm: dts: aspeed: Add vuart aspeed, sirq-polarity-sense
 to aspeed-g5.dtsi
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org, 
 gregkh@linuxfoundation.org, jk@ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable auto-configuration of VUART SIRQ polarity on AST2500.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5b1ca265c2ce..06e489c1d0cb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -351,6 +351,7 @@
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
+				aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.23.0.187.g17f5b7556c-goog

