Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B73342EC3
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pr05PhCz3011
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:16:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=W0R95BMl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=W0R95BMl; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pqm27Mhz2yZF
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:16:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264177;
 bh=dixi9nNlnn2n83ltjb76mdStzDLBWwdtr/6rTWS7Mfo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=W0R95BMlubj4mSppxvg6X88kyU6m4DPDrO6jFCpwKdsLrvlLxLXgI0VMY1y8kqUuH
 vQPBOe/pzVGFb7ROSt8xrdCcN7yYhiYraRWiVotxngxmcsYlPjZXh9aL0gkGkIoUDK
 gpCv8ptxolGZBYdukqNgyEBvaHJMS95IOFncdL8M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1lsJnO01tz-00ebx6; Sat, 20
 Mar 2021 19:16:17 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 00/14] Initial support for Nuvoton WPCM450 BMC SoC
Date: Sat, 20 Mar 2021 19:15:56 +0100
Message-Id: <20210320181610.680870-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pGbnBh0quUhZqhkaucrt7T9eFqkG2dR/EygE/VGkjTY0OvtUrCr
 2/O0ErmPKfRaWgw1xBZBKyv52vBqfhazB/8HMYjCDMyRrpChaZN2SXqIe0aC5zURKHDzTDz
 1hQk1EkhDV52RBDkcBc3Dtx7RFwhv+vcXiAm68gqj3zSsk3PgQogL5Q/7L5dA+FkvE6djOx
 SX9/G+yFTIKVgT30dz0aA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LCQYMgp0umA=:j9YM1jhjgpxRBsNsj5N4m6
 1C7K+Ct1dHh8HtK6fqwSi/+lWXDqRg29/roPAWBITI8L1CiO3O42QwtzKAyhh/8WazJvU88EI
 8QWRVG4K1dgDta4ImdY6DhKdRNFE8iEwPN2SYdMGphIvzKTxc5OEQ7Ns2UAl/+k7NOX8jZGGB
 22MnT/AWjKn/fmVUu9j5O21ZGTvD60nLA0QO+QSOb+XKVCGVnQ7JsTfEsjvTHRrI3K+zMgPvy
 BDMsRY5InLWSOfjwf1PhlByxrfUyBzU1FEDS3FS0j5w+n0nepqsTi1jnU39N0erathoORIrJb
 FwbzkNcT/FcbKfl/ZWSpMYmAo26bC2boWBTB67GzaHEwAA3+91D9fp0JPnKuODoz/U4l0OWSg
 cS27PRQeN3ac1wCwGHutVhD85Q8IOqPgtmUHz7pmEt8cu0hQSZ2sYBpAmYmkBDTTTd+vm8gcm
 CB9V6+HSDJsdo5As9FhKqLKMfzPKl4FAN58YJ40vCBMm+Q6wSxC0LxyHZ69BYlTpsk3Dm7D3v
 UNl57NQ9YTnax3rej5WerIvHd498WfdfyPMo6oyI1wTydvqKfUmyQFlCr8v/JbJ797w6XtlFL
 QkVNIqoGGU4yiXTgiNA67K9zHc9/pUtvtMQSYg7Nfq6g9bHT6ecOsNITW5Hvl2RBl/hDGn2yr
 tXPYWiCn4ToOKCSYQpQi4/7MPW/k+tAqGr1pS90+AmNlNmpCUGOG75VjBQgoYJYrm2hKXbQe0
 gJ//uwzRkQ1MSd33oLLswzfj7CWLB3WZV9GJM4zchRHNjWUQ8IqX9IKPNd0dU/4ecsGLyXFKL
 7/bI8xbhBSr3k+cB2fCMwQ9MIlvUZfgfWBekggUf7A4fNyiFhEdmP7blwbw3ps3/SwJaOgusY
 45TFoGL3BvfO0TyM+JzA==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an ol=
der
SoC but still commonly found on eBay, mostly in Supermicro X9 server board=
s.

Patches 1-6 add devicetree bindings for the WPCM450 SoC and its various pa=
rts.
Patches 7-11 add arch and driver support. Patches 12 and 13 add a devicetr=
ee
for the SoC and a board based on it. Patch 14 finally updates the MAINTAIN=
ERS
file.

Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to YAM=
L"
(https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.ne=
t/)

This series is based on 5.12-rc2, and doesn't cleanly apply to OpenBMC's d=
ev-5.10
branch (there are some trivial merge conflicts).

Jonathan Neusch=C3=A4fer (14):
  dt-bindings: vendor-prefixes: Add Supermicro
  dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible string
  dt-bindings: interrupt-controller: Add nuvoton,wpcm450-aic
  dt-bindings: serial: 8250: Add nuvoton,wpcm450-uart
  dt-bindings: timer: nuvoton,npcm7xx: Add wpcm450-timer
  dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
  ARM: npcm: Introduce Nuvoton WPCM450 SoC
  irqchip: Add driver for WPCM450 interrupt controller
  serial: 8250_of: Add nuvoton,wpcm450-uart
  clocksource/drivers/npcm: Add support for WPCM450
  watchdog: npcm: Add support for WPCM450
  ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
  ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450
  MAINTAINERS: Nuvoton NPCM: Add wpcm patterns

 .../devicetree/bindings/arm/npcm/npcm.yaml    |   6 +
 .../nuvoton,wpcm450-aic.yaml                  |  39 +++++
 .../devicetree/bindings/serial/8250.yaml      |   1 +
 .../bindings/timer/nuvoton,npcm7xx-timer.txt  |   3 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    |   3 +-
 MAINTAINERS                                   |  11 +-
 arch/arm/boot/dts/Makefile                    |   2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |  40 +++++
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  76 ++++++++
 arch/arm/mach-npcm/Kconfig                    |  13 +-
 arch/arm/mach-npcm/Makefile                   |   1 +
 arch/arm/mach-npcm/wpcm450.c                  |  13 ++
 drivers/clocksource/timer-npcm7xx.c           |   1 +
 drivers/irqchip/Kconfig                       |   6 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-wpcm450-aic.c             | 162 ++++++++++++++++++
 drivers/tty/serial/8250/8250_of.c             |   1 +
 drivers/watchdog/npcm_wdt.c                   |   1 +
 19 files changed, 374 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller=
/nuvoton,wpcm450-aic.yaml
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4=
f.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450.dtsi
 create mode 100644 arch/arm/mach-npcm/wpcm450.c
 create mode 100644 drivers/irqchip/irq-wpcm450-aic.c

=2D-
2.30.2

