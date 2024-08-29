Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32F963E04
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 10:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvYmP1gG0z30WP
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 18:07:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724918850;
	cv=none; b=P0Yn9A15cLQrO63LZiVdixGH1hfK4pgnVjEbx5OyMJRB50TyDPvXwg4UQ6D+4MhvBC4sRf25Mr8WKw2ih/qsvGroy/8bJjyFAU6nu1j1CDmp4Ouo+kOQQilBg2MU31rOJ1Mvo+IbNfE09pGnrJ7WGRrKgSpNRo6EkRaBSQ9vp5D02mAjYGaRFx0Ls3ghivHacL6c6tSxnlBmRSsDyT5hz0NYhGs4Ns10Zz+mvhQCtPuIcRI5NXnfb+CLcs6yy+Bj3a6JemrWWwNwluv2r1arEsNyPvpwD9ekwoq2nMnaYzZxsTzmTHZLCldlyB47mTombQfSIRl0drC+Qck/9agobA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724918850; c=relaxed/relaxed;
	bh=6D9s2PHaOeXO0+gGj2oPHhq3N9H2yBwvLb6+qVDuqZY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=bsAX0YfSBVIWs3KfYN53J8Wlm6ysESlYQ4sLIVP7aibKg1W2Fnjwrsm6l29LpSXCw1uhTaHBuMJZ765R5p4FswAZDoV/olw9YJm7hlf351ZPjJOjAI31p+/daJcos7Mr3OsIX64IscFMwnQ/rNXieZiRmkvrRcDVv5rOdp7M1zUvXZ3yajMjyaNhCKcL6PA9qvn5xNLu0VcFu6mufXLDO4Li7n/jBHeB7jnsR6uK0fgCc4ZLh9h2sP2/CPEy2G1+PJnSzpXr5LHsPjEDeafj4vzek2T+x7ZKtaBXvBReqVsYPZtGxv5cXUlbUWrtpxBtSjRybOgtC2qOxMtnLN78vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ab2M53xr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ab2M53xr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvYmK7026z2ysD
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 18:07:29 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6d0e7dfab60so4809317b3.3
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724918846; x=1725523646; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6D9s2PHaOeXO0+gGj2oPHhq3N9H2yBwvLb6+qVDuqZY=;
        b=ab2M53xrmoVkOSWH8Py2Hk9QikB9WhMiZ7d5UA78rpzPuatFNenYwK2gRGYtJx+JCv
         RM+F5uunLF9OeBxwL0TMFMZBJU97QbxLF51nDp+DhvqoiZ06XPx8u4I4/kZU2yzET1nG
         a9HVu6A/r4GiRsYi3YW9gjgnbGIOZXhYVj7UZGdRh0Q4xb0xjAnFnzpTE3Wwh7z4s2NI
         GJ4IQ6hZOtvCks9mQ39cxp5pNGlY0NF2Hiq8CWLPQJbuwNxbPemNoY6xZ9C7Gg9B6P78
         ROGdIBUnjFUWPjExuo3PLdvmVZh5z4xOyqkB7eZEbw5ijGXqvgaAoVDc9GZHfjEaZyXe
         pRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918846; x=1725523646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D9s2PHaOeXO0+gGj2oPHhq3N9H2yBwvLb6+qVDuqZY=;
        b=kBXV5wF3RkhEbHf7Nw7ERt5YGSzBsaP08tXire8Wo22vFR3z+4EixqYwDHKeUSTwYM
         n1tbhFB3Lfz5xrHf2iHXrHGFN24FajX2wF9lUro1G2JH4NDwrqZeSkhULXrdg+AHDhYx
         yH08DKw16w3FFWtj5dpOI4+kRnNK4qh/HsC71BC/nAE7pvAhhFTx0PzUv7jBAiEljXAb
         pt5bS6boU0y7/mAk3xIKbF7ewZnL33TRTZG3ky3eBfJAHpWFFVKTnVYmjuK2vGAKxhpi
         n7bQh1Sj6+V5cfG1RVs2PssXVJSjMXAjAnOUNpwzsF/dwmjvSH/3tNEfBSxWs/iixlN5
         KY1w==
X-Forwarded-Encrypted: i=1; AJvYcCV9cmbpQ7cvyZFfT9Vbwo0a52zK1IBT1DUyPUu7+sv5fM+QHq6jpEC6LubpTOCjtawTZ16gVuzh@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+PTJuguCU3HU3s85pdj0fPnV871NqXvm7dtYlpFB+f8tUpbg1
	TWMEQEiZ8R4o9ht/R4uJtfGEV3aOhQ0C3qpXKIETSTXRwkz9sHNZd12SDFk7cSBw2bDgle77zrN
	nkjLdnDNGf0/lrt6dSDGQ+Irv+xk=
X-Google-Smtp-Source: AGHT+IGI+aiI64QeCszkUSpdOS1NlRrB8CzhcK6/Tl8ikOKP0qadNbGrBXByMOplW48ZmJTnXiN3tu7FN/K4wcAWEYs=
X-Received: by 2002:a05:690c:6608:b0:6b3:a6ff:769b with SMTP id
 00721157ae682-6d272708f30mr24127897b3.0.1724918845847; Thu, 29 Aug 2024
 01:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240815150255.3996258-1-tmaimon77@gmail.com> <2f21322a2412684c6aa7bb7d817e861c.sboyd@kernel.org>
In-Reply-To: <2f21322a2412684c6aa7bb7d817e861c.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 29 Aug 2024 11:07:14 +0300
Message-ID: <CAP6Zq1hxwb3eWakPJecWXbt6_JqOmph-72bRn6pztxy1KiuF+Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v27 0/3] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, krzysztof.kozlowski+dt@linaro.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

Sure.

Thanks a lot,

Tomer

On Wed, 28 Aug 2024 at 23:54, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2024-08-15 08:02:52)
> > This patchset adds clock support for the Nuvoton
> > Arbel NPCM8XX Board Management controller (BMC) SoC family.
> >
> > The NPCM8xx clock controller is created using the auxiliary device framework
> > and set up in the npcm reset driver since the NPCM8xx clock is using the
> > same register region.
> >
> > This patchset cover letter is based from the initial support for NPCM8xx BMC to
> > keep tracking the version history.
> >
> > This patchset was tested on the Arbel NPCM8XX evaluation board.
> >
> > No changes since version 26, only tested in kernel 6.11.rc1
>
> Thanks for working on this! I'm waiting for Philipp to review/ack the
> reset driver part. Until then I don't think I can apply this series to
> the clk tree. I'll add a review tag to the clk driver patch in case that
> helps.
