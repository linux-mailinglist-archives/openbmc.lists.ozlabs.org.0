Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8BF7DEF90
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 11:13:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q/sFB9dj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLfpR4vpyz3cXJ
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 21:13:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q/sFB9dj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLfns39Tfz2xrD
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 21:12:48 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9d8d3b65a67so104975366b.2
        for <openbmc@lists.ozlabs.org>; Thu, 02 Nov 2023 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698919962; x=1699524762; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZqB9qrmysX13BT59JOVtj+fnTDElF0sFcixuSiHwSU=;
        b=Q/sFB9djsgjD4q8CE7+N/RoQMONp+Ti5WdfCfAP6Sm2P+pPX1v65/0360vMb2X26ti
         sApBr92QjpfI7vfB0ZNwiyyy90RKHbgl0COIFAGArPeqgokjb3awQpmmnYEXI1PhSygj
         v+YaSLdqhFfNFupAi+MpOZAy6t1BU/FiYQrxWNnEFQRhtcCsfWs1nYQfBNWtnc9f478a
         u8jQt9Uy+lkJKa9d+h3zGxzrxRjk1EmKgqmslDBVVfvOImkYWTCLx6CHljI9jAJpv8v7
         uSM+QvIXcfULoA/NzH5rl/x5SJiVqNWlSG/LMQxljPxug43B/Wryn+KDkwNyyqdkEj/9
         puWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698919962; x=1699524762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZqB9qrmysX13BT59JOVtj+fnTDElF0sFcixuSiHwSU=;
        b=Dwwk1445svINb0jsK3zYKVCgiWMeH2qzBoDMwZQv0efg8TwxqC3fZ8vfId1OHIgDL+
         Guqkm0olvTQjJL6CGHlD7TDxNcpsndEqu++42IEpu+nkghS8DVX8s9EwolvbqMKL/WCp
         xrFo/wKqlVPQEY1bPbqZwYCbZlMU0gti5hSYzP0GfKMxlPA7k8q1GERs2k3UISYCpkrU
         bQYwwndmQhH0JsHbjCNxcKp3sGP0daVpSz1Gta0Wn9XALweCLiiJ5Gffk4iMn079h8Oh
         dHGqKmAdtTOc+mAX807pjLQHEp97o3WmCsRoN2WZw8h6rt3Z6fwFXMkMuQlqQ4Mu7FIA
         pILw==
X-Gm-Message-State: AOJu0YxkNbQDPzzMnJmprNvuu3trKacutcBFT1fOGkBJsoVkUyPcfUmo
	auemG1mdK3fj/5UhNse+FZUjT0tnMRYzRKZAyTHMnA==
X-Google-Smtp-Source: AGHT+IEM4bA7T/We4VeeGxv2tCY3ws3IIvRo7YMxFoEuSfPYV9VuV5hrtJA0KB9Qd5PVLMJVVfX589u23zx/Dkm3DBU=
X-Received: by 2002:a17:907:36cd:b0:9be:5ab2:73c2 with SMTP id
 bj13-20020a17090736cd00b009be5ab273c2mr3861703ejc.58.1698919961848; Thu, 02
 Nov 2023 03:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231102002453.1299195-1-william@wkennington.com>
 <20231102005321.1303809-1-william@wkennington.com> <CAP6Zq1ig9hadeWATYVgzZkhmsU3qe6Se+hwU6rSjvnGr0OmvMA@mail.gmail.com>
In-Reply-To: <CAP6Zq1ig9hadeWATYVgzZkhmsU3qe6Se+hwU6rSjvnGr0OmvMA@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Thu, 2 Nov 2023 03:12:30 -0700
Message-ID: <CAPnigKn5ObA3iMAwdcw9nnvpgO3o5q8D+v=+Nv5edNWQzpkNEA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: npcm: Add CPU hotplug callbacks for kexec support
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Brian Ma <chma0@nuvoton.com>, avifishman70@gmail.com, william@wkennington.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 2, 2023 at 1:39=E2=80=AFAM Tomer Maimon <tmaimon77@gmail.com> w=
rote:
>
> Hi William,
>
>
> On Thu, 2 Nov 2023 at 02:53, <william@wkennington.com> wrote:
> >
> > From: Brian Ma <chma0@nuvoton.com>
> >
> > Add callbacks required for kexec to function. The NPCM7xx/NPCN8xx does
> > not expose controls for powering down CPU cores, so just wait in idle
> > loop.
> This patch is related only to NPCM7xx please modify NPCM7xx/NPCN8xx to NP=
CM7xx.

Fixed in v2 message.

> >
> > Signed-off-by: Brian Ma <chma0@nuvoton.com>
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  arch/arm/mach-npcm/platsmp.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.=
c
> > index 41891d3aa124..6cc7b5894f08 100644
> > --- a/arch/arm/mach-npcm/platsmp.c
> > +++ b/arch/arm/mach-npcm/platsmp.c
> > @@ -69,10 +69,27 @@ static void __init npcm7xx_smp_prepare_cpus(unsigne=
d int max_cpus)
> >
> >         iounmap(scu_base);
> >  }
> > +#ifdef CONFIG_HOTPLUG_CPU
> > +static void npcm7xx_cpu_die(unsigned int cpu)
> > +{
> > +       while (1)
> > +               cpu_do_idle();
> > +}
> > +
> > +static int npcm7xx_cpu_kill(unsigned int l_cpu)
> > +{
> > +       return 1;
> > +}
> > +#endif
> > +
> >
> >  static struct smp_operations npcm7xx_smp_ops __initdata =3D {
> >         .smp_prepare_cpus =3D npcm7xx_smp_prepare_cpus,
> >         .smp_boot_secondary =3D npcm7xx_smp_boot_secondary,
> > +#ifdef CONFIG_HOTPLUG_CPU
> > +       .cpu_die                        =3D npcm7xx_cpu_die,
> > +       .cpu_kill                       =3D npcm7xx_cpu_kill,
> > +#endif
> >  };
> >
> >  CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp=
_ops);
> > --
> > 2.42.0.820.g83a721a137-goog
> >
>
> Best regards,
>
> Tomer
