Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56C79E64
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 03:54:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yKNs2pBMzDqS3
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 11:54:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::84a;
 helo=mail-qt1-x84a.google.com;
 envelope-from=3yai_xqmkb5qcg84cc492.0cacd2bza096ghg.cn9yzg.cf4@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n+Z9JB/7"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yKJV0cRXzDqQh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 11:50:27 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id y19so56998944qtm.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LpSmR4b0xsEvJgpOdGCDfTto9aNZn9W9ZEvgfMG3rU0=;
 b=n+Z9JB/7+yBqfM7M5CQ4JfnRJKCLJHbjUBKlqCRbGaWmT7sM71Rl/Ln55cpsQUFCNV
 3wOZyBuD/VrcXvnyOc9eXVSmoHLLxs/QU8S251xOWd4H/iP4cexTEY3+p9PKakDjEkS+
 nFrhY0mhF3DhA9hFJh7jyFPtFvutc1B3o6ARw7bmPTKvF/nbhmVglND3WGn37ZaajfSr
 PpYM+WcHQNq3vrPPEFSoq4lLqWlmpzOAUphZ11KytmnyghERmeY4+qJBFbgrUfBnDKKr
 OIjlQ0fkgR/d6lboWS9q3nZFIssi1abR9uhiyM6jHs0D8Pzkc58FTm+O8tS5ENA5WNdH
 WNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LpSmR4b0xsEvJgpOdGCDfTto9aNZn9W9ZEvgfMG3rU0=;
 b=P7s+DSB3TZJYbjO4R0nqVVu7OpdXoWx0lYNWHE8Ib40ZEb69lRf1EF5nc6Y1RpeP5/
 +SdXyJlTrLZPN35dTHeQk2xGu57TzgFUfaqrdG8Z349bJ5go/k90vEjQy8g3847RK+LK
 lp1uimrFkjMLKHSbYLexOcWNqF3zP0bMjV35vtTj3uPREBo7J83CXuurK4dNSYZDh1wR
 ywIe5vIz0DqzSBB4zeuHPrLOaMl/IfqxNlp1X7cl4SNByzYZoV5hR6C1UlZkqJhn4g9x
 JmaHK/TK0EJymjQg8127SwK7JATZLvPnF0r2pPi34OhVNa7ZO+QRwPp1aplI8efnmBer
 QI4A==
X-Gm-Message-State: APjAAAWePR/F3HFOmO9Ez9YTkXlAC1S/vvAewI7iCaT/0C7rwfo1Hrl4
 /Hj8RrIiw50Z1/WjnaUhdzQIggs=
X-Google-Smtp-Source: APXvYqwB1qBkD8kSdwW4LDuQuPMLSX3wGN70fmkaUdUDS8w6O0shojId1cD6/PWExM+aM0J2H/rhKaA=
X-Received: by 2002:a0c:ffc5:: with SMTP id h5mr81464007qvv.43.1564451425070; 
 Mon, 29 Jul 2019 18:50:25 -0700 (PDT)
Date: Mon, 29 Jul 2019 21:49:55 -0400
In-Reply-To: <20190730014955.34059-1-osk@google.com>
Message-Id: <20190730014955.34059-3-osk@google.com>
Mime-Version: 1.0
References: <20190730014955.34059-1-osk@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 3/3] ARM: dts: aspeed: Add uart-routing node
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a node for the aspeed-uart-routing module. This node, when enabled
will provide control of the Aspeed UART routing via sysfs.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes since v1:
 Added AST2400.

 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index dd4b0b15afcf..d855bc19d677 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -326,6 +326,12 @@
 						status = "disabled";
 					};
 				};
+
+				uart_routing: uart_routing@9c {
+					compatible = "aspeed,ast2400-uart-routing";
+					reg = <0x9c 0x4>;
+					status = "disabled";
+				};
 			};
 
 			uart2: serial@1e78d000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7149ff3b6fb3..9e561504042a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -440,6 +440,12 @@
 						status = "disabled";
 					};
 				};
+
+				uart_routing: uart_routing@9c {
+					compatible = "aspeed,ast2500-uart-routing";
+					reg = <0x9c 0x4>;
+					status = "disabled";
+				};
 			};
 
 			uart2: serial@1e78d000 {
-- 
2.22.0.709.g102302147b-goog

