Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78291B2A0
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:19:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhEw53MN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9F013pmtz3c2t
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:19:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhEw53MN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W90135VLGz30TZ
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 23:34:46 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a7241b2fe79so678399966b.1
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719495278; x=1720100078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fBZz+Ia1KYhg1l3omdv50MLRHCM22KtdUn6SH+XsYQ=;
        b=NhEw53MNnhOIpmHzRLWXjdJ2Twzs6HILcBfU4UsuhPDBrykoIo4Sa2Ng8mUISSTVMt
         li2ur4Uo3M8v4fBEoi5OG6OPoxmoq0dPhP2YyZfVp6LsyIqMl0+Hs1/yFtRKq95LQyDW
         UfZnlIu3cSpSQrCZW8WS4NeYVqH9LtZ5JNHGWFHMpKTCGYnCTxImmabN4i1HxaxwKJzL
         ZhJpt8ev0+nUhI99mv+3yThllWire8A1C6AHEN4LomDtPdv9Vg4+FKWctTZlpwVE3K+R
         dh4rC172vsxeoXAofJAeVw4iM0aOT58RXUWR5GX3+6/tV9cRhgVIo1GN25LfmjeaUEHN
         FyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495278; x=1720100078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fBZz+Ia1KYhg1l3omdv50MLRHCM22KtdUn6SH+XsYQ=;
        b=MSdM6wTqMmNTorwNR9ffqLToGLrGpLYwfuhSfwmGdbDwREMN6XEu8cAhaiwJLebwec
         cevu+/v3s7w/DmOKt+QP3gmBJelFc29fBsIboJWdl2i1j7sIW9zECKvWQpq+RNyngusd
         ulcUvzI8YsGmXhuvh3vDENtVC0cf2Xi2CQWcwIFJ0nh8qncA7aD3r1F34aIuRH+HOLSz
         177ssxj9jWOYATx4zugmSsFhZUvL51Qw7snMEsL7nNH1TUfHR42jpuxnpPrs3JXh4jHX
         Q1Mx74pPy2ybsqRWQQsfnWx9wC2KT38DRNwRyOhSwFBS4xKrIphc2fDUK+Cz5DF4BnSd
         XDOA==
X-Gm-Message-State: AOJu0YxBU0QWHy5UokuIHnHNoysaZHz4RpPlq9cqiEyO4lFTGN/gbeS3
	a4R6gjTEMePuq3xvdB6aOFxHg0j+PfrpVUg2Epz+V8hrvWuma7nunsgTuRFWlwyAHJalFGu8WJa
	SLM93t759edwdjMbwqfYz+ULcfsUZYVA/7AE=
X-Google-Smtp-Source: AGHT+IGWMIpqwylM/leDnSGTQ2l6kaTy7Rw6A0jqf/to8pk2Tl6RcMpeZ0zDeUfIURqlUAlENKgLRa5XiYSNk+2AKVY=
X-Received: by 2002:a17:906:d8b8:b0:a6f:6078:6e71 with SMTP id
 a640c23a62f3a-a7242c2e71emr1024690066b.8.1719495277951; Thu, 27 Jun 2024
 06:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Thu, 27 Jun 2024 21:34:26 +0800
Message-ID: <CALFa7M_W-iFpoCWDUHGzzPa3bAyz_YKBegdOsQLx7ihCsjX4hg@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.6 00/17] Revise Facebook Minerva BMC DTS
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, patrick@stwcx.xyz, 
	joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Thu, Jun 27, 2024 at 2:31=E2=80=AFPM Yang Chen <yangchen.openbmc@gmail.c=
om> wrote:
>
> Revise the Linux device tree entry related to Facebook platform Minerva
> specific device connected to the Aspeed AST2600 BMC.
>
> LORE Link: https://lore.kernel.org/all/20240626130332.929534-1-yangchen.o=
penbmc@gmail.com/
>
> Yang Chen (17):
>   ARM: dts: aspeed: minerva: change the address of tmp75
>   ARM: dts: aspeed: minerva: change aliases for uart
>   ARM: dts: aspeed: minerva: add eeprom on i2c bus
>   ARM: dts: aspeed: minerva: change RTC reference
>   ARM: dts: aspeed: minerva: enable mdio3
>   ARM: dts: aspeed: minerva: remove unused bus and device
>   ARM: dts: aspeed: minerva: Define the LEDs node name
>   ARM: dts: aspeed: minerva: Add adc sensors for fan board
>   ARM: dts: aspeed: minerva: add linename of two pins
>   ARM: dts: aspeed: minerva: enable ehci0 for USB
>   ARM: dts: aspeed: minerva: add tmp75 sensor
>   ARM: dts: aspeed: minerva: add power monitor xdp710
>   ARM: dts: aspeed: minerva: revise sgpio line name
>   ARM: dts: aspeed: minerva: Switch the i2c bus number
>   ARM: dts: aspeed: minerva: remove unused power device
>   ARM: dts: aspeed: minerva: add ltc4287 device
>   ARM: dts: aspeed: minerva: Add spi-gpio
>
>  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
>  1 file changed, 373 insertions(+), 143 deletions(-)
>
> --
> 2.34.1
>

I saw you already submitted this patch series into the Linux of
OpenBMC (https://github.com/openbmc/openbmc/commit/68b26e3f87e305575a6ed220=
2f516ab882358139).
Please ignore this patch series for requesting.
Very appreciate your help :)

Thanks,
Yang Chen
