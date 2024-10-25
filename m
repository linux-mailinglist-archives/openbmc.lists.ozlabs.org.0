Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF349AF726
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 03:46:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZQcp0W3Yz3c2C
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 12:46:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729820807;
	cv=none; b=HkBLyWCWwxtjm3nP0Ra18Fjqbj8WWyc6f9/HPDUtg4uJy9lHkakKmURyeFv1vsUY6DcmcwLNuEN+X/jOo62+5AgdE00oaTXMV0vXPrgsGztcg9lOk/7UHrmbMk6qhtmm+6EZP2i1DvSvXfh3tZGlAe996vsgiqyf7IWsNlGD6aH6kKQSbmnOE8CoFOkaIeDeWfdaN1qOMYfT6JQ7i2wYcGoy3B1YIuW7Zi/oWjkkUyHU8D2Ju7dxCuOnzbYMSd694Tn0zLALnYRVKY3WB9CZVvOKDG3DoKjurb2yreGG7LPTqreB+EytcX8OzGgiPQTJvaXq7zIM1OE1+Uo9YRa4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729820807; c=relaxed/relaxed;
	bh=azbmPKYWqdzElTEWYEO+hcSdkrUk0KpOPE9hBOqu2hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We2wfVChwUK61+d3H7jN2YDjNrhz9kFHRXMgS77xf9Sz+5skW8ZScvCdMHjwZ77yQKWHOdaYTx5WUsnJ2RIUymH7YjW+Y5sd3Td7uNq4kHxrcv0HamHryUhngvsedih2KRGVd4q21xeT55s3cYi/ZMBVOKw400wOMoyJPBo55kpMOPfHPpMZBi+N92s2myAvNeL5tjl1ZBY9JQrXtwsj+U63NB5UYnLxFAfjVsjoL4V5YdDGm4CecueGXOJx+jciZjLfhIRaSKCPGkCHPKGSJSA+VwvTR+GwY3jDDBVrs+CgTWXtLHB1OncTI/TCBkG2EoDDtIr5CB3GtPtVDmuDTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hmw9m1AX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hmw9m1AX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZQck02R1z2xJK
	for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2024 12:46:45 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a628b68a7so236164966b.2
        for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 18:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820802; x=1730425602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azbmPKYWqdzElTEWYEO+hcSdkrUk0KpOPE9hBOqu2hM=;
        b=Hmw9m1AXSH/eDZGyy3FlaM77yViMhCqwIOs1I041+UJERe8SLL5A+PacFQge7dTAK7
         BT20O0cr7/S+W2cyG4aPzBTmkPjX4xncXnoAqOEd4gSCqETgYh4src/SRJXQXBiY9Lvt
         jnEs6AjrHhAPyqL3O7IzQyBspZY1wMByKySSJ48KQ7ip03Tydkm7j+Pl1SN3WtT1bTsA
         Wp9FBzIkZLy8FVFHcKO35ATStKMz2UFBxh/kEi0fYyuAcWBzwYcYU/w5LchleduXTddV
         f68vLSAFMqozrnjC52uW0LOl1FkhbWKGj0X9RUwUPYnFjVJgi7pqNvrMZUN70KxfR5Is
         aEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820802; x=1730425602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azbmPKYWqdzElTEWYEO+hcSdkrUk0KpOPE9hBOqu2hM=;
        b=khbUUMTQKLV78KG3CCPAUdeCHHHrtfhGMusPZUD8OqVzTBA+uESQqq9fUAmoJVeGZk
         6fUs5rrO5NhsiPKNhrBgAkgOFXL4Q3EjSG3Oh9dnCKbZ3T3hSJLlhX6y3uQosSGLldQ2
         57Y0UYYX8BBtLzbEx4ygZoRsnYz9yTu3dnbYooH2XuPbY+nXEZ24PHNKDY8lLo0kZvjU
         s4l79yo210G/tbem35rsMlxSopfX470BLe//49UlZ91oHr93G/7U+Elr8c+YmOTXwzcG
         yYDUxxw6JKQHh81xVvztQu5f2RA5OEc4oxQX1FdSintI/APVc4sH8be+QeDpvtYiJMfg
         Rrug==
X-Forwarded-Encrypted: i=1; AJvYcCXoP6geMFF/D7vBN2z9RF3zQ0NO/CYQZP9drFjOAXgVk78zRzGVnr/6WgP1kKC/z0WDgwQa29io@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwRybr6O5kjvXEVbm2sEyGS1r5oYrlrkVyeH03c/IH/Avx8kvIY
	SXIR8B2bXVo1h7cLSfNYo6PgaR1Rm4p6zAtpWy/HZJ7UPJXJv5Gdz2NH+/NT/mhu8L2QEf5rQcx
	fk8u5ibKsFP+vTE/B8Ftppbii1xh+IwswRw==
X-Google-Smtp-Source: AGHT+IF7p9fJzlSk0QEbox4mtDU389C/JLpNm7tTrZfbUz7FjaQ4SPU+FeB/PrVCHNfDK20fdxR/Bn5OLnUkx9tlW1o=
X-Received: by 2002:a17:906:c14b:b0:a9a:a32:bbe4 with SMTP id
 a640c23a62f3a-a9abf84d195mr660041366b.12.1729820802158; Thu, 24 Oct 2024
 18:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
In-Reply-To: <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:46:30 +0800
Message-ID: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
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

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > -     /* 100KHz and below: */
> > -     if (bus_freq_hz <=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > -             sclfrq =3D src_clk_khz / (bus_freq_khz * 4);
> > -
> > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > -                     return -EDOM;
> > -
> > -             if (src_clk_khz >=3D 40000)
> > -                     hldt =3D 17;
> > -             else if (src_clk_khz >=3D 12500)
> > -                     hldt =3D 15;
> > -             else
> > -                     hldt =3D 7;
> > -     }
> > -
> > -     /* 400KHz: */
> > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ) {
> > -             sclfrq =3D 0;
> > +     switch (bus_freq_hz) {
> > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > +             smb_timing =3D smb_timing_100khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_100khz);
> > +             break;
> > +     case I2C_MAX_FAST_MODE_FREQ:
> > +             smb_timing =3D smb_timing_400khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_400khz);
> >               fast_mode =3D I2CCTL3_400K_MODE;
> > -
> > -             if (src_clk_khz < 7500)
> > -                     /* 400KHZ cannot be supported for core clock < 7.=
5MHz */
> > -                     return -EDOM;
> > -
> > -             else if (src_clk_khz >=3D 50000) {
> > -                     k1 =3D 80;
> > -                     k2 =3D 48;
> > -                     hldt =3D 12;
> > -                     dbnct =3D 7;
> > -             }
> > -
> > -             /* Master or Slave with frequency > 25MHz */
> > -             else if (src_clk_khz > 25000) {
> > -                     hldt =3D clk_coef(src_clk_khz, 300) + 7;
> > -                     k1 =3D clk_coef(src_clk_khz, 1600);
> > -                     k2 =3D clk_coef(src_clk_khz, 900);
> > -             }
> > -     }
> > -
> > -     /* 1MHz: */
> > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > -             sclfrq =3D 0;
> > +             break;
> > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > +             smb_timing =3D smb_timing_1000khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_1000khz);
> >               fast_mode =3D I2CCTL3_400K_MODE;
> > -
> > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > -             if (src_clk_khz < 24000)
> > -                     return -EDOM;
> > -
> > -             k1 =3D clk_coef(src_clk_khz, 620);
> > -             k2 =3D clk_coef(src_clk_khz, 380);
> > -
> > -             /* Core clk > 40 MHz */
> > -             if (src_clk_khz > 40000) {
> > -                     /*
> > -                      * Set HLDT:
> > -                      * SDA hold time:  (HLDT-7) * T(CLK) >=3D 120
> > -                      * HLDT =3D 120/T(CLK) + 7 =3D 120 * FREQ(CLK) + =
7
> > -                      */
> > -                     hldt =3D clk_coef(src_clk_khz, 120) + 7;
> > -             } else {
> > -                     hldt =3D 7;
> > -                     dbnct =3D 2;
> > -             }
> > +             break;
> > +     default:
> > +             return -EINVAL;
>
> There is here a slight change of behaiour which is not mentioned
> in the commit log. Before the user could set a bus_freq_hz which
> had to be <=3D I2C_MAX_..._MODE_FREQ, while now it has to be
> precisely that.
>
> Do we want to check what the user has set in the DTS?

The driver checks the bus frequency the user sets in the DTS.

Please refer to the links:
1. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npc=
m7xx.c#L1995
2. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npc=
m7xx.c#L2002

>
> (Or am I missing something?)
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone
