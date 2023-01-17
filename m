Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D566DA27
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 10:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx3nZ3fm1z3c8g
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 20:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HdpUBrzV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HdpUBrzV;
	dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx3mz1gMYz3bTB
	for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 20:41:22 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id g8so15834893qkl.2
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
        b=HdpUBrzVC+fRm5us0I5pcSVClglYaFUfiEm/cGmO0HRwQ+aYU0HVym6Sa1QAveTfcy
         HVrNoblnZL7c17Uzkx9cWtDUNfb/se9p1L8E0LImXSu+eOf5/sphsIlfsbxsZUBcSG3A
         epLckHWQLqK9BHTP8K/H2nWLrxRMmIziEGtmrfzMCzTlKxaNHqt+yQ5uevBzAlX/9/dD
         eraOfE2nSwKxtnVs7ghhKhl4PJs4QjHGI2ViGL60UKvVQ0h5+wkTdiujQa4bIuASu3/g
         mGE/ZB8GT3isx1sHuKZF2MZCBZI+i9AXRO9tTxFkQbgjJOCiiAphcf9gB63ctNnSGHL5
         ktCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdQxBMQOMwqD8VUok85rROkSgj2htMeyYzI/9JQJnaY=;
        b=mhuBQGOWqcbMDO4RlJ7OIUCjlWvJdSdukTUWWe41Xh+0wCxewJvIeHOIGcLOF+bcsZ
         Dr2hmtx5ryCVMqOIYWm2pfq7m0fxX1XKsLnfaq4+ewSv+9VTyVTpz+IZdzJIQuFG6lW2
         KokI5EXdKWGggvwMkczRTpHZH3onXAue4xTpMo6ftz+hwPRqGfqHhYIuZHqsjSNArpr/
         dNclHiS8vKlwx8r5pumEe3Lu1kf3LG4rerC/CKZQIbMEH5tVJxRVEUMR/NUyPelvTlKq
         QwOzSMu+XY9iSICCgb801trPFYD9tToHN9rsDp1rnOpXNNUy0c6BcxdXNdeKxHxowoBg
         Bf3A==
X-Gm-Message-State: AFqh2kohyy80VUSSC1UD9xqcpklz6gqmMC/4FQX4M2zdQHmlzedDhT4I
	FvjW2cmXCfZEAKFlQQKr5jjtEdV/32PLIszFDAA=
X-Google-Smtp-Source: AMrXdXvUweQfxPG9XW/trbF8uyUaDAKToxBAJ8l2RD/emKWwnVOskao8jQNpBm7SRN0AryYBpZ/goUm0u7jIv/pAfEY=
X-Received: by 2002:a05:620a:36f4:b0:702:34dc:25a8 with SMTP id
 cz52-20020a05620a36f400b0070234dc25a8mr95984qkb.748.1673948478628; Tue, 17
 Jan 2023 01:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20220715122903.332535-1-nuno.sa@analog.com> <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei> <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com> <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
In-Reply-To: <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 11:40:42 +0200
Message-ID: <CAHp75VdyCA7mQdm--kg=hUbmQqX4-jfFMHgLxref5mNSM1vnMA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device properties
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>, linux-imx@nxp.com, Tali Perry <tali.perry1@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Eugen Hristev <eugen.hristev@micr
 ochip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 11:06 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 17, 2023 at 10:53 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jan 16, 2023 at 10:44 PM Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> > > > On Fri, 15 Jul 2022 14:29:00 +0200
> > > > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> > > >
> > > > > Make the conversion to firmware agnostic device properties. As pa=
rt of
> > > > > the conversion the IIO inkern interface 'of_xlate()' is also conv=
erted to
> > > > > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and h=
ence OF
> > > > > dependencies from IIO.
> > > > >
> > > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > +CC Marijin who happend to post a patch for this driver that I just=
 accepted
> > > > and hence probably has hardware access.  Any chance of a test for t=
his series?
> > > >
> > > > If not, no problem as this is fairly mechanical and we have testing=
 on some of
> > > > the other drivers using the new code.
> > > >
> > > > I'll probably queue this up in the meantime but it won't end up ups=
tream
> > > > for a few weeks yet.
> > >
> > > Jonathan,
> > >
> > > This CC just surfaced in my inbox while searching for our current
> > > discussion around missing labels in qcom-spmi-vadc - and on the side =
a
> > > userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> > > patch's fwnode_get_name change - we could've caught it if I had not
> > > accidentally marked it as read and/or forgot about it.  My apologies.
> >
> > Does the following addition to the top of the
> > adc5_get_fw_channel_data() fix the issue?
> >
> > +       name =3D devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
> > +       if (!name)
> > +               return -ENOMEM;
>
> Okay, it probably the same, so it might need additional code to
>
> + name[strchrnul(name, '@') - name] =3D '\0';

I have just sent a formal patch, please test on top of non-working kernel.


--
With Best Regards,
Andy Shevchenko
