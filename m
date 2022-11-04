Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F3619D14
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3mCZ36bqz3cLX
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=QctwYSyn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=QctwYSyn;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6q1r3Pz3bhR
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578743; bh=Pw4CakiY0E1l+i7XqKoO2ReaXNSJlyEur6HQ6/k4BHs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QctwYSynsohZyjY1O+iFjG/VhtoyEF2KswIA8ztlXiaJJVToNlAdm98TXLeemI1v3
	 n24p0xasgRuE22cEs1q5OYAtYNb2zmSQXT8q1zfRNCJaPhT9oEeecI21ELoMigKbFV
	 FVkHlq5aMk/AtZ57fDWIjqwSkr9Uvo4aU8nT/7VM/Q8G8BJThH6tspmXV6TYeCIvWt
	 CFWCT0iCvITgZTD6tDIKpFNpeuRmr8/oqi2peNIVrTu84awV6wmLGRGZC9lJTdDi1H
	 qYk0OWza4Axjx28ChmMpMHK4sZpDQoNlLKrzDJtw9wweG1EKwBUXXKCZHzNzPf7e55
	 14sSVtAVyCWQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1pLKGe41mo-00oCsy; Fri, 04
 Nov 2022 17:19:03 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 1/6] dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
Date: Fri,  4 Nov 2022 17:18:45 +0100
Message-Id: <20221104161850.2889894-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u1a9x+P0LGwj/elnlSQC4Rx5lPLQ1qTTs5cfZngE+CoU5yTyC87
 7y2UAeUNkYVbkXUH3J5qmFUhmm/US72SI74GTLRukaxtFj619WmIARkln8jqocyFcmOefg0
 veZ1EcslZPz4kOWtZCF5IiFFD2YiVSCNEZBnynlWavbkCnuxxNLA2oUeL1xiOixqcrMIvRO
 9kvRgOBKnMDxzk9jCkzgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HXBfJJuJpek=;Vm/3v2yoTR9tvTyf0zQzVJ6mr7g
 j9qBisOmMdmJ78+KVTgWkso50NZ7euWq87LZyndvDulxwFk8ZKvXhJK94tk+8LqmqEgyUyEPF
 dwFZEWVwytLaO5nSmqhfU3ZC/Pzi0SymaNvxe6ONpHTja+stmYFFMALAK0wrri3OpDP2KQz4i
 IeWln6TbekfMqjSbYVFwqz0HHP8eB2vtzF6PT3/lF3oQt+6chmQIJ6rMFfgXigvnwbr0i3U4P
 2axe9fzKRkQJbApO2qEK/6g52Qwwy2E4WLEahIH+PKJ007QqRcCKet76uKWnry7R88WodjYY5
 CGG2sDyrbw2q93Yzik+kHnt29/come56auSrCeNstBieHsSA1ts2tOlfT4UCD8AJebwVfg1/d
 UI2NdxW6GvDP/L3zwt/8/UYqearH5tB8Q/s53T7IpRQRbPhJqtWm3c6+ZQ+MEjuCY2vv0KM+x
 VdtSOpoM9rssXV9WRwDCAM1B5uQ+qyXWcKWQeTefTs7IKYvyOeqTvNO9sIXxkkuJpOr4gHXB2
 ExWZFCdkFo9EidrS3oxopvH5DUI/+XFxJ0z8PQmDutv6lQei0WE6DybaCtZaYBRo+T/IlAnKB
 e5N73REVdWFrUx1+g9x1ItP9WET53VWnDMtzD78ogdZc4iUYmiJ18p7/mg4fpcUHWTTMnmJcA
 3U2K3zcv20AqjZQlP3qyMlWOaMFcMk48cXxozTP7YvAnuimjIed2s3bQVU3Zlz3Y2dXwL+Y6u
 cvva90QXYRiN0bex+7rC32WbNeguxbMNt7llLrll+7ZDKmywLX+XNKHtk+/8IfsHyP9PdotL3
 VpgzVuE2h9V/RHtog6XxG+sRRdsZuySV9C1+tImGmhqtUaHnroFk2Wkj4Hai+cePV5YCCgy5i
 pO31LZWpQ7CIGF7lchSyZs3AyN/3XvyeYvAX4c5N8LE4na/4k3+80MIiA6cPR8UPQorBXyUzp
 jDzRqMex2oUPwWxigspAiI7cKvE=
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

v4-5:
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
index 737af78ad70c3..d53e1bb98b8a6 100644
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
@@ -25,7 +25,13 @@ properties:
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

