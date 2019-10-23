Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F090E2249
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 20:04:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yyvH6gBpzDqS8
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 05:04:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Di7ceyO1"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yytX58jDzDqMW
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 05:04:04 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id 21so2147901pfj.9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXU6JbTB/b/0H+KmJJfk9pfxnDFd4rl4oXVjZnzhm1w=;
 b=Di7ceyO1/Dpl41TqQG15ys9ccWbvJSS16bavt3RfPG8OhLZYAP2FA+TbAgHBWQy2CN
 40Dxkz8qEuOFv79/Qp3a+xlmddU8XP9HiQzlbrFRaqXYoOM69ZZnQ2TrPGgmhbZ3ffuj
 JYNTwiYzkBkMI5WulHiGmMzcRZeqUsuVwAkwRNgF/bbcrtvlsrXrq0wWaj0hQyUpvanK
 GQNO7u3xtA8HDuvj9MdNLVkn9c0tPRvRFsUGEs1d+nMRxxdDozyrneE59rNqccv0t0io
 OF/4d4U+g7iCXcXJRqxfTvfGnG/PL6Z0UCeBbx0J+NlkUP/SSuo2batVaQLafUl68UW+
 AMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXU6JbTB/b/0H+KmJJfk9pfxnDFd4rl4oXVjZnzhm1w=;
 b=nYNudKndnlGqpDGZhWmykIyHf84nYxsVUHEcgf7KmCOrA6Mva02pO7DztoTI3g4yc8
 4xhuwHYZ/ge/2MSUOUkue/vqAA1n9fq2WAwjxYGezCrd1XEz+ZDGIIstHggE1MH76PZu
 xZjTPN5FihDkBbRWwofIaKaquJYBSrT2sHFsgJa1BsEdZBCXY0GOZgZ64Dm5b5R5SdsK
 5SdL1cXtKCZAxIyKMoLJ3Ivqy/LlZqGBa1DaQY622QN4E30Z51/9KEKO9U2IeXvY4y+Y
 oTZOr97hq75i6EmoJQUv9DlUqNOw/FqcijNDepmayhcP5gcbnkVQVS56MaUtovhDaCNO
 FVfw==
X-Gm-Message-State: APjAAAVdLoDElWHxYGTHadX54lQ8k2vwHlAAPqUfoo4aSJDBAd+QZy4m
 Bn4wHoEzc0fjS5QYHujalQkbA8uG2NwyUUhVPtG7NQ==
X-Google-Smtp-Source: APXvYqy9kIJbIsOZXE7BDpTGTkjVGgmYlyqHpLa75KDpFv5uVk4ZMuPyBiHhtylTBslMZ96hZy6GP2PSiHeZySEl8Qw=
X-Received: by 2002:aa7:908b:: with SMTP id i11mr12499747pfa.186.1571853841068; 
 Wed, 23 Oct 2019 11:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
 <657c3cf2-b6c8-6c02-1397-e09963ebb267@linux.intel.com>
 <CAO=notxLcqmNFDeA+XZFkoe2e2=xyQ6F56_EMRvfx--LfzyvJw@mail.gmail.com>
 <e9672d2c-6825-eab9-1b14-ae94d8b5b792@linux.intel.com>
 <CAO=notxFGf8sYFGqfZuCVeUFyeocBT_TfoZosFa0VTyw8bgBWg@mail.gmail.com>
 <4ef74a94-a331-741c-fb99-0a1ceba5e25a@linux.intel.com>
In-Reply-To: <4ef74a94-a331-741c-fb99-0a1ceba5e25a@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 23 Oct 2019 11:03:49 -0700
Message-ID: <CAO=notzpLe7OiaOuP9SBmQxJWNebDWXGvd5EnuCTfm=wRs_5oA@mail.gmail.com>
Subject: Re: PSU Sensors - Associations
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 11:00 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 10/23/19 10:56 AM, Patrick Venture wrote:
> > On Wed, Oct 23, 2019 at 10:54 AM James Feist
> > <james.feist@linux.intel.com> wrote:
> >>
> >> On 10/23/19 10:52 AM, Patrick Venture wrote:
> >>> On Wed, Oct 23, 2019 at 10:50 AM James Feist
> >>> <james.feist@linux.intel.com> wrote:
> >>>>
> >>>> On 10/23/19 10:37 AM, Patrick Venture wrote:
> >>>>> So, I flipped the association interface addition and the property
> >>>>> initialization to match other sensors, and then it started working.  I
> >>>>> was curious if you had any suggestions on how to find the matching
> >>>>> sensor given the paths, for instance:
> >>>>>
> >>>>> busctl get-property xyz.openbmc_project.PSUSensor
> >>>>> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> >>>>> xyz.openbmc_project.Association.Definitions Associations
> >>>>> a(sss) 1 "chassis" "all_sensors"
> >>>>> "/xyz/openbmc_project/inventory/system/board/Altie"
> >>>>>
> >>>>> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
> >>>>>              |-/xyz/openbmc_project/inventory/system/board/Altie
> >>>>>              | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
> >>>>>              | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
> >>>>>              | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
> >>>>>              | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
> >>>>>
> >>>>> No alt2 -- so how do I know this?  I can walk every subordinate object
> >>>>> to find the name match, but I was curious if you had a faster idea?
> >>>>
> >>>> So for the associations you should generally not look at the definition,
> >>>> the definition is primarily for the mapper. You should be looking in the
> >>>> mapper for the association that matches the sensor name that you care
> >>>> about and it should point back to the configuration. If there are not
> >>>> associations for each of the sub-sensors, there should be.
> >
> > I took a look at the ObjectMapper interface you mentioned, and it just
> > points to the Board, not the individual sensor from the board.
> >
> >>>
> >>> I must have looked at the wrong entry there because I didn't see
> >>> anything pointing back to the sensor config entry, but just the sensor
> >>> itself.  I'll take a look now, the PSU sensor naming issue is
> >>> identical to the one if there is just another name available or the
> >>> Pwm case.
> >>
> >> Ah you're right, I don't that that is implemented. Should we create a
> >> new association for this? It seems useful.
> >
> > Not that I don't love hearing that I'm right, but in this case I would
> > have rather been wrong and there been a magic bullet in place that I
> > had overlooked.
> >
> > I think all of my association mapping woes would immediately go away
> > if every sensor pointed to the configuration dbus object that brought
> > it to life.
>
> My original argument was to have the association to point to the
> configuration item, but I got overruled when trying to add it to bmcweb,
> as bmcweb cares what 'chassis' an item is in. I would have preferred
> pointing to the item that brought it to life, but then to find the
> chassis you need to go up one element in the path. That being said, it
> would be a small change to support both.

I'm perfectly happy to see this change come into the world.  It would
wipe away three cases I have that otherwise have to be solved with
slow exhaustive search :)

>
>
> >
> >>
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> Patrick
> >>>>>
