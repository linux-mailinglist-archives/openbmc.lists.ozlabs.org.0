Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 583F58CC4FF
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 18:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FX/IVoIm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkxkX1C4qz3vlf
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2024 02:35:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FX/IVoIm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vkxjv3G8Rz3gFT
	for <openbmc@lists.ozlabs.org>; Thu, 23 May 2024 02:35:13 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dee72970df8so818670276.0
        for <openbmc@lists.ozlabs.org>; Wed, 22 May 2024 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716395710; x=1717000510; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwrtFMkpSDt9VbB+n06nlRftl6YZbhM7iR+8tjiKkcc=;
        b=FX/IVoImm0yQEXsi79rgzHPBsCqRg5fk7AUdxvi1KVc22Sf2Ihrur6gJ9C8tdCCWj3
         bK0vclu1j0ZVEunbY/07p21Beitzsyb4lNNNDxcabftMycmDdwKJrAN9LUfMi2uqNS3T
         8+06zGL/NDIhXnD4H/pg94jSdHSMN94XSuDfgl0a2Vc7lOkSczGy8+6l613LZvBXDBSc
         Nta9XI8IL/vz2y5JwfQMGGRvAYgmz2Qnj2ON2pTOw3gX2m3tDfn4k1qkoeweHB0QBJ0g
         yrT9vFEN8XpSfs8vz+0Gr7ujZ7cmLKFgSNNIes3sjk3Hj50UkVc7Tv7NfnIXuE5RiSCM
         FI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716395710; x=1717000510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwrtFMkpSDt9VbB+n06nlRftl6YZbhM7iR+8tjiKkcc=;
        b=iQOiW7roXw0toVnj0XrmUr1NV/mGqaX4jklw0VQTzlDucY9Und2QKhG5suxushBrpD
         ps3ACY0yOxcEO7tSu6K8AviG7R0FU8XNFBjQJDl5BCyFLSyKZVVsC0+9vPCejVPWc7km
         CZd9/tZ6/iWvn1zD3HswIULn9xycqJS/dLWJOgYfrsYnEttJVrBEhsC2ScUI93jEdtrp
         gOjV4VGJISarvqlrMyNXrJAXCSpzx78kuBuraXQKvqMnlc7+htfMR88m2Un2rOzZN42d
         +6auivMQ2tLaGNTUmajuXWtcakNWLMOaEfIynUXIPNmKvLEODN4yQThfvME4dscHmStl
         onpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV+lgozoMGO9K1O4lqo8bWSXSbHNl4PiRUUEkqU/YS1Wy9ylfKyFlDIDZnXahVPmOHayt1KmwsFyPJz1WbOv/5kHRsyrM++hg=
X-Gm-Message-State: AOJu0YxP1n7+fb47xZhMuaxRll5edta2AGP32WcdPLi9HkFE0+rzHEDi
	At8NwJjnL/rL+Fs6D26sgc0FEVg25m9V/pGV+KZKc1dDO1qS4vvsSM5PsAkvqSvlmL/uQs9sp3a
	zG9vMqks0SUzUNwCrW2N+o5fGhV4=
X-Google-Smtp-Source: AGHT+IHTSs1INlTP/I9mKiFoUjrWofSCk/KeTJ4YOYLi5YbSbKts7y2jk9BRDKrvtm+jktdyKAvGR9JjbnfiPI3UwwM=
X-Received: by 2002:a25:86cd:0:b0:dcc:6894:4ac0 with SMTP id
 3f1490d57ef6-df4e0e612c4mr1846106276.20.1716395710484; Wed, 22 May 2024
 09:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192411.2432066-1-tmaimon77@gmail.com> <20240509192411.2432066-5-tmaimon77@gmail.com>
 <20240513155330.GA2676859-robh@kernel.org> <CAP6Zq1hRw6xfNKKfBFGuKbZk0su3ys6+hnMzqRWrZeKzDoKLEw@mail.gmail.com>
In-Reply-To: <CAP6Zq1hRw6xfNKKfBFGuKbZk0su3ys6+hnMzqRWrZeKzDoKLEw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 May 2024 19:34:59 +0300
Message-ID: <CAP6Zq1gKp+Hu93CK=78chvNk70WtKMKUv8ny0Mzkw47wn7Af2g@mail.gmail.com>
Subject: Re: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk bindings
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Kind reminder about the question in the mail thread below.
Your response would be greatly appreciated.

Thanks,

Tomer

On Thu, 16 May 2024 at 12:44, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Rob,
>
> Thanks for your comment.
>
> On Mon, 13 May 2024 at 18:53, Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, May 09, 2024 at 10:24:11PM +0300, Tomer Maimon wrote:
> > > Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
> > > using the auxiliary device framework and not the device tree framework.
> >
> > Again, this is an ABI break. Changing driver architecture for 1 OS is
> > not a reason to change DT.
> Is it an ABI break even if the NPCM8xx clock driver hasn't upstream
> the kernel vanilla yet?
>
> I thought that since the NPCM8xx clock driver hasn't upstream the
> kernel vanilla yet and and in the latest NPCM8xx clock driver patch
> the NPCM8xx clock driver.
> using auxiliary device framework instead of DT we should remove the
> nuvoton,npcm845-clk.yaml file.
> https://patchwork.kernel.org/project/linux-clk/patch/20240509192411.2432066-4-tmaimon77@gmail.com/
>
> >
> > Rob
>
> Thanks,
>
> Tomer
