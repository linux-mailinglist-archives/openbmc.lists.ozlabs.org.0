Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCD2EF29A
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 13:38:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC2hM55rVzDr7l
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 23:38:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gi8ZnImC; 
 dkim-atps=neutral
X-Greylist: delayed 366 seconds by postgrey-1.36 at bilbo;
 Fri, 08 Jan 2021 23:36:22 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC2dy2QLFzDqtN
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 23:36:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610109375;
 bh=KpCMpUy6VUc1Hr1ym6ONwZxAKziozlsCHoXJ7ei23Ng=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gi8ZnImCpTtkC7t1/b56nby0hPe3oR5qEBbd5pZOcTkplP5Mq0YfAwl1LwsLk7YUg
 5Kg8thnbVU3T8FWotWjOlsfVeJ8HQB56U8V/8rbkEsNQGm4Wz2vOPaS6vOxL73cqOI
 5dPGk5aKED2Dc4Y4PItDnU4gsFnMgVUnhc55+DRQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1kv73d068E-0063as; Fri, 08
 Jan 2021 13:28:19 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: nuvoton: Clarify that interrupt of timer
 0 should be specified
Date: Fri,  8 Jan 2021 13:28:03 +0100
Message-Id: <20210108122804.359258-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+I2sI3Dy+uSuRw4shPx2VBxLIOPM5YM/mSuhVlLMSX1EyJVcYS5
 U24ERaShIptBAGYfJhC/vf6h180d1PakfL9R8FkqI6cV//Td77xXkjmBg/3OSws+lIfx22t
 9ZEuSWRowbqvvyMYsvBcLdRG+4thuWNfwjc6cvIHGi13OqrsziYDl8mtvFdLuKflKM7AhY0
 KKMo/TemmlIfo46wwPiSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3UXbayaj3nE=:0QuknapXbVZ0l7Qmnu8YYM
 TOeqRntGZpWqOhjUY9IkJ+eO9WQh470IUWmbHqWFGO64bTX/DUvSffSh5X9uYkUyThTXN+fvc
 9sBv6QEdw89CyfEYatUdltUv4btNnwyf/0k7Qr8VZ/DP13IUAjpZhAJQCG24xDpASsVqqju0y
 vNn2katVYNqwSYaZ294gfwbrbt9V7muPdDflncT7HVjVNmd/grEhfYrE3ee8u2BPQIu8NSBTr
 wRJxK3UbvtvTXt5H/aUJF1fIxadUsGwPHLMlvg+Rqw2kpBzgqfc01DfV5puUDGeJ47DwdCUCR
 JcDSyU863YJ1ga26E78xUYmOFtK4PD0CvmrwqHwGy6+BKYljgkJPuOFC/9LjzvfshyYhOfJPF
 ATR85YlPLwZwzCSCU+oaqlGm2hg97tP+BQLsC6MSgZo8kwiYM88nYJD64cdhluoFRQHIHIHXE
 PFivDAUm2qyuLCixpMV5ugs0L0t7iM5H4tATApGTDNmi0RPe0i5XNZW4BIw0HArntjEO40SbM
 DGsVOQHsbrkSPT3Uui94vvoW+Vrhcn7y51K++VPvoxLXdw3mLtdhg7ca2VZPaTNhZ7sE/hsF2
 SGeeD6FqBFUR5AHVAK4oTBaqs9O4JWVvjHWl4E8M9EunpdwmY9JSGIRUv3lGB1MXgjMDWwEMZ
 iSJixu/TO7hm+BKv9lmq+UaSdS8t9PAymBmYcGIgT9m09Of1QDsWtqJTBFDUMtVGGSQG1niB8
 Hpucf1APz1Ns99GherABttzmhVz/CmKhMW6mV/8IBSWGhlEIGDD7JtMkMgh7KsGAxB4lpRoOi
 ttG3KeNiD0b/u4X/jbb6k1v89pSgp8MSyGe/dhkuK559n3J/6LZOiXw+jzB2giXTwCBFnKcTH
 F/JJChouLe2KmV+ntDFw==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NPCM750 Timer/Watchdoc Controller has multiple interrupt lines,
connected to multiple timers. The driver uses timer 0 for timer
interrupts, so the interrupt line corresponding to timer 0 should be
specified in DT.

I removed the mention of "flags for falling edge", because the timer
controller uses high-level interrupts rather than falling-edge
interrupts, and whether flags should be specified is up the interrupt
controller's DT binding.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
index ea22dfe485bee..97258f1a1505b 100644
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
@@ -6,8 +6,7 @@ timer counters.
 Required properties:
 - compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
 - reg             : Offset and length of the register set for the device.
=2D- interrupts      : Contain the timer interrupt with flags for
-                    falling edge.
+- interrupts      : Contain the timer interrupt of timer 0.
 - clocks          : phandle of timer reference clock (usually a 25 MHz cl=
ock).

 Example:
=2D-
2.29.2

