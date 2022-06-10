Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA0545D4D
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 09:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCDx1nzCz2yyQ
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 17:26:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=CuMibIAZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=CuMibIAZ;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKC914yycz2ywN
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 17:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654845718;
	bh=IQX8e4DimYSxfYiB0892MoZKJaCfS7TtVYY2navJcRE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CuMibIAZmB/ve2MuTr1f1+wZVderTUs7KGiC13adrseH2oLgJT4zT8wqkV4hqMauL
	 8W7TK1+u22oOoDY+LIJa8HI9JXrLrseZbbirKlJmpgTR57jaaVfz2mLGe9ob7FDjlf
	 D3eeelWzAIdUfOHB8PbJG+WpyqqpqS1JuXdF7UJ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1nlLT91uOb-00ucv9; Fri, 10
 Jun 2022 09:21:58 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/6] dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
Date: Fri, 10 Jun 2022 09:21:36 +0200
Message-Id: <20220610072141.347795-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610072141.347795-1-j.neuschaefer@gmx.net>
References: <20220610072141.347795-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yBVwif+DGktWM+o9r7sNiZrEwl/zKMtKSiq2+UCGtlsbNtgIk7x
 /bbX2sXzYaXAHSx44puYxomiEoqtXeh96nX3Juh/ZB+ZLZn7Na1fVtezN2XCv8yIcCHMfOp
 6fh5zvIqvP5lpYYiQJ7clKDGsnJE+kiOYvK6wveqk+3IERfbN/R0A10m7PgewWhnTtZnhXG
 pxyEgviIcFGYC0xKZ2leg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OysjaKN0sh4=:FlL2Ak8DjTMz8OOajXTmsw
 tDNGd70HsIgiPxXBYKsnztMa+Fk+Pml/h35M59WmgIjr6X7U/mOLkuQ2CqYDhU+5QtbWB9UTx
 nq2ioahzPVyDN57LmqmaFIppfYPuPZQz3APeIcRze5Qd7FnCtu4OhWynBIF+3J8ymqX1RjTxN
 fgoTN9Q/YbgvYTBFlVib8DB7ZSJkH/8Wnp4bcL0GfereOLuFkqzXWT82pCKgG6/CcRdO6APNO
 1R/KMbXovtwtwuvHr9U4HVg4jjG86Lcb6FBhONxvyYH3nQTAtAmE/jpSoA7jNFfK8YsEuW0nC
 pxpCMS/iGnCkNaQD7uwxPRf5J5lOnpPzeKat0wsEq27rJbwhnDzgfm/3682Pe/1OrPRsXJRvi
 u56mUm4jdBx9VgD3xlauvcTHaFVap/4K+OFihvebbxT+oiR+OE1wJDINFPhwAuEGg8ap6oAbC
 jCaKogVszBpVuu1YBoz8dd1YoVOOPWH/CnRzgt3OUUsSGrkRr79o9cQlPp7mgPln6y8mnfYF8
 b+9RWX1AYtt9Sf8pPCVs4Mra1Lp4tqVyEqqG8Z/b2bjbCJMtSbruwpExkvVWClZvhfGflRkBm
 1+K6IVodoq+l8UNxpIKMA6UXhfjd5PNC75ZD5laQh0aobHF5SdjXMS0HM7XPaJ6BCnEbt8Ycu
 jfYp1Sj5wc1VD/NZg32B4hlS3/YGSBK3BA+B7p85BiFB7rQwOlGglNi7Wfy7A/KlwQ+6yCj2k
 seHkoCEKI9cJd11pQj5Z3+MVwEzs7SbugxIKmKM529HEXfKvR6+oqzRRHfnLr2m7a6dnnPDUW
 fHgmCami6/UnQ5crYy/O8IH2CzMEvWH5aFsZfCtpd9S0idSlkYOMxnkOTZHbG2NVUPOOOomo7
 9IzKqpehLW3E009ZA8NoQKXcbIZA23AcI75h7CVRD2RMqjkNCgAUqwB0DINaC3CyrCkyIbqeN
 8b7qgM8JDN0TAAGrqtBD+kZOphVKi/KJeT08BpqepDP6olk2r9fcmu/HCQhodinlbp/AoT1ex
 znrsGHZEmt8fmE3gExnaK0Xp0JVSqUZlQYMKsoOB8lhzR6lo7kVeJ0UnAGZrs35dljK6FJVVj
 BBjbXARDBPTVPT7acTieD/ZFkAbFNfWWZp1yyqGUjLXPrQqO1sU2WQ0Rw==
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The timer module contains multiple timers. In the WPCM450 SoC, each timer
runs off a clock can be gated individually. To model this correctly, the
timer node in the devicetree needs to take multiple clock inputs.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Rob Herring <robh@kernel.org>
=2D--

v4:
- no changes

v3:
- Add R-b tag

v2:
- no changes
=2D--
 .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.yaml b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
index 0cbc26a721514..023c999113c38 100644
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
@@ -23,7 +23,13 @@ properties:
       - description: The timer interrupt of timer 0

   clocks:
-    maxItems: 1
+    items:
+      - description: The reference clock for timer 0
+      - description: The reference clock for timer 1
+      - description: The reference clock for timer 2
+      - description: The reference clock for timer 3
+      - description: The reference clock for timer 4
+    minItems: 1

 required:
   - compatible
=2D-
2.35.1

