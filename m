Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCE2B98AE
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 17:58:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcQq34dvNzDqlL
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 03:58:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vFI8Cxqn; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcQp10k7ZzDql2
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 03:57:08 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id m65so4822588qte.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 08:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DgFuSE2DMZxNHBPsxh5+FG9j6n6sovfZK8g09b+rwdo=;
 b=vFI8Cxqn23gUHIdLQtIs9oHuHNacltBKJ1ajCD2X8yHh92ydRb5AH+uaO8owWpJlaf
 RgCSy2kDVi2PKtSgyDUo6M8Z6AElVKY8N7a3pRY2asPZdtcP4Hmz7F2e9Hsh4UL3ElMA
 4DJErJUQJ2aQ0r3xivIVp7ADronZBsoJiDcLqjxkhOdDMOIObii2QtLc7CLaqHRK9x3q
 3oAXy1J2TFkBCtlmF7yehbedanZ+e+d874ZhNi3rcsSsOmTuAdNHL+f+aw2dqVUnocyG
 ig8Y0w9u73HzDiY9HQnQNTf5jDKj3rlxd57Ww6bN7L3ioixV0bgUcdR5FYd/TGD2LYfx
 YT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DgFuSE2DMZxNHBPsxh5+FG9j6n6sovfZK8g09b+rwdo=;
 b=qOchiKg42UX4Y82kzqUwFQMK9AttQ0VLY9YAbNbE1YR/mtF1sqXL2udJk/6JRv6oee
 iC5/Xg2gj8ANIN2KP0VpJiI5iNYG2J6qGHwkhQh7KmAR3WS4Qi7t8ASihkgVvZvmf7Oe
 rTUr1cBAMKwRjC7OTBbFfRC9qUcdrcE/g678zsKXVI14GkNASgLeptZy40CzaNdJEZ4v
 pBCwZC7oNVp5Lmd180klZQqRi7AIvxCvjOAt4n6J5DbOkvmZN7Wbx4AFnXpkV33BryH2
 YeImjpl7mv16J+VZ6EkaveIpQHsAIn622S+EfhUKCr5Z1q23t6eaLGGWUhWpwDY7rtl3
 CPHQ==
X-Gm-Message-State: AOAM533fAnXv8QdRcDa4lC4IltbPXkupm+yz7pd+FhcLy8NJ0XMlTXzx
 nTNWYQcGTjSbrJeiDlSJIPbX2M4Y7tcfbfxYVtkOkw==
X-Google-Smtp-Source: ABdhPJw9l9qaGUIqVpsWhvpon5FCGZE3nvxsfmv4u+ISIAyK1hg3x9OMTJAsWw0HB7L1lxc8p/qGNsJeUMHdz3/C/9Y=
X-Received: by 2002:ac8:5a04:: with SMTP id n4mr11395538qta.21.1605805022774; 
 Thu, 19 Nov 2020 08:57:02 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
In-Reply-To: <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Thu, 19 Nov 2020 08:56:51 -0800
Message-ID: <CAO=noty4NEETUhb2jXhODV9THigegMdpKcteofBdygzLD0PZdw@mail.gmail.com>
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

On Wed, Nov 18, 2020 at 11:41 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> Hello,
>
> On 11/18/20 10:11 PM, Patrick Venture wrote:
> > Patrick;
> >
> > I was looking at a patch series of yours that landed,
> > https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> > this line you're referencing a device that appears to be missing from
> > qemu - namely, the pca i2c mux.
> >
> > My question is to the community at large, and you also, is anyone
> > currently implementing this i2c-mux or a similar one?
>
> I haven't seen any patches for this device on the QEMU mailing
> list.
>
> John Wang from Bytedance has started developing some new I2C
> device models for their G220A board. We hope to get that merged
> in 6.0.
>
> If you are interested, we maintain a brief TODO list here
>
>   https://github.com/openbmc/qemu/wiki

Thanks, I'll take a look.

>
> Feel free to update.
>
>
> In terms of priority, I think that the support to boot from eMMC
> on the AST2600 is an important one. Reviewing the FSI patches
> also but that's an IBM thing, so it might not interest the
> community that much.
>
> There are quite a few I2C models missing.

Yes.

>
> All Aspeed models could be more precise.
>
>
> Google and Nuvoton have merged their models for the npcm750-evb
> and quanta-gsj boards. It would be good to have some interaction
> with them, on bus/device modeling but also on full system emulation.

Yeah, I believe you've seen my team's patches adding nuvoton support
to Qemu.  It's a WIP, but we're making a lot of headway and hope to
have more Nuvoton 730/750 qemu devices sent to qemu over the coming
days, weeks, etc.

One of the big gaps that I'm seeing is that we weren't yet looking at
the rest of the board as closely, to see what other devices are
missing, such as the i2c-muxes, etc.  This will be a really good
community convergence point as there are only so many i2c-muxes,
voltage regulators, temperature sensors, that are in common use.

I'll go through some of our plans as stated and add them to the todo
list.  My team currently isn't focused on aspeed support at present,
but we're keeping an eye on it and are definitely excited to see
others contributing in that space!

>
> Cheers,
>
> C.

- Patrick
