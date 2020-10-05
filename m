Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF428422B
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 23:37:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4v8J6zQXzDqMr
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 08:37:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lcjN5Lq4; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4v6T3f5zzDqB2
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 08:35:59 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id s7so8156348qkh.11
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqDPVbHTzdlzHHdvWXWJxM0A4l9wDCajFawk+NsDnLA=;
 b=lcjN5Lq4k7QuT1fqzqQpLP25Lkme2sdSEqvuSIsah9KLkOF4IpBs9Gr77vC0ZdcxIH
 PasAdhnPWf760oPnWzjTRYlAOTeK7YVDGXrfUXh8dVee5AGG0iHSNQw0aDHjY+dYYBWv
 QjQF7e98xnvjJhouEmyoT6lsZPEYc7gfSbgzZvnQeEemZY9BtQkrwZ3KNt6HFL2/NEEy
 b7P/dcV4NRjWcMw+uAR4j/etdG2Za2T2LfncLOaOqF9qRjohIy7wamrnglDNvNK6Pcx9
 pD8vGTQhkunWBh4RQtRhLWDSvvJR/8WvNnuFs8Ivpr1apJ/n0tXZL1XS+KkTF3tk/z9F
 b81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqDPVbHTzdlzHHdvWXWJxM0A4l9wDCajFawk+NsDnLA=;
 b=sbfxghLDLQ1hNAhC1wgzCi0mIPRX0Fyyj7FpfiYM+W0BGqW9I+0VnNgvmzPgzBYLRP
 xjbVxlzwd3H+rbUnmqvP3cOEfGTRLxeOivbl91nO4nOebSdmCMpEx5axR4ghofvQ9oTU
 C7lwBm7UHEVFGvtMqX0TFF5o5FBdMOf275NCsOQ7R0y0yc2nED2VymDl92+XmrjMgWJX
 9/9bhcDS8MPQ2ndO+MF235mbhoXyyrZLfDpxDeFAS8SofMAYvb9TU4pgNsE1RLofV4QX
 ZEDUlpePIx72DY9BKd9Uuo6Mes0jcvHIAcVQHqYTyZRy7Rzx+PGKYk1HMJ2g8fksaPA7
 udAw==
X-Gm-Message-State: AOAM533VpopGyiumyQlRB8F3cH8S5XhMP1/jVqRrhhJ5bDWxsATyvFWh
 MkqiGZnhnUh5EVcCZKZFyG79CQKpBR6onI0xxQlyWmX62npTbv9X
X-Google-Smtp-Source: ABdhPJyCXW2qJzqaUBQPx2GLKylP7dKMXIXZ64zfxjgG7OSNUfGKq0SYakSlbvW9eZr/5gvoZO3xOnVXvafRmZpU/1I=
X-Received: by 2002:a25:cd08:: with SMTP id d8mr2786560ybf.449.1601933754554; 
 Mon, 05 Oct 2020 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
In-Reply-To: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 5 Oct 2020 14:35:43 -0700
Message-ID: <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
Subject: Re: Redfish: Supporting deprecated properties
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 5, 2020 at 1:34 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> Felt this needed some broader discussion. Although Redfish tries to
> avoid, it does deprecate properties. In the future, Redfish plans to
> deprecate whole schemas. One of these deprecated properties was the
> IndicatorLED property, replaced by the LocationIndicatorActive property.
> More information on this can be found at (Slide 11):
> http://www.dmtf.org/sites/default/files/Redfish_Release_2020.3_Overview.pdf
>
> On https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36886, it was
> proposed supporting both the deprecated and new property for some time.
> This would introduce a new Redfish Validator warning about implementing
> a deprecated property. We have other warnings today so maybe not a big deal.
> How long do we need to support both properties?
> Based on releases? 6 months? That feels too long.

Based on releases feels too long?  Can you elaborate on why that's
"too long".  Supporting it for N+2 releases with a deprecation warning
return seems reasonable to me, considering the number of
implementations that we'd break if we did the cutover quickly, and
considering the alternative hasn't existed very long (a matter of
weeks it looks like).  Maybe I'm over/under thinking something here.

> Are our releases used
> broadly enough and release process mature enough?
> If it is not a replacement and just deprecating a property, can we just
> drop the deprecated property immediately when switching to a new schema
> version that deprecates?

I don't think so.  That would break clients, many of whom aren't
connected enough to the mailing list, but would be broken all the
same.

> Do we need to do the same when a schema is deprecated?

Depends on the schema, and I'd say we come up with this posture once
it happens, and depending on impact.  For example, if they deprecate
SessionService (something that every tool in the world uses) that's a
very different posture than if they deprecate the Fan schema, which
very few implementations actually implement in the client side
correctly to the spec.

> This matters
> because Redfish is targeting 2020.4 for new Power and Thermal Subsystem
> Schemas. Redfish plans to deprecate the old Power and Thermal Schemas
> and release new schemas.

In this specific case, I suspect a compile time flag would be my
recommendation, because it's not just a pure deprecation, it's
changing the meaning and intent of a lot of collections.  We already
did this with the "single chassis" flag a long time back, and it
worked quite well.  Those that wanted new behavior got it, those that
wanted old behavior, got it.  It was a nightmare to maintain, but I
suspect this changeover will be a little easier maintenance wise.

>
> I think it is reasonable we support both IndicatorLED and
> LocationIndicatorActive for some time, I'll throw out 2 months.

Not nearly enough time IMO.  It takes longer than that for the spec to
go from PR merged to a versioned API release.  Some gerrit reviews
alone take longer than that.  Also, supporting both for some time is
trivial code-wise.  Are you just worried about the warning, or are you
expecting a significant revamp of the LED stuff in the near future?

> Our
> Redfish implementation is young and I am not sure it is worth the
> developmental and support costs, at least at this time, to maintain
> deprecated properties and schemas for long.

In this case, I'm looking at what would be maybe 3 lines of code?  If
redfish starts deprecating properties every other release, then I
agree, that's not maintainable, but in this case, this seems
unimportant.  One thing I would like to understand: it looks like the
new property doesn't support Blink?  How is that handled in the new
schema?

It should be noted, OCPServerHardwareManagement v0.2.3 requires
IndicatorLED;  Are we ok with breaking our OCP compliance more?  At
this point in time, I'd rather not, so I'd like to see OCP also ratify
the deprecation, and release a new version of their profile before
anything other deprecation happens.

In this specific case, what if we did this:
Now;  Upstream backward compatible LocationIndicatorActive property to
bmcweb.  Upstream changes to OCP schema to also deprecate
IndicatorLed.  Time starts counting once both patches have been
accepted into their respective mainline branches.
N+1 release;  Implement returning a deprecation warning to the user
attempting to use the IndicatorLED PATCH API.
N+2 release; Remove the IndicatorLED property from GET requests, but
continue to accept the property for PATCH requests (we've done this in
other cases).
N+3 release; Disallow PATCH to that property entirely, and continue
with new implementation.  Ideally hold the deprecation warning, but
use judgement about technical debt.

?????

Profit!

>
> Clients can use the schema version to determine which properties are
> available. If needed companies in a fork could maintain backward
> compatibility for longer.

In practice, many clients don't check the schema at all.  I really
wish Redfish had a way for a client to say "I support X version of the
schema, give me the things compatible with that", but I'm not aware of
anything like that.

>
> Thanks,
> Gunnar
