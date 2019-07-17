Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D36BE74
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 16:41:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pg1X71vVzDqY2
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 00:41:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sOvGcIPH"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pg06084LzDqQl
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 00:39:49 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id w24so12088811plp.2
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XF9cANtx08Rd8ylZEKK7D07iNAV+j7wkRWxI7QS91tE=;
 b=sOvGcIPHgnWbabT9CKvwVeTMizY1dRJ7R35EZ/YLqc0RuiBMhe1shQUUsKwDLlmwO4
 93eLeBy7Gh2QcOq8MbiFGccKepo5K50cYCeH6+PInBidQk6ksuoPeTw5hPVPGK4+I9dk
 E+K0W8tT1UaOugwxyP4B+35P5ooaPu5W4s5H2oTgDS6tSmF2akn7ccCmDl0zeGg9izWE
 jMoPamTg9wuI2Hkn+xlaDgQow2Slt2jtb10ShX78wFiW+UZgYD/LGp7Gjg2QL1pl8yIQ
 kt2wLDqtqTOplIXlKJY/vBGOWyVStuhe6OnQNi+eT/bFr9a2k/YpccXw9P5bxt26fXwS
 f/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XF9cANtx08Rd8ylZEKK7D07iNAV+j7wkRWxI7QS91tE=;
 b=VOGsjXSh69/E596tpoLsEid9Nkv58eSkJAxW7T79RrxC6e2BVbiwxJoxPGLk6sEGcN
 EAg4sZJGBOI3gNkQbDPW1dMI05Fn3trzQdx856c86bvpXtxay6oK5hCaNh4EIYN2cGR6
 xLlFBazOPgadgnhbWQnOC9A2A7GaSevTRtL07/8wOSwDP0sDxtZo3twDlqY7ZyHY7pp9
 9wJsug8BnceKa4nqZOYlxp+nCfZCaEDcQYBMsWbmj23cWNyPQPmtmQHa6EgMezIkvKJI
 PbiD7fL4GKOyi2FV3jyor7WBYbSSNsagUBfxdTigA0dPCI7lN2OgD+5QcLpIbKGy+lpJ
 SrhQ==
X-Gm-Message-State: APjAAAVWVrn2L5pLnTetWM4oQJIrTL8iJ1pvNSjHaDtbJagAThyTlfc8
 7mVYJLklBOlMETeyu+ZQEPgrnDmnkKzg566d6eqArg==
X-Google-Smtp-Source: APXvYqzybsI0hxhoV0jRmFp4RbsrR6MGjsrJx+yW51vsN2MwkTbH9OHzSniCdM1OksKkZa5vwTPvimcuiAy2OxFpCcM=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr42571318pls.179.1563374386259; 
 Wed, 17 Jul 2019 07:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
 <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
 <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
 <CAO=notw6jitPk-OuA2OGxqBEm38nVY5sa1C0KKx0TfYi=0qpnQ@mail.gmail.com>
 <a8159cb7-9b54-8682-98aa-c1133d042c2b@linux.ibm.com>
In-Reply-To: <a8159cb7-9b54-8682-98aa-c1133d042c2b@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 17 Jul 2019 07:39:35 -0700
Message-ID: <CAO=notw3uVhzr14Vh2ijP8GW55=gdTsHexvK6OmCGQtqdXVT+Q@mail.gmail.com>
Subject: Re: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Matthew Barth <msbarth@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, Brandon Kim <brandonkim@google.com>,
 Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2019 at 7:37 AM Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
>
> On 7/16/19 4:19 PM, Patrick Venture wrote:
> > On Mon, Jul 15, 2019 at 9:10 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
> >>
> >>
> >>
> >> On 7/15/2019 9:45 AM, Matthew Barth wrote:
> >>> This is a great proposal, just a few concerns/notes.
> >>>
> >>> On 7/12/19 5:27 PM, Kun Yi wrote:
> >>>> Hi there,
> >>>>
> >>>> Current phosphor-hwmon code is filled with preprocessor macros to
> >>>> branch error condition for sysfs reads, and it seems to me that
> >>>> adding a per-sensor configuration would solve two issues at least:
> >>>> 1. code can be greatly simplified
> >>>> 2. we can code more flexible sensor reading behavior
> >>>>
> >>>> Why 2) is needed: with many types of sensors that BMC controls,
> >>>> having an one-size-fits-all policy will always have cases that it
> >>>> can't handle. Each flaky sensor is flaky in its own way.
> >>>>
> >>>> Rough proposal on how this will work:
> >>>>
> >>>> add properties to each sensor group's configuration file:
> >>>>
> >>>> "error behavior": can be one of
> >>>> - always keep
> >>>> - remove from D-Bus on error
> >>> There is a REMOVERCS device config file option that can be configured
> >>> to remove an individual sensor or any sensor of the device when a
> >>> given set of return codes occur when attempting to read the sensor.
> >>>>
> >>>> "error condition":  can be combination of
> >>>> - certain sysfs return codes
> >>> REMOVERCS combines this error condition to the behavior of removing
> >>> the sensor from Dbus. I'd be interested in how these types of
> >>> bahavior-to-conditions will be mapped within the device's config file.
> >>>
> >>>> - timeout
> >>> In the case of phosphor-hwmon, isnt a timeout condition similar to
> >>> error retries since a timeout condition is presented as a ETIMEDOUT
> >>> return code on the sensor.
> >>>> - invalid value
> >>> This is another area I'd be interested to hear more on, how would one
> >>> go about defining when a value would be invalid? Or is this a simple,
> >>> negative values are invalid for a sensor that should always return a
> >>> positive value?
> >>>>
> >>>> "error retries": number of retries before declaring the sensor has an
> >>>> error
> >>> This would be great to have configurable per sensors, however a
> >>> possible issue here would be allowing too many retries causing hwmon
> >>> to take too long. So this should be capped or controlled in someway
> >>> with the delay between reads as well. Right now a sensor is allowed to
> >>> be retried 10x's with a 100ms delay between each attempt.
> >>>>
> >>>> Happy to hear any feedback.
> >
> > I think the idea in general is interesting -- it may be ugly to try
> > and set the values per sensor, versus a group of sensors in a config
> > -- see INTERVAL, which is set for all sensors in a file.  I realize
> > that some things are sensor specific... so maybe a mixture?  I'd just
> > hate to see us need to specify the error handling for every sensor if
> > only one is different, and the others aren't default.  Although, maybe
> > that can be done nicely -- have some default you can set in a config
> > once and then override per sensor...
> >
>
> FWIW, REMOVERCS is partially implemented to how you describe. A
> REMOVERCS entry can be added to a devices config either per sensor or
> for all sensors provided by the device. The return codes defined per
> sensor are added to the list for the sensor when its created and any
> other/additional return codes are added to the same sensor if defined as
> a general config option on the device.
>
> ex.) REMOVERCS_fan1 = 7,11 and REMOVERCS = 13 within the same device
> config would remove fan1 when return codes 7,11or13 occur when
> attempting to read it.

Thanks for clarifying the behavior.

>
> >>>>
> >>
> >> I like this idea.  Hopefully the defaults can be kept the same as they
> >> are today so users of
> >> today's default settings wouldn't have to change their config files to
> >> keep things the same.
> >>
> >> Another thing we've been thinking about adding is the ability for
> >> sensors to only be
> >> read when the power is on,   though there's still some invention
> >> required as to how
> >> to represent this state on D-Bus.
> >>
> >>>> Regards,
> >>>> Kun
> >>>
> >>
> >
>
