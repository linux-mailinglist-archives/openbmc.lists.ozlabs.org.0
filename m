Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DF1CF443
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 14:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Lxk56hJHzDqgP
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 22:21:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qkk4Q29n; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EF+1Zilt; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Lxhj6yPCzDqgB
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 22:20:20 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3E12F814;
 Tue, 12 May 2020 08:20:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 12 May 2020 08:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ECb9kePKrmFrJVxpxm2ZEj5rO7/
 JJfFQz0nGQ8l6aHc=; b=qkk4Q29njh7vJab9muzpaPgP4dSgXWgciQkGscQmWjS
 jB15gHWkVbZpNqtVWS4E8kcuq1+Zp84vzVaE6H5jQmgniYgRwPt2PknVQpVVS9EX
 1AAYY3A35twO+tGYLWxAuKI603tVBrQ//tDKXnsOHRe3bkoUFaFWpnZJVMzZ4m7C
 04MMiSEgPeSpvADW8/JdAp50hadhF8SpZmIsXo7g8/xsNxx9fJ7GQ/+Yz1qnPN6C
 k6ydYW/NudRoIVVzEpmQzlJ2VlmKYm3fhrQibK6W4w2MRp8UedkoHjhsQodWZNoc
 jxwA6Mhs3t2V8QYW7uJjFaGuyvevugDVeW25sjRraGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ECb9ke
 PKrmFrJVxpxm2ZEj5rO7/JJfFQz0nGQ8l6aHc=; b=EF+1ZiltBnjwLab6LHOIfW
 TUdA6pZ/6KQGuGeukLWUd0s8BrA0zK/WthZFbGXgRMqdUGBhbEdZlStJ6XwhCkTx
 NjBpCXmHIooOw9Ky+OTcg+HBS5Wrgd7q7EhCRf+U+awJjrgVhrYvASxpwyeqyhVu
 BbTWs6SozWwqTvgxa9YtSgHfQPqyaAjvKotVvJrHID7vyzdYlqibSVHjCeQODcmY
 /R91wRkGfh74T94/Q3Yn7edN1wqNWffwlEGrIS7seKKYb4/caVXDiUXHPze7GhCx
 RPh0lS08EPwwKr68Hj3PG8pGyngKL0ykUtlM3lozS4a2N35ATJRbCIh3UUSFBm9Q
 ==
X-ME-Sender: <xms:f5S6XkoE925I6HAZ9MJA86P7Mb0XJOUzh1UZwDpkYvNbPL0w5SdZ_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 etvdejiedvteegudejudelgeeiffdvhefgveeiieekjefhfeelgeevhfehteffjeenucff
 ohhmrghinhepsghithhtfigrrhgvrdgtohhmnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:f5S6XqprNZV91rKA3RP2NGUA_IaKA5cN6cuVnlhC12K6drUmEuolUw>
 <xmx:f5S6XpPrkSpmwbL2sfu52YibFU399U76ahcVOTLGeiGoexEGGCywdg>
 <xmx:f5S6Xr7LLiTkvoa8lXCEgwUO2S32p9yUZnk7x8C3XDuJzyfSA_ti9A>
 <xmx:f5S6XtRQYErligYri4z_lCXYqdQ0qZkaP_NP6o43azOamxbs2tTe9A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C0251328005D;
 Tue, 12 May 2020 08:20:14 -0400 (EDT)
Date: Tue, 12 May 2020 07:20:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ben_Pai@wistron.com
Subject: Re: phosphor-bittware repository
Message-ID: <20200512122012.GG10214@heinlein>
References: <822cfe8a5ec94973903534f7932d9049@wistron.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MrRUTeZlqqNo1jQ9"
Content-Disposition: inline
In-Reply-To: <822cfe8a5ec94973903534f7932d9049@wistron.com>
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
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
 Claire_Ku@wistron.com, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MrRUTeZlqqNo1jQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ben,

On Tue, May 12, 2020 at 09:09:50AM +0000, Ben_Pai@wistron.com wrote:

> I want to implement related functions for the bittware 250-SoC card.
> For example: Sensor reading, VPD information, led control and Brick
> Protection mechanism.

I looked briefly at the datasheet for this hardware [1].  It appears to
expose an SMBus interface for the features you mentioned.  The most
straight-forward way to get this implemented is to create a kernel
driver for most of the features you mentioned.  If you implement a
driver for this hardware that interacts with the hwmon, eeprom, and LED/GPIO
subsystems in the kernel(*), you'll be able to reuse a lot of existing
OpenBMC functionality without rewriting any userspace code.

- Sensor
    - Kernel: hwmon
    - Userspace: phosphor-hwmon or dbus-sensors
- VPD
    - Kernel: eeprom
    - Userspace: entity-manager (I think)
- LED control
    - Kernel: LED / GPIO
    - Userspace: phosphor-led-manager

The only part that wouldn't be covered would be the "Brick Protection".
We'd need to see some more information on how this is exposed but you
might be able to work it into the existing phosphor-bmc-code-mgmt
repository.  For power supplies, they did create a separate repository
(phosphor-psu-code-mgmt) but I think they relied on some kernel APIs for
doing part of the work.

(*) Depending on how the bittware hardware is implemented at an SMBus
    level you may end up with multiple smaller drivers (this is better).
    If there is a single SMBus address for all these functions, you'll
    likely end up with one big driver.

1. https://www.bittware.com/wp-content/uploads/datasheets/ds-250-soc.pdf

--=20
Patrick Williams

--MrRUTeZlqqNo1jQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl66lHoACgkQqwNHzC0A
wRmtww//TFqcksGaXoaWQLF2llU01LJ71jH9gjccFSBQfALWoEhXVKeJjiLB6NCx
/cq9WKwc/nkQA9oBc/cJb5+V0/USwREa4afTJ+LqhxVA2FNBtxeYCTGN0sFGKyPc
ZuOeX+JzjhuvGPZUdMr6dFkiQ3VhCI8ztptOAuQbA5nWBxoHU/P8E2vsbczPdUV+
sOqVlXWpY4fNlqrWIlD1Df9xCyLAJhKieGTAdI1xwFIt7YaHV2BI88qPsldA7ftQ
8g5Cvy9bZgDDeE8dXZ+tsvbI8SK/Pz2oyv/HI9EwgR3WuyyV67r0EdmsOa+82gcP
9r5EW8FmKqX2pkw7QqGDgC8Bb/lntx6fk4VJ0edlTRiVtAIMZlKiMVe+2h9z1lGF
oVuiOTiWeB6xPSSp7HEncsuateAMlOM9uq98v8peWt2XnbXzNgSC6q824CEkjld6
7EjQTduiAfPUupDByPutPgIJSGBlkA3IYDlkw7w4VQ3WNUncw99sDLGlIL3jhKo0
Q8m7G9qeUEr8wc7cmRDuHnOU4b3pL+0/Kf0x1DI6Kiuch827SH7H33duH6fAklyG
w/6cnacvLmCfm5QmAzpLDvQvY1875fcneFm+IcBKdNBql8DxJeu+NadESpJtefmd
G6CDWAg07nsJhjZWFzBebmTM9B5YTDsGp2Q6K+XT1hyIATjzhuI=
=v/Q1
-----END PGP SIGNATURE-----

--MrRUTeZlqqNo1jQ9--
