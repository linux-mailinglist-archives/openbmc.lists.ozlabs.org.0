Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209663B47F
	for <lists+openbmc@lfdr.de>; Mon, 28 Nov 2022 22:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLfK575fhz3c9x
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 08:50:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Un8L87AX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Un8L87AX;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLfJX33L6z2xmg
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 08:49:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1669672170; bh=KZocglb62rgjODaBbkno94BEG+p/TUD9NyE6UtXNSMI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Un8L87AXYW6DcHMDEk2pFW6/XvseeM2hQ0I89dl8O3lniA7Kij4+WwHIFn79ENjtN
	 LX3xZENKl6MrzzqYjyXRqhgo/gWQFdXHaYZFQJ73ii+qyV3XX1gqXuVTHoNf5ivTxs
	 3B6jgK8KzQHVuB66icHTpYKfciDYWs2A5o4bL38ip08H0f1v0/skQQZVHdWPpV4PHX
	 YoJzqfWYQ4cgFqda1Cn56h4moi/G//+zgI3+22WRTVqas08KLgvMVt6bhSdOgK/0Ld
	 bJqINfu1eLSpV3AwpPvTqGvSmB32dUcEqACtcojL4YOWq8YzQEbGBbLlWt4KTKNwMG
	 Tx1KMsecelSlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1oyIyW3NmM-016sti; Mon, 28
 Nov 2022 22:49:30 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] nuvoton,wpcm450-fiu binding example fixes
Date: Mon, 28 Nov 2022 22:49:26 +0100
Message-Id: <20221128214928.3531463-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hjvlACbizoHf3myeGqWxikJT7tGRQF2OIb7M6rNnhtAv/VyctUi
 YwXCbpI4aHFBeZlOY8tCPtq3ka7sshh/l+ZaqdM00woYskeJl8yAGjNUOznGrDiPu5oM9zv
 HHWgqKrHlHn7fzrm0cmBD2TS6vb3PrC3928zA9cKOujKetWqzkZ2CmFtlWHB4VTOsbbwK7x
 7kNruwJMXmSBn9B1DBqJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UYcNhDvDYjc=;Zc0nqRk/l5vx1T3vmnRIYwZIYfW
 YtPmYmU2oSlqn+ffQogolisOCMagJb3rZZ3EG/BDrWC8yzVl8+AzAasIXXyBzU8X6yTGReh9i
 Pm53+r21du2nxjvISfAzzGbJEsEpKrF3QEA12f7gbyHf/Oh4FT4hNro/hXNZ385q95Inxttsz
 bige4juB3LXWQzcfjRwHZWaoIfrOqtjz6loo3UboqelnoUywnDi9oHxtX90WwHLORf0rFN4I1
 /kvC3uJbRxvKFCWkPlSn+64J9TnMnApXIiM0hXnH0cbUa8eQb2AKeTIW3mjAqnFQsayo5FMsH
 zgY3+yZxyb5yqJl8yVvwmcwATPbMU3YC5XJOo9HILtHQ3hhXPdnKfRl44RqEYcd6ZtW0GFx6z
 cImNzPF3hBdbvReXOYiaqgllzZr0xBm8O8p6EW/GOEOAPweLbiVHArlwrc++IZATDOgM+onO5
 zzQdXXts6yIP+eAAIptzhiQvHfXFN/1q2JD68lAuI9EVnou21wvtJOhXa0BEHdcDyk3o1lDHT
 1F2UimzVztBV/JHybS3dvwtwgRCqDeo17HOjygTXilVxhTB9MLwz1RJ8JjBBo3fQLF/HI+Bxl
 zzjeCpLXUmH1CYP/37bQz+IAf9YQnWOyPirAnB5YKinovyZVB2qCsXDx4fRxHSPib1Bx9gn5n
 +Cn2zIwRzPrPjqUX/V2ycwOLTxw9Ft46txwO+YZW1z9NwQhlD+O1Lj+FZNmPaVahnmkT8HTx3
 j4EL5VqvhNjH8t6+day/LUWsc4mczEYVJmzNciyxoIYe8fx2voNWgGhg0ZAtaqTt1pH8eW1Sa
 tMFNEw2WY4AQwsKjS6qKf+jiW2oGnPPubJnSR82ywKVPw2P/42wQZ3Nl6SSb6voTsRHrWkRiK
 sZ+lVKI/QBx52t7WDCWmNCAWmKxN6PRz+PrPyVVVaMOoG/e1IowIuiaLAlJfLr95FAI5fJEPr
 /J8G0TRKY0yeZbTYowWxiS8YBY8=
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

My recently merged nuvoton,wpcm450-fiu DT binding caused some
dt_binding_check issues in linux-next. This series attempts to fix them
before the breakage spreads any further.

Thanks to Conor Dooley, who notified me.

Jonathan Neusch=C3=A4fer (2):
  spi: dt-bindings: nuvoton,wpcm450-fiu: Fix error in example (bogus
    include)
  spi: dt-bindings: nuvoton,wpcm450-fiu: Fix warning in example (missing
    reg property)

 .../devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

=2D-
2.35.1

