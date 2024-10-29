Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF119B44D8
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2024 09:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd3qg6vJkz3byt
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2024 19:50:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730191821;
	cv=none; b=c0VNOTgTDzQAtMB9URmXbXJVM9goDI5izjI7AKw1u7PhNhsgq7gjspwqIIOdcOwXfol4DgiHJIaalVUEEOsj5wf9ygtJ7q7ewpdD0DoptVG6JwumaiLetuJxBiHoj1aXQlVYxbZ6otlxRVC8MQw6z8oeHfQ++cyCuodoJtN06IQNPD0W0MLM/ZBsiy54vkSHx1uhFNKog51Q/xihe8y/Xh+Te/BeYjXhvAANKtDAcyPPyjN6bhEiZmo5Z9sIWKwEDJsJKHuC4b+LY1e83YLgRXFp52fdz4bLzKOBeaWOs2rWHqAoAm7dSaOXgCQbgTUb9PxD/rN23MrBZXFckVVHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730191821; c=relaxed/relaxed;
	bh=a1C7g+ecqTH571IGrF1o9PEiuGBd5idFcyM4+gP1MkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XywBMAZHRYPXKpXO4RI9QB43UFM6goShUE6NeEstFbFTsA1n7wNaQP4DR75ZLkhE7f3QeuPLTOglvAAVo38nd9qziqpWvl4cxddRq+LWbK6Hi9KT9LLLbmNUAulfhF0Mt4yF+6M0M9l1P+cw7ixzu6uewSv7E5p+g4caU3lxKmIIL1KxMcMi2jR8wNAjmEAVZj20Z3UmumVieyzUL/XE5OOZDe8eN9PT2vyu/nySZWgzRKOONdEJ8HOMOGLyhoYlJ7wz6n4VGnw6cjFzxIYDkRFWEYipJ/zGcpywVb30IKGafyY3B9NSV56lIVKQuSjYH1391z72UZW/wRakNNu5OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N9oz8BT6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N9oz8BT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd3qb4Lgrz2yD8
	for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2024 19:50:17 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so628561166b.2
        for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2024 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730191814; x=1730796614; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1C7g+ecqTH571IGrF1o9PEiuGBd5idFcyM4+gP1MkY=;
        b=N9oz8BT6BuyCA/hdVMND9ffusre8QqFXRH+nNw50fMpxbg8oClLQ2+qPLvaxdd5IO4
         VwL28N0GWEMSrF61J5psT+OYhouBJWvrnyhVLltkJYuK/OCJO3hFNzXZdoysPtSFgiTZ
         T0HkOswS7H+lySpwHVbWW4fjJ+GCGMj9U42ZOn14METRcXkUqPTn2UgStxA436/Gqres
         dNV7Z0db5a2Aj0JrlMFuDBo1yh7akW2RUQuTlbYrNWCj9lRQDC6lhKLfRgKdhUefIzPI
         NH7jiRU6t6D8PkeKbdNYnFK+yanm7Fz1akq/IlTvDa03P6KkW9fYkS7vhl+ESYAXPJ7e
         qazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191814; x=1730796614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1C7g+ecqTH571IGrF1o9PEiuGBd5idFcyM4+gP1MkY=;
        b=bw+B/OGBEb6irb6TbTesw45/zYFNobenVO4WTfi604H0XCB0/VNWVIKZOPXTHSnpcv
         i2i6RKz4FyKnQvggh95RJgRp/Rwew3mvoRgE1LxWZnkufJ1n9VWAJDOStR+ffZijvwUA
         gaepi2ZHEs7o1jK3/YSa2qrJRpTfqHlqGoCA6cSgaMwGBo0ENQGIbVXMlxNZ604/R8Pg
         XzWenqQM6xSXUoJqUKkJq4WP728K9CszxqTug9AN2gN+90ntB03hqCIoSWz98iRBFB40
         GA0lXUcIfEY2XDpiOtEbn/zXC944GhlqFrrePsMSkUZUOmMmk49tbpvz/zVa4/5GfTeQ
         6c/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQXRGLcY128YqH9BT7VQ1XEoxenG6tItuUEwqxy0QkRqrl2ORvZactAJjQm921xFy2M3lAj94H@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHxzkqtZR5pYJSAzwfKPRg5B2yBzaoDcmzDztCSyM7M6ZbHShB
	tcjAzhqGflo1PZh/fQLgkpCHOhDG+Usf8T7H4HBiC0bcJlzyUaFTJm5JKQgMxVMtilDHNbCvQXu
	i4GpEeXYzq5Q6z9ajmpX/3eKMpw==
X-Google-Smtp-Source: AGHT+IEnuUd1RY/e4qO/uOcahve0/rtuCFrasHA8pKx35KthdwW8c9CBr7Ahe2VjFx7ocEvkq2IJ9WEXxO0pHiCd/BQ=
X-Received: by 2002:a17:907:9620:b0:a80:f840:9004 with SMTP id
 a640c23a62f3a-a9de5c9f68cmr956758566b.12.1730191813880; Tue, 29 Oct 2024
 01:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi> <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
In-Reply-To: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 29 Oct 2024 16:50:02 +0800
Message-ID: <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Sorry to bother you.

May I have your comments about my feedback on these patches?

It'll be great to know if I need to prepare the next patch set for reviewin=
g.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Thank you for your comments.
>
> Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Hi Tyrone,
> >
> > ...
> >
> > > +     /*
> > > +      * Previously, the 7-bit address was stored and being converted=
 to
> > > +      * the address of event in the following call to npcm_i2c_maste=
r_start_xmit().
> >
> > Do we care how it was done previously? I think this is not a
> > useful information as the code readers will se the code the way
> > it is now, not the way it was done "previously".
> >
>
> Yes, it's not a useful information anymore.
>
> > (there is a related comment at the end)
> >
> > > +      * Since there are cases that the i2c_recover_bus() gets called=
 at the
> > > +      * early stage of npcm_i2c_master_xfer(), the address of event =
is stored
> > > +      * and then used in the i2c_recover_bus().
> >
> > I could rephrase this sentence to something like:
> >
> > /*
> >  * Store the address early in a global position to ensure it is
> >  * accessible for a potential call to i2c_recover_bus().
> >  */
>
> Understood. Thank you for your help on this.
>
> >
> > > +      */
> > > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > > +
> > >       /*
> > >        * Check the BER (bus error) state, when ber_state is true, it =
means that the module
> > >        * detects the bus error which is caused by some factor like th=
at the electricity
> > > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_ada=
pter *adap, struct i2c_msg *msgs,
> > >        * bus is busy.
> > >        */
> > >       if (bus_busy || bus->ber_state) {
> > > +             /*
> > > +              * Since the transfer might be a read operation, remove=
 the I2C_M_RD flag
> > > +              * from the bus->dest_addr for the i2c_recover_bus() ca=
ll later.
> > > +              *
> > > +              * The i2c_recover_bus() uses the address in a write di=
rection to recover
> > > +              * the i2c bus if some error condition occurs.
> > > +              */
> > > +             bus->dest_addr &=3D ~I2C_M_RD;
> > > +
> > >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> > >               npcm_i2c_reset(bus);
> > >               i2c_recover_bus(adap);
> > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adap=
ter *adap, struct i2c_msg *msgs,
> > >       }
> > >
> > >       npcm_i2c_init_params(bus);
> > > -     bus->dest_addr =3D slave_addr;
> >
> > We can now get rid of slave_addr. It's just used in
> > npcm_i2c_master_start_xmit(). Right?
>
> Yes, slave_addr is just used as the link
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L2182
> suggests with this patch.
>
> >
> > Andi
> >
> > >       bus->msgs =3D msgs;
> > >       bus->msgs_num =3D num;
> > >       bus->cmd_err =3D 0;
> > > --
> > > 2.34.1
> > >
>
> Thank you.
>
> Regards,
> Tyrone

Have a nice day.

Thank you.

Regards,
Tyrone
