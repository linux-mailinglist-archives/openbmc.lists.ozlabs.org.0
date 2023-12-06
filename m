Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D9806A5B
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 10:08:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JVtGeOyt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlWm63QK6z3d8T
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 20:08:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JVtGeOyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlWlY5RbHz3cW8
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 20:08:08 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d3644ca426so66847417b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701853683; x=1702458483; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7lQAk4dd1dtXP017dATzjQ4PTgT/W1M+tRmZfZ7gIc=;
        b=JVtGeOytBQRU1EAVBP2YTte6elBZ2NiaZVftxGCbes2NO/oapmhiTD+5v8I2NSDXQB
         u4DFaWybHTkCtqNgIfp4MPMtKnAfoX5dMaJQCnfrghIPrbg+V0vWPxoiGGVX/E5s8zPf
         dUhPL25Gw8sTLPpBL/s72L7eMYGU3coQYYLU92b1s5a5ICPThB6hWpuMUwZcxOZMMatk
         kAtEsgDwN2g4AcS+Op25/HAhQQm4xNdEtjO161jtFzU5nnlN9Kx1y320DUgz4PDylS9f
         Wl8gpCaOLPw8YGHUmoZsTYSNmQLrrd07xyl6lglAdSWAs3jTdgzuSQ2b6EwCH4FuWeR9
         G6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853683; x=1702458483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7lQAk4dd1dtXP017dATzjQ4PTgT/W1M+tRmZfZ7gIc=;
        b=c4og69Ny9/ei0mxWEbLTqtV9Cx97dGDdOFv08pL1kQAMJiiYhmP70sG6408a7EgOAt
         IPq6qEEHAqSLbI0/gfCSQ26re/CIwImaadvFo3CDFw/UNrUgZL26HjxMXGhTfElGanI4
         OOBmuEYLERCFmQlREdBC+FNeRJh/NEivfmkpjsbz8eEFcmzbhVhfxuXwygZxO84Gpy+l
         nBkMeiq29Fj+cnJn/nOt8o7iKqs749X+oYYR+7ZN9qJWchJVyisVSG4IU0EpA7Luy9nB
         O4au7MtIWpb74PlhdfOWnE4t6uI4spqkIlZUoSGQb+1R6VYv7qWvoc3lVBLBnIIAT5tD
         1f7A==
X-Gm-Message-State: AOJu0YwPn9ewhOJVTSedEwzJ42a+rPJ+CGT4dzJrD8jD78z5bRSzbcGC
	47sZBy9AGsSUy+hhfr4oUS10/bI7Y7X9e/sHUNBPG8j4FG8=
X-Google-Smtp-Source: AGHT+IGwtjFwM2+/enJ3mic1p2ueq4pJVF5aZm9oLz+8ZfRNqxHHQHU4uiEZ7xswV3QYxf5oOilx7+I1CI9GesSC7ew=
X-Received: by 2002:a81:4321:0:b0:5d7:2c6b:623 with SMTP id
 q33-20020a814321000000b005d72c6b0623mr411961ywa.39.1701853682296; Wed, 06 Dec
 2023 01:08:02 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
 <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com> <CAP6Zq1iRD+ij92LpOgTO0oFRB7gnz4udLGJPgY=fOjkD+UpFxA@mail.gmail.com>
In-Reply-To: <CAP6Zq1iRD+ij92LpOgTO0oFRB7gnz4udLGJPgY=fOjkD+UpFxA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 6 Dec 2023 11:07:51 +0200
Message-ID: <CAP6Zq1j0SR4MdU0WfDVETVHu191uFFJ56aayAd5CZ3kY0hdaXw@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.6
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel

The blow patches are upstream to kernel 6.7, only one patch (hwmon:
(npcm750-pwm-fan) Add NPCM8xx support) was applied to next Linux
version, kernel 6.8)

Marvin Lin
   media: dt-bindings: nuvoton: Add NPCM VCD and ECE engine -
f329051273ca01c74a827c70d0d47f2525678b7a
   dt-bindings: soc: nuvoton: Add NPCM GFXI -
c3dea90fdfc16b768add6ef99dfd6eec8a0bf48c
   media: v4l: Add HEXTILE compressed format -
d62d8e7b59f9d7ed9b6eaaa788fee0d727b7d3ad
   media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
- 2817154cd18942cd89e254d3764a378518a3270f
   media: uapi: Add controls for NPCM video driver -
1568583b3977f232e6e7a652fd4be95a11d0ecae
   media: nuvoton: Add driver for NPCM video capture and encoding
engine - 46c15a4ff1f4fe078c5b250fb2570020211eab38

Dan Carpenter
   media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug -
5f9fcbf92da901495f2f8b09d2f6df5c2ca83dc5
Geert Uytterhoeven
   media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM -
3e238417254bfdcc23fe207780b59cbb08656762

Tomer Maimon
   dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller -
4436673a4fe1e83520589f4f05235a510f82f637
   mmc: sdhci-npcm: Add NPCM SDHCI driver -
0ebebb21c48408bfa96a6fb18aa1a5bb543e2312

   dt-bindings: usb: ci-hdrc-usb2: add npcm750 and npcm845 compatible
- ceae398f15b32ebce8db73c15f2603c3b72eca32
   usb: chipidea: Add support for NPCM -
70f13579c2f75d869fb989f458fc9937b43c3198
   usb: chipidea: add CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag -
2978cc1f285390c1bd4d9bfc665747adc6e4b19c

   dt-bindings: hwmon: npcm: Add npcm845 compatible string -
e56a5e3dfd149573e6134b7eb373d56bc81bd0de
   hwmon: (npcm750-pwm-fan) Add NPCM8xx support -
0814b07876b4f8752e0d5bd8e15e07426385f35f (found at hwmon-next,
https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging/+/0814b07876b4f8752e0d5bd8e15e07426385f35f)

Best regards,

Tomer

On Wed, 6 Dec 2023 at 09:54, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Will send SHAs of upstream drivers in kernel 6.7
>
> Thanks,
>
> Tomer
>
> On Wed, 6 Dec 2023 at 09:46, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 6 Dec 2023 at 18:13, Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > Hi Joel,
> > >
> > > Thanks for supporting kernel 6.6
> > >
> > > Could you add the following NPCM drivers to kernel 6.6.
> > >    support Nuvoton NPCM Video Capture/Encode Engine
> > >    Add Nuvoton NPCM SGPIO feature
> > >    MMC: add NPCM SDHCI driver support
> > >    hwmon: npcm: add Arbel NPCM8XX support
> > >    usb: ChipIdea: add Nuvoton NPCM UDC support
> >
> > If you can send SHAs for the upstream commits, we can cherry pick them.
> >
> > If they're not upstream, but someone is actively working on them, then
> > please post the lore links and we can look at them.
> >
> > Cheers,
> >
> > Joel
