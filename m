Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EB544D19
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 15:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJktJ59Jxz3bpJ
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 23:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AvOl4xBJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AvOl4xBJ;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJksv27CZz3bmJ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 23:08:03 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id r82so41618557ybc.13
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Gfktszpwr3FPrB93OMpoU20SlFs9qNN/2hDsqmlef5k=;
        b=AvOl4xBJ6PnwNdqiF2CKMUAGTcWvqboIOllVEQ5C9KnjMuMolhKVFOT56tSfI4Lros
         e5iFVGtxosHS8uzp2SM1qfNWqqvxfH7CG2ROKj5f0X1yL2or3MsbsHjFhn0e9Wlv5/Jf
         /zbtE2t4beFBLcZxEuFuV/PYmkPLjVtd3Nbt46j4BACWUpws35POMp+bmWZgyo9ShLjr
         eWtF6eB1mMOMHdyc5f+27IhzVEn/3w8gYU9qJLJ1NAQY6fN0Z58l04GZ+eXFug+LZSX8
         SiFACc6u5T3ahUq6m03kIUZ7G1w81czG2RkCNhi/dnuB9h+OaN4EKcRL7s9IjO57wcIf
         r4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Gfktszpwr3FPrB93OMpoU20SlFs9qNN/2hDsqmlef5k=;
        b=5EBLJMYStNyqrO1NqTIPgCtI9fl34/xw/oVlS38WKkLz/OlCHLrStvo/kZpFEybano
         yJxu6gmf3quw02Age1xYcydwOJM1L6wWDV1BWJ1VPk1ewaLHdL6IOylQ5Fn+HF7aK8Nz
         8gxNxU7riK3yipYREWZBclF6OPgBssYefrJVfpqKmzF6SV7CySz5tyi1idLZ40StdRA1
         iks4P7/B601bDnA5r/vXuYv+kphL2Ku8kJScTlHrR0W1g+9Rnay9MMgUvRIJX8ejnApr
         2QvgbcmucvvlMNWexmiThd86JDeSmhz3+2xRDGqbJ3P5b/LB/SQmhHIZCL9seP6PTr5V
         ejJg==
X-Gm-Message-State: AOAM5321fczwTm2uGqx0xJZ9wyaAFQWDGNfEYMF+HHtOqqTUBBYXvZU0
	G+iUw95rJYbTR/gH9jcCrY3Qd27p2LDSbCqvSw==
X-Google-Smtp-Source: ABdhPJxKIWoo2Bn5OL7cz4byjE9SyenNt+2UbaGDu6sWH+o+y9J0RqD6ys/c9I1Gax4iquiL4SI9x2tvzNZDOZ5Is+Q=
X-Received: by 2002:a05:6902:84:b0:63d:4a3d:eb5 with SMTP id
 h4-20020a056902008400b0063d4a3d0eb5mr39339883ybs.145.1654780079760; Thu, 09
 Jun 2022 06:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-6-warp5tw@gmail.com>
 <YqEArxDJoUoPeiGY@kunai>
In-Reply-To: <YqEArxDJoUoPeiGY@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 9 Jun 2022 21:07:49 +0800
Message-ID: <CACD3sJaHwh2uvdrFYwRB84ZM94S7iGW9oFhWb6GrYGkNAU6K9g@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] i2c: npcm: Capitalize the one-line comment
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, jsd@semihalf.com, 
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your review and comments for this whole patch set.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:41AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Make the one-line comments capital in the driver to get the comment sty=
le
> > consistent.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
