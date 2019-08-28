Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9185A0C76
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 23:37:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JfGm4q2QzDr4r
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 07:37:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lFuE4Nnt"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JfFt1xNbzDqcj
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:36:48 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id w26so585055pfq.12
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 14:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGMLRVjlUAJQaGgS+tHBqvlsiLbXRGdTov7lMd3wIY0=;
 b=lFuE4NntLh3R8wVB4ZOqDxItrHpZkmkZj8pkI9SowBpcuxIY4ygD8dotER6Zju322k
 MOCPXukVFRW+zGHgGlK2JoRK+EdWLW4f2Afw7Shzbwbb8fQ6aWk2pY1xUUDz50UBWe1/
 Os05YIJHUJviHnwykbGC9yjCtq+cXlzYFjdWFktWBRIBzFXjNMhSjyKsVLPLHxV5ThLR
 vcI+XO7TsXDEtG1F7ObJ1eQ4FcPzyNC6PEkRCVcxy+xjN481Yu08ypudUJCMGFgqwoSg
 hNZOTaCWL39P7EWfXLeTOG5mcTwX9x658CFg42Rqnwr/k1omBzvfwQ62r2GN9Hhz3V/h
 eMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGMLRVjlUAJQaGgS+tHBqvlsiLbXRGdTov7lMd3wIY0=;
 b=XoFdJYEjqNmenmuJhxgdNbWGPx/GDTgKv/Ad3boYNh6qeDpLirJ7gsclvFIgocYjco
 Ofr+tVtKOiUNJ1raVU99t5QslVJFQyTYr1OtR8wOdZ2gWfiUosOFiCYyPuoUGNy/7wpF
 iMLxGdnX5Nm4rn3pfq/NfgK7etcc3IF13qyaFFeyJwr451gXlZlLB3WDWK+CHr5eDHNd
 I7JzBy+XuApBLctTym02HMBiaIVdLZCVbyrIfBWwTrzQrlEQTxsET8PGK33BHP6rOx5t
 O7vW19R0eKNGZUfdg/QkAnSoPmreviq7g3AcuUWj9WeIMGT9gO46V4pA36TCWIMAQuwW
 MMfw==
X-Gm-Message-State: APjAAAXh3bEwwJOXbQYLTo6Vp7OrDSVTMk36I7o0IFC2oTGkYzL7mTpb
 OWhZtrfCPVGrr0KNhIHjf57ugEZ4cfiKkx/GnRMn3g==
X-Google-Smtp-Source: APXvYqwpO00+MaVsmdoMG2h1TzD6ZH4V6Uata/LG6g0lE59+BTEX71TlyArG8BN6zNIk5sKP+4HXbbIYV/55P7bj4S0=
X-Received: by 2002:a62:e707:: with SMTP id s7mr7213402pfh.136.1567028204332; 
 Wed, 28 Aug 2019 14:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
 <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
 <CAO=notxxc_S-DnPL=ObOuA_KiC-j0F-qMOMKmfYMTUAnepVdew@mail.gmail.com>
 <309f39a3-8f76-aec1-85a5-0a3907120bd0@linux.intel.com>
In-Reply-To: <309f39a3-8f76-aec1-85a5-0a3907120bd0@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Aug 2019 14:36:33 -0700
Message-ID: <CAO=notyv_RCRv08EbSVfSkpMiO2LCBTU+GTz-9n5C-hBrcm9ww@mail.gmail.com>
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

On Wed, Aug 28, 2019 at 2:29 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/28/19 2:16 PM, Patrick Venture wrote:
> > On Wed, Aug 28, 2019 at 9:29 AM James Feist <james.feist@linux.intel.com> wrote:
> >>
> >> On 8/28/19 7:27 AM, Patrick Venture wrote:
> >>> I think I've figured out what's happening.
> >>>
> >>> If a configuration has no fields that are changed by the template code
> >>> (or possibly even in that case), nothing happens to the values.  So,
> >>> the property Address is left "0x54" if that's what it is.  And the
> >>> code is templated, so it just adds that property of type string to the
> >>> dbus sensor configuration.  As this is definitely what I'm seeing.
> >>> Json doesn't support ints that are written raw as hex, so wrapping
> >>> them as strings is what's required to make the json parse.  I've
> >>> worked around this problem by just using decimal everywhere, but
> >>> that's harder to read when comparing to schematics.
> >>
> >> Based on this, I think this line might be your issue:
> >>
> >> https://github.com/openbmc/entity-manager/blob/3b80d7c51ff5d5859c0ca1f2b517c18f4766a1a6/src/EntityManager.cpp#L1336
> >>
> >>
> >> If found device is nullopt, you still want to call this line, but you
> >> want to call it with an empty flat_map.
> >>
> >> I verified if this happens it should work here:
> >>
> >> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24787
> >
> > So, we're still hitting the error:
> >
> > ...
> >      "Exposes": [
> >          {
> >             "Address": "0x54",
> >             "Bus": 31,
> >             "Name": "i2cool 0",
> >             "Type": "MAX31725"
> >          },
> > ....
>
> Did you change the above line? What have you tried? Guessing it has to
> do with templateCharReplace not getting hit, if it gets hit it should be
> replacing it.

Yeah, I see your new unit-test validates the replacement behavior.  So
it must be that it's not hitting that line you pointed to.  I'll see
if I can grab a test platform tomorrow and see if I can replicate it
(we have a config that consistently fails).  And see if I can figure
out why the device isn't being "found."

>
> >
> > Aug 15 22:38:58 MACHINE hwmontempsensor[2697]: terminate called after
> > throwing an instance of 'std::bad_variant_access'
> >
> > It's failing because the configuration is a string "0x54" in dbus.
> >
> >>
> >>
> >>
> >>>
> >>> Would it make sense to make the add property code less field agnostic
> >>> so that if the field is Address and the Interface for
> >>> configuration.XXX that it checks to see if it's a hex string?  Or,
> >>> maybe the templateChar replace -- if that supports converting the hex
> >>> string to a raw integer value type should always get hit?



> >>>
> >>> Thanks,
> >>> Patrick
> >>>
