Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A87156B0FD
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 23:20:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pCxC1SkgzDqcy
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 07:20:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MWnirngJ"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pCwY3XcQzDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 07:20:12 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id c14so10738471plo.0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p79YWKV5G6u2Ciz+xxWfteyN0f9RjALSoIRyWRdXcSo=;
 b=MWnirngJ2fAdT2QpfRuYShCp+2AdmhTiApZuHV3h8F2IbNU2CCcbqAzqw1tDWk0ROA
 n3dqRA02q52IaX768ZjFLzrCN/WU7Hpo61VSGyHOyud5qmwGohFnJT0o3jwjqu4uQtm9
 SwzDl8eEDeeRTgkXY23gBsLHu0dFkrudCy2HVm5VB5YtHvx7EMQVLQlD5vuYgAgMit7a
 a1+flnvAog5Lje9OiH5c6PLkESo4vCvGB35n0pa6p8/vhK7zFumu6AXgyEFDtlG+O4Q7
 xS9Uw4Kbe4YPL4TI8Mag+iuOcziZl2ZEo2k998wSCiy3jVZ56kw9onve0umIYMql85AE
 re9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p79YWKV5G6u2Ciz+xxWfteyN0f9RjALSoIRyWRdXcSo=;
 b=lYM2Wh79DRoPWu17yiBv6SluxbR3NTR5qXGhSQHumlNfoY7M1U1k2CgGrX/+kbGxj1
 URAVB6GI14Mdv4WPMgE3iBl87avaEC0aJyi8fBXwlZ5MAocqNpnhWZTXhoKpzcIOVUoj
 oCQMGUPTGJ+uoizT4e3bmnlTEK3y5etOK9Egv78GEw2OFMrJKAJ7OUlnjthc0kkVU9vn
 05s24I1QldumbBTV2C7GV+MAqXxtb1+A4MLxjADtirj8yxnXTx7XURqv3HAL6zFhGxnq
 EKNcuMbxL5T/JeCdCFvUrgK9XdGNdnxME1QKTtadwDwcJpzMNAUCs1hkAoPIW3D2ZncJ
 ojHg==
X-Gm-Message-State: APjAAAVoMb2YkYn7lp7Y0+H/KIGYYzG0w5nxfccLv1MDLX+tbg37Q7Qa
 9hoYX8Fyy6RuFFHc2zW7yuDFQRZy+bSsziE0O+eGNA==
X-Google-Smtp-Source: APXvYqx1AOX1xvFMg1cyYSkCygJS0Fewz8Ew7BLk14ooKJsuH6Qq2i6XqcuZ9ZkbI2qOTuvnxjaHxqvjE5V+ejObn04=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr37585887pls.179.1563312009391; 
 Tue, 16 Jul 2019 14:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
 <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
 <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
In-Reply-To: <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Jul 2019 14:19:58 -0700
Message-ID: <CAO=notw6jitPk-OuA2OGxqBEm38nVY5sa1C0KKx0TfYi=0qpnQ@mail.gmail.com>
Subject: Re: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brandon Kim <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 9:10 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
>
>
> On 7/15/2019 9:45 AM, Matthew Barth wrote:
> > This is a great proposal, just a few concerns/notes.
> >
> > On 7/12/19 5:27 PM, Kun Yi wrote:
> >> Hi there,
> >>
> >> Current phosphor-hwmon code is filled with preprocessor macros to
> >> branch error condition for sysfs reads, and it seems to me that
> >> adding a per-sensor configuration would solve two issues at least:
> >> 1. code can be greatly simplified
> >> 2. we can code more flexible sensor reading behavior
> >>
> >> Why 2) is needed: with many types of sensors that BMC controls,
> >> having an one-size-fits-all policy will always have cases that it
> >> can't handle. Each flaky sensor is flaky in its own way.
> >>
> >> Rough proposal on how this will work:
> >>
> >> add properties to each sensor group's configuration file:
> >>
> >> "error behavior": can be one of
> >> - always keep
> >> - remove from D-Bus on error
> > There is a REMOVERCS device config file option that can be configured
> > to remove an individual sensor or any sensor of the device when a
> > given set of return codes occur when attempting to read the sensor.
> >>
> >> "error condition":  can be combination of
> >> - certain sysfs return codes
> > REMOVERCS combines this error condition to the behavior of removing
> > the sensor from Dbus. I'd be interested in how these types of
> > bahavior-to-conditions will be mapped within the device's config file.
> >
> >> - timeout
> > In the case of phosphor-hwmon, isnt a timeout condition similar to
> > error retries since a timeout condition is presented as a ETIMEDOUT
> > return code on the sensor.
> >> - invalid value
> > This is another area I'd be interested to hear more on, how would one
> > go about defining when a value would be invalid? Or is this a simple,
> > negative values are invalid for a sensor that should always return a
> > positive value?
> >>
> >> "error retries": number of retries before declaring the sensor has an
> >> error
> > This would be great to have configurable per sensors, however a
> > possible issue here would be allowing too many retries causing hwmon
> > to take too long. So this should be capped or controlled in someway
> > with the delay between reads as well. Right now a sensor is allowed to
> > be retried 10x's with a 100ms delay between each attempt.
> >>
> >> Happy to hear any feedback.

I think the idea in general is interesting -- it may be ugly to try
and set the values per sensor, versus a group of sensors in a config
-- see INTERVAL, which is set for all sensors in a file.  I realize
that some things are sensor specific... so maybe a mixture?  I'd just
hate to see us need to specify the error handling for every sensor if
only one is different, and the others aren't default.  Although, maybe
that can be done nicely -- have some default you can set in a config
once and then override per sensor...

> >>
>
> I like this idea.  Hopefully the defaults can be kept the same as they
> are today so users of
> today's default settings wouldn't have to change their config files to
> keep things the same.
>
> Another thing we've been thinking about adding is the ability for
> sensors to only be
> read when the power is on,   though there's still some invention
> required as to how
> to represent this state on D-Bus.
>
> >> Regards,
> >> Kun
> >
>
