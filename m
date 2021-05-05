Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC399373380
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 03:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZf1d61Zzz2yyl
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 11:16:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Rd5H7Ws9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Rd5H7Ws9; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZf1M4pJcz2xg1
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 11:16:21 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id x19so230286lfa.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 18:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Eny8NWyLjCK/0FFN6KVYT1JG1gvJUDDJd9/g2Ro0TQ8=;
 b=Rd5H7Ws9ku9ojAlBdzI/FlICObfkJnmteKNG1eg+Hj+x2obQrMHGtONgChXX/6+WPI
 vuM1Ccp8wBFbreJ2PnHYCedp3ex2izYUd8qWjI7lzOCTrEKV5DM4uGkBXHmoZ8+WpR65
 4+3Xa98Q+9MWJ8Gskh85/zBc1gauvpVr/5+iTt+5rZx21Qw+kaGaUZthFcbgAZCKrh2N
 GkukoLAuckogIPSrYtK77N8M3/wM7qkWnxFtxDLeA/RsbxVMMubVNC/YNr5K1FCw97ex
 HLss8ImxoycX4SdY59/fj1WTnS0NoKbmtmay+gaxew5tNObhv/QHJcDi1uhBM64oSHE+
 w4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Eny8NWyLjCK/0FFN6KVYT1JG1gvJUDDJd9/g2Ro0TQ8=;
 b=rTr3dJjVywDmxwI2k8hK0LIHh+3rLwMLEC6ZXZ7zFlOkkQrNRUWTPww0MAResWGkhl
 oZHpB1UwNIZecvz3nZY61lvKSmnr1hLLKr4zeek79PnXsdWbQ5DkM8WfvuZkk0xkaTec
 XaRKrBqmI8pHhCbWwbJ4TETXuCG/QaVHS4LbvZ6fxzOaRENh3KrHJMkE6d80MQ0pNoiI
 DeJZWbHgEcym0GhBRTKWIKSbZapC+fsdcuPfFarb5qKx0X6j9lFZ1qq5/vGNTLPvAilN
 fm9c1jW4VFvk/bBLSkRHuqkQCKDE1+QbVAP1dzWAfk3xyS+fTlOF3is9t1Jq16HmKhS3
 29jg==
X-Gm-Message-State: AOAM530a0NPcw+FUDWa+02hBVY126ycmS9Hqxi9FsSg2vx6RLbfDU+xF
 +mOZtxHSxfYALsBKdvco543/RHE6+8fLe0T+5GYReA==
X-Google-Smtp-Source: ABdhPJzyhvJ3aNK6hud6HmmeOkJF42BB8UtllUvVqvjtiR8nrE2plKGbV0J29nw4T5i+e2M8eB/96/6vMD/A777EuWg=
X-Received: by 2002:ac2:5393:: with SMTP id g19mr18796184lfh.459.1620177373054; 
 Tue, 04 May 2021 18:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <F3123217-EAD7-4613-9CBD-39EACB7791E9@gmail.com>
In-Reply-To: <F3123217-EAD7-4613-9CBD-39EACB7791E9@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 4 May 2021 18:16:03 -0700
Message-ID: <CACWQX821=TR2TVOWxkV_PQyg_g2159jsDrQ-TXeV7EPhNWvpzg@mail.gmail.com>
Subject: Re: D-bus model proposal for pay for access features
To: Mike Jones <proclivis@gmail.com>
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 2:18 PM Mike Jones <proclivis@gmail.com> wrote:
>
>
>
> > On May 4, 2021, at 11:02 AM, Ed Tanous <ed@tanous.net> wrote:
> >
> >> Content-Type: text/html; charset=3D"UTF-8"
> >
> > First of all, please avoid sending html emails if you can. They don't
> > render properly on everyone's workflows.
> >
> > On Fri, Apr 30, 2021 at 11:15 AM Ratan Gupta <ratankgupta31@gmail.com> =
wrote:
> >>
> >> Hi All,
> >>
> >> I would like to introduce a dbus model proposal around pay for access =
features.Normally IBM system ships with more hardware than was purchased, w=
hich can be unlocked later.
> >
> > It would be great to get a lot more background here.  On its nose,
> > this seems like this polar opposite of open firmware and something
> > that, if done wrong, could be very harmful to the goals of the
> > project.  Assuming you did this, wouldn't anyone be able to simply
> > recompile the code with the license checks disabled, load it on the
> > system, and enable whatever they want without licenses?  That seems
> > like something you didn't intend, and something that's less likely on
> > closed source firmware, but probably needs considered in this design.
> >
> > As-is, I'm not sure which side of the line I come down on, but my two
> > initial thoughts are:
> > 1. I don't want to support it or help the code in any way, but IBM can
> > check this into their own specific interfaces.
>
> Given that Redfish is a big tree of interfaces, is there a provision for =
custom interfaces?

Yes, the term to search for in the Redfish spec is "OEM" properties,
which the spec can do more justice than I can.

>
> For example, suppose I wanted some special ADI interface for some ADI fun=
ctionality (like tell me the duty cycle of the PWM of regulator foo), assum=
e it is public info/code for this discussion, is there a way to hook into t=
he hierarchy and add interfacing without updating the Redfish specification=
?

In this example you wouldn't do that.  Fans are already well modeled
in Redfish, as are a lot of other things you're likely to do with a VR
(update firmware, stream telemetry values, monitor status, ect).

>
> Like is there a way to query and ask what special stuff is there and acce=
ss it? Or knowing a prior where to look to access it?

Yes.  Oem extensions are the specifications answer.

>
> Are there OBMC principles on these kinds of extensions? Like it is allowe=
d or not? Like one can bend the Redfish conventions or not?

Currently OEM policy is here, and can do more justice than I can.
https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md

FWIW, I don't think we've arrived at the best policy in terms of OEM
schemas, but considering the influx of "should be standard" OEM
properties that were coming in, and the quality of them in general,
this was a necessary reaction (and has largely yielded positive
results IMO).  Like anything in OpenBMC, it is subject to evolve over
time and with more people's input.

>
> I have to assume that somebody has the need to do non-standard interfacin=
g.
>
>
>
> > 2. This is harmful to the intent of OpenBMC and open source firmware
> > as a whole, and shouldn't be supported in any capacity in the OpenBMC
> > codebase.
> >
> > I think a lot more background and details than what was provided in
> > the initial email are needed before jumping to "what does the dbus
> > interface look like" type discussions.
> >
> > How would open firmware principals be retained if we're now supporting
> > firmware locking down systems?
> > Are patches allowed to circumvent the license checks?
> > Does IBM intend to not allow loading self-compiled firmware on their
> > systems to support this feature?
> > What is and isn't allowed to be locked down?
> > Can the license checks be entirely compiled out?
> > Do these licenses appear on any public interfaces?  How do we ensure
> > that the public interfaces aren't misused?  How do we keep standards
> > compliance (or do we not care)?
> > How does this affect our standing in things like OCP open system
> > firmware groups?  Does this OpenBMC systems that enable this feature
> > ineligible?
> >
> > Those are the questions I have off the top of my head, and to
> > reiterate, this feels like the kind of thing that needs more than a
> > one sentence background statement before diving directly into designs.
> >
> >>
> >> Features could be 1) AIX enabled/disabled
> >> 2) How many processors are enabled
> >> 3) How much memory is enabled
> >>
> >> Proposed Model:
> >>
> >> The model consists of following main entities:1 - licenses - these obj=
ects represents the features.  There will be a license represnting
> >> feature(one is to one relation ship) and these objects have state - ac=
tive, inactive, unknown, etc.
> >> These objects could implement the Delete interface for when a client w=
ishes to disable the license/feature.
> >>
> >> 2 - manager - the manager object (distinct from freedesktop object man=
ager) provides a method
> >> interface to create new license objects.
> >>
> >> Alternate Dbus Model:
> >>
> >> 1 - Licenses: these objects represent an agreement.  These objects hav=
e an
> >> association to one or more features, and these objects have state - ac=
tive,inactive, unknown, etc.
> >> These objects could implement the Delete interface for when a client w=
ishes to disable the license.
> >>
> >> 2 - Features: these objects describe the features available.
> >> Feature objects would be static and implementation/platform defined.  =
A BMC or host firmware update
> >> could potentially add or remove the available features exposed as dbus=
 objects.  At the moment the
> >> only feature attribute I can think of is a name and the feature status=
.
> >>
> >> 3 Manager - the manager object (distinct from freedesktop object manag=
er)
> >> provides a method interface to create new license objects.
> >>
> >> The difference between two models areIn the alternate Dbus model we ar=
e keeping the feature Dbus object and the License have an associated featur=
es
> >> In the proposed model we are only keeping the license D-bus object whi=
ch represent the feature.
> >>
> >> Flow would be as below with the proposed model -1/ Manager object woul=
d be having interface like upload (License activation key)
> >> 2/ On IBM systems we send this key to the host firmware which activate=
s the features
> >> 3/ Host Firmware sends the activated feature list to the BMC
> >> 4/ BMC creates the licenses for the activated features
> >>
> >> I suspect an implementation of the above flow is highly IBM specific,
> >> but I hope some of you have some feedback that might enable some colla=
boration.
> >> If not - where should we put this application?
> >>
> >> Ratan
>
