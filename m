Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B210A7B332
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 02:13:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTJw417Gxz3cK4
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 11:12:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743725569;
	cv=none; b=VmP6/DY0JZp4cCv/v3aLuoOzknq8hkPeYAuy0PK8p+99zwZfv9Wxrv/7akPwkUVt+TNYcJRK9Y4E4Weyra7Pc3nIF2djlEKIKTbUywHVDanSnKhOkeGAQ8v6zl3bF6lXNDh5QG4vMsvbDtsgVb1Kk+G/hYVdxt09hn6XsJRbXR4pp+VKcX9Q4Y8OFtNasGb/Q5cvgsKf2qTN/nbSyW6OT4n6tVxQBTDUpmEUAw63TsSMfdECzmQ/2FTJmDUFBcHhI13iQX3uBmtHrUw3qaCehqp6Fg1mMYw8fXZKbuM4q6yUg9KW2HQHbdmUmg4TtXd1/EYYyKrVb9zSYtdEHBZI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743725569; c=relaxed/relaxed;
	bh=u1HWX8RomDa0X9oBuj4KrsoR5QYy+KHZw2LFAApSkV4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQiqQEH7GHiS4Zx9Y8AYvSioBq9cifviNUXU+qELhZhIOfSHeNAvnWKeECy1pE96Edu6RguNNLiwxrkU37FQZdDHUpLdOE5wHYWtdKWLw/7GHFP38fVcnHFVmZu+DODespz/ulLSDDJvQrLvuAgG8DUwZqlWyB6Yf664CkF889PVAnB0Qt3Ym5c08/fEb+/cpau/OMmHdmkVCEYdhhE9E7WOO7m3GCn6kkOxo+0ONRyimwfUWiw9ero3eW6piu25zXPOmIzPJGFx2ou/Jfa7xcMKCqqerGcuSroagoh1Ym9Eh8vOH+EEmQ7i0yObYDgBpdlNqIn+CUEB622rqvcQew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eDT9ugpq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eDT9ugpq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTJw04PqKz30MM
	for <openbmc@lists.ozlabs.org>; Fri,  4 Apr 2025 11:12:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743725563;
	bh=u1HWX8RomDa0X9oBuj4KrsoR5QYy+KHZw2LFAApSkV4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eDT9ugpqsOlzM2+QX8EIb9cC9pzwOyoZyl2iBy6AvsoNRVV+IfS+yLhyGWXFfDtqR
	 hshnLV8lzmne1fdXRkxg08oBUbuMWYNsld0Wfv812P0idjBo5uhfQrGrOhdtbY+GlY
	 8EHWN6TwZHkZvNgNEowBApCTGfSw3RrxsGPCohTG1GGu3zraq6JTMfv7r7/c9SCKtQ
	 PIdsy3OJe/a1FucgJbck5tee70735uOJofsTwfoE6JvmcZwjBKLrN5ikb8NkrLqYmh
	 KFd98Jvt6cDGflGelEmHa0LfScAQNCGGqcx3Pb7TQ7xx8Z1ods6ZfwOoB7D0AYcMFl
	 S6Podtji8XHDw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B0667C5F1;
	Fri,  4 Apr 2025 08:12:41 +0800 (AWST)
Message-ID: <9ee22a941307a51c56721566227a7486bfc32555.camel@codeconstruct.com.au>
Subject: Re: What's the state of u-boot v2023.10 for ASPEED SoCs?
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan.siewert@hetzner.com>, openbmc@lists.ozlabs.org
Date: Fri, 04 Apr 2025 10:42:40 +1030
In-Reply-To: <2e72bbbe-ada3-446e-af85-811c7ae91998@hetzner.com>
References: <2e72bbbe-ada3-446e-af85-811c7ae91998@hetzner.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2025-03-31 at 21:48 +0200, Tan Siewert wrote:
> We've been working on bringing some of our systems to OpenBMC, but the=
=20
> MAC address is stored in an EEPROM rather than being branded somewhere el=
se.
> In Linux, we're using `nvmem-cells` to reference the EEPROM and the=20
> offset for the `mac-address` cell via the device tree.
> Unfortunately, the nvmem API in U-Boot was introduced in v2022.10, and=
=20
> we are still on v2019.04.
>=20
> The commit chain required to backport this feature appears to be quite=
=20
> big, and to be honest, I'm not sure if it makes sense to backport such=
=20
> non-trivial changes that don=E2=80=99t fix existing issues but rather int=
roduce=20
> new functionality.
>=20
> So my question is: what=E2=80=99s the current state of the v2023.10 branc=
h? Is=20
> it still a work in progress, or is it in a state where it could be=20
> tested on non-AST2700 SoCs and possibly submitted to openbmc/u-boot?

I think the main thing I'll say here is that any help with u-boot
maintenance is appreciated :)

I see you've had some discussion with Milton on discord as well[1].

[1]: https://discord.com/channels/775381525260664832/775694683589574659/135=
7374850318209034

Andrew
