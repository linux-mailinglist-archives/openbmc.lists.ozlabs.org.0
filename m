Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B449C857
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 12:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkLcb2NtNz3bPP
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 22:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UOfSHWRf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UOfSHWRf; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkLcD32mMz2xs1
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 22:10:34 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id a28so32208925lfl.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 03:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pul1RHy37q5YcMdtGcSuiiDpeNqbvXWE891GCKL1cP0=;
 b=UOfSHWRf63ojZTCeKD4SmneDvf0b+PNe6blaOALSQB+ujaC+V14a/6q3HKiFXtcXyg
 omDF0+AomuLhWwgV5B9lJHKCHZKX9Ejgwbaz+5UVzqcoIp0qM8HFMAL95LCHAIMaA9/a
 u3cb9eVU+gr2sy1Pebaq3cyeoOaqjNCqdMNCb78K6eIT6sYqM3Q3pHj5dzbOzxn/t57d
 pm+6gWbTqDVTD3cxrO9gLV6adGupiGWaRzwblK+0Ot0W0O9iThfNRVcjlfqrkNJ5/WkC
 jATZyGRP5fnSJyxQnPoNzPgaFd89o+GYqZ9TrnQkOekPQUrrRKQnaedCsJp4+i+POO9P
 l3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pul1RHy37q5YcMdtGcSuiiDpeNqbvXWE891GCKL1cP0=;
 b=dFKjj+Wdk09ZBDT0eXgvT5zKDkM2zRJuI2T3viMN12+/a8g6rXWIFK9qAZ1FpXJ9Nv
 6x8Vab2srMNEGubNm/NrDtoQQVdAfT1bChIJZKnFMdZPTqlXJa2w8WMdJwM3NaS2jWvw
 zylvd6BSz8mICq8g8gj+EVvaibyywZyl1RTzCTKl+2oJOGaVtq3nqL+dArntUF6TmqMB
 rwOf7GBgmm8kUXrztfcFmccy/7CjXxU+fwkY4WBHcwO2OLQnk6EWlye+kUyX4pmSFsGF
 jX5MnQ4ysyIoKs3zf4ripOztz6ebyl/xGPwb3uFcKJVXPMaoRbdvJ+o9v6MPxOfqZTmb
 Kfpw==
X-Gm-Message-State: AOAM531MDeO0ew1nEHzgA6m1zyNNQcpieBGx0de8Ha5KTcjU8kqcz+nZ
 fZji2Frlz1bYxGQ0Wx9R2sksxnCf2VfIvZFJHL/M0YGltJk=
X-Google-Smtp-Source: ABdhPJz78d8vMWO7L5xQsHILnqPgwoTkw+px5WVfXQPw1C32ijcdrTimdAiSR99tTB5tJFdvaYru0WBN38FWuXDlKJE=
X-Received: by 2002:a05:6512:390e:: with SMTP id
 a14mr19648910lfu.585.1643195429299; 
 Wed, 26 Jan 2022 03:10:29 -0800 (PST)
MIME-Version: 1.0
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
 <CAH2-KxBAxkZps=+Sy1xZCD=+D2bzMATd58tUEnzAH5ZBXPhZ3w@mail.gmail.com>
In-Reply-To: <CAH2-KxBAxkZps=+Sy1xZCD=+D2bzMATd58tUEnzAH5ZBXPhZ3w@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Jan 2022 19:10:26 +0800
Message-ID: <CAARXrtnn5yCC=PMsmPs-YxDRia4S2+-zFwNm8XYFO3TSGmTuAw@mail.gmail.com>
Subject: Re: TOF Nominations
To: OpenBMC List <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 25, 2022 at 3:57 AM Ed Tanous <edtanous@google.com> wrote:
>
> On Fri, Jan 14, 2022 at 2:31 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
> > > On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
> >
> > > > * Jan 30th: Nominations (self or peer) for TOF seats must be sent to the mailing
> > > >             list.
> >
>
> I'd like to nominate William Kennington to be on the TOF.  He has been
> a long time contributor to the project with commits going all the way
> back to January 2018 [1].  He has hundreds of patches landed on
> master, and maintains a combination core libraries and
> end-applications, and has a long history of both significant
> improvements and cleanups.  This round of voting shows he's 1 of 12
> "highly productive" members in terms of participation scoring [2].  I
> think he would be a great addition to the TOF.
>
> [1] https://gerrit.openbmc-project.xyz/q/owner:wak%2540google.com
> [2] https://github.com/openbmc/tof-election/blob/c50f5beea2be92806cebad57486474c7dabecef2/2022H1/rollcall.json#L85

I would like to nominate Joel Stanley to be on the TOF.
He has been well known as the maintainer of the OpenBMC Linux Kernel
tree for years and I guess everyone who works in kernel/u-boot/qemu
knows him.
I think he would be a great member of the TOF.
