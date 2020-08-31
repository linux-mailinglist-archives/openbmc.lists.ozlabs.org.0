Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C22576FA
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 11:55:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg5DG3FrGzDqTP
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 19:55:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vJO2ySKK; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg5C21S0fzDqBK;
 Mon, 31 Aug 2020 19:54:22 +1000 (AEST)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BF2A20EDD;
 Mon, 31 Aug 2020 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598867659;
 bh=05SB4QyhMRQEVhQuA76tAzTplfJxOwcQAfl8qdw+ScA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=vJO2ySKK2PRG4joUm75ogezdndbhgzjUDQ745LoRUyXOLGew7GRZ770bVHmzV4m5f
 9WEBzxLHjfBpHSLBd2E3hXVsXcEu57+pv9z7rj2/Irudt8TkfV9TzoGt3JH6Oxxi6I
 trdvhQOhTGEnlh0iqxSOXRgs6gjhWLE4j01xCGeA=
From: Felipe Balbi <balbi@kernel.org>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
In-Reply-To: <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
 <875z9hz8k3.fsf@kernel.org>
 <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
Date: Mon, 31 Aug 2020 12:54:10 +0300
Message-ID: <87zh6b9m4d.fsf@kernel.org>
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

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9MyMIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQaifA//Si7r2rDSXtDMDrTep0yeVpCJA9vk3Ajp
K1rz3FtJaOInbRADPFu4rEKMCiz2bYBB/kT+iiFDUzpw3AOiQvjxyXbS4IqETV5p
+yxIaRE8Hr4dYGobRps9aykJfpMO4fZhSVfm99DLPXyFlmVBhE3AO9iz2bn1yC/X
lq5ObwFqNnWya7yX7xOXLez4hM5waO621Fj45bWyXQFbO5Q+BaF5Tu+B0y0OptK0
7dhNBFDe8xXTLjlvgsATtByfcYYi5Ip83xNfOLev4gH49alc6QGmcIjeVR5fLaPb
YPJjsKi+NB1PsRHc1eKjKlKWiIVunvZ8zxnTKGec+PWsAF0dgOC8ARb3IMJhYxbD
bIRcK2qvmkrWa24KiMUIwguHyWRkVm2Wmd14rBTg2Q2REJThn/lTr/O+hxai7ZBL
V55vc/6E2l/ZMxDwNi8tvlxE6gu3qxYJeY07bFTXqXf4RiNPyT1vIpdzcSQzN4ZR
gjMSjNNXdTpvLLXfHYt1o29oBl1IhrvP4TzTPzPvxj3afMrgm8O9roOpeK9F7nCN
8Hp4PkQUE7PTwens37vC+sGCYXJUDAp5FU9Enzdansz0+QBCvRnJslNQq73P9vQB
HR6/1JvhJzQRr9K6YHY5xzo9HZtp+QqKtzZZV27M1dZr+w6/g83knFJUuDdwm0zx
jeRhoV3yH28=
=5dAd
-----END PGP SIGNATURE-----
--=-=-=--
