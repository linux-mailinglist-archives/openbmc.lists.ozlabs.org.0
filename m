Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7F2C170F
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 21:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfzyq0xQFzDqS5
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 07:58:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UWji/0Wu; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfzxn3WFzzDqP6
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 07:57:48 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id q5so18367862qkc.12
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 12:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r0Tv48ZWSiQ9OCPPp81zGPQRKxEFr3825WjTuIxPHaA=;
 b=UWji/0WuYQDKH9GvgSLTD5xdAXmPsmyAHZ3W1aW4mMw3G7hKpNG5GCtPU9bfcgDmwa
 SQmfDmrX6KGWy7lvEfE+dJAPFQEnMbloAqWlzriwjdcvP0blzPlkSm5lOFzzmVLIICKn
 DowHDbrGu/h0rd3Znw4o906mMH3U00ROhbEY9Jd00riAE4rXctIChz4V+XK9Htji/444
 Uhep2xgXeoKLHaG4Vq2UDc22VaH8ohrzIh+v6mzWb6TT95u6cfPJrrgH6Dwj1fhLKzit
 POIaKTg9BJwMEZwBZneAEkh428RtVeVJQkVAcK2w4I4JbZsWT1Zf/d8ycIFh5DxXE19a
 W3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r0Tv48ZWSiQ9OCPPp81zGPQRKxEFr3825WjTuIxPHaA=;
 b=CNLaTYxycPpJhMvu764wIvVItuWl/GKdAT72EoGKPCxv5fe/Gh7DBOTVEmTtwzjfvu
 lPVbNPYZLMPZ9gSARZXT2H5Q00sR4dBgGi+Xd8sfzUAIRNbdl+HFMoIq7lFsBz40ooJx
 mx+fDcfcGKtWmkff9keQWI0l+6SLbXHROxktbJct/9IKP33qCA6kIFEgNTkLjsllYBqB
 Rs7ivyoI09Fh2VHGC7zDZ/Rro00mwiCbM0THSBFM6oQioEovbVMVrt6a7bDwO8GiXqNH
 tqwA+Ov0bi4ouuigRs7c3swdGMHPgu4NzO7rUCmYi1RoxSwM0P2g2A9BplrDMaxwLT6v
 aSFA==
X-Gm-Message-State: AOAM532fJSjBP4d8SS76oiAXBIzlVn36prypXDx4d3GSbvF7RnGzOVqK
 CNt7gz0jJiZm0PB9kntD+JyCzw8jrOu8qsMWdqYBTw==
X-Google-Smtp-Source: ABdhPJyd8CFOPSRRACv/0txTrHZhPf3RXG9eei7U1W4jTuaB/j+41FIKq1R+Nujg7f7ALo7/82F3AEJCk1UrhCD0G4c=
X-Received: by 2002:a37:8041:: with SMTP id b62mr1481973qkd.244.1606165064096; 
 Mon, 23 Nov 2020 12:57:44 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
 <CAO=noty4NEETUhb2jXhODV9THigegMdpKcteofBdygzLD0PZdw@mail.gmail.com>
 <CAO=notxg5=bSSZF5ghQRy2O=a152U2i8TkMmKvtxCGxvM3uz8Q@mail.gmail.com>
 <54cda4be-7717-ff78-c97a-f2942bc11543@kaod.org>
In-Reply-To: <54cda4be-7717-ff78-c97a-f2942bc11543@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Mon, 23 Nov 2020 12:57:32 -0800
Message-ID: <CAO=notw2kMggxeaTDzYMjCekZMF8Wv6HuYkkcfZ_ssaXJn6CJw@mail.gmail.com>
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

On Mon, Nov 23, 2020 at 2:58 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 11/20/20 5:44 PM, Patrick Venture wrote:
> > On Thu, Nov 19, 2020 at 8:56 AM Patrick Venture <venture@google.com> wr=
ote:
> >>
> >> On Wed, Nov 18, 2020 at 11:41 PM C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
> >>>
> >>> Hello,
> >>>
> >>> On 11/18/20 10:11 PM, Patrick Venture wrote:
> >>>> Patrick;
> >>>>
> >>>> I was looking at a patch series of yours that landed,
> >>>> https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> >>>> this line you're referencing a device that appears to be missing fro=
m
> >>>> qemu - namely, the pca i2c mux.
> >>>>
> >>>> My question is to the community at large, and you also, is anyone
> >>>> currently implementing this i2c-mux or a similar one?
> >>>
> >>> I haven't seen any patches for this device on the QEMU mailing
> >>> list.
> >>>
> >>> John Wang from Bytedance has started developing some new I2C
> >>> device models for their G220A board. We hope to get that merged
> >>> in 6.0.
> >>>
> >>> If you are interested, we maintain a brief TODO list here
> >>>
> >>>   https://github.com/openbmc/qemu/wiki
> >>
> >> Thanks, I'll take a look.
> >>
> >>>
> >>> Feel free to update.
> >>>
> >>>
> >>> In terms of priority, I think that the support to boot from eMMC
> >>> on the AST2600 is an important one. Reviewing the FSI patches
> >>> also but that's an IBM thing, so it might not interest the
> >>> community that much.
> >>>
> >>> There are quite a few I2C models missing.
> >>
> >> Yes.
> >>
> >>>
> >>> All Aspeed models could be more precise.
> >>>
> >>>
> >>> Google and Nuvoton have merged their models for the npcm750-evb
> >>> and quanta-gsj boards. It would be good to have some interaction
> >>> with them, on bus/device modeling but also on full system emulation.
> >>
> >> Yeah, I believe you've seen my team's patches adding nuvoton support
> >> to Qemu.  It's a WIP, but we're making a lot of headway and hope to
> >> have more Nuvoton 730/750 qemu devices sent to qemu over the coming
> >> days, weeks, etc.
> >>
> >> One of the big gaps that I'm seeing is that we weren't yet looking at
> >> the rest of the board as closely, to see what other devices are
> >> missing, such as the i2c-muxes, etc.  This will be a really good
> >> community convergence point as there are only so many i2c-muxes,
> >> voltage regulators, temperature sensors, that are in common use.
> >>
> >> I'll go through some of our plans as stated and add them to the todo
> >> list.  My team currently isn't focused on aspeed support at present,
> >> but we're keeping an eye on it and are definitely excited to see
> >> others contributing in that space!
> >
> > Cedric,
> >
> > I noticed you wrote the smbus_ipmi device in qemu.
>
> I wrote an experimental iBT device model using a chardev device backend
> to communicate with the external world (the host)

Yeah, I saw this discussion with Havard who effectively owns our Qemu
workflow and has been contributing our initial patches in this regard.
I'm aware there are some ideas on how this should work, and we should
have a couple useful devices going upstream shortly that wire up kcs
to a host-extern device.

My question was specifically regarding the smbus_ipmi device you
implemented for the host:
  - https://github.com/qemu/qemu/blame/master/hw/ipmi/smbus_ipmi.c

Presumably this device can also talk to a kcs-bmc-extern, as it just
requests a bmc property device linkage.

>
> > It looks like this
> > is meant to operate on the host-side using the SSIF driver.
>
> The goal was to connect a Aspeed BMC QEMU machine to a PowerNV QEMU machi=
ne
> using an external IPMI BMC. The PowerNV machine uses by default an intern=
al
> BMC simulator but it can be switched to an external one and connect to a
> remote BMC using the OpenIPMI's lanserv serial interface.
>
> It operated on top of the iBT device only.

More or less unrelated to the smbus ipmi device question, since you
replied about the aspeed simulation goal:

Interestingly the KCS host-side works with a remote kcs bmc.  In
addition to the iBT device.

We have working and will be sending up for review shortly:

[Qemu process A: simulation of host]->ipmi_kcs->ipmi_bmc_extern <->
ipmi_host_extern**->nuvoton_ipmi_kcs**->[Qemu process B: simulation of
Nuvoton BMC]

**new devices.

We actually have non-Qemu simulations able to talk to Qemu and vice
versa by just handling the Vm codec translations.

This is data-only and doesn't send the control back and forth for
things like GPIO asserts, etc, yet, but we wanted to get the data
pathway up first.

Patrick

>
> C.
>
>
> > I'm looking at the Kudo BMC board which uses SSIF on the BMC side, and
> > don't see an SSIF driver yet in openbmc/ilnux, but I wanted to
> > validate that the host-side of the equation is what you've provided in
> > Qemu?  Perhaps a silly question, but I've been caught off guard by
> > some bad assumptions recently. :)
> >
> > Thanks,
> > Patrick
> >
> >>
> >>>
> >>> Cheers,
> >>>
> >>> C.
> >>
> >> - Patrick
>
