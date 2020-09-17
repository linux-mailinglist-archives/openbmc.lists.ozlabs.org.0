Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C026D226
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 06:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsNrs6ZCNzDqWF
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 14:14:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Dlrbl7O2; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsNr70sdYzDqGx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 14:13:40 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id x8so696391ybm.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 21:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5w1mxWvqDne3FLlaiD0zW3wYqtLaqf8ARSQsFj5o+4=;
 b=Dlrbl7O2Nzb7gbcSiKhwGTwXPfzQc1j86kbqCi++ZrcgxWwiSFruF6MUhWx2XZ/c/4
 NqutnpyqZLvGuqrtldW6IsCR6kdumCnGG+Z15gCtWCXKZH4sEjTGEpgKwDT41Tx2dpIC
 YmQ4tqSeqHkfBSIieYVmneehW2GGzXcj6WUdUQ06gJIzXtfaxHYRcapyZp5x2TuIURww
 qhs63Z3M78YqW/Q/xCQRG66YAKaDV+Csw5eVuLJxtZi+20WHaZosFRdlHY4h4FYb7thm
 QOw/Sm2cO+O/0p4yksjRnYnVQ09bqGydaWuQjmODI7ggzAkKAc6bC72ggvMQGgxHlE35
 71TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5w1mxWvqDne3FLlaiD0zW3wYqtLaqf8ARSQsFj5o+4=;
 b=dEiuKbOTAeukqTc1vDGvCVdRsCX9HQcti6bt5tC8CBrlcgYCZh9vnEKztwBkqC+FLZ
 OhKITbXfKOlPIN7wk2OIHOJNDfTj3Z2KP+Luqi/SL+qL8CWqJYtlbeKlAXRMZdjuEi9c
 Aoj89R7msI4wkiqtiKWBqzh07EV8m/Rx1NQSLRIrAHsSeBG1Nyvn7QwraY6wj/yh1Hdg
 w9dEjismwjnWPLIzQJDbAvG50wGJUAqEhxdhpjZU5RHtHzlUwduq1UCS1SHDQH52u0TB
 rWY94d/+gBK73Dz6aIizkpaDkNQ1CjAnWclqWuo5AmudhyCkqR8o+6KInhvg0dIWTClH
 yB9Q==
X-Gm-Message-State: AOAM532j/r0MdiiZaZfD5dXThBpgfeMvf0WSzyUx3n22twAcxSFa61Pq
 0WGu90uYVXZ79X4E/Vnjor+mVZ7J5SE3WdNzlvrw3g==
X-Google-Smtp-Source: ABdhPJxAP6hLtXeTvpQ8nYIIAewmPWHinHXu+e41jiGJNJRzOqHw5xUwLlB3H7xYJvYNebVUp0/mQAMN49efv6o5N2E=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr6104908ybm.203.1600316018425; 
 Wed, 16 Sep 2020 21:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
 <20200916170811.GC6152@heinlein>
 <CACWQX83XPm4DmjgvtjD9L688m+XodRbCZdwDkNmf9n2B_047fg@mail.gmail.com>
 <20200916172929.GE6152@heinlein>
In-Reply-To: <20200916172929.GE6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 21:13:27 -0700
Message-ID: <CACWQX81zWi65NyJTqTamQAjJbUvS+aT2VsukCaGEuF3EB_JLbA@mail.gmail.com>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 10:29 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 16, 2020 at 10:19:56AM -0700, Ed Tanous wrote:
> > On Wed, Sep 16, 2020 at 10:08 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > I think we only "got away" with "no impact" from the lack of
> > > implementation because the particular implementations that work well
> > > with dbus-sensors also didn't implement it because dbus-sensors didn't
> > > provide it.  That's kind of circular logic as a reason to eliminate it.
> >
> > Are there any implementations that people use that rely on Units?
>
> Yes.  Originally the IPMI hanlders did and they seem to still.
>
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/sensorhandler.cpp#L652
>
> I don't know what happens to this code when a dbus-sensors sensor is
> read.
>
> > > There isn't really a programatic way to define and enforce object paths
> > > presently.  There is a programatic way to define and enforce
> > > enum values.  The enums don't actually need a lookup table, if you're
> > > using the sdbusplus generated headers and bindings.
> >
> > The lookup table I was referring to was enum-value -> IPMI value.  I
> > don't think sdbusplus has the ability to generate that for you.
>
> Agreed.  But, a C-enum to C-enum map is easier to maintain than a path
> segment extraction and string to C-enum map.

Fair point, although the segment extraction is usually 2 lines of
code, so it's in the noise a bit.


>
> > > If I were to guess which of the requirements would be more likely to be
> > > changed it would be the object path.  There are very few other places
> > > where we have such strict requirements on object paths (though we do
> > > have places where the object path has meaning).  The current definition
> > > is a bit ambiguous by what is meant by "the correct hierarchy within the
> > > sensors namespace[2]", but the current implementations seem to take this
> > > to mean `/xyz/openbmc_project/sensors/...`[3].  I don't know that this is
> > > particular convenient for a multi-host system or any case where a BMC
> > > is aggregating sensors from other BMCs.
> >
> > I'd be fine with this solution too.  The question I should've asked is
> > "is there a way to get rid of the redundant information".
>
> We could also remove the path segment requirement.  I'm not sure the
> value of it in one way or another.  It is only redundant to a human,
> isn't it?


I'd be in support of that too, but that's probably more work.  I have
no problem adding Unit to the sensors, just curious if it was needed.

>
> --
> Patrick Williams
