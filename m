Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5038E24D
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 03:17:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4687q56g1FzDqpC
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 11:17:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NsOHijuP"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4687pT03NPzDqjG
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 11:17:02 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id w10so514576pgj.7
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rGfBog8XsSwKKrkk8+iFuFl4qDOjz/3FGqn6y9GdBuY=;
 b=NsOHijuPKmiZv3PjbeYt7VCp4bL3Zy6fgGg/s4pTfJIGLzPK8oIQ0q6+srrQ86NIiG
 /9bs8PvbpVzMI3LePH2JTwvI2Cmgcf5ZLZTYhDmcns2WVYnyiyYxe3ptmgHAHn2Zhq7s
 u/KYLXn/tSOKJWlo77w/t0YKgekKy5r2PfoabI8AgVE6e0yd47kQXOAiqIhdrIC3apYo
 zHRDAoGgItpppz9waFXx/XsU5HXOLrqF22PDXyyY3evIWwD/RFLZjkux5D5qH6XoJToq
 XIIPmHx9E7ddcTuP6TlrcGfFv935haseBoOG15zHiXjcmy0BrHZu7T0LXLQIWTCtOyvP
 C5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGfBog8XsSwKKrkk8+iFuFl4qDOjz/3FGqn6y9GdBuY=;
 b=PKmPVMW68aCSX1DGua8JHGJh0RufB9prfbZMEr5F262e7qL0AC40pOJdpnuMaIL3yv
 9Iga0VUIhQsQMLN/Gxqzj+Mkz8S1bDemfREu5iZBZMk5OjRvD4OO1zTQg07p2Lby8RM1
 IaL0qugFy5WLbs6kg5VI4IAWCDeGd4wX4KCB65ONxrFP2W0GwHCiF9qrSbTH21iekBzp
 3SHme0jzqLisOll74+VSkalnyRujO4YOrGnq9je3oV2uZ0t9tzgOSZj6soN2yqjJOd0W
 9vZA7wnVCpq8Z9iLQofwMedsB0wWIXIF4sAI77m7mQYleJqAUA98T2K4npFBJhf6jm9e
 wh2A==
X-Gm-Message-State: APjAAAU9HNrDNB6+yRwhwZqMApVzD3m56/VJRqUaYypjDKJoih4tFNz0
 MiHDZNZfV7P4THY+LT6/CgGAwqJ/XFRih/5yKFG4Ag==
X-Google-Smtp-Source: APXvYqzT7fDwTcVrXXouut6JHFkOkYeP+QmFTcRtPo1ATANGPngcs7ugZpROm/grzHZIr9pl1RpvxSvTT5izVst4wF8=
X-Received: by 2002:a62:e515:: with SMTP id n21mr2940337pff.186.1565831819063; 
 Wed, 14 Aug 2019 18:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzZQ4La6sUWYsDqFsbtXV_A4EhdsUA7iTsouxZMsm+bqQ@mail.gmail.com>
In-Reply-To: <CAO=notzZQ4La6sUWYsDqFsbtXV_A4EhdsUA7iTsouxZMsm+bqQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Aug 2019 18:16:47 -0700
Message-ID: <CAO=notzy6ntzoNV3VB8Qu672nYk6qdu2j4Y2zGfi=zqsGCmmag@mail.gmail.com>
Subject: Re: unexpected configuration output given examples
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

On Wed, Aug 14, 2019 at 5:48 PM Patrick Venture <venture@google.com> wrote:
>
> When hard-coding bus and addresses, I ran into an interesting issue.
> Previously, my sensors were dynamically bus'd with hard-coded
> addresses, like:
>
> {
>     "Exposes": [
>         {
>             "Address": "0x1c",
>             "Bus": "$bus",
>             "Name": "$bus board local",
>             "Name1": "$bus board external",
>             "Type": "TMP441"
>         },
> ...
> }
>
> Leads to:
> xyz.openbmc_project.Configuration.TMP441 interface -         -                 -
> .Address                                 property  t         28
>         emits-change
> .Bus                                     property  t         20
>         emits-change
>
> Which is great.
>
> But:
> {
>     "Exposes": [
>         {
>            "Address": "0x54",
>            "Bus": 15,
>            "Name": "$bus i2cool 0",
>            "Type": "MAX31725"
>         },
> ...
> }
>
> Leads to:
> xyz.openbmc_project.Configuration.MAX31725 interface -         -               -
> .Address                                   property  s         "0x54"
>         emits-change
> .Bus                                       property  t         15
>         emits-change
>
>
> Which crashes the hwmon temp program because it's "getting" a uint64_t
> and not a string.

I verified that if I use decimal for the address as an int it works.
But I'm interested to know why "0x54" doesn't get converted to an int
every time?

>
> My only caveat worthwhile is that the hwmon instance is already
> present because that sensor is in the device-tree.  So I would expect
> it to only fail on the export.
>
> Note, I did also try "Address" as an int and not a string, but that
> then failed the json validation.
>
> Thanks,
> Patrick
