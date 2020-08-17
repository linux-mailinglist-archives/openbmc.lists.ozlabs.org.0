Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E2247BB6
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 03:08:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVt862MkGzDqZX
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 11:08:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=B2dQcjMv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVb544cn3zDqFM;
 Mon, 17 Aug 2020 23:49:43 +1000 (AEST)
Received: from saruman (unknown [194.34.132.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 383D72065C;
 Mon, 17 Aug 2020 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597672181;
 bh=neILveBskNIGri0vUIbvh+uU43bAIKbA+3Ui69RMDEs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B2dQcjMvHdPr+yGQWxV5pReE59glr540FiC9zAx/WQDn0xn+sIBKD+xL2t18N9sM4
 SAWDG5mRanAZS3YXc1SbcOWFN+I++rs+P2t0AF94BeFQC9kUnY534zUyGQ1LVc4sEc
 Ew7LVl8v3JitXfdLzjWSBWhzkaD1SkxqAUpbWWOg=
From: Felipe Balbi <balbi@kernel.org>
To: rentao.bupt@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
In-Reply-To: <20200528011154.30355-1-rentao.bupt@gmail.com>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
Date: Mon, 17 Aug 2020 16:49:32 +0300
Message-ID: <875z9hz8k3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-Mailman-Approved-At: Tue, 18 Aug 2020 11:07:47 +1000
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

rentao.bupt@gmail.com writes:
> From: Tao Ren <rentao.bupt@gmail.com>
>
> This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspeed:
> improve vhub port irq handling"): for_each_set_bit() is replaced with
> simple for() loop because for() loop runs faster on ASPEED BMC.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadg=
et/udc/aspeed-vhub/core.c
> index cdf96911e4b1..be7bb64e3594 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>=20=20
>  	/* Handle device interrupts */
>  	if (istat & vhub->port_irq_mask) {
> -		unsigned long bitmap =3D istat;
> -		int offset =3D VHUB_IRQ_DEV1_BIT;
> -		int size =3D VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> -
> -		for_each_set_bit_from(offset, &bitmap, size) {
> -			i =3D offset - VHUB_IRQ_DEV1_BIT;
> -			ast_vhub_dev_irq(&vhub->ports[i].dev);
> +		for (i =3D 0; i < vhub->max_ports; i++) {
> +			if (istat & VHUB_DEV_IRQ(i))
> +				ast_vhub_dev_irq(&vhub->ports[i].dev);

how have you measured your statement above? for_each_set_bit() does
exactly what you did. Unless your architecture has an instruction which
helps finds the next set bit (like cls on ARM), which, then, makes it
much faster.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl86iuwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZuXg//doj2VlNrrpXSD2a83iUegA+NRRRKef1U
PRfUUrIK4igGr/FiQAhE9Mlilxj/sZTLcQ6qe1EhIY+f5JhyfucZ5Te4WhNFaxtZ
UJp24ndXVc0q8NTmSkre+c6GLX/lD4NFlfgMSsdqpvAlYJirzL4GY63EWA9W8I3k
cO4Igdvi8ZskhUgX2QBCM4kDxMk+WxV6PrD8L4EykHmXTzFqVJxKM30BO7U0Gdd4
bmImEVCqzUDSivYKC7xwDWnT0HAXjbm38tcb4hq40pePVtDNEGFiNd3NUo953SvP
065liQg/4ats64P21c+PN0qXFovkWoSTJBa1yzcqfWF+Yi8fKI5UVNp49W0CJZ2m
lEKNc/H4+qzEysoXCgWCCznDg4RCxE0f4Y5OsNxkf63QvVEAaFRePgNZ6txble7v
dJueHYNiEfsgCe2QUCxl4f805gq2+iIMKGnWvEdwcdlpUCmop+CBXouD9MuMt+hB
OLDU6hSo/REsEHKVsooiICwfUOuD0xrqiqObcLKwSd0krXnDRkkYjYm4FvN4u43y
y+sTwkU5jswAvcBCHDgayGgm37U0QsDLpZW5voCirwaPqdC+09yVQ18/lx4cA+Lq
Y2WHyvRRssi5U8G3YHQUoLVJ7umEx5o6k13rBQNBnueyfEsVM3G8V74j+uuYLGzO
BbmxKI2a0bY=
=TM9v
-----END PGP SIGNATURE-----
--=-=-=--
