Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269C29F198
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 17:35:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMWJC2pSszDqKP
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 03:35:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=RxXQNf0J; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMW2Q2FBYzDqbC
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 03:23:08 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id o70so2669076ybc.1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVHbXvcqcxSqVHx+0jlZQLgJDtubQG+U6GMbEQ+iaro=;
 b=RxXQNf0J15pNHaCuFH1EI0yv9F9qskGl8CHn80LHg+zrMdxoNtNVU/8RV6dTDTn7VF
 4cj3s65mRwmD5ydhDCKbHc95izwyPyS1t3drswDaIuM0t8XMRsZyMj9yM4GeTLVQb4Z7
 c4zLmZ40yyL7dIROwTz5NTWmMzSVf9SR11TxzQ4QlnXiTny/hVEo5noBOhdEx1cxxbgi
 EDbUdp098SKKL5FMG8+VtyBrUa109G/RpbWzhVkA3vNJCsi+89/Te2YgAkL7ymxqy83o
 3f3NxpN7AHpdrI6k50nGL9iRBySZZtw6DGQnyTHIgy8IMs4xgF1cmkU7NmB5DVU0D5QM
 Ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVHbXvcqcxSqVHx+0jlZQLgJDtubQG+U6GMbEQ+iaro=;
 b=Bp043te4f17bK1f/zM2GXPHes1Zea0EETll+VoCrqA8LaD8C8FKqQdCnGK9hEy0S3B
 Lp/30XaKUG6QHb7RjxCtiSiP5LVXtiDlwOoFUEAaSIFIOG1sZRMNL0v3gliYfqnVpFYx
 0M8hbkvNOYXg7V5PMqdecGUSlfDMDHk8By+2yVR6rfxpYDFEQvdfD1emKXGqoFHB+mzN
 C36w98TqwTKxgKNGRfVOy34/Ki67QTyW+KViVI1KtCLVlwk0eMwzStNTnCGqbqnUO8fp
 +aOBzUerZTdFt9eaC1BLwss7P9i0qFumUTsxBogCzLACaT0NY0f9yP+v2teCoeG3sUvv
 aOVg==
X-Gm-Message-State: AOAM530f8nXQwsgC1qiIt+32LXMHxYp4h1D0ZWc5YBE28fjk1GOn+vRo
 8ifcHQRcyFUbYDoPioE95uQ0XFfLKxuKqZ/PVpAy1g==
X-Google-Smtp-Source: ABdhPJxvnIcV1nDzo5OX/IEWz7obpx439jMPuT/lcfT7U8lHP+jY+tfaDR4WA8BHeg0lnnJf0+q5weSNU29ErFu0KMA=
X-Received: by 2002:a25:348e:: with SMTP id b136mr7106260yba.203.1603988584863; 
 Thu, 29 Oct 2020 09:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
In-Reply-To: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 29 Oct 2020 09:22:54 -0700
Message-ID: <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
Subject: Re: bmcweb logging
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
> Hi Ed,
>
> I was having issues in getting the logs from bmcweb repo, If I don't
> define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get me
> any logs in journal(not even error log) and if I define the compiler
> flag then it gets too much debug info.

What's your limit for "too much"?

>
> Seems it happens because we have hardcoded the logelevel  and there is
> no way through which we can change except making the change manually in
> the following place.
>
> https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
>
> Suggestion is we can define another compile time flag for log level and
> use that log level at the above line for type of logging , by default
> logging should be enabled with error log level.

Thusfar, we don't really have a definition of what kind of detail
should be included at each log level, nor are we consistent about
setting the log levels.  If it's important to you, and you want to put
together some patches, we certainly could define the log verbosity,
but we'd also have to come up with better definitions for what level
each log needs to take, and be more consistent about it.

IMO, that level of log granularity was never that valuable to debug,
my thought being that if I'm enabling logging I don't care about
performance, so the more logs the better.  When reproducing a failure,
there doesn't tend to be a lot of logging present, and it's easy
enough to find what you want, but maybe you had a different
experience?

Long term, my intent was to just get rid of the various verbosities,
and make logging ON or OFF in the code, and downgrade to a single
macro, but if you see a need, we could certainly go the other
direction.

>
> If there is a need user can play with new compiler flag for more verbose
> logging.

I don't personally see the need, but if it would help you, I don't
think it adds much complexity to do it, and I'd be happy to review
your patches.

>
> Am I missing something in usage of logging infra?
>
> Ratan
>
>


Just to be clear, you're using logging in a debug context, correct?
If we're trying to use this to define an access log, that's a very
different problem space, and the existing logging infrastructure would
be poorly suited for it.
