Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719B2576FE
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 11:56:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg5Fq52lHzDqSp
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 19:56:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cKvb8cb8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg5Cv4LwLzDqFw;
 Mon, 31 Aug 2020 19:55:07 +1000 (AEST)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 356372098B;
 Mon, 31 Aug 2020 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598867704;
 bh=HT/dHnUDrMXwyD5q0jInxv9lB8IyvR2AIAngyUE4ihs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cKvb8cb8UjAzTAmanRgpW0ydgrUNNIScnsG4pOpTle6dEDHASTV2qlifBQDcLULSZ
 vvIVAUAQ3mRJ85ywB8acd9Q1/3WhCoxmaPIzl3rsEN9yJDSw9C4jd9hercXUv/wwNv
 I5r+gaMFlrQuWcuyVfRfkiDvKVGlUUm6LAsu19j0=
From: Felipe Balbi <balbi@kernel.org>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
In-Reply-To: <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
 <875z9hz8k3.fsf@kernel.org>
 <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
Date: Mon, 31 Aug 2020 12:54:57 +0300
Message-ID: <87y2lv9m32.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: linux-aspeed@lists.ozlabs.org, taoren@fb.com,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Tao Ren <rentao.bupt@gmail.com> writes:
> On Mon, Aug 17, 2020 at 04:49:32PM +0300, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> rentao.bupt@gmail.com writes:
>> > From: Tao Ren <rentao.bupt@gmail.com>
>> >
>> > This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspee=
d:
>> > improve vhub port irq handling"): for_each_set_bit() is replaced with
>> > simple for() loop because for() loop runs faster on ASPEED BMC.
>> >
>> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>> > ---
>> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
>> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
>> >  2 files changed, 6 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/g=
adget/udc/aspeed-vhub/core.c
>> > index cdf96911e4b1..be7bb64e3594 100644
>> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
>> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
>> > @@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *da=
ta)
>> >=20=20
>> >  	/* Handle device interrupts */
>> >  	if (istat & vhub->port_irq_mask) {
>> > -		unsigned long bitmap =3D istat;
>> > -		int offset =3D VHUB_IRQ_DEV1_BIT;
>> > -		int size =3D VHUB_IRQ_DEV1_BIT + vhub->max_ports;
>> > -
>> > -		for_each_set_bit_from(offset, &bitmap, size) {
>> > -			i =3D offset - VHUB_IRQ_DEV1_BIT;
>> > -			ast_vhub_dev_irq(&vhub->ports[i].dev);
>> > +		for (i =3D 0; i < vhub->max_ports; i++) {
>> > +			if (istat & VHUB_DEV_IRQ(i))
>> > +				ast_vhub_dev_irq(&vhub->ports[i].dev);
>>=20
>> how have you measured your statement above? for_each_set_bit() does
>> exactly what you did. Unless your architecture has an instruction which
>> helps finds the next set bit (like cls on ARM), which, then, makes it
>> much faster.
>
> I did some testing and result shows for() loop runs faster than
> for_each_set_bit() loop. Please refer to details below (discussion with
> Benjamin in the original patch) and kindly let me know your suggestions.

no strong feelings, just surprised that you're already worried about
20~40 cycles of cpu time ;-)

Patch applied for next merge window

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9MyPERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbRNw//Ycg/zGDlByFwp5tnmnP1LkeCxblvsqjG
n01I9rv8UAccFtJT/9QSYTtd6KOMvXM3dkMaX46ikxSPYPU3cZzQlMCqK4d40JJ4
YZxp/EnTM/Kt4V0R7tim2n1L7Nghyn1fY6crnN+R0PRYmFfrj3iEokFMIHhjnS8d
PoDaT0aq3qH2uZRop0yN3mZmouAaTItfbXqxg42o13ZocuePy+M0bPeHPRXWZ9KQ
aqL4vC9XZM7AXzeTVxn+53gnGzhFbCTmEiIdhfiBBffJT624hsfocIPUAxrj+kJj
QyFUADnX5OHRElPzoiZyFKZlfAQUueQ6tC2I7/KFYuVu/tWT9/QE92aBOJ9Djomk
1+YCWr4MKz4RB313qyAw9zae77IpS2rQTbQwYts5iL3MTfpd1lwdTMX6TMJgReyG
KBJ+amV5/Y74n5mxypnUXCQOTr3EqyHkr5ieYH6vkx9rzd3RylX6Qr1yGw839avx
yIYcescxC9Wohlg8XAEs5ZCv+YsbapCzGlm7tq7m/eWHINbYIDOM+tpPkAfjzVmZ
ZA5iNVntd+4punCL1Alpw+At/ZoJVMVHHdHDt73rfrZUIq8Xh20acsJCBh0xeQAE
D6nte7wBz1h55Yz7NkWmNDaH9A0uUzYYnVeWRmZlt2RoNgkcx0w1OPXSJYtlInVi
K+VeRcQfwJ0=
=rGY9
-----END PGP SIGNATURE-----
--=-=-=--
