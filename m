Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 934604A68AF
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 00:42:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpM1Q2vqRz3bZG
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 10:42:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CQDmX/wV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CQDmX/wV; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpM110MZrz2yfh
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 10:42:26 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id i4so16002329qtr.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Feb 2022 15:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R+AbsoQ4j4lYYOMO5DjMuZRmgaKdMhuLSDQN4EirU1E=;
 b=CQDmX/wVWidrU0SI+kIZp5NG01KUi2mO1UKAR/3ooPHi/ftdqOdZBcJs4Dzdbw5gK6
 FZsRz3L6FDerkasEbxjpBeu8/7w/c4EVFu417dqVU5Pt15b+uYlIPRCapiWdtKzliMyF
 ER6mxp7sxvM1bBRBX63tCk1fJ2RuoCOCItnWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R+AbsoQ4j4lYYOMO5DjMuZRmgaKdMhuLSDQN4EirU1E=;
 b=NUONoVUgM5fLOxypndBLagpQMdeh6jbQgub9lhV2zxWSsommHRPeVyapGUeduw/ZOI
 cZusANsjBubIV+859TedYtTeYwdLo2+r55+JQzx9LdA795v2i5nfwMvssUqv1saOYoA8
 BC0W6/TEEzPr9SJPs5Dk1XBTDwHRbMOvUIkTrzhqt/xbB2q8IpXJP9K+HvoCQXLAx9nM
 MOIPy4bx+bK1pYVrK+i8Kfqb+buRRtCxiM3WwnnQ9YrgwCvy7IBTn6IMN27gukNdywS8
 /R9tbvA56bccUZlIdwrZ8wsxzKXEeGLDOQ2fkH4C/8mNVJ45fxX53gUQYQvFAGxvJc/v
 r4iA==
X-Gm-Message-State: AOAM532Snhh7k4OZiWuymoWTzPkhcKtlD5URAHr2ZuQU5AqICwCmzlsf
 m7wK5AGjEtUj42GqL8h6ObfE3a1VeU1B5ZW4n5g=
X-Google-Smtp-Source: ABdhPJx8iUhhai2hWqxLgNwvH8cXg4bRiRbQfnn9fM91zYV0zPPxT3jHTQy1SQOXTUUlxVBfwRKKK2OfxLQ5dG9iyzs=
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr21096423qtk.625.1643758943437; 
 Tue, 01 Feb 2022 15:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
In-Reply-To: <YfZkis8M81Ejpagq@latitude>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Feb 2022 23:42:11 +0000
Message-ID: <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
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
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t> wrote:
>
> On Sun, Jan 30, 2022 at 02:50:25AM +0100, Linus Walleij wrote:
> > On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
> > <j.neuschaefer@gmx.net> wrote:
> >
> > > This is version 5 of the WPCM450 pinctrl/GPIO driver patchset.

> > Which patches do you expect to be applied to the pin control tree?
>
> These two:
>
> [PATCH v5 4/9] dt-bindings: pinctrl: Add Nuvoton WPCM450
> [PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450
>
> and the rest can go through Joel Stanley's BMC tree, I think.

Seems reasonable. I assume you're sending a v6 to fix some of the warnings?

Cheers,

Joel
