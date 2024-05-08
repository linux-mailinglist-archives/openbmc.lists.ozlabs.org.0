Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5CF8BF3E8
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 03:01:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BFGjaM/D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYxfV0ZC2z3cBG
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 11:01:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BFGjaM/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYxdv0Tfnz30TP;
	Wed,  8 May 2024 11:00:34 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-82-209.adl-apt-pir-bras31.tpg.internode.on.net [14.2.82.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CC19A20016;
	Wed,  8 May 2024 09:00:30 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715130033;
	bh=kMjFTG/O0qrpfW1eF1AuxbXY76Q+hOssQVvDEfpATf4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BFGjaM/DkrZvajCW6PMQ18HRX7vtyY7LVGbeDxBsQQcUCM0C3AtkktGVqvLIwxoLS
	 cVE0p/hjrNyGMSgR8TThdds+fLF8whBw4153a6VXRLArCIJj5dNAZIeqa1QgYx0s0s
	 P0su5qGrayeU6BCvf41pGwDnau0r3tl9qO16melnWDK6WjF0LoTs05ib6+pHcDBAHA
	 J++C3ZfBln93RL/Yp2QAB8w40vMPaeJ80gaKoYPfV/IPX1NTLrgpSd8dLRKl8ArAjr
	 2vX0QvWNdR9sRl3uS9064m2PEaSTysxSJ8ixQD8npnROaMI/on6jWvJO8MJh1Pd/Cj
	 Qdio8kWqNb+ag==
Message-ID: <db966c501288c73ac50a86aa2e5884e6cfc28715.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Change email sender
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <KellyHung@asus.com>, robh+dt@kernel.org
Date: Wed, 08 May 2024 10:30:28 +0930
In-Reply-To: <20240507092109.6018-1-KellyHung@asus.com>
References: <20240507092109.6018-1-KellyHung@asus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kelly,

On Tue, 2024-05-07 at 17:21 +0800, Kelly Hung wrote:
> Requesting assistance from ASUS IT, I obtained a new smtp account.
> So send the patch again using new smtp account.

Ah, thanks, however Joel's already sent a PR to the ARM SoC maintainers
with your patches. Sorry that we didn't communicate that too well.
Here's the PR:

https://lore.kernel.org/lkml/CACPK8Xd2Qc9MQUJ-8GuRjmyU50oMHpmmHPHLqAh9W_1Gy=
qi2ug@mail.gmail.com/

>=20
> Kelly Hung (2):
>   dt-bindings: arm: aspeed: add ASUS X4TF board
>   ARM: dts: aspeed: x4tf: Add dts for asus x4tf project
>=20
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 581 ++++++++++++++++++
>  3 files changed, 583 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>=20
> --
> 2.25.1
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> This email and any attachments to it contain confidential information and=
 are intended solely for the use of the individual to whom it is addressed.=
 If you are not the intended recipient or receive it accidentally, please i=
mmediately notify the sender by e-mail and delete the message and any attac=
hments from your computer system, and destroy all hard copies. Please be ad=
vised that any unauthorized disclosure, copying, distribution or any action=
 taken or omitted in reliance on this, is illegal and prohibited. Any views=
 or opinions expressed are solely those of the author and do not represent =
those of ASUSTeK.
>=20
> For pricing information, ASUS is only entitled to set a recommendation re=
sale price. All customers are free to set their own price as they wish.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Unfortunately these footers aren't helpful. The kernel's mailing list
etiquette documentation has more info:

https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-d=
isclaimers

Andrew
