Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F38021A0
	for <lists+openbmc@lfdr.de>; Sun,  3 Dec 2023 09:12:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7rlUnMR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjffG4VZ3z3cWB
	for <lists+openbmc@lfdr.de>; Sun,  3 Dec 2023 19:12:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7rlUnMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sjfdf4X05z3bWQ
	for <openbmc@lists.ozlabs.org>; Sun,  3 Dec 2023 19:11:32 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7c5634d3189so1625635241.0
        for <openbmc@lists.ozlabs.org>; Sun, 03 Dec 2023 00:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701591089; x=1702195889; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTVJVIDBZaj5fzzMVjd2zG2bVjzxreayrJVae6FjjUs=;
        b=F7rlUnMRiBzmvhsSsn3cv3OSTx750bH4XRuLRUp/ppxolLuwMB1R9kIUPGkMVviAOT
         3wOtYugDsGBUSTDuddkELwSIZEMlNA3FXx6zi2/5g83FnQs1wsawQlG79YlU8KDSRQuP
         YqNxpUB3DphGxMc0Jw94LV1QKeQUK5REXpgW/SLS+/+dWbyeN3z/ZcfDwmgu0jJgBosW
         7It59EEm16dF87VPSs43obZU7lB43B3naIkFdK3Ci7Aw/1m9IoJp9uHqjq/TzxXCYOra
         83/+b5Mcpp/6wY2xBHLhrRxAxmNIsDV1/cGGOGXFk1iU4rOwhrSGkHNzQSC6WxroPzrw
         RhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701591089; x=1702195889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTVJVIDBZaj5fzzMVjd2zG2bVjzxreayrJVae6FjjUs=;
        b=KtBNrfrDYAG6nnB3GOMCeNu5259o0F/x6cuRvCG3PW2ycGkfRWIteGZa+O6SBP9Ae1
         5WRdyeGShXbShV7r/+DFao8lGoeDB05/yNucQF6cvENYhnERsQYQ7xMsIhqT6aOHQXqb
         Gzx4q2CCD6K4rFFG8p7zxLklJZSxOxW1NmZDleMmAd2sCCbneh/f2bH4e5i5if2zDsPf
         eTs8Zjq4vydm7iQmaHao0io307YTLGN2Gk1EBykCALrib9OgrgSqa8tCm42vwwLKH5cl
         F6Mo4+1Qymoe+wBBeMVAuKBzTJmzaTyfbjW++tETwHfxoVy9lPAdwFxH2EbNPbx8s8u9
         ln7A==
X-Gm-Message-State: AOJu0YyA5QHr3zZ9B7uvpOgkwW3TJcSNFQgYHFzli3BX+xRgAc2UXzIu
	zLwf9tESnzgz+LCF8UiuF7Emrvd7+RSptvfVrppl2egxHns=
X-Google-Smtp-Source: AGHT+IHcEsvhAqzzte4Z0+Bz3jNOY3S3+INoFR0W03gvySiM3WRw+Id8CGrsKCAdKWXtpofj72CzGEYimkoSDnUwFiI=
X-Received: by 2002:a81:99d3:0:b0:5d3:a63b:88f7 with SMTP id
 q202-20020a8199d3000000b005d3a63b88f7mr1157215ywg.25.1701590617445; Sun, 03
 Dec 2023 00:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20231102002453.1299195-1-william@wkennington.com>
 <20231102101009.15104-1-william@wkennington.com> <CAD_4BXgmCdc_H-XfmGnW3fa6H=cbONma6QzUiofNVZWJtcBwOg@mail.gmail.com>
In-Reply-To: <CAD_4BXgmCdc_H-XfmGnW3fa6H=cbONma6QzUiofNVZWJtcBwOg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 3 Dec 2023 10:03:26 +0200
Message-ID: <CAP6Zq1gG8d8AEPQZ0izrYdY66fxE3ec57jFDzBK5q6Zrji74qA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: npcm: Add CPU hotplug callbacks for kexec support
To: William Kennington <william@wkennington.com>
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
Cc: Brian Ma <chma0@nuvoton.com>, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,

On Sat, 2 Dec 2023 at 01:51, William Kennington <william@wkennington.com> w=
rote:
>
> On Thu, Nov 2, 2023 at 3:10=E2=80=AFAM William A. Kennington III
> <william@wkennington.com> wrote:
> >
> > From: Brian Ma <chma0@nuvoton.com>
> >
> > Add callbacks required for kexec to function. The NPCM7xx does
> > not expose controls for powering down CPU cores, so just wait in idle
> > loop.
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
> >'
>
> Mind taking another look? This should be updated accordingly.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

Best regards,

Tomer
