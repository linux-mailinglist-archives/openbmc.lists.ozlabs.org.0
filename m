Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB4240BA9
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 19:12:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQMw85P9mzDqVW
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 03:12:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UWymLrvh; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQMvK0z3tzDqPM
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 03:11:39 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id w9so7309093qts.6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Z8QxYuOML9Rc3LIhZ5qqON8a2nAPr5hDflNQLbRfmVo=;
 b=UWymLrvh8+iJLH71dT0SEUpSSoLxxiqUABPbJLyWHMppfK51iIzuJgXUQfF31mKvjK
 fYEfkf+ssT5LvXfMb2x1MHr2Z55COw2IyIL11Qc4SWjRbTEhKG9H7qo6/fEeruI7twRt
 oYJdO4FqDoA6Xz5Eep+sr1Nn/+5kRXs3JkKtgwfXLhthKBShJbtCcp6v92OLd5UG3Hz/
 WPN7NjbVdJC6CX18gK8MFOiJwUzVtqS/9jctjSENtA+gUjMFsNV6XyOrUOmzfz9bofeC
 IEYt7D0qI5Meo2uQh36qJhSO7OCiFk67uSBBuh+32nuPXWZUFlOQTWHGShM1urrAuc+X
 kC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Z8QxYuOML9Rc3LIhZ5qqON8a2nAPr5hDflNQLbRfmVo=;
 b=n3JAdNFtdJ8MyD67Okong8jJdc1iIIZharUSu4UVQ+AnywDSgOmvQJqcMNHmaRYGKE
 +zdxTGVSXLwvG/Z1se2RlsPqNDtlGjErI+Ku2+3JT7HRrfTf4RV1zZVn6CGgIljbVWC2
 S0Qsar9HC7oXY09XSsUCDWcGhUtCigOeHOPZVj/d9GLocjMf7bhw4DWwEs4dG///Vtwh
 AkLIh/5qsCJjGKyL34UUyBPDNPhw2ZTnMQfXMiTaCjnQwseFeFPEk45lbHwB3/h9YktD
 N+24pL2Jko6gIAqs0Z1A8LJPzQLk+KIiJwss5/tP11LPBDYqEhxR+unSJYLeeSMECcXJ
 Mp8g==
X-Gm-Message-State: AOAM532eRqYjtZPWvM25EtaazNVZlniH63OcOqZUABw7cIs6PtaRvZGs
 2Lshe0/m1axVPbbmeCBquf6WaufcO+miJOeiA7uo8cqn
X-Google-Smtp-Source: ABdhPJzqB6yU317PdQ2yoqtFkxgR+2Y+S7RiJYbdN3Mber/RngExa5Ioojvp1uoYMbcKhlpwtykgrYQwLlpcusXeVIg=
X-Received: by 2002:ac8:478e:: with SMTP id k14mr28706582qtq.21.1597079496227; 
 Mon, 10 Aug 2020 10:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwjyJJk5wfPBJ_=7ffS_988YwR7OJ-WAYCvJ1rBCq6oBA@mail.gmail.com>
 <CACWQX82bOe=XMoyd9XsyJecLFeVzV6FMu+Zw_US=qSUuBcK3QQ@mail.gmail.com>
In-Reply-To: <CACWQX82bOe=XMoyd9XsyJecLFeVzV6FMu+Zw_US=qSUuBcK3QQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Aug 2020 10:11:25 -0700
Message-ID: <CAO=notxOYwE=59zfOoxsuyazLrQ1UvuWV3sH4Z4BNqQdXt27fg@mail.gmail.com>
Subject: Re: External Sensors - phosphor-pid-control
To: Ed Tanous <ed@tanous.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>, Josh Lehan <krellan@google.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 3:44 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Fri, Aug 7, 2020 at 1:12 PM Patrick Venture <venture@google.com> wrote:
> >
> > As you know
>
> Hah.  I totally didn't know it did this, but looking at the code, it sure does!
>
> > the json configuration of phosphor-pid-control supports
> > "external sensors" which are sensors that phosphor-pid-control creates
> > itself and publishes to dbus, expecting IPMI (or other) to set the
> > value.  This is used for cases where the host can read sensors or
> > information that the BMC cannot, and basically give it some missing
> > information.
> >
> > From the query phosphor-pid-control does in dbusconfiguration, I don't
> > see a way for it to find these sensors that it must create.  i was
> > thinking, something in the profile that entity-manager publishes could
> > tell it this.  But, since it doesn't show up in the sensor query, I
> > think it'll be something more.
> >
>
> I don't think we ever used this for anything.  Looking at the examples
> in the repo, it looks like it was used for reading fan tachs and
> monitoring the results of margin sensors from the host (ie the
> fleeting sensor)?
>
> In an entity-manager + dbus-sensors setup, we would ordinarily use
> TachSensor, which comprehends the idea of what a "fan" is, and adds
> its tach as a sensor.
> https://github.com/openbmc/dbus-sensors/blob/master/include/TachSensor.hpp
>
> And PWM sensor
> https://github.com/openbmc/dbus-sensors/blob/master/include/PwmSensor.hpp
> Which understands the idea of what a PWM output is, and adds it as a sensor.
>
> Breaking these out into individual applications makes them _much_
> easier to remove, and replace with other implementations, which allows
> doing things like simulating thermals without necessarily having a
> physical fan available.
>
> I don't think entity manager has anything that covers the "host has in
> band sensors it wants to expose" use cases yet, but it would be a
> relatively easy sensor type to write.  I'm a bit surprised nobody has
> written it yet.  I suspect a new sensor type is more in line with the
> separation of concerns model that dbus sensors currently takes, rather
> than putting it directly in phosphor-pid-control.  With that said, I
> wouldn't be against adding a config option for the latter if that's
> what you're inclined to do to minimize the changes, it will just look
> a little different than the rest of the sensors.
>
> Most (maybe all these days?) of the sensor types support the concept
> of an "override".  So calling SetProperty on the Value interface of
> any individual sensor will force it to "stick" to that value, stop
> normal scanning operations, and send out a PropertiesChanged event as
> if it had just read that value from its hardware interface.
> Here's the logic that PWM sensor uses for its set interface.
> https://github.com/openbmc/dbus-sensors/blob/8b8bcc8700af5ba1d435c7cf0f6467b2b6a8c679/src/PwmSensor.cpp#L53
> It's slightly special because it actually changes the hardware value.
> Most other sensors derive from the common sensor class, that just
> masks the value directly.
> https://github.com/openbmc/dbus-sensors/blob/1a540b81a3697202f69771785cd22a31294154a7/include/sensor.hpp#L58
>
> A host sensor would be exactly that, just with the normal scanning
> logic deleted, and a reasonable default value put in place.  I'm
> assuming you probably also need a power on/off check in it to check if
> the host is off, and revert the value to NAN.

Ok, so someone would need to basically add a new daemon to
dbus-sensors that provides ownership to host-provided sensors, and
then it would just be a normal sensor for phosphor-pid-control.  One
thing, I haven't checked is, with the json sensors there are timeouts
set, so we track how often a sensor is updated -- is this supported
with dbus configured sensors?
