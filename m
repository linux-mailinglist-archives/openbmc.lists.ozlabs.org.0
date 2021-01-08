Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA42EF5C7
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 17:32:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC7tm6m5yzDr9L
	for <lists+openbmc@lfdr.de>; Sat,  9 Jan 2021 03:32:48 +1100 (AEDT)
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
 header.s=badeba3b8450 header.b=b59ioWr3; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC7sq3DD6zDqvg
 for <openbmc@lists.ozlabs.org>; Sat,  9 Jan 2021 03:31:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610123410;
 bh=ABABhJ8gg5BskkIme0zJhOFkjtC3oPm+1iSMQmPnbPs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=b59ioWr32lP2YxWwcp0CrwfNm9voWN/R0PMUMygXSKWf3J3qozOUZ8BGz/t/eguyl
 C/SedCbWZNQpwd8bxLrwyWvxcvss34AnUjsgvI0QaPWHDWu4pJk3sRxKlJTHAGHtbX
 CInZLeGSi450inumpfwd07l6JdaUDnqDfI2Fz2Qs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsUC-1kp9E21VB2-008qab; Fri, 08
 Jan 2021 17:30:10 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: timer: nuvoton: Clarify that interrupt of
 timer 0 should be specified
Date: Fri,  8 Jan 2021 17:30:04 +0100
Message-Id: <20210108163004.492649-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZUagBJ3y6lRGhVMX0qfEZglo9lmo1tL07iQMwbZgRlDDKqBI4Mg
 VuHEnE9oF/qREDlcMH+KfdOGUSAzbMWmoY8Hs6q+p+o/65XA+3kk5uYXw+T0dxnLlofdypp
 AKAEU02rvynvbTNAjZax0XjVaI5CEIEH5711Z91ixyTI5ugGeXxDvTXeTJcQHsOmu8hY/oB
 g5SlfQ5zCTCuwaxSVnuPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0X2iKvwzbzI=:3lOo2UlFWs2/bM+zkozVfd
 +RqObHgnKkyo1QHxVErMB+dBJJpRthKzbLtH1lD9S4wxbLPTb28DUDvHOoNEFBsOVPbJzxaXG
 8MXWiYERGXMgLwy0kLjHuZF5rSiC4bwpAXB/SrmhtH8exSorEi9EhoxWfCCgtq5/cwJ9gI+PT
 d5GoMo0vagAy5CUMVtcqwGKX7Ur93+kZ7R49KrZMg+X+4DF5iswuwLUAoDYLk8HEVSGZwa1XM
 eNQAvyY/N9JhgGqYo7xswBKmxiHbobES/2F3M36zfVi28AnDMelpUs9DS++V0fGwLWUxhAu1Q
 Nqxgx1H0QO71I9cD7WQLMJh9SLNb8g5/scr/8nzMFHwDQAV8MeEnkl1kb7Dvk59G4QTpL4qKL
 Igfkzx7kaOQsVMbxWiTFq5ZH6FPUJ0hYT4xwkhtES5TNjafANWxiVE0Qcs5nCCmOKuRFs1Kge
 yuNCfXC3l7x3O7H/bJgwVTYZs7g60UXI4aPQvbv7phvO79NzZrK5tk/2DQouSvpStutMoV0Vw
 8b2TPeW61qkaVgpS+oJAYGL809xlrWuX87ngTaqCUwNlzYIqdzyYjORMTYRVXP2qU52Cf4Nk3
 inmWkGXioKamLwn1wKzKBc1F2thWN4GEMcRHEtAE+wpVOYhjEnX4H8tqcbow5ynD4To9LhP7A
 QdHysaUS8Q9ZSX1iHhzO8CupGES2PQ3ZaOpV/CLlCMkeipnLORYqOy/MU/tLzZVjHxhLlWRwm
 XZwI0cajhPv7nr79kQUFGi0vxmtwzUFhBtUt8owIx34/Ft/eePzRU14AdBpYIkJSA3Kk5/bn7
 nYAGi9NuJQY8xUPPiIXG3Gtw8xQ9DAc1VISVIlumvwAQ/lomGztpbu7Dp7og5aK7WHNf1lMOY
 dUYwI55/AjSUZi37ZHuQ==
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

The NPCM750 Timer/Watchdog Controller has multiple interrupt lines,
connected to multiple timers. The driver uses timer 0 for timer
interrupts, so the interrupt line corresponding to timer 0 should be
specified in DT.

I removed the mention of "flags for falling edge", because the timer
controller uses high-level interrupts rather than falling-edge
interrupts, and whether flags should be specified is up the interrupt
controller's DT binding.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Fix a typo in the word "watchdog"
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

