Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852836DFCF
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 21:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVpxM6pPcz2yy4
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 05:44:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Af2SFQrn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Af2SFQrn; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVpx82kDQz2xfy
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 05:44:25 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id e5so35679755wrg.7
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5y+GoKwWUEA5yNeYY+Ng9u0o5Ga+h8ovVxGRrcsw2xw=;
 b=Af2SFQrnY3NYPHhJ3ALBa6eCuByZ8mDUzPlee3Ghsz7YjqYG/CXtiCbaImeRmoLV6w
 UMfRgueliIzoiLS43uTZfc5RqU7zV2cvdrg89jgXPGvC0HrH/b+dSVc6iPrQ9cH1m8qC
 MgaMpfo5DvgLqilEQEFUq39YM8DQY8uTKM8xoWIYzpRyE0Cw90jBAtpMepOtCHAPQjO2
 w6j13JcBvwDpxOYev6ZptrQcm3KaKyD3OmU1CnYedXjeEUCcPS/GxHK+L+b/UvuzS7nh
 7wlx5DdJ7dodkH9ajEfDfmUNBTKYkIhGUt7lblkRmUrMRhPk1++ugylDGj/AegRQgjOG
 tygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5y+GoKwWUEA5yNeYY+Ng9u0o5Ga+h8ovVxGRrcsw2xw=;
 b=qvv1D8JICSa/bfvDAhCJ8dIKIYOKQy0872dp0I5yY9Mhgl9kABC51hM7PZfPp8wrGx
 XH3dNCJlVJMip8C4TuKHU3taPq14xliAt08RpK4SnHD4huOzxAPARJKdbsEpFwKhRX5a
 OeYe03+xlMecHB659sZ86C2DVOLfXWrlvaujLXFgi83px3SHzC31jEDiZ+FTPfLFXloW
 YHT20IjNkqK3zkIv2fT0Z0sq5EVHHdGYWLoExBqFmwjtTAfHbDlIRxynGNc/92TiJjC+
 WBICH1t487wrrHP0BK1GLd/+TBhkO6dCenQI594VgEB0m/6jpQjZnXSrSmAJB+CMfL76
 67WA==
X-Gm-Message-State: AOAM532X0IndrBUc2AHFgwweCu7Sh+CyiZl6dB9dKqkhmVGC9sYbeq3y
 Pv0JmEI6TPqkSUXz7aqIla2SLuoKlktBR/KeYzQhbQ==
X-Google-Smtp-Source: ABdhPJzLj5ZY05AoXFIvMwWLGfQcanvU5RXOFawjIewlG1mFsxBf5e4wh4nN8TZRB/dRyauR50x5Al6SbG1sGBlCR84=
X-Received: by 2002:adf:dec7:: with SMTP id i7mr24076532wrn.407.1619639059099; 
 Wed, 28 Apr 2021 12:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
 <CAH2-KxD1kB25nYADKzJ9rCb0+fu1mWKiQ_KMQ9nRvvi7ids_4w@mail.gmail.com>
 <d181d1f7-7e9a-2f2e-edaa-3bdafef1277e@linux.vnet.ibm.com>
In-Reply-To: <d181d1f7-7e9a-2f2e-edaa-3bdafef1277e@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 28 Apr 2021 12:44:08 -0700
Message-ID: <CAH2-KxDygU-V_U2e4KOF6VCMdftwXUDvYPbMMKjg+UzwqKXWJg@mail.gmail.com>
Subject: Re: Move Inventory.Item.Board from Redfish Chassis to Redfish Assembly
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
 Ed Tanous <ed@tanous.net>, Derick <derick.montague@gmail.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 28, 2021 at 12:38 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> On 4/28/2021 10:46 AM, Ed Tanous wrote:
> > On Wed, Apr 28, 2021 at 9:18 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
> >>
> >>   From some discussion on Discord a few weeks ago. A newer way of
> >> thinking in Redfish is for a simple rack server to just have one Redfish
> >> Chassis and things like boards modeled as Redfish Assemblies under the
> >> Chassis.[1][2] Today we look for inventory item chassis and inventory
> >> item board[3] to populate the Chassis collection.[4] I propose we move
> >> the "Inventory.Item.Board" from Redfish Chassis to Redfish Assembly.
> >> Does this break anyone?
> >
> > This will definitely break people, given that sensors can be attached
> > to boards today, and (unless I'm mistaken) Assemblies don't have their
> > own sensors.  Is there a solution to the sensor issue baked into this
> > proposal?
>
> Looking at the documentation on the sensor associations[1],
> the bmcweb code, and association code[2] (e.g. [3]) sensors all look to
> be associated with an inventory item chassis today for Redfish Chassis
> <-> sensors. If there are sensors associated to boards with the
> "chassis" association ("all_sensors" is the reverse association), they
> would need to be moved to an inventory item chassis. I don't see any
> though unless I missed something.

Here's an example of something that's type Board that creates sensors.
https://github.com/openbmc/entity-manager/blob/master/configurations/A2UL16RISER.json
There are several more like this.

The problem here is that they are in fact... a board.  They are not a
chassis under how we currently define the item interface, and moving
them to be a Chassis would cause them to report as ChassisType =
Rackmount in the Redfish Chassis schema, which is definitely
incorrect.

I don't mean to throw up roadblocks, and I definitely don't know what
the solution is here, but we'll need to solve it before something like
this can go through.

>
> [1]https://github.com/openbmc/docs/blob/919a7b6816a5f16aa72d298e81e0756d95d5031e/architecture/sensor-architecture.md#association-type-1-linking-a-chassis-to-all-sensors-within-the-chassis
>
> [2]https://github.com/search?q=org%3Aopenbmc+all_sensors&type=code
>
> [3]https://github.com/openbmc/openbmc/blob/c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64/meta-quanta/meta-gbs/recipes-phosphor/inventory/phosphor-inventory-manager/associations.json#L389
