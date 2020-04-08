Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3B1A2534
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 17:32:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y7Z247skzDqCc
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 01:32:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bi5dsQ/k; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y7Sc154kzDqyf
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 01:27:43 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id v2so7132411oto.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uDrui88R6TrXawLpXbPdW4YXBzf92Fj1QPdsWKZeKg4=;
 b=Bi5dsQ/ku3QRRxKuO3F2AKOMi3onLD9b/oor4YwuymNUvfJBWv/ZzPRDR42L5JzXB8
 /mJyWNOrRVMLwEp1+Y6yt0lwvRC9I5T7/yv0HlwcDJV5+cZ+/GRWU0uYQvI7XJ6gFn9G
 LAzPwyyxiJf4tQgAU4c2bjvMlQp+idmg516APC6YxRcelZjXQ+iCQQFQ7fovzCRJOZz2
 5ojNtChl42wxlfr5ALSdKvLbkZkq2gQ1I6FPDsDCvqehYpCgKwDR9iT2Y+PckYwQ0Jnl
 8QTJCmqb/A1YH64a7IJ3DqtLrZywHsWzB2DAsuUc0qS6AwG95vLEvpSYSYZYLYnPN35R
 Vcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uDrui88R6TrXawLpXbPdW4YXBzf92Fj1QPdsWKZeKg4=;
 b=sXgvmaj0kzBwiJpx0et10KoHB7D71Fdt5AP158guYai3F1PPLWEOL/DpN4FCnlt7ie
 TtPez/O7txA57aQC2FjlJSMuLqsklDLMvL4eChl2AL/GGUYXGPmPBqMJE8Ty4g/A7pxT
 mU658p1FYdTuTHFFbkBDBFYoJUbCuXVXBbskrDeJhphkJT4vZpORIQiCbfwgoiPiyjje
 rGhocCyjTZlLOkYMXXzlCOP1KWoWpfrwdx4XGIuSq/sGFQ3PqSa1BZ2sRG5dRAEsZKKN
 EnEwnbO0Z0yOcxDNLjNWUOpDTk86s2k4U5sFAarG4fJeoPLmoC9xgeGsoDWZm9hvPKLf
 HEOg==
X-Gm-Message-State: AGi0PubSGhDGau58vLYqFFhlqCBOW+s0AwpcG6o3kk8Dbi9vIEYeWGcJ
 SdT/b6p6G2tlisBdofsLfH5gAn8/BjU=
X-Google-Smtp-Source: APiQypJqthTvtzjPjR7L1N5LCm2TqxBq71il0wDS3NeQwoKuqXiuHX2/zM0Zm3cvI0XOeZH/LLxIMw==
X-Received: by 2002:a4a:da03:: with SMTP id e3mr6429097oou.4.1586359657571;
 Wed, 08 Apr 2020 08:27:37 -0700 (PDT)
Received: from ?IPv6:2600:1700:19e0:3310:1152:47d0:1eab:b673?
 ([2600:1700:19e0:3310:1152:47d0:1eab:b673])
 by smtp.gmail.com with ESMTPSA id p130sm7006242oig.51.2020.04.08.08.27.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 08:27:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Old PREFERRED_PROVIDERs using python2
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200406215027.GA5368@heinlein.lan.stwcx.xyz>
Date: Wed, 8 Apr 2020 10:27:35 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFC5DB59-9AB5-4469-94F7-73E810ACBD68@gmail.com>
References: <20200406215027.GA5368@heinlein.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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



> On Apr 6, 2020, at 4:50 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> As part of the python2 -> python3 migration I was building a few
> machines to confirm that they did not have python2 installed in any =
way.
> I noticed right off that tiogapass does.
>=20
> Tiogapass has obmc-phosphor-chassisd and obmc-phosphor-flashd pulled =
in,
> which are old python2 applications that aren't suppose to be used
> anymore.  I did some investigation and these are picked up due to
> PREFERRED_PROVIDER values in phosphor-defaults.inc.
>=20
> Are there better PREFERRED_PROVIDERs we should update in
> phosphor-defaults now?
>=20
> PREFERRED_PROVIDER_virtual/obmc-chassis-mgmt and
> PREFERRED_PROVIDER_virtual/obmc-flash-mgmt both seems to be a custom
> package group for most machines.  Can someone with more expertise in
> these subsystems define a better default (or set of packages to make =
up
> that default)?

phosphor-state-manager and phosphor-software-manager? Or should it just
be =E2=80=9Cpackagegroup-obmc-apps=E2=80=9D? I have a feeling we=E2=80=99v=
e moved away from
the original intent of those and there may not be a good mapping.

Most people seem to overload obmc-chassis-mgmt with their machine
layer specific apps.

On a side note, I think I=E2=80=99ve seen people starting to get away =
from the
_virtual stuff as well. The extra level of indirection has alway added a
complexity that never seemed to be worth it.

>=20
> --=20
> Patrick Williams

