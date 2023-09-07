Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169E797D02
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 21:51:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7QTrxJ6a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhVH811hhz3c5k
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 05:51:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7QTrxJ6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=edtanous@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhVGW3qXsz3c1J
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 05:50:42 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-402be83929eso14952555e9.3
        for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694116235; x=1694721035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCVaK692xF2A8HRA5dhW3C0S6hofWs81F5Hkn7tEnBg=;
        b=7QTrxJ6aA3ZQubYm7eX2ADBOSLdp8JK02tTi0jANicmlp8gCwawSAoqfhZbowY1kms
         vOCMvHfqfSdMcYg1UXpV3m67RyAEXyvxtRaXLQY5LdAA/qw8MhuRYceiTY3JhH7cUUaL
         x9PIItRCec5bH3M31xNWjiZ8eVR88XPgjqP7aTpPvBvVF3/fQ5P9HWjkopf/j1fKmG64
         ix4b3wz3dwnygmRa5fFEZzPWYuCBr54AWra/jbfBCsju0LDlJwo/AHOFDHxduq9DWJMc
         mxOjKgQJYwY/XjIP3b1pYe1QIglxNgjxWor+LL01PtI6ch4HvrL7bsMi28B0C04R7YZA
         g8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694116235; x=1694721035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCVaK692xF2A8HRA5dhW3C0S6hofWs81F5Hkn7tEnBg=;
        b=hiXYXK5duSPjpDNL3+I7g+/Swk92BQ/dAV7Ci7kPlEGJuIwDpu3STjkbC+O979jO0U
         NQ8hAWwi0b5GMrl5gna6fN6yLVVp3hcUSD80JfQ7BTXk/FNpe4C1orNo6klIo60MQK3D
         UkwYBPNIlfPwoxvrrcbMLVnz2fjf6z3VZPPe6KmQ047IS44RpM9zATn6QhRQ4NPA35kT
         PtztfmO+SBHj5yqMYgd0R7ErOM7ONJbqLZCNi9bChv10HMN8U5+Byyi08+9L8MBQvOQC
         X7ym7ysoiOPQL+qjDrmR3fGRlVvyU2xtD0Yl7aWhZveCC3OA+0uIvWvJrnJmWniDMcPV
         S4EQ==
X-Gm-Message-State: AOJu0Yw7+Lo5RLdLgKkQr8NdU2Jadmmyb1CF688hV36Cywhd94cNO6RL
	4oUkcVzKPM9G40Vxov8QPF4bfkWwDCm3KnTERCfgdA==
X-Google-Smtp-Source: AGHT+IHBrlORgHTnKL8hzDlJqA7lGdLkAH8q72pJC+yksgxXNJxfIG7fX+x+2TIvDZ4z4f7bkVRpe4WnG/u5zGMsxwY=
X-Received: by 2002:a5d:5960:0:b0:31c:3136:60af with SMTP id
 e32-20020a5d5960000000b0031c313660afmr299880wri.61.1694116235358; Thu, 07 Sep
 2023 12:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601437AEF8603C553E64CB9CCDEEA@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB601437AEF8603C553E64CB9CCDEEA@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 7 Sep 2023 12:50:24 -0700
Message-ID: <CAH2-KxBomVGsp1hTjiyzz_Fh5adwQW_Tp+3o2B-w-0aqxguBAQ@mail.gmail.com>
Subject: Re: bmcweb multi-threaded solution
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

On Thu, Sep 7, 2023 at 2:36=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Hello All,
>
>
>
> This previous thread captures the motive behind our interest in chasing m=
ulti-threaded solution for bmcweb.
>
> Thanks to Ed for putting up this initial patch. https://gerrit.openbmc.or=
g/c/openbmc/bmcweb/+/63710
>
>
>
> We have been testing this patch in the recent times and I wanted to put a=
 summary of our observations.
>
>
>
> The original patch was not creating any explicit threads and we did not f=
ind boost::asio creating them for us.
>
> So as per this article from boost I modified the patch to create a thread=
 pool and share the same IO context among all threads.
>
> When I tested this change, I found two problems.
>
> Sharing same IO context between multiple threads does not work.
>
> I have logged this issue  https://github.com/chriskohlhoff/asio/issues/13=
53  in boost::asio git hub page with sample code to reproduce the issue.
>
> It would be great if someone else test this sample code and share the res=
ults based on their platform.
>
> Sharing dbus connection across threads is not safe:
>
> when we share same IO context between multiple threads, it=E2=80=99s poss=
ible that the async job posted by one thread, can be picked up by some othe=
r thread.
>
> If thread1 makes crow::connections::systemBus().async_method_call then th=
e response lambda can get executed in thead2=E2=80=99s context.
>
> When thread2 is trying to read from the dbus connection, thread1 can make=
 a new request on the same bus connection as part of handling another URI r=
equest.
>
> Sdbus is not thread safe when connection object is shared between multipl=
e threads which can perform read/write operations.
>
>
>
> IO Context per thread.
>
> Since sharing IO context was not working I took the second approach menti=
oned in this article which is to dedicate IO context per threads.
>
> Major design challenge with this approach is to decide which jobs must be=
 executed in which IO context.
>
> I started with dedicating one thread/IO context to manage all the incomin=
g requests and handling responses back to the clients.
>
> I dedicated another thread/IO context to only manage aggregate URIs which=
 have 1K+ sensors response (MRDs) to populate and does not have tighter lat=
ency requirements.
>
> Our goal is to have faster response on the power/thermal URIs which is se=
rved by the main thread and is not blocked by huge response handling requir=
ed by aggregate URIs which is managed by the secondary thread.
>
> From our previous performance experiments, we had found that JSON respons=
e preparation for 5K+ sensors was taking around 250 to 300ms in bmcweb duri=
ng which power/thermals URIs were blocked.
>
>
>
>      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90          =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
>
>      =E2=94=82MainThread=E2=94=82          =E2=94=82MRD_Handler_Thread=E2=
=94=82
>
>      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98          =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
>
>                 =E2=94=82   asio::post(request)        =E2=94=82
>
>                 =E2=94=82 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80>
>
>                 =E2=94=82                                            =E2=
=94=82
>
>                 =E2=94=82   asio::post(response)     =E2=94=82
>
>                 =E2=94=82 <=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>
>      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90          =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
>
>      =E2=94=82MainThread=E2=94=82          =E2=94=82MRD_Handler_Thread=E2=
=94=82
>
>      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98          =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
>
>
>
> Based on the URI main thread decides to continue to process the request o=
r offload it to the MRD handler thread.
>
> The response received from the MRD thread is returned to the client by th=
e main thread.
>
>                The performance results with the solution are great. We se=
e almost 50% improvement in the performance of power/thermal URIs.
>
>                Here is performance is measured based on worst case latenc=
y seen on power thermal URIs when there are concurrent clients accessing po=
wer/thermal + MRD URIs.
>
>
>
>                However, this solution seems to have some stability issues=
 in the overnight long run tests.
>
> The crash is seen around boost:post APIs in multi-threading context. I ha=
ve logged a different bug in boost::asio to demonstrate this problem. https=
://github.com/chriskohlhoff/asio/issues/1352
>
> I will follow up to check if boost can help us with this fix.
>
>
>
> What I am looking for
>
> Does anyone have any different proposal for sharing IO context between th=
reads which can work our bmc platform?
> Feedback on handling dbus connection between multiple threads in the cont=
ext of bmcweb?
> Is this a good model to dedicate threads based on the use case as we are =
not able to make IO sharing between threads work well?
> Any better way to Post asio jobs across threads and make it stable?
>
>

The above is great, but if you don't post the code you're using, it's
really difficult to provide any input.  Your stability issues could be
simply due to missing locks, or unintended multi-threaded sharing, but
it's hard to know without being able to look at the code you're using.
I would highly recommend building your binary with thread sanitizer.

>
> Thanks
>
> Rohit PAI
>
>
