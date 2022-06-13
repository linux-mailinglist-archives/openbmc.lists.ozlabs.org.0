Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B4754D887
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmdq4mw1z3dv4
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BeUQU7At;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BeUQU7At;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM2fP3PDpz3bk8
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 17:06:04 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id k18so3296216qtm.9
        for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 00:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
        b=BeUQU7At5w8QXnQumv31sTGFNuryglGKvde6SoIxLoHOJ5t/WGMn1AXz3Eknm6h5AI
         kNL4PEd0uMir3gUr1z6XGSGK1rVD3INLVDD+LZJQYc8d9+62lYvyaguTm78kNak/rSak
         T3okK5/4ndABoNywbeazmrsJmzecZtZstWGrOW2kSrrZPWoL+4bF34YazBYZMgWZX4Tb
         Bt9W4HzigonIOzfvWB+W869hPSh+dfOJ4Kquh0y9Dsp8gm71SNYKkMAx9kDUk/JCp9Zv
         0D3K88QtgS+P4vXBJD6FFG3yQbdUH3SbzIbxx14i72EO5NKMHtU9uCEpi/JGyYCXjqA1
         +OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
        b=jl7mTZL17gludQMSHRdNbhgAOPoD1sAHGcPHHjNG6qZB4Ok47NFDsDMZRGlBa5nU87
         yjz2JRKZtWmdc+qCJgPalFgJbNPdpxH4U05TkErE66XczqrTfL/uqR35sKfB12BjL6LZ
         bN+/Vvdo+1xLP13WOwHunuxJUQqr01g17MzZq9cq9uBWcAAEqN1nes3hX2todZA9osBc
         RHDYC6cKIpkJsssPBNq630qwYjWRoCuPXzrEGeaReWssYZYHh59GC3gUHuDfacClT4DT
         Ix6FF2KyMGO9nUwaD2ELo73bdc0Y55SGYTn4tkl7VG/BOBW6Ktp6JwJbaCzlcUHZa68r
         TE/A==
X-Gm-Message-State: AOAM532MlvAMv/sHFCOQI29aAZ4YNjYEdA1KSL8wvlPWJoLcjddI+CUB
	jhq8P7VIN6QdgeuLO2Q/UEU=
X-Google-Smtp-Source: ABdhPJx1ATSZFfuRWjaAT70y9WnEKuNuBqF1XmR5jBeGYYoq9SJ4nRAMyKQM1AWqPTp0l7HO6v7YKg==
X-Received: by 2002:a05:622a:311:b0:2f3:ddb0:4ae6 with SMTP id q17-20020a05622a031100b002f3ddb04ae6mr46319206qtw.140.1655103961023;
        Mon, 13 Jun 2022 00:06:01 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a240300b006a6a1e4aec2sm6086602qkn.49.2022.06.13.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:06:00 -0700 (PDT)
Message-ID: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Mon, 13 Jun 2022 09:06:49 +0200
In-Reply-To: <20220611161701.46a68837@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-23-nuno.sa@analog.com>
	 <20220611161701.46a68837@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@
 kernel.org>, Claudiu Beznea <claudiu.beznea@microchip

.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 2022-06-11 at 16:17 +0100, Jonathan Cameron wrote:
> On Fri, 10 Jun 2022 10:45:33 +0200
> Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>=20
> > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > were
> > returning a mix of NULL and error pointers being NULL the way to
>=20
> pointers with NULL being the way to...
>=20
> > "notify" that we should do a "system" lookup for channels. This
> > make
> > it very confusing and prone to errors as commit dbbccf7c20bf
> > ("iio: inkern: fix return value in
> > devm_of_iio_channel_get_by_name()")
> > proves. On top of this, patterns like 'if (channel !=3D NULL) return
> > channel'
> > were being used where channel could actually be an error code which
> > makes the code hard to read.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> > =C2=A0drivers/iio/inkern.c | 24 +++++++++++-------------
> > =C2=A01 file changed, 11 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> > index 87fd2a0d44f2..31d9c122199a 100644
> > --- a/drivers/iio/inkern.c
> > +++ b/drivers/iio/inkern.c
> > @@ -214,7 +214,7 @@ static struct iio_channel
> > *of_iio_channel_get(struct device_node *np, int index)
> > =C2=A0struct iio_channel *of_iio_channel_get_by_name(struct device_node
> > *np,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan =3D=
 NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Walk up the tree of =
devices looking for a matching iio
> > channel */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (np) {
> > @@ -231,11 +231,11 @@ struct iio_channel
> > *of_iio_channel_get_by_name(struct device_node *np,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0chan =3D of_iio_channel_get(np, index);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(chan) || PTR_ERR(chan) =3D=3D -
> > EPROBE_DEFER)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
>=20
> This original behaviour is 'interesting'. If we get a error like -
> ENOMEM
> we should return it rather than carry on.=C2=A0 Do we have enough
> knowledge
> of possible errors here to be more explicit on when we keep looking
> up
> the tree?=C2=A0 I think we can get -ENOENT from
> of_parse_phandle_with_args()
>=20
> That raises an interesting question on whether -ENODEV is the right
> response
> for the previously NULL case or is -ENOENT more consistent with other
> of_ functions?=C2=A0 No device could be thought of as being the case that
> needs
> to defer (in hope it turns up later) whereas no entry means it will
> never
> succeed.

From what I could see, of_parse_phandle_with_args() either returns=C2=A0
-EINVAL or -ENOENT. We also have the internal of_iio_channel_get()
which can return -ENOMEM. So I guess we should only continue looking if
we get -ENOENT?

To be clear, do you still prefer to explicitly return -ENODEV in the
previous NULL cases or should we honor the return code from=20
of_parse_phandle_with_args() and just return chans (and thus ENOENT)?

- Nuno S=C3=A1
