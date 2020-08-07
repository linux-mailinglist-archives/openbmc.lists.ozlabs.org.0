Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A024023F1E7
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:25:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNXLY2hqJzDqFJ
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:25:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=j8IjfBL8; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXKc2H8XzDqC6
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:24:33 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id x10so1371256ybj.13
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GMDiEoUldP6H7p5vGAlMp0Pa+S6717c/jjaPdsjMqBc=;
 b=j8IjfBL81QnuTwIkIUI7EgwnqerYv0oj+K6Kcj6kT8tG6fCoV2O7B9jFGUTdFGfId0
 H2Y8n5Dx8bmxWtkmX7GKFFSNIG3d3CTMK5+qID9ooz9gxWWZxp3Hl+Lh+s8ADHQJzViM
 fxKPGCVj6TLDZv3Z1B5InwWvYJJnBtGpY4cUnRPjG5lRTVw17A6Y5xvSLYbbn3uBPGs9
 iVsGfF6Sdb6UOv9POH5VSov/mI8nRMh6ZSE0iSYNIlnMDkbHXvcIWgfOAw68RAo1yNRj
 yoZ2vYXE4sWwlioRd5P+/IwGww+HmnyHdbmUGlFZAxV4jk0JzMj/psrCu+TwWU4kz61x
 Ir1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GMDiEoUldP6H7p5vGAlMp0Pa+S6717c/jjaPdsjMqBc=;
 b=Z9fmltNPMK5LsCQfPxFhbIGB9RDG2+034YxFb2Sizul3nEL40gqLkU8Evx/3JIQY0O
 V2Tz6THA80bg5TZN5ts3ve8iYhcfiR6UitaIGFANdkVPczenhwmzGRoQthvLWqViOIve
 FwPPbu7Q/ZUOlevthGPPuApF77MnL7pUWe1E3kJeFmhFitkQvq6ynA2NkWceVfJYw6f2
 /otN6vjgDKRUgzWdUglpuk3oLdKI46Z1N5Vf9OX0ouKeXlo3FMPr/7l/8vxm728CX8fk
 eF4lCEVr+SQa4ZH44wN3uRG6iNZXjmjhGM+gsHJjGHamBfdyLIJAJgcYEpz2m+zh9NmE
 NxYw==
X-Gm-Message-State: AOAM530KmG9q38qa5i5VvFb360bG5BMuLZRuZC2Yh5nSzKeCi/Fmpv7d
 lcem9MwgGmEeT2vD0dZCOuimHNciCPXabx7zOxu3VcTApCA=
X-Google-Smtp-Source: ABdhPJxdp7gvVxr1ySiJkJD9gBg/tUxonzqvr7Q+LL8po/0QTEu38uUbFKeQgbsAL2lvydFSC0JTZTNjfZuysforLVw=
X-Received: by 2002:a25:7344:: with SMTP id o65mr21924553ybc.417.1596821071701; 
 Fri, 07 Aug 2020 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
In-Reply-To: <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 10:24:20 -0700
Message-ID: <CACWQX83epXBvw6MygbqrjYyP1fAzmpu9q2KgLKfFW5b0+gQqGw@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 9:54 AM Jason Ling <jasonling@google.com> wrote:
>
> > What about making the device/type lists in PSUSensors extendable using =
JSON?
>>
>> Say more about what you're wanting to do here.....
>
>  Take https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMa=
in.cpp#L43 and https://github.com/openbmc/dbus-sensors/blob/master/src/PSUS=
ensorMain.cpp#L59 and make it so those can be extended using (for example) =
without an upstream code change. I picked JSON as the easiest example.
> IIRC PSUSensors does validity checks to make sure that the device emits a=
 name in its 'permit list' (hwmontempsensor is less picky) so tricking PSUS=
ensors into gathering telemetry for a non-public device is tricky.
>

I'm conflicted on that.  Part of the reason that list is there, and
not in the config files directly, is to convey that those are the
types that have been tested to work correctly, and the types that the
config files "promise" to work sanely.  The other thing is, if you've
done the testing, adding to that list is (should be) relatively
trivial and straightforward.  Opening up that list to runtime parsing
opens a lot of security questions I'm not prepared to answer.

>> Can you give an
>> example of what you would use it for?
>
> Sure, the primary use case would be
> It's a non public device. Would rather not broadcast information about it=
 or have to obfuscate the device name. Really would rather not maintain pat=
ches until the device is made public.

First off, you will always have merge conflicts when you do this.
Moving the config to json doesn't eliminate the possibility of merge
conficts.  I'd highly recommend doing the research in your org to
understand why these things can't be public.  In a lot of cases it's
legitimate, in others it's just dogma.  The intent behind EM was that
even if the configuration files have to live downstream, a majority of
the daemon code can be upstream.  Unless you're working on custom
silicon (and please don't tell me if you are) this should work just
fine with most commercially available devices.
In theory, the intended "recommended by the authors" way to handle a
"custom, can't be published anywhere" device would be to create a
totally separate daemon that implements that new device functionality,
and adds an exposes record specifically for that to your config in a
patch.  In theory, the config file patch is small, and pretty easy to
merge, and should be the only conflict you're likely to get if your
app is self-contained.  That's not to say this is supported by the
project, or that the EM maintainers make any promise to not break you,
but it tends to be a lot less likely, and has been a pattern that I've
seen work well in the past.
