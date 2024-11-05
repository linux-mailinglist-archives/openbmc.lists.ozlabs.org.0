Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51E19BC2DE
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 03:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjBP00dtgz3c18
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 13:00:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730772000;
	cv=none; b=OPPYcbLw5It4lnInmCodICLDC0AwLOWCg3sh9OgV1cnDX8m/0aWK6BWj/mhONKPcpSi4D8ZHwyrPONtgehaecKSy8tp+lsBUQFdqB9LWqmNQQp74BjWEGwbw4L0PGX2shM+9qwQm/Wrngc2TCQRtBdG/ZcVLCHVOqbJ7hTiNEgfE1FBIq/2rR8QuYjHuq4nsiorEzp5+LYlLCGWlAoAd1+M+7pVB7Xjpw42N5Asrq1ROfcLHOXxD6RsIIOwRwxuL5NR9gL9eA9ixJSaeQZXB6WQ4M3mybc6aYA/hNC4rEItFZs5oxhfClqx9yxIF9Wd6eonZqNmDEX9Wu34FHmV9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730772000; c=relaxed/relaxed;
	bh=6AQtxq6f75GUqEq+zy/3pKDKuLzqPnWncabb+BsPt9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcZ2yaCako3qBqJhEbLrBP+kuh6NBoA2Tuo0X496bb8t8lf7XMWfOeiS3p57YJgDy133R5/6+xJ/23iKxPhNffVljW9pTvrpNH5G70I8d2BV9uiswW0avSHEca4bYXRK2pBDVPlmK83slc2G95DUEgbuAIDPxYbClrI1sSvm40CZ6FFD8zm/CbjFYI1JYMHKjdSyS4bidCandoFSB/OmteBb2HrN1mZUKyi/tIO2XLMfzOsBQmK2d8h2HJsY9lnt0C+g9IZMebd0L55ddv+tIjmgtht+fHVs4PBoCbAr1HXpHxy4EGo+hUH5SSDKhDUtiED2/rAF+C+bQ1+zTuGnEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d3hCihfK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d3hCihfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjBNt0LpLz2yDk
	for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2024 12:59:56 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f58c68c5so8878283e87.3
        for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2024 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730771992; x=1731376792; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AQtxq6f75GUqEq+zy/3pKDKuLzqPnWncabb+BsPt9A=;
        b=d3hCihfK5igvfSdPeP9EME+d39cHjfyTVa8A2s1wilyDj44Kvu1isOPe4tKa6oYTT7
         yCs2wk9bYkv+RLHL7jm22P8IzaS3TjyWhtFkcDeaiVFDWFKJ2sN4saoVnDp8BV3WbWmM
         IcifWMovRczyQm3RxVnErd9bk/5y4xUFt7sy6Lo5nkQpi/CJ8epHSj0P6xAias+iqaCj
         K/aIc4mgAuuQfgaJffWTR6LgGXxKq0DqyqZXkV8Qcks1ZsCZEaLhMTor8DqHN0GXZmrc
         S64Jn7irDrk4wcxZwEME8yqGdvDljIKynUHvYXOb2ubkWvxxR8nXub/2bjksGjKM3rMa
         xoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730771992; x=1731376792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AQtxq6f75GUqEq+zy/3pKDKuLzqPnWncabb+BsPt9A=;
        b=w++EVtpChy/nQ6SZ8XADwPQma/WHofX5Z8MG4XaGGjzuDoXuTT4+kI17T9kEng4ePo
         SsPN+EZVA4vUHbhEwpbTSSyiX7t0YEzsw793vA1ZDfyiJRZljwx6pNxaQrpDtnYGAlkK
         MijwRRqbtbXYCN5bXlCVd6T6LZz5E96TdI/VCSD0Vdg7ndc4DFBNu6ty/Q8giTOZjV7q
         CXXgKwMT3EcHvgxPEWKlCj4dg3wGe2k4f52gXDVvzekRaEWNRd6cbrnSeifgCiCc8axc
         iEifisYNT+TawsZDt+MvaTeh2eepIbbwO3SnxwxnhstFlFooDf9px6+Dr2q5b2DF/vXn
         zhRA==
X-Forwarded-Encrypted: i=1; AJvYcCVmoCTIgb859uV7Vje2PYeedWFi7EnvXUvF70R2ELcm4330du1GIXMTQ0VVCyVGlejSHrQLttIs@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTpTniDqC2BuM+DpXxOJgO6D57Wk+G2acbzL+BqBvMRiIYueRm
	0DIIdQQ1AoIaj7R4gRYOC3nY0KPSB97kmUQgZnCB5GG6KtV9WD0f/AtNpfHzujFGEoK+yiL6W8s
	Qwt5S1Ro/O7r4WV0lOrh0dkQqY/2v7cM6jw==
X-Google-Smtp-Source: AGHT+IGer+CZ/zgHN7qPF9OVKsUT5REaHpHEPg8J5zVAO0P8xH9Ol2oHigHMK2EfJa51wILlxPK4hzqEgrtyilbiw4Y=
X-Received: by 2002:a05:6000:1fad:b0:37d:5130:b380 with SMTP id
 ffacd0b85a97d-381c7a5e114mr16646830f8f.23.1730771616192; Mon, 04 Nov 2024
 17:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw> <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
In-Reply-To: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 5 Nov 2024 09:53:24 +0800
Message-ID: <CACD3sJYU2gDbeGyhtqnu2Rjbfny9zE3Cfbhii34uKB=iG=EwuQ@mail.gmail.com>
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

May I have your comments about my feedback on these patches?

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Thank you for your comments.
>
> Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Hi Tyrone,
> >
> > ...
> >
> > > -     /* 100KHz and below: */
> > > -     if (bus_freq_hz <=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > > -             sclfrq =3D src_clk_khz / (bus_freq_khz * 4);
> > > -
> > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > -                     return -EDOM;
> > > -
> > > -             if (src_clk_khz >=3D 40000)
> > > -                     hldt =3D 17;
> > > -             else if (src_clk_khz >=3D 12500)
> > > -                     hldt =3D 15;
> > > -             else
> > > -                     hldt =3D 7;
> > > -     }
> > > -
> > > -     /* 400KHz: */
> > > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ) {
> > > -             sclfrq =3D 0;
> > > +     switch (bus_freq_hz) {
> > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > +             smb_timing =3D smb_timing_100khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_100khz);
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > +             smb_timing =3D smb_timing_400khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_400khz);
> > >               fast_mode =3D I2CCTL3_400K_MODE;
> > > -
> > > -             if (src_clk_khz < 7500)
> > > -                     /* 400KHZ cannot be supported for core clock < =
7.5MHz */
> > > -                     return -EDOM;
> > > -
> > > -             else if (src_clk_khz >=3D 50000) {
> > > -                     k1 =3D 80;
> > > -                     k2 =3D 48;
> > > -                     hldt =3D 12;
> > > -                     dbnct =3D 7;
> > > -             }
> > > -
> > > -             /* Master or Slave with frequency > 25MHz */
> > > -             else if (src_clk_khz > 25000) {
> > > -                     hldt =3D clk_coef(src_clk_khz, 300) + 7;
> > > -                     k1 =3D clk_coef(src_clk_khz, 1600);
> > > -                     k2 =3D clk_coef(src_clk_khz, 900);
> > > -             }
> > > -     }
> > > -
> > > -     /* 1MHz: */
> > > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > -             sclfrq =3D 0;
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > +             smb_timing =3D smb_timing_1000khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_1000khz);
> > >               fast_mode =3D I2CCTL3_400K_MODE;
> > > -
> > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > -             if (src_clk_khz < 24000)
> > > -                     return -EDOM;
> > > -
> > > -             k1 =3D clk_coef(src_clk_khz, 620);
> > > -             k2 =3D clk_coef(src_clk_khz, 380);
> > > -
> > > -             /* Core clk > 40 MHz */
> > > -             if (src_clk_khz > 40000) {
> > > -                     /*
> > > -                      * Set HLDT:
> > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >=3D 120
> > > -                      * HLDT =3D 120/T(CLK) + 7 =3D 120 * FREQ(CLK) =
+ 7
> > > -                      */
> > > -                     hldt =3D clk_coef(src_clk_khz, 120) + 7;
> > > -             } else {
> > > -                     hldt =3D 7;
> > > -                     dbnct =3D 2;
> > > -             }
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> >
> > There is here a slight change of behaiour which is not mentioned
> > in the commit log. Before the user could set a bus_freq_hz which
> > had to be <=3D I2C_MAX_..._MODE_FREQ, while now it has to be
> > precisely that.
> >
> > Do we want to check what the user has set in the DTS?
>
> The driver checks the bus frequency the user sets in the DTS.
>
> Please refer to the links:
> 1. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n=
pcm7xx.c#L1995
> 2. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n=
pcm7xx.c#L2002
>
> >
> > (Or am I missing something?)
> >
> > Thanks,
> > Andi
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone
