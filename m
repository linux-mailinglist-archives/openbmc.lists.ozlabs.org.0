Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25777551228
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 10:08:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMhr09zKz3cBy
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:08:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RldbtdJu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RldbtdJu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQHjQ0l3Qz30DC
	for <openbmc@lists.ozlabs.org>; Sun, 19 Jun 2022 00:04:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32B75B8013C;
	Sat, 18 Jun 2022 14:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F42C3411A;
	Sat, 18 Jun 2022 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655561093;
	bh=/7mJvxsz132cWqlccRthsjLNck7xsii/5fBu0hdLf5g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RldbtdJues9VGt96oy4NlFJmSKjlkNacdZDdv+OBXJxxJEallSdFh+dbFkIuxSCpu
	 oAAP3sxEcbVWgfP3Dq61WTKXRcNTKw4J4O6X/H3gZ1kBSbid554/3cOR2krrZnZ2w2
	 983W4VkVS3NGk7bXqEuFFM4fi5MW8eVNMXlBNDyrRbXk76IphuVhyHKJM2LYRAzmyb
	 ZAf/JvXGWe8MnDMbuHseA5PRzsb1zn/tGxgY/9E9OMBiI5U+mqX95NXLiSVAVei1HG
	 e4U4ME9kWFRPYgcQ2+rnxNQpkJtsJxwYEXYGy4rdw+Mua1e+Xc8EXXZtP8Qn21jAUk
	 gl+OB6NRRllhA==
Date: Sat, 18 Jun 2022 15:13:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
Message-ID: <20220618151358.44b78c11@jic23-huawei>
In-Reply-To: <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-21-nuno.sa@analog.com>
	<CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
	<ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
	<20220611155902.2a5a7738@jic23-huawei>
	<5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:05:43 +1000
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

On Mon, 13 Jun 2022 09:20:26 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Sat, 2022-06-11 at 15:59 +0100, Jonathan Cameron wrote:
> >=20
> > +Cc Mark Brown for a query on ordering in device tree based SPI
> > setup.
> >=20
> > On Fri, 10 Jun 2022 22:08:41 +0200
> > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> >  =20
> > > On Fri, 2022-06-10 at 16:56 +0200, Andy Shevchenko wrote: =20
> > > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > wrote:=C2=A0  =20
> > > > >=20
> > > > > 'of_node_put()' can potentially release the memory pointed to
> > > > > by
> > > > > 'iiospec.np' which would leave us with an invalid pointer (and
> > > > > we
> > > > > would
> > > > > still pass it in 'of_xlate()'). As such, we can only release
> > > > > the
> > > > > node
> > > > > after we are done with it.=C2=A0  =20
> > > >=20
> > > > The question you should answer in the commit message is the
> > > > following:
> > > > "Can an OF node, attached to a struct device, be gone before the
> > > > device itself?" If it so, then patch is good, otherwise there is
> > > > no
> > > > point in this patch in the first place.
> > > > =C2=A0  =20
> > >=20
> > > Yeah, I might be wrong but from a quick look... yes, I think the
> > > node
> > > can be gone before the device. Take a look on the spi or i2c
> > > of_notify
> > > handling and you can see that the nodes are get/put on the
> > > add/remove
> > > notifcation. Meaning that the node lifespan is not really attached
> > > to
> > > the device lifespan. If it was, I would expect to see of_node_put()
> > > on
> > > the device release() function... =20
> >=20
> > I had a look at spi_of_notify() and indeed via
> > spi_unregister_device()
> > the node is put just before device_del() so I agree that at first
> > glance
> > it seems like there may be a race there against the useage here.
> > Mark (+CC) out of interest why are the node gets before the
> > device_add()
> > in spi_add_device() called from of_register_spi_device() but the
> > matching
> > node puts before the device_del() in spi_unregister_device()?
> > Seems like inconsistent ordering...
> >=20
> > Which is not to say we shouldn't fix the IIO usage as this patch
> > does!
> >  =20
>=20
> Just to add something that came to my attention. In the IIO case, it
> does not even matter if the parent device has the OF node lifetime
> "linked" to it (as it actually happens for platform devices). The
> reason is that iio_dev only has a weak reference to it's parent and (I
> think) the parent can actually go away while the iio_dev is still
> around (eg: someone has an open fd to the iio_dev cdev).
>=20
> > >=20
> > > Again, I might be wrong and I admit I was not sure about including
> > > this
> > > patch because it's a very unlikely scenario even though I think, in
> > > theory, a possible one. =20
> >=20
> > The patch is currently valid even if it's not a 'real' bug.
> > Given we are doing a put on that device_node, it makes sense for that
> > to occur after the local use has finished - we shouldn't be relying
> > on
> > what happens to be the case for lifetimes today.
> >=20
> > Now, I did wonder if any drivers actually use it in their xlate
> > callbacks.
> > One does for an error print, so this is potentially real (if very
> > unlikely!)
> >=20
> > This isn't a 'fix' I'd expect to rush in, or necessarily backport to
> > stable
> > but I think it's a valid fix.
> >  =20
>=20
> Should I drop the fixes tag?
>=20
Nope,  Tag still relevant and may be useful to someone down the
line!

Jonathan

> - Nuno S=C3=A1
>=20
>=20
>=20
>=20

