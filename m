Return-Path: <openbmc+bounces-1154-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA8D106A1
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 04:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqHNt1gvjz2yrQ;
	Mon, 12 Jan 2026 14:07:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768187246;
	cv=none; b=O18JB2PN8gvqrslRh2GRPigdxkeu8dsGmrSVkz8Ke2I1nhmnlzEMVXUVVMQLGGeFcIxUwkukIiekFuqsXHHx+XtyYUSWHTSw6vz1pQni2RsCyqq0e2ac1YVuGmWuu5uzcFR+xCPdrjrRV4dANtEGjUYvNI+v6JpnhaMHSQj/pNmkaPwPeb2VPHA7uYN3xsj3gtPOrfXBxzo0TaP6KuETu6FOcdgk08Ze2dWKz7mBvWZfp0ohkhESYv7sWx7/TDiKMvCISNI9Yq4TsB+qBn1EQhpz9VAqEMRmBf5/98UJBNIFbLvw3kn1cPBGzy2fQCsGHdCisC8M+IGNfYwzwva2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768187246; c=relaxed/relaxed;
	bh=WGFZdnqXrlZ8kN7IH0yNabUiAZ5TsDY50h7eHkpgWOU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S7lImLIHgNvOD1LorCPhwpwQ8wePTc423vVnq8f64Arbx/0lYU6SORcI540RsAsp43kqHLP1MxqJKzkmi4Biynr4Tmr+s4QiNAkSU7YOyUEtwTPMw1UJtW157jNTuBoK7JEYZanEzltR3PLw145dSeDvoHgoAphvye8/5I0j5P2PYR2/zYP8JO+wL76q6rDRYOEc+BuR7WdM6Z3EDG+P7HZ1Mx6Ux3bA/pnnvm+vvVDbY1udCYaEcD8GgPOJY138H5ul0j5c5CVJlFDjRe3tOhf+xDm/d6gOVY+3iqXuf0AYH5Zl0TbEXKrKTbTwHba59BJB7FNJCKxHYxBEkLyiaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NX6CsWnW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NX6CsWnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqHNs4HJVz2ypm
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 14:07:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768187244;
	bh=WGFZdnqXrlZ8kN7IH0yNabUiAZ5TsDY50h7eHkpgWOU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NX6CsWnW8Lr3KhhPMNdjNjczbJocJFHQ3/R9w7yrCM1EATJbiW8+J4gYGDAYXBHc1
	 j6dfR9aYIi2HesejjUouo3jwbVWqx86Aewwj0LzrWr3+wPmtdhwq96L87X6X3yvB49
	 MCm30gmFe0lv7RRnzxcWsN+bKG7Cvj7uF4sBDb1QciSxsZ/DTqeVVuQOJruAuZwVK2
	 1df2e/p3iJHzx/LLIYsVfAvQf186JYHPY3EARAJTZU70Sh2cSaskZl5tdTUALr/Hot
	 oMwjMCYKKWS+nZmJR6kvhUuBklidKvBbhoeGm3oppkK2sNSrMfgp9+qZf5Y+L6+aWy
	 3t6s1UEzwqx+w==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 27E5C64706;
	Mon, 12 Jan 2026 11:07:24 +0800 (AWST)
Message-ID: <59cb2ab1fc914418a9bdbb8400ebcd7aa3d8550a.camel@codeconstruct.com.au>
Subject: Re: Support for Asus IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 12 Jan 2026 13:37:23 +1030
In-Reply-To: <CAJ13v3SHBYCGZSkYGM0sbotw8E9d-BhA8=11e=kn1m2bLkMwnw@mail.gmail.com>
References: 
	<CAJ13v3T_jymYQyvrf0AtB_H-zjc0aU5GduhsywWkpS8p1nFR6g@mail.gmail.com>
	 <c0bffe81fc734045909a98f8e820a62896ade172.camel@codeconstruct.com.au>
	 <CAJ13v3SHBYCGZSkYGM0sbotw8E9d-BhA8=11e=kn1m2bLkMwnw@mail.gmail.com>
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

On Sun, 2026-01-11 at 20:13 -0600, Anirudh Srinivasan wrote:
> Hi Andrew,
>=20
> Thanks for your response.
>=20
> On Sun, Jan 11, 2026 at 6:25=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > I'd be surprised. 100M mode might indicate an NC-SI configuration.
>=20
> Yeah not sure what's going on here. On the vendor fw, I see a usb0 nic
> on the host and the aspeed, but I don't see it on my openbmc (with
> this 100M phy disabled). Maybe something worth trying to enable.

Some platforms, such as GB200NVL, use the ECM USB gadget for ethernet
to the host. In that case a shell script[1] is paired with a systemd
network unit[2] for setting up the interface:

[1]: https://github.com/openbmc/openbmc/blob/ad8d54b743b6118f406010d72bf76d=
3fcb13d2e9/meta-nvidia/recipes-nvidia/usb-ethernet-init/files/usb-ethernet-=
init.sh
[2]: https://github.com/openbmc/openbmc/blob/ad8d54b743b6118f406010d72bf76d=
3fcb13d2e9/meta-nvidia/recipes-nvidia/usb-ethernet-init/files/01-bmc-usb0.n=
etwork

> >=20
> > Possibly this is a result of not enabling the devices discussed above
> > (along with the necessary PCIe bridge settings).
>=20
> I should clarify, these errors (on the host) are from the vendor fw,
> not from openbmc.

Ack.

>=20
> > > Some searching online [5] shows that this functionality might only
> > > work for certain Asus motherboards with a BIOS that specifically
> > > supports this functionality.=C2=A0 The vendor DT has a special
> > > bmc_dev@1e7e0000 of type "aspeed,ast2600-bmc-device". This doesn't
> > > seem to be supported upstream.
> > > =C2=A0I see it in Aspeed's kernel fork on
> > > github [6]. I am guessing this is what provides the pcie ipmi device.
> >=20
> > One of the important bits there is enabling
> > SCU_PCIE_CONF_BMC_DEV_EN_E2L, which exposes the LPC peripherals such as
> > KCS and UARTs over PCIe. I expect that will help with the ipmi_si
> > errors above.
> >=20
> > Note that these can also be enabled on the VGA device though there's
> > probably a question of whether the pieces are in place on the host-side
> > to support that.
>=20
> Since the ipmi device is failing to probe (on the host) even on the
> vendor fw, I don't have hopes of getting it working easily on openbmc.
> I will try your suggestions and report back if I have any luck.
>=20
> If this device just requires a custom bios on the host to expose some
> additional info over pcie (and doesn't require the BMC header
> connection), maybe passing the card through to a VM with a custom edk2
> build might make it work. But this seems like a bit of a long shot.

Yep, seems a bit much at this point.

Andrew

