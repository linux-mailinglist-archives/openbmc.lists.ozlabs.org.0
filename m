Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340094CB13
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 09:18:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MRDRPYiF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgFcb38FQz2yjR
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 17:18:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MRDRPYiF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgFbn7167z2yYy
	for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2024 17:17:24 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135dso2246063a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2024 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723187839; x=1723792639; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpODigRY1HFvjnaXk96bH9eqAyHzDGOWTbmy+vqO+EI=;
        b=MRDRPYiFb94jat+oxYbkoRdFq0CDtd9LSEHLcWmDaF2Mg/ODM5viyoH5WBrg2Iaku8
         J9Qq5J/dtsZrWb6MlJKZYyAk99RgMLXp0hJQvvv9VLy5VxU++WWuNXj5f1vp+LzCy/jA
         5GX8NDzLfKZCZSNcd7nJTw1QTsJ7PIDfQmT+loWQ6Vztpcn3Aj0Aoecw2VxyyaAoeNKJ
         4T+K9NmJ37stcD/OCLqTWd9yj496o68PMOpfh72ngVOLJZDd8KHl6HarJo58HhlKP3b9
         /WKj/YQu/9G8QV1W/T8sU9k5XzePbw0wcpysS5CRzyXQziqdk61ZGkKvZr8ZHqsaGfac
         or+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723187839; x=1723792639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpODigRY1HFvjnaXk96bH9eqAyHzDGOWTbmy+vqO+EI=;
        b=kQVcYddpwgR0A2lFHOWqtz6/sLYCb2rgbbdFMjNfvq9Z4mzMF1RSPrIRZB0umMMDQj
         M8RT/KK4k/aC81O8bjQzum8GKzr7rlq/Mql6X7C/IwEGtSD/ZF6EKJ/kdNP1IlHUslEk
         zhQ1T+WNgJADjgwQzUFDpXJAqcePPjRpfrYyYqPOS63VV2t8XACe6bx3gdhWE4JMYN2p
         eEQQwwmli37cp3eRgflJTfmY6qHMltudFrGSspPOHUrVnE0ifuifplOBoNxpfxz2X9N0
         jfOlJyWYE/mGnMCAKty0U/dLgGhokXI3ihkujK4hvhoTT7Q+f1EU40VZS1VrlmlKn7Z4
         jwrw==
X-Forwarded-Encrypted: i=1; AJvYcCXgx0ezYx0xxMqiB4phe3TKr2AITCMuJvQaZBFNon4VYGDCx4oYArIgDadFa4nEn1rB7fSe7nFt/PXaUAMxA4znYXXtn0SUbDM=
X-Gm-Message-State: AOJu0YxnD7LMhrYmuR6x344UDuqw5fLkpHGkoCcZU7DDP/RDpPSbkID+
	UQO753a/4UURjF1lCv/oMo0KHCgDY+0xpHxXdKfd5TfFX7464WJFlJB9tbEKZW5YH9u9X+tDfWQ
	5b5bOdqVYEFuBnpVorrI+l50KRA==
X-Google-Smtp-Source: AGHT+IEzTI5d1jLwL4XO4ItIER/rGUNRj6ZhGxovMIQSRGAbuFN/TJjDR3qUkESHPc9yly+OhVRJdzcGDJzeQylhoN4=
X-Received: by 2002:a17:907:6d15:b0:a7a:9ba8:f890 with SMTP id
 a640c23a62f3a-a80aa54aba5mr44627466b.13.1723187838777; Fri, 09 Aug 2024
 00:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240807100244.16872-1-kfting@nuvoton.com> <20240807100244.16872-8-kfting@nuvoton.com>
 <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
In-Reply-To: <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 9 Aug 2024 15:17:07 +0800
Message-ID: <CACD3sJbnnH+j0tKYE4BfwTfY5dvMurg9jdZLY+x4W80t_oW9tw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] i2c: npcm: fix checkpatch
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, jjliu0@nuvoton.com, linux-kernel@vger.kernel.org, andi.shyti@kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tomer.maimon@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew:

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2024=E5=B9=B48=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hello,
>
> On Wed, 2024-08-07 at 18:02 +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Fix checkpatch warning.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 1af6a927b9c1..dbe652d628ee 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npc=
m_i2c *bus)
> >               /* reenable slave if it was enabled */
> >               if (bus->slave)
> >                       iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
> > -                             bus->reg + NPCM_I2CADDR1);
> > +                              bus->reg + NPCM_I2CADDR1);
> >  #endif
> >               return 0;
> >       }
>
> Fixing checkpatch warnings means you need to modify the commit that
> checkpatch identified as having problems, not just add a fix-up patch
> on top.
>
> It looks like this change should be squashed into the patch before it.

Got it, thank you for your comments.

>
> Andrew
>

Regards,
Tyrone
