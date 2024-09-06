Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46296E7AD
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 04:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0KmK5KDzz3cG8
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 12:24:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725589438;
	cv=none; b=SW4sRrLvZMoKUvqBQL5h7xVp44btrhvR7lRo/KOX+E4jQtI9XtEKj4GedpWmuA82A3fB/ERA8/qPq+dieZbuNmvVNaKJyknUrc2Ltt2OJeGkcQkMMep4VrdNuItpGotAz1e55D1QOXe0bLaGYUMgqyjewBQ75714tAiG28LQEIUE0H0PavE6cui7BxG/Ml66yhGN9i/z7dSp6ZKegW1bRUnoIJCjoib27lkOIT5xRs+v/bsAdu7V1hA9I5bahkYu50AM+1snjdlJnJ8apsiCq2Iv+60OYdFymrou5cXvbiZflUsZTBJgy1TFDj4Za/l/PMYsGGMvEj9O4Nh71GnxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725589438; c=relaxed/relaxed;
	bh=iLb7K/Z46+wQFZAmVlcCZBJn2OoyK6hgoxj9ExHMDJ4=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=Ncy7smtvaSn030aN48wlXD77ccHaKjZde1+5qjzDfbnPq7SaGiHMd5jHH1HvqDxIqp2g7KEZnUgjBJ2WY1P9U7rFyevvczH/OMLs9yPPC16ivgSMxI8pIB89p7zLyRyklKmT5+9/NBf62RaHL6rjiO4A3gimofEl9mCwKrHB+DL9aQUUHjdvoPrzfhSfpVgoetHM0bGa184eRDutd1FED/8cRXM/s8a3IopeM/5kH4dkndKnKfSlc9jsS4vvW3LidjYamdRwTmCv92oPL16YTKQARQuePOGWntKoiB707Ulqtvr6OvHfrcTedp0Qo5/CxSE4UAPQE61Ey587BYe1lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0HfeDHK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0HfeDHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0KmF67hSz2y6G
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 12:23:57 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a89c8db505bso223717266b.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2024 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589433; x=1726194233; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLb7K/Z46+wQFZAmVlcCZBJn2OoyK6hgoxj9ExHMDJ4=;
        b=W0HfeDHKrQPHRc0BVkuevlGKmB2PJDID18dSrIUZtqBft33vJNfy/hT8MsfcmgCln1
         CWgydy+MqM3UIpyhe8fqZ+xoEln5+K+TLIRlf6WylWXWV/cZFcQ/tSctiIy+hjQEwW1V
         1HEtiHaQRhjzsl0UXgy7zZi9I/OYtVi+Snl41kxhhZaBM01k/VI3nF6f/zpuBqITzGiN
         cc+YVMgDN9quXUKf2z8FhksFYwmdPAlDxaojtOAHIsumTqkcba+Y3oLNbl34i23bTT/i
         mYdUDRfliQEwc9Tay3heE16IkbNAoFt+tCMgcvmVmd30JtdC5oJRPy+2g5iL6Q2Q0Hf5
         2ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589433; x=1726194233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLb7K/Z46+wQFZAmVlcCZBJn2OoyK6hgoxj9ExHMDJ4=;
        b=XNpkwakUHWTvgmRQ2n4se4G5lk232/bKAzHvVJxLvs+CUD5L3drU8zHz4klw/Vxr1z
         pXx0nD3GPpLOzlQ+NHYUAV4aTSZRJlAcqEm6HiJRrlApBK8yy/nVBg0j72nBZqcT8U/k
         ek9jTKRmMZf71i9G5h7D8btMvW2AoyNp+Y/EEgBHOTy998oE59jjxzJFOnzUDPolGinQ
         frzjkSCN2IQ3KyvWMSfiVpL1qmfFR00c6V8hpBqzmWVaaQVTKpgROmHF191UYOS55Iio
         KrQjAP3VHlwLWvs7odpZLNoGAmXFnDv3HKjWXVEW7sYedJcq7Qb+Kurifwkn823tSuch
         ecKw==
X-Forwarded-Encrypted: i=1; AJvYcCUFMlflUgjLXgz+F0mki158PWmPQhg5q0PCul1r03hnpyTz9NtaX3IrInNCcg8I8NDWpjIFe8Gq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMjUZUDVEcr2ymzloPGrFa+o0KQSLjrjCfNFX7M0leL0xMVCHV
	uCZDANs25qwKcKg8lAlMIBWDetpjRztNTeb8btkt1d4mh8Y7nB9MnYjSS/JCrkLTbGNDGZTHyD8
	h35V06o6M9GPBatEpnlgZIp6krQ==
X-Google-Smtp-Source: AGHT+IEz4qumqBA7rHtuJUKgviy7OhOPrHFCtAJGL+HmLaYfeAbK7PKJnnT4HA4aSriqVYckU6uLGuQmRga35ZLkKAM=
X-Received: by 2002:a17:906:478d:b0:a86:af28:fc2b with SMTP id
 a640c23a62f3a-a8a888ec65fmr86820066b.54.1725589432384; Thu, 05 Sep 2024
 19:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
In-Reply-To: <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 10:23:40 +0800
Message-ID: <CACD3sJbAYwiXrapgBDrtwNfVLr-109zExMrktunui6HKxtO-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your review.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
>
> please remember that the "slave" term has been replaced by the
> "target" term. I will change it when applying the patch.
>

Thank you for your reminder. I'll change the term ever since.

> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
>
> I don't think the Fixes tag is necessary here. This change is
> primarily addressing a static analyzer warning. While some cases
> come close to a buffer overflow, it couldn=E2=80=99t have occurred in
> practice since we don't actually have the devices listed in
> npcm_i2caddr[].
>

Understood. I'll remove the Fixes tag.

> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2fe68615942e..bbcb4d6668ce 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -136,11 +136,13 @@ enum i2c_addr {
> >   * Since the addr regs are sprinkled all over the address space,
> >   * use this array to get the address or each register.
> >   */
> > -#define I2C_NUM_OWN_ADDR 2
> > +#define I2C_NUM_OWN_ADDR 10
> >  #define I2C_NUM_OWN_ADDR_SUPPORTED 2
> >
> >  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D {
> > -     NPCM_I2CADDR1, NPCM_I2CADDR2,
> > +     NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> > +     NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
> > +     NPCM_I2CADDR9, NPCM_I2CADDR10,
>
> Looks a bit hacky, but serves the purpose.
>
> The core issue in "npcm_i2c_slave_enable()" is the lack of an
> upper boundary check, which could potentially lead to a buffer
> overflow. In practice, we rely on the assumption that these
> addresses don=E2=80=99t exist in the real world.
>
> An easier fix could have been:
>
> @@ -629,7 +629,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus=
, enum i2c_addr addr_type,
>         if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0)
>                 dev_err(bus->dev, "try to enable more than 2 SA not suppo=
rted\n");
>
> -       if (addr_type >=3D I2C_ARP_ADDR)
> +       if (addr_type > I2C_SLAVE_ADDR2)
>                 return -EFAULT;
>
>         /* Set and enable the address */
>
> But yours is a bit more robust, so that I'm going to take this
> patch.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Thanks,
> Andi
>
> >  };
> >  #endif
> >
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone
