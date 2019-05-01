Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDB1101F
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 01:11:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vYzs1xCVzDqPG
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 09:11:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Hc6jtMHS"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vYyx22S9zDqNV
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 09:10:31 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id b3so164944pfd.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 16:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1NpldwQdrBQ+Sowtw6xVyMawz0Ttwfg1ukPQWTT3Ro=;
 b=Hc6jtMHSs43yKS2TH+agd+swU2r+OvG5ohaXiW9VxbjdPFfGsh9A6dGgvml+QEAOvT
 /WEbRmReTVHESYlWpVVHJXtoXPGsRHW3YwKpJ3oSA8fq6LPJwBtTx5dznqYpysL1jJox
 MKSIY+rGbVKW+TYm8fS88WOLCnGAmpS06rA/RGDGU9st9P8uOnN6IuA8vMGB5HvtximQ
 sBYjqhD/TRafVzxY0VMXqA9pidRgdvuXiFCx8+DC0I2tNDItknzsjWr6ilHs7KcdVhhZ
 NnqX2iPyl11zhSllwmpiBD0HxD1iai5N+nYgPQjWihl4QBJJjqc9s6b9l8RtyIX14g9I
 oDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1NpldwQdrBQ+Sowtw6xVyMawz0Ttwfg1ukPQWTT3Ro=;
 b=TtrYufuTnwjG1zSnkfzWmhWK9ABVvSPz/rrfzFcdhCFfjTtWbV7+LkqZr+s2rDJ7BV
 G/vEMwJAnIHPYjS4BM9dYxpBbtmuo+hwBJHk8R0AAaYrLAMlo5lJ6lnAoA5RXMHFRqlY
 x9cAt91yTswhaANaJXmELpNauON+If3KY+TK7vDpPClZGXHzm9YzdPUvD4CXtUJtuCJS
 aHF+sNwlc4Gy5rG6KjUl/RDIf80O7OLiBTeHfq1ccXgiWONvxihvi2P0LP/zULi3p3Wp
 e3Ytkec42GBxNW7WWoMC9IxJYBEngZ52F7EkSmycHY2naaRyd73mc9x5Lm7BKcNfBPb7
 u+bA==
X-Gm-Message-State: APjAAAVyM8KJ8zFZnssknlg1A7QU/YNPpWPmXl3EGbqimBmVcf9YM2de
 zWpL1MUDj2SE4QZ3cdOplf+2fYCTr3/6qjTt5ue1Kg==
X-Google-Smtp-Source: APXvYqwQ6vCigcFEaxp6gr6JgPCtVofAl6ci5/ItN0r6+TmXPxzNVu5ltSR2Yb+/C6LgCD4Vhec1zY3XhOvihh8jGVY=
X-Received: by 2002:a62:2541:: with SMTP id l62mr549009pfl.243.1556752229069; 
 Wed, 01 May 2019 16:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
In-Reply-To: <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 1 May 2019 16:10:17 -0700
Message-ID: <CAO=notzQY9qm2phh6AYMuU-tZaKaqjDBq3WOei7z3R+1204u=A@mail.gmail.com>
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

On Wed, May 1, 2019 at 4:05 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 5/1/19 3:53 PM, Vijay Khemka wrote:
> > Hi Patrick/James,
> >
> > I am not understanding how to get these following data for configuration
> > file for pid. I only had p(proportional), i(integral) and
> > d(differential) values from my thermal team. But unable to maop these to
> > required parameter.
> >
> >
> >
> >     "required": [
> >
> >         "Class",
> This will be PIDController in the case of PID, and is part of how entity
> manager divides up the config information to the various components.
> >
> >         "FFGainCoefficient",
> >
> >         "FFOffCoefficient",
> In your case, both of these FF variables would be 0.0
> >
> >         "ICoefficient",
> Would be the I value from your thermal team.
>
> >
> >         "ILimitMax",
> >
> >         "ILimitMin",
>
> These sets the limits to the integral coefficient to prevent integral
> runaway in the case where the controller cannot ever reach the target
> temperature.  If you don't want to use these at all (which I wouldn't
> recommend from a control perspective) you can set them to unreasonably
> large and unreasonably small values, and they will have no effect.
>
> >
> >         "Inputs",
>
> The sensors you want to control, by name.
>
> >
> >         "Name",
> This is the "pretty" name for this controller, and can be whatever you
> want.  The controller will show up in DBus and Redfish under this name.
>
> >
> >         "OutLimitMax",
> >
> >         "OutLimitMin",
> >
>
> I believe both of these are in % of fan speed these days, so setting
> them to 100 and 0% respectively will probably give you the behavior you
> want if you don't have other data from your thermal team around limits.
>
> >         "PCoefficient",
> Your P value from your thermal team.
>
> >
> >         "SlewNeg",
> >
> >         "SlewPos",
>
> These two reflect the D values from your thermal team.  If they only
> gave you one D value, there are two things here.  1. It could use the
> same coefficients for both positive and negative derivative values.  Or
> 2. It only applies to Positive slew rates, and negative is zero.  You
> would need to talk to your team to understand what they intended.
>
> >
> >         "Type",
> The Entity manager type, which I believe it PIDController, but I don't
> have the examples in front of me.
>
> >
> >         "Zones"
> Fan zones in which this controller applies to.  For Tioga pass I would
> expect you to only have a single fan zone for the whole node.
>
> >
> >     ]
> >
> >
> >
> >
> >
> > Also we have a requirement of stepwise and pid together for some
> > sensors, is it possible to configure same sensor for both types.Yes, you can declare multiple controllers.  Whichever controller
> requests the high fan speed will be the one that's used for the PWM output.

Thanks Ed for those great answers.


I'll provide the units answer:

If the PID is a margin controller and it's set-point is in centigrade
and output in RPM:
pCoefficient is your p value in units: RPM/C and integral coefficient RPM/Csec

If the PID is a fan controller whose output is pwm:
pCoefficient is %/RPM and iCoefficient is %/RPM sec
