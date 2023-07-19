Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3D7594F3
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 14:18:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=VN2la+gd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zbr45lnz30XP
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 22:18:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=VN2la+gd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5ZbD5TRxz2yD6
	for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2023 22:17:58 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-56341268f2fso1001008a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2023 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689769071; x=1692361071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuhhXkXir4voS8gRIBtJkYV+Q76WiKVmML4Bwp3OVzQ=;
        b=VN2la+gdY313z4WUzC82DsEJ9wBoMtyeSH2mhElyVbBo60S9VhRCReD8xRqJ2TyZep
         9PSHM5RabSrfqqtLK1j+qo0SUgqzNWXnOh2CzXAAaMmHRLITmRSs+UQRtiM2c6PHYVRW
         6w0ov4Nq/0dSbye8Vy15WC7tGCC5/Uve8phR1P7NNnsvCwudh7VwOXsylHO+lJ5zR8lq
         HU9CYeG4l9WYAzrwQnH/FCUgOdD4YNdMThnVhDJChXObDPV13o1hPc4HFrZeBnMIm7gj
         FR/vITBKH4zYz2q+N+5d7ApM583VJk8ZCJD/l2yHUnsFx3Tgi5x/9+8ch2nz7IdrdUie
         jQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689769071; x=1692361071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuhhXkXir4voS8gRIBtJkYV+Q76WiKVmML4Bwp3OVzQ=;
        b=R4ARzKbTa1Pr9xH4G5YlzMhVCIxniyHgVl2jVeyhYHlXxiGepYYnv90/g5BrzEqN5/
         jfE91XMcRu+9ycsC59l4C+e1s1K/QFnllOzz4uY8x1bwv7TwzEytc7XB+uSRvZBhy5QW
         AjypjsF4ARbkCO7YStnsJdOorU4z5HPMq3SamET24pzwb+ESJEMtBDiGq1MGmoTHcT0o
         YJy8Gh9QwgtbKRr+aMDfhySVFaUyaXLh+IkzUfuh45jG3Re8cwtaiUptKIwoJHiMdykt
         kV8/o+Y6yprWKYpNgj263kWRkHRPLPhBDxRqEagSeY0x9ZkafkZ2dXyicUaeZRf9lCsn
         FiKA==
X-Gm-Message-State: ABy/qLbUMdi4wio9kNK+HZJJ2FP/v14Za2b52ZB6BIMSLwMec/RCbOEp
	7ToUL4ayCIbLy3w1qOjf1adOTpchMQDpx3j8INLnMQ==
X-Google-Smtp-Source: APBJJlHFeWc9QGjqVC7qDUf6qbm4HxW11xlzgnjByON1Pmpylvr7wULvgzZw0+ykoLhMoB/wrY6jgYsktx9m7ChZRwM=
X-Received: by 2002:a17:90b:108e:b0:264:929:ed96 with SMTP id
 gj14-20020a17090b108e00b002640929ed96mr1664814pjb.9.1689769070641; Wed, 19
 Jul 2023 05:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230712091241.3668454-1-Naresh.Solanki@9elements.com> <c1988d23-c19c-0ec0-9f61-01cbb00ead3a@molgen.mpg.de>
In-Reply-To: <c1988d23-c19c-0ec0-9f61-01cbb00ead3a@molgen.mpg.de>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 19 Jul 2023 17:47:41 +0530
Message-ID: <CABqG17i9T5e7Foy7L1D=OdPo8uHfQ2xfvEPmxLB6hQY42Yq3Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] peci: cpu: Add Intel Sapphire Rapids support
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, iwona.winiarska@intel.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Patrick Rudolph <patrick.rudolph@9elements.com>, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Wed, 19 Jul 2023 at 16:50, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Naresh,
>
>
> Thank you for the patch.
>
> Am 12.07.23 um 11:12 schrieb Naresh Solanki:
> > Add support for detection of Intel Sapphire Rapids processor based on
> > CPU family & model.
> >
> > Sapphire Rapids Xeon processors with the family set to 6 and the
> > model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> > is "spr".
>
> Please add, how you tested this.
Yeah, sure. Missed adding that. Will update the same in next revision.
>
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> > Changes in V2:
> > - Refactored from previous patchset as seperate patch based on subsyste=
m.
> > ---
> >   drivers/peci/cpu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> > index de4a7b3e5966..3668a908d259 100644
> > --- a/drivers/peci/cpu.c
> > +++ b/drivers/peci/cpu.c
> > @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device=
_ids[] =3D {
> >               .model  =3D INTEL_FAM6_ICELAKE_X,
> >               .data   =3D "icx",
> >       },
> > +     { /* Sapphire Rapids Xeon */
> > +             .family =3D 6,
> > +             .model  =3D INTEL_FAM6_SAPPHIRERAPIDS_X,
> > +             .data   =3D "spr",
> > +     },
> >       { /* Icelake Xeon D */
> >               .family =3D 6,
> >               .model  =3D INTEL_FAM6_ICELAKE_D,
>
> It looks like it=E2=80=99s incorrectly sorted, probably due to merge conf=
lict
> resolution?
Will move it to after Xeon D in next revision.

Thanks,
Naresh
>
>
> Kind regards,
>
> Paul
