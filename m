Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAC2A6546
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 14:33:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR6zM07lfzDqb1
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 00:33:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=u1zFk9EG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qmr3AkPK; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR6xP5RsfzDqRC
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 00:31:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0ECC75C00A0;
 Wed,  4 Nov 2020 08:31:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 04 Nov 2020 08:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nksqzGELv3yBzbMFEoZc/KMQ/HS
 wqfcfpWRXdVipb3c=; b=u1zFk9EGJDyQ0DDsbtd+G/YjTaNmbLeWtQPMj0KXPXz
 /K49TsBUJxzvOmyJeBDxUSzziZmCSIH7ssP48HinT+T5qyqzJI2NI9YkR3sHmYjo
 yywODL5LbpAGd1Rjf2AvxC+uXqD7wZy2ULrw5QIgZfrnl6HQ2pPMauLHVEe81T9Q
 C9G9Uy9+HPxHcOBpGsvFmFSuDW+BRH+u7fexEkntON5q8QymqrM1K9eayY+D3LEd
 x5z+1fICiStvl/RY7McNAdZ4ZzXcgym1n6e1WXfk/5rkR0A6OI1yJ40yFUYsglRc
 1E7geg8uVvOcSXqoHx07k6tPInltHCxvJrxzAdm3Btw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nksqzG
 ELv3yBzbMFEoZc/KMQ/HSwqfcfpWRXdVipb3c=; b=qmr3AkPKIdEUQA8b4uauTa
 BJU5gnJnxQJuegaJ58JwxnCe6ciaE6SCpDQqDYK3Xa16jeaLwXL6rt7iXPxhm/bw
 8U4IsQSPH2CbUlBi7Z67GqjCdEc3KNpMWz+/U28xQPvBp0alQ0VBlX90cFn3BoOr
 KU7HBAyrhU+V5pBSArdU4NE+hgZwd3Bop27zZ7kJFs6F9GS9iespzj0647ojNtRa
 qH8IvDuOGXK3fUkOhKdDocfLt0mVgpKOe+AV9P/99hfS9NrpraLMAcuh+lUheV8g
 IVpUGOK7DxJ9pFvVM0pkKhtRnwU1jNtGF71qNnZYvddKMOHxy+L2USEF/RdPppHQ
 ==
X-ME-Sender: <xms:I62iX4me3khmwCg4JQL607ep3lP5ayN7vpBIvJI7BAslzzjhs7f0QA>
 <xme:I62iX32yekWaXjhWrNK-BgSu3SnEnEC_d65f41C84HU1PEim0cmRWTG_YO1ipX9rF
 FjN-o61zQ0xkUF3B_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddthedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppedutdejrddutdejrddukeegrddvheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:I62iX2qlNros-OK_x_P4dDgPq2RBFD5tTQNjs0SKgNexMlZ_gCIWCg>
 <xmx:I62iX0kWfRCD1AVW6ljlITI5vyMsowpf07OSjKpRxqiIj4o-I7b7Fw>
 <xmx:I62iX23X13zLbUxK02epkIhR433zE58mCqh9e2XSF0fnF1SE-apiFQ>
 <xmx:JK2iX_jXgQizHUNQh9C0iBVW48wiq17kHlIMWjuFjMpOxGef1JxNzg>
Received: from localhost (mobile-107-107-184-25.mycingular.net
 [107.107.184.25])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36BF0306467D;
 Wed,  4 Nov 2020 08:31:15 -0500 (EST)
Date: Wed, 4 Nov 2020 07:31:13 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lee Fisher <lee@preossec.com>
Subject: Re: Secure boot/signed images and GPL code
Message-ID: <20201104133113.GC38269@patrickw3-mbp.lan.stwcx.xyz>
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
 <c3da59d4-b312-2372-0bfd-77014fb1fba6@preossec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <c3da59d4-b312-2372-0bfd-77014fb1fba6@preossec.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 01:21:53PM -0800, Lee Fisher wrote:
> In this thread I don't see any reference to OpenBMC use of the existing
> Shim[1] -- the current Linux UEFI Secure Boot solution to address these
> legal issues. It seems that if the Shim can't work for OpenBMC case,
> then OpenBMC could create a similar Shim-like widget. FYI, there's a
> Shim mailing list.

The class of chips typically used for OpenBMC don't currently support
UEFI but instead use u-boot as the early initialization + boot loader.
u-boot has a concept of "Secondary Program Loader" (SPL) which can allow
a key indirection in a similar way to the UEFI shim.

--=20
Patrick Williams

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+irR8ACgkQqwNHzC0A
wRkxJw//dWz6ujQ4/AhsWS5kBaNJ52usYpx7BSeJdyqXFnj4j7GUQbIDkpXvM6MU
d4Q0nVF23MsyoZaqEjL0TZDku5bzcNzms27y+6I1310SfhWAtGeJDAaCLRuZXrIy
/LHworwE+Ldr8MrrszhMn7KJhOLrOlKSg6trP1NvwRXTL1mTpV16eroV1Lddokhp
Gjn7o0LhSV5PbAFU9y2OKqBp1J3SuTP7sValE6y4kiF8E0qLarAvykYJ2FVlnBAO
DoOQH43RxqtQx9XqhCE2E+Eapj4l5f8tTra2Xw2QwwVx7OZC+bIVqaEz91gKxkTL
f1KfavMKfpwT0EMWcwYuhG46SaIPOPOzHyMmGyHKnKAd11GoW93F5WX1IPtxjHNW
g9hMhVIs0m6wjlMSwg2HVys6/egIo6bcD2ZQtkvjBjM5CLNANlfkr9NcOws6MGp/
8X7SSuxdQEV/jRYV9LGhQe60+C2GlWi6eDEWkm/ajKkdgohg4YKM0JIU5gzOJVUf
LAO2eXgDVFDRcblyMpFZdLN1JWP3BHfy6DTI/yIxVQdUG+/SMnu6vKG2n/YOAexO
lxDlQg9aPmAP68N7Ti1NrzmnfjrYy29YlyWOfLYFfqWxxWuRWxGhyVQy1umXcSMn
1PpVFmiftxDZYt0quOt5Xsk7ZBXhJRz5NkAK6RvKJOFyXEUWZPk=
=zWmA
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
