Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3FB22F3F7
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:38:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFkV572YZzDrqf
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:38:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bjqSFs7Y; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFkRt32J2zDrqf
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 01:36:25 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 133so8963718ybu.7
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qpZR7GnKRetl3j3+jG93FNhV2tfHcs9DEFeWfAgEWs=;
 b=bjqSFs7YcvCbO/HurGnaAYd87aCAwY7OLcURkk0zLUpWnJdBV91c8CynB4TGegi/Ih
 kEwpbH7EjoMhxQHXd5yy7hMkZ7Nyx1tfL4Tk1MpfMOJLdTWellyyUPzjXg75EelLL5Sk
 NeX1HvciYn3/hgq0JaHWhuxIMnwlI4Z3nKyjGvfhvoZ9eC0exIGS0VEd7arh++6Hy/uY
 4WloFBADzRpRP9DNHkgUmnM7UuaRoeRPp1cUV/xiTxALZrtuES4zo9NCeXGJyEcUwyfF
 da+slGeJ01mOtTwDa+TkvMu9Y37myMP2VWqgS4CKwi/FhG+PBMkBpa0keHYo7lVXTkcL
 LXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qpZR7GnKRetl3j3+jG93FNhV2tfHcs9DEFeWfAgEWs=;
 b=Q3ZfDdM5Hgu/600LYtXJKjm0K8HdPCdTgyAiIvUMurSHWcJ2Qh2Fu7awJfyx17cd9O
 SZzz9vARPjPNLxSnVcb19foWm1j/YqxpNbwSTnQJ3xiMleh9zmAtll8P8maXfUzIUqMY
 1gFmy3d4GMMcmlpzJXkoG+WF7yquR2x3u/ICfQQDaGys8mK1rZEI73DsPakkU8ZMxxmK
 0g4inN2EgphZjsSK/lpiEAQw0ilt1wbHwUHswiragNgmnocvCFXUHP5Ug95u0MJmnsVn
 wGXn1qPvec3MGTFGmQBwUiw1a2Dg2NyCZTvnJv4wjpg26KHVnA/Crw7MhMszyPolg37w
 benQ==
X-Gm-Message-State: AOAM532AXR5ehfz5tsvjivvxvwQmCZnj/P7bfD2hJ/zFnt4Ckmcnrt2m
 RZrbnwotFDro1aPJH9He/Wxf2mFmpH57fHyi9Tv40L5o59I=
X-Google-Smtp-Source: ABdhPJwv8XZVemlDrkXTVYXHyPQg0R2pmuSVXsW+URxdeeeX5bhMrKhmpmJQADLttzg40CZ2i4MrLx+Ffct9OO0Seh8=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr31929666ybq.170.1595864180813; 
 Mon, 27 Jul 2020 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <14851.1595795718@localhost>
In-Reply-To: <14851.1595795718@localhost>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 27 Jul 2020 08:36:11 -0700
Message-ID: <CACWQX81hRk+syCoDmhnQRLEZx-usQRbos___vTDOCCBFF7LqVQ@mail.gmail.com>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
To: Michael Richardson <mcr@sandelman.ca>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Like I said in the other thread.  The current behavior is a regression
on what the bmcweb behavior was (and was designed to be).

On Sun, Jul 26, 2020 at 1:37 PM Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>     > Problem:
>     > BMCWeb apparently treats certificates that are either expired or not valid
>     > until a future date as unusable (investigation needed).  And BMCWeb deletes
>     > unusable certificates.  This can confuse the administrator, especially
>     > considering the BMC's time-of-day clock may not be set as expected.
>
>     > Proposal:
>     > What certificate management policy should BMCWeb use?  Here is an initial
>     > proposal:
>     > 1. certificate is perfectly good - Use the certificate.
>
> okay.
>
>     > 2. certificate is good but expired or not yet valid - Use the certificate and
>     > log a warning.
>
> very good.
>
>     > 3. certificate is missing or bad format or algorithm too old - Use another
>     > certificate or self-generate a certificate (and log that action).
>     > In no case should BMCWeb should delete any certificate.
>
> I think that there is a problem in 3.
>
> "certificate is missing" is pretty much unambiguous.

Unfortunately, this ambiguity comes with the territory.  On first
boot, bmcweb has no certificate, and doesn't know the difference
between "missing" and "was never there".  Regardless, to bring up TLS
it needs _some_ certificate, so the original behavior was that it
generated a new one in all cases where the existing one either didn't
exist or couldn't be used.  This also allows people to start bmcweb up
in "developer" mode, by only sending the binary over, and is useful
for doing A/B compares.
(note, an SSLContext can still be created with a certificate with bad
dates or an unknown certificate chain)

> "bad format" depends a bit upon evolution of libraries.

Today this is defined as the above.  "Can we use this certificate file
for starting up an SSL context?"  If the answer is no, we regenerate.
In theory, the only library we rely on for this is OpenSSL, which I
would hope doesn't have a backward incompatible evolution in this
area.

> In particular, a new version of libssl might support some new algorithm, and
> then should the firmware be rolled back, it will "bad format".

In this hypothetical, you're thinking about a new, non x509
certificate file format?  I vote let's cross that bridge when we get
there, as it seems like there's a lot more discussion that would need
to happen around upgrades and downgrades.  Today the assumption we
make is that x509 certificate reading is backward and forward
compatible since the begining of openbmc, which, to my knowledge, it
is.
In this hypothetical, if x509 instituted a backward incompatible
change AND previous OpenBMC instances were unable to read it, bmcweb
would simply generate a new default certificate.  I don't know if
we've instituted a firmware rollback policy for that case, but I'm
guessing it would be possible (but difficult to maintain).

>
> So I suggest that the certificate+keypair is never deleted, but may be renamed.
> I think that we could have a debate about getting telemetry about bad
> certificates back via HTTP.

We can have a discussion, but I suspect a lot of people would be very
against using unencrypted HTTP for this purpose.

>
> I think that there are some operational considerations relating to
> determining root cause that may trump some security issues relating to
> telling bad actors whether they have succeeded in damaging a certificate.
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
>
>
