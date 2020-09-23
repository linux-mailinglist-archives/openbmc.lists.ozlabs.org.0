Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 604742762F1
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 23:13:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxW9m4ZHFzDqWX
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 07:13:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DH0pR93P; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxW8p6x0TzDqTM
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 07:12:24 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id a2so779825ybj.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JRfWkrpbD9XUHoG2tYj1Q7KmLn/PZAUG+GZRee35Ng=;
 b=DH0pR93Pe5oDDUoQJu8d04MHvh3MlrBW7X9DANWswyEcvm49WkEgw9Og2QIqBrfHfT
 vu0RaI6tEpiRCzbfFnDaKzko4SzWVifKDl708rNxm9EN0wq7a462EPePtDActET3tjf/
 TmCppIbgzbF4o5DBZ/0Mh6cm7JZURC3LaPtshpqP8d2jobmMGsJjzCPCZ1An5FZx8doV
 4Tmt4yMUOJHCoKV0kgfmw68wtlGZFOoKL5tKEO6Vfz1N43OzpsMxSbY5mbjFPyDsX7I+
 eArt75k0B/0yiNGWDBfjcIT2WPpmGBicyDUaHnQUGx/zEtyxHFBaIl8+sKT6OA4cQsCk
 tIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JRfWkrpbD9XUHoG2tYj1Q7KmLn/PZAUG+GZRee35Ng=;
 b=Y5D/IRzcmKW6ErdeDpKWtrCNED7UVDZvbvJCaP40hYdFF2DauB40EN5zSJkqeIHvCO
 IHgtDDP2W0LLLwZIWLZfn1INKABpt6mZSe4WzEpM7x1Hy7tRr93DlcJxAxARr2h/ruYq
 0pvNNy1p1GWFUw0NDt/bMy5kDg7ELnG2+nw5iRzXyvArhelrDIGzbJugFgdXGyaWmnXG
 yw/CZ3ipV/EOrGW52DE7cSw+v6+hG1PSSanUUV39GjhwbtMd9fQX9C4+HIByfMQaxwoh
 4+3DjJKWMQ3ygWKhQaJCBqsjaHkNnUagvJzoAfApnx/2288WfWusD5zh9jnkGXdG1g7f
 XLaw==
X-Gm-Message-State: AOAM533xNXwzYpBpiYOHpAJRASJRUegU5GZtYg6a8uEHjgCnKv25prK+
 MtrClVocR9wlZvr5CRwVACao+xEFE720M6MTCq5ElA==
X-Google-Smtp-Source: ABdhPJx7itYtJzxJSkKYpWznfunjBwikn/PLaRjer4hm8mvEUHu/CebXW2xaCwkk8+Xg7A7Y5VyQiFsjyCAIGtJDBr8=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr2939939ybm.203.1600895541306; 
 Wed, 23 Sep 2020 14:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
In-Reply-To: <20200923202113.GT6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 14:12:10 -0700
Message-ID: <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
Subject: Re: Chassis reset
To: Patrick Williams <patrick@stwcx.xyz>
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 1:21 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 23, 2020 at 12:26:58PM -0700, Ed Tanous wrote:
> > On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
> > > >
> > > > Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/openbmc_project/chassis_system0.
> > > > Later one is used for AC reset.
> > >
> > > Can we do a query to see if 'chassis_system0' exists and use it first
> > > and then 'chassis0' if not?
> >
> > I don't think it's that simple.  The way the dbus APIs are defined,
> > one Redfish chassis needs to call the chassis0 path, the other needs
> > to call the chassis_system0 path.  We'd need a way to key off which
> > one is which.  I haven't seen any entity-manager configs get checked
> > in for a "multinode chassis" entity type, so whatever interface we use
> > to describe that will probably be what we need to key off to make that
> > path distinction.
>
> In Redfish this would be the system path that maps to chassis_system0
> and not the chassis path.  In Redfish today, chassis doesn't do a whole
> lot except allow you to power cycle the host.  Most of the control is in
> System.

The way Vijay describes it, it's resetting the Chassis (ie, removing
power from the board itself).  The redfish System resource is meant to
model the host, and shouldn't be resetting the BMC.  Maybe I
misunderstood, and this is actually just a host reset?

>
> >
> > >
> > > I think we need to do some enhancement to x86-power-control though also
> > > to only create this 'chassis_system0' object if configured.  I believe
> > > the current code change you did does it always, even if the
> > > systemd-target is empty.
> >
> > I keep getting the feeling that xyz/openbmc_project/chassis_system0 is
> > just overloading what /xyz/openbmc_project/chassis0 is intended to do,
> > x86-power-control just had that already defined, so we went another
> > direction.  I wonder if we just need to make the "Can I do a real AC
> > reset" configurable, and have it change the behavior of
> > /xyz/openbmc_project/chassis0 in that case.
>
> No, these are not overloading each other.  They are vastly different.
>
> host0 + chassis0 make up the 'BIOS/OS control' and '12V power on rails'
> portions of host power control respectively.

Right, I think what I was saying is that we need a mode where chassis0
is freed from host control, and that would simplify the problem a bit,
as the chassis0 api would just do the "right" thing for the platform.
If the platform is capable of an AC reset, do that, if it's not, do a
host reset as x86-power-control currently does.

>  chassis_system0 controls the
> '12v + 5V standby rails' part of the system.  In my opinion, it should
> only be present when a system actually allows manipulation of the
> standby power, but that isn't how it is currently implemented.

Sure, that seems like a fine way to model it, but then we need to come
up with an API to "steer" the Redfish API to the right resource so we
don't break backward compatibility for the things that work today.
That seems harder, and more error prone, but could certainly be
defined.  Whether that shows up as chassis0, or we just redirect to
host0 if chassis0 doesn't exist seems fine to me.

If I can clarify what you're proposing.

host0 controls the host.
chassis0 also controls the host.
chassis_system0 controls the chassis power unit.

>
> > Also, I'll reiterate that a chassis reset really should be going in a
> > separate repo/application from x86-power-control.  x86-power-control
> > should be focused on managing the host.
>
> No disagreement from me; that was my recommendation originally.  But,
> the current implementation landed there and was accepted by the
> maintainer.  I don't honestly think that matters much at a "how should
> Redfish APIs map to these dbus objects" perspective though, which is the
> current discussion.

Fair point, although I suspect that the maintainers platform isn't
capable of this kind of reset.  We can table that discussion for the
moment.

>
> --
> Patrick Williams
