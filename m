Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72519F4E
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 16:35:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450t5z6x4rzDqTQ
	for <lists+openbmc@lfdr.de>; Sat, 11 May 2019 00:35:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lUevKGco"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450t4q2mlxzDqQs
 for <openbmc@lists.ozlabs.org>; Sat, 11 May 2019 00:34:02 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id g9so3320495pfo.11
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLCUqgHC17klgceuZtwrAFULnRDnQEURwBPFRIxoKA4=;
 b=lUevKGcoasRj1mJ1FTMFLWAnzz1fYcT963dwzZaWVrNp5UTRhxutZigZkAAYbAB5tF
 8p43F0OjUpNDKZfQj1DTYSxyUupOcYUy5aPm5AgDQ3yelpiFVbE9BJ2NhVpcF77loaOy
 dQtKxAAS1s1MpGSq8qTuWRSFJ5VJGNeLTE5g6EtbrlknjFYnMD4kgtceAUbaY9pCq19P
 dmWPIZC4DpcfjldyyKW90vbjiEa2rwoz0ZA4KJ2CM0jcrA7MSuGDvKOaxTh+hkVdxlFd
 oL7D5mAbgmdMFE06Y4GB/0kasgW9xdwNZb0Ac/+MsXgAlHsf3uds1FyvDI7agi6XZOjH
 vTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLCUqgHC17klgceuZtwrAFULnRDnQEURwBPFRIxoKA4=;
 b=jCek3Cxu0wSQkSzJqywy+Uq5TIrRyXS1Tofv4y/wykbPl5vGGsDq5tacNMwgAAi1wH
 qCIuAidCBqBCa+0Ox2H7JK6qssw8IR0KkT4E5L9pEmzYaIiGMNM83oUUySNEN6th902w
 DLE+M0m95oJzSU/Yy32mkMojk5GlsPx5XPm6K+JifukcBSwUdI4Wfy17h0ZVsHCydSLa
 kbRE5jBtDkfYgkCs3ousE7mfiPhHQvenuXGTyzphucWj/vkVtG8zClExIqQScrSpkk6Y
 yADrAoCbixt79pRERejtvFLC8NwSkcMNedtXEAwqWS9ouU2UBUOFz9u5yHQINwsrbywd
 I1Eg==
X-Gm-Message-State: APjAAAWOrOWxa4iwnqINIwIIE7Kj70NgMa3oS/jrqXhN3LTjEKYKO2j/
 cBp0sxPM6BpbW45/9JxxGzp4eX/nPQ5s0w+4IylQRA==
X-Google-Smtp-Source: APXvYqyy1CzQMt8PEuUCk7W5F8XVCjavyr1lXGklkx8szhpsLkLH/FUW9TYeYuIC1MiWMSCyGGJIE0cnnZLhWcZC9DA=
X-Received: by 2002:a62:7a8f:: with SMTP id
 v137mr14569391pfc.243.1557498839066; 
 Fri, 10 May 2019 07:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
In-Reply-To: <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 10 May 2019 07:33:47 -0700
Message-ID: <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>
Date: Thu, May 9, 2019 at 6:11 PM
To: Andrew Geissler, Benjamin Fair
Cc: OpenBMC Maillist

> On Thu, 14 Mar 2019 at 13:39, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > I took an action item from last weeks Infrastructure Workgroup.
> >
> > The point was we're wasting CI resources by testing meta-*
> > commits that are not actually tested by any of the machines in the
> > CI job. We're also falsely marking those commits as Verified because
> > if they are not in any of the systems under test, they're not being
> > tested at all.
> >
> > The systems currently run as a part of the meta-* CI jobs are here:
> > https://openpower.xyz/view/CI/job/run-meta-ci/
>
> > Are there any advantages to running CI against meta-* layers that
> > are not in a machine being built? Are there other machines we can
> > add to CI that would cover some of the meta layers above? The
> > general criteria for getting a machine added to CI is that it's actively
> > being developed and supported. We also need to balance our
> > CI compute resources so the overall goal (in my mind) would be
> > to pick the machines that cover the most meta layers.
>
> I'd like to have a nuvoton based machine so we have some confidence
> that kernel bumps aren't broken.
>
> That would mean adding the evb-nuvoton or gsj machines to CI.

I vote for the gsj machine.  Not that it's a democracy :)

>
> Cheers,
>
> Joel
