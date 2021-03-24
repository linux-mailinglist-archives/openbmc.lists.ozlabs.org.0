Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F646348576
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 00:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5PvQ3FHSz30Gr
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 10:43:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JhWVZMnj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JhWVZMnj; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5PvB5Lb2z3035
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 10:43:33 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id x9so422104qto.8
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YZBCSqUYrKchZGdTTqMZpi2OJXCBU05V9ihMz1ffAD8=;
 b=JhWVZMnj5X9LRyhEmGV4rFmahSDiNqkhvW5h7+dMT9wayuojyVmgLuZEXqN92R5cmt
 nRrU7XYipMu4xKHJEBwH2EZt8X2UXCqQsWO1N2GGc7qXWNV2dX8QBoIZenwW4XgbTfpe
 0Q994jk1q3lX1WWIGO15mRSjpJr6ERstJ2e/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YZBCSqUYrKchZGdTTqMZpi2OJXCBU05V9ihMz1ffAD8=;
 b=ThLYOj5Zwc+rZOxFHV16rsMCbJWAHqvFxPeDu0nwNwaS5e6WbVLqvMkZ48j0D44eVo
 4/8jAZm15weEj2uvMhn9MZkfL0nIP8aFgFgpZbH6SEB5eo0gEGFh30Rn5i7ktU/OLUQF
 mQ+tRgpuLiBKNmJZLBvqZ5VvVABshk7L5D/5r8leUgzWB2I6xmO7ePVsq77akhGrwDF2
 GRdrjelMdJekwZBa9LkAQ2wsiV6T6Fb7nLIhdzoHfCPJlxeKDuQKYRcmOoPGGM/SVjsM
 fOTs2LvXqUCz1HS7TyAf+bQZJ16+IW3k3JJ2v07ivHYuLetedWwT/qxiA4kYZp6dIt1P
 bfkg==
X-Gm-Message-State: AOAM532o2R+CPEKdJvFbRtiBgaKJjBcg9g7OTsiwmVlUHiBgyp2yyutI
 CzGUJuo1wrb18Kskhs1fRBMyjIBeaM+SUc/UKNg=
X-Google-Smtp-Source: ABdhPJykDmHFonXxYBYEwP27Ax4TP/iOj/toTtWNjd2rK2Hk6P/kr2k5cg+yxfy2OOBu+da6ZAlnXgSEsVEmKtzq+3o=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr5225912qtd.135.1616629408068; 
 Wed, 24 Mar 2021 16:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
 <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
In-Reply-To: <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Mar 2021 23:43:16 +0000
Message-ID: <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
To: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 at 07:05, vishwanatha subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
>
>
> On 12-Mar-2021, at 6:00 AM, Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 12 Mar 2021 at 00:21, Milton Miller II <miltonm@us.ibm.com> wrote=
:
>
>
>
>
> -----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wr=
ote: -----
>
> To: Eddie James <eajames@linux.ibm.com>
> From: Joel Stanley
> Sent by: "openbmc"
> Date: 03/11/2021 06:09PM
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: [EXTERNAL] Re: [PATCH linux dev-5.10 06/35] ARM: dts:
> aspeed: rainier: Add leds that are off PCA9552
>
> On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com>
> wrote:
>
>
> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>
> These LEDs are on the fans and are connected via a
> pca9551 i2c expander
>
>
> This change doesn't make sense. The pca9551 is an i2c LED expander,
> so
> we don't need to expose the pins as GPIOs and then attach a gpio-leds
> driver to them. We should instead simply configure the pca955x driver
> to drive the LEDs as LEDs.
>
>
> I'll refresh your memory on why we have been doing this in our
> devie trees and then let you consider if this is desired or not.
>
> The led system insistes on creating a compact map (no holes) (as
> does the reset subsystem).
>
> However, this means the relative led number for a pin changes
> as the prior pins change from gpio to led configuration.
>
> For example if pins 2 and 7 are leds, they become leds 0 and 1.
> Changing pin 5 to also be an led means that pin 7 is now led 2
> not led 1 on the led subsystem.
>
>
> Thanks for the rationale reminder.
>
> Are these led numbers important to userspace, or does the renumbering
> affect device tree changes only?
>
>
>
> Here are my technical needs.
> - I need these LEDs associated with names and this __must not__ change
> - I need those LEDs represented as `/sys/class/leds/<$name>`
>
> What can I do :
> - use `leds-gpio` like how it=E2=80=99s done today
>
> OR
>
> - Use =E2=80=9Clabel=E2=80=9D in PCA955X_TYPE_LED
>    - However, putting this label, it results in `/sys/class/leds/pca955x:=
<$label>`. As opposed to `/sys/class/leds/<$label>`.
>
> Is there a way where I can get `/sys/class/leds/<$label>` ?. I did not ge=
t this from the documentation. Seeing pca955x on 100 entries seems a noise

The prefix has been present in the driver since it was introduced in
2008. Is there any reason we can't have userspace ignore the pca955x
prefix?

Cheers,

Joel
