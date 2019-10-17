Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57BDB251
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:28:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vF2T3WVMzDqdw
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 03:28:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fPcWPsPg"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vF1k4PfZzDqQT
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 03:27:22 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id y5so1978204pfo.4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVMVJz0eQ79LNtR/W/8jQ1ue+Iy83TwpRN2d03nd6pY=;
 b=fPcWPsPg33EqnCM+7on4EiYyht0mY30Rgo3OFqxGwlug1OHFOxkzcHJGm8rRCT9zqx
 N5ZngwvnQIRtlc/OMMCJSONzbJUqfJELlsMnytjkK+21sq//KbLv1CSBkCehY/agWEwM
 31s1gGW+c/soxCEPLMZ3JnJzQ1gbZAfaDqCAAnGCuL6MoUYzIK6SVHhAmlsq1qK96s/I
 o760A3+CNSDSreY+0DbUSssZicBQecp0/Rvw6kbKHLsYrevMeNNwzd1uxjjZFtDzGqb9
 9M3VTJ9j6tHJzxqGbTmgomB9XcTfMITF7PuOHQc7ogGJJBEAWf+BBr7VXKx+b8auNin4
 dKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVMVJz0eQ79LNtR/W/8jQ1ue+Iy83TwpRN2d03nd6pY=;
 b=gW3ExMGwlXrk/qnkqIGZE+g6pnRU/b+khV+g9zkjcq7ojpBp0UkxQfKJ9HOopeDu5j
 5n9wsrpmXGlLYPlB69BEZesYK4F3QoOtz3D4jaj5qIqX1d4nXBSDh16WGiIWakKcWv0z
 ImXBsrcqxlXcjA3gY0Nr6eZ9P5pueNiJuMOKHsKH5vvoeBCAWaEj3xtAXBp3LtUpP0MD
 bsyiR6w/8HYZzuzM1dN3Z1+3GFT1+gaEsLbZT9GVIWezstie1BqoCrB3ZS6DfUkbLdG2
 NHEPzrxs2OQM5jZ9tB0MRnvY5tzx7RWOr6sV33q+IkJmn8JyeVDUqU55K4q8nEpvUtMM
 HwOQ==
X-Gm-Message-State: APjAAAVhOCNS+nx9ivOeHND4U138srLdfpnhlgsCRZjfwUBNjfjHf/Sf
 LlxYggLJAjAPdAO8VBiKdqG1dkOyXbctJTpWUA2LOw==
X-Google-Smtp-Source: APXvYqybL8dlYefKDBxIGgRZ7sP4JhbGeHUVN/rg0YCdwU1dE2j4EqrDIx74yRzKBP6288fJDJ4l3BtC9uXiYo/crbc=
X-Received: by 2002:a63:3303:: with SMTP id z3mr4987044pgz.353.1571329638051; 
 Thu, 17 Oct 2019 09:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzVe07GjrKj5ZLLVBA=mbx66aEWmYYfGhiTKpNoAmrEqw@mail.gmail.com>
 <e17f4bdf-e218-ce9b-c8dc-f408952eb4c2@linux.intel.com>
In-Reply-To: <e17f4bdf-e218-ce9b-c8dc-f408952eb4c2@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Oct 2019 09:27:06 -0700
Message-ID: <CAO=notzZ_r7oYhrrDPA9RHvepUr-g_83GQ6kMprynpF3jpB8+g@mail.gmail.com>
Subject: Re: FRU device entityId and entityInstance
To: James Feist <james.feist@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 9:17 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 10/16/19 10:57 PM, Patrick Venture wrote:
> > Because there's no association between an entity-manager board and the
> > fru device entry, I added a new interface to the entity-manager
> > hardware profile:
> >
> > "xyz.openbmc_project.Inventory.Decorator.FruDevice": {
> >      "Bus": "$bus",
> >      "Address": "$address"
> > }
> >
> > I'm making the properties uppercase like they are with the FruDevice
> > interface so that they match  -- BUS == BUS, but they are different
> > types.  I haven't dug into the code, but interestingly these are
> > uint64_t while the FruDevice Interface's BUS is 32-bit.
>
> This is because Entity-Manager reads from json, and the native json
> types are uint64_t. I've considered using the size of the variable to
> determine this, but then guessing the type became confusing, and the
> usage of visitors went up, and in the end it didn't seem worth it.

No big deal, it's just a minor inconsistency in the lookup code.  I'll
send the patch to intel-ipmi-oem later this morning.  I have it worked
for FRUs because it's a 1:1 lookup, so trivial.

>
> >
> > This lets me, in intel-ipmi-oem go from a FruDevice entry to an
> > EntityManager board entry.  From there, I added another interface:
> >
> > "xyz.openbmc_project.Inventory.Decorator.Ipmi": {
> >      "EntityId": "0x07",
> >      "EntityInstance": 1
>
> How / when will EntityInstance increment? Should you use $index here?

In this case, it's up to the implementer.  In this case it was just an
example :)  The instance number doesn't necessarily need to be
monotonically increasing, etc, so whatever someone may end up wanting
is fine.

>
> > }
> >
> > If this interface is present, and those properties set, they are used
> > in intel-ipmi-oem.  I have a patch for this that has been tested and
> > works.  I haven't updated the schema yet, as I wanted to get a second
> > opinion on it.
>
> This looks very reasonable, and in line with current designs.

Ok.

>
> >
> > The sensors also need the Ipmi Decorators, but I just added the
> > EntityId property to the "Exposes" entries that need it, and then it's
> > in the Configuration interface.  However, I haven't yet pushed that
> > into a sensor.  I see there's an association interface on a Sensor and
> > that points back to the parent board, but it isn't immediately clear
> > to me how to then travel to the sensor from there
>
> I'm a little lost on why you need to add this to the sensor. The
> association should point back to the base configuration that caused it,
> and you're adding the EntityId to the base right? So from current logic
> you would just need to take object that contains the managedObject of
> all the sensors, looks at the associations, that should point to a base
> object in EntityManager. If that base object has a Decorator.Ipmi, then
> you can get the Entity Information.. or am I missing something?

Looking at the YAML files, I think that matches what you're
suggesting. Phew! I was a bit worried.  It was my understanding that
the entityIds might differ between a sensor on a board and the board,
but that doesn't really make sense --> and I was also worried the
entityInstance would differ --> but also, that doesn't seem to be the
case.

You're absolutely right.  Using the association to look back at the
board should work fine :)

>
> > -- by first thought
> > was path swapping, but that won't work in cases like tmp441 where one
> > sensor configuration feeds two sensors.  Anyways, I was thinking, what
> > if the Sensor creation added another interface for decoration (if
> > configured), so that intel-ipmi-oem can get the entityId and so on by
> > just grabbing the sensor object -- it'd be yet another decoration
> > interface?
> >
> > Patrick
> >
