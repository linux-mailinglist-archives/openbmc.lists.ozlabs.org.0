Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD25754E0E6
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:36:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1qx4b82z3bkG
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:36:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LUFawDm6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LUFawDm6;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1qX44KGz2yL2
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 22:35:50 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id g4so1685216wrh.11
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7/7qZw9XQ/FHjKZ+++V8ZdO/WveaS5DOaagRvVbzcZw=;
        b=LUFawDm68Ytn+MzL/odFf8DKVvQtMAJbYBaPDLTwD9kplxkt8WHLsCLYFYh+jEUKfl
         2b+cJ7nX5yPR62KoulVxmJANFGUWUUg1VzASTxYiz6PNjHU6cBv+/cHnyMqqRtDyMFaw
         wBpd+53Hf1+iyw5cncHtKW18z4iO9H5LovsYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7/7qZw9XQ/FHjKZ+++V8ZdO/WveaS5DOaagRvVbzcZw=;
        b=U9dIQTFt6oll5B6a4S5eYQG7EpjWIAcCxk2LNT5F2Fv5wU6vNpGBJfL0OL5HRWB9mf
         bxMWRmEt2E4PzYVkYwp4/x8Eip/xhWDRl/F8PrwNlBWIu035NbcouGOvvbx+6+wBQjyR
         DrKKdwV9zZLseGGs3ESouEUGqRrdOSX58bZe2V7sP2dtyoCPV5rPMeP0RgSXnix5agkP
         sHvRk1TLByfDMBasLwYhCWRozOPgmSPF9THY8CVn4j/2Tmb1KsWDR8UAv3FPiTJTm/HO
         x6jtboP9206JMuecw/w8na/ZuaBG5VgYL9Rhrbw75ICQEILPDwyFnX9jRfn8eUkN8fm3
         dRww==
X-Gm-Message-State: AJIora/6K52RUL+5t+Tf1tGzmGxZl9ifM9woS4wnsslTBxZtR1qbM0gG
	BfKImRTTergUDyQyMAwkRqPIUhxuN8ABZbLr1Dw=
X-Google-Smtp-Source: AGRyM1v5ww4JKfVxD3KM5LJKnZDaZb+h5Zs5o7eYSFQ6kidd6PDGWF2Jf1ZzGcBMkqGGFWhxq8LDD0DGIEKTkwGkGco=
X-Received: by 2002:a5d:5686:0:b0:217:7da8:8c5a with SMTP id
 f6-20020a5d5686000000b002177da88c5amr4288217wrv.3.1655382942359; Thu, 16 Jun
 2022 05:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220608061455.365123-1-clg@kaod.org> <20220608061455.365123-2-clg@kaod.org>
 <CACPK8XfusuUoFsqhPiUk_KwbG==YOJjgAiEzLbiPEZ_KcPkX-Q@mail.gmail.com>
In-Reply-To: <CACPK8XfusuUoFsqhPiUk_KwbG==YOJjgAiEzLbiPEZ_KcPkX-Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2022 12:35:30 +0000
Message-ID: <CACPK8XesFxZ=Wmf0RSW-DBsLG7i1eu7EzUDyqctqcT=GDyUTDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Remove "spi-flash" compatible
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:19, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 8 Jun 2022 at 06:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > The underlying SoC definitions use compatible "jedec,spi-nor", so does
> > the aspeed SPI driver, this to be in sync with Linux and the latest
> > U-Boot.
>
> > diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tac=
oma.dts
> > index 67b3e3013c6b..a29e7e7fa23a 100755
> > --- a/arch/arm/dts/ast2600-tacoma.dts
> > +++ b/arch/arm/dts/ast2600-tacoma.dts
> > @@ -65,7 +65,6 @@
> >
> >         flash@0 {
> >                 // TODO: what compatible strings should be here?
> > -               compatible =3D "spi-flash", "sst,w25q256";
>
> Thanks. I had a similar version that also removed these todos. I'll
> merge yours and remove the TODOs too.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I have applied these two, thanks.

>
>
> >                 status =3D "okay";
> >                 spi-max-frequency =3D <50000000>;
> >                 spi-tx-bus-width =3D <2>;
