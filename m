Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B18BF05
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:54:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467JhQ5VP9zDqX2
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:53:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W1uLrZhi"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Jgf3ZWdzDqQ6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:53:15 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id p184so51934415pfp.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NUM0HWEXRAVJGVGzqlPX3dCskNhVxc4/H3G8qD6zjU=;
 b=W1uLrZhi7AsUMy/jAXMsEoDEknLZQavgilUjJAYiOdfd8PMnd0biKfP4+IHUoXmj0i
 jYz+j9D+SRcfTgbJXbdtLH/DjP8XKm89phXKF6KY/629KKEuJrrcuR1Re0mN6TA/jvmJ
 ztF/RaAZ5IBqstuGgFFSdufF+er6WcWK8qU1S2u0TZwuE06yZy3pFvB/SGuLDdJ3jG1j
 7WuohcLb4jne6n3yXACTRwGQ1MV7UOx9zE+TaQxv21OFCfh4hPO9s57NnML+g/3ZKhKq
 lq4EHP1CwAfDjmR7SAr73FDkFxqPnzfyC4C/s50cqfszv+apZ1ZWyYOm5X2bzfH/4plu
 TOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NUM0HWEXRAVJGVGzqlPX3dCskNhVxc4/H3G8qD6zjU=;
 b=Wl00IFheFMXJX39zimmhbx8kv2Qi8l2fuMkFSvgzLo8Pirb+H0576QQNAAwoSE6HGw
 N9T6CvWA1yKJ8UXP/ENW5PGpzumyrcvgWuNJtoQrOoGcKQ0siFlGnIoetU0bVJQo7oro
 UuL0yXtbW1i6/fyqW12xH1Xjm2BX0jT1/hGD2eVPQgmZj8Bwx4hSJNsppPnX1bJ5m66F
 qxYS5jICB69s8MJ0Js4zUv8KArE6elpgz59rY/BPLJ43v2eELr//jiL22lFNJjX4DSQU
 /kQa57WG5zLGR7Lh62kcp73GVAdxXArDWKvw9CVhRZl/4I8KVZ+fMYRbXh1yZ1Gy35az
 0yHw==
X-Gm-Message-State: APjAAAVKeCHOij8Y2Fi/lFRajShIH8g8G/Nc1WtrmOkvy41qMZ8Xr39N
 V7ZqBSdyinQlXWmxlBIhzi8cSJXYZXhsOAAl/LvsJA==
X-Google-Smtp-Source: APXvYqyYKctN2ADfzq/vbwywRCGfZC28WE49wGtwS6IRk55iF8r6gPIQKQ4Zo83g+UQUZP7As0orZrZ1xo6RkeoL9nY=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr2925186pjs.55.1565715192286; 
 Tue, 13 Aug 2019 09:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxCMZBE7+osFBTmTjg_zyC=BLZ3QZhxsnUrKXwE2JqChA@mail.gmail.com>
 <d1e0c76c-a38d-6a3d-f78a-508b7014ccd6@intel.com>
In-Reply-To: <d1e0c76c-a38d-6a3d-f78a-508b7014ccd6@intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 09:53:00 -0700
Message-ID: <CAO=notxiAHKTDQWXE6iv37nsjSndksw8t0pAfBbLW_bGNXT+xg@mail.gmail.com>
Subject: Re: Adding BuildDate field to entity-manager output
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 9:31 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 8/13/19 9:09 AM, Patrick Venture wrote:
> > So, with entity-manager you can specify and interface, some properties
> > and how the values should be presented.  For the BuildDate field
> > however, the output from FruDevice for that interface doesn't match
> > the Asset interface's date property format.
> >
> > I merged patch into phosphor-host-ipmid that makes it support parsing
> > multiple formats, however, that dbus interface defines the format "by
> > description."
> >
> > I was curious if it would be worth trying to reinterpret the value
> > when publishing it to that dbus interface?  Converting from "%a %b %e
> > %H:%M:%S %Y" to "%Y-%m-%d - %H:%M:%S"
> >
> > Honestly, I'd be perfectly fine just adding it as-is to the Asset
> > interface description since phosphor-host-ipmid knows how to parse it
> > (pending: https://gerrit.openbmc-project.xyz/24384).
> >
> > Thoughts?
> >
> > Patrick
> >
>
> In theory Entity-manager is just forwarding those fields directly
> through from FruDevice.  It's not surprising they're incorrect;  I don't
> believe there are any uses of them by the external interfaces.  IPMI
> just reads the raw FRU bytes, and Redfish doesn't expose the manufacture
> date at all.
>
> What I suspect is that we just need to make this line conform to the
> right format string.
> https://github.com/openbmc/entity-manager/blob/b8293c016074d19d8579c8ef0e1bfee6dff46ab0/src/FruDevice.cpp#L738
>
> And everything else should "just work"

That's my understanding as well. I Just wanted to make sure the format
wasn't important to anything redfish or out of my scope.

In this case, I'll just swap out the format string with the other one
and it'll just work :)
