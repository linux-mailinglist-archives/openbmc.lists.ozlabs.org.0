Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC554D87C
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmbH0ZlZz3fF3
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+CyP3nQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+CyP3nQ;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL1ny1khHz3bwZ
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 01:24:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7D831CE0B14;
	Sat, 11 Jun 2022 15:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BF3C3411B;
	Sat, 11 Jun 2022 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654961041;
	bh=gml9jl9iIXiDGd8DCIB9r4f3EYB/1KAD7zKRSBWTmWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S+CyP3nQqzcyU9kf87QB5c0JXhNfpr2LaCdq4Rs/wEqbuiwuDTQS2xJDo5TOfhxhH
	 v5vU7jrRwVBVuzZVmkHYroqsGulrx7T60B2JzN3UmQz7DNFzJUoA+8pQdP40BIHFZH
	 nbpAvj0oQkdqVRVaBNndLM/gLknIdlujgwvtMQJIXZuzLZyzFhKmw4fZAtPQ8j4Duw
	 Mak8gcnpfqxwkR+Uc+kVrjRNUvPch/2asFjHFheBMfKjVvsCxVr4i5z3oS2BsPFzA+
	 +QPwZa6S40ei9WzBbIniJrbxMDaj+43j0kH9z2MjSN9htnrrcfRd+OJNFiXTz8AyBs
	 1LwHyNCPH95Yg==
Date: Sat, 11 Jun 2022 16:32:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Subject: Re: [PATCH 24/34] iio: inkern: move to fwnode properties
Message-ID: <20220611163257.6c0b847e@jic23-huawei>
In-Reply-To: <20220611163057.2e2606aa@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-25-nuno.sa@analog.com>
	<CAHp75Vf6dYFR8TESk6oj=SFiXmw-tBAa9Fz-jhRk57ARumxzhA@mail.gmail.com>
	<97b9278953d923008a4c1230ca9bd354117e7213.camel@gmail.com>
	<20220611163057.2e2606aa@jic23-huawei>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:37 +1000
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
Cc: chrome-platform@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>, moderated@lists.ozlabs.org,
	"list:ARM/Mediatek"@lists.ozlabs.org, SoC@lists.ozlabs.org,
	support@lists.ozlabs.org,
	"          <linux-mediatek@lists.infradead.org>,  linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm  <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing  <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu  Prakash <quic_jprakash@quicinc.com>, Linus Walleij  <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre  Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,  Andy Gross <agross@kernel.org>, Michael Hennerich  <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson  Leung <bleung@chromium.org>, , linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>"@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 16:30:57 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 10 Jun 2022 22:01:09 +0200
> Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>=20
> > On Fri, 2022-06-10 at 17:19 +0200, Andy Shevchenko wrote: =20
> > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com> wr=
ote:   =20
> > > >=20
> > > > This moves the IIO in kernel interface to use fwnode properties and
> > > > thus
> > > > be firmware agnostic.
> > > >=20
> > > > Note that the interface is still not firmware agnostic. At this
> > > > point we
> > > > have both OF and fwnode interfaces so that we don't break any user.
> > > > On
> > > > top of this we also want to have a per driver conversion and that
> > > > is the
> > > > main reason we have both of_xlate() and fwnode_xlate() support.   =
=20
> > >=20
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Thanks!
> > >=20
> > > A few nit-picks below, though.
> > >    =20
> ...
>=20
> >  =20
> > >    =20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D of_parse_phandle_with=
_args(np, "io-channels",
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "#io-channel-cells",
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index, &iiospec);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D fwnode_property_get_r=
eference_args(fwnode, "io-
> > > > channels",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "#io-cha=
nnel-
> > > > cells", 0,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index, &=
iiospec);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(&iio=
_bus_type, NULL, iiospec.np,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idev =3D bus_find_device(&iio=
_bus_type, NULL, iiospec.fwnode,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_dev_node_match);   =20
> > >=20
> > > Wondering if this
> > > https://elixir.bootlin.com/linux/v5.19-rc1/C/ident/bus_find_device_by=
_fwnode
> > > can be utilized (yes, I noticed iio_device_type above).   =20
> >=20
> > Hmm, at first glance I would say we can use it. AFAICT, we are already
> > grabbing a node which contains "#io-channel-cells" which is very
> > indicative that is an IIO device. I also find it very unlikely to have
> > two IIO devices with the same fwnode (I guess it would be an issue even
> > in the old code) and even more unlikely two devices of diferent types
> > with the same fwnode? =20
>=20
> If we are talking struct iio_dev instances, then there are quite a few ca=
ses
> where there are multiple with the same fwnode.  We had to do that pre
> multiple buffers being introduced so it's fairly common, though not in
> ADCs which is probably why we haven't seen breakage here. Not sure how
> broken things already are as a result or if any of those devices (most
> IMUs) provide #io-channel-cells etc.  I'd put that breakage down as
> one to look into if anyone every hits it or one of us is bored enough
> to poke at it.  (superficially I think we'd have to check all matches
> for an xlate success).

Having said that adding a warning comment here, so we remember this is
a potential issue would be great.

>=20
> Also, possible (I'm not totally sure) that we have other subdevices using
> the same firmware node, such as triggers.  I can't immediately think
> of why they would need it, but I'd rather we were at least partly protect=
ed
> against that.
>=20
> >=20
> > Anyways, I guess Jonathan can help in here...
> >=20
> >  =20
> > >    =20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (idev =3D=3D NULL) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 of_node_put(iiospec.np);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fwnode_handle_put(iiospec.fwnode);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROBE_DEFER;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indio_dev =3D dev_to_iio=
_dev(idev);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 channel->indio_dev =3D i=
ndio_dev;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (indio_dev->info->of_=
xlate)
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D indio_dev->info->of_xlate(indio_dev,
> > > > &iiospec);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D __fwnode_to_of_xlate(indio_dev, &iiospec);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (indio_dev->info->fwn=
ode_xlate)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D indio_dev->info->fwnode_xlate(indio_dev,
> > > > &iiospec);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D __of_iio_simple_xlate(indio_dev, &iiospec);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(iiospec.np);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D __fwnode_iio_simple_xlate(indio_dev,
> > > > &iiospec);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_handle_put(iiospec.fwn=
ode);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (index < 0)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 channel->channel =3D &in=
dio_dev->channels[index];
> > > > @@ -188,7 +209,8 @@ static int __of_iio_channel_get(struct
> > > > iio_channel *channel,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return index;
> > > > =C2=A0} =20
>=20
> > >    =20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *parent_lookup =3D false;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return chan;
> > > > =C2=A0}
> > > >=20
> > > > -struct iio_channel *of_iio_channel_get_by_name(struct device_node
> > > > *np,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name)
> > > > +struct iio_channel *fwnode_iio_channel_get_by_name(struct
> > > > fwnode_handle *fwnode,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const char
> > > > *name)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iio_channel *chan;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *parent;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool parent_lookup =3D t=
rue;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Walk up the tree of d=
evices looking for a matching iio
> > > > channel */
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chan =3D __of_iio_channel_get=
_by_name(np, name,
> > > > &parent_lookup);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chan =3D __fwnode_iio_channel=
_get_by_name(fwnode, name,
> > > > &parent_lookup);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!parent_lookup)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return chan;
> > > >=20
> > > > @@ -255,33 +279,34 @@ struct iio_channel
> > > > *of_iio_channel_get_by_name(struct device_node *np,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the parent no=
de has a "io-channel-ranges" property,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * then we can try =
one of its channels.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 np =3D np->parent;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (np) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!of_get_property(np, "io-channel-ranges",
> > > > NULL))
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_for_each_parent_node(f=
wnode, parent) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!fwnode_property_present(parent, "io-channel-
> > > > ranges")) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_h=
andle_put(parent);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn chan;   =20
> > >=20
> > > break; ?   =20
> >=20
> > The return in place was a request from Jonathan in the RFC... =20
>=20
> :)  I prefer not having to scroll down when we can get out quickly.
>=20
> >  =20
> > >=20
> > > (Yes, I understand pros and cons of each variant, up to you)
> > >    =20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chan =3D __of_iio_channel_get_by_name(np, name,
> > > > &parent_lookup);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!parent_lookup)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chan =3D __fwnode_iio_channel_get_by_name(parent,
> > > > name, &parent_lookup);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!parent_lookup) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwnode_h=
andle_put(parent);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn chan;   =20
> > >=20
> > > Ditto.
> > >    =20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 np =3D np->parent;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return chan;
> > > > =C2=A0}
> > > > -EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name);
> > > > +EXPORT_SYMBOL_GPL(fwnode_iio_channel_get_by_name);   =20
> > >=20
> > > Wondering if we may move this to the IIO namespace.   =20
> >=20
> > I guess it makes sense but surely on a different patch... =20
>=20
> Yup - moving to a IIO namespace is a work in progress (got snarled
> up by the PM related macros needed for some of the sub namespaces
> which is now sorted)  Let's do it after this.
>=20
>=20

