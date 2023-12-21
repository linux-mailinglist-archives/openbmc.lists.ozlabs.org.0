Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C6881AEC5
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 07:28:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lsHoq3Td;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwgTw1Ypqz3cRs
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 17:28:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lsHoq3Td;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwgTJ4l6mz2xct
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:27:32 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cc95f1102eso3588121fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703140045; x=1703744845; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bUYlaraZvgnaRvFqkhplZceJUCJIoSDu2V8+PBmaGqw=;
        b=lsHoq3Td6bN8nko7iE+33gNkO91QbAErYuN2G1shfOPzCvN8Lcr0Urzv/QwCtA/csh
         ryh0OB+4X1kuLezyrk7c9AHXTHVrXcDYFQ5zvsbbueB6DTL1GdwyDXdQbQqlGMZupq6H
         q5Vf5995HQcpgHmGcdBpOEov+6i/JtBY7U9JbFlCyLdoSjmtvgQGWBNSRGYj7sD0k1lR
         yJXCPZ6wkp6ruE7y+xkqprEezindzE9Fi4YXkeq60D2Fo1U0nQo+4v2z69/aBI42sNO2
         Va3tkoZuF0DgHuajc80y/uZJNV+nKZjjRETAOw/+DLcjw2bO2kj4nATPGOzDCFNsbtGO
         BpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703140045; x=1703744845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUYlaraZvgnaRvFqkhplZceJUCJIoSDu2V8+PBmaGqw=;
        b=EAz77h08b4szC+IT54e3hDtpQaTDZTYa4dqz7qPB4ID+elfhBkBzBSoP6aRi9NO9C3
         4+88kXep3FqdfKpLZd8lpOQhEiALDF0RozSlq0EmuBaYVWMLElh8LA/YbMh6r5oywyx3
         BaKnFfdoe0ASuepPASdwqwGT06wf5/J81MU7UAt9b6P8atwiQlPAdvb9+r1Zcx3A9xpA
         wEIew3nY8XYlX9FGIDK2sNgwvpXkg5fjRB/bqbz5ATNRox5RNsYFrPp2v0vFp1LjY6tz
         Bx2HLqK2qvIVEGwRHCxoo3y2U3Q4jZhRU1mrG27MFLXfegg+q3XGZEj+izYRJdT82NZC
         3GBg==
X-Gm-Message-State: AOJu0YxiGpKLl6xIDrvFDgWFDGIF/ICmVUj5AScDgC9tfVnhvtv7VCr/
	5FEsoPeoy3ba0es5GnNAA4Pimplm8TmpMB1kanA=
X-Google-Smtp-Source: AGHT+IGr8ds7tM65bV+bO56xsNx4q7k1kqiJPSfw32j4yZhvpd7vwHajRGCzWtcY0f4421/kv2STDbiUZ0+mBiaj/5o=
X-Received: by 2002:a2e:9106:0:b0:2cc:778a:f67e with SMTP id
 m6-20020a2e9106000000b002cc778af67emr1769164ljg.46.1703140045023; Wed, 20 Dec
 2023 22:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-4-jim.t90615@gmail.com> <ZXnNRoGmeibdRAwq@smile.fi.intel.com>
In-Reply-To: <ZXnNRoGmeibdRAwq@smile.fi.intel.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Thu, 21 Dec 2023 14:27:13 +0800
Message-ID: <CAKUZ0+EDdBnPdY828L3DUTHKyXX209cJEuFWBs7xff_6bbDWPg@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: KWLIU@nuvoton.com, conor+dt@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy

Thanks for your comments.
I will modify it in the next version.

But some description as below



> > +static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
> > +{
> > +     u8 in_port, out_port, set_port, reg;
> > +
> > +     in_port = GPIO_BANK(gpio->nin_sgpio);
> > +     if (GPIO_BIT(gpio->nin_sgpio) > 0)
> > +             in_port += 1;
>
> This is strange... So, you are telling that offsets start from 1 and not 0?
>
> > +     out_port = GPIO_BANK(gpio->nout_sgpio);
> > +     if (GPIO_BIT(gpio->nout_sgpio) > 0)
> > +             out_port += 1;
>
> Ditto.
>
Yes,  if the customer has defined the in/out pins the offsets start from 1.
The NPCM_IOXCFG2_PORT register is the set number of in/out ports.
NPCM_IOXCFG2_PORT register define as below:
0~3 bit is the number of input ports
4~7 bit is the number of output ports
Each module can support 8 input ports and 8 output ports.
> ...
>
> > +     set_port = ((out_port & NPCM_IOXCFG2_PORT) << 4) | (in_port & NPCM_IOXCFG2_PORT);
>
> Outer parentheses are redundant.
>
> ...
>

Best regards,
Jim
