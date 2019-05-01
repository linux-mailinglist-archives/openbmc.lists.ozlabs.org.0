Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D111022
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 01:16:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vZ6B20kJzDqPW
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 09:16:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H2c1gnW0"; 
 dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vZ5N23SSzDqNT
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 09:16:05 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id y3so127007plp.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GE56KmCUZJAXIh5TjF4Ub3Fjin4baG5+oZlYLu8kGv0=;
 b=H2c1gnW0TT8/nZOttldheUOV5dsTcWNeKdAuB7AS8AiWxztc8MJ7ZsN1a/BlSvBy9q
 ypyHFEYCe2TKaNIGKBmEHGk9MkcUNSG+ZLwLTBvVR+Ht4RDAdJyNWm2Y5Zi/q7QERX9f
 mywXjb8fPiSlX+v7YeI5wLX27TepdF2tp9Tt1VwUUf8HV0BeaP2u9MP3vokx87zZFSxg
 59jYbkIWV1iEgLKQBuWpkq1XMnmpAFgewi7CfrayLwA1vq8QBDe9A+oxQsEPtzipjmhw
 qeSScZ+EnQSN+fDR0r+zb/1aq8zDcrncoV064Nw+rCeVIMstqETJ7M7U7QPnE4dLv8ll
 4m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GE56KmCUZJAXIh5TjF4Ub3Fjin4baG5+oZlYLu8kGv0=;
 b=JyqsjKLf8oQMQVC8jbw/xai5ee0M5jVu8SK2axG8CzQyabyARtBA8ag8vM0phSx9iq
 1huLOsKy374tCSUBgvFDMaCJJVlmB/FWoS8mrnJXBTgKJQ5OWq8fFYiTNBXw422pkvdw
 POK/Z/SjRFucMD1alYv0pUem23ZYEpBwBSzk8KaZn4Boeo/5EfpsE9JLEdZESMiJmwy6
 SljSKO35tDI42EQXm7DhDzgGhwXzSXDm4twGDwnGyWaw81M9Jvf06CdImfjPzzqXuoLm
 nTiJR6HpCRAo+A+rG8qK7TyIVx52BFr5dOkszWUW91Uy/zR4Em+IQXgsrrWT8AWTVcw/
 QLug==
X-Gm-Message-State: APjAAAXU/Zi/tl1Qjwx3N3RHZjk2a6qWp+kncm44UFNJcb/sqdmGMjgU
 MfJc3lXnPgLvwP8GhdX8DQuClnSVDXOiBH7vDOM4NcV/oo8=
X-Google-Smtp-Source: APXvYqy31SmHM1hMyOhYdDeZOp2RXj+PhaMxDl/kVlurRgbdtz5aMI0a5g6wY9Akz0CGeV2ptgyo0KsuvO9LyWptMks=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr248299plb.233.1556752563521; 
 Wed, 01 May 2019 16:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <CAO=notzQY9qm2phh6AYMuU-tZaKaqjDBq3WOei7z3R+1204u=A@mail.gmail.com>
In-Reply-To: <CAO=notzQY9qm2phh6AYMuU-tZaKaqjDBq3WOei7z3R+1204u=A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 1 May 2019 16:15:52 -0700
Message-ID: <CAO=notzyNZTj-Uc8FqJyKOKx5XMStp64fLY1HdDTmWxArW7OUg@mail.gmail.com>
Subject: Re: pid control configuration
To: Ed Tanous <ed.tanous@intel.com>
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

On Wed, May 1, 2019 at 4:10 PM Patrick Venture <venture@google.com> wrote:
>
> On Wed, May 1, 2019 at 4:05 PM Ed Tanous <ed.tanous@intel.com> wrote:
> >
> > On 5/1/19 3:53 PM, Vijay Khemka wrote:
> > > Hi Patrick/James,
> > >
> > > I am not understanding how to get these following data for configuration
> > > file for pid. I only had p(proportional), i(integral) and
> > > d(differential) values from my thermal team. But unable to maop these to
> > > required parameter.
> > >
> > >
> > >
> > >     "required": [
> > >
> > >         "Class",
> > This will be PIDController in the case of PID, and is part of how entity
> > manager divides up the config information to the various components.
> > >
> > >         "FFGainCoefficient",
> > >
> > >         "FFOffCoefficient",
> > In your case, both of these FF variables would be 0.0
> > >
> > >         "ICoefficient",
> > Would be the I value from your thermal team.
> >
> > >
> > >         "ILimitMax",
> > >
> > >         "ILimitMin",
> >
> > These sets the limits to the integral coefficient to prevent integral
> > runaway in the case where the controller cannot ever reach the target
> > temperature.  If you don't want to use these at all (which I wouldn't
> > recommend from a control perspective) you can set them to unreasonably
> > large and unreasonably small values, and they will have no effect.
> >
> > >
> > >         "Inputs",
> >
> > The sensors you want to control, by name.
> >
> > >
> > >         "Name",
> > This is the "pretty" name for this controller, and can be whatever you
> > want.  The controller will show up in DBus and Redfish under this name.
> >
> > >
> > >         "OutLimitMax",
> > >
> > >         "OutLimitMin",
> > >
> >
> > I believe both of these are in % of fan speed these days, so setting
> > them to 100 and 0% respectively will probably give you the behavior you
> > want if you don't have other data from your thermal team around limits.
> >
> > >         "PCoefficient",
> > Your P value from your thermal team.
> >
> > >
> > >         "SlewNeg",
> > >
> > >         "SlewPos",
> >
> > These two reflect the D values from your thermal team.  If they only
> > gave you one D value, there are two things here.  1. It could use the
> > same coefficients for both positive and negative derivative values.  Or
> > 2. It only applies to Positive slew rates, and negative is zero.  You
> > would need to talk to your team to understand what they intended.
> >
> > >
> > >         "Type",
> > The Entity manager type, which I believe it PIDController, but I don't
> > have the examples in front of me.
> >
> > >
> > >         "Zones"
> > Fan zones in which this controller applies to.  For Tioga pass I would
> > expect you to only have a single fan zone for the whole node.
> >
> > >
> > >     ]
> > >
> > >
> > >
> > >
> > >
> > > Also we have a requirement of stepwise and pid together for some
> > > sensors, is it possible to configure same sensor for both types.Yes, you can declare multiple controllers.  Whichever controller
> > requests the high fan speed will be the one that's used for the PWM output.
>
> Thanks Ed for those great answers.
>
>
> I'll provide the units answer:
>
> If the PID is a margin controller and it's set-point is in centigrade
> and output in RPM:
> pCoefficient is your p value in units: RPM/C and integral coefficient RPM/Csec
>
> If the PID is a fan controller whose output is pwm:
> pCoefficient is %/RPM and iCoefficient is %/RPM sec

The non-step PID operates at a 10x frequency fans : sensors.  so it
tries to control the fans 10x per second, and checks the status of the
thermal sensors involved once every second.  that's hard-coded
presently in the behavior of the code.  I think the step-wise operates
similarly but I would have to check.
