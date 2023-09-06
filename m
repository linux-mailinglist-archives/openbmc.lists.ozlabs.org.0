Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76E794217
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 19:37:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BA7+d9o6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgqMl11JWz3bxH
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 03:37:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BA7+d9o6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgqM51rCmz2xq6
	for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2023 03:37:19 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f615afa52so139360f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2023 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1694021832; x=1694626632; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am+DHwYAqLuuz3mCSGGosMmWJN0E+rT8lLeaqvC8Zts=;
        b=BA7+d9o644gE8bFf6kJed9/aSkjqPa2kCxs9MT68QhHq/lGlAZudxak45n3VW/R0Nq
         lr0ZqS0eBWhYPjExBiGgclnqiVx+LtTVE7fFVNR1eS7l5LeiL6wybKUFQuYSTCmabplW
         Q5xofSMKoOQdcmZGb1BDEUdVeC+T+rZ8aVd880mfAHlepynqfmhOdyV6mV/u4z3JfR+2
         vdmZopAdPuUzpPATLCJF2k9ZscqjTqfsLuuonVq73kMXghDK4y+0DfRudd8eZ02TNKkT
         xH9O5uVJky/+/z5u+i1ks4hoEzthrI7lpzLuRYAY2xc4ApFgUYt/vAqXVzVBRW0vPFNX
         B5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694021832; x=1694626632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am+DHwYAqLuuz3mCSGGosMmWJN0E+rT8lLeaqvC8Zts=;
        b=NVwlbhYZHDZXVPLWQnWwMEFxioE4qa3/aiQjD+J0MyfiG5hXQq2qBvw5uBOQmcTJbc
         rUeuzM6sQEFt6TaFBpcKW1Gns4SyGfshxiaW8MR40ikLAEsvaGDa1Ry+SQ8F2koq0hCG
         oLGr/aXyih3FAFwLtryOyC6bOBWTWXQl1/s4a2NKN7sLfjgdMFdC17cxMhEt2VngWKuz
         TWN1g3ukD+8XC2XwEveTq1NDDVLTMvNtuUNNGusMtYaKayl+sC8sWpwEVzsW0fn8yV3u
         LEgfYnSkefVxiYQcabqUuIOM783DdExcAd+WSxSMAwLQc20e2soZLTo8YeACGEmzvaAa
         QtLg==
X-Gm-Message-State: AOJu0YxzgqRjkZmJ8b2OeZ8bbGnbkOfGNhSoN8SEwBKHj6+Uiv9ggGrN
	DwGWKspFow5uCjfo81Y5qeaLicKqOUUoNqP5W4iwCNq8OFg6ZTqfPd8=
X-Google-Smtp-Source: AGHT+IGlgR052FPDJhluju4DvrPHqLtk8N6BcewzbictFG9Lk/5J6SBPl8nGP6YWnqzn0PhDd31+80S/PSX5Sjf8bP4=
X-Received: by 2002:a5d:6e88:0:b0:317:6edb:6138 with SMTP id
 k8-20020a5d6e88000000b003176edb6138mr2684238wrz.62.1694021831358; Wed, 06 Sep
 2023 10:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 6 Sep 2023 10:37:00 -0700
Message-ID: <CACWQX83zYgLvHNjS=uJ2nwNL46NMZ5HoFk1r3Dp=Gqu3r5tF3g@mail.gmail.com>
Subject: Re: TOF elections for 2023H2
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 15, 2023 at 11:37=E2=80=AFAM Patrick Williams <patrick@stwcx.xy=
z> wrote:
>
> Hello everyone,
>
> Like last half[1], I have also run behind schedule in sending out the
> data for the TOF elections this half.
>
> The schedule will be as follows:
>
>    * Aug 15th - Current TOF must publish a list of eligible voting
>                 members.
>    * Sept 1st - Nominations (self or peer) for TOF seats must be sent to
>                 the mailing list.
>    * Sept 1st - Developers disputing membership eligibility must submit
>                 a pettion request to the current TOF.
>    * Sept 7th - Election Begins
>    * Sept 15th - Election concludes
>    * Sept 22nd - TOF will publish election results.
>
> The current election roll-call is available at:
>    https://github.com/openbmc/tof-election/blob/main/2023H2/rollcall.json
>
> For this half, we have 3 seats up for election.  Currently those are
> held by Brad, Ed, and Zev.
>
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.

In the absence of someone volunteering to do it (and therefore not
having a quorum) I can sit on the TOF again for another term, just
know that my time will be limited.

>
> Disagreements with the roll-call (ie. your body of contributions are not
> reflected in our current score system) may be petitions for inclusion
> at https://github.com/openbmc/technical-oversight-forum/issues
>
>
> 1. https://lore.kernel.org/openbmc/Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.=
net/
>
> --
> Patrick Williams
