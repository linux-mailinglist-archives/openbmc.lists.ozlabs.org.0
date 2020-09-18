Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFF2703FE
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 20:30:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtMnx5sDBzDqtV
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 04:30:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=l3BWH5wY; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtMnD0NV3zDqpJ
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 04:29:31 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id r25so7942425ioj.0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qzd3MfFiWOxbVKF6BkDz/Q1zS+PoTQtDgNaPqMrGB9c=;
 b=l3BWH5wYS77NP32qyc9pyENl4qlW0Jppf9MzzWkcO/UJ2B0ofscSjO/lgOqLfEK1zt
 I6hWbSvYDI2Jz6SVG+tQIpyYhNNNQAYmzW1TRzwRRlTeg0obVaFweXs1aGBaC1eDSwXZ
 gm+eNW+ONgU8FIdZJ/4MpjOer5V+65Xa6UEMCnZwvK3r1tszSA2nlqUv4UUviYlo4eWW
 mIqEB8FlBDNs7BqwnbBczxa9IDPZo36T0ifUMaWWUG8f2sZxPHVQ3T/2tIL6ruPjvT5o
 W2BdtQZkbuxcBNRBEqzhgBa1E3e+5E4QqJhP+OXFdke5ul2+deO8xl9l3Rr8lLUXeJAt
 xu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qzd3MfFiWOxbVKF6BkDz/Q1zS+PoTQtDgNaPqMrGB9c=;
 b=Wb/HHUBklXXrm+h53pwHlA2jv9GX0vF66pnstksjwbGEhPr0+HwSPEfEnP38uJSgjl
 zsHQRTKs3BMzCnxXv3NPrKolzid1Kq3wm8OMx/T4L65KfxRy+FJ2woYnU4ccMglajoIY
 H3sc9gfecN49VvPMIgN900FIvc+9jbSR5MHd86Fj+xByooPo+sJZxJBmxJaQCF7c41Db
 UoJXzBzBlrmjcYyqvlVjtJHGdOaPHdW4AzQhyup7cGd/ocDugHlquhqvcwZ2HmYiBt9z
 Wh4/y8ovkijm0mN29MDevJQNhqPfzq1t6CH2yjQEDeDA6q5+IIOc5B87Jw3BItdUZK2O
 gdRw==
X-Gm-Message-State: AOAM531RrAH1IdBe3qm1WuYmW+phaV6JnXWYMB3J7TQgFxuwYv5Ao+7o
 erhg8qbhkGaTEvdDwlozg8V7oTVyRJQiv8I9w2S05w==
X-Google-Smtp-Source: ABdhPJzWBvZQX1ny24apdrwhRl56ngQnM0RYsnxCVg8funvZqvc12RCVBvE+cABjMndPk9y5w8M18GDre5EgU8NMnEo=
X-Received: by 2002:a6b:8b52:: with SMTP id n79mr27729948iod.122.1600453765678; 
 Fri, 18 Sep 2020 11:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
 <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
 <c2760962bf75625e06c5a85663faff9ef64cecd2.camel@yadro.com>
 <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
 <6df4dd0dcc61aa0a11396ec8cfd3d073416ca272.camel@yadro.com>
In-Reply-To: <6df4dd0dcc61aa0a11396ec8cfd3d073416ca272.camel@yadro.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 18 Sep 2020 11:28:48 -0700
Message-ID: <CADKL2t7zZbsTVyem=zS3QeOPFb1ngAP=skyRtmrK5vJpHu7eVQ@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Sep 2020 at 11:23, Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> I'm just curious, because I don't really know how does pid-control
> actually works. Let's say we have following zone configuration (EM
> configuration file, unrelated PID parameters are hidden):
> {
>     "FailSafePercent": 100,
>     "MinThermalOutput": 30,
>     "Name": "Main",
>     "Type": "Pid.Zone"
> },
> {
>     "Class": "temp",
>     "Inputs": [
>         "DIMM [ABCDEF]\\d+ CPU0",
>         "DIMM [ABCDEF]\\d+ CPU1"
>     ],
>     "Name": "DIMM ALL",
>     "Outputs": [],
>     "SetPoint": 80.0,
>     "Type": "Pid",
>     "Zones": [
>         "Main"
>     ],
>     ...
> },
> {
>     "Class": "temp",
>     "Inputs": [
>         "EXIT_AIR"
>     ],
>     "Name": "EXIT_AIR",
>     "Outputs": [],
>     "SetPoint": 50.0,
>     "Type": "Pid",
>     "Zones": [
>         "Main"
>     ],
>     ...
> },
> {
>     "Class": "fan",
>     "Inputs": [
>         "SYS_FAN"
>     ],
>     "Name": "SYS_FAN",
>     "Outputs": [
>         "SYS_FAN_PWM"
>     ],
>     "Type": "Pid",
>     "Zones": [
>         "Main"
>     ],
>     ...
> },
>
>
> How would it work? I was sure pid-control would examine all the sensors
> and try to keep temperature below setpoints: 80 degrees for any of DIMM
> memory sensors and 50 degree for exit air. If so, what is the benefit
> to use this virtual margin sensor?

The most important use case is mixing absolute and margin temperatures.

Some sensors in a zone are only readable by the host, so there's a
service that collects that data and calculates a worst margin. This
margin is sent over IPMI to the BMC, but then needs to be combined
with the other, absolute temperatures that the BMC can read directly.

>
> On Fri, 2020-09-18 at 08:49 -0700, Patrick Venture wrote:
> > On Fri, Sep 18, 2020 at 1:06 AM Andrei Kartashev <
> > a.kartashev@yadro.com> wrote:
> > >
> > > > This daemon is intended to be used in combination with
> > > > phosphor-pid-control. You define a configuration file with two
> > > > sections: sensors and zones.
> > > >
> > > > Sensors have a D-Bus path to read from along with a target
> > > > temperature
> > > > and some other parameters. The daemon subtracks the current
> > > > temperature from the target temperature to get the "margin". A
> > > > smaller
> > > > margin means the temperature is closer to the limit.
> > > >
> > > > Zones group sensors together and look for the worst (lowest)
> > > > margin
> > > > value within that group. This value is then exported for use in
> > > > phosphor-pid-control.
> > >
> > > I wonder, isn't phosphor-pid-control do the same by its own? How
> > > does
> > > it works inside pid-control daemon, when you set several thermal
> > > sensors for one Zone an set setpoint for each of them?
> >
> > Not sure what your question is, but yes, the pid-control daemon can
> > host its own margin sensor values that are populated externally,
> > however this is only supported via the json configuration at present.
> >
> > >
> > > --
> > > Best regards,
> > > Andrei Kartashev
> > >
> > >
> --
> Best regards,
> Andrei Kartashev
>
>
