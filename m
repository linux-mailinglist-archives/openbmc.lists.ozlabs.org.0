Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5D4B6334
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 06:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVj16lqLz3bZR
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 16:56:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=e7EkjOF9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=e7EkjOF9; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyVhf4fQFz30NR
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 16:56:32 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id y8so17616247qtn.8
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 21:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uPUj/2D0fnRRHEGsxfFw4uPYjIMmB8m7B7g+xVLuCTs=;
 b=e7EkjOF9JnmPm2zvwdTKMlYivOB6v4VFpWSOnTeskfEh9TmfPrj9ow39Zv8UTTKTDD
 GCALVJO2THsTZ9IRY73lRRhUJettrYNXO6G+v6eI7xNrz6nwh2hfeArS1DWLdU54W3r1
 XqSl0wO9nM2J38wWwIORRLsAWma/NjrwNvmXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPUj/2D0fnRRHEGsxfFw4uPYjIMmB8m7B7g+xVLuCTs=;
 b=XVToifygwgsrJllPWzosTMtAyyNgE/VAtCEk2wh2P5EhVAiXSWQKliJUEtYp5oWrqW
 01RKrBR/tHUMr1fzzayZclKbfHCCwXRLLNKCuGkkG4I7owfYSA5xvvjevGDocbav8ejX
 qxyscMIyoleuDIKWEBnlNqI9qz2zypX/ZcUqAj/W+zRV1TNpcZXVSLFfxtkxKdvvGg61
 dDqkX3LT0emMOe0Z5mp/4+HPsUZ3OsTjCWUKpbkomoMtB8LqWR9qqexwZKOnsRza3x1T
 jvBPTjY7nyUCDIVZIptrgdIkALTb1+hGnKA+JIrvvUhov3FdBkz8g4TV2SutQVHaYzYT
 zYRg==
X-Gm-Message-State: AOAM532CSWpue4Su4DvNrR6npCbabUMCFDm6m0LEc00qUSk1a1dwn1eP
 1zs5/pPT6hbPEQBfEPAtFDJPccpFdHOsHYZE9zw=
X-Google-Smtp-Source: ABdhPJxDiNItJktz4LNO+XrPyLIgW4R0iAfyKu+KkaTWOe+XGOJYyD101ljPiR6VxTVgla4El5GLg42q9jEpkrRZCeQ=
X-Received: by 2002:ac8:7e91:: with SMTP id w17mr1635736qtj.678.1644904589150; 
 Mon, 14 Feb 2022 21:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
 <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
 <YgdyjUbb4lnrVHmJ@latitude>
In-Reply-To: <YgdyjUbb4lnrVHmJ@latitude>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Feb 2022 05:56:17 +0000
Message-ID: <CACPK8Xe-t8Qso_AX+q08OxrgmUPbEayhnHXH5xiLr7M6rDxjuw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 at 12:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> On Wed, Feb 02, 2022 at 02:10:44PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
> > <j.neuschaefer@gmx.net> wrote:
> > > On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > > > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefe=
r@gmx.net> wrote:
> >
> > ...
> >
> > > > I assume you're sending a v6 to fix some of the warnings?
> > >
> > > No, the warnings are fairly independent of this patchset, it's just t=
hat
> > > the adjacent pinctrl-npcm7xx driver started to be built by the bot, d=
ue
> > > to my Kconfig change. I'll fix them in a separate patchset.
> >
> > I guess you need to fix that first.
> >
> > Because now and then all CIs will complain to your patch and confuse pe=
ople.
>
> FWIW, Linus has applied the npcm7xx fixes to for-next in the pinctrl tree=
,
> which means that they are not blocking this patchset anymore, AFAICS.

I've applied the device tree changes, and I will send a pull request
for v5.18 with those.

I assume you want Linus to merge the pinctrl bindings and driver
through his tree.

Cheers,

Joel
