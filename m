Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083A30B4A4
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:27:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV6ct3hPKzDr1Z
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:27:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PTcTVyEK; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV6bp43bMzDr1F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:26:46 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id q201so15267478ybg.8
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 17:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmKr2M/wRBlrPTZxCJEIdyNY311Pu/5oX4cGylRGkVA=;
 b=PTcTVyEKRAMSdx8l+aZsgZVks0zru4CFHoI21JldAExkqTbhWCQV49ef0m1F1hTKN7
 lgQYDMxi1218mMU/tnywSpPOwgoTy0ttJuqbZCh/kAYxpO5Q2/AgocfWDnTyUhyu0WmF
 zuOjm66jPa6SP8LjVtG9CaL0RqkMXDfthWHk5NcpS47HKvE6sm4cdSSn6zafUI+gD7bq
 A8LR77L/vnE34O12q108QTgsl1oAU34vL7u3M7uWT6RXXbk/h0H/z56biSlreRkPOmIk
 feATsrFKGBTllHDQikQgcAdPX4w+2RQBC0Bfhb727UIrt4rzf0IC5sGld14OCq+HapIL
 10zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmKr2M/wRBlrPTZxCJEIdyNY311Pu/5oX4cGylRGkVA=;
 b=do39yOA4+C+g/m3Gg3ZdVduPz4WnyYwzXv5oHLlf383WQdLuC0KoGBHgUida5dNvQ0
 /EXYMvaA+U7plHbg3hDbnbulv/Sh+fCdvHsfvC/AxMb7o363Un2go89DG3b+EL6B7gzx
 2UmHWwFp50Jlw/15octuuuNwkpxWlWfT+QKfzg1+/DIv0mOJ4iBUV/sdsSfyJarjSR04
 QTCXww5CnZh60jHMh6WrlhwumYrJs9pCSBGL2KBPnxu23ilsEx18G1wzYloeekdLJYaU
 ww5LumfhohxjhvyEnXba0ZMmtvEkllZZvM9CVAYWfSIdAhsjd0rUDFlzVTchJj2R6I66
 Gi6Q==
X-Gm-Message-State: AOAM530c+OeiNIvjwbbVzv6nRPOzB1GpqZig+237/zxRxEqeJCfy8ptW
 Q88SAKVVesOd+OW14KybYoV/ctFk9oHDy7ED51djhrYbAfakTwcp
X-Google-Smtp-Source: ABdhPJwrpLnJwge/Gwfo62SHzGgNwWYJ5IvSBoKFtFiasHFSh7TPIxDoewp1C+PmMXhxCpvG/R1HSijsQHf8mPLzfoc=
X-Received: by 2002:a25:d0c4:: with SMTP id
 h187mr12433094ybg.209.1612229202071; 
 Mon, 01 Feb 2021 17:26:42 -0800 (PST)
MIME-Version: 1.0
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
In-Reply-To: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 1 Feb 2021 17:26:31 -0800
Message-ID: <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
Subject: Re: Sensor Value PropertiesChanged Events
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 1, 2021 at 4:44 PM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
> Hi All,
>
> There is an issue and idea that James Feist and I chatted about to maybe
> relieve some of our D-Bus traffic.
>
> A major contributor to our D-Bus traffic (as seen in dbus-monitor) is
> the polling sensors updating the xyz.openbmc_project.Sensor.Value.Value
> property on each polling loop, which generates a PropertiesChanged
> signal for every sensor on every polling loop (once per second?).
>
> The concern is that more important D-Bus messages could be getting
> delayed as D-Bus processes these Sensor Value signals.
>
> The idea to fix this is to change the sensors with a custom getter on
> the Value property, so the last read can be pulled from D-Bus using a
> get-property call, but it would no longer signal a PropertiesChanged event.

Doesn't this break..... like... everything that relies on sensor
values changing over time?

>
> I pushed a proposed change here:
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/40199.
>
> Our original assumption was that nobody was matching on this
> PropertiesChanged signal for the Value property; however, it was pointed
> out to me today, that PID control has a match for it and may be using it.

Pid control, telemetry, redfish event service are the ones that
immediately come to mind.  It should be noted, dbus-sensors even uses
that message internally for things like CFM sensor, which has to base
its output on a transform of other sensor values, so there'd be a lot
of stuff to fix if we did this, we'd have to make sure it's worth it.

>
> So, I wanted to start a broader community discussion about this issue:
>
> 1. Is this a real concern or are PropertiesChanged signals so
> lightweight that removing them won't help with D-Bus load?

It's a valid concern IMO.  It's arguably the current limit on how fast
we can scan sensors on large-sensor-count BMCs.  In terms of
dbus-sensors architecture stuff, it's next in line on my priority list
after the whole "reading sensors from hwmon blocks the thread"
problem.

>
> 2. Does anyone need to match on sensor Value property updates or is
> reading them with get-property enough?

See above.  Lots of stuff needs property value updates, and moving all
that stuff back to polling doesn't really seem like an option, or a
good thing.

>
> 3. Does PID control use the Value match?  If so and there are benefits
> to removing these signals, could PID control manage without them?

Phosphor-pid-control and friends could theoretically move to polling,
but that seems much much worse, and increases the dbus traffic
overall, given that every poll would now have to go round trip through
both processes, instead of one way.

>
>
> As a side note, I still have two remaining services that publish
> PropertiesChanged events on sensor Value properties:
>
> PWM Sensors.  I have a proposed (and untested) change here:
> gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/40200.
>
> A Power sensor, that I will track down based on this discussion.


One thought I've had in this area was to rearrange/redefine the dbus
interfaces such that a single properties changed (or equivalent) could
batch multiple sensor values together, thus avoiding the per-message
cost, while still keeping the eventing available.

The three basic strawman ideas I've had for this in
phosphor-dbus-interfaces yaml would be something like

NewSensorValueValueAPI
- name: Names
type: array<string>
- name: Values
type: array<double>
description: >
The sensor reading.
- name: MaxValues
type: array<double>
description: >
The Maximum supported sensor reading.
- name: MinValues
type: array<double>
description: >
The Minimum supported sensor reading.
- name: Units
type: array<enum[self.Unit]>


Because all properties are vector<double>, and Names are specified in
a single property, the PropertiesChanged events could batch together
10s of sensors in a single message, and use a tombstone value for
"haven't updated since the last update"

The other thought was we could completely delete the Value property
from Sensor.Value, and replace it with a SensorManager that would live
at /xyz/openbmc_project/sensors, which would publish a
SensorValuesUpdated signal with a dict of name and value, again,
allowing sensor producers to batch the sensor reads, but still keeping
it reasonably close to the existing API.

In both cases, the implementation in dbus-sensors or phosphor-hwmon
would be something like "read as many sensors as I can in 250ms, then
batch it up and send out one event" the 250ms timer would help with
stuck sensors, and avoid a lot of latency if the system is overloaded.

The third one is a little more out there.  We could change the
sensor.Value.Value property into an FD type, and point to a memmapped
area of memory into which we write the current sensor value.  That
way, the "sensor value" on dbus rarely changes, but you can always
read the current state of the sensor with zero overhead or context
switching to the sensor processes.  If this works, it has the
potential to speed up most sensor polling operations by an order of
magnitude, but seems hard to do, and has a lot of questions.  Does
inotify work on mmaped files?  How do FD permissions work when sent
over dbus?  How do you "lock" the memory region to write it (or do you
not have to)?



With all of the above said, I think we really need to take a look and
profile why individual dbus messages are so slow, and if it's fixable
at a lower layer than the interfaces.  I know there were some efforts
to put the broker into the kernel that kinda petered out, but I was
never clear as to why.  I wanted to try grabbing those patches to see
what performance benefit they gave at some point.

>
> Thanks!
> -Jason
