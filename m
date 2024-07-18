Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AF935296
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2024 22:59:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=YvFiTAqA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ4t42lMYz3fSN
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 06:59:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=YvFiTAqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ4sX0xMsz3dRb
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2024 06:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721336295; x=1721941095; i=j.neuschaefer@gmx.net;
	bh=2LBOPGsD0Ssm1Sq4yeFLUDik9ii/DlpsfqgQD/1exLo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YvFiTAqAoXj43jUDJz5NbdR8dm3nVAi/mDwIx3+E/IsRtjEGwm6F+xJrhJuenYHe
	 inaqm4CHyDncgJq4xLJillKaAVaEJUwFOLxwsL9VPhicQuDFU9+iDuyJVVcX6ouR1
	 FBT5CMVGyglaM22cr+K8MoGMCeAkcTfsEk15+449rmq8XmitFdCKSmKILRbXiMi4z
	 8lhN18r7Fwt3Ag0RERY+iN/dmjFBWzwbqlcYRdO6QN3VGNMzQdDqt1A9ZflQbZCrD
	 GY1ew83KS5KQEFRKyV5c+Y2PooIzmTflrCNlynHBC3RB5d/dSFPKVty4sb4ZQh40G
	 dbRHEw/AfRswaA6o+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1sLzYy1XQR-00uTcF; Thu, 18
 Jul 2024 22:58:15 +0200
Date: Thu, 18 Jul 2024 22:58:13 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
Message-ID: <ZpmB5XHvEsiER6Ee@probook>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
 <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook>
 <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
X-Provags-ID: V03:K1:NSSQMffJHv86bYx90IK9aYBaZp0OdImfBR1MyR761oZdk83gvl1
 97JAsjwirurgsJcklBoqIlEwWjhxjgCpGciu6iMnSue4KS4S5ZdVfbPHVipO+KN42DD+kNb
 wcjG78gDAKk0vy7U3Ns91JLNtYT3yC2gdnWzItnsDO8wQxOLCM3t0PJg1Msf0NKyg4wn0wv
 CTZ+FaaUW0nulIjWG9Vyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fPr0PDlDbJE=;y5zDiP4m3x2DelNKmAFMw1IQbtp
 Om4Tp2J/vZVF1j6t0wOSzXHTC+LrdWQz38j+GRW6xDUBzFToMgVJPzMF1/O5qLacmFsJ1NtuL
 P/JACF1SOY537kytQxI0otqUT47ASMzsER1szJcOvai34xPPDuWt22TAWdpTG8ZXzF7wPsDsI
 vNsgpWT6NBKuYjli905awrlfUKDbCOSNvnQgnuxtRAAwE7pJ3SaKnoQ0Iq8gzLG46D03hVUI8
 ENHFvhcbHyohLtazY9OYig0+AOp0sGVJReRjvpP3CNml0EqenZsKYRkqWe23DblAoCqyCkkXe
 mFrTAqmJdSJjnP5ErfiMK4NGVGEarPiH4sui/aiwZh7Mr81fmdAf9RG790qFD+6hngY0t8LsN
 jcifnyXT0W3KqNOQVuuv3suk6WO26BArFSBcwm9CbNiv6RKU773mnMzUxaOH1jiw6CPyKT56U
 3yPaPuHuJ1qUt0cmSOvSqZ7FXWnSbKBgW2Ym8Fx4UGpwsmIMhpagns2ade/j/eLBFwIbX+qYX
 U1OLQWKIDraqGXT5gYoV0/cor/NoHQa1sU0538iQH1T2LKQ/4d181FMKHbMWbzaArxu7TDvNN
 UAARIPcJ04j7sAg9M6gwBglHjZKrzMs3xYHkrRSUQLmqnlPKDOfYtqVQRQnu41muzVFYUgXRo
 jp7nKVjJ8u5mOEKWY/VzOOkgSDmLKfBJF+pGCE6WK+6QcJF0z1PJg+I2+6Su7qBMAGCzGKOpb
 mPzy/DYX3ihMIkS+ODrhVebvx5fM0Gv2qBrwj2ZvfTU4raSflpIHE3XNLszhnr2ZGMuMNr0it
 rc7iCrB4dYKJrTIKGVMXZAhA==
Content-Transfer-Encoding: quoted-printable
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2024 at 05:24:11PM +0300, Tomer Maimon wrote:
> Hi,
>
> It does not exist, do you suggest modifying the "unused" to "not exist"?

Yes, that would be clearer in my opinion.

Best regards,
Jonathan
