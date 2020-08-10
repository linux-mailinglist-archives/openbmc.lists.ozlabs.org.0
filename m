Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51895240C4C
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 19:45:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQNfd5Z9PzDqSN
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 03:45:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=C3uFADqc; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQNdh6gVzzDqS2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 03:44:55 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id g3so2575737ybc.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiVC4TRTOraD0z+Y1VFbL8vCNtNWk2sbzfpKUAdtupQ=;
 b=C3uFADqc3fLDHXO9DxxqS5gqg3Ba2gITK7RDcNFIU8mh3LDDH/EBP5NLeOFv8Tofbj
 cQ+D7r311poeHiw53SI4ickR+gdKHdDlnpPDg/oCNjagaf7YN4iFGffrkEHb647353U3
 JwTQnzrQcutiLwt0g5h+LIijEYZN7o1ETtQ50c5URnN8Adv/iPypUH3qYFAoq27X42fv
 HPHbTVYgot7VhmBWW9f/zh5rJo6u3H2bdzHkEO10MgAdnxpIF5XdqTXi3n5XgNeWBYmk
 xcMj3I4emGfufJIR2pA5I7q0+SNgpDcV5/vCZmgqFqkZmqq9PBmknaB1QpCrmIN0QEXG
 vYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiVC4TRTOraD0z+Y1VFbL8vCNtNWk2sbzfpKUAdtupQ=;
 b=HFYBPZ5vO5caUbCCRZ3I6izv/2fOa0BB0QmsY36eecmDYYLuLZv2PLZKwsGiprpVRC
 KnHM4DloXO1VmeWQRWhTUGrM51hbHjrpICC276XUFTnl89UICwoAPZzuHDvYavUuygm4
 sqwlxOexXPsQNumckItxSL1TQGbh6eDPf1CExp58KQshMlvYtr+0hOBZ7/PzuQ7bsQPp
 r+rABm8p11VFIbsKhIYOfDH6M12v6+EUcVoT+2czuhmwC16f+f3m09hFDdQlObm5NDQB
 OZQs3kT0TZHX3ki2iC6u054M26n63YspKPiN87wl3fOtyhErovsGSQt+VPjKSEVEeoK6
 RELg==
X-Gm-Message-State: AOAM532Blx7AXLKnfrooUeeWSo003h5BU94L3+XKRITJ9ySTK+h/C8QT
 G7Rjcf4jmKroqj+kQAAHrL+c4jIVg4FB4ppjNBwKKg==
X-Google-Smtp-Source: ABdhPJyTv/+nFkmQ/rIDxnEewA3Svd6puYoKsSx3HOzjZ7Eg9E+poBftiB2W0oqR9MioqiBaqZXVeKnvNxPA7sQZjek=
X-Received: by 2002:a25:d98f:: with SMTP id
 q137mr37792262ybg.480.1597081492210; 
 Mon, 10 Aug 2020 10:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwjyJJk5wfPBJ_=7ffS_988YwR7OJ-WAYCvJ1rBCq6oBA@mail.gmail.com>
 <CACWQX82bOe=XMoyd9XsyJecLFeVzV6FMu+Zw_US=qSUuBcK3QQ@mail.gmail.com>
 <CAO=notxOYwE=59zfOoxsuyazLrQ1UvuWV3sH4Z4BNqQdXt27fg@mail.gmail.com>
In-Reply-To: <CAO=notxOYwE=59zfOoxsuyazLrQ1UvuWV3sH4Z4BNqQdXt27fg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 10 Aug 2020 10:44:40 -0700
Message-ID: <CACWQX83bZvwuTkOR8=caHEnWAhO8wRpyrAXTRvct80auehd2xg@mail.gmail.com>
Subject: Re: External Sensors - phosphor-pid-control
To: Patrick Venture <venture@google.com>
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
Cc: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Before my last reply, I started playing around to make sure there
weren't any landmines there that I I didn't know about in building a
host sensor.

The totally untested, half baked result of what I wrote is posted here:
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/35476

Feel free to use it as a starting point if you want (or I take no
offense if you don't).  It still needs a lot of work, but hopefully it
helps you with some of the generic sensor boilerplate.


One interesting thing that this discussion might bring up is I wonder
if we need a detectable entity for "Host Operating system".  You
probably don't want your host OS generated sensors getting invoked if
the host OS utility in question isn't installed.  That might require
more thought.

-Ed

On Mon, Aug 10, 2020 at 10:11 AM Patrick Venture <venture@google.com> wrote:
>
> On Fri, Aug 7, 2020 at 3:44 PM Ed Tanous <ed@tanous.net> wrote:
> >
> > Most (maybe all these days?) of the sensor types support the concept
> > of an "override".  So calling SetProperty on the Value interface of
> > any individual sensor will force it to "stick" to that value, stop
> > normal scanning operations, and send out a PropertiesChanged event as
> > if it had just read that value from its hardware interface.
> > Here's the logic that PWM sensor uses for its set interface.
> > https://github.com/openbmc/dbus-sensors/blob/8b8bcc8700af5ba1d435c7cf0f6467b2b6a8c679/src/PwmSensor.cpp#L53
> > It's slightly special because it actually changes the hardware value.
> > Most other sensors derive from the common sensor class, that just
> > masks the value directly.
> > https://github.com/openbmc/dbus-sensors/blob/1a540b81a3697202f69771785cd22a31294154a7/include/sensor.hpp#L58
> >
> > A host sensor would be exactly that, just with the normal scanning
> > logic deleted, and a reasonable default value put in place.  I'm
> > assuming you probably also need a power on/off check in it to check if
> > the host is off, and revert the value to NAN.
>
> Ok, so someone would need to basically add a new daemon to
> dbus-sensors that provides ownership to host-provided sensors, and
> then it would just be a normal sensor for phosphor-pid-control.  One
> thing, I haven't checked is, with the json sensors there are timeouts
> set, so we track how often a sensor is updated -- is this supported
> with dbus configured sensors?

TL; DR; Yes, it's supported.

One important architectural distinction in dbus-sensors compared to
others is that a sensor has full ownership of its own scan loop.
There is no central manager telling each sensor "it's time to read a
new value now".
In the host sensor you implement, you can have whatever timeout,
masking, or scanning logic you think solves the problem at hand.  I
believe most sensors today implement reading as a failure count, where
if N runs of the scan loop result in an error, then the error is
propagated.  That doesn't make much sense for a Host sensor, so you'd
probably want to implement your timer idea in it with a configurable
timeout.
