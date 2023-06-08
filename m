Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00472862D
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 19:19:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcWDB4sWMz3f05
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 03:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=utY4p+tr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=utY4p+tr;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcWCd5Ycbz3dxY
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2023 03:19:08 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so697300f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2023 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686244743; x=1688836743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNugzUbnUGaAkHnSwJAqXfMvdhYeJGsuEVtvafCaCiA=;
        b=utY4p+trqb6KpI9b3CT3nres/41QhVdXEf0ny8J9nh8q55jXPVxqHGlIl6ifN9Imus
         038ytfCghtTLOlwtb3YDTY+1dhOjRZWXmoktNUKsSxfSdd6BecYy4DI4Mqc5EH5ANBym
         iej+dLBVUj9n7Nh74tRuNAfWlkdL8gzFcZCBAPhGNvWrtRTvk8kWgisc+1n4vc2F2T6h
         ycNPaGeW7utLOv7oTKXJ1WPqulEuNcjra5wHAwzuxpYpJ3PmfFtxc0gF5vDpMumJMMnj
         2LBLodDBDPUPR/yx3yoqVBYHICBV9PwBtzz6ezWfAHichPxYcISvYqs09FzcVzqgY04n
         NuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686244743; x=1688836743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNugzUbnUGaAkHnSwJAqXfMvdhYeJGsuEVtvafCaCiA=;
        b=PuCxWOi9dtdMVUq+8jToeiVbgIGMJYMqVl2kNo36Tq4kMgpOjqiV6Is4DaegsUP7h+
         IJUYt1O0sjnHq5WIpNcUAU6pRcDAzUBRZfg/7OnFYALpjdm+9+V1HwtWn2BmdkJvcmwt
         /l2OFK8NX2llKz0r0w2CtP8DUH2ZjzjGqMDQCRqx3nzeoj0lMZftq/qid5J7WD6kfrWr
         H7RGGYmt3a9xLLyR0BHJrb0SV6ZWJKNgwRzg3m7q31MdE/pCsnErjhStyMhZM9Jfcqlb
         JKTm1HTSKFk+dOwJmBptNr+kt/q/AadQpaVeg3lniESj/KrL8I4Tr3ZyPBtG5Zl+BlAm
         z+Ow==
X-Gm-Message-State: AC+VfDz/6+gl8x3Z8IHcwj6NV4kZ00+kVMUpvD8qH1e4HLslFWaRWZxk
	7FfOmIOqMaAsuK5jAsvYUrIlyPk34Gea3SnE7uAuYQ==
X-Google-Smtp-Source: ACHHUZ5bia6cDQWQvW9mwOwgpUN3+binvkgIRnd56huPu2IV5KfoxKuIlulM4yTTLag2Ino/onkDWXt3ofiGJgv+1k0=
X-Received: by 2002:a5d:45c2:0:b0:30a:e5a6:1840 with SMTP id
 b2-20020a5d45c2000000b0030ae5a61840mr2164643wrs.17.1686244743076; Thu, 08 Jun
 2023 10:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com>
 <CAH2-KxDfqpMLpeFkKn8BHkL2e7nwVBR+o3ziDBvw3KJd6fHwsg@mail.gmail.com>
 <CAH2-KxAEay+E=D9scS=2pHb7tOw0Vz5_ZoH_5=Q5o6sJdGE1Jg@mail.gmail.com> <LV2PR12MB60143B8210EC0B427F219528CD4FA@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB60143B8210EC0B427F219528CD4FA@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 8 Jun 2023 10:18:51 -0700
Message-ID: <CAH2-KxA9zOYZH8wyCkktyREPB-HCwtz8yX5ZHexFDBaN6FpZXQ@mail.gmail.com>
Subject: Re: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
To: Rohit Pai <ropai@nvidia.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 3, 2023 at 1:49=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Hello Ed,

The below is all really great data

>
> Thermal metric URI has around 100 sensors and has tight latency perf requ=
irement of 500ms.
> Stats/counter metric URI has around 2500 properties to fetch from the bac=
kend which uses the GetManagedObjects API.
> Time analysis was done on the latency measurement of stats/counter URI as=
 this impacts the latency of thermal metric URI with the current bmcweb sin=
gle threaded nature.

What two queries are you testing with?

>
>
>
> Method 1 - Object Manger call to the backend service, bmcweb handler code=
 processes the response and prepares the required JSON objects.
> a. Backend dbus call turnaround time                                     =
         - 584 ms

This is quite high.  Have you looked at reducing this?  This would
imply that you're doing blocking calls in your backend daemon.

> b. Logic in bmcweb route handler code to prepare response      - 365 ms

This could almost certainly be reduced with some targeted things.  You
didn't answer me on whether you're using TLS in this example, so I'm
going to assume you're not from your numbers.  I would've expected
crypto to be a significant part of your profile.

> c. Total URI latency                                                     =
                          - 1019 ms

a + b !=3D c.  Is the rest the time spent writing to the socket?  What
is the extra time?

>
> Method 2 - Backend populates all the needed properties in a single aggreg=
ate property.
> a. Backend dbus call turnaround time                                     =
         - 161 ms

This is still higher than I would like to see, but in the realm of
what I would expect.

> b. Logic in bmcweb route handler code to prepare response      - 71   ms

I would've expected to see this in single digit ms for a single
property.  Can you profile here and see what's taking so long?

> c. Total URI latency                                                     =
                          - 291 ms
>
> Method 3 - Bmcweb reads all the properties from a file fd. Here goal is t=
o eliminate latency and load coming by using dbus as an IPC for large paylo=
ads.
> a. fd read call in bmcweb                                                =
                     - 64 ms

This is roughly equivalent to the dbus call, so if we figure out where
the bottleneck is in method 1B from the above, we could probably get
this comperable.

> b. JSON objection population from the read file contents             - 96=
 ms

This seems really high.

> c. Total URI latency                                                     =
                           - 254 ms
> The file contents were in JSON format. If we can replace this with effici=
ent data structure which can be used with fd passing, then I think we can f=
urther optimize point b.

In Method 3 you've essentially invented a new internal OpenBMC API.  I
would love to foster discussions of how to handle that, but we need to
treat it holistically in the system, and understand how:
1. The schemas will be managed
2. Concurrency will be managed
3. Blocking will be managed (presumably you did a blocking filesystem
read to get the data)

I'm happy to have those discussions, and the data you have above is
interesting, but any sort of change would require much larger project
buy-in.

> Optimization around CPU bound logic in handler code would certainly help =
the latency of the other requests pending in the queue.

Is it CPU bound or Memory bandwidth bound?  Most of the time I've seen
the latter.  How did you collect the measurements on cpu versus IO
versus memory bound?

>
> I will try the multi-threaded solution put by you in the coming days and =
share the results.
>

Sounds good.  Thanks for the input.
