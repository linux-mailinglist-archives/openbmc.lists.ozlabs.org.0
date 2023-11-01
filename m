Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D47DE16A
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 14:20:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cZfaJ6h1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL7165DBlz3cTX
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 00:20:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cZfaJ6h1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL70T3Nf0z2yPq
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 00:20:07 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58706a0309dso1584736eaf.1
        for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2023 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698844804; x=1699449604; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+B+yuY4UTn4DdFgX5Heu5b2+m6kVe3mignRrdXUtTE=;
        b=cZfaJ6h1Vru9wbbrMYLdIMOZqQ9qMntDdPuxAh8x62t+cBTDM4mc6wyMrHHu8XUNdX
         Dxymi9MHDogHPqAoby7OxzLH1ScfbvwD4YgkctTIH7XqigJqwdwigxS351HyaiWKigmF
         V5I8f5vbuq5qcR+uBO3zNzPZtT+GsYD/8Cd1BpF/GT37cnUBdh77QqCy7umqumzPZ07Y
         ED8B/umJNNIklewqto9z6pbgYtI3aHon42Uil1ESHFlRkj3UwLorfzb/MRL8f8c6/BPi
         RN8UrEn2cBaFC0M98mim3EriY8ddnt9Cek7wDwhzPFNJ7/lyTNkIHAWULvgIruBLT1TR
         co9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698844804; x=1699449604;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+B+yuY4UTn4DdFgX5Heu5b2+m6kVe3mignRrdXUtTE=;
        b=jI/UiI99YkabTydc6/eMfn7W3sNoU0cKc1cZHzPKfFhduk6M+/EpU+EXctNW8AwRTm
         2qYwO+znhTJSuyVOsfKqT1yJIDmpnupM5AWPt8IMQSGalw25EmOsLp5t635GG+w4/3m1
         njpfouxfv6KAlB7U10m3VnQs63ZeICF4AqaVFWOtAbDiBtyR8SvDDSei3GVZckvVjoEy
         MdEx7m5ZhFYgEXLZqwYu2qfXPi70x7lF/czdbded3QreCluj4/ZW8rVNjUT88hviiVH2
         BtKcOCzwOydjjNily7Mb7mui7pdIsEmHdhJNCaWtLW3W78rwmcZzpJXQkyomnS7wEkvs
         kNgA==
X-Gm-Message-State: AOJu0YyIJLsl5MqadyEYiaTA/LuoABvq4pcyOzasdzZ8QQt0tUP18SO6
	eiC6NC1rDozQ2UgXvy2aFzysad5VyGpS1g==
X-Google-Smtp-Source: AGHT+IHeDSh73ZiRSCL4MOrmBve8Uvv6KfhTdkcFf6uNcAxyCabdy3KKYVhvSTIst42M/hivXv9vmQ==
X-Received: by 2002:a4a:a649:0:b0:582:c8b4:d9df with SMTP id j9-20020a4aa649000000b00582c8b4d9dfmr15119889oom.1.1698844803768;
        Wed, 01 Nov 2023 06:20:03 -0700 (PDT)
Received: from smtpclient.apple ([2806:2f0:96c0:f980:555f:396b:b761:1c4d])
        by smtp.gmail.com with ESMTPSA id f62-20020a4a5841000000b0057aef3cab33sm632792oob.21.2023.11.01.06.20.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Nov 2023 06:20:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: Documentation/Guidance in order to support another hardware
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <PH0PR11MB564243302F521949E3D0477086A0A@PH0PR11MB5642.namprd11.prod.outlook.com>
Date: Wed, 1 Nov 2023 07:19:50 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <445D6672-5358-494E-9163-5B4F91148971@gmail.com>
References: <PH0PR11MB564243302F521949E3D0477086A0A@PH0PR11MB5642.namprd11.prod.outlook.com>
To: Hakim.Cherif@microchip.com
X-Mailer: Apple Mail (2.3731.700.6)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 31, 2023, at 4:40 AM, <Hakim.Cherif@microchip.com> =
<Hakim.Cherif@microchip.com> wrote:
>=20
> Hi OpenBMC team,
>=20
> My name is Hakim and I work at Microchip Technology Inc in the 32-bits =
microprocessors division.
>=20
> I am evaluating how to make OpenBMC support one of our custom =
hardware.=20


Hi Hakim, great to see another company with interest in OpenBMC.

>=20
> I am completely new to OpenBMC and I struggle doing this.=20
>=20
> Would you have any documentation ? Any guidance about how to do so ?=20=



I would start with =
https://github.com/openbmc/docs/tree/master/development to get a feel =
for
how to setup a dev environment and how to build an existing system. =
There is a lot of other
useful documentation to be found in openbmc/docs as well.

OpenBMC also has a YouTube channel out at =
https://www.youtube.com/channel/UC7uaW4PyzmougoMPgh7taOw=20

I find it easiest to just look at recent examples of people adding new =
systems to get a
feel or what needs to be changed to add a new system. Here are a couple =
of examples.

https://gerrit.openbmc.org/q/yosemite4=20
https://gerrit.openbmc.org/q/sbp1=20

>=20
> To give you more details, we already have our own meta-layer that is =
meta-atmel :=20
>=20
> https://github.com/linux4sam/meta-atmel/tree/kirkstone


I=E2=80=99m not sure what we=E2=80=99d do here. We run some scripts =
periodically to import other meta layers
Like meta-openembedded, poky, meta-arm, =E2=80=A6 so in theory we could =
add this too but
It may be better for you to just create what you need directly in =
openbmc under a new=20
meta-microchip directory.

>=20
> I tried to add the recipe-phosphor from meta-phosphor in it. But I =
guess that there should be some customization to do here.=20
>=20
> Any help is welcome here,


Our discord channel is also very active if you run into questions
https://discord.gg/69Km47zH98

- Andrew

