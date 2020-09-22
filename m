Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFCD2749D8
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:14:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwsw20ywtzDqSy
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:14:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=U0OnUT3r; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwsvH03kpzDqPv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:13:26 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 133so6476681ybg.11
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKACa69ml9lR9uS4Bbh1fkI5mBhtyAQfI+3J/c1e9es=;
 b=U0OnUT3r73yiXg5cbJ+yg9akkCxMS4qP02z1j6wpr7/Mljz0fRarud7KreVbGThtJL
 PU11IN20xxHLEMnPPKHIgVfe3qZwFpskH2140kVhD6Xi5mMujHsQQ9zvQXnI9W7v6THX
 B6ye+sJ82zlIHIqdTgGAfF4O/QnllGB13dvZGQObbB99T/ae2rWIBQvTbiWE7T6rNsy0
 JxjdB62VF25ImRiWgkiWy6dIboF6h6CsAN3nX6t+0I5XSa0X0A1Uuwvr4zQTUSx+VeLK
 jMzrSxibMMWDFtvIWIxlFhikbSNoPJGlrCji93lPTxo/aDya65TSrDgdfHVNdCkLLlkA
 IKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKACa69ml9lR9uS4Bbh1fkI5mBhtyAQfI+3J/c1e9es=;
 b=lvGHO1b/zwGVXM+zkVzRK/2XDo/6BmI49NDjfaFy7AqmwKOYCGkVWxEncOKwIoje2p
 7X0fXgLKdwKIYcJlkaVmc10C4gb3t7kYVwcswWOyXW8a6SRL2WG+iwkj6oI47DvUJRZX
 3xnFDVdxo3BBemn9s5zxBKgOBq2JM5MW9VIkB6pcIbHnVjA7hEUN6wpS+CibKKcpBNYa
 cE/eH3f4JEpouUGaI8omHlvp5yOzph3StIW2X1mC+z8kNJaCEExPCjdqVBm/IrhLobd3
 yBps4MPrklQUrGh+KKxI8FehzIOA6hIBuRXzE3LC6cpq6OKGaLNLdi4MU0lqNODE8MYv
 EYgQ==
X-Gm-Message-State: AOAM530GpTXnbK+6ywJPIYIOMwr2t7vk4fi3vnMjjdM9/Tzge9CtTuu/
 T9pXJ3AR8v+E008+r+0941mld5j83nF0VkRqefJcRsMhIkLBK1ZeEeE=
X-Google-Smtp-Source: ABdhPJwlCGeMpEzz8y0DGK17FGKtkuCLERqwjX2m4hCNZ8WpBRKf6RWnazGSBIdLpNLtVZTDIlQ9CB2fcvFsahU8Phc=
X-Received: by 2002:a25:19d6:: with SMTP id 205mr1886084ybz.170.1600805602439; 
 Tue, 22 Sep 2020 13:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <5be978dc22cab7b5443c7d256b1cc06a8350363f.camel@yadro.com>
In-Reply-To: <5be978dc22cab7b5443c7d256b1cc06a8350363f.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 22 Sep 2020 13:13:11 -0700
Message-ID: <CACWQX814cJ7WkSJCW6=_ZiEaMooQHcGv=6Eexxdk2=YJGKs28g@mail.gmail.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
To: Andrei Kartashev <a.kartashev@yadro.com>
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

On Tue, Sep 22, 2020 at 12:52 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
>
> >     Minor amendment again.  I'd much rather the IPMBSensor daemon
> > simply
> >     create the same interface that fru device does, rather than
> > adding
> >     IPMB logic to FruDevice.  In this way, platforms that don't have
> > IPMB
> >     don't need to include the feature at all.  Also, all the IO can
> > be
> >     managed in one place.
> >
> > https://github.com/openbmc/dbus-sensors/blob/master/src/IpmbSensor.cpp
> >     Ideally, your IPMB device would also have an SDR that details
> > what
> >     FRUs and sensors exist, so that the inventory can be read and
> > posted
> >     to DBus at startup.  If they don't then we might need a static
> > mapping
> >     from an EM config once the device on the other end is detected
> > via get
> >     device ID.
> >
> > I agree with Ed here, all ipmb related interfaces should be
> > implemented here.
> >
>
>
> I disagree here.
> First of all, IPMBSensor located in dbus-sensors package and it is
> suppose to handle SENSORS.
> FRU is not sensor, it would be big illogical
> mistake to put FruDevice code there.

WIth respect, dbus-sensors is a repo that's not aptly named these
days.  Ideally when this first started we would've called it
dbus-entities, but alas, that's history, and unlikely that we'll
change it (although I'd support you if you wanted to propose that).
There should be no expectation that dbus-sensors contains only
sensors, nor that dbus-sensors is the only place a sensor can be put
to dbus from, neither of which are true in the codebase today.

> Then there are already number of places in OpenBMC and related projects
> uses FRU and implements encoding/decoding by its own. I already spend
> lot of time debugging different behaviour of FruDevice and ipmitool...
> You propose to fragment FRU handling code even more and I against this.

Lets centralize the logic in a library, and move the other
implementations over to it.  Then we have a single source of FRU
parsing that all can use.  This is likely to be a problem in another
spot now that NVMe has adopted IPMI for their VPD format, we'll need
to duplicate the logic there as well, so we'd be solving future
problems (hopefully).

> We at least should then extract data-source independent code from
> FruDevice to a kind of library to use from different daemons. But I
> prefer to do opposite - extract impb i/o code to library and use it
> from both IPMBSensor and FruDevice.

My issue with that is that we're birfurcating the control of the IPMB
device in multiple places.  The easiest example of a problem this
causes is an IPMB device that needs the sensors to stop scanning while
it's doing a firmware update.  Having the control of the device
centralized in a single process like that avoids cluttering dbus, and
makes it more likely that IPMB code can be reused between the
use-cases.

Also, keep in mind that IPMBSensor is far from done, nor what I'd
really like to see.  In the next few years, I very much expect that it
will need to parse the SDR as well to automatically populate sensors.
Doing that in 2 places (FRUDevice and IPMBSensor) is inefficient, when
they could simply share the SDR parsing code in a single place.

>
> --
> Best regards,
> Andrei Kartashev
>
>
