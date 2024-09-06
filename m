Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5A96ED03
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 10:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0TG14YDQz3cH2
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 18:01:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725609700;
	cv=none; b=Rfb5g1VWw1ojP60WxYX8WGVKjrxxmBxsWDXQoQjxUdkUVsvs8OrScuWC0n0JhABIUWNW4V/cWvcLmWcOdWIbzdhbHhXUcVIw+OSajLOtxp56x2l+kCys8GUAVncZTiLeL79D9ILd55s4jFmlqGQcsAEn003i3ineqXBIulpwlaiNkU43xlCyo7Vk5D+Xr+Px+WRw5un2KHXBed6sPnZbFSVt6B8Peyf3jGh5f30TZIdrdJC/EhUEV7pkpQvrmhXzccLsrAPVsF0Smi8hyrb82EPxpRCkxrctDBdf7ndWuM756Pp6yNCxNa/Ycvv8fCA9MEWQ7IOsg21Oha3K+dXs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725609700; c=relaxed/relaxed;
	bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=IaHiSh50qRyNx7Op7nMIvQafU6BFoR/SLKn/9h0duiDN3tkIFu5Xi0FWliSqPkU5r3wo8mtgTo6hSu1BxRIhWBX29W5Yh5VOiCNnX5l4uqXc11PewqfXw62UCbnc9LSgXCkVy07KJ+ZJ8wHATHQHBBz8t6hJy8oUYZatVg/wSyK9YVAR/7e2SZA7ZJR7Xgfz2EC1Frp7JvSLZ8qjs4IUOwayo5qf5S2p4pq+HAHITfbY/nbA/OCI6GLH/0YG2QGiIpyegKJe7GoBZ4aJKCukECZxFKprO1MF3jtgE7SH+Auavm98gBSU5ghl6UVaTAyPnhWDL47AaMzALWJ32Fc1Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ObGV0NO2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ObGV0NO2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0TFv1btnz2yN8
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 18:01:37 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a86acbaddb4so222734766b.1
        for <openbmc@lists.ozlabs.org>; Fri, 06 Sep 2024 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725609691; x=1726214491; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
        b=ObGV0NO2va9KIfW6hineW26d4iXA9QItO7hiqpl54e/mGfNtGtCIL6f4P5jkwmlSez
         bKsrku0aTaT/vWvBISb6uXbpZo0i3NaHggjvt4Igqpil0HTMZs2XT4lsLyRNvoVW1L4J
         zgKVPJxWF+Yvijo88dTGQwFdhfMIBMuFKhmv9xp5sl+OM3X2yZGmfzlm2EHKai4QnGWX
         IeCZaADKulaeBiiDiMfIRc74TFY99keq2zRp1YV5vAFWdRGX4gZl4KdMYPUw8xuWlgfu
         vejSH7PMxHGb+FyQ570JHPKqNs+KXy5OgOWnFBAQ02G6H5SOCfo/ruZLZL/x5oSnqK0k
         sJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609691; x=1726214491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
        b=xQcysZz1pGzDhYOTNhYzC7f2anGGktcNS8reCO6mEOGfPTWueoeEei4crOZCbLHdDt
         4q/PILitbesG8d4nAR1cUC9jTXQTlfWh/ew8A4Z02d0mqdFAWbKwM8JB+4kd97RgDdqV
         +KR4pehvtkh7joVWx96qBHOWIhZ7ns+BYDnftawMdlzyHKvXwpQoJLjCdtRMdcmB6bG9
         1+qX62DPMSs2GxqWD1LejX5qcq6FiUraK2O7guGaEP6fbxWLF4F+tgtrApv2nAvzFQEp
         T8p/I9ej39n4TKvE+IWsXqcK+rwgsqmqXQXdj3lLdzt8kxJrrc0oVsePPWOkkOjYO5uD
         3Zyg==
X-Forwarded-Encrypted: i=1; AJvYcCXt1nUTMtdzNWcMlY69acSdqZofYgU8HBcKpcO25sT2v7xjIY+qXIdXDHXA0Zdg2scyZ10H+lwO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgCcUnDfr+8NDZahBke/TT5aJpBygSBTGZJGcWa0y1gCf0eCJI
	SdEx8xi9eaO5uEWypZVNjTsjjwmPJ/15VCtsPIPa5Gs5GYNj77wzzEFkLzvvK8Avm4/D8ji0Skm
	tUgx5WD0bdP6mQeOPwQAetnvybQ==
X-Google-Smtp-Source: AGHT+IFaK/Sc02N/SttRJy/FczDOr34Kkr47PNs58c54+IJo3F577WuXb4byWkb9fTG1oIEjYSvR2h0idCrwUKGTwcE=
X-Received: by 2002:a17:907:2d8e:b0:a7a:b73f:7584 with SMTP id
 a640c23a62f3a-a897f92014bmr1930227866b.34.1725609690498; Fri, 06 Sep 2024
 01:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
In-Reply-To: <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 16:01:18 +0800
Message-ID: <CACD3sJZBqzQg+5gKiDQEpDst0OKPERkF0z6vnfQSHEAhVpPtEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your prompt response and help.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> with the changes we agreed, I merged just this first patch in
> i2c/i2c-host.
>
> Thanks,
> Andi

Have a nice day.

Regards,
Tyrone
