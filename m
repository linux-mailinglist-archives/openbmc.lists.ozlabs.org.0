Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1D4CD552
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 14:39:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K989M2sZwz30F2
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 00:39:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BOf+p0bX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31;
 helo=mail-vs1-xe31.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BOf+p0bX; dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K988v4z2Tz2ybK
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2022 00:39:25 +1100 (AEDT)
Received: by mail-vs1-xe31.google.com with SMTP id v128so4272662vsb.8
 for <openbmc@lists.ozlabs.org>; Fri, 04 Mar 2022 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4cvMl/4qYoB0J9ZtKfUyo3O1j1h4wuQkE/ll5CQ0EvE=;
 b=BOf+p0bXU0//OteVvJrqjfh2RxAMmJA0rI4mRyPA1+kD9F9k8jQUQKx9UUVW4JcAn0
 R+u5HF9s+ires93EjvMO0Pxu2gO29z5cyOkS9RH69rN9sM7V7ndD0oBV7jQJaxKD79qk
 vht7crtzrG+E20IUp79ds32p22VqMC/JSjiZj9U95mvGXdENjqYRxoytgXKQj9o68r0p
 CeVfwkZ+svIlIELuLKPyG7LcqOdY+k7xJWPfJXF7QaWZF4WEl2T7zUtEa5fFDYkuI05O
 SorVG79DepqQgC7qfq0LRF3X6NqSZGQVk9HS1Zizx2gd2NlYnkJIAjHtV1rYqihNfPLx
 rvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4cvMl/4qYoB0J9ZtKfUyo3O1j1h4wuQkE/ll5CQ0EvE=;
 b=SDbactZbnOuVR7Qq0RWyAZF+tmd+3bPdvbVRQDeae3yj+r35xYjnuF7BPNGSDj+7wD
 ZWiWR63Tku+ddkIqI+5Ifp4ZbCF/Yel6u9rm7cgeOkpFOPDrLmL05VTt0nlh/6H0ml2f
 LYuhZ3Dh/KUMa3hYcigwSXK9XhM8UluwEYNFtmi+hldMaS7j1zY4RCM74RvrcdQn8DoM
 QPaWmu0rqMOnqPiWigFNDvFn/nD6RnbqOxSsFJ6GXSY7qlUpFxokIAYq8gsFuywzPObF
 mULgirCZd/twWT4c3NLO4+PrbCofluUwirIKlSWbEzZraYkSMO4OpM4ATIgjEeV+ROLd
 5kYg==
X-Gm-Message-State: AOAM532YuH7II2ntCiveFptxr+kMjwjbClaC7RWUPwAu4sXIOS44iPb/
 XErE+sp0G7hb2ECk1CUo+pDQvJOU1GR76pcAlA==
X-Google-Smtp-Source: ABdhPJylHP1GmLWtcK6ibGHJi6U7Q9Nprg9MNaWs6QPNI9/RlRS8QJn5WasxlxNnf9ODDDxRXY2eEnX+GKY0yoC59SA=
X-Received: by 2002:a05:6102:6d4:b0:320:7cd0:a5e3 with SMTP id
 m20-20020a05610206d400b003207cd0a5e3mr1575595vsg.84.1646401162809; Fri, 04
 Mar 2022 05:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-4-warp5tw@gmail.com>
 <YiCYshb354S9T5ev@smile.fi.intel.com>
In-Reply-To: <YiCYshb354S9T5ev@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Mar 2022 21:39:11 +0800
Message-ID: <CACD3sJZQJFvgNT2da+1Zx0UugoMRWNw4np3Ub3PTKejjS7X0Sg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comment and it'll be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
3=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Thu, Mar 03, 2022 at 04:31:33PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Fix i2c client address by left-shifting 1 bit before
> > applying it to the data register.
>
> ...
>
> > -     bus->dest_addr =3D slave_addr;
> > +     bus->dest_addr =3D slave_addr << 1;
>
> 1. Why this is not using i2c_8bit_addr_from_msg() helper?
> 2. This is duplication of what npcm_i2c_master_start_xmit() does.
>
> Taking 2 into account, what is this exactly fixing?
> Sounds like a red herring.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best regards,
Tyrone
