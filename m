Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46C217DBB
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 05:48:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1ldy3Z8tzDr1R
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 13:48:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uF6T35C5; dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1ld80zg3zDqtV
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 13:47:54 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id o4so21638058ybp.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2020 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pxhrphs99HPiZ0FkU9SCtAMTqE9FxZ6YgvLSbIb95B0=;
 b=uF6T35C5yVSJSxFySbLsefwBLLAAXYWyXvykXqYuScsARqh7EfehmDAvQLt5iImnGh
 oS7CHO8hfww5w6Qo0BeWwm8nhaArdz5VAvs7jH5S1g93DO+FHRtWrCtoMP03z09eguAY
 JCLYC75fDpmwwCzymbjEp3q4UZpX9oKCKkF65IbJ0TIcKApB6dXNrQsTwH5uUJvCLgqY
 bG7NJF9kUO0wxAhNP5k9bZO+83+/XHBoqLuIykezIKIQ0iuqFn/1keo4pbJVCW/gmkyI
 rTjcXsj0n/uscjJvpyFW8pUDlcpNIpLRV5EBfh74iyLc/UfVPgzUcF6WOH30jr2Wfw8E
 1hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pxhrphs99HPiZ0FkU9SCtAMTqE9FxZ6YgvLSbIb95B0=;
 b=HhCx2+EYrq/U0YtCNLNKTV69ozG7bpx6fUpsW9WDn3YsQebsDgwfmLjfcJPnDKUFgA
 vA8C4zySSUGLud339I759OQa4fTOWG3XIDGmLxO9WuhHXs9o4Eh0IhgpjBE43scFNW8j
 N3e1VSPHw+uxn9z3SuVi8d28NrSaBIAqK68XB8cn9M7E79OgDkS9DeDO9hfHcY+x5AFi
 ntqiS4jd+hFCVrReWCC7+rj0fq1oa6ZYxe9MbhkNQxenK0WqvZjYNCH7XWxGmALXeeG0
 n1UCTSV08BjxrU2kQkO3wfu8MRvL31JbXAu2p0PcHdPvw1JMVKqNDqppaz8GLx5bZI9N
 u7TA==
X-Gm-Message-State: AOAM533br24Q1QX4b8zU8BgdUiuz0r73CtpzCxOf49GU76DGPbKMS/E1
 RpJZPRHxCPQnbusUOSdg/+XuwQgPgHIicjYqD2EowA==
X-Google-Smtp-Source: ABdhPJzMJL+7s8Es04dlqBcSwzuyrCa/yvgQNr0e32cbGYE2p3u3RKx2kTKQ/X2gF132jAJhQPsQ4zgHGZhsSwOPsHM=
X-Received: by 2002:a25:384f:: with SMTP id f76mr89748942yba.170.1594180070476; 
 Tue, 07 Jul 2020 20:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
 <CAO=notxk6prforcTO02_P-5VkcmpP-Qk2zhfH8sU5Q0YksusFQ@mail.gmail.com>
In-Reply-To: <CAO=notxk6prforcTO02_P-5VkcmpP-Qk2zhfH8sU5Q0YksusFQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 7 Jul 2020 20:47:38 -0700
Message-ID: <CACWQX83PR=XWon0ws7GmTA2S_RoWEVC7s5i+=ps2r2qSYe4f1A@mail.gmail.com>
Subject: Re: phosphor-pid-control: dbus tuning interface
To: Patrick Venture <venture@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 7, 2020 at 4:51 PM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Jul 7, 2020 at 4:35 PM Jason Ling <jasonling@google.com> wrote:
> >
> > Apologies if this has already been discussed but..
> > Would the community benefit from the addition of a dbus tuning interfac=
e for phosphor-pid-control?

This capability already exists if you're using phosphor-pid-control
with entity manager.  There is a redfish interface into the thermal
control that allows modification of tuning parameters at runtime
through PATCH calls to the Managers API.  For example, the REST model
for a Pid controller is here.
https://github.com/openbmc/bmcweb/blob/07941a881d1d07fd8cbe2ac0db88b3c96dea=
b4c7/static/redfish/v1/schema/OemManager_v1.xml#L197

Entity manager essentially will trigger a reconfigure of
phosphor-pid-control on every change, so new parameters can be tested.
It's worked quite well in the past when I've worked with thermal teams
who don't want to edit config files, recompile, and reload by hand, or
want to do things like connect the fan outputs directly to a simulink
model to test some new tuning types.

I'm guessing you didn't know that existed, and clearly Patrick didn't
either.  So the next question is, where did you go to look for this
kind of thing (ie, where should we document this)?  There might not be
a perfect place, but hopefully we can make this more clear in the
future when people have these needs.

> >
> > To get things going:
> >
> > initial thoughts would be to have the details of each thermal/fan PID c=
ontrol pushed onto dbus with loop parameters being r/w.

In the currently existing one, these parameters are modeled more as
phosphor-pid-control pulling parameters, rather than config changes
being pushed, as technically we're modifying a system config, and the
configuration manager needs to know about it, otherwise it will simply
override it again on the next configuration change.  Said another way,
you want to be able to add/remove drives while running under
non-standard tunings, and not have it override what you're trying to
test.
> >
> > I'm not sure about whether the output or input to the loops should be p=
ublished as properties.

In what exists today, the inputs and outputs can be overridden by a
PATCH to the relevant Redfish sensor.  This gets translated into a
Dbus SetProperties call to the Value interface.  The PWM outputs are
modeled as sensors to allow this to be done (and to track their
values).

> >
> > Have this capability compiled out or runtime disabled by default

I believe this is compiled in by default today if you're using the
right combination of daemons.

> >
> > Things I worry about:
> >
> > If the phosphor-pid-loop updates the PID output/input/error to dbus on =
every evaluation cycle will it bring adversely affect dbus performance or b=
ring a system to its knees? is it better to just implement the querying of =
pid loop updates as a dbus method?

You could be right, although it's mostly dependent on how many sensor
updates happen, and what hysteresis settings you have.  In practice,
it doesn't tend to be a lot more traffic if the loops are tuned
reasonably, and aren't cycling.


>
> James and I have talked about this type of feature in the past.
> Effectively making the PID control object a dbus object.  I think it
> would be fine if it when it updated its own values, they weren't
> broadcast - IIRC< that's an easy thing to implement, there is a
> separate parameter for this.  Then it would be queryable and somewhat
> tunable.  Currently the tuning is done by writing to a file, which is
> how the scripts are set up - but presumably something more
> programmatic or thorough could provide some value.
>
