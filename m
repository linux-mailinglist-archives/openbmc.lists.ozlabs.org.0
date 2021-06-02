Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F45398FD5
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 18:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwDn02j0Fz300Q
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 02:21:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ceaDZjFR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ceaDZjFR; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwDml0dCyz2xb2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 02:21:24 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so1533977wmc.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iopQJtMDX4Ju/4u6nw8ZyKC7C66XoVt7r7ZqIUL+V6U=;
 b=ceaDZjFRdcF7MXdfCDkL/Ksr/GGy38lvvBnVjvms1Vf0SFRUv6CeG0K/HuqHpTDjpM
 Izne06KYkvbFenmvcEMXV7fkVf/gQPlzM7CJpGfuk98OY3p8MqNO1yXc91onTma/zmhb
 KcKJrYZfFUl6ilynGy8u4zef/16JxP0SWKXp038gKy3vzNXALtiD2nZ4cBq5e6VkFaNb
 POcVnTkOT2dTU+hfI97v3wFdoKahePnpHRy08Cw8sQCpPWdgJZhwUevMg0BkzUPWR1/s
 lKCHhiNYG3NB1ISJoZK8h0sofIUU+VZpOuXvgEZGNW2q6GsBdoGHpop0wyDkQXqGGrqp
 Bjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iopQJtMDX4Ju/4u6nw8ZyKC7C66XoVt7r7ZqIUL+V6U=;
 b=Iqh/bjhUOCBjU/CkwFBoGZxn9b6FuLjiVSFMDr1eos5c/SuByczj4fZ5NNtY9fD8tB
 1gd/OWy8vvwbanAodf/srZJfKJdBUYkd+gkbmvlC4dLh0+BmuOCz2Sgf0+Y5MCGKMJgG
 BTAi+vFRcWrlLLOkuEn+iYxjumx3Jex2TIf5wKveVr+HkNCV/9iYihUUEXB7vrGd4Nvk
 kzrfW9E7rJH2Xge9fwhwBUf60ljEYta4ywiguE29eQrulkxUugUfj36k65E2W9EQUT0n
 xgXBSL39DqqDBs9GlEDXE8LXuYzyYAcYpfGvuJrlZpRrfzkygby7ShpXioEyq4nGAEmN
 nL5w==
X-Gm-Message-State: AOAM531ninmpbqvAXjRjTqDlIvDzVA039quju0fnGveogi40wZ11MWlW
 paJxAktl1voEFVDYW/ki66NK5qnHnW83x762qASajcuA0nE=
X-Google-Smtp-Source: ABdhPJwR48RDKXM9R5KNm9xkGpeRO47gwdEm/OJrYLjOg/VJ4+ZEtvRes9qUbazIph8bjGb+tGWn32Z9owlzF6dbSJQ=
X-Received: by 2002:a05:600c:ad2:: with SMTP id
 c18mr22263592wmr.93.1622650876741; 
 Wed, 02 Jun 2021 09:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
 <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
 <1bdf8842-2b53-0d51-40b6-6bf64f2bf315@linux.vnet.ibm.com>
 <CAH2-KxAjjefRFfirz0Gn9DTn-dCfqw_7ed2obk43wxevym3xPA@mail.gmail.com>
 <4746ede6-dea9-32c5-10e3-2fd6773e2033@linux.vnet.ibm.com>
In-Reply-To: <4746ede6-dea9-32c5-10e3-2fd6773e2033@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 09:21:05 -0700
Message-ID: <CAH2-KxDD8=ipYoDtBz_gQh8nWMsu_u+JDs33ma=-gk7ZVXVuWA@mail.gmail.com>
Subject: Re: Seeking your opinion on ways to report both Altitude and Pressure
 sensors for the DPS310 as well as Temperature from dbus-sensors.
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 9:14 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> On 6/2/2021 09:03, Ed Tanous wrote:
> > On Wed, Jun 2, 2021 at 8:58 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>
> >> On 6/2/2021 08:39, Ed Tanous wrote:
> >>> On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
> >>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>>>
> >>>> Hello Ed,
> >>>>
> >>>> It has been suggest I seeking your opinion on ways to report both
> >>>> Altitude and Pressure sensors for the DPS310 as well as Temperature from
> >>>> dbus-sensors before going to far down the road.  Thus that is what I am
> >>>> attempting to do in the email, others on the mailing list input is
> >>>> desirable as well.
> >>>
> >>> Thanks for discussing this before getting too far along.  I haven't
> >>> worked on any systems with physical pressure sensors, but I'm excited
> >>> to see new things get added.
> >>>
> >>>>
> >>>> As I see it, Altitude and Pressure are different in that
> >>>>        1) Altitude is computed base off of essentially a policy
> >>>
> >>> I have no idea what this means.....   In what way is altitude a
> >>> "policy"?  Can you elaborate a little?
> >>>
> >>
> >> I view a mechanism is something like update a FLASH part with
> >> an image provided.
> >>
> >> I view a policy is what decides if the the update of the FLASH part
> >> with the specific image is allowed.
> >>
> >> I the case if Pressure and Temperature I view them as mechanism,
> >> merely a simple reading and possibly some well defined computations
> >> that are universal.
> >>
> >> With Altitude computed from Pressure there are several ways to
> >> compute the Altitude and they are not universal.  So I see it as
> >> a policy of which Pressure to Altitude model is chosen and why.
> >
> > Sounds like I interpreted your intention correctly. (I think).
>
> I believe you did.
>
> >
> >>
> >>>>        2) Pressures is a read measurement which is a mechanism
> >>>>        3) Temperature is a read measurement which is also a mechanism
> >>>
> >>> I'm really struggling with the above to understand what you're getting
> >>> after, so if I go down the wrong path, please forgive me.
> >>>
> >>> I think what you're saying is that altitude is calculated based on
> >>> pressure + some transfer function to determine an altitude?  And that
> >>> transfer function might be fungible depending on the platform?
> >>>
> >>> If I got the above right (big if) I would probably expect a new
> >>> pressure sensor type to be added that reports a pressure sensor, then
> >>> we'd put the transform code in something that looks a lot like CFM
> >>> sensor (which oddly enough has a hardcoded 0 for altitude in its
> >>> algorithm for systems without pressure sensors).  Considering how
> >>> related a pressure sensor is to altitude, I could see putting them in
> >>> the same application if you wanted;  It might simplify the code some.
> >>>
> >>>
> >>> I think overall a better picture of what you're wanting to accomplish
> >>> would be a good place to start, then we can iterate from there on what
> >>> pieces we need that are new.
> >>
> >> I have Temperature, Pressure, possibly Humidity sensors all which are
> >> variables to different models to compute Altitude from.  I do not have a
> >> true Altitude sensor.
> >
> > This sounds exactly like the CFM sensor, and Exit air temp sensor;
> > Most systems don't have exit air temp sensors, but they have input
> > power and individual fan speeds, which can be put into models to
> > determine CFM and ultimately exit air temperature.  I would expect
> > Altitude to do something very similar in code (although with a
> > completely different algorithm).
> >
>
> So the DPS310 has 2 sensors in it a Pressure and a Temperature sensor.
> Do I create a Pressure reading and a Temperature reading for the DPS310
> and then add Altitude to it as well?
>
> Or do I create 3 separate things,  one for each Pressure, Temperature,
> and Altitude?

Assuming in this case "things" are intended to mean "entity manager
exposes records" you would create one config record for the DPS310
itself (which would in turn create 2 sensors).  This is one "record"
because physically it's one part, and can't be separated, similar to a
TMP421.  After that, I would create another config record for the
"Here's the math to combine these into an altitude".  It might just be
a type and a name, depending on how many inputs go into the transfer
function to convert pressure+temperature into an altitude.

If the math to combine into an altitude isn't system specific, I could
be convinced that the math should go into a single record within the
DPS310 exposes and have that live in the daemon itself, but I don't
have enough detail on how these are usually deployed to know that.

>
> Also I believe I should be looking to the CFM sensor and Exit air
> temperature sensor as reference examples.
>
> >>
> >> I am being asked to provide Altitude.
> >>
> >> Personally I believe the desired feature is how much cooling a parcel of
> >> air per unit of time.  Thus I would think air Temperature, Humidity, and
> >> Density (probably compute-able from Pressure, but I have not checked on
> >> the specifics) would be the important factors.
>
