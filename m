Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2344532039
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 03:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6brG5Vwmz306l
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 11:16:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V9WvkSLF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V9WvkSLF; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6bqt6kMkz2yp0
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 11:16:09 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id e4so18627824ljb.13
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 18:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xfZDqs28oyhSqhq27xEhsDuOI5suqfnf7ndJ0VongrY=;
 b=V9WvkSLF3IrBDVZuHj1fncXQbS4UZP8Bl4vGoQ4cP40GscD6acASvvt3KvV3y2kJbT
 YRvKI1ek80h6KhZw+b+gzPB6B8GXVuEoXFrqSifxHKEspJKZw7sxwx4Gzoji8uY0Df0M
 bOvd2jeiBvUM5bbTVTV8eZM2lk/AsAhU/EGkgD3Wh7WUffY6jyjRizHUgtPxZlDyGtsE
 RiTWo0/o9HaUPCnfFmONEty2uj/HVqALZZwQfzAH1xSY6o44XeVndcsckzs1j7iIbytz
 4H4DyEiZYzHZCud6z92NKr0NeOT3ij5at8mzNzN6v8DFQ+ZGtsBS69occFDvNVFcII5r
 hZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xfZDqs28oyhSqhq27xEhsDuOI5suqfnf7ndJ0VongrY=;
 b=uZes8wI9W199FWIyqSp/qA0PBCdxcdDrOhvekcEl+oe48Oo2yCfdpvMgH6GCHfLi6E
 co1fA198rNUq1w+h+u27Z3RDy/lEizi3Hy2eJazlB1h5XucsTrEn2cEDtJbTTtp4f83M
 Ya4VRbNfPtoTEQSUV6/E+v6A//Tfdo8f4qpyg/Ss3LBdVv1Ty4dKbXxFG7PCmF6BzZ/Z
 99s9GvuZhjVz6gQvO0aG0g5PcU5Yo6RbDYBq17wmbF2WdsjPoczCq9AlFzMdAKvs1BUN
 ArvSDahptyKSb8oaAYsdFgQJ95M9BQRU7OLeOeGx662Ck6L2N49zOplS8fhhhzSQJlev
 Yd8Q==
X-Gm-Message-State: AOAM532212Lv1v26uV0r7irgfg5jE2BxmWR0Uj3r3Jg3I/2x2eVoXQiP
 ShHLZ8hJwPlIiGMoXRWEvl3mMs4EOT3LYPIUgWg=
X-Google-Smtp-Source: ABdhPJyMUAWa9cyvBzye0KjjHaKA88ye8dYHy9GbuVdYLtpagId1ddjvvlKbtYqmSMfU8sIThkAM9ZCbSrzqE3dTMAc=
X-Received: by 2002:a2e:a602:0:b0:253:d7e2:4d8a with SMTP id
 v2-20020a2ea602000000b00253d7e24d8amr12468397ljp.284.1653354961223; Mon, 23
 May 2022 18:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-2-ctcchien@nuvoton.com>
 <YoUwe6Tj4Uh6ukc8@zn.tnic>
 <CAHpyw9fjThEP4NuU08aNJ_raHpq9-j9KgBb8YuZ_shXTjhm3JA@mail.gmail.com>
 <YoYPGWreQuF9QZzc@zn.tnic>
 <CAHpyw9es-n+bW9SsGBmmr3ghBFk8Q8E6ZTbE42BpU-6p8LfHtw@mail.gmail.com>
 <YoeE8cBhUkF3K44/@zn.tnic>
 <CAHpyw9fAfNf8j++JtLhuudSWj6N1-KAxA_fxEGL998WNVXTPdQ@mail.gmail.com>
 <YotVJ+ExcrQshM4A@zn.tnic>
In-Reply-To: <YotVJ+ExcrQshM4A@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Tue, 24 May 2022 09:15:50 +0800
Message-ID: <CAHpyw9eALo=39N15omAFLA28LySBfPom7ejCfOgW9aS5gTa3Lg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
To: Borislav Petkov <bp@alien8.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

thanks for your help.

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8823=E6=97=A5=
 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, May 23, 2022 at 05:06:07PM +0800, Medad Young wrote:
> > I did do "git commit --amend",
> > I beleve the issue is about the mail server I used,
> > I use gmail to send the mail due to the mail server of my company
> > does't support smtp
> > so now I should sign the commit with my gmail account.
>
> No, you should supply --author too - I had forgotten about that.
>
> commit 0876b99e4aa2bf7113070c9c0f5d0ade7ad91697 (HEAD -> refs/heads/test)
> Author: Medad CChien <medadyoung@gmail.com>
> Date:   Tue May 10 11:10:54 2022 +0800
>
>     ARM: dts: nuvoton: Add memory controller node
>
>     ECC must be configured in the BootBlock header.
>     Then, you can read error counts via the EDAC kernel framework.
>
>     Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>
> $  git commit --amend --author=3D"Medad CChien <ctcchien@nuvoton.com>"
> [test 5d6cd85171d1] ARM: dts: nuvoton: Add memory controller node
>  Author: Medad CChien <ctcchien@nuvoton.com>
>  Date: Tue May 10 11:10:54 2022 +0800
>  1 file changed, 7 insertions(+)
> $ git log -p -1
> commit 5d6cd85171d14e67840e672e2f96a16981243424 (HEAD -> refs/heads/test)
> Author: Medad CChien <ctcchien@nuvoton.com>
> Date:   Tue May 10 11:10:54 2022 +0800
>
>     ARM: dts: nuvoton: Add memory controller node
>
>     ECC must be configured in the BootBlock header.
>     Then, you can read error counts via the EDAC kernel framework.
>
>     Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>
> $ git format-patch -1 -o /tmp/
> /tmp/0001-ARM-dts-nuvoton-Add-memory-controller-node.patch
>
> $ head /tmp/0001-ARM-dts-nuvoton-Add-memory-controller-node.patch
> From 5d6cd85171d14e67840e672e2f96a16981243424 Mon Sep 17 00:00:00 2001
> From: Medad CChien <ctcchien@nuvoton.com>
>                     ^^^^^^^^^^^^^^^^^^^^^^
>
>
> Don't hesitate to look at the manpages if a tool doesn't do what you
> expect it to do.

OK, I will try to supply --author with my original mail server

>
> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

B.R.
Medad
