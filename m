Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3026337E
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 19:05:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmpKr5qf3zDqDK
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 03:05:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RXYxld8L; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmpDS1b9XzDqbk
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 03:00:23 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id m17so3969572ioo.1
 for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2020 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TfvYyvLTHu8KDE3i7wuhT1WY00f1Dp02TW1Mqrw8AMU=;
 b=RXYxld8LjfGAZ28zGSnmrlRBl6ZKcZQXM9/XKila/AqwnKCBfZ35Iiow+lBb7ejgN7
 27fGAzAgH8977C+ltTIS7HCYl5xxUwxYIoE0Nn35RMrNDN3BPyG1Amk2Mh/eB8pmrqL2
 Nzba/tfoL3k9ehTwUKX7udZJpfEjnqGOjJ4jaLfN2WbWTx8FHWND4e+YbI/mbxL5opxB
 n72Id5anjcJuXufRfc/mXCHLY8bT+++Tkt2/uDEn55y+H0lLYI4uRSDWUvO/T+REMomB
 rKWALX28Pd0/lUbRMOdsWj89Mz2yhO54j5zY20k+YJyvazpoPzQlS/L9HjES5rhIL/fR
 II5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfvYyvLTHu8KDE3i7wuhT1WY00f1Dp02TW1Mqrw8AMU=;
 b=CjZSbeX8rhVWN9HTQyUdJPAsB5LedVuqc8DtnG0dcKrGqs5GjUyrbO+hOwv8jQktrT
 S3x3hJw5lm4P6/5rDzGBAQ4zaI2kuxOrNXDH9JtHWuKIfPBlBseMKG6OmqmVU+mtAL/s
 FoyagWfM681pRh4lO4lCVHhXTNZPwB0QZs9bHGPgxsq9YbYf0pW6DiF3ZEW6eVlltm52
 PfFNLIisl7Ep5jv5Uyqqb7mtNeaUPqBDU+wkDag+2dGesT7Src1c1RTQSnFNVDx5xw1k
 iACH792RXEAe0BAScJ2+6Js10TwOENsGm7LHPXqDontLt02z7xvAqIp4MXUgGNnDB9Mp
 /tzQ==
X-Gm-Message-State: AOAM530nDPC3fntVpQ93QI82RXhL2D+RHdBUjYrQp2gOCaJKraL+yvbO
 GTTPNbmNfLmX1m8/Wa6cS2MXJFgknuyFuQMNdeu7rw==
X-Google-Smtp-Source: ABdhPJw4cXQ46ZK7xLt+XuQVQP47EjCYjaTPfYp8yd6T2S+reOMZ8qMY2SCWRkdTF/rMeWTXg99KLN+gEugSk2npWgs=
X-Received: by 2002:a6b:8b52:: with SMTP id n79mr4042870iod.122.1599670818534; 
 Wed, 09 Sep 2020 10:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <FA2BA7DD-2DD5-4CCD-927B-310AB5B56C64@fii-na.com>
 <CADKL2t5z_ZcgN1jKChungKgNuRJs4JRQtaqa3DeKX-DQtYPGRA@mail.gmail.com>
 <20200909151339.ronsxrtvij4mu4fe@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20200909151339.ronsxrtvij4mu4fe@thinkpad.dyn.fuzziesquirrel.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 9 Sep 2020 09:59:41 -0700
Message-ID: <CADKL2t4OpijCm=tNG3_Rt3pA40wvBJ=_cFk5Tgz3QTnfQgnoJQ@mail.gmail.com>
Subject: Re: New meta-layer request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Sep 2020 at 08:13, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Sep 03, 2020 at 04:18:09PM -0700, Benjamin Fair wrote:
> >On Mon, 31 Aug 2020 at 15:40, Lancelot Kao <lancelot.cy.kao@fii-na.com> wrote:
> >>
> >> Hi, Pioneer
> >>
> >>                 I come from Fii crops as a subgroup of Foxconn. We are using the openBMC to develop our openBMC with the Ampere & Nuvoton solution.
> >>
> >>                 So, we need to create a new meta-layer for us. I am told there is someone who may help us to create the meta-layer for us. The below is the information needs to create meta-layer.
> >>
> >>                 Name : meta-fii
> >>
> >>                 Maintainers :
> >>
> >> Lancelot.kao@fii-usa.com
> >> Neil.chen@fii-usa.com
> >> vveerach@google.com
> >> benjaminfair@google.com
> >>
> >>
> >>
> >>                 If I miss anything, please let me know.
> >>
> >>
> >>
> >> --
> >>
> >> Best Regards.
> >>
> >> Lancelot Kao
> >>
> >> CABG/CESBG
> >> TW : +886-2-2268-3466 #3766
> >>
> >> US : +1-281-655-2668
> >> e-mail : lancelot.cy.kao@fii-na.com
> >>
> >
> >Hi Brad,
> >
> >Can you help create the repo for meta-fii as described above?
> >
> >Thanks,
> >Benjamin
>
> Lancelot, Ben - sorry about the delay.  meta-fii has been created.
>
> -brad

Thanks so much!
