Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52D54D888
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmfY2Yrvz3fFv
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X68PW8XV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X68PW8XV;
	dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM2y50Dptz2x9G
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 17:19:40 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id d23so3475028qke.0
        for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GB+StqyTCKj2HdFboJFVKMCJDxe3eEc2lGFDv1Opjlc=;
        b=X68PW8XVsxQon0pHG8Sz5eBs3OS4NqSoIFXXe/2G6Nvk/Ompk2l/aeSLop0xsWcJ5E
         r+imyj6yRhl2ZBY5gXu6epRIquTOxi5XRXkt8chNvQ9i2e6cKF0ixckJovb4CewVtw3a
         u7m+l85fbDcOwBkr5wl8/iEJyWb9SDi2BND4tt8QxC/8hYJ+QSWoTwQJlI3MpdiaP0TW
         6yNqcyKDvDSBqqDXyxsrnQmuDJ/Wm3MGqXQnOht4OpdpbeKyiQUmXcJUjIazEsf3nvgc
         erjP+lgqHr0T63epVk4DXJ3R/zBrJtNJPJZug+u1Hzggan083EJkQVJsbMGQXRTKtTRs
         dKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GB+StqyTCKj2HdFboJFVKMCJDxe3eEc2lGFDv1Opjlc=;
        b=YRGNR4wgaNLtKMX0k7Vk2fSjc4FVXgW5BnbL6HRHtPCkIhB+DHjy1j9bprNHPg8GSs
         m/WD8GfOasmlJwWhIHeETJyUA8o2RypQdKBHcZeqkTx6dZa9cyJRqSM0yzSKp7MKzxqa
         P62d19chkbpoiFx0obSolyd6JjUEFnKLGQwnIDG9WTQ+99ltvxyKg4/IMtG+usz5NLMt
         cKF1wEbXNDOq/B7TXjcaHLezB2D5btc3NwWnfbxk9uXCAegP6WsrDV7jl3yITTTZ2gjL
         V1a72OUPf23Qrj7g5ZO+VgfyT+NmsU6EPwhGdE+r6cgmoVBYmBnQh2JgRb4yMc/HJSop
         QgnQ==
X-Gm-Message-State: AOAM533Yi7nWsEq9m8AgXlstXbIiXgUwfaL+9DiEufTIWXZATZ6t6pK3
	Taz9Rc3uCTZGP9233psW7fg=
X-Google-Smtp-Source: ABdhPJzkwQ8Lh4v8HmiyNYZX3CyfRLZco1LI0RmoLkuXuUs3JtU60bnSz/zcTWm7wmCt5lo+xJyqEQ==
X-Received: by 2002:a37:4454:0:b0:69f:c339:e2dc with SMTP id r81-20020a374454000000b0069fc339e2dcmr36709053qka.771.1655104776463;
        Mon, 13 Jun 2022 00:19:36 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de. [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a408800b006a77e6df09asm4182070qko.24.2022.06.13.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 00:19:35 -0700 (PDT)
Message-ID: <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Date: Mon, 13 Jun 2022 09:20:26 +0200
In-Reply-To: <20220611155902.2a5a7738@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-21-nuno.sa@analog.com>
	 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
	 <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
	 <20220611155902.2a5a7738@jic23-huawei>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@in
 tel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Thara Gopinath <thara.gopinath@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 2022-06-11 at 15:59 +0100, Jonathan Cameron wrote:
>=20
> +Cc Mark Brown for a query on ordering in device tree based SPI
> setup.
>=20
> On Fri, 10 Jun 2022 22:08:41 +0200
> Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>=20
> > On Fri, 2022-06-10 at 16:56 +0200, Andy Shevchenko wrote:
> > > On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > > wrote:=C2=A0=20
> > > >=20
> > > > 'of_node_put()' can potentially release the memory pointed to
> > > > by
> > > > 'iiospec.np' which would leave us with an invalid pointer (and
> > > > we
> > > > would
> > > > still pass it in 'of_xlate()'). As such, we can only release
> > > > the
> > > > node
> > > > after we are done with it.=C2=A0=20
> > >=20
> > > The question you should answer in the commit message is the
> > > following:
> > > "Can an OF node, attached to a struct device, be gone before the
> > > device itself?" If it so, then patch is good, otherwise there is
> > > no
> > > point in this patch in the first place.
> > > =C2=A0=20
> >=20
> > Yeah, I might be wrong but from a quick look... yes, I think the
> > node
> > can be gone before the device. Take a look on the spi or i2c
> > of_notify
> > handling and you can see that the nodes are get/put on the
> > add/remove
> > notifcation. Meaning that the node lifespan is not really attached
> > to
> > the device lifespan. If it was, I would expect to see of_node_put()
> > on
> > the device release() function...
>=20
> I had a look at spi_of_notify() and indeed via
> spi_unregister_device()
> the node is put just before device_del() so I agree that at first
> glance
> it seems like there may be a race there against the useage here.
> Mark (+CC) out of interest why are the node gets before the
> device_add()
> in spi_add_device() called from of_register_spi_device() but the
> matching
> node puts before the device_del() in spi_unregister_device()?
> Seems like inconsistent ordering...
>=20
> Which is not to say we shouldn't fix the IIO usage as this patch
> does!
>=20

Just to add something that came to my attention. In the IIO case, it
does not even matter if the parent device has the OF node lifetime
"linked" to it (as it actually happens for platform devices). The
reason is that iio_dev only has a weak reference to it's parent and (I
think) the parent can actually go away while the iio_dev is still
around (eg: someone has an open fd to the iio_dev cdev).

> >=20
> > Again, I might be wrong and I admit I was not sure about including
> > this
> > patch because it's a very unlikely scenario even though I think, in
> > theory, a possible one.
>=20
> The patch is currently valid even if it's not a 'real' bug.
> Given we are doing a put on that device_node, it makes sense for that
> to occur after the local use has finished - we shouldn't be relying
> on
> what happens to be the case for lifetimes today.
>=20
> Now, I did wonder if any drivers actually use it in their xlate
> callbacks.
> One does for an error print, so this is potentially real (if very
> unlikely!)
>=20
> This isn't a 'fix' I'd expect to rush in, or necessarily backport to
> stable
> but I think it's a valid fix.
>=20

Should I drop the fixes tag?

- Nuno S=C3=A1




