Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE860618C
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 15:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtSyy2dlcz3c6T
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 00:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AkjzTrKC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AkjzTrKC;
	dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtSyM2K9gz30F7
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 00:25:12 +1100 (AEDT)
Received: by mail-ua1-x931.google.com with SMTP id p89so9165654uap.12
        for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yBrU5INzZELMJTj9yyNKGJvYAl1XEz/6a/VvtVcawTY=;
        b=AkjzTrKCeCIFt4olatTl3f3x8yOgBQzQFhzZoV5T11WkaXPSHrAXZ+1VRh77tFJkkh
         +XWfD4pOaR4Hll4NlpSdQrgIkW/vs2Bqww/StCdV3rsDFX9JMciyJDStzwuANFwSWqJ5
         hcAJgd0XqcNXzNOma6BrLVLOCg8xL4EhJ8ClS7ZHetinQyyoH5jrt2xAxonsKCPQ3Keb
         7LaIsRfghGbUJiBW51w5ewy9loefHWzlbJoFxZ27VBqFMBico/I064h+hkR5Sy2iXrCe
         Nf3oyKU1vcuLKI6OPsDzHEDHJwYljhtEdkHAbwwdScHWroB7A5/onlUbzBF8fRv3hoHI
         8i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBrU5INzZELMJTj9yyNKGJvYAl1XEz/6a/VvtVcawTY=;
        b=BsGtxEog0euhycrqAd6ws3/LpRp478x+Us1CoX/XUV0P0vAIyBuvfoaa3a29bP0rZ5
         1i53w8JEJ3f0ia1N9XQJxohtqbawir93ZWmOrGg9iyk4b7ITrRkOdiUcqVrfD+6Ebm/x
         j0DpZJQZeOIPlzrk93e5mLuEauT5xA8lfoUz+NglNjmg5zlp34mHwHokSOgJD7iKlNW/
         GJiGrFnvC6PVbrDfNHsR+xGVsZSJTGYXqL5tYkvKbZ5oNiloAb6b25nmFhMNnelyr8nF
         FwRrPsdtpZx+gWO8OV8Nf8K+yfEn6+3E9k+leEn4DMWEcR1WgsyG/qi91QLneX+Hp6NK
         NAOQ==
X-Gm-Message-State: ACrzQf1IuQp5i3tKUWZM4AEdOy5Eqm0meQXESat41X2FrHpDfbtu2tyb
	GC8xvJ3v8gmx81DUznnRm5WmbRw+aXvYK7aZjAXbZA==
X-Google-Smtp-Source: AMsMyM6mwwYAOPEXdSkLX38Y8jNPh3Dq9vXSTWUVyFCMMIyHlmfBKcRsrsYpRg4I2YsKRRlztbq36mA348JIXGoqYMQ=
X-Received: by 2002:a05:6102:3706:b0:3a9:7465:cb61 with SMTP id
 s6-20020a056102370600b003a97465cb61mr6957218vst.2.1666272307648; Thu, 20 Oct
 2022 06:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com> <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
In-Reply-To: <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 20 Oct 2022 21:24:55 +0800
Message-ID: <CAGm54UEOOZQtNZ1ev-6ExqjMoryO7GVNvNaW-iB9rO_kbHKAAA@mail.gmail.com>
Subject: Re: Adding support for custom SEL records
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
Cc: openbmc <openbmc@lists.ozlabs.org>, "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 2:05 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 10/19/2022 11:10 AM, Brad Bishop wrote:
> > Thanks Jason
> >
> > On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:
> >
> >> Intel had a requirement to support storing at least 4000 log entries.
> >

Bytedance has a requirement of 1000 log entries.

> > Ok.  So is it fair to assume anyone using the DBus backend does not have
> > this requirement?
>
> That is my assumption, yes.
> >
> >> At the time, we were able to get about 400 entries on D-Bus before
> >> D-Bus performance became unusable.
> >
> > To anyone using the DBus backend - have you observed similar performance
> > issues?
> >

We did hit the performance issue, specifically, it is extremely slow
during BMC boot, when log-manager restore the log entries and put them
on DBus.
That's when I start the discussion about
https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/52445 and
https://lore.kernel.org/openbmc/CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com/

Later we resolved the issue by:
* Applying the patch
https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/53904
* Implement the SEL cache in ipmid that is already upstreamed
* Improve the SEL cache by serialization (not upstreamed)

Eventually we get fair performance on SEL handling (with 1000
entries), it should handle 4000 as well.

> > Jason is there a testcase or scenario I can execute to highlighht the
> > issues you refer to concretely?  Maybe something like "create 4000 sels,
> > run ipmitool and see how long it takes?"
>
> To clarify, my understanding is the D-Bus performance issues were not
> isolated to just IPMI.  All of D-Bus for every BMC service was impacted.
>
> If I remember correctly, Ed Tanous is who did the initial evaluation, so
> he may have more detail.  But I think it was similar to what you
> suggest: Create 4000 logs on D-Bus and check the performance.  This
> could be done with ipmitool.
> >
> >> I'd also be curious about the reverse question.  Is there any benefit
> >> to storing logs on D-Bus that makes it a better solution?
> >
> > Yes, this is exactly the question I've been trying to ask.  The answer
> > seems only to be that the code is in meta-intel/intel-ipmi-oem - but
> > that is easily fixed by moving the code to
> > meta-phosphor/phosphor-host-ipmid.
> >
> >> At the risk of complicating things more (https://xkcd.com/927/), D-Bus
> >> was the primary solution when Intel joined.  We created the rsyslog
> >> approach because of the limitation imposed by D-Bus.  But I know there
> >> are still those who don't like the rsyslog approach.  Is there a way
> >> we can now get together and define a new logging solution that is
> >> fully upstream and avoids the drawbacks of both existing solutions?
> >
> > I hope so, because doing that would make things a lot easier for our
> > users adopting OpenBMC.
>
> My main requirements are to store many logs (at least 4000 was the
> original number, but I can try to get an updated number if needed) and
> have them persist across BMC reboots.
>
> We currently accomplish this using rsyslog to extract logs from the
> journal and store them in a persistent text file.
>
> How is best to approach starting a new design discussion?  Should we
> continue discussing in this thread?  Start a design doc review?
> Something else?
> >
> > Thanks,
> > brad

I would like to add several notes (possibly limitations) about
rsyslog's SEL in intel-ipmi-oem, please correct if I was wrong.
* It handles the SELs from phosphor-sel-logger, mostly it only
contains the threshold events.
* It iterates the sel files, and convert the file content into SEL
data every time on a request, which does not seem optimal
* The "add sel entry" does not really add a sel log, it adds an event
entry to Redfish instead.
* With above behavior, it basically has two separate types of logs,
SEL logs that are from rsyslog, and redfish event logs that are done
by "add sel entry". Thus the implementation seems to only support SELs
for sensor threshold events, but not for discrete sensors.

In bytedance we need a "full" SEL feature that supports both
thresholds and discrete sensors.
The whole solution is based on the DBus logging, but it involves
different repos (ipmid, phosphor-logging, fault-monitor). Part of the
implementation is upstreamed but some are internal for now.
I would like to share the details when I have bandwidth :)

-- 
BRs,
Lei YU
