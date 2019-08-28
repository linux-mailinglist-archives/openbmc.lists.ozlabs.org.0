Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FBA0C42
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 23:17:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jdqv1RyXzDqst
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 07:17:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ByuRrv7S"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jdpy0WHqzDr97
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:16:57 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id i30so568015pfk.9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGvBHOe8eLgigdr9YJ1uGvyE1+ijcRb/R4GptXa6QBU=;
 b=ByuRrv7SoOlEwNvjc4C9N4h0YN2A2NPWHcXvLhp1ibaOCsaGhfhYVXNcwQZG0asA0p
 2pVnl2gu1E5SIOpqFmOXtzmp3SPFwDrcD97HMDQ7lq7ifKMFk4L66tmtotxK9NK5YlnD
 CG/0jGduryyhth7sqtfUwvAzkTEl1NA3JhP44zfeuwg5jpWAwpnMVWG6H+ZhKVwx78UO
 j6mwuz97pZOTNYBzv6yqRhe1RU6PAKs5dycEtTF108Wj+68jFIX/Lz1uQ5PKOT3/ZGY8
 X408FKNbzthMM5v41nQSDPrkgAgA9uPhxf9bErEIz4RWEYRijoV8s8EMv88k/XQm7WDH
 Ezew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGvBHOe8eLgigdr9YJ1uGvyE1+ijcRb/R4GptXa6QBU=;
 b=Hr319G8xkAyp/5z6hstpUD33WAa5o+7xFv9ZvRqeiHwwJ/0PgWWvNHP3fQUnZn/5kC
 j0kzZ5KvTfZ7QP7wQJORtnAZs8KrcAklsMi6fh55oitIBsm/U9xuU9ib5+1hZEWlA88x
 Bj0uQD2DKKyDZaJASY5zGkzWn4wOJ+R+KHu1HyourpNHrEDmY7EL2o8P5H4U2csxLDPs
 2qNPN84tV8CSFJ5YY2Mnrz/6JgcVuuZHmxEvq54I+7Y8Eu+JNV2Lr4lXuoJeGdG7pGK3
 E0Kw7do1JWnB0WbhcA+4RB3SLk1xXQ5zsFifZPb11u1RPfv6t05rChczKIbIzbEWR3Os
 qIFg==
X-Gm-Message-State: APjAAAXPKfxV2BaguqJNFmdgktxrFp3VJGsqYCz/4+b3r+LfFWgm3SSW
 V9mSxPfFnfg749tCoEOaLkVSHigfDQ1GuF7keM7dOA==
X-Google-Smtp-Source: APXvYqxBcgggQ5BqXdDWcK4gmKFwe1861sHzihHOZxnL56DNluT2ef0A52y29rZUI6nJ7YI9rY0ALfSpG1MBeXjhyY8=
X-Received: by 2002:a17:90a:224e:: with SMTP id
 c72mr6428763pje.9.1567027013356; 
 Wed, 28 Aug 2019 14:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
 <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
In-Reply-To: <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Aug 2019 14:16:42 -0700
Message-ID: <CAO=notxxc_S-DnPL=ObOuA_KiC-j0F-qMOMKmfYMTUAnepVdew@mail.gmail.com>
Subject: Re: Entity-Manager's Configuration Generation leaves address as string
To: James Feist <james.feist@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 9:29 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/28/19 7:27 AM, Patrick Venture wrote:
> > I think I've figured out what's happening.
> >
> > If a configuration has no fields that are changed by the template code
> > (or possibly even in that case), nothing happens to the values.  So,
> > the property Address is left "0x54" if that's what it is.  And the
> > code is templated, so it just adds that property of type string to the
> > dbus sensor configuration.  As this is definitely what I'm seeing.
> > Json doesn't support ints that are written raw as hex, so wrapping
> > them as strings is what's required to make the json parse.  I've
> > worked around this problem by just using decimal everywhere, but
> > that's harder to read when comparing to schematics.
>
> Based on this, I think this line might be your issue:
>
> https://github.com/openbmc/entity-manager/blob/3b80d7c51ff5d5859c0ca1f2b517c18f4766a1a6/src/EntityManager.cpp#L1336
>
>
> If found device is nullopt, you still want to call this line, but you
> want to call it with an empty flat_map.
>
> I verified if this happens it should work here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24787

So, we're still hitting the error:

...
    "Exposes": [
        {
           "Address": "0x54",
           "Bus": 31,
           "Name": "i2cool 0",
           "Type": "MAX31725"
        },
....

Aug 15 22:38:58 MACHINE hwmontempsensor[2697]: terminate called after
throwing an instance of 'std::bad_variant_access'

It's failing because the configuration is a string "0x54" in dbus.

>
>
>
> >
> > Would it make sense to make the add property code less field agnostic
> > so that if the field is Address and the Interface for
> > configuration.XXX that it checks to see if it's a hex string?  Or,
> > maybe the templateChar replace -- if that supports converting the hex
> > string to a raw integer value type should always get hit?
> >
> > Thanks,
> > Patrick
> >
