Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16079D4A85
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 11:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvDXd3WYfz3c5t
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 21:11:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732183886;
	cv=none; b=KZiBmiTQ7DDcaH4+1wE81o+vvqe2HR+smrbNdZ5QI+7rSyX1geKUWfq3eSTZ4UW5qHgk4THhOwA59JSJW6qe9v12VN7XZQOF8vwfWuLrfw/wgnIhZrzqccekpbBQd63uuv2gt4dd0K9EXTZAkHkejQa59E2t5CX3wTYri/7MhEPLHX2ZuSURyF+nMjMP8evJesZXHT5bIP0wULEQj3Pw2wn5a/78seJRsN/WNHuqKGQyEei2NkuXiK4LWH+TEnAMjNMgR4Rox6Ivi2GIFwF08zeWmi+Tn/4x+ezRn3v+jzxZHUbXPS7vzByscfR/C/jGhB6M1gH1v4gWXDAkSlK9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732183886; c=relaxed/relaxed;
	bh=orZm2h7WMcvgWW0S6Q6soEEfio1OXIAtBvmEIOIWSRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MviDyoOe0N5kHLaK1xCEgCVLts3QVcykz7Fk3g8ujDjBbd5ZW9o85qGV7/L/7HBt/Fszuq7wQLe8d8uTpN3HMGxY8iQtOQ2TnEEX1IukIxweN+sTaERPkiUYSpqTJQWwFKski3o4464T2DLyxnzIYPokrZ0snpMl8owcBSkb6bTuB/Qg1jT+zGx5GCwtEiytSAcO3vRhjG9GbhZUGFuzJhWErBYUVodLGfyTviVBxhNG0ZO6aRYe77ncB68vE6AVFmM7vlDA1SBwgqGMi+eyvKZaaVOFApyEB+HoI1a+Fv5LXcJioTPCuk7Zvi6luthAed5gJEAIIkIMLv5o8rZn+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b79Fk70a; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b79Fk70a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvDXW66j6z2xk7
	for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 21:11:22 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa2099efdc3so361528366b.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732183879; x=1732788679; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=orZm2h7WMcvgWW0S6Q6soEEfio1OXIAtBvmEIOIWSRs=;
        b=b79Fk70aScTpzVgPDG4WRqc33QGP/vxU2/N51ShXzdUHDjQvh3XVz0UqdepSD0hTrf
         p2kHv0Ux+BYN6n1Huqqx8Gb9pLliJfinohTHPftoxEkDYtiF62P4W6IZikMr5zWhCddj
         kSavNJUZOn53VhYuKia72kpz86pdPkhamFTw8VVANoM7jLedXy8/0AohajtWhu1DJeVf
         BFt3XpejlIH8n41Wrs+tAtaIgKs1kQEKF6GQAXEepdFSawIUR/b51PF7GMwv2G/HiS0Y
         ihsE6PSKitufPt0yaFeDp89p/qOUitdq78jqE/b3/jW3EDjG3QUr5s4sw5mm1Xnm+IPb
         OJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183879; x=1732788679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orZm2h7WMcvgWW0S6Q6soEEfio1OXIAtBvmEIOIWSRs=;
        b=tCMUdnyb2Z52LNY28Qx5ShBOszGGGCrBC4dcEujTSyixRdu27U3J6ElAxIpBcYkT/K
         eneOwMiUJSiXUrIhIjtfcKF2RtIs3j722tqRur596E9TKFRIA5yEDYM/mMfi1GVWNNuf
         U3q5kCsnigwoJQBodt4CmTX+SbxeSZMZtBIisMZZzXEUG9Dwg4wBIHQ7GEBCLyI307eA
         iMSemueIV3z5C7VbhawSbfpRNsPoqrVUsg0c8w/Jmj3e5ytYc6Yg5xvn3pU5YXX+kugu
         VJTzWw2U5QTF4uWuEcZI5LZxpruPLclBHIPnmi1Xk7UAv6FAMT7aNAyDxdrpTzUCPaRj
         ltmA==
X-Forwarded-Encrypted: i=1; AJvYcCXAfybih12HKJfKPCp7vrc8SemZDcxo41Cm1TJ7HroMzFApUWZDyxFivpkhJ4XF233j21H3c0RC@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxeQi3HShTYsB+Pl3n3wzxyqJj7j/r/QEXRxcQcI473jPwIpvWS
	Kyq76//sBeQURTcbEdEgGJewt8ZOk93xkCYfwICGnKFjz1yBxSvxWvubOAxFTpvydp9bKRIh9xe
	TJYFRtOoTo/gwBoT1F6zjA3RZwEk=
X-Google-Smtp-Source: AGHT+IFo9Si2frH4eDj3XQI3Tzc2md+3KkMtVOhZp4DS+rJqFhD9bAjtxNSdW+oDIlSQJEvSuo3Mel4KJuzeuyxVF5U=
X-Received: by 2002:a17:907:7208:b0:a9e:b5d0:4714 with SMTP id
 a640c23a62f3a-aa4efd9b8a6mr243895866b.21.1732183878598; Thu, 21 Nov 2024
 02:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
 <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com> <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
In-Reply-To: <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 21 Nov 2024 12:11:06 +0200
Message-ID: <CAHb3i=uT+Zx8m4hAF1M2yjCn=a5sDBn2wJajWdCm79syuy97Ag@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

>
> > > > -     /* 100KHz and below: */
> > > > -     if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> > > > -             sclfrq = src_clk_khz / (bus_freq_khz * 4);
> > > > -
> > > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > > -                     return -EDOM;
> > > > -
> > > > -             if (src_clk_khz >= 40000)
> > > > -                     hldt = 17;
> > > > -             else if (src_clk_khz >= 12500)
> > > > -                     hldt = 15;
> > > > -             else
> > > > -                     hldt = 7;
> > > > -     }
> > > > -
> > > > -     /* 400KHz: */
> > > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> > > > -             sclfrq = 0;
> > > > +     switch (bus_freq_hz) {
> > > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > > +             smb_timing = smb_timing_100khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_100khz);
> > > > +             break;
> > > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > > +             smb_timing = smb_timing_400khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_400khz);
> > > >               fast_mode = I2CCTL3_400K_MODE;
> > > > -
> > > > -             if (src_clk_khz < 7500)
> > > > -                     /* 400KHZ cannot be supported for core clock < 7.5MHz */
> > > > -                     return -EDOM;
> > > > -
> > > > -             else if (src_clk_khz >= 50000) {
> > > > -                     k1 = 80;
> > > > -                     k2 = 48;
> > > > -                     hldt = 12;
> > > > -                     dbnct = 7;
> > > > -             }
> > > > -
> > > > -             /* Master or Slave with frequency > 25MHz */
> > > > -             else if (src_clk_khz > 25000) {
> > > > -                     hldt = clk_coef(src_clk_khz, 300) + 7;
> > > > -                     k1 = clk_coef(src_clk_khz, 1600);
> > > > -                     k2 = clk_coef(src_clk_khz, 900);
> > > > -             }
> > > > -     }
> > > > -
> > > > -     /* 1MHz: */
> > > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > > -             sclfrq = 0;
> > > > +             break;
> > > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > > +             smb_timing = smb_timing_1000khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_1000khz);
> > > >               fast_mode = I2CCTL3_400K_MODE;
> > > > -
> > > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > > -             if (src_clk_khz < 24000)
> > > > -                     return -EDOM;
> > > > -
> > > > -             k1 = clk_coef(src_clk_khz, 620);
> > > > -             k2 = clk_coef(src_clk_khz, 380);
> > > > -
> > > > -             /* Core clk > 40 MHz */
> > > > -             if (src_clk_khz > 40000) {
> > > > -                     /*
> > > > -                      * Set HLDT:
> > > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> > > > -                      * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> > > > -                      */
> > > > -                     hldt = clk_coef(src_clk_khz, 120) + 7;
> > > > -             } else {
> > > > -                     hldt = 7;
> > > > -                     dbnct = 2;
> > > > -             }
> > > > +             break;
> > > > +     default:
> > > > +             return -EINVAL;
> > >
> > > There is here a slight change of behaiour which is not mentioned
> > > in the commit log. Before the user could set a bus_freq_hz which
> > > had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
> > > precisely that.
> > >
> > > Do we want to check what the user has set in the DTS?
> >
> > The driver checks the bus frequency the user sets in the DTS.
>
> yes, but before it was checking the value within a range, while
> now it's checking the exact value.
>
> The difference is that now if you don't set the exact value you
> get EINVAL, not before.
>
> Andi

Previously the driver was rounding numbers down.
The driver has settings for 100, 400, 1000 KHz.
but what happens if the user asks for 200KHz?
Some of the coefficients were calculated according to the equations,
and some were hard-coded values per setting.
We don't want to support this mix.
We prefer the users to ask for numbers that are one of the three
supported values and block unknown input values.

Thanks ,
Tali
