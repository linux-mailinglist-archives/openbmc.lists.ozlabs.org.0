Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB71334143
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 16:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwbDh368Jz3cZJ
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 02:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=blRQa+hy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=blRQa+hy; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwbDR6Zc1z30QX
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 02:12:53 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f145so1778525ybg.11
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+gsrJWbDRQ3fKrs8EKRj2B9ksnfyqWdpHCZfZM1U+U=;
 b=blRQa+hyNXLGc9wTx9sRDc3rfBRr7hmNDPKG4LQrFgHINL6IB6m+ysZN1OZeNLjVHU
 kYGrYBdqYv6diWcuFB/r1Hg+PvxI68kfFYX/z/iek3AAq/DZVCEnTBOx7XgfUE5awvjt
 6aL1pcsKt8P6JHCJB/pBVllX8BA9gsjt5pOd22l896KMtZ+RQdSXgMMBurDCUJI/Rke1
 mSUdPcVARYTJj6J/f+zDmIFgIblSUXNv3gJPLz/4zdVJSEKbBpPTqKGzld9vI+M8kem5
 fhrgy8un3oxYeD4RSOMweUMvA8UnHbJNEbN6p5O54q1Tqbr519sIE83vSTh5SM7LMCaC
 C67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+gsrJWbDRQ3fKrs8EKRj2B9ksnfyqWdpHCZfZM1U+U=;
 b=te+X2/qGHsnX69Ssd4YAA1LA0vu2483TELGMe0AffhPiTgHdokArRZyqBbGG9WGHNT
 oeTxmdeCZuF/gIcxLsqmVP67zXjyWgneYJhk3MsnbJ+Aj3xprfx9S+Z5ItgCO2wmbP6+
 IxKhjjF1x0zM6jnjSv7sRpZobagvIGp36wqDmFreSAZXieNUTiGe24Xt2rEu8PHPF9s9
 0+idK4m61VNDfFFKiTi32JEvuD4y7aV0HGgD4PFPeq3tlkFo9ciNVGBlTGRFTSlEOx4Y
 nypQSZ28xp123sqsyBvDrBgRsUQyUFSDHCJjCvcroLRm0H/r1yDwaY0ZaRSVfs1UG8nn
 3k7g==
X-Gm-Message-State: AOAM532niDHZcz9go9q6R5J4VR/9jdNBdGncRTKN1dPGsLEPr5p0E2PC
 GyrWdBeyjtiwmw5dE+2kJtbd6PciA5QqQwKyS1A6aw==
X-Google-Smtp-Source: ABdhPJxFzA2EUue8uV+FVB1RWRI1sG1i53PTZZnt3xuX+n3iAlz3Iy5pf74fxeLfx53RCHpylFWG1VgVGU+7ZyeqGUk=
X-Received: by 2002:a25:8687:: with SMTP id z7mr4189834ybk.209.1615389170174; 
 Wed, 10 Mar 2021 07:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
 <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
 <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 10 Mar 2021 07:12:39 -0800
Message-ID: <CACWQX83sHwbW435Ph9+e2xyPmqxNyih5L=Rs96ydR0mZQOLzpg@mail.gmail.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>, George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 5:52 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Tue, Mar 09, 2021 at 09:07:51PM -0800, Ed Tanous wrote:
> >On Tue, Mar 9, 2021 at 7:23 PM George Liu <liuxiwei1013@gmail.com> wrote:
> >>
> >> Hi, Wludzik, Brad:
> >>
> >> Since we have some open-issues that need to rely on Telemetry service:
> >> https://github.com/ibm-openbmc/dev/issues/2968
> >> https://github.com/ibm-openbmc/dev/issues/2969
> >
> >The people that care about those things should really be reviewing the
> >patches that are already in flight.  Unless I'm mistaken, I see no
> >reviews from George on any of the telemetry patches:
> >https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+reviewedby:liuxiwei%2540inspur.com
>
> No disagreement that those who care about telemetry should help review
> telemetry patches.
>
> For what its worth I asked George to post to this thread so that
> everyone is aware of his intent to work on these features.  OpenBMC is a
> siloed project and I'm trying to set an example and break the silos down
> by overcommunicating and asking others to do the same.

I have no issue with posting here;  That's great, and helps break down
silos, where I struggle is where we propose features on top of the
existing.

>
> >> I want to make sure that Intel team will finish it by summer?
> >> If it is, that is great, we will always focus on and participate in
> >> the code-review.
> >> Otherwise, as Brad said, we will come up with a proposal and report back here.
> >
> >You should participate in the reviews and help test either way.
>
> I think there is a misunderstanding here.  The point of this thread was
> simply to find out if the telemetry experts (or anyone else that cares
> to comment) had any opinions on how these functions should be
> implemented.  Clearly George can't review his own proposal can he?

I don't think any would argue that, but if George needs someone to
review his proposal, he should be reviewing other proposals, right?

>
> >If the initial feature doesn't land on master, there's no point in
> >working on or planning secondary features.
>
> I understand you are focused on reviews and for good reason.  Does it
> not make sense to work on reviews and design/planning in parallel?
>

There's no problem with working on things in parallel, but when many
patches have been in review for a very long time, with almost no input
outside of maintainers and the submitters have asked for help
reviewing multiple times, it's hard when someone pops up months later
and suggests we stack more patches on top, while at the same time
ignoring others patches.

George, to be clear, this is not to single you out, and this problem
goes beyond you.  To some extent, the email just hit a bit of a nerve.
It would be really helpful if you could add your input and participate
in the reviews.  In this specific case, I recall pointing out the
missing Min/Max/Average aggregations (from the first bug) in one of
the original telemetry code reviews.  I don't remember what the answer
was there, but I don't think it got added.  I don't think append
behavior has come up, but I suspect it would've changed some of the
initial design if we had known it was desired.

> -brad
