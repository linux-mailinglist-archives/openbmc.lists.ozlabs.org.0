Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0087335D
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 11:00:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gbtFIXk0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqSbl66lyz3dd4
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 21:00:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gbtFIXk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Wed, 06 Mar 2024 20:59:50 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqSbB3wYhz2xdg
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 20:59:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709719187; x=1710323987; i=j.neuschaefer@gmx.net;
	bh=Cfsjv3bMraaDifxBSHB4874EPFtiZVDgXo474KE3U1c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=gbtFIXk0wXR9kNuGdtUvoZy0MUi9K0PiA7G07snTGCmQ/01PHDK3xAJIA1bgptn3
	 ONQalF+U4i1aOykI7LUjUO3vsUXA6MdIsVVkFi1RFisl7DImyzjgCwN0DqG7DN9X/
	 EIet14A2uDFqqCAst+SJPkFfYHDCBfa53sTRuEMz/52GhnlGJy47eQNbY/MqVkyDT
	 zSGs/BMWM9i8PrkTXbqsMNZpu98n2uNCRCr2gPcr3+R40JknYQdo9Vadw5MuLfeA0
	 b9WpxnROcaTRogb3txHdtDBY0NqukHB+z8kCkOvaGI+WmEfXscdIQSXbBbbndsfrT
	 TwCPlISxeH1NwU290A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.58.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1rMeLP1nBD-00VjrS; Wed, 06
 Mar 2024 10:54:04 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: wpcm450_defconfig: Fix formatting of 32-bit number
Date: Wed,  6 Mar 2024 10:53:58 +0100
Message-ID: <20240306095358.509785-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RKv9wcRZzdbbUc8vslPj0/ift4zM2q31+YoQqAj7SP6uKHlVkDp
 /yVdn6Ol6am9gnjXrDd27PFrNO6rTdw53UmEMC09AA3yxp1QopeSMax4bGsbMBC4XB2khyK
 HE1S+iZa2bsYGxHLUTUj5K6/g0OrGSxeHXJsfDhC4ySw59Ppr56scFNh9FKn2OaNTGYpD08
 r9MAGCkl6Mde4e9LYVSUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bAhkw0B0ivQ=;FBJsyU1p2cex39Wfbj1pDEOcaxD
 60Xw8WbUvYARutegl7ocFahfPvhuIxViYYCDuroGzP+C9VP39aZuExSiPd9FLD95r0GUucLUH
 nOMThcTfvNiedxV3ZfJJKfJwv3/XhvJQab7+04/IGmTe/REpSJ5Ssp3tWsDRz7AbUuQbEve0t
 2SfZb7nqQn2cosBxRkKdh/b3Aogp63aedDJBY2BJf5VkfTiJ8p+gqw9RQ+7zmpTr34ROrEDvG
 g8zG/n8ENwpM/kidYAfQ8pmLdHpIhaZ2oZbszS2D5T/JWLQqNrnLi2I6ivRE4gAct0qqsj6CC
 lHJJwBjzypWpbXfdDVYRqczkFkrYNILs3QmVhNtm+XTaI/n3qcfvYj4kEs82ulJrSTrpi0B5k
 lCx5ant3wgTokDfF7PSwhMMAWpmteQcDtIz8+HIgaghl972RJVbDmGCNkC9PWQYRS0sVCorCh
 +4DwkI8RufrPanZquKnib1qqwtpwdZM3/dl4UMi+e53d74rzFW163OO5DWI9N9BPTiy+fDK4J
 4eoHfoR507u+eS2kfMm95hTDcUc7tUrQRySbkS9vU4dB/svrPlvxhJmauqdHvgkXRq4Q82rQq
 W7qO7CKvah1WVfzHkSMfhFBu+e0sjcnAQNeUBkIPyp6SrqbM3FpBfAzWgJCiQ1f82gIjcEKg6
 WyW5SeWq6HcondtiKBUiOMOd4X+zr+4f7GXo697wfXmXUPWGqcULSIzW+YqjX/BAiO3UK/RnE
 RmGCzzoZm4D2d1v1PlwzCeWO/x39X04HFavI0li/FnTjUKV8g/+bueOKzzkIr+aAcvMJZ5c9j
 04JOklBvbbYNbHQP0frhDcvQ1PxjxsDzI4KdiqQRn76mo=
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Russell King <linux@armlinux.org.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nine digits are one too many.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/configs/wpcm450_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450=
_defconfig
index 45483deab034f..78b6c671eade5 100644
=2D-- a/arch/arm/configs/wpcm450_defconfig
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -206,6 +206,6 @@ CONFIG_DEBUG_USER=3Dy
 CONFIG_DEBUG_LL=3Dy
 CONFIG_DEBUG_LL_UART_8250=3Dy
 CONFIG_DEBUG_UART_PHYS=3D0xb8000000
-CONFIG_DEBUG_UART_VIRT=3D0x0ff000000
+CONFIG_DEBUG_UART_VIRT=3D0xff000000
 CONFIG_DEBUG_UART_8250_WORD=3Dy
 CONFIG_EARLY_PRINTK=3Dy
=2D-
2.43.0

