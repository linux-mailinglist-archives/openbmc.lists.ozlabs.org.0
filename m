Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6E6ED79D
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 00:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4zqL3HH4z3cLF
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 08:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vD/FFfAq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vD/FFfAq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4zpk0nL7z308w;
	Tue, 25 Apr 2023 08:10:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B3F06299E;
	Mon, 24 Apr 2023 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48F5C433A1;
	Mon, 24 Apr 2023 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682374235;
	bh=FnGcqvrEdLbzUlljWiXhCsHy+qSn4AIL5KgH7iNawGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vD/FFfAqifz1nnj6u1cKoYA6GH2xWLs1V+ea4SuOBpAHQh0NGFjWQSVbhpBcJcyWf
	 5aOCD+ypac0Bq6YZR1YiJlplzcuSYM9Rj/cS7VNwTmIarJqdDGwq0siT8Z1Rx3pyFd
	 uIF6CG+ld0p/DXJ2MDysgwFGm33oDzMbh8FK4uTfw2dpxgA6gSYi2UnPj9+YrUqTUc
	 RO+7Hri8oZZphp3UiJzPteyEuQ/oIqhua7BNO+3B52D/6VB2MsknlXdeKRKeWTnwr9
	 uVKS0ASFJVltj9jRqGi5XDys6F6NjS3eMd3J8yY7nKHNNoZ64TPWpTB1RlyDqpRbtD
	 Lm7Fysb+fVYSQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54fb4c97d55so34826397b3.0;
        Mon, 24 Apr 2023 15:10:35 -0700 (PDT)
X-Gm-Message-State: AAQBX9dQsDSDtTtNu2dXXpZk72n/wTxTdXEJzMzvbox1JjTgmYgbyoI0
	x0HYLch1HIHLUfdlEauim6wiGAAPFZf9XDsTzg==
X-Google-Smtp-Source: AKy350Z8fwjeT6uilQZV5elUBNHPlU26+hD27eSWPRlQhPwmqTcN2nXurF+nyFvBNi+9INgYk5eGXnlLE8/dW8JHY5k=
X-Received: by 2002:a0d:e2c9:0:b0:54f:752e:9b63 with SMTP id
 l192-20020a0de2c9000000b0054f752e9b63mr9341801ywe.15.1682374234531; Mon, 24
 Apr 2023 15:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
In-Reply-To: <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 24 Apr 2023 17:10:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
Message-ID: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Ansuel Smith <ansuelsmth@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 29, 2022 at 8:27=E2=80=AFAM Ansuel Smith <ansuelsmth@gmail.com>=
 wrote:
>
> On Tue, Mar 29, 2022 at 03:20:18PM +0200, Krzysztof Kozlowski wrote:
> > On 28/03/2022 02:09, Ansuel Smith wrote:
> > > Hi,
> > > as the title say, the intention of this ""series"" is to finally cate=
gorize
> > > the ARM dts directory in subdirectory for each oem.
> > >
> > > The main reason for this is that it became unpractical to handle 2600
> > > dts files and try to even understand/edit/check the situation for a
> > > specific target.
> > >
> > > In arm64 we already have this kind of separation and I honestly think
> > > that this was never proposed for ARM due to the fact that there are
> > > 2600+ files to sort and the fact that it will be a mess to merge this
> > > entirely but IMHO with a little bit of effort we can finally solve th=
is
> > > problem and have a well organized directory just like arm64.
> > >
> > > Some prerequisite on how this work was done:
> > > - This comes entirely from a python script created by me for the task=
.
> > >   linked here [1]
> > > - I had to manually categorize all the different arch in the makefile
> > >   based on the oem. I searched every arch on the internet trying to
> > >   understand the correct oem. I hope they are correct but I would lov=
e
> > >   some comments about them.
> > > - This current ""series"" is all squashed in one big commit to better
> > >   receive comments for this. The final version ideally would have all
> > >   changes in separate commits. The script can already do this, it's j=
ust
> > >   commented.
> > >
> > > Here is a list of some discoveries while doing all the sorting.
> > > These are totally additional reason why we need this.
> > >
> > > While creating the script I discovered some funny things:
> > > - We have orphan dts! There are dts that are never compiled and are
> > >   there just for reference. We would never have noticed this without =
this
> > >   change and probably nobody noticed it. They are currently all liste=
d
> > >   in the python script.
> > > - We have dtsi shared across different oem. My current solution for t=
hem
> > >   is: NOT SORT THEM and leave them in the generic directory and creat=
e a
> > >   link in each oem dts that points to these dtsi. This is to try in
> > >   every way possible to skip any additional changes to the dts.
> > >   Current dtsi that suffers from this are only 3. (listed in the scri=
pt)
> > > - arm64 dts and dtsi reference ARM dts. Obviously this change would c=
ause
> > >   broken include for these special dtsi. The script creates a depende=
ncy
> > >   table of the entire arm64 directory and fix every broken dependency
> > >   (hoping they all use a sane include logic... regex is used to parse
> > >   all the different dependency)
> > >
> > > So in short the script does the following steps:
> > > 1. Enumerate all the action to do... (dts to move, scan dependency fo=
r
> > >    the dts...)
> > > 2. Generate the arm64 dependency
> > > 3. Creates the Makefile
> > > 4. Generate the Makefiles for the current oem
> > > 5. Move all the related dts and dtsi for the current oem
> > > 6. Check broken dependency and fix them by editing the dts and writin=
g
> > >    the correct include (or fix any symbolic link)
> > >
> > > This is an output that describes all the things done by the script [2=
]
> > >
> > > I really hope I didn't commit any logic mistake in the script but mos=
t
> > > of the work should be done.
> > >
> >
> > +Cc Arnd and Olof,
> >
> > Ansuel,
> > Thanks for you patch. Please cc the SoC maintainers in such submissions=
.
> > It seems that you got some quite nice discussion, but still the core
> > folks are not Cced, so no one would be able to take your patch...
> >
>
> I had some problem with gmail and sending mail too much users. I put Rob
> and You and all the various list to try to workaround the "gmail spam
> protection"
>
> > I am pretty sure we were discussing such split idea in the past and it
> > did not get traction, but I cannot recall the exact discussion.
> >
>
> I think the main issue here is how to handle bot and how problematic is
> to merge this. As written in the cover letter the final version of this
> should be a big series of 50+ patch with every commit specific to each
> oem. In theory we should be able to merge the different oem separately
> and try to at least start the categorization.
> Another idea I got to at least have a "migration path" is to convert
> every dts in the dts/ directory to a symbolic link that target the dts
> in the correct oem. But I assume that would fix only part of the problem
> and git am will still be problematic.

I have a script[1] that does the conversion written the last time this
came up. Just have to agree on directory names. I think the easiest
would be for Arnd/Olof to run it at the end of a merge window before
rc1.

I'm very much in favor of this happening especially before *any*
overlays are added to add to the mess (it's probably already
happened).

Rob

[1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/
