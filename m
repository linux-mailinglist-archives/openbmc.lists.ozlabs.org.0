Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7A6E7A2
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 17:02:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qvNh3RB1zDqwH
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2019 01:01:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DBHA0Fl1"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qvN40XhGzDqZn
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2019 01:01:22 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id k8so59102890iot.1
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEBhUOv9s7OID99O9jP/SJSPEgHp4PNqWhmjsUZMlac=;
 b=DBHA0Fl1LZaeNUONrrVfDPTYyDYH5mPcAPPZ1z2HJuvlsxkB/Hj2677jQnGEe4x0D9
 ZnBCkiXDn1ak3unx9epLhvickL5cUr0GKmfaDLyW77KCzZo9/iIUWWSr1nTBdE6DuNGb
 rDkcttC1oy3sbTFodyjNdNNX2vJeh+AGgjmA8bUM5E1KQ+GIAqPLpqhR/di2ipvGbfdR
 rqfYxQfr4ZI8VE2LB/p0Jgw+vzdRtoYVisnCRHUjR1C5+O7rf7XJJS616O7Wi58t+cPY
 OSXTY0q7XwD6E6Eifuj8Sfivgq+6Y3qNeQA1trhZ599nBlc+V1o8jrL/nPXhngRa+ilc
 AJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEBhUOv9s7OID99O9jP/SJSPEgHp4PNqWhmjsUZMlac=;
 b=VWmIikvnNjE5z2OBlZDxsKVTzeGkk98y3uJpygc6f6YfYy0pRU55GAtA7YpR2zTBcT
 gS9/h3HAbCa74DXFQrYjuX3HadSOdoRwoorH4W+KtruBDQ4N6bWyKKh/GIDcu0opDDff
 sgfN2UQ2WmqwnnIrgNkZ9l1xJ2yN/ZGhERtU56mf1WbVUic3eDNCllNg581ecVKX9jv4
 0m8PEuuZzROzvbscqbtXD0KJC1pH5n4wS0FUodTP2xvV9fe8Qdk+7UHALaIBISloC9sC
 Y6/IL3REEE/yTwexla+pwU7wjNaV94mnRNvbQwvoSAk/J+T6APFzZc+wWVVSzEcEF2Zu
 N0Vw==
X-Gm-Message-State: APjAAAVJU42xqprvW3rOM1ZDULUofLDA3VTsjZZkTpVNZo+/ODW1fnFA
 gyBLNELtiVIY3lojE+TXvi4xRdp8ysWE+3h6qlSzVQ==
X-Google-Smtp-Source: APXvYqzI7CUF2WP3ndK5sjYyg2nZiHc4sYvmEbUHgHJO795dRyKPsOp3oQg1zbS+Pmd/lbFauE9f/nAuQKLviZAwsVA=
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr49559061iok.52.1563548478839; 
 Fri, 19 Jul 2019 08:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
 <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
 <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
 <CAO=notw6jitPk-OuA2OGxqBEm38nVY5sa1C0KKx0TfYi=0qpnQ@mail.gmail.com>
 <a8159cb7-9b54-8682-98aa-c1133d042c2b@linux.ibm.com>
In-Reply-To: <a8159cb7-9b54-8682-98aa-c1133d042c2b@linux.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 19 Jul 2019 08:00:00 -0700
Message-ID: <CAGMNF6XPSicK7cjyfs+W0On2Modc5RWMaOo8yV2TuMBY6Jb4Ow@mail.gmail.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, Brandon Kim <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the feedback! I started working on refactoring the code a
little and now has more ideas. To avoid designing over email, I will
write a succinct design doc on several proposed improvements:
1. The feature I mentioned, customizable error behavior.
2. Change the underlying read to be asynchronous and non-blocking
3. Some general refactor directions. e.g. better abstraction of the
sensor interface

Comments inline in response to previous questions:

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

Matthew: Ack. My point is to fold the REMOVERCS into one of the
configurable options.

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

Matthew: That's what I thought originally, but defining a timeout in
userspace actually gives better control. Relying on ETIMEOUT returned
from the kernel is not optimal since the kernel driver could have a
long timeout (I think SMBus kernel driver timeout usually is around
10-20s), a longer timeout (some of the regmap_read* functions times
out in 2 mins in my experimentation), or possibly no timeout at all
(think about a bug in kernel driver!)

> >>>> - invalid value
> >>> This is another area I'd be interested to hear more on, how would one
> >>> go about defining when a value would be invalid? Or is this a simple,
> >>> negative values are invalid for a sensor that should always return a
> >>> positive value?
> >>>>

Matthew: I'm thinking the upper/lower thresholds can be defined in the
configuration file. Arguably this definition has some overlap with the
sysfs crit/crit_alarm attributes, and it would be nicer to have a
single representation. Maybe phosphor-hwmon should just faithfully
represent what sysfs reports and leave interpretation to the receiving
end.

> >>>> "error retries": number of retries before declaring the sensor has an
> >>>> error
> >>> This would be great to have configurable per sensors, however a
> >>> possible issue here would be allowing too many retries causing hwmon
> >>> to take too long. So this should be capped or controlled in someway
> >>> with the delay between reads as well. Right now a sensor is allowed to
> >>> be retried 10x's with a 100ms delay between each attempt.

Matthew: definitely a good point. I find this 10x to be quite
arbitrary though. What if the sensor is just not available at the
moment, until 10 seconds later? For example, a sensor on a pluggable
board that's not powered on until say 1 minute after BMC is up?

I haven't thought carefully but presumably the hot-pluggability is
something that phosphor-hwmon can handle with the help of several
D-Bus tunables.

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
>

Patrick/Mattew: good point. In my mind by default most options could
be per sensor-set, but allowing a sensor to override the set default
doesn't sound hard. (like what REMOVERCS already did)

> >>>>
> >>
> >> I like this idea.  Hopefully the defaults can be kept the same as they
> >> are today so users of
> >> today's default settings wouldn't have to change their config files to
> >> keep things the same.
> >>

Matt: I think so. I agree at least for now, backward compatibility is
needed in terms of default behavior given the same configuration
files.

> >> Another thing we've been thinking about adding is the ability for
> >> sensors to only be
> >> read when the power is on,   though there's still some invention
> >> required as to how
> >> to represent this state on D-Bus.

Matt: I'm thinking a more general case, where entire *sets* of sensors
can appear later in the game. I know entity manager handles some of
that, but seems to me the sensor part is not figured out.
(someone pointed out https://github.com/openbmc/dbus-sensors before,
which I have to check)

> >>
> >>>> Regards,
> >>>> Kun
> >>>
> >>
> >
>


-- 
Regards,
Kun
