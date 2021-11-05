Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47935445F15
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 05:19:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlnMC1N2Qz2ymr
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 15:19:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HmAcDFKR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=HmAcDFKR; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlnLq3HXcz2xvf
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 15:18:41 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id d21so16218114lfg.7
 for <openbmc@lists.ozlabs.org>; Thu, 04 Nov 2021 21:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLNZnT5Cwz48PNpb55zcr7vf+Z/Yf2eiwL6HMzNuu7M=;
 b=HmAcDFKRgJLsk9d7j+BfqlC0wDjiMi9UuXpJpnGNN6ElHEMV58Rq4qXRl4ERrQ8J+w
 OYhzC3RhAiugSETPmhCqoe5WcIZVtKpGB3/bvc47+J0uy4vRhumKDwcM9iqpqHI2EYNz
 q62yUZn7dq3fNKK77Ui3e9Ve8cOaYfywoyXylj7ujwkWX0aQjLpWShXweA1/PvclzrSg
 jlcAFQphD2sk9IoZ4bOFtQLJPKm50Z6XHp4hkLfmZjSoz2YAMy9mjauM35ziMZMA0tm4
 NjhBuRkl4HlwY2cfGqAhU3UlA5VHdCW4cPVcMaRp49Mz76rupHmY0MKht3E/Fv/64l/L
 pLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLNZnT5Cwz48PNpb55zcr7vf+Z/Yf2eiwL6HMzNuu7M=;
 b=22quxLkuJ9Lf3nPqioQlfulnXrSbg6HrUZ3kVtq9oXf4Zqy08dF76W1SE70wB1I0/v
 6VywiBa41apneQ42TMbk3RbGlqisp16it5d8SPwhfx9zdtbIOvGCBQm85oXqpeBHz251
 WfqS3HtB7/GKm4wsfgSdPbEgaDxF7y4UzrESf5tmLBjNrHAKUS2mWCfI5cLBXDLUV3Ff
 yuTasP5IizsTpDyLgC11gc4OxvvBqtRD8ZtbwOEdy6limb5r8m9zh0tmCwBMeh+nUZ0g
 kK5M1t+pYLUZznAeOE+99z7n/mF0BaQhdICffJ2zxlSNhHh9XgYjUvrchbMhWgtou7si
 k6pA==
X-Gm-Message-State: AOAM5306NW5VgVYvxFiAGcOc6JM6hOzvKXvqoceshHzIZzbgklYQv13Z
 J4YwmR520IzEJRe/JXk72hIFYfwjRrOt2/o2HH1zx1Hefd8=
X-Google-Smtp-Source: ABdhPJyuV8QjUU2psRH2bAjF/ss2K6HhESuK5eMMgPBhJ7SzSZQdy/imYF3my3C6UqsAS3wOD4DLdiIMmb5PavRitVA=
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr49663950lfr.635.1636085916706; 
 Thu, 04 Nov 2021 21:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
 <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
 <CABoTLcRoC7aQ1e0V3FMbmRgvuMafib0qUHOuYZkORFOooGSYcQ@mail.gmail.com>
 <CACPK8XfRJ--eXpZeC1TPbC+5cwVNQeSUjA8w-dvM-ABGpu3t7g@mail.gmail.com>
In-Reply-To: <CACPK8XfRJ--eXpZeC1TPbC+5cwVNQeSUjA8w-dvM-ABGpu3t7g@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 5 Nov 2021 00:18:20 -0400
Message-ID: <CABoTLcRbdSk1WMDc4mfLHnZW1T0ccBUE-DNsRTonOzbtxKaXMg@mail.gmail.com>
Subject: Re: Cherry-picking 5.16 commits into OpenBMC Linux?
To: Joel Stanley <joel@jms.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel

> > I sent https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48632
>
> I normally do this, but you're welcome to do it too. I'll merge your
> device tree update now, and if you could then update your bump to
> include that commit I'll +2 it.
Done. Thank you!

> I have a slightly horrible script that does the work for me.
I created the commit message manually this time. I hope I didn't get
the order backwards :-)

Oskar.
