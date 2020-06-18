Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB051FF016
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 12:59:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nf8n30svzDrFP
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 20:59:53 +1000 (AEST)
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
 header.s=fm2 header.b=rYlnZfJ+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UW83OKo1; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nf835WLQzDr70
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 20:59:14 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 6EBA84C6
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 06:59:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Jun 2020 06:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=NUIM8T3tacvaHFqZpF7dKKvwcpRlU6vSFkDcbHVAzvM=; b=rYlnZfJ+
 rB3M9lF4sibkrCFzz2X31PHHYAjNyAhc9QPUHNtHbU2VQIg1M5CSVTZeyGyerh1a
 MRFQi5NvSkzGR3snmkkLlNyJeZdXPXiJH+Xu1dBJzt0sRrH6APOdRww6h5yKyv/R
 BDdpD5QG3GB6i4fDUPmuvutmCuDpi9TYMrCCmHHPV9nqq+E7wAxhWtj1ZPT5h4F1
 6dZ6lH9HjumEkNBVHzPbmViEbiW4NKCvmndEuMJsll6nfT+XJ5/fp6SE16uZUJcU
 JWI6OCqWWM0F8fvkKUx9PZ7cQToUxKLZ+Zj6I9BMdZSJwiXlV0yfouE0HZvG21Y8
 WNfK78cVFq5Q0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=NUIM8T3tacvaHFqZpF7dKKvwcpRlU
 6vSFkDcbHVAzvM=; b=UW83OKo1is5W234cSmdBGXTXVmuJIfU+jo14BkNUsvK0J
 Z+CzLu/IEh8htxwcMOdT1A3v6h/YG8Tq+QWyhGHh/TemlhkiazP57Ry9OE8tiFGk
 028ciBsmlH4H8+nYifP4kT2G7gc3KYul0X+iFtpVqye677qQZBLrqewM3cZ313vy
 +rI3RQPf/S6AHyK3zugx6mycM/0L1AZro/UyagwYm5HK/RSTuT2+USZsJ03zTu/p
 ySYdjf9ckjkY4UBG5rqQAFlYJWp5Ff+i+OtUkZlQWoK4eLb4RELqQsFJAijRX/Hj
 f73k1JNAxSTgi+F32XbB64H+Q5Es+b8F1tG8pf+ug==
X-ME-Sender: <xms:_EjrXsZ3PtkzsdGmglkdUfl9kuL2FeMYgh6r1VWJ69BPuYuJCIBLLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudev
 jeffffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:_EjrXnb_sgXHf0mEpOknPkxJIL1kO19QbSGhGHRBIfrEw9hMPYJm7Q>
 <xmx:_EjrXm8h4woYq4tEdj9htpu849ROeXlhiWHnLNweKPrE3WTlAQOwVg>
 <xmx:_EjrXmpi9gtUZI9SZ_e932arlubrrKhtrl3ThM61o0jZcFaaFjL3iQ>
 <xmx:_UjrXs6JRnVwmPmgHz1oV4AHj0wSgZTk-6gqhH7vygDmIcMUuuWOTw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45B133061CCB
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 06:59:08 -0400 (EDT)
Date: Thu, 18 Jun 2020 05:59:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: sdbusplus: 'set' support
Message-ID: <20200618105907.GA856012@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
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


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just merged a commit which adds 'set' as an acceptable type for the
dbus interface YAML.  This will correspond to 'std::set'[1] but will be
sent along dbus as a dbus-array[2].  Thus, filtering of uniqueness will
only happen as a result of the underlying C++ type being a set.

I suspect there are items in our phosphor-dbus-interface that are
currently represented using an 'array' that would more appropriate
communicate intent as a 'set'.  I've attempted to search for them below.
It would be helpful if domain experts could review the list and
determine if any of them should be changed toward 'set'.

```
$ git grep "type: array" | grep -v "\[byte" | grep -v "\[u*int"
com/ibm/VPD/Manager.interface.yaml:          type: array[path]
com/ibm/VPD/Manager.interface.yaml:          type: array[path]
xyz/openbmc_project/Association.interface.yaml:      type: array[path]
xyz/openbmc_project/Certs/CSR/Create.interface.yaml:          type: array[s=
tring]
xyz/openbmc_project/Certs/CSR/Create.interface.yaml:          type: array[s=
tring]
xyz/openbmc_project/Certs/Certificate.interface.yaml:      type: array[stri=
ng]
xyz/openbmc_project/Control/FanRedundancy.interface.yaml:      type: array[=
path]
xyz/openbmc_project/Control/ThermalMode.interface.yaml:      type: array[st=
ring]
xyz/openbmc_project/Inventory/Decorator/Compatible.interface.yaml:      typ=
e: array[string]
xyz/openbmc_project/Inventory/Item/Dimm.interface.yaml:      type: array[st=
ring]
xyz/openbmc_project/Inventory/Item/Dimm.interface.yaml:      type: array[st=
ring]
xyz/openbmc_project/Inventory/Item/Dimm/SecurityCapabilities.interface.yaml=
:      type: array[string]
xyz/openbmc_project/Logging/Create.interface.yaml:          type: array[str=
uct[enum[self.FFDCFormat], byte, byte, unixfd]]
xyz/openbmc_project/Logging/Entry.interface.yaml:      type: array[string]
xyz/openbmc_project/Logging/Event.interface.yaml:      type: array[string]
xyz/openbmc_project/Network/EthernetInterface.interface.yaml:      type: ar=
ray[string]
xyz/openbmc_project/Network/EthernetInterface.interface.yaml:      type: ar=
ray[string]
xyz/openbmc_project/Network/EthernetInterface.interface.yaml:      type: ar=
ray[string]
xyz/openbmc_project/Network/EthernetInterface.interface.yaml:      type: ar=
ray[string]
xyz/openbmc_project/Network/Experimental/Bond.interface.yaml:      type: ar=
ray[string]
xyz/openbmc_project/ObjectMapper.interface.yaml:          type: array[strin=
g]
xyz/openbmc_project/ObjectMapper.interface.yaml:          type: array[strin=
g]
xyz/openbmc_project/ObjectMapper.interface.yaml:          type: array[strin=
g]
xyz/openbmc_project/ObjectMapper.interface.yaml:          type: array[path]
xyz/openbmc_project/User/Attributes.interface.yaml:      type: array[string]
xyz/openbmc_project/User/Manager.interface.yaml:          type: array[strin=
g]
xyz/openbmc_project/User/Manager.interface.yaml:      type: array[string]
xyz/openbmc_project/User/Manager.interface.yaml:      type: array[string]
```

1. If you are curious why this does not correspond to
   'std::unordered_set', see the commit message at=20
   https://github.com/openbmc/sdbusplus/commit/b98bdc6fafa9d60596cd06ff708e=
f3baeeb3c959

2. There was existing code in sdbusplus that turned 'std::set' into a
   dbus-array, so if you are making direct 'sdbusplus::message' calls
   you could have already done this.  What I've done here is add support
   to the sdbus++ binding generator.

--=20
Patrick Williams

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7rSPkACgkQqwNHzC0A
wRlCkxAAoSRngZHQuFOfsOXsaOfUnTe/A1ZI4WuulaHhSd4n6j25vr/yZhYzGD/p
AmF/uWY+W5znDCaULCeDSmbXHqtJD3QbWa/t4AOIE1xmXP6ZaWQ2BKZ4tO0F7Vbh
Ik0I1W5abe40Y1T5m1bAoxpx/9AebKjoBbMPI621CDMd7c71cf6pUs2Tph1C0E6q
b1F7/AgFNy/RuxHx4aX1PFf3b6jtYnwOXp52Qi9R4Wtae7+KxYqk15jUywLfxzeE
k5waTBbZ8a7QLsnrKFNyiXUsNh6BBDg+WXubqB/zO5dsPfIu2JOZVIj3i88X9Nd5
TXrMbEMMBWBvvfteorDJ+zKF/WzvztPVGKviQRNPPbjOygOc2ynUaclk1TNyLvht
WMdJwMb0UTt381skmVhp4FlTQ7CjFro9vU2IJpmoHVJHHYflVIv6btFYIX+7ELvy
evZCBScKQpA4B4BALF2RsAIdv7pdsXbVsB0VSXRZZWNXyaIk+vsR8wc0j/+0xNUM
d26Lo5B5vyp9ENYg1nD/5qetuZiMJ5vqTO2ZY6G54cKxuJNbOy9wwqaFfmMjAI4P
hOWG5olULWxKi51ARKJtubijAS/JKNNcs2QgRsT34oUguF+n6Io7u/iW+zCxLZbm
DShnw4vjYZGxcOzxqyjpkNXWk1qFn3NEcYxruiBuKC6mGY9HwkA=
=xi1G
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
