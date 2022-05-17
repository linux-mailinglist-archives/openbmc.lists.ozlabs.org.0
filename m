Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4B529E1B
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:33:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2WBR5wndz3by6
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:33:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Xf1tr9Fk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Xf1tr9Fk; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W945DpSz3byP
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:31:52 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id h14so4229923wrc.6
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2yHx6+NVMu0YCkAHCFn2TtOi64BMbKJtLjluDsT1uaY=;
 b=Xf1tr9FkWaUs0Xn7nbHvm+wFMf33Utc82BJgM3b2kFHTqjzOSY9QDpTj1K2xCl1J19
 PwKr2bwu8ynAZm9KVP5hBEePnqAaNEs5iVtG/7u33+RxBaqZAWDuf7s9FdVQr/NNM2ZT
 QM6KgzkC36yyx2xrYrhWUnQeilnF31PtjyyWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2yHx6+NVMu0YCkAHCFn2TtOi64BMbKJtLjluDsT1uaY=;
 b=0zrbr5tg29yFX+1KBqn2Z9GMk27ymjVhESK+Ywuumpq9Idk184V0LihfHeRraxpeR+
 GC8zSAR7xFXaAAS5j1KDGmQr3rwKeeKBtjbykylYiOG8n6nWirMFXuGrGrY/tIKVhwO4
 JUga0OGsUa7CT047BuKR5X3hBGYJOZwenIew/xmYq/LMMPkRJMqRZfThJfnrbkdETEE6
 /Kvxbgp2rYE5vTkpE/CAHbCT5zkf5XtTVlC/+v/JxMR9nyEZuwq+lGBEicCJfDgFiwsd
 XhUgUPcLzxYCiHvjzT3FM2DUpqu3iPhUGRMxR245dLtOs+5LEgOJAmooE6HblT90sgoQ
 b9Vw==
X-Gm-Message-State: AOAM530oRzMzNj1TtbAAUc+yViobwBNJb+evgqAkG3xA/hKYQXTYDGDP
 4JL4i7TGD/iyNjd/hdi6VfkzU5TPerufwshFNTM=
X-Google-Smtp-Source: ABdhPJyLiH0QSB232tBxq8DS8gnVPeHv/pkRCK0w4YPm4165uEh5Y+hPoxw5ev8aPbV1Ei4+e3c9tPfL0YndCDPn7Ro=
X-Received: by 2002:a5d:410c:0:b0:20d:382:3ff5 with SMTP id
 l12-20020a5d410c000000b0020d03823ff5mr10222572wrp.489.1652779908299; Tue, 17
 May 2022 02:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220517043825.26893-1-zev@bewilderbeest.net>
 <YoMpw1WrKC+RBez4@hatter.bewilderbeest.net>
 <CACPK8Xca-07ZnYjCUmxEA3H-WQLohD-JYVEp+hM+XaHPNGfmUQ@mail.gmail.com>
 <YoNqse+81EdwcguP@hatter.bewilderbeest.net>
In-Reply-To: <YoNqse+81EdwcguP@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 09:31:36 +0000
Message-ID: <CACPK8Xdy1Y1Cb-aOBiJhsqe-ZJTWA9zPRU=gvGjy7MDzJUh1+w@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: use bus name in mdio error messages
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 17 May 2022 at 09:28, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, May 16, 2022 at 09:54:35PM PDT, Joel Stanley wrote:
> > On Tue, 17 May 2022 at 04:51, Zev Weiss <zev@bewilderbeest.net> wrote:
> > >
> > > On Mon, May 16, 2022 at 09:38:25PM PDT, Zev Weiss wrote:
> > > > Previously we'd been using a device name retrieved via
> > > > ftgmac100_data->phydev, but the mdio read/write functions may be
> > > > called before that member is initialized in ftgmac100_phy_init(),
> > > > leading to a NULL pointer dereference while printing the error mess=
age
> > > > issued if the mdio access fails.  We can instead use bus->name, whi=
ch
> > > > is already available at that point.
> > > >
> > > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > > Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib suppo=
rt")
> > > > ---
> > > >  drivers/net/ftgmac100.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > >
> > > Sorry, forgot the subject-prefix tag on this one -- this is for u-boo=
t
> > > v2019.04-aspeed-openbmc in case it wasn't clear.
> >
> > Thanks, I figured that out :)
> >
> > How do you reproduce this one?
> >
>
> I'm in the process of trying to transition e3c246d4i off of the 2016
> branch, and with the 2019 branch I'm finding u-boot spewing a bunch of
> output like
>
>   : mdio read failed (phy:0 reg:2)
>   : mdio read failed (phy:1 reg:2)
>   : mdio read failed (phy:2 reg:2)
>   ...
>
> (sometimes with some amount of garbage before the colon at the start of
> the line, and with "eth1" instead after this patch.)

Interesting. Are all of the clocks turned on in the same way as the
old branch? Dumping the SCU registers might give you a clue.

>
> I'm currently experimenting with various Kconfig settings and dts tweaks
> (on two different variants of the hardware) to try to narrow down the
> underlying cause and hopefully eliminate the error spew entirely, but in
> the meantime I figured we might as well get that error-reporting path
> smoothed out a bit.

Thanks for the explanation.

I'll apply it to our tree now, but also send it to mainline when you
get a chance.

>
> > I didn't realise we had downstream changes for this driver, we should
> > ask aspeed to submit their downstream changes to u-boot mainline.
>
> That sounds appropriate -- though as C=C3=A9dric pointed out, since the
> relevant parts for this particular patch are already in mainline u-boot
> I should probably send this upstream as well.

+1
