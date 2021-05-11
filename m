Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4B37ABE2
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 18:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffjxb2wwSz303X
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 02:27:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=fxDxiNuW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fxDxiNuW; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfjxH3pYRz2xv0
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 02:26:57 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id b7so25883693ljr.4
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPwF/mMBEbCPWkqiQ+zdmqL2njUv1sv3f4Km/WVmyPs=;
 b=fxDxiNuWzIiSGNWMoeLJ3o7ib1ZWtlEJsWtKlCoKTwjAIbSJpExrAsJoyG86VwMYrN
 RFOTfkE3iDVFQBjfINy+rdOc6r1myUM3BzAmii8Fza+lmBlobCr6BOqjIV+YlIvJBi58
 h6cS0t9gQbSx5PPERgziurdOtviMPVUbxC5qANvIGIHeP8WakfwN61RDlLJ1SkHUd4o6
 7V4cDM8IbNYzw1V6GfG6LQpthiWV7sKG8tS982KQqpY3l0Ic3apy+QsmoC+dHg1d592o
 8rsvHVoKaO1XhutWx+7ruKA36dHd9wi8iMGjw4EERsrgXCxSCwYqiE6YvKLEczJswwEC
 LjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPwF/mMBEbCPWkqiQ+zdmqL2njUv1sv3f4Km/WVmyPs=;
 b=qFGl00IQWhFMrD+rWhuDHL4aDQ9zLeEC6VWVVweB67XMF06SeYauZVrHjmoQEmDaE3
 Plg3/CO5pC2AUIdhd7K7B0Tmg18OEZYFngrTaQZbNTK1miHFk4Bqqfy60Z3h6cCBIX9N
 8aUiF/LD2xHEWiLvQsQyfEUoMbDh4OZ2I5cc85Ub5qmmseCkdyXYGqgrpSHMbE8jDQqH
 icUbQsldmXxOM0zq2bI/USJOhVnTNvc0f4gYq3FBqpjMaIDFFLKkF/+CmZ7JleDLBUVl
 R8YUn6WAqKOEIw1w8J+5En3XAtagdjrdi05brx1d4cuoG/nInSkTom6Kl4ftHDZNjvf6
 F7Ug==
X-Gm-Message-State: AOAM530rdnVAAzJxT+uR0DvptuvSTu7y66oisyIftFur0qUVtXofiyMR
 DNnF2FqWawiHqIKscERjVb2YPsUdlZfsjtTkbmvqyg==
X-Google-Smtp-Source: ABdhPJy+jZPcy7hZtDznB7o8GWFrR3ZCXfgjDAZiwqCf+Dt/aS6l2FjDXdszubWIV/V+o+FBQdXnjK5aiTJPclM3yvg=
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr4563284ljj.337.1620750412145; 
 Tue, 11 May 2021 09:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <YHBDIZqvHI0THFh3@heinlein>
 <3d5f8ede-3506-afac-d5bd-4bc7f3331cbc@linux.intel.com>
 <YJqaKhKlZ7BZCGA9@heinlein>
In-Reply-To: <YJqaKhKlZ7BZCGA9@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 11 May 2021 09:26:41 -0700
Message-ID: <CACWQX82QSD=1nZAYkP=CO=-ch_YcbRXmyvLt743F-hGspTNPqw@mail.gmail.com>
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 11, 2021 at 7:53 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Apr 27, 2021 at 01:52:51PM +0200, Ambrozewicz, Adrian wrote:
> > W dniu 4/9/2021 o 14:05, Patrick Williams pisze:
> > > On Wed, Apr 07, 2021 at 02:24:55PM +0200, Ambrozewicz, Adrian wrote:
> > >
> > > I suspect this would be the more difficult direction to go down.  There
> > > is already enough code that looks for sensors at specific paths that
> > > you'd have to track down and fix up.  Also, there has been some concern
> > > by some maintainers in other cases about having information in the paths
> > > have meaning and prefering to reduce the reliance on that.
> > >
> >
> > Please see message from Ed, as he's supposedly proposing to follow that
> > path. I don't have strong opinions on one or the other approach.
>
> I suspect you are not signing up to change all the existing code.  I'll
> look at Ed's reply though.
>
> > I've read the design, however one thing is not clear for me. My current
> > understanding was that for each association there would need to exist
> > some D-bus object at given path somewhere. Would i need my CPU inventory
> > service to also expose separate objects for each core for my association
> > to be 'legal', or could we represent some virtual hierarchy with no
> > actual D-Bus object in the system?
>
> Yes.  You would need an inventory object for each entity you want to
> attach sensors or metrics to.  This doesn't seem like it should really
> be an issue.  Other people have been working on adding CPU Cores already
> and there is the xyz.openbmc_project.Inventory.Item.CpuCore defined.
>
> > >> I've done some PoC implementation of ProcessorMetrics, which relies on
> > >> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
> > >> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
> > >> queries D-Bus for all sensors associated with given CPU and populates
> > >> properties if proper mapping was found.
> > >
> > > I'm not really grasping what the contents of this mapping property are.
> > > Generally we want to stay away from free-form strings having programatic
> > > uses.  Maybe if you can define these mappings as enumerations?
> > >
> > > What is the additional information you need besides the assocation from
> > > a sensor to its inventory item?
> >
> > In given example I would like my sensor to be source of information for
> > property defined by ProcessorMetrics schema. In the example I've used
> > property associated with given Core, thus CoreMetrics/12/UnhaltedCycles
> > maps directly to ProcessorMetrics sub-property. Enumerations could be
> > not enough as we have multiple informations to represent:
> > - association with given processor (done by ProcessorMetrics)
> > - association with given core (could that be handled by your proposed
> > design?)
> > - linking to given property
> >
> > Would the enumeration be used for the last element, while leaving
> > hierarchy problem to Associations?
>
> "UnhaltedCycles" is not a sensor, just to be clear.  IPMI might have
> called these kinds of things sensors but we do not.  Sensors for us
> measure physical properties.  This is just a property (or maybe a
> "metric") but it doesn't belong in the sensors namespace or modeled with
> a Sensor.Value.
>

This somewhat brings up a good point, what is a "sensor" on dbus?  I
would've assumed that these would be well represented as sensors, as
they do measure physical properties.  I hadn't assumed that they had
this limitation because we do have the
/xyz/openbmc_project/utilization namespace defined already.  If we're
going down the path of "must be physical" it would seem like
utilization should be moved out of the sensors interface?  Or am I
taking your statement too literally?

Not reusing sensor seems like it would lead to a lot of code
duplication, as every API would now need to understand everything
about every "publishes real time telemetry" type interface, and every
time we add a new one, we'd (probably) have to update the code to add
the new type.  That doesn't really seem maintainable to me for every
type of telemetry we might want;  If a sensor isn't the right place to
put it, how would we solve the "I want to publish all telemetry
values" type use cases?  Maybe namespace the interface itself, so we
can use the arg0namespace feature in match expressions?  I'm thinking
out loud at this point...

> I don't know why the "linking to a given property" would be a dbus
> representation.  Metric service should know which properties from dbus
> map to some metric entity, right?  For a one-user piece of information,
> I don't see a good reason to put this on dbus.

I think the issue here is how do you know that a specific value
relates to say, the processor utilization, or the ram utilization, or
the smart statistics?

>
> --
> Patrick Williams
