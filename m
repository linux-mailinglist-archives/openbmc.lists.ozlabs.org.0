Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA0342EDA
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pw44S6Mz2yZG
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=KcKKr20W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=KcKKr20W; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pv43Pv1z2yZK
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:19:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264343;
 bh=MDvYbSDjVR4gaL0euqquA/ztC03AcKzD7QlmuGwJ7oo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KcKKr20W3Ycewx3A6LUs8UmgQ+ERLJIiH6sdKWTYfMDiEwkd6l5cLfUdgWkhb2y4/
 kssDftGoU0DKjpGFRPvaxJs/N8vJ99vFK697dbmcmjKG7v20iBkEUjrDG+ndeINmA0
 u/ehAeTT3P2xGkB4+fW3Fi5vSLzFdYMx64r1uhlA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7KU-1lY5Wf02PK-00BcEE; Sat, 20
 Mar 2021 19:19:03 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 05/14] dt-bindings: timer: nuvoton,npcm7xx: Add wpcm450-timer
Date: Sat, 20 Mar 2021 19:16:01 +0100
Message-Id: <20210320181610.680870-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O0vnu6YLRuXC6Tu8SnvAvza+pr/EhU2s0KbmK6GpSbDzpinP4j+
 HJqWvB0UP58UNd7whayPYBBUUHrELOqUi/XSMVru8bUuBNsYH6gT82kBIglTky9Jik0MbR/
 9v2g4XzQkEDeUP9WfnGutESvdQI4CejhHftSpDCukfX8A2ZfqgaBSeajR+WerRxR9V09iJx
 MWu0UoHIfWWfuDLtNBEtg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S6FcI+sCfag=:yCmlFuXLi9aCSLYsocighR
 uJzdeDJMlVcILY1ZImMezxkLbK2f5X1Gj3lxEAQoT6bWzBFnP81wVVt10GLruEU6gXpI1OA44
 x+l9D5gC6I7MX0cXbF6Sd007If0iBkbd0ySwUS3P2UW3LsehHDgDhLpBsHEZKj2HnsSyFpk/3
 wV6bCO4fH2LwkCyAasD1uHOPlK8KdjRBdTqNfcAjYsXhS7NVzYI5QtwhawF27yOGBZSOYA2es
 IZY6H96/RC87of/JK2cVo5IblIPY4NsM5ehHLWF1yGiX5XID8k00uB6qv9PIOM2UFJeO5FI+O
 PTrDsWLJFh0v7hHg0stTkLEpG3Y7i4y6vF97yJGDk12FHnHUQMN05EHa6dsNJ9yPkFcxE8xoU
 nhIkD51NYIfWpMSZrbFm3jhneaJGOItS48iu6tEtmH017rmZYuayettzmO/2PvUNwAFqG4mrv
 K4BWIZ64LVlviWFMMB5yIOhArjE1bRuPbLeuNQ+9DGeoT/EaE/xs9MaE4gU/rLCJHcdf2atlU
 7gCC1jnYe0pBtPxVP4BpXA7z7TOUMkKNX8EaYi2UQeBej7SXMZC3+ymbNp63tjHwSvo4jKDHT
 ggsV2PTqgZ4sUzcpIs/JLOVM+V5a5UMcF7aGykARIbKhu9eeHnuf8YZn/4pNt5PWmfg+LEre5
 ZtXUhL/uAXlPfE/r59YRKfXnGbtb9kpG/IOF9DIOcbFtXfEtD7SWdaen6yBgeDsV+EQcGtoOX
 D96m2N31FfaFKqeBoeVIaYOM8KkQt42I5amxIEJwUhpQoLovNivuNIhJmyClOV/I0pBsN0Rso
 hJy60+ExKZGzUBSTflmtr6ui7PwY5Ax4ZSIEAQkcKVjp5Ob6OSt1psWYUgBCXwviEA0LGSYcR
 La50wUIOeqBUbQRYVKsA==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for WPCM450, which has essentially the same
timer controller.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
index 97258f1a1505b..ac3a5e887455d 100644
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
@@ -4,7 +4,8 @@ Nuvoton NPCM7xx have three timer modules, each timer modul=
e provides five 24-bit
 timer counters.

 Required properties:
=2D- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
+- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750, or
+                    "nuvoton,wpcm450-timer" for Hermon WPCM450.
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt of timer 0.
 - clocks          : phandle of timer reference clock (usually a 25 MHz cl=
ock).
=2D-
2.30.2

