Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C4398F82
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 18:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwDNF44Sbz3049
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 02:03:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=QFH1/Qu5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QFH1/Qu5; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwDN12HBkz2xYf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 02:03:27 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1488451wmc.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbnAKEe/7kYxACqv2xlP2pu1nH3Ua7r9qbzoh57uQe8=;
 b=QFH1/Qu5rmU003RpnUlmPK+4t3rvrtTYp2k0gYFv/o0JuvZ4D9xU2YtByxucKGXbEz
 g0oCJ7uVDPkZ70yaptMTIE3I2sBsT1Fdk552pPlOCmQFrYe02FSFkWbriyus7E9az+M6
 PxSrfmktB9zdIv5WUN4CgD/3OwUhykZI3NPNbsd5/NOGABAgYIkYxuibzxCe7VEyd0wa
 prdIrPnlDTMHVGT9Zv6XIhr/17EYTAtZqoBngKiF80a6xbY+I/PyNNvoh2DmViFwdabt
 thZi7Zu6CsxAXpEddFvduIZiP0XOjREHtyTAspWz1QRUjWh1P9j2PtKVZl+v6mX5zr1e
 AnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbnAKEe/7kYxACqv2xlP2pu1nH3Ua7r9qbzoh57uQe8=;
 b=qwlcmcPLJDAazT4BqCnJr4Z9BFAnXKlMFRcb9RBJT5Gja08cP/TIqnQXDeFsZ/7PfU
 Ep5a+UHMFKzRXMB3Znhq5luAWzWNcIF4+4O7b8uZdl45vdvj71IE/ybUL7qkCbKJPhOS
 E98QzVHd0YFvfnfGdUtkDzxpRPVQppJLvRi9y62Km/g5rDkY0v0bygzBw8syhDrFSOOw
 tbmdUlVU3zxFaaqGmGtrNYmnMChvuCElJBLZulp8UyCDfHy+0OHJJlBJO1WPd0lw4tQC
 20IfHKrVCQ8kIcpnArpzEb9sTTdITjdWq5+bb0GwEXgxvZFp8Z6OKP16broU7AM7NpcL
 M+Gw==
X-Gm-Message-State: AOAM5334oc99cupUypCWBdEb0pZG/QGpiMPPycUbuuHuyIZU4NHhOCzJ
 0FEbW27XIj4n6hw+7nwoJhckd/13pAjn1uynpOJ0wg==
X-Google-Smtp-Source: ABdhPJw1PpanCkyEk/6ff6KDRIzCTLo0TD4L6dZDuNRFTwPpMc9CcZTfTbWcXx4OtRDPGukK6QLPh3C26DNhayXiHFM=
X-Received: by 2002:a1c:453:: with SMTP id 80mr4228948wme.171.1622649802136;
 Wed, 02 Jun 2021 09:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
 <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
 <1bdf8842-2b53-0d51-40b6-6bf64f2bf315@linux.vnet.ibm.com>
In-Reply-To: <1bdf8842-2b53-0d51-40b6-6bf64f2bf315@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 09:03:11 -0700
Message-ID: <CAH2-KxAjjefRFfirz0Gn9DTn-dCfqw_7ed2obk43wxevym3xPA@mail.gmail.com>
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

On Wed, Jun 2, 2021 at 8:58 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> On 6/2/2021 08:39, Ed Tanous wrote:
> > On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>
> >> Hello Ed,
> >>
> >> It has been suggest I seeking your opinion on ways to report both
> >> Altitude and Pressure sensors for the DPS310 as well as Temperature from
> >> dbus-sensors before going to far down the road.  Thus that is what I am
> >> attempting to do in the email, others on the mailing list input is
> >> desirable as well.
> >
> > Thanks for discussing this before getting too far along.  I haven't
> > worked on any systems with physical pressure sensors, but I'm excited
> > to see new things get added.
> >
> >>
> >> As I see it, Altitude and Pressure are different in that
> >>       1) Altitude is computed base off of essentially a policy
> >
> > I have no idea what this means.....   In what way is altitude a
> > "policy"?  Can you elaborate a little?
> >
>
> I view a mechanism is something like update a FLASH part with
> an image provided.
>
> I view a policy is what decides if the the update of the FLASH part
> with the specific image is allowed.
>
> I the case if Pressure and Temperature I view them as mechanism,
> merely a simple reading and possibly some well defined computations
> that are universal.
>
> With Altitude computed from Pressure there are several ways to
> compute the Altitude and they are not universal.  So I see it as
> a policy of which Pressure to Altitude model is chosen and why.

Sounds like I interpreted your intention correctly. (I think).

>
> >>       2) Pressures is a read measurement which is a mechanism
> >>       3) Temperature is a read measurement which is also a mechanism
> >
> > I'm really struggling with the above to understand what you're getting
> > after, so if I go down the wrong path, please forgive me.
> >
> > I think what you're saying is that altitude is calculated based on
> > pressure + some transfer function to determine an altitude?  And that
> > transfer function might be fungible depending on the platform?
> >
> > If I got the above right (big if) I would probably expect a new
> > pressure sensor type to be added that reports a pressure sensor, then
> > we'd put the transform code in something that looks a lot like CFM
> > sensor (which oddly enough has a hardcoded 0 for altitude in its
> > algorithm for systems without pressure sensors).  Considering how
> > related a pressure sensor is to altitude, I could see putting them in
> > the same application if you wanted;  It might simplify the code some.
> >
> >
> > I think overall a better picture of what you're wanting to accomplish
> > would be a good place to start, then we can iterate from there on what
> > pieces we need that are new.
>
> I have Temperature, Pressure, possibly Humidity sensors all which are
> variables to different models to compute Altitude from.  I do not have a
> true Altitude sensor.

This sounds exactly like the CFM sensor, and Exit air temp sensor;
Most systems don't have exit air temp sensors, but they have input
power and individual fan speeds, which can be put into models to
determine CFM and ultimately exit air temperature.  I would expect
Altitude to do something very similar in code (although with a
completely different algorithm).

>
> I am being asked to provide Altitude.
>
> Personally I believe the desired feature is how much cooling a parcel of
> air per unit of time.  Thus I would think air Temperature, Humidity, and
> Density (probably compute-able from Pressure, but I have not checked on
> the specifics) would be the important factors.
