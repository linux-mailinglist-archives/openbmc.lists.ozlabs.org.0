Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F2A25102
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 02:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmSq40Gsnz3bX9
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 12:00:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738544444;
	cv=none; b=c9Tm9+AqMzyWfLFYwz1X3s+Ie5VzfbcN9G2xTsjsafuVV9x/OqftvbdY3N65C/Ut9+ZfvGKTIVmXyuLPTzUZwBk1wfAlOjH2XKTeXmk3jSc8Q907of8FJKtOyT25jn6wKYhSvizYIDodBoMaileVXWp+5AWFDAXiUyLXt0ZPrrp1NefK/eqScKiuMORtkwTikrn9lpahydbBWsIONi90r+eaxgvY3pECGSNIzHcPSd3n+jTQcx8RkJhM+ODZUnsZ4WJEuCB8d2Dm0RGhHhxBH5tQOWwNaMBR2XDZdb68TnYyNHs0fVPCEUlmFCspwYUybLGptWhZP1Tu10fu+4ZdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738544444; c=relaxed/relaxed;
	bh=gk9D0Qt9+LDrqmxUNJL5d93/UiuKHoYj5BmltLDZnKY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WNKgchTfUdLukOz75xACtidWQfBi2pUHkSAmNEd3Af3rQehESrJL6tkok8/RaLuICSlwQJ3hPb9R0lp6ZPBSe5cewwGwTUE+21Cno1l2fWwuLL5xozhPGzBGWQK6SWswSLXYb3tR0GAur+dpYh1u30su+N2MYJYLDa2tkSuW8YdgXhGqnar4hYHQwi1NKhZSCakqX8aCRdyYuv+RhbFDJ1lSn2bQ1RncCoD4j7d7XBldeg1kTkuMC0CPJWPzfnEODXjDZ37KIel7OmlvvtsPe1ur2zZbBuDtrabbHMYiOfYeAJ4zQeCs28uQs4GvFbQEiI7zqqVRIIWT6uFRu4Ooyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NaEafcG3; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NaEafcG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmSpz1mNSz2xdY
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 12:00:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738544441;
	bh=gk9D0Qt9+LDrqmxUNJL5d93/UiuKHoYj5BmltLDZnKY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=NaEafcG375mc1MZLyME8UnMn5XZWzR28TdB3ZA9yHwNvJvMsMnhZjbyUZ1dMpdy9g
	 +UB/3ns3nf9UJY65fvwWU1VmziGtFL6HQqj6kK8LjhOWmuW87aYBEsW86E+O/1htrS
	 5EXL8vOGuoikmvM+Z33k0SPLuO6psEeG69vkrmpPxuYtHGUkYWrLf6B8KcNsGDIPnM
	 dfyJXt6dWMOBXbpNhBE3NHSd6oBSWahCh7SnGyJQZM0bggFwZ8K/V0yhZ7nqRZ+sTc
	 2DKF2KLR37Mo6ywGBN+zYvbolRDaDejOFf10wi8JBQwG/S+5f6EQ3tGXUrvb3f3Y/n
	 VW5FZkaerrvcw==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C6A7073686;
	Mon,  3 Feb 2025 09:00:40 +0800 (AWST)
Message-ID: <dbcfddc2361fb84d9b86f3c55e734b2202541ac4.camel@codeconstruct.com.au>
Subject: Re: Question regarding OpenBMC crashing and messages of U-Boot SPL
 Already initialized
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jeff Johnson <jeff.johnson@aeoncomputing.com>, openbmc@lists.ozlabs.org
Date: Mon, 03 Feb 2025 11:30:38 +1030
In-Reply-To: <CAFCYAsdBV+j-7quHMMrRSmghFJL_MfeuDO5ufLMbbcQgpO45AQ@mail.gmail.com>
References: 	<CAFCYAsdBV+j-7quHMMrRSmghFJL_MfeuDO5ufLMbbcQgpO45AQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, 2025-01-31 at 14:55 -0800, Jeff Johnson wrote:
> Greetings,
>=20
> I'm seeing random crashing of openbmc 2.16.0-dev on an ASpeed
> AST2600. I am
> trying to make sense of what I am seeing. Most of my experience is in
> the
> x86 arch world, not Arm.
>=20
> OpenBMC is running on ASpeed AST2600 devices, not QEMU. If I log
> console,
> when a device crashes I see the below in the console log. Why would
> the SPL
> be repeated trying to load when the system (BMC) is already up at
> init
> level 3?

It's likely that one of the hardware watchdogs is running and nothing
is feeding it, leading to a SoC reset.

>=20
> Thanks in advance for any feedback.
>=20
> --Jeff
>=20
> #--start console output--
> [=C2=A0 OK=C2=A0 ] Started Phosphor Inband IPMI.
> [=C2=A0 OK=C2=A0 ] Started Phosphor Time Manager daemon.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor IPMI K=
CS DBus Bridge...
> [=C2=A0 OK=C2=A0 ] Started Network IPMI daemon.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting VES Ethernet ov=
er USB gadget device...
> [=C2=A0 OK=C2=A0 ] Started Phosphor IPMI KCS DBus Bridge.
> [=C2=A0=C2=A0 32.252854] configfs-gadget.usbnet gadget.0: HOST MAC
> 4e:96:48:66:73:d7
> [=C2=A0=C2=A0 32.260416] configfs-gadget.usbnet gadget.0: MAC d6:a8:1f:95=
:d9:0a
>=20
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
> nodistro.0
> localhost ttyS4
>=20
> localhost login: root
> Password:
> root@localhost:~# BP0c00
>=20
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,
> U-Boot SPL 2019.04 (Oct 08 2021 - 00:31:50 +0000)
> already initialized,

It's unusual that there's not other output interleaved here, which
suggests u-boot is getting stuck somewhere it shouldn't?

Can you capture the entire console output from BMC reset to the
occurrence of this condition, and then send it in reply here?

Some other details would help:

 * What platform are you testing on?
 * What's the upstream commit of openbmc/openbmc that you're testing?

Andrew


