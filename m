Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C9258E45
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 14:36:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgmlG16PQzDqXd
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 22:36:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=I7Gth4NR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=D1f/s3NU; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgmk62kV4zDqXB
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 22:35:10 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BBCE25C00E8;
 Tue,  1 Sep 2020 08:35:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 08:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=iMaHZcaVvpIq4p8uP8CnhXeN0FM
 CXd9JR35cwhuLmq0=; b=I7Gth4NR/ARip6afJRDJE4vC65SlZjkp+auGPRNICEd
 tepC88Mh8CLbz68otUfst7gY3E4xtkB3+eBRYsN1h1jqHz9/m1dCNDBWGOVx8dPv
 TphmlZeFdoUa8Rk4fxAJ58q3jfIPFnf50V/HhLV/4bcXQ6T2CWAXtUdErxq2j85L
 pELOZgQfOEuytgAfuRJ/uAtf3/ocBo6iA7siBA47fwkoYE8Qg2udp+izjL6sLYl9
 BPquoazGHhzyoh/6a9GOKymzPIeQ8sc0rIHtVYk7JdMhzWSEbkgy3RZtxF66gW+P
 uUh5wrOIsUt7dYmFi31H6uhGkHNBPW8q8CKxam7L6ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iMaHZc
 aVvpIq4p8uP8CnhXeN0FMCXd9JR35cwhuLmq0=; b=D1f/s3NUx2Z4r2ErXJADAy
 FAamHTs+zBjl9dhtGnSnvnO1FUivrspjWHUK7AwxSw5y2nTgqEJCtZDKvTRKz061
 5QL/ro04MqLliP7d5NJ3mzJwfueNmM71wNovLMbgBN5WL4UcOdwIfO3XY2kkWAh0
 WSeJ8VvGtsLWOWa1vXg7tx/jSygjELfrmmgH0yHFx94sz/sOJzOsREmSIUML312L
 +y3MoR23yGUp2utC1e27lCARPFsxIkaxjHNqeukgR3GEc+9heUPX/+gX0SxAXnq1
 Bv2BrQV7jE52quUPRdZSbcj3/Ap74R/8u8TX3UO7PQHwMD4+ZiBZj2bOm/05SVRw
 ==
X-ME-Sender: <xms:-z9OXwwyxwyA-vpK-wkreONWs2iaVH7k_OCgHY3ZbyVq7_3jK2QYLw>
 <xme:-z9OX0QzzTrppuqvqReuwi7rvcOIJKwuK4LahbqbWFoPE0zBGXJgMxTomCtOkqRqh
 t1RdWlmfTRa-kVmREE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkeduuedtfeeihfehfeehfedvjeeujeeikedtteehledvhfelheekgedvieevkefhnecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-z9OXyVEfpcX5BzblQSetMgOgGmgwQHvDpPath7du68QcR3Duk_QSw>
 <xmx:-z9OX-it-x75gxm4jpF4K-ZoyeYdB4DvjYL4MWVGeKQQ1KDbBuvS0A>
 <xmx:-z9OXyBAiw24VVqfiLYc35oQAU9SUxMTWefxMBcGyQmdmJLPMql78w>
 <xmx:-z9OX58K4xtsVZ-ZsrfrtfgOINknVRJWok70XfhlRJr78N191j1xDg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E7C7328005E;
 Tue,  1 Sep 2020 08:35:07 -0400 (EDT)
Date: Tue, 1 Sep 2020 07:35:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kun Zhao <zkxz@hotmail.com>
Subject: Re: SQUASHFS errors and OpenBMC hang
Message-ID: <20200901123506.GR3532@heinlein>
References: <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0Qexx6XJGNEACt6j"
Content-Disposition: inline
In-Reply-To: <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0Qexx6XJGNEACt6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2020 at 12:40:31AM +0000, Kun Zhao wrote:
> Hi Team,
>=20
> I=E2=80=99m working on validating OpenBMC on our POC system for a while, =
but starting from 2 weeks ago, the BMC filesystem sometimes report failures=
, and after that sometimes the BMC will hang after running for a while. It =
started to happen on one system and then on another. Tried to use programme=
r to re-flash, still see this issue. Tried to flash back to the very first =
known good OpenBMC image we built, still see the same symptoms. It seems li=
ke a SPI ROM failure. But when flash back the POC system original 3rd-party=
 BMC, no such issue at all. Not sure if anyone ever met similar issues befo=
re?

Yeah, this does look like a bad SPI NOR.  Have you tried flashing on a
fresh image to the NOR and then reading it back to confirm all the bits
keep their values?  It is possible that the corruption is hitting the
other BMC code in a less-important location.

> [ 3.372932] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC fa=
iled at 0x3e0aa4. {1985,e002,0000004a,78280c2e}

I'm surprised to see anyone using jffs2.  Don't we generally use ubifs
in OpenBMC?  Is there a reason you've chosen to use jffs2?

I don't necessarily think jffs2 will be better or worse in this
particular scenario but we've seen lots of upgrade issues over the years
with jffs2.

> BMC debug console shows the same SQUASHFS error as above, by checking fil=
esystem usage we could see rwfs usage keep increasing like this,
>=20
> root@dgx:~# df
> Filesystem 1K-blocks Used Available Use% Mounted on
> dev 212904 0 212904 0% /dev
> tmpfs 246728 20172 226556 8% /run
> /dev/mtdblock4 22656 22656 0 100% /run/initramfs/ro
> /dev/mtdblock5 4096 880 3216 21% /run/initramfs/rw
> cow 4096 880 3216 21% /
> tmpfs 246728 8 246720 0% /dev/shm
> tmpfs 246728 0 246728 0% /sys/fs/cgroup
> tmpfs 246728 0 246728 0% /tmp
> tmpfs 246728 8 246720 0% /var/volatile
>=20
> and can see more and more ipmid coredump files,

This implies to me that we need to adjust the systemd recovery for
ipmid.  We shouldn't just keep re-launching the same process over and
over after a coredump.  Systemd has some thresholding capability.

> I found the following actions could trigger this failure,
>=20
>=20
>   1.  do SSH login to BMC debug console remotely, it will show this error=
 when triggered,
> $ ssh root@<bmc ip>
> ssh_exchange_identification: read: Connection reset by peer
>=20
>=20
>   1.  set BMC MAC address by fw_setenv in BMC debug console, reboot BMC, =
and do 'ip -a'.

I have no idea why this procedure would solve SPI NOR issues.  It
doesn't seem connected on the surface.

> The code is based on upstream commit 5ddb5fa99ec259 on master branch.
> The flash layout definition is the default openbmc-flash-layout.dtsi.
> The SPI ROM is Macronix MX25L25635F
>=20
> Some questions,
>=20
>   1.  Any SPI lock feature enabled in OpenBMC?
>   2.  If yes, do I have to unlock u-boot-env partition before fw_setenv?

There is not, to my knowledge, a software SPI lock.  Some machines have
a 'golden' NOR which they enable by, in hardware, setting the
write-protect input pin on the SPI NOR (with a strapping resistor).
Does your machine do this mechanism?  If so, it is possible that you're
booting onto the 'wrong' NOR flash in some conditions and a reboot
resets the chip-select logic in the SPI controller.  (Usually, you have
the watchdog configured to automatically swap the chip-select after some
number of boot failures.)

--=20
Patrick Williams

--0Qexx6XJGNEACt6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OP/gACgkQqwNHzC0A
wRmX2w/8Cl5LOLn3jgN3mNjsTRhJafMnIwVb6DCwlkDh0iWjxj7pQBAhqu50iWbB
fem3xFeVqnJH7gnaRPDUlUYwyAQeg2IG8H3YILVHvNjahS0QR2HMGJLbif/CBMJL
ftjTyBOEuwfDxYM2S/Ju1mqpPNg5k/+5hdrq+hRKvkdSKaSVkl0NWj/gcYo6KcZ7
zG3fGu4bogv2okdcNGWWAWfLmE95ipbghzpxCSDrY28zL+7XSL5zw7pZkKQ/Ko9G
4dyZqJ4wICcOXZKC4CyaoudGUwd0srLkkF4xoyKkLVvImRTWuPAQmw2XKDzNvYGd
emHgRlJyyXNtGWjRUhU36bGLC0TLCHq6ocdCTO+JHaVfZVZMZjeOkybdmZO0y+qQ
w0QIgPfeQAnaYrI5tqW+MFPQFqt0I9fpkvIOTU5Z066dgOalbJrsVlVIznqR60bm
ipaxitiLQt5KKXwH5ipHLz/l5Q+4ygNcmiWnihzsnChOKVFLtBVZsFcM5ZtaJtZ5
No9xtjnVKRwlCmZ3uoB1diyDcowEn7oGCR+Hiqh+16L5W2AuqVFaaQL8l3vhDPlg
H+mi7dfW1Gr/1osNXbyKmx+SdoXnkDBQpGb1mxKg0duCVvmpxbG6JIaRkrW/noRA
02iJEdEnaAJSSkB5u+yXVzlYcw62TQytlRgrhHUd5cf7gPIB0i8=
=NoBg
-----END PGP SIGNATURE-----

--0Qexx6XJGNEACt6j--
