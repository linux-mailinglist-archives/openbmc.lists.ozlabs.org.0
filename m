Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1562398E65
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 17:19:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwCPb6W3vz306k
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 01:19:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Omrw6MEc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Omrw6MEc; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwCPL4TFHz2xb2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 01:19:34 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id f17so1552261wmf.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wb890aMD7QrSQfJCebhEJ1MFeFFN55U7id/XxBcDjtA=;
 b=Omrw6MEcLYP7KxAHGKEmHmYHoY+a3RggGkMVo6FN8aym1Ggz5nOAv2MyNT0h3SV6TK
 J/9ebr+GIomFsgAZFy5F2TvfFQvhCTw8deBBZGJlxRgYku1Mf4n1egHOsYBwWroCkr9K
 1trAOBdP8iNpL7yVW1w94iV80vXCEEuy2tNcXqBhs4oirCshtrPfvgZKO5l9unccGRCW
 jI47T+1gH7sjgNKCwbW+GXO8WtwgIalIK9SxmrOnp23j4CD/HkNGwxTxJLdzWnYyMj+r
 Z5mtnpg4nzBOEDvW3hMjYytoAb9FaN99yh7mSpubdl26VQJCLeIMb6L2g70eV2DH7yfB
 yb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wb890aMD7QrSQfJCebhEJ1MFeFFN55U7id/XxBcDjtA=;
 b=CZL9th98cpHVeyAWABSQXWhyGNib0XaJdR4oz9ZzhS8OV3JRMabe2PrtniIKa7Mgha
 6ECpF4q1CO2cFJeKpWFkmNQTg31N5g7lkH1jihu/1T1uRaohZMk3l5kK0yzwrBU+ScZ5
 HEqQ37WVT1H/1eEVfmORWyMaraA2ERVDldZA92pFWQlrAeUmRRzt196KvGpzwxVd9+F1
 awlCC1ERvZl/9dSBWO7Z9JkMn/jTb9rnsZ/fezSR6DJA11ajH75YEcY2aZfJOT4/GBXm
 IHqeyQ3IS1pF+3t2SsOx9Aa5bmBeYBKHmI/irDLhI8gX6/cpncGyOyXbrkbvAwCqtP8T
 vIYQ==
X-Gm-Message-State: AOAM532orrVMpNrn56kIvEROT9ITaYQskYsjSjv14ebGVawQmvHnMzZA
 Up0pCYYL9bqdI5A0xZqTCTO8S+OEpKiXzWDg3jmflw==
X-Google-Smtp-Source: ABdhPJwopMYk4jxnFuuV6HwAndlcUv9ZyptelWaQ0JoBZ2jua635ApOdSYOu+Ahv2jsR6bg34mO85no8k1QBBHqY3GM=
X-Received: by 2002:a1c:453:: with SMTP id 80mr4046428wme.171.1622647170612;
 Wed, 02 Jun 2021 08:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
 <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
 <YK+XA0umnkj1EveY@heinlein>
 <dba5a6b8-3873-422b-a36a-32b39b2d560b@linux.ibm.com>
 <84217f2a-8351-48e9-964c-de34f4496c67@www.fastmail.com>
In-Reply-To: <84217f2a-8351-48e9-964c-de34f4496c67@www.fastmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 08:19:23 -0700
Message-ID: <CAH2-KxDTVo9oB_r0w=CSMatt0Pniq-pp4=Ps9Gs8LA04mdBafA@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday May 26 - results
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 8:10 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 28 May 2021, at 00:34, Joseph Reynolds wrote:
> > On 5/27/21 7:56 AM, Patrick Williams wrote:
> > > On Wed, May 26, 2021 at 01:59:57PM -0500, Joseph Reynolds wrote:
> > >> On 5/26/21 8:43 AM, Joseph Reynolds wrote:
> > >
> > >>> 1. Followup from last meeting re uboot, kexec, sysrq-trigger on ARM
> > >>> architecture.
> > >> We re-hashed the discussion, added new information, and added new concerns.
> > > Could you paste the minutes here when you reply to these?  It is kind of
> > > hard to have any discussion with the rest of the community when you have
> > > 2-3 levels of indirection to get at the words.
> >
> > Thanks for your email!
> >
> > Yes, I've waffled between cut/paste of the minutes and summarizing
> > them.  I prefer to cut/paste, so I'll do that consistently from now on.
>
> +1, it makes it much easier for people who can't attend to provide input.
>
> The other thing I'd like to see is attendance / attribution of
> comments, that way I know who I need discuss particular items with.

+1

>
> Cheers,
>
> Andrew
