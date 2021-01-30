Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9E3098A4
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 23:24:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSpfS6JMKzDr3r
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 09:24:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OVyTtj+i; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSpdZ3rVHzDr3r
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 09:23:43 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id s7so9550620wru.5
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2021 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ich1ZiH9rbGCwxA2VOCiwhDz7GtKkys/TR6PEHkxD+Y=;
 b=OVyTtj+i0SFgW3JwOkJAQWQNMMt3OAbLKitB+GXrROhLVys36fe1KMOm6claMiUPLb
 lxjWSoCcoc8akCnjXjiYGBTBq0NVtHkC3v30YLF59OXjpygEnovk8MNt9YtirDCt26HK
 CzbUCxDVp3RGnXg0AxsUOJwOM75sdtTI2RteMSPRKZ23sSqCike5I/Fs5WGZPLSgSBy4
 CVXjF/OnaSjmifE1I+7y213gfGi5BznWnnp6zmanJ5CuOuv0cEe0bTuSHHLskZOxe7af
 dnvEBOhexiGhMruzNS3NZb+KdmNbeKN8WzEVarQ8ujhl/E0NKMFMmELRdFxyYC16Pm1q
 umHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ich1ZiH9rbGCwxA2VOCiwhDz7GtKkys/TR6PEHkxD+Y=;
 b=asd8zDsnRPphixrAyZituoHuWz4eYbPWZ/vKKvZvFVRFWa0OlBi9WuGNeC5aDd3ooa
 ZILX31RpZc6BD3PqexEAjI4Bt0CuinylE/yiSdJ+mdxUwNNRXwPNysVEqP/Tmkx1Wniz
 95WOxqqHVj1KYVIYHy6AnwDSzHFskAR2zmy4e2S+Jd6B9mAnueH8EUmCUd6iuh43zRjA
 NApNpGEU4hkiU9MvcRQ1jRRJG33QhBMDGHouVzFbBmzxmMxEP0Bc30QMjkMqJVCEduGT
 5YbAoi2iF1cgQxTJMsUJgzHe9mDow0+1evFrszq/Q6hA8mOqKa4r5H/mVY4tu+VAHEfZ
 vA7A==
X-Gm-Message-State: AOAM530ct0KjMOF9Xb89BeljDbCQ0oU11GEQF7zM0ba3RZf5RtPe3KR/
 z6m2Rd6SLueT+BMJyN7iw3DPM0rqUFlu/FOsLjNALg==
X-Google-Smtp-Source: ABdhPJzwhkXkZOeZs5tRLMRmQt4AjfBJ5XvwL4B24YoQC7iql6Xop6E+62ZgwI2MyLQ2sG/EljRbiDimiMfGQ2C5MZA=
X-Received: by 2002:adf:e80f:: with SMTP id o15mr11005855wrm.366.1612045418916; 
 Sat, 30 Jan 2021 14:23:38 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
 <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
 <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
 <20210130221921.wiug63hn326miwoh@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210130221921.wiug63hn326miwoh@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Sat, 30 Jan 2021 14:23:27 -0800
Message-ID: <CAH2-KxDuADgU1+hfyLXzvfu5C7Z-rZp73HYDfyCHee01dSirrA@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Brandon Kim <brandonkim@google.com>,
 Ed Tanous <ed@tanous.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 2:19 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Jan 14, 2021 at 03:17:57PM -0800, Brandon Kim wrote:
> >Hi everyone,
> >
> >Wanted to ping this thread to see if there were more concerns on creating
> >an openbmc/google-misc repository.
>
> I finally created this today.  Apologies to the Google team for the long
> delay.
>
> -brad

Awesome; Thanks for getting that done (especially on a Saturday).

-Ed
