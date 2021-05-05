Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF937474D
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 19:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb4961fCVz301J
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 03:54:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=QeOwGW/c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QeOwGW/c; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb48q5mLHz2yyl
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 03:54:18 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id r13so1674863qvm.7
 for <openbmc@lists.ozlabs.org>; Wed, 05 May 2021 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dv8x+98iTnyntCEN3JvGhXYwmHKUaTeuEvwH0V9/zA4=;
 b=QeOwGW/coBkCzRXioz8QSjhbL5wkP2KrxqLew1DNwlsrwbkDjzoBzeex3aIoRBzhFF
 wCFqhgjmsfbd2ZrD5iOlebkUcZnpcY3rKV8RofyBH6PO4uhCKKrL6le5jJol4Z1Hj6er
 oIjQzL3T/jnVMx82BbnqY46BUkt03dtCAiRXZN3RXJh7l6I5kxMAZvSgAeWuynupcWQ5
 Ne/2TaWPlxw05kE9pdYCKZJDD4oUiPYGBE6RwF1+e9yeyDyNPWnMHfMZIlH/DFXBaAhu
 bVMijDC/YVIAUzLJOZfAMHJc/jjYeSgWK8GXYMiRpGvWu7mA5g/3BkxZB8TmOGEI7Q5Y
 CpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dv8x+98iTnyntCEN3JvGhXYwmHKUaTeuEvwH0V9/zA4=;
 b=RG3JRIFtsy+6JfQXxC8BNbnxt2wwYE3ZUj/wigcIc5chRIIVRrQaU+j6vYbd1go825
 yBOiOXjORvQLXB14v7KOvz9OCbvUc/jZ8WvfpnBL+HHMoDDvGB7BdeP6ay8AU0mPXhIi
 zDBWhH45/hSi7ZxkllWVjKs/9dq+dEjvTbSgnTLmUMHgfBTrNDpjANL8LeYjZOJ1TuVI
 fM/06Umijc3QqxJQA28Jc6oTh7GjAUHbcddr8VbqBTgjMkG2Vh1hDvg4tjRor6vLQNUt
 +HaNrw34qxwdd+bMi+aKpbgCw2zxBt1wLOVtfJs2/JDvEpG+/uUud6uO1mOGY5P8zUAK
 uS8Q==
X-Gm-Message-State: AOAM531w8s+k79Q/4cENAZDkMP+7/pgqsQBrS6KCqk9RBpL8paM1rOcE
 0tgQSdv1jwmARwOK+1Q6GxXVJBHOu+5q2tmVnfIppQ==
X-Google-Smtp-Source: ABdhPJwsNaADC1jpMx3RUoj1CLoJyYM4x0NqYUsPR5Rvr0BMTGPy76F68ZDFO6Kga+HTPsVJIRYPxzqSYkf/xI1Cj44=
X-Received: by 2002:ad4:4baf:: with SMTP id i15mr5220363qvw.21.1620237253487; 
 Wed, 05 May 2021 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
In-Reply-To: <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 5 May 2021 10:54:02 -0700
Message-ID: <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
Subject: Re: CI build for quanta/gbs
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: Brandon Kim <brandonkim@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 5, 2021 at 6:25 AM Andrew Geissler <geissonator@gmail.com> wrot=
e:
>
>
>
> > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <=
George.Hung@quantatw.com> wrote:
> >
> > Hi Andrew Geissler,
> >
> > We have ported many OpenBMC features to quanta/gbs machine (Nuvoton BMC=
 platform) and hope it could be added to CI build, could you help add quant=
a/gbs machine to CI build verification ? (I'm not familiar with this, if th=
ere's anything we need to do first, please let us know)
>
> Hey George,
>
> Getting a new system into CI doesn=E2=80=99t have the most defined proces=
s but
> I think in general it has to fall under one of these due to our constrain=
ts
> in compute power for CI:
>
> 1) Propose an existing system in CI to replace (and the benefits of that)
> 2) Donate a jenkins compute node to openbmc CI
> 3) Convince the community that your system provides additional meta-*
>     layer coverage (or some other critical benefit) that would be worth
>     the additional hit to the existing CI infrastructure.
>
> We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make sen=
se to replace
> it with this new =E2=80=9Cgbs=E2=80=9D machine?

Jumping on this thread to say that I'm hoping to have quanta-gbs
support in upstream qemu shortly --- so we could also enable this as a
Qemu CI machine.

>
>
> >
> >
> > Thanks a lot.
> >
> > Best Regards
> > George Hung
> >
>
