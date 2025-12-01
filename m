Return-Path: <openbmc+bounces-958-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03584C999F6
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 00:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dL0pj73cjz3bb6;
	Tue, 02 Dec 2025 10:43:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764632621;
	cv=none; b=Tt5AIqcPf5guE7zqR52G0jmnRg9T6CYnO9pB3SQDAu/jkB9XqCjJzSIUldB8I9CoVin8t8pMyK2Y+u76PCdDM0U92My/ZICfTyIjwJx9sSCX8aUQvDk89mQJAC4nwBv4MAWenfrhZV9f3V84czVjZyEC0xkbNhXaFUbh6hRiolRSoVbpbCjalujbki5nmHiAtQ4x479ci4qxbIjH2IB65dm/BoRJeN1/RgWoyjVOGZ6H0SdJIKT84vosudxjW72j1HtReI1iSlIbqaRsEonExL0+d9V0eY+UzshVtIo6HorenT4Gm2WejF8wxDe/fEZfnxTaKWnQ1aKG9rLZQoLAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764632621; c=relaxed/relaxed;
	bh=yNitHKVvffQCdUL8QEIivRqGdBqTMR4kRK/fLjkDcjU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dXTOQULf9mIIXP2sIHRrZ12rHvm2AB7E41e6UoFPMveJ57Tcy6x2O12lGto3SWG1+RV8TB0KU7bEW1SyI0R57CT4l9/c9x0FIEAFKHsg788VxONURpqhaaHb3DkBIDE1tL3ZkC2KxbggojPxAGeV+7lQ/Rw9/JU2hP7IsjrxTDPGY0Me02sFpLwb5x5yqSyTXTxomyCbsNZixiMbfr0Mx0pc/7sRHnhnkwZgugZ7Iu2AOgL/XvQpbix62Q6obj1FaErGQncKxos7aTTTZFZYAg+U69tKXJTKNbL3xIZP7jj0F6AUS7LMyossAPe3TsBgUOtkis1hWZZV35MkOP6TPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jH0oxUDO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jH0oxUDO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dL0pj3bk1z3bZf
	for <openbmc@lists.ozlabs.org>; Tue, 02 Dec 2025 10:43:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764632621;
	bh=yNitHKVvffQCdUL8QEIivRqGdBqTMR4kRK/fLjkDcjU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jH0oxUDOSDCjbZohNnu/fCVm8DLpLcFfyR/COU6EKP7L5a9TtgGja02oUqkVuBWcu
	 OHSv5lRjMJqdAj8A2Xey6QTr2b8F4oX/FH5J7qHXNmoApVLhce1ra118XxCvJ1OGEv
	 64zz4cbGwQUkbLzyPP9VolcDNUkP2rZSK4Clg9yWWOWGNPx4MlkIJdnxpOgb6Jt+L0
	 3iZhUXoOt29WK3LY/fShdP/vOYaVDWZfslDx/gN5XHTIkTOYyFi6vbpz0L8FvnUdFL
	 jrjrK3jPxclnRYjpHcreWnTjCAFZCaC3eXm/MO+r93lGzBCXlxruID1S+RUm6iI6nE
	 P2b+ImPgPm91g==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D680E6472E;
	Tue,  2 Dec 2025 07:43:40 +0800 (AWST)
Message-ID: <281f88870fa52a5ebeafe01f85c366b2513856c1.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Tue, 02 Dec 2025 10:13:40 +1030
In-Reply-To: <aS4l24MfyI7XOUbY@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
	 <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
	 <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
	 <aSZYRPXSGcHImegq@molberding.nvidia.com>
	 <4aca43d2539ce4452a3911f7fc1dbf5abcbe5de4.camel@codeconstruct.com.au>
	 <aS4l24MfyI7XOUbY@molberding.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-12-01 at 15:33 -0800, Marc Olberding wrote:
> On Tue, Dec 02, 2025 at 09:44:54AM +1030, Andrew Jeffery wrote:
> > On Tue, 2025-11-25 at 17:30 -0800, Marc Olberding wrote:
> > > On Wed, Nov 26, 2025 at 11:00:33AM +1030, Andrew Jeffery wrote:
> > > > On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > > are you okay with something like:
> > > ```
> > > &fmc {
> > > 	status =3D "okay";
> > > 	fmc-wdt2-disable;
> > > ....
> > > };
> > > ```
> > >=20
> > > as the target config? or potentially drop the extra fmc...
> >=20
> > It would be best to prefix it. What do you think of `aspeed,disable-
> > watchdog`?
>=20
> I'm fine with aspeed,disable-watchdog. My only concern is that watchdog
> is a little ambiguous for this, but maybe there is value in being
> able to reuse the bindings for other things. This is a special watchdog
> for the FMC, as opposed to the general purpose watchdogs present elsewher=
e.

Right, however the idea is we specify it with respect to the fmc
compatible strings, so that itself limits the scope of the property (in
that it's only applicable on the FMC DT node and not any other node
such as the generic watchdog nodes).

>=20
> maybe `aspeed,disable-fmc-watchdog` ?
>=20
> That said, I'm not ready to fight to the grave, whatever you think is rea=
sonable
> is fine with me. I'm more interested in having this work and being reusab=
le
> for people.
>=20
> > >=20
> > > It's functionally the same, and to be honest this code is proliferate=
d across
> > > at least 3 board files. I can certainly make a helper function,
> > > but I don't have access to test all of the boards. If you're happy wi=
th
> > > it being "correct by inspection that it does the same thing" and "it =
builds",
> > > I can move these board files over to using the common helper.
> >=20
> > Let's get the code centralised, make the MSX4 using that centralised
> > code, and then follow with patches converting the other platforms. Make
> > sure to CC maintainers of the other affected platforms where you can,
> > and if things are okay by inspection and no-one screams, I'll apply
> > them all. Otherwise we can just apply the first couple and quibble over
> > what we do about the other platforms in slow-time.
> >=20
> > Andrew
>=20
> ACK. with the change for the FMC WDT2 to be handled by the driver,
> we can actually just reuse the 2600evb board file (which is the default
> for openbmc builds as far as I can tell). I can move the evb code over
> to using this, test that on the MSX4 and then we can slow roll the rest.
>=20

Sounds great.

Thanks,

Andrew

