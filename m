Return-Path: <openbmc+bounces-955-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009BC998E1
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 00:15:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dL09b5CDlz30Vm;
	Tue, 02 Dec 2025 10:14:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764630899;
	cv=none; b=jex4EzVG+dUyGRvKbFa3dxUjPx4Sws1P66qUjkv3K9vR0AMTJ8YYQtE7+8X9xQ6j7LbTviwJwy/e4TqrrNQzrlOw9hObDhOksXIKhRPbNzskCX5z2NQoFiLq48NqVVWf6QmwkK2KlvDecTmKNyX8wm6dxgBUxxYM+Q/Zxr802x+vQfHO+dTCdkb9XxpuS4paiBbicuh5uAiU7yLHM/PBZuTjj9S/oBSOUlyOpgYGk9uJ+QswEXiNp3+B8+skywcqb0ijZrezUSwvCadx4Xh19FllePoJNBLCFUawECYGC5P1lgJeEq+hZQsUIookPy2lF9JnFx+yw/XAYXyIdB3zbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764630899; c=relaxed/relaxed;
	bh=6LgLqj85NtIHYBOgGO4mLTSbTo3gxMthLUizfzRSKyg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W+vimoHB9xn+aT0gU2+PMys78f6zkOOPZeFieNnwbTd2d2kjBpf4B13PE6KCam0rzUp7/weO0kqKteGyTT+k7dwpyJx4unUbYKF79vFRZ1pjHLNs3ycTGKVNuHY1DIGw3+xbPdKOTq5vRLkDreEzJjupodHQbUnNZXr4l9pFPbrVir/kXFada54OdGYTbrTS127eg5Xf3zncHSwj78/cVLzw/4oi07E8uIl9Kinli3RoPE91v/zatXQfy+PBq6RYLj6bDUyistbf+qq3ApwQdWC0YyE5R+W7Ag9CMUuWzRDqK40G6AulZrCw0ocUUrxoQN2QipxwGo+RYeIRSxgfwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lipupXUo; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lipupXUo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dL09Z4sGpz30VR
	for <openbmc@lists.ozlabs.org>; Tue, 02 Dec 2025 10:14:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764630896;
	bh=6LgLqj85NtIHYBOgGO4mLTSbTo3gxMthLUizfzRSKyg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lipupXUoiLjnXgqlS8ftatg8eE2WDBXbj/b0m0XULvtwFfqHKDyGvyo+rwUapLDRf
	 IrlStPVMUTBTDMjMHgsx3j0KfsdJc/u0X9QY/p4N0Gc2aQ6LHjMXsY3DO6fG617tUz
	 dTyLal4+FBlAtcENrzqHVOefLLcwJFuFuXYQimfqqTJBociY+t8XPG6dV5XafveKVv
	 PiqCVG3OpFev9KpueCPWuihyht9hCBFgqDwkpq5AWyqLZD0Erp7naHebI4DgDyxBuj
	 cRHxCLQ3FSIvvHfLYQktzL84Lw8UGQ3lgh0jMtj2uAmO4ak8YKawmrIbSaon9W18eZ
	 o0VU3AvXbu78Q==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 861447AB4A;
	Tue,  2 Dec 2025 07:14:55 +0800 (AWST)
Message-ID: <4aca43d2539ce4452a3911f7fc1dbf5abcbe5de4.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Tue, 02 Dec 2025 09:44:54 +1030
In-Reply-To: <aSZYRPXSGcHImegq@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
	 <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
	 <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
	 <aSZYRPXSGcHImegq@molberding.nvidia.com>
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

On Tue, 2025-11-25 at 17:30 -0800, Marc Olberding wrote:
> On Wed, Nov 26, 2025 at 11:00:33AM +1030, Andrew Jeffery wrote:
> > On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > > +}
> >=20
> > Can we rather add support to the SPI driver, and disable it via a
> > devicetree property?
> >=20
> > That way the option is available to other platforms and minimises the
> > spread of board file code.
>=20
> I think that's reasonable, and I can put up a patchset for that.
>=20
> are you okay with something like:
> ```
> &fmc {
> 	status =3D "okay";
> 	fmc-wdt2-disable;
> ....
> };
> ```
>=20
> as the target config? or potentially drop the extra fmc...

It would be best to prefix it. What do you think of `aspeed,disable-
watchdog`?

>=20
> For what its worth, WDT2 is actually disabled in the platform.S for the 2=
600
> but its disabled by an #if 0 preproc directive. I think dealing with this=
 in the driver
> is a good idea and relatively low lift. In the response to the cover lett=
er I had asked
> for any ideas without reading this email :). I'll get this patch set up, =
thanks for the
> feedback.=20
> >=20
> > What is the behavioural difference to what's in
> > board/aspeed/ast2600_intel/intel.c? It's a little annoying to tell
> > because intel.c uses macro symbols for the register offsets where
> > you've open-coded the values here.
> >=20
> > Can we try to make the implementation common?
> >=20
> > Andrew
>=20
> It's functionally the same, and to be honest this code is proliferated ac=
ross
> at least 3 board files. I can certainly make a helper function,
> but I don't have access to test all of the boards. If you're happy with
> it being "correct by inspection that it does the same thing" and "it buil=
ds",
> I can move these board files over to using the common helper.

Let's get the code centralised, make the MSX4 using that centralised
code, and then follow with patches converting the other platforms. Make
sure to CC maintainers of the other affected platforms where you can,
and if things are okay by inspection and no-one screams, I'll apply
them all. Otherwise we can just apply the first couple and quibble over
what we do about the other platforms in slow-time.

Andrew

