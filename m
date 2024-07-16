Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DEE9322FF
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 11:40:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Twu2Dp4L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNYwD2B44z3cWD
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 19:40:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Twu2Dp4L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNYvh6Lllz3cTf
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 19:40:16 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e04289a2536so4328880276.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721122813; x=1721727613; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kGcSBI9KLttqOMtI6HAsYAoeCxsCm4IUgMGDjXJEi7Y=;
        b=Twu2Dp4L2yiNKqxrC2w5qAgAfeJn3q6Q/Ixpt8ligWDct7SgsdmzXqMF2iu0aksy0W
         dmYfX4p4nuEMloqkt4wp+8WWyFigWgPAtY6lXfBfFjdjJk73qTZFO/AFbQleqXS+mmmu
         xHMN3QOImtAE26zbdYLMmhyNuNTVwIFpk/JpucVjPfXCn3YWNIk8t4HZNBiE7QlDMs8Q
         gGTB2vnJn8VnEWjGVjUXnHZcwcG8YCQ7NDdjMUMk2qPViTFyzyaVsyhZ4U607AiN5LBZ
         ffFiswS1U0VwleKlTCkLCgrTV2CTVkoVP+mbxi0msGY+O3n8E3ENNAUgDCoriy6BhoHC
         CJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122813; x=1721727613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGcSBI9KLttqOMtI6HAsYAoeCxsCm4IUgMGDjXJEi7Y=;
        b=HJS+sXoRug5Krrlo1PfIPCNPJtOATZwwMTdPneieEposqNglqgDLGrcDBBtLHuDOlx
         J9ivU/dI1LDs8vyYeDX57L1cc725rIVzltU/u/xe0VANEQhkdNexYDwDmxDDbSTjczZb
         RNKra9oOgPrE5xXCYv46V2jGSRf08PnhoZN7T+U4IfUMyjiodHw1rxHY3cAvjYAY94X2
         gQ3qCp//QcmhnPHoW5Xhxf2n2GVSjGHJl4OgqbufIB3NyVp+bZmkW8nuBsjmivtT+G20
         v7qtozelJZJXrewNFlUgVyOHWHlSF5tdLwNs6W6GArGl0OqWINgrBnpGs1KjaniqMNmz
         bhRA==
X-Gm-Message-State: AOJu0YxyaGIkEM/iPQpLt8ZOrXGRDyFMxm3thqQytaU5ZMkpZjTIgEZh
	ZhCn8eZ84LBgtJJyXsrBCW4zd6vM9Vtiix6XnKthTn1J9fIFv/+/FcCpNKdhvx4XRLsgUH3a/j6
	gALA2fdPk7R+RyMuo/3mclzNW4xh640Mr
X-Google-Smtp-Source: AGHT+IHsPjX5WeJxhWR5429hyEsPykGEhKeXcz1by0rY06497wJaefbXjg6PIswEKbxRGz5LU8xgbjMPWnL4cUhTnas=
X-Received: by 2002:a81:5c0b:0:b0:64a:445c:6 with SMTP id 00721157ae682-663a4bc08d8mr9109597b3.17.1721122813171;
 Tue, 16 Jul 2024 02:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240711200213.2402248-1-tmaimon77@gmail.com> <9f367de6783433b16fb04372985b9d6112e10ad4.camel@codeconstruct.com.au>
In-Reply-To: <9f367de6783433b16fb04372985b9d6112e10ad4.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 12:40:02 +0300
Message-ID: <CAP6Zq1i12zZeYyiwvi8_0goBjcjfK78AmVPOoE3yRwfz+mE=4w@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 0/7] pinctrl: npcm8xx: pin configuration changes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew

On Tue, 16 Jul 2024 at 06:20, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-07-11 at 23:02 +0300, Tomer Maimon wrote:
> > This patch set addresses various pin configuration changes for the
> > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > remove unused pins, and improve overall pin management.
> >
> > Tomer Maimon (7):
> >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> >   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
> >   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
> >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
> >   pinctrl: nuvoton: npcm8xx: modify pins flags
> >
> >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 64 +++++++++++------------
> >  1 file changed, 31 insertions(+), 33 deletions(-)
> >
>
> What's the state of this series with respect to upstream? Is this a
> bunch of fixes specific to openbmc/linux dev-6.6? Or do all of these
> patches have equivalents upstream?
>
> Andrew

These patches are on the upstream process
https://lore.kernel.org/lkml/CAOiHx=kr=_-ra392XH-vR2fG-E5ZVXAutU9OP6xQRrzXSu9ZWg@mail.gmail.com/T/
these patches are not specific for openbmc/linux dev-6.6

Thanks,

Tomer
