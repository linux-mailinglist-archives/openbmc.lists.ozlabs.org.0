Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40499987CD3
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 04:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFDKZ4wVlz3cQH
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2024 12:04:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727402639;
	cv=none; b=hqRrYiyTolauXZy/jJB3kaVI/Wqn7SLBQ3oRX5o9u3gZiDE5SLTYPqkQ+0mgJ+1czaGMmZTiG3nplMczfZKKmKqAK1lOZvA5esLEtB1cgPvgvIHPzDu/VPTFmmTA7bg9FJkq1HED1Ur2jchsWxmIvoXACTMjK7C5Xr97fR2rRJCO83V7oPXA+YAcRyXGUUQpGxYytAMmr2A3KdDSPW+THpke/XzoYxwDIsAnKOpWSItqX00mz0McTlglg9XOVMGhSItS16UcQfxj98tuwzie/5JjOW9f2Qgnr38r2IvOF1ZImNtErotmX7rxsx406bbAMmIOPyt0RGxUJkPmEvuoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727402639; c=relaxed/relaxed;
	bh=+Jh6r0BOOneL+0+uXM+raqfA4bRD3EJOioSx3dRRd20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L987OnWP2fZX6YsOGq9y0KNZY/L/wcjpq7pO2jlVWol9IViQkUzjceIdQcV5rE0jWmXQXPaJrq0JsRVrTKTrGVotKgdyOfWfunQD53ujPs2cq/wVCKOgS0PRuCCPl6uBiFxuLK7kWPzIfovkfGbwen2NSdOzO7XargaMLq8sGGotFCm0FfmGo5ooRA/W2wyglagMYtbHrdp5hsLVeoFkTq+lc12qwiD7//4pAkLyhQgO5w5FLGdqsN/8Q4DLFIeQEq3JsSRfKKiR6JXD7gZzeXjAe4iMEL9ekMICTjguHL5wqid3fFK6E0NhkAQefJ4UXyO4luZMJ+9artuaGiEKLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OrzEpkZb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OrzEpkZb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFDKW07kGz2yl1
	for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2024 12:03:58 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-82cd872755dso74922339f.1
        for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 19:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402636; x=1728007436; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jh6r0BOOneL+0+uXM+raqfA4bRD3EJOioSx3dRRd20=;
        b=OrzEpkZbU9W2dFC3mJUGCkq1pNZTj+hS605mkjECoZ1nlh1bdQr2f/33CsHHtvQlEo
         4qfnRe/tZDVt6iqr1wzbgWlNDDB/vWVDm/Nii2I8kpZ4InNYRLVMygshfdZXPfGc1Ndy
         1VeMgL8g+WgiDAvKdRZoqELpqShq6D3/uoA3qtlyeCZ0xbx0A+aSOGQ3moZGmjio8ynx
         cnN4fooDWxKWDg0B1tWc4cPNZk0NfcBztz05ZlQai0R8+fDBgvAh3a6YnW9N9qmD4Yr8
         qJ3w8AzTzIe0GCD1+YqbzayWJ2ddodCxeuUOk0ft3CST4E9pRJlur2ISIuipQrd0ukRl
         +bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402636; x=1728007436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jh6r0BOOneL+0+uXM+raqfA4bRD3EJOioSx3dRRd20=;
        b=TcLxPZhjW4lixsA0vdQg5iz+NR8pKJ7VPbdybDJmd/WUkP+oTxU9in2Eu/XrmQ2tp2
         JgCiQk2ncio2/ZIEKlasEHm6S4KrsregQFgGDWg3Zk5pKK6sC1I4CRMV4WcqueK5Nq2N
         k7Vjn5PVxXMnjXnUzyhUA6ze0Md1XqUed74qw1W4sVxaluxKC+dNhjzuA5qruidNdD8x
         8BolwF+CyJbXZU8ZGVYppzvxKaiqhO6r5d+/gWhu9BclvT1FmwG3XbiN/Mq1HahlyTBm
         ea0XBCLDeDWn5Z9A6uP3O4AggSM18t1DsLo27p1xjqfM8cA2AE+XHobh2D2wYhgiUOJK
         y1qw==
X-Forwarded-Encrypted: i=1; AJvYcCXxKGUAQk868URDSK9Dn7YPMux0GUNREdzkT0W8RjSi/9kYEOD3fJAdnREkufbXlgmdU/WoMl4m@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu6LQ9K/893IBSga7u4ivbXtZ804stofCJG4qZneQHnxsjuiIy
	wsJ0DShbdb26qHtCJs50hjvdHfOfSRifA9ddXgKeTkyI3DmR4Wvh8R3PXm3I2Txamto6e22Ko5e
	F34dM2EJoX/f96SYTMTFSqhWxrg==
X-Google-Smtp-Source: AGHT+IFU/HiFTzaHHaNmdW5DFz3sLC3XjW0Ap8eMqLs0Mmx/9EAtSI7Jx44H3OOpWGoXkIL0krrAP/BNe96Mye39TWw=
X-Received: by 2002:a05:6602:2c92:b0:82a:a403:f0df with SMTP id
 ca18e2360f4ac-8349318bdadmr162621939f.2.1727402635762; Thu, 26 Sep 2024
 19:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-4-kfting@nuvoton.com>
 <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
In-Reply-To: <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 10:03:42 +0800
Message-ID: <CACD3sJZ8zSSO9kE30qAAYFf-qw+LQ3RRUbPgqnWO_BsxFV2fOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
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

Thank you for your feedback.

Your comments will be addressed.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2d034503d8bc..68f3d47323ab 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adap=
ter *adap, struct i2c_msg *msgs,
> >               }
> >       }
> >
> > -     /*
> > -      * Adaptive TimeOut: estimated time in usec + 100% margin:
> > -      * 2: double the timeout for clock stretching case
> > -      * 9: bits per transaction (including the ack/nack)
> > -      */
> > -     timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nr=
ead + nwrite);
> > -     timeout =3D max_t(unsigned long, bus->adap.timeout, usecs_to_jiff=
ies(timeout_usec));
> >       if (nwrite >=3D 32 * 1024 || nread >=3D 32 * 1024) {
> >               dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >               return -EINVAL;
> >       }
> >
> > -     time_left =3D jiffies + timeout + 1;
> > +     time_left =3D jiffies + bus->adap.timeout / bus->adap.retries + 1=
;
> >       do {
> >               /*
> >                * we must clear slave address immediately when the bus i=
s not
> > @@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >       if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
> >                                      write_data, read_data, read_PEC,
> >                                      read_block)) {
> > +             /*
> > +              * Adaptive TimeOut: estimated time in usec + 100% margin=
:
> > +              * 2: double the timeout for clock stretching case
> > +              * 9: bits per transaction (including the ack/nack)
> > +              */
> > +             timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) *=
 (2 + nread + nwrite);
> > +             timeout =3D max_t(unsigned long, bus->adap.timeout / bus-=
>adap.retries,
> > +                             usecs_to_jiffies(timeout_usec));
> >               time_left =3D wait_for_completion_timeout(&bus->cmd_compl=
ete,
> >                                                       timeout);
> >
> > @@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       adap =3D &bus->adap;
> >       adap->owner =3D THIS_MODULE;
> >       adap->retries =3D 3;
> > -     adap->timeout =3D msecs_to_jiffies(35);
> > +     adap->timeout =3D 2 * HZ;
>
> Same here, I need some good description of why timeout is set to
> 2 seconds. If the datasheet says 35ms, I do not exclude that
> someone in the future will send a patch saying "we don't need to
> wait 2 seconds, wait 35ms as per datasheet".
>
> Thanks,
> Andi
>
> >       adap->algo =3D &npcm_i2c_algo;
> >       adap->quirks =3D &npcm_i2c_quirks;
> >       adap->algo_data =3D bus;
> > --
> > 2.34.1
> >

Have a nice day.

Regards,
Tyrone
