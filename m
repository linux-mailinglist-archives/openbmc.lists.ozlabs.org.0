Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A212C81C2BB
	for <lists+openbmc@lfdr.de>; Fri, 22 Dec 2023 02:28:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UJAnKpM9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sx8nl2Cwjz30N8
	for <lists+openbmc@lfdr.de>; Fri, 22 Dec 2023 12:28:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UJAnKpM9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8nC1fnxz2xl6
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:27:59 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cc5ee69960so15187981fa.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208470; x=1703813270; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbiwt6IU8kOI0izJYNgyXRRGilmtjvoO7sPIgNCgD0Y=;
        b=UJAnKpM9+TN/o53CMZvVrgnn6mPphmcVrNtg9MRdBLfyGmV3UT93rbWmSZqj3H5MhG
         rwUYz9OdZTtc/s2D1DK8mk1PxK2Lwhc9JhOGCpKLGJ7j9jDOfLgghjOJZ8+Y/08JrJyK
         X7dqkKS/T9/bnpowCoJue2Sxb8Za8L4/l0llncxMevEikI1vSTOpkzZToSp5ezl0znJM
         pB2rSMF0aprzg3ZkC1PHXVVN4P8aencGn+vwILtJihCj0PZ4z/urLSJ0fWMcnuoPXr5+
         pi7IUcF0wOi2103dDNDhU94WLU3x5SZ0Egk2ezFiM+v0kwogWRu0qlzxy5bgVOPCsvld
         I9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208470; x=1703813270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbiwt6IU8kOI0izJYNgyXRRGilmtjvoO7sPIgNCgD0Y=;
        b=HPb7GnDDURrmlBybvbd6p264UAJ45oIDJcY4H7jTylRwJGqk/IWwe+vJ+urciKIA2E
         AiAb/Tfex/5b2E9IZqV/rIdgqQcUie1dbrDccep0v+zcofPVE2pMWztKb7SbVkDfNKcG
         JJUL4qKQsxOtRe3ejpxbztu8kouNnEOqB6BhJeS4N9qd7Qp+dLEeLq64zIJSaNGgQVmM
         JZaSW4YoFh1ALTYcQSyej7pglsG13BivhxPXeWziktLhKlOyz5rVahf62JUD/IntHroC
         BLfydYq+Mk84mjyV56qxKdLr4bmBz8UZQh/7O1OauGrrIuTNuUVCEBKRxDBrkKZ6TACT
         yvXQ==
X-Gm-Message-State: AOJu0YxRE+IOzFrGubyo5ZusUtO4aiBPCILpYk/Xc7QEsLsHTijNR0HL
	cqAVtWJkbhtHmrGwTInupxhcd+p+7UhIz2ooOLw=
X-Google-Smtp-Source: AGHT+IGRFK340w+pzPlHUVllDThXR7WV8h/dGJL2cFunQZ3oNcWSX+JYJBEJ24qUE3U0QajRYKvKBv9l8k4Hh3J73GI=
X-Received: by 2002:a2e:6e04:0:b0:2cc:89ef:23f9 with SMTP id
 j4-20020a2e6e04000000b002cc89ef23f9mr142991ljc.17.1703208470239; Thu, 21 Dec
 2023 17:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-4-jim.t90615@gmail.com> <ZXnNRoGmeibdRAwq@smile.fi.intel.com>
 <CAKUZ0+EDdBnPdY828L3DUTHKyXX209cJEuFWBs7xff_6bbDWPg@mail.gmail.com>
In-Reply-To: <CAKUZ0+EDdBnPdY828L3DUTHKyXX209cJEuFWBs7xff_6bbDWPg@mail.gmail.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Fri, 22 Dec 2023 09:27:39 +0800
Message-ID: <CAKUZ0+GhB9m5c-5PtZNM3YrXmXfDRPVH_ZKAPxecF5dQO7Jdcw@mail.gmail.com>
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

Hi  Andy

Thanks for your reply.
The description as below


> > > +     in_port = GPIO_BANK(gpio->nin_sgpio);
> > > +     if (GPIO_BIT(gpio->nin_sgpio) > 0)
> > > +             in_port += 1;
> >
> > This is strange... So, you are telling that offsets start from 1 and not 0?
> >
> > > +     out_port = GPIO_BANK(gpio->nout_sgpio);
> > > +     if (GPIO_BIT(gpio->nout_sgpio) > 0)
> > > +             out_port += 1;
> >
> > Ditto.
> >
> Yes,  if the customer has defined the in/out pins the offsets start from 1.

>Why?

The NPCM_IOXCFG2_PORT  default setting is to enable 0 input port and 0
output port.
The register default value is 0x0. Each port can support 8 pins.
If the register value is 0x31 means enable 3 output ports and 1 input port.
If customer has define nuvoton,input-ngpios  or  nuvoton,output-ngpios
dts property

For example , nuvoton,output-ngpios = <9>
> > > +     out_port = GPIO_BANK(gpio->nout_sgpio);
The out_port value is 1 but one port only supports 8 pins.
> > > +     if (GPIO_BIT(gpio->nout_sgpio) > 0)
> > > +             out_port += 1;
This out_port value is 2, the driver will enable two port to support 9 pins.

Maybe it is my expression error , the out_port and in_port default value is 0.


> The NPCM_IOXCFG2_PORT register is the set number of in/out ports.
> NPCM_IOXCFG2_PORT register define as below:
> 0~3 bit is the number of input ports
> 4~7 bit is the number of output ports
> Each module can support 8 input ports and 8 output ports.

Best regards,
Jim
