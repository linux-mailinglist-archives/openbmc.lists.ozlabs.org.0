Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4560B4AE
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 20:00:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx2tR1Jwcz3c1c
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 05:00:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NUgxU5R/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NUgxU5R/;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx2sq2NVjz2xl2
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 05:00:13 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id o4so9198983wrq.6
        for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJrw0wYf0vaVqk7h8MZzxCYHW367GGDWMAEb8FFc7FM=;
        b=NUgxU5R/AiJnw/tUkM40q3v4COsxltb143A0bNA0M3ImfQkY0bpoVjP5NjBXFBJiyB
         UcYGi2J7sK99Ofk8uywOOGhrA+J5RnUit5D4d2GPNBAFVe3G7QXu4VmZauoBQ5XO5mE2
         pVAQ4u2IDzaf9pTHZ0iHg3eXONsAz0l6PATegl2s5WLl12K6cEr6hRDQcn+O40PBKXPi
         TgegRDqL5H9IVloz9LvUcTrDUIU0A/23AHBVthqy1cWLgS3IolG+UH3LLWqsexNsaDBl
         I7c2pr3j8EMtDH0ycvJtLKv/G3L7WsUtA9TGleaBV1kdLyhY5aDZmeMHyApAwXWVMx2I
         GS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJrw0wYf0vaVqk7h8MZzxCYHW367GGDWMAEb8FFc7FM=;
        b=qVP/q4FYYEprkRkFIstlZCWm+9Z34GY73ShwbmXOV6lzddfmqQtqkVP21G1k+28W8l
         cXSIuN9R4g9JCfoqyYfmjGvwbr0xTueMW6AyvAEzA04LqGkm0sZlYAv/HSH3SbVipOVr
         TArHV2SxOp4blI+j4VkuJJ4mBTQO+O1qD4Jx1yfM5OPu+/bcrsJPhqb1ONY/kbyZIbjJ
         oYAEH1ydjSiQNkyOdhe+CGkOuCOV8OEcrXz6Sd2rTrBpJrOeOdB49So9CsXa5p/s3k5u
         YM8kieZtAM7HckjMbsD4UBmm/fffuBXQJBPg5wjnnRI7iNMZrcBbLOIuB01E44ydFe6o
         qnLQ==
X-Gm-Message-State: ACrzQf2ZjNod8HsW/XLu71LohPkyGKtTEVpvbmc70yQmWGmWCVZ90XCW
	xhVZ7gW5V+Bo/N/hepfLhth2DSx1H3Yud/iBXJ+4U/X1LlzF/w==
X-Google-Smtp-Source: AMsMyM4n2Gk6yYxFMHbBBAKJORYre/5SrgU3bXszflkqUxQNQv6rzz+g9hghZEdGFpguEvoSWpUwiF81sYlr5mmNsgU=
X-Received: by 2002:a05:6000:81d:b0:236:73ae:799e with SMTP id
 bt29-20020a056000081d00b0023673ae799emr3407921wrb.559.1666634404049; Mon, 24
 Oct 2022 11:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com> <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
In-Reply-To: <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 24 Oct 2022 10:59:51 -0700
Message-ID: <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
Subject: Re: Adding support for custom SEL records
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 11:05 AM Bills, Jason M
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


From what I recall, the requirements were:
- Ability to store 4000 logs in a rotating buffer (original desire was
10,000, but 4000 was picked as a middle-ground that could be
implemented).
- Ability to log 100+ entries per second, including when buffers get
overwritten.
- (abstract) Log storage should be aware of hardware limitations (SPI
flash cell write endurance) and allow writing N logs per minute for
the lifetime of the machine without hardware failure.  (I forget the
value of N).
- "ipmitool sensor list" should return the results from a full sel log
in less than 1 second (renegotiated from 200ms, the faster the
better).
- The logging implementation should be able to support a well-formed,
version controlled, Redfish MessageRegistry to the DMTF
specifications.
- The logging implementation should be able to implement a
well-formed, stable, and ACID compliant IPMI SEL command
implementation.

I don't believe the current DBus implementation can meet the previous
requirements, but if it's capable of that these days, it would be
excellent to consolidate.

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
