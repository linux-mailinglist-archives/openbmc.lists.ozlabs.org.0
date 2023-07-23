Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481EC75E28F
	for <lists+openbmc@lfdr.de>; Sun, 23 Jul 2023 16:20:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IMlLJQTE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R856N1Nbbz30GC
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 00:20:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IMlLJQTE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R855p3DHTz2yGh
	for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2023 00:19:40 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so49484721fa.1
        for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2023 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690121972; x=1690726772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgA+zkCjy71Eg5CRdSW3JqOjwvm9Z2xuvZSZN60Qn2w=;
        b=IMlLJQTEXzbi2YuhciH59xbdET4tN7AGM/Tm1YyRYwl4NpQiG6ATxP7VFycgH4NKy4
         16TPCK05klR0Eb/Xv1iqchrdi25WiGcloABR70Z7DZnbdmtxWeOl0lGZWc1fpwqXKNEO
         nO8Tbkdq5qKDpx/KYOs1IIOxT5Sad9zp+s5VbdnaLWkOGaMuNv6AJsfH//h0UOIS+Iqs
         AhG2Zxv+I4RMZ7xap0MSCaopxp2nmtTpPGy5vmxAyFS93KvoIwNgs0bd++IMX53DwTMN
         65pOoWHBtNyO8T95d6JPzDh8osZ7LU54NyYxTULG3mtxH0lcYOBFyedet6WPAWXa0iDa
         W4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690121972; x=1690726772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgA+zkCjy71Eg5CRdSW3JqOjwvm9Z2xuvZSZN60Qn2w=;
        b=TKs0KnzhzoeKr94oE33xn1RzDx9W9nUXXKFRfo/NB9kWx0sAYcTWmsxko/VzyzH+T1
         T5ivgI72Ez/5xPpiGdrfCRPNJXEkeje6ZjsaitvSHCMMB0Vg5fLxLgEqqjaA4JAChkza
         C/WWAEO/Vt+4GOKRotcfQFvV9vwqt2A78AwLPZIryMI579vVwH+C+3YSGcgKWnDybGHW
         vZUcVF3AJ7bPinen0cg1GeEnoYGmnhQIqK6u0bm2OWiVBt11lsJuHz9wWkoz9S+tebmI
         DsnaJjvV3aljjuDHk2wcU1ou3bhN0XsmUnuBN7qf3hybJD8L5iY1v3xCTWljSlpmT88b
         P1Ww==
X-Gm-Message-State: ABy/qLbrC9p8OEHW8gCB31I3Zrby80tdVgCR9TfBBWmlmewnJbtBWAsa
	csJ46Pky+OUthtY6t8PSwqsQisB5wvDZvkrBXTI=
X-Google-Smtp-Source: APBJJlE3ot2hdOAN7OMT6yi2qc7yngmMSFfP01+snW1OZ0bovoCAE+STunXTJ2en1L3Nx13ZuFlmN98F4wMw8C3orfI=
X-Received: by 2002:a05:651c:d0:b0:2b6:ee6d:b647 with SMTP id
 16-20020a05651c00d000b002b6ee6db647mr4003544ljr.28.1690121972076; Sun, 23 Jul
 2023 07:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
 <20230719220853.1029316-3-iwona.winiarska@intel.com> <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
 <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
 <2f9858b0-88e2-736a-f16a-f4fbe549e389@molgen.mpg.de> <d6de8b0e5b54ca12d9f9930f01a85467b145b134.camel@intel.com>
 <54fc5f74-d293-e467-709f-5077c03be80c@molgen.mpg.de> <88901141184a2fc5309dca1609e62e3e8c128fb0.camel@intel.com>
In-Reply-To: <88901141184a2fc5309dca1609e62e3e8c128fb0.camel@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 23 Jul 2023 17:19:20 +0300
Message-ID: <CAP6Zq1hzckzFV+fdvrQk9FDVanefwenBnExZVkegMZh0h4W3Fg@mail.gmail.com>
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "Fair, Benjamin" <benjaminfair@google.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "warp5tw@gmail.com" <warp5tw@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

Thanks for your comments.

On Fri, 21 Jul 2023 at 12:22, Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
>
> On Fri, 2023-07-21 at 08:30 +0200, Paul Menzel wrote:
> > Dear Iwona,
> >
> >
> > Am 20.07.23 um 22:20 schrieb Winiarska, Iwona:
> > > On Thu, 2023-07-20 at 16:47 +0200, Paul Menzel wrote:
> >
> > > > Am 20.07.23 um 10:38 schrieb Winiarska, Iwona:
> > > > > On Thu, 2023-07-20 at 08:20 +0200, Paul Menzel wrote:
> > > >
> > > > > > Am 20.07.23 um 00:08 schrieb Iwona Winiarska:
> > > > > > > From: Tomer Maimon <tmaimon77@gmail.com>
> > > > > > >
> > > > > > > Add support for Nuvoton NPCM BMC hardware to the Platform
> > > > > > > Environment
> > > > > > > Control Interface (PECI) subsystem.
> > > > > >
> > > > > > Please elaborate on the implementation, and document the used
> > > > > > datasheets.
> > > > >
> > > > > As far as I know, there is no publicly available documentation.
> > > >
> > > > Too bad. Documenting the datasheet name and version is still import=
ant,
> > > > so developers could request it, and it can be mapped, once they are=
 made
> > > > public.
> > >
> > > Sorry, unfortunately I can't help with that, I don't have access to a=
ny
> > > Nuvoton
> > > docs. Perhaps Tomer can provide more information?
> >
> > Hopefully. But I wonder, how can you develop and review the patch then?
>
> It is explained in the cover letter.
> Also, the review is not only about verifying driver/hardware interactions=
.
> In fact - we often have to trust the author, because the docs are not ava=
ilable.
> Interactions between software (other kernel components), whether the driv=
er is a
> good fit within its subsystem, etc. are just as important, and it's somet=
hing
> that we can review without the docs.
As Iwona mentions in the cover letter,
The series adds support for PECI on Nuvoton-based BMC boards.
It is based on patches that were sent by Nuvoton and we checking Iwona
upstream NPCM PECI driver on NPCM systems.
Iwona, in case you like to have the NPCM BMC datasheet, it can be
provided under NDA to relevant companies.
>
> >
> > > > > > Additionally, please document how you tested this.
> > > > >
> > > > > Are you asking to include this information in the commit message?
> > > >
> > > > Yes.
> > > >
> > > > > That would be unusual.
> > > > > But in general - it's a controller driver, it allows PECI subsyst=
em to
> > > > > detect
> > > > > devices behind it and for PECI drivers to bind to those devices.
> > > >
> > > > Having a test line in the commit message is not unusual at. So peop=
le
> > > > with systems where it doesn=E2=80=99t work, could replicate the tes=
t setup to at
> > > > least verify that it works in that configuration.
> > >
> > > It's unusual as almost none of the commits in Linux kernel contain "h=
ow to
> > > test
> > > it" description.
> >
> > I saw some commits document on what hardware it was tested.
> >
> > > The explanation body in the commit message should explain *why* the p=
atch
> > > was
> > > created, not how to test it.
> >
> > I disagree. It should of course the why, but sometimes also the how
> > (implementation), the used datasheets, and all other details making it
> > easy to review and give reviewers without the hardware confidence, that
> > the patch is good.
>
> But it will be persisted for eternity in the git log.
> And it is only about the review of the series as a whole, which means tha=
t
> ultimately, having this information in individual commits is just adding =
noise.
>
> >
> > > And when taken as a series - it's self documenting. There's a Kconfig=
 which
> > > allows to enable/disable the driver, and there are bindings which sho=
w what
> > > platform contains the hardware that is compatible with it.
> >
> > I just meant: Tested on server X with BMC Y using Nuvoton Z. Driver
> > registered correctly, and devices A were discovered.
>
> The series (after my modifications) was tested by Tomer from Nuvoton:
> https://lore.kernel.org/openbmc/CAP6Zq1h1if4hyubyh6N8EOdGOu+zp0qVUimF-9L2=
eXZ-QFAYjw@mail.gmail.com/
> I can link this in the cover letter.
>
> >
> > > > > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > > > > > Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
> > > > > > > Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > > > > > > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > > > > > > ---
> > > > > > >     drivers/peci/controller/Kconfig     |  16 ++
> > > > > > >     drivers/peci/controller/Makefile    |   1 +
> > > > > > >     drivers/peci/controller/peci-npcm.c | 298
> > > > > > > ++++++++++++++++++++++++++++
> > > > > > >     3 files changed, 315 insertions(+)
> > > > > > >     create mode 100644 drivers/peci/controller/peci-npcm.c
> > > > > > >
> > > > > > > diff --git a/drivers/peci/controller/Kconfig
> > > > > > > b/drivers/peci/controller/Kconfig
> > > > > > > index 2fc5e2abb74a..4f9c245ad042 100644
> > > > > > > --- a/drivers/peci/controller/Kconfig
> > > > > > > +++ b/drivers/peci/controller/Kconfig
> >
> > [=E2=80=A6]
> >
> > > > > > > +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
> > > > > > > +       dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.=
len :
> > > > > > > %#02x\n",
> > > > > > > +               addr, req->tx.len, req->rx.len);
> > > > > > > +       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->=
tx.buf,
> > > > > > > req-tx.len);
> > > > > > > +#endif
> > > > > >
> > > > > > The preprocessor guards are not needed, as it=E2=80=99s taken c=
are of in
> > > > > > `include/linux/printk.h`. Also in other parts of the patch.
> > > > >
> > > > > Since this is dumping the raw contents of PECI messages, it's goi=
ng to
> > > > > be quite
> > > > > verbose. The idea behind preprocessor guard is that we don't ever=
 want
> > > > > this to
> > > > > be converted to regular printk. If there's no dynamic debug avail=
able -
> > > > > this
> > > > > won't be printed unconditionally (even with -DDEBUG).
> > > >
> > > > How will it be converted to a regular printk?
> > > >
> > > >       #if defined(CONFIG_DYNAMIC_DEBUG) || \
> > > >           (defined(CONFIG_DYNAMIC_DEBUG_CORE) &&
> > > > defined(DYNAMIC_DEBUG_MODULE))
> > > >       #define print_hex_dump_debug(prefix_str, prefix_type, rowsize=
,
> > > > \
> > > >                                groupsize, buf, len, ascii)        \
> > > >           dynamic_hex_dump(prefix_str, prefix_type, rowsize,      \
> > > >                            groupsize, buf, len, ascii)
> > > >       #elif defined(DEBUG)
> > > >       #define print_hex_dump_debug(prefix_str, prefix_type, rowsize=
,
> > > > \
> > > >                                groupsize, buf, len, ascii)
> > > > \
> > > >           print_hex_dump(KERN_DEBUG, prefix_str, prefix_type, rowsi=
ze,
> > > > \
> > > >                          groupsize, buf, len, ascii)
> > > >       #else
> > > >       static inline void print_hex_dump_debug(const char *prefix_st=
r, int
> > > > prefix_type,
> > > >                                           int rowsize, int groupsiz=
e,
> > > >                                           const void *buf, size_t l=
en,
> > > > bool ascii)
> > > >       {
> > > >       }
> > > >       #endif
> > >
> > > Let's consider 3 scenarios
> > > 1) Dynamic debug is available
> > > 2) Dynamic debug is not available, but we're built with -DDEBUG
> > > 3) Dynamic debug is not available, we're built without -DDEBUG
> > >
> > > For 1), print_hex_dump_debug is dynamic - it can be controlled
> > > (enabled/disabled) using dynamic debug knobs (debugfs / dyndbg kernel=
 arg).
> > > For 2), print_hex_dump_debug is using print_hex_dump, which is just u=
sing
> > > printk
> > > with KERN_DEBUG level under the hood.
> > > For 3), it's compiled out.
> > >
> > > And it's scenario 2) that we would like to avoid, as hex-dumping all =
PECI
> > > communication into dmesg is likely going to make dmesg output unusabl=
e (can
> > > overflow, printing that to terminal is going to be slow, etc).
> > >
> > > The dump can be useful, it's just that in order to be useful it needs=
 the
> > > dynamic debug facilities :)
> >
> > Thank you for the explanation. Currently, this is only used in the PECI
> > subsystem:
>
> That's simply not true.
> The same approach is used in other subsystems as well, sometimes it cover=
s
> individual printk:
> https://elixir.bootlin.com/linux/v6.4/source/drivers/rpmsg/rpmsg_ns.c#L40
> In other cases it covers custom wrappers:
> https://elixir.bootlin.com/linux/v6.4/source/drivers/usb/host/ehci-dbg.c#=
L8
>
> There are more examples in the tree, but the general idea is the same - i=
f the
> log is verbose and printed often (lies on a hotpath), and we can't rateli=
mit,
> hiding it behind dynamic debug availability is an option to consider.
>
> >
> >      $ git grep 'if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)'
> >      drivers/mtd/nand/raw/nand_base.c:#if
> > IS_ENABLED(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
> >      drivers/peci/controller/peci-aspeed.c:#if
> > IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
> >      drivers/peci/controller/peci-aspeed.c:#if
> > IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
> >      include/linux/mtd/rawnand.h:#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG) |=
|
> > defined(DEBUG)
> >
> > I think, it will only cause confusing for users, wondering why it does
> > not show up with `-DDEBUG`. I assume the Linux kernel offers other ways
> > to do what you are trying to achieve. Maybe using a dump_traffic knob o=
r
> > so in `/sys`.
>
> Adding a new sysfs ABI for debug prints? No.
> Alternative would be to use tracepoints, but that's semi-stable and until=
 now we
> only had one controller driver, so, for now, I would prefer to postpone a=
ny PECI
> tracepoint conversions.
>
> Thanks
> -Iwona
>
> >
> >
> > Kind regards,
> >
> > Paul
>
Iwona, we highly appreciate that you upstream Nuvoton NPCM PECI driver :-)

Thanks,

Tomer
