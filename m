Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C41FBC81
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 19:13:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mZXb1srjzDqfD
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 03:13:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=f31yLqgy; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mZWM3h8NzDqtS
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 03:12:14 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id z1so16081343qtn.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=S7ArzOUWxzz9/aE6D+AcbpyDxVfw/HU/O7GvPegs3aI=;
 b=f31yLqgyB2bGhSRIkRwJcgBvrO358o/l95tCJHsKOVRMS4wLu1k3lEcwha9ySYbwv3
 E/sehFnw5TzxEuH5NGAznVRFn28PgYEkfMko5o0X8Ai3Qd9HXxWta4kkQ/AGbeSGwcha
 iCx+x9I3Ifamp/WTytjxqopVWIHCQghONaPjfuwMJMWWDKRxBFNXgdAiOPRIrClnK8bn
 KRyznsFB4JCJxJ33aZ05tbMykCVOcKSwr7r438UhG8hvLxkA0UzkeEdTEVh/tKsleOpF
 ihacg4EQfZFaJYxocVP3GUqYvZPDvoHcMkfn9ZyJCnqF+sQR5o0yddMZy07BJ7so01B4
 mpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=S7ArzOUWxzz9/aE6D+AcbpyDxVfw/HU/O7GvPegs3aI=;
 b=t3ih15ZXJqE8dwmzi4s5U8hxdOLCde3f58T2+ef3sX8VdLyhhfRhXpjDsIEf4lVrLU
 mxgyOYdDn1sG/I7pmRlajLt4BScjZWmRDIahP+g3W/DoV4LuqzYn4LidBhanndbtTqwK
 otuvsR6TWAfVCUgFXbYSqjoQ38EkZEeA3oRUpFjGLHY/WbxIExtHqRgjFvj89f32NcEP
 KQWgw+FNjQ1IHFCFjjJiwo3wBvF3nb1WbXQC7eoDMsgqv/XWDChExMkOGCw3pp1lNNdL
 hxUCzWpw7oq29S8KqHWQvP0aijjTAeyZ8N8qfuvYkB87pFNWpS6ZLDkD4XrFaNFykLU2
 THzA==
X-Gm-Message-State: AOAM533Kj+T05EY0CF6aubFC77YZ0P7KveUkaSiWH+jljMPfKnXeysM9
 MJNU8ZdyIzeB0KEwvUrUpRL9jhZtpjwVPqarBlVoKw==
X-Google-Smtp-Source: ABdhPJz9pnLssdokyqujpXJb73kI+JFGmMlzi57Fy8cq7a/kolFFjvFZZwVVlb6+ZtbGUnubUmNAgInjyNq/Ep5r6QI=
X-Received: by 2002:ac8:3246:: with SMTP id y6mr22663467qta.146.1592327530834; 
 Tue, 16 Jun 2020 10:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB4658331045B0A03FCFEB44449D800@DM6PR11MB4658.namprd11.prod.outlook.com>
 <CAO=notx-uT9hReCHgHhwujT16ps4A-Oj5KNXAk0vG2LVLrc8TA@mail.gmail.com>
 <DM6PR11MB4658E239F0F3BB58109DB3FA9D9E0@DM6PR11MB4658.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4658E239F0F3BB58109DB3FA9D9E0@DM6PR11MB4658.namprd11.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Jun 2020 10:11:59 -0700
Message-ID: <CAO=notz7oegk5+TAOoKOHkyZJf7Dhb-5oN8-+P1VLnP-cqyEbQ@mail.gmail.com>
Subject: Re: p2a control driver
To: "Montag, Gil" <gil.montag@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 13, 2020 at 10:47 AM Montag, Gil <gil.montag@intel.com> wrote:
>
> Hi Patrick,
>
> First. Thanks for the help!
>
> 1. If I'm getting it right, it's ok that I see the ASPEED PCI-PCI bridge regardless of the configuration and I am not expected to see the PCI-AHB on lspci, one as it's not a "real" PCI bridge.
Correct.

> 2, Can you please specify which items shall I enable in the kernel config and in the dts for the aspeed-p2a-ctrl driver to be loaded properly and functional?

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts#L115

You'll need to set aside a memory region.  The quanta-q71l has the VGA
enabled on its ast2400, but it's not configured for use, so we just
snagged that memory.  If you're using an ast2500, there is often
memory set aside for the lpc mmio region, you should be able to
leverage that.

> 3. Do you have some usage example for the code you referenced below (bmc firmware updater?)

The openbmc project has some users of this - I keep adding their
mailing list onto these emails for visibility.  I'm not sure what you
mean by examples, but, here's an example openbmc configuration for use
with phosphor-ipmi-flash:

meta-quanta-q71l/recipes-phosphor/ipmi/phosphor-ipmi-flash_%.bbappend

PACKAGECONFIG_append_quanta-q71l = " aspeed-p2a"
IPMI_FLASH_BMC_ADDRESS_quanta-q71l = "0x47FF0000"

The address specified corresponds with the device-tree entry.

>
> Thanks,
> Gil
>
>
>
> -----Original Message-----
> From: Patrick Venture <venture@google.com>
> Sent: Friday, June 12, 2020 21:58
> To: Montag, Gil <gil.montag@intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: p2a control driver
>
> On Thu, Jun 11, 2020 at 7:35 AM Montag, Gil <gil.montag@intel.com> wrote:
> >
> > Hi Patrick,
> >
> >
> >
> > I have an AST2500 BMC in my system.
> >
> > Doing lspci on the host connected to it via PCIe shows:
> >
> >
> >
> > 0e:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge
> > (rev 04) (prog-if 00 [Normal decode])
> >
> >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx-
> >
> >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >
> >         Latency: 0, Cache Line Size: 64 bytes
> >
> >         Interrupt: pin A routed to IRQ 17
> >
> >         Bus: primary=0e, secondary=0f, subordinate=0f, sec-latency=32
> >
> >         I/O behind bridge: 0000e000-0000efff
> >
> >         Memory behind bridge: f6000000-f70fffff
> >
> >         Prefetchable memory behind bridge:
> > 00000000fff00000-00000000000fffff
> >
> >         Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium
> > >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> >
> >         BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
> >
> >                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> >
> >         Capabilities: <access denied>
> >
> >
> >
> > This PCI-PCI bridge is shown regardless of the aspeed-p2a-ctrl driver loaded or not.
> >
> > Is this the bridge you refer in your patch https://patchwork.kernel.org/patch/10873949/  or should I see some downstream PCI-AHB bridge other than this one?
>
> The bridge is handled through MMIO, it's not specifically a bridge device, and the driver configures the PCI-to-AHB MMIO bridge - the PCI bridge itself exists regardless depending on the configuration.  If that makes sense.
>
> >
> > If I should see such PCI-AHB bridge, what do I need to do to really see it?
>
> The bridge is controlled from the host side with a register in BAR0, and from the BMC via the control registers.
>
> https://github.com/openbmc/phosphor-ipmi-flash/tree/master/tools <-- this handles identifying the bridge from the host-side.
>
> >
> >
> >
> > Thank you
> >
> > Gil
> >
> >
> >
> >
> >
> > ---------------------------------------------------------------------
> > Intel Israel (74) Limited
> >
> > This e-mail and any attachments may contain confidential material for
> > the sole use of the intended recipient(s). Any review or distribution
> > by others is strictly prohibited. If you are not the intended
> > recipient, please contact the sender and delete all copies.
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
