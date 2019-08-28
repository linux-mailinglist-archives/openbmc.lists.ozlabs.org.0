Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C3A0D4E
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 00:12:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jg3R2Db5zDrHp
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 08:12:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ijf7u7aQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jg2s2BVVzDqXQ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 08:12:18 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id i30so643944pfk.9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdwW1nCtxJ4PS2XyQJcC79cnK2SyTb3cT7huJs9Ddhg=;
 b=ijf7u7aQkdcU6RReor7fx62Q+ZjyPaL7FJIEOW933hcaOdQT8HHE57m37e1nhEuEVp
 lb1r+aR6ZpnjzB2zSLwmBlN5ryOL2P3lP06QRU/QVd47iNUuPfMz0wxIDbaGIOHqu93M
 gN7l/hrDzWxvR++2o+ffj2984BKckmSTQsXIhyqgAC043mLjXHROg5Cl/T24Q1T+A8G8
 gL6DiY1hljk96Jo3MWFGywXWVB9dRyUIg5CXDuefqlYeOX5j/RJOSu0yNB03nwgCgwZf
 WSxsrpHqudp6L6V9qkiO5YQ5I+QBlkVe8Uhep/kRcZo1Nhx9NYjwIHRbpUXEXJK7bXK9
 L7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdwW1nCtxJ4PS2XyQJcC79cnK2SyTb3cT7huJs9Ddhg=;
 b=QVOoPCZmMrWQMPe7dYsU3Uad/cwXFSa61gw8vhRfPZHPD36cEsnubl6XrmFDcyw5Cn
 KU9WUb2/ELsrmX2ostkIg/vHb1rfLVjWpOtDZpXqZNoyZkKGNobH7UVXYDpmHhXp6LqB
 1mluzxNJ0RrEQltqp2sJsccj672CkwDeJyiyPVnh+6Eo1HRQJUndfCGRLnUcyY0YJ0Zy
 +AaqfS2kt92T5VHvvCAtq1dW6UG/cKbK8xUl4QCG/9Gx6R6W+OFztWGzc1/hhUbBcOrb
 lipz6N74rl/U5sO9tbWYO1y6ANp5wkE9Q9Jig79epj6j+quCaVgCOziRjZono2xVUL7F
 xh2A==
X-Gm-Message-State: APjAAAV6O7+wbVUoQ/kut5rAP+lz3Qaps+KMSG/HisTzSFKdM2b6WqPq
 HjDo7N5ERrYjWp+B0R1P4FQ4jb+BKPTLcH0iJNUO0g==
X-Google-Smtp-Source: APXvYqyOZjGYHdh7d7Kuxz+2WUE5+cl5FTjRKxQ8oZ7VSO14ooUhkekohO4ssHsM51CjBw9yVaferEjcb5Ts0GBUTrQ=
X-Received: by 2002:a63:2784:: with SMTP id n126mr5257316pgn.92.1567030334081; 
 Wed, 28 Aug 2019 15:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
 <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
 <CAO=notxxc_S-DnPL=ObOuA_KiC-j0F-qMOMKmfYMTUAnepVdew@mail.gmail.com>
 <309f39a3-8f76-aec1-85a5-0a3907120bd0@linux.intel.com>
 <CAO=notyv_RCRv08EbSVfSkpMiO2LCBTU+GTz-9n5C-hBrcm9ww@mail.gmail.com>
 <a920a3b6-c5d0-81df-1de7-e45e76c1da26@linux.intel.com>
In-Reply-To: <a920a3b6-c5d0-81df-1de7-e45e76c1da26@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Aug 2019 15:12:02 -0700
Message-ID: <CAO=notyJoc61BBsmS3C3VT-6WJDKD+iX4HF3Y8077cb1Q0a5bA@mail.gmail.com>
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

On Wed, Aug 28, 2019 at 2:38 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/28/19 2:36 PM, Patrick Venture wrote:
> > On Wed, Aug 28, 2019 at 2:29 PM James Feist <james.feist@linux.intel.com> wrote:
> >>
> >> On 8/28/19 2:16 PM, Patrick Venture wrote:
> >>> On Wed, Aug 28, 2019 at 9:29 AM James Feist <james.feist@linux.intel.com> wrote:
> >>>>
> >>>> On 8/28/19 7:27 AM, Patrick Venture wrote:
> >>>>> I think I've figured out what's happening.
> >>>>>
> >>>>> If a configuration has no fields that are changed by the template code
> >>>>> (or possibly even in that case), nothing happens to the values.  So,
> >>>>> the property Address is left "0x54" if that's what it is.  And the
> >>>>> code is templated, so it just adds that property of type string to the
> >>>>> dbus sensor configuration.  As this is definitely what I'm seeing.
> >>>>> Json doesn't support ints that are written raw as hex, so wrapping
> >>>>> them as strings is what's required to make the json parse.  I've
> >>>>> worked around this problem by just using decimal everywhere, but
> >>>>> that's harder to read when comparing to schematics.
> >>>>
> >>>> Based on this, I think this line might be your issue:
> >>>>
> >>>> https://github.com/openbmc/entity-manager/blob/3b80d7c51ff5d5859c0ca1f2b517c18f4766a1a6/src/EntityManager.cpp#L1336
> >>>>
> >>>>
> >>>> If found device is nullopt, you still want to call this line, but you
> >>>> want to call it with an empty flat_map.
> >>>>
> >>>> I verified if this happens it should work here:
> >>>>
> >>>> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24787
> >>>
> >>> So, we're still hitting the error:
> >>>
> >>> ...
> >>>       "Exposes": [
> >>>           {
> >>>              "Address": "0x54",
> >>>              "Bus": 31,
> >>>              "Name": "i2cool 0",
> >>>              "Type": "MAX31725"
> >>>           },
> >>> ....
> >>
> >> Did you change the above line? What have you tried? Guessing it has to
> >> do with templateCharReplace not getting hit, if it gets hit it should be
> >> replacing it.
> >
> > Yeah, I see your new unit-test validates the replacement behavior.  So
> > it must be that it's not hitting that line you pointed to.  I'll see
> > if I can grab a test platform tomorrow and see if I can replicate it
> > (we have a config that consistently fails).  And see if I can figure
> > out why the device isn't being "found."
>
> This would make sense if you had a probe that is set to "TRUE". We
> normally probe for everything, so this would make sense why we haven't
> seen it.

}
...
   "Name": "...",
    "Probe": "TRUE",
    "Type": "Board"
}

Yeah.  This is in our baseboard one that is always loaded.  So, an
interesting bug case to hit :D  If we had used the fru data for this
probe it would have hidden the issue.  Neat.

Will validate your patch hopefully shortly.

>
> >
> >>
> >>>
> >>> Aug 15 22:38:58 MACHINE hwmontempsensor[2697]: terminate called after
> >>> throwing an instance of 'std::bad_variant_access'
> >>>
> >>> It's failing because the configuration is a string "0x54" in dbus.
> >>>
> >>>>
> >>>>
> >>>>
> >>>>>
> >>>>> Would it make sense to make the add property code less field agnostic
> >>>>> so that if the field is Address and the Interface for
> >>>>> configuration.XXX that it checks to see if it's a hex string?  Or,
> >>>>> maybe the templateChar replace -- if that supports converting the hex
> >>>>> string to a raw integer value type should always get hit?
> >
> >
> >
> >>>>>
> >>>>> Thanks,
> >>>>> Patrick
> >>>>>
