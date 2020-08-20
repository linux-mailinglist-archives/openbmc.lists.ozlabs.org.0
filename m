Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E324C3C9
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:55:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXW3g3x4PzDr5X
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:55:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=maxims@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=an16JO4C; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXW2l1l84zDr0f
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:54:21 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id q16so1475942ybk.6
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r/oXjcvNk1ibhu7edUqNrlhuNFM8CfK6cd5qm4dqO0k=;
 b=an16JO4CzbHbyfcqIkVaabU8EueZV9J6A0Pb7coDtjrbvegvinrAiK5SjH1Np+bvs9
 jl7l5c5P64HOWuuxwcULXaXo+WY+5LJdijhdfznrUC840bJvwwdRl30BHhHr1K8Pk4c/
 IF06v8q1+a5RUw1IV+XL1PEnY2n3qSPrF/3PT2CoI59vo7SMr69sHzkxdxvtb10rDa6a
 rZ4iGsPSLVSAjERmQbKGlquhFaNrRjsC0KgkOvBRN5O/WG8w8qS5FTTroLQ4rDIQuzPf
 9sLhpkWNvoSbWPv3K814UJUXoZG3RTJ44HyIcYHBwuzz+RU2vhIVhAMhwScHKn+YlUtx
 zCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r/oXjcvNk1ibhu7edUqNrlhuNFM8CfK6cd5qm4dqO0k=;
 b=JHRaYHzQK1SGsd5oJ8aroKGKj2UJ8Elu1TP9MeQSu3sAF3K543NgJOiSPAfeM75bh8
 RyTmSAwthHvLl7TKRU2S2RaUHEvyCLwqZ00DJTvfJFmFw+b6CBkRIYjt76mleK2m84UJ
 iPKptuFg3eXP+HrQj6Va/Aa8mluSD3Vwp+cI67N1CR5cyVXS4xTOxDK9BIVaofrgLm4J
 FPO0dmUGwRp/aTjM/5QXTW1CV8lNxOV236jt9g8CYGEkinDT3DwOzT+JuOQ/uDgDxA9o
 J9DgSLC0ZHrDkngOhLM/EPEEJqAEzU6SP+5OF4TM+9REvVtuGXyscB1H7BZj1uJjgpJh
 +3VA==
X-Gm-Message-State: AOAM533DVGn3v2m4sv8yF3eeYpecA+mYuEpYPRtJjSDKHrq6acIjh3QP
 wIz7eEx5J4akIyfsGeysODzVrexYytQ+thXMFqb02tX2OhpU5A==
X-Google-Smtp-Source: ABdhPJzUwYgq3ZaiC1hz0qHXwxxu1C5o081AYG+GF8FZWMVX9ZdoY4Bd86Y0ecbE25F0HmwKWnKcr/O2UVk45WE8TJ8=
X-Received: by 2002:a25:7453:: with SMTP id p80mr6064671ybc.441.1597942457174; 
 Thu, 20 Aug 2020 09:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
 <CACWQX821VpWvbnnv51hbwVSuhaQWjCeovvEBkLwAVp6pvGidkQ@mail.gmail.com>
In-Reply-To: <CACWQX821VpWvbnnv51hbwVSuhaQWjCeovvEBkLwAVp6pvGidkQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 20 Aug 2020 09:54:05 -0700
Message-ID: <CAFR_W8qRwvpae4Xe5s_e1tbhtr9wYt_cxvP2sHB3vvBf_8y80w@mail.gmail.com>
Subject: Re: Board Sensor Calibration
To: Ed Tanous <ed@tanous.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 20, 2020 at 9:23 AM Ed Tanous <ed@tanous.net> wrote:
>
>
>
> On Wed, Aug 19, 2020 at 10:41 AM Maxim Sloyko <maxims@google.com> wrote:
>
> >
>
> > Hi OpenBMC!
>
>
>
> Hi!
>
>
>
>
> >
>
> > We would like to have a value reported by a certain sensor changed acco=
rding to our calibration results. This is a temperature sensor and the cali=
bration has nothing to do with the sensor itself -- so no need to change th=
e driver or anything -- but with a sensor placement on the board. Basically=
 we want to infer the temperature at a different location by calibrating th=
e sensor.
>
>
>
> Do you have more details on what the transfer function is?  Is it a simpl=
e offset, or is it a more complicated lookup table?

The calibration has not been done yet, so I don't know how complicated
the transfer function will be. If simple offset will considerably
simplify implementation, I can ask our thermal engineers to check if
we can get away with simple offset.

> Does it include multiple sensors to generate this new value, or is it a s=
ingle sensor?  Is it intended to "replace" the existing value, or is it int=
ended to complement it?

It is a single sensor and we intend to replace the existing value.


>
>
>
>
> The ideas I've heard before that this might be:
>
> 1. The temp sensor isn't that accurate, so we want to calibrate it to a b=
etter transfer function that we determined empirically.

We think that the sensor itself is OK.

>
> 2. The temp sensor is adjacent to the thing we really want to measure, so=
 we want to create an offset including the CFM that approximates the temper=
ature of the thing we can't measure directly.

Yes, this is closer to the case that we have. I don't know what CFM is thou=
gh.

>
> 3. I want to transform the value of the sensor into different units, (Pow=
er + CFM to exit air air, or power + time to energy)
>
>
>
>
> >
>
> > Are there any tools in OpenBMC that would allow us to add the calibrati=
on curve to, say, phosphor-hwmon and have it report the value different fro=
m the one reported by the underlying sensor? Did anybody else have to deal =
with something like this and what was your solution? Do people more familia=
r with sensor architecture have any recommendations on how best to handle t=
his?
>
>
>
> The closest examples that come to mind for dbus-sensors type architecture=
s are:
>
> CFM sensor and Exit air temp sensor.  Both pull in a number of other sens=
ors, and run them through a math transform to come up with a "new" sensor v=
alue derived from the other inputs.  This sounds similar to what you want, =
although it's probably more complex than you're looking for.
>
> The "virtual sensor" proposal currently in review, which I personally hav=
e technical issues with, and have left comments as such.  I don't believe t=
here's a working implementation of this yet, but there are those working on=
 it.
>
>
>
> If it were me, and I wanted to add a simple lookup table to dbus sensors,=
 I'd probably model it in an entity manager config for the temperature sens=
or, similar to how the stepwise controller models it, and add that into the=
 Hwmon temp sensor daemon.  The below example adds a +5 celcius offset to t=
he bmc temp sensor as an example.  Bear in mind, this wouldn't work today, =
you'd have to adjust hwmontempsensor to take this into account.
>
>
>
> {
>
>     "Address": "0x4A",
>
>     "Bus": 6,
>
>     "Name": "BMC Temp",
>
>     "Thresholds": [],
>
>     "Type": "TMP75",
>
>     "CalibrationOutput": [
>
>         5.0,
>
>         105.0
>
>     ],
>
>     "CalibrationReading": [
>
>          0.0,
>
>         100.0
>
>     ],
>
> }
>
> --
> -Ed

Thanks, this sounds promising, I'll look into it.

--=20
-MS
