Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A83538FBAC
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 09:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq5K63VvMz2yxx
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 17:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HaDRqZeY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HaDRqZeY; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq5Jr21N4z2xZp
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 17:27:56 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id a7so11211581qvf.11
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fd6c60dkLRfIHsRPyt11PEL9yos9VsGwA7CSYoj3Z9M=;
 b=HaDRqZeYaNGxTf5CPttSZv/8fmHuoB6uDdVWocDc0TtzHi3mBrWbkaAVqwhu0NiSRP
 +Esz/6iCBzmn8FqrNLo1P9znk5BPpb5fpWPMXboziEJbsRJJm0p3zRiMk4ExV5l/yUSm
 3tZqsHcZGDaXypUKJ5UvofZ3gpEgKPlr0wdWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fd6c60dkLRfIHsRPyt11PEL9yos9VsGwA7CSYoj3Z9M=;
 b=Sr1p/N3htMBsh/rlSleaRJ+2UJw01eXWS9O56jbNII6aG6497q6MJt4p6FFqOYm3uc
 Skg82MCtTWrgp4I4fhlBayGKMfd1XIfcgVD0E9fpBB3A9LO3un+uTdl4hgS35AlShAxP
 Up7u6O/pn51otENwXQEgb3RR4j4+tAxjp6JfR9tnNUwEc7VSlBV+FLr1JUZm9XBp4/DZ
 7efwFCr7Dtpr6Soqk28UAsZLFw+o8jjsx+i12F0eCnXdn2ptY5PxMEd4cjIM9ogRyVNr
 G3+TXZQt6Rp7qDNA3YTwyAyTlyZUCng3U2zKzjMzZ/OGtCE03KiiVq4lQ9e8+0UaooAL
 IH3A==
X-Gm-Message-State: AOAM533bHwjNkADhQEpioORhN8fVB7LcvPgD6MPAfsvAvRx9WMCf7l4i
 pf1r4t82pTIGqNsqm8E0nBqotQisJHvHMGf/13c=
X-Google-Smtp-Source: ABdhPJxPox+18FzBQnox/HzX23IrQtPMf4YX6SMQzhB/evPCPM6eGtMhYESoWc11OJ2MDTy5SdpVyOdQ6uvNiB25c4A=
X-Received: by 2002:ad4:5fcb:: with SMTP id jq11mr35256537qvb.61.1621927672462; 
 Tue, 25 May 2021 00:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210525064737.14750-1-guopingjn@gmail.com>
 <CACPK8Xe43Fnok+Y=358LmQSCDQ0WyDGD762p3An2sR7DCB7oRw@mail.gmail.com>
In-Reply-To: <CACPK8Xe43Fnok+Y=358LmQSCDQ0WyDGD762p3An2sR7DCB7oRw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 May 2021 07:27:39 +0000
Message-ID: <CACPK8XfGytJEmRDzdbCjLMT5jFWN67h7OOeH-bGJP6RgFJZDGw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine
To: guopingjn@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, guoping@inspur.com,
 banht@inspur.com, liuxiwei@inspur.com, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 25 May 2021 at 07:18, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 25 May 2021 at 06:48, <guopingjn@gmail.com> wrote:
> >
> > From: Ping Guo <guoping@inspur.com>
> >
> > The Inspur NF5280M6 is an x86 platform server with an AST2500-based BMC.
> > This dts file provides a basic configuration for its OpenBMC
> > development.
> >
> > Signed-off-by: George Liu <liuxiwei@inspur.com>
> > Signed-off-by: Ping Guo <guoping@inspur.com>
>
> In the future you can use git format-patch to set a version on your
> patch. "-v 2" will set the version to 2, for example.
>
> > ---
>
> Put the changelog of what is different compared to last time just
> below this ---. It won't be included in the git history of the kernel,
> but it's for reviewers to understand what you've changed.
>
> The patch looks good. I will apply this for v5.14 and to the openbmc
> dev-5.10 tree.

I spoke too soon. There's a mistake below:

> > +&gpio {
> > +       power_out {
> > +               gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;

This warns:

../arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts:138.3-30: Warning
(gpios_property): /ahb/apb/gpio@1e780000/power_out:gpios: cell 0 is
not a phandle reference
../arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts:138.3-30: Warning
(gpios_property): /ahb/apb/gpio@1e780000/power_out:gpios: Could not
get phandle node for (cell 0)

Taking a closer look, I'm not sure that it's a valid description. What
are you trying to do there?

Is it supposed to be a gpio hog?

> > +               output-low;
> > +       };
> > +};
> > +
> > +&gpio {
> > +       status = "okay";
> > +       /* Enable GPIOE0 and GPIOE2 pass-through by default */
> > +       pinctrl-names = "pass-through";
> > +       pinctrl-0 = <&pinctrl_gpie0_default
> > +                       &pinctrl_gpie2_default>;
> > +       gpio-line-names =

> > +&gfx {
> > +       status = "okay";
> > +};

So you're using the BMC display device?

> > +
> > +&kcs3 {
> > +       status = "okay";
> > +       kcs_addr = <0xca2>;

This is the old binding for KCS. Please update it to the newer style
with the "aspeed,lpc-io-reg" property.

> > +};
> > +
> > +&kcs4 {
> > +       status = "okay";
> > +       kcs_addr = <0xca4>;

as above.
