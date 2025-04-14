Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE29A87527
	for <lists+openbmc@lfdr.de>; Mon, 14 Apr 2025 03:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbTdY54cxz3cNP
	for <lists+openbmc@lfdr.de>; Mon, 14 Apr 2025 11:06:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744589292;
	cv=none; b=QBd7Q04X5Cn9OfKj3EWRsOM7KxbsAa6JC3XP+um4CGH9uD6p62sbVVilvz31WIyEbGyGbBtqaP86L20ZkudS6pioglJ9H/ZoiEVCgqw1EzJuI9t4+MRIqouBNxZ/qSZeqJDjqQbMbr0qtzMuPTyZ+2Uns4cca7zwUxl2UotpE0J1IBHfpsqamhmjMkfvmzwVk2RGNM+m0X7b75tGrKgQ5SFmeG9YpFPwy1co0JikFpUGnmyLWjyedMj1HM15lGyxnx1BPUFXRugRBjVFNKWI0Vtu/7pxqRI3PEDYqFyRFJgYDFGFOcXtNF0WdgVEsgMJxi+/pJmxy7VqJT7FqNPHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744589292; c=relaxed/relaxed;
	bh=rreFZDTz2uBZn6ChgxZqj3cVrha2t3QZe1eg5gMrOew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPSAbOw4+Bf7FIdyyFQmaOjoxdIsSm5CkR1p9SHMhBAH1/2/XJp5SLAKVDVr+6rtRljIAeJWG6EjfUqxv1W6JPv4FB8wx8rDXKBT9Jql9xN8ibsD3UfaRk6FMUExaJ3XI4lCq+lky35BRRwgb4JAS7nTUzc28Bg9dLMnP3b+wEta0VtC2Z0Euip8M9Kv5bSXp/Rz9kpggUgQE91ltnnQpmUuO+OOVJl7qMIZNFW+DH8yLzDfRo1jbBvdLre4G/xKmuPkEdbKFj5OLmPkDGy6WTlXtKgubpxggBpA4+lZFdWREmdRl1C49yFrUxhgPeSkLvnhOS5WJpgZslARiW2TLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fhr/VDNL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fhr/VDNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbSL23Ryfz2yHj
	for <openbmc@lists.ozlabs.org>; Mon, 14 Apr 2025 10:08:09 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so40594666d6.1
        for <openbmc@lists.ozlabs.org>; Sun, 13 Apr 2025 17:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744589286; x=1745194086; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rreFZDTz2uBZn6ChgxZqj3cVrha2t3QZe1eg5gMrOew=;
        b=fhr/VDNLhcVmnT3jhBfK1P/2jatAawWvhellmCuixG1FGog1F5sPht0tvkzlOPaUxi
         5WzRobCawKKVu7IKiCPc3ROyrJbZls6czX0/fTRJ53wehOxpRncogOSk1nSo/5NMmYyJ
         7D4nn7EBxi2ENCCon8cvZniEnydBJ5j487xurZky212uRaZ8CjdbO/+SlSsd6y6unsKN
         V3nvZyknkz2BH6vncyDIZEfP6l59F0q1/LQOIVnlWZivYo9B/npgsq5PY9rKYRm0Id9U
         P6O9uTwssZx5cabqsmAq+N6S8sx+EtAKdclCB16iLq19b0PnAtmen9DWOEUF7gEwVLI7
         B8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744589286; x=1745194086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rreFZDTz2uBZn6ChgxZqj3cVrha2t3QZe1eg5gMrOew=;
        b=eaZOEZxRggjBWAvJWF3fNyZxpT5VU8PAJAmEmO1Ha3POrE1UFRKivS7ppEz4FzS2eM
         amTC8rNs1vY94G+YEmrr2gJMF6nniTCRds7fY8nX5593iRfnEYtVIL6Ud2I3whPujfoe
         CmnEDVKTEpXyIM0FQ5tVT5nKklAxhRBWFysBi84yT9Cy+lKVjEsNYcQR69dyzKNMdGtP
         E9QvdzePAYzHRLyoAWjyFH0wgeJhOXxr9/yDLQ00SZB2zsf4X8eaR+ezl2qactKSMz0i
         nKpL6VE4BfSU3bbF2YKZNopp31tz/g5vBO2qVjqM3T9cG5jshwdzsV1Xn01Ol/VUHj/T
         HhFg==
X-Forwarded-Encrypted: i=1; AJvYcCU9MfwbvPCcItLgnzCW93dQt8QqwCjtL9abe64HX0ilyFjXztRVwgaLGPW7YjouL3lNlcjCF9z2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpIQjf5iw23BSsKy6DoEeaW3cDeZ0IU3APrFMDVN4TNyxLY5v/
	JhtYJtpeA7HPvXJXdVEWvwrYMOqtsamqZCdAqj4NWNHaNzLoajT8oTzksqZ4Udyy5Ne32i1SS+c
	9zQCUaNzORnDYwXkCC5YMtvehe+Q=
X-Gm-Gg: ASbGncuM+gitXHqiRBP5FmcG2RNdqOAiPnJJBheSG5iqk9QDtr48d82uToq55ZbEP+E
	vcGh8RinsXA/oEZLYLK2RQlUli6XXbaBey57oMTDe+29NU5uGeBT/pjnOl7qmiGPt62fbMgjqfS
	vs33Yrl/+ofnCqf2SBtmLvgEmB64FPJws=
X-Google-Smtp-Source: AGHT+IFqMErkq/Yib4S882Q+l8wRVUIb3fb4K3HsLkmozQNX59ADuTQ1zrW0m4HCV4FsO/QnMwo9UG4tVKr7BoftpyA=
X-Received: by 2002:ad4:5f46:0:b0:6e6:5b8e:7604 with SMTP id
 6a1803df08f44-6f214188d12mr175624006d6.12.1744589286021; Sun, 13 Apr 2025
 17:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com> <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
In-Reply-To: <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Date: Sun, 13 Apr 2025 17:07:55 -0700
X-Gm-Features: ATxdqUHCKdMZs_LEePD-OxZDub-K8K9UCKSTdv8KH_BZ7jlSxZSZ8fITrJH2Lwg
Message-ID: <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 14 Apr 2025 11:06:39 +1000
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

On Sun, Apr 13, 2025 at 4:06=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Mohammed,
>
> On Fri, Mar 28, 2025 at 07:32:50PM +0000, mohammed.0.elbadry@gmail.com wr=
ote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > During init of the bus, the module checks that the bus is idle.
> > If one of the lines are stuck try to recover them first before failing.
> > Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> > ---
>
> we are missing the changelog here. You are at v4 and I need to
> see the changes between the versions. For now it's OK, please,
> next time don't forget to add the changelog.
I understand, I will do that, thank you.

>
> One more thing, no need to send patches as --in-reply-to your
> previous patch.
>
> >  drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2fe68615942e..caf9aa1e6319 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c=
 *bus, enum i2c_mode mode,
> >
> >       /* Check HW is OK: SDA and SCL should be high at this point. */
> >       if ((npcm_i2c_get_SDA(&bus->adap) =3D=3D 0) || (npcm_i2c_get_SCL(=
&bus->adap) =3D=3D 0)) {
> > -             dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus=
->num);
> > -             dev_err(bus->dev, "SDA=3D%d SCL=3D%d\n", npcm_i2c_get_SDA=
(&bus->adap),
> > -                     npcm_i2c_get_SCL(&bus->adap));
> > -             return -ENXIO;
> > +             dev_warn(bus->dev, " I2C%d SDA=3D%d SCL=3D%d, attempting =
to recover\n", bus->num,
>
> the space at the beginning of the line should be removed. I will
> take care of it if you won't be asked to send a new version.
>
Got it, thank you.
> > +                              npcm_i2c_get_SDA(&bus->adap), npcm_i2c_g=
et_SCL(&bus->adap));
> > +             if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> > +                     dev_err(bus->dev, "I2C%d init fail: SDA=3D%d SCL=
=3D%d\n",
> > +                             bus->num, npcm_i2c_get_SDA(&bus->adap),
> > +                             npcm_i2c_get_SCL(&bus->adap));
> > +                     return -ENXIO;
>
> why don't we return the error coming from
> npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?

The error that comes from the current driver is only -ENOTRECOVERABLE.
I do not see why we cannot return that error instead. I understand the
difference between both states; however, from the driver's
perspective, on initialization, ENXIO and ENOTRECOVERABLE behavior is
identical in that state.

ENXIO was what the driver returned by default without trying to
recover. Do you recommend changing it? Let me know. I am happy to send
the v5 patch with the change and address the above comments, too.

Thank you,
Mo
>
> Thanks,
> Andi
>
> > +             }
> >       }
> >
> >       npcm_i2c_int_enable(bus, true);
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >
