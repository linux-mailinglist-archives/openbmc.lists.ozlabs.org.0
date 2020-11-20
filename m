Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BD2BB0DD
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 17:45:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd2VX4pkkzDqyj
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 03:45:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ls5/Ak3e; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd2TT3BLDzDqyZ
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 03:44:57 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id 199so9436035qkg.9
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5wJZ6b3PN/l+7AmldMh9Xh+3T2nu6cEdimoRsWYMQUc=;
 b=ls5/Ak3eTxNJtu+w0NeVgT5UMksaKYzQJ5RvtOOiURC0uiI3gBqmToNkXb9PNtMPUU
 BBYFQtCfoKoqzy4eI/p9NvuB18iCmrl7ITHan5OZlCJfI1GjHQ1VRmkJuafezXugCNDX
 I8u9uGr9j27bEKvSYVyZJKmE4RvJEWx+5IgabIOGC811ZM1t2CN2DICNEASkve6p78Pe
 PlUXtAFAMyB8u/10jnZ/VDuyB6Qehdil8OTPV3muUVYANmitdOmNvIsj4CWwBzosi6Gd
 cRNYwgITDwyqj6k4K3wmcNr1MwHoyEMfknPTtMTTTh4BnhqYvlg5bqcuGUSAwwk1oZi/
 AgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5wJZ6b3PN/l+7AmldMh9Xh+3T2nu6cEdimoRsWYMQUc=;
 b=JXkB4orW3BabNXyiipRofZOhBtHtlC+/dbfUzzcVuJTZJTMwh99aZhgi0BIryQvsMZ
 jOwqLzga76uLjWvxa8rdPpAzNZOaEvYLjtVt5W1LDuthUmtJaxM4xkceBsVtLVzwN4GW
 jbXtseYROXguBt7xzgHw5ZO57f+G90DIAlGdY4NQBWaakyBNxMnaVjVzNakrTOZkFmaq
 R52+mvpm4j8C3OOg+4SlsArDRIVq/sGr4433f4E82Y9uRL9vcNM+DeVR7s+Pu5XbEzbH
 iI+OS1aborOE0vP6U7ISwh90sPDyFjWw+jZnkDHcIbhxkSpR8Of/JGju2f2J7s+xUhkb
 CkSg==
X-Gm-Message-State: AOAM532kQYG0E3p3up+AlwJ4ULZxsHVDLDt9GilnwfnZdCzY/frt3erI
 xc9jfyFx8Ao9yEAiBp6/KEmX6m9/miARWnEYW+0Muw==
X-Google-Smtp-Source: ABdhPJx8TnZ9QpMNvCXVCcFNBm2wfpzBxq6v7A1ZvuRAeK7Ddf+VvyviSIUkpzr8u+rn2WanQHezSJZWOa9cN7WUr8k=
X-Received: by 2002:a37:a249:: with SMTP id l70mr16310609qke.79.1605890689614; 
 Fri, 20 Nov 2020 08:44:49 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
 <CAO=noty4NEETUhb2jXhODV9THigegMdpKcteofBdygzLD0PZdw@mail.gmail.com>
In-Reply-To: <CAO=noty4NEETUhb2jXhODV9THigegMdpKcteofBdygzLD0PZdw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 20 Nov 2020 08:44:38 -0800
Message-ID: <CAO=notxg5=bSSZF5ghQRy2O=a152U2i8TkMmKvtxCGxvM3uz8Q@mail.gmail.com>
Subject: Re: qemu for bmc
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
 John Wang <wangzhiqiang.bj@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 8:56 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Nov 18, 2020 at 11:41 PM C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >
> > Hello,
> >
> > On 11/18/20 10:11 PM, Patrick Venture wrote:
> > > Patrick;
> > >
> > > I was looking at a patch series of yours that landed,
> > > https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> > > this line you're referencing a device that appears to be missing from
> > > qemu - namely, the pca i2c mux.
> > >
> > > My question is to the community at large, and you also, is anyone
> > > currently implementing this i2c-mux or a similar one?
> >
> > I haven't seen any patches for this device on the QEMU mailing
> > list.
> >
> > John Wang from Bytedance has started developing some new I2C
> > device models for their G220A board. We hope to get that merged
> > in 6.0.
> >
> > If you are interested, we maintain a brief TODO list here
> >
> >   https://github.com/openbmc/qemu/wiki
>
> Thanks, I'll take a look.
>
> >
> > Feel free to update.
> >
> >
> > In terms of priority, I think that the support to boot from eMMC
> > on the AST2600 is an important one. Reviewing the FSI patches
> > also but that's an IBM thing, so it might not interest the
> > community that much.
> >
> > There are quite a few I2C models missing.
>
> Yes.
>
> >
> > All Aspeed models could be more precise.
> >
> >
> > Google and Nuvoton have merged their models for the npcm750-evb
> > and quanta-gsj boards. It would be good to have some interaction
> > with them, on bus/device modeling but also on full system emulation.
>
> Yeah, I believe you've seen my team's patches adding nuvoton support
> to Qemu.  It's a WIP, but we're making a lot of headway and hope to
> have more Nuvoton 730/750 qemu devices sent to qemu over the coming
> days, weeks, etc.
>
> One of the big gaps that I'm seeing is that we weren't yet looking at
> the rest of the board as closely, to see what other devices are
> missing, such as the i2c-muxes, etc.  This will be a really good
> community convergence point as there are only so many i2c-muxes,
> voltage regulators, temperature sensors, that are in common use.
>
> I'll go through some of our plans as stated and add them to the todo
> list.  My team currently isn't focused on aspeed support at present,
> but we're keeping an eye on it and are definitely excited to see
> others contributing in that space!

Cedric,

I noticed you wrote the smbus_ipmi device in qemu.  It looks like this
is meant to operate on the host-side using the SSIF driver.  I'm
looking at the Kudo BMC board which uses SSIF on the BMC side, and
don't see an SSIF driver yet in openbmc/ilnux, but I wanted to
validate that the host-side of the equation is what you've provided in
Qemu?  Perhaps a silly question, but I've been caught off guard by
some bad assumptions recently. :)

Thanks,
Patrick

>
> >
> > Cheers,
> >
> > C.
>
> - Patrick
