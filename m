Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F13E0B05
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 01:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg7wz5thQz3bZ3
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 09:58:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=csRW1Uan;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=csRW1Uan; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg7wl0ZQCz2ym7
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 09:58:12 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso5005624wms.1
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 16:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v1nNR7T+EQkRSQe/B2+SCl5ATr2lpTG1xNWWoDJYrTs=;
 b=csRW1UangD5uh7/RkBEX7qNy7k8uW5W3e8a8WXxX+x0m2oievasaBzogARwe/ACMq2
 wDtsQWmS1ozQQ+8CbFVyxUmBS3Y5NeftIHCcWV3cEKJ0qOh7P8O0Vj/jUznAssF1wTY1
 iqU4lL9cfvev9D1ipaZjp3ocgSTrtpoyoyq05hdwZvDgflwos8Omtl8MMywQwhf4JJpG
 ttTTYnIgpNwRq0sclJ0WaVszzokOJGFgT8ehkEiGeOPFCKoucsaMDkEyHqfC7E8li87Z
 tQwUSa0s6QEWSv+JB+OrzXi31YKmhR36WYjkhmoBZHIX/6VnfVMnVuBysdwgGbUJQ3p+
 QNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v1nNR7T+EQkRSQe/B2+SCl5ATr2lpTG1xNWWoDJYrTs=;
 b=SIy2r/lVBQsMm7jeuIDnupiXlWexi1ExfQ9cnYXcGQ+V7VD5pRHozvsUA+P34sClwX
 CwuaXXmNnjs8A/Th5cNEY2xI7dcLn3zO/r8Acns0a6G6+UgIQIkgEqTUHS4IQGiJjXNM
 8+3F7XUoWEyPdsPD7ZCioQ2IJl6f9YevCdpSKNkteaWdkAGXZkShgBltVIsh9/F9srqT
 niiB61bYcumrAcgiluhHgKf3mPqGFMMwtMQkt9MoZ25emZjxTf1M6KmcCvf/0V24WcFW
 +AC3Ueybgmak6FbuAYzAkjtp+SMJvrGid6MyyLySbb0nPh41+/tZjWVkGgVL+WfWDXOc
 iBBw==
X-Gm-Message-State: AOAM530numDimyXuaZTStmZs9Grf4re/FMba3MepiSHi/IQPrKh1y5OO
 jKa9XHe15Owyon+SX/Zmaw6ohohyTrEhf0asdNuwUQ==
X-Google-Smtp-Source: ABdhPJy//Wg8OpFeDqcmkXOoVuqw+Rc/B7hhKHORksCKazaO9mwZ3sTmiLPQdURAtX2vfkmiFDodBQiD89x/dL8CPWA=
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr1824969wmk.93.1628121483909; 
 Wed, 04 Aug 2021 16:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
 <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
 <YQr9RWolIR7witlQ@heinlein>
 <6aa885f5-6870-4ca7-b5b5-cfc9568f1f96@www.fastmail.com>
In-Reply-To: <6aa885f5-6870-4ca7-b5b5-cfc9568f1f96@www.fastmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 4 Aug 2021 16:57:52 -0700
Message-ID: <CAH2-KxBqzCr--LN93P=OsmorDPkbgzDxyxpSGckzFX7MAv96eA@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 4, 2021 at 4:48 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 5 Aug 2021, at 06:19, Patrick Williams wrote:
> > On Wed, Aug 04, 2021 at 03:39:45PM -0500, Joseph Reynolds wrote:
> > > On 8/4/21 3:09 PM, Patrick Williams wrote:
> > > > On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
> > > >
> > > >> 4 Surya set up a bugzilla within Intel and will administer it.  De=
mo=E2=80=99d
> > > >> the database. We briefly examined the database fields and agreed i=
t
> > > >> looks like a good start.
> > > >>
> > > > Once again I'll ask ***WHY***??!?
> > > >
> > > > https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
> > > > https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
> > > >
> > > > Can we please create a private Github repository and be done with t=
his topic?
> > >
> > > I don't have any insight into how to resolve this question.
> > >
> > >  From today's meeting: using bugzilla has advantages over github issu=
es:
> > > - lets us define the fields we need: fix commitID, CVSS score, etc.

I'm also really not following this as a rationale for starting a
completely new server.  This is easy enough to add on github in the
bug template.

> >
> > These are pretty minor when you could just add a comment template with =
this
> > information.
> >
> > > - has desirable access controls, specifically acess by the security
> > > respone tram plus we can add access for the problem submitter and the
> > > problem fixer
> >
> > So does Github.

+1

> >
> > ----
> >
> > I really don't think that some subset of the community should go off on=
 their
> > own bug tracking system.
>
> +1
>
> I'm not aware of any effort to use Github security advisories so far. I
> think we should try that before burdening ourselves and any bug
> reporters with yet more disjoint bits of infrastructure (we already
> have the two mailing lists, discord, gerrit, and github).

+1

>
> Andrew
