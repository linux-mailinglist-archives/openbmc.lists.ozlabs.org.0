Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9236FC50
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvmp4ndKz301x
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:26:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=3jp+PHSd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wfE1m3u2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=3jp+PHSd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wfE1m3u2; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvmY1950z2xfY
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:25:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFAA05C00F3;
 Fri, 30 Apr 2021 10:25:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Apr 2021 10:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=w265J6GrIJHgPiDqS3R30uJRR2K
 qcgExBXkVqZae5W4=; b=3jp+PHSdRziYrfq9usjqLOMGhsg1uT1o6oOk+VytpOK
 xqtYkBejNa5tTynhMstDyW1+dSYbUaRIrHJEZFQ+pbC+QBKrrEC+BmpyVOWjfg1M
 1BMMWoIYJuXb/eX0FBDcbZ/x/SY7Wbl81H8h6NEVrSC+GfVpV1MKiaVJSPgUor+d
 IBsgg4S+ZkMfuzTHB0ybc3K4U+CJ4vxIks0fxgYmc8T46w0nT4/F7s2uP2xl17Qe
 nmbcjjMnIcUpEKijsIAiLxfQfk09PvTGnH1nlr9/xtnh9PkPDsGnS8fCNpq/HDkR
 NZ1c6w0gTW32orNWBlyKk5YOxb20lO6PpiJEwEYVjrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=w265J6
 GrIJHgPiDqS3R30uJRR2KqcgExBXkVqZae5W4=; b=wfE1m3u2bFgdsM8J/7fYkE
 q3X/9UmlCxRezmaeUC/0z0glliQq+nRPcsmm4s3wE6oe1rMRCkrT1c/2SM5yUaKl
 HS6Grwu8S2/q4o5XkleFBORgZv6NIP2fB2sqsB5kO9Mn7y4eG/7gHN3XWpPhXLgp
 hOuJFHjhMjWatCajlzr7XStxsYXO4GoccURX30woE3LFXf8rV6Qe/rY75i8fLNET
 EBr3kR5lxlj098mXGTmj9tL0/UmpHgS26ORPXEfbqVASMburql7zCeAK1gDt0KHR
 MDiLadhgTiwzKNiBTNXS7dy1vcPRDQUR4/xAHPfDGdpOLjA6/yAvrsji9Nk/9V7w
 ==
X-ME-Sender: <xms:ahOMYHwTSYSC5n21FvjzY820Xr3weXDX08FmfsaC-GiJFibGd0iWEg>
 <xme:ahOMYPTP5MBSLj8grDbTAGXKf_YjY0ZAI7fPL-_HAj3WfDu_zoU6wWWcb7bg8TNtr
 SeWFhrRB6rw9vxJ2Uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ahOMYBUbkvhPFa9vm947gXfPLSG2BwJGNCgPQcYDb1z5RbZVJ3Ediw>
 <xmx:ahOMYBjSyYyDs58DAHb52zGiRLYEgoj5qnhX-pwos3JKqqz_yoS5kg>
 <xmx:ahOMYJDIE_8XxQK7eZq_yAuqI4GFfa7LUX2SfIL9oy2HtpNdqKcF4Q>
 <xmx:ahOMYMql_ebPPIBRQbt_xdmtYvVjUsX3FmHXWPRZpLf4FXjZGstafA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 10:25:46 -0400 (EDT)
Date: Fri, 30 Apr 2021 09:25:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
Message-ID: <YIwTaJ11MRUXY2H5@heinlein>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <YILMPOZwlODKqxtb@heinlein>
 <7bec9fb2-35d5-8e44-463f-3eb5c0955f0d@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2QM3Z4SF5SX1mAeP"
Content-Disposition: inline
In-Reply-To: <7bec9fb2-35d5-8e44-463f-3eb5c0955f0d@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2QM3Z4SF5SX1mAeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 07:48:14PM +0700, Thang Nguyen wrote:
> I intend to push Ampere specific features, you can find current codes at=
=20
> https://github.com/ampere-openbmc/ampere-platform-mgmt.

It seems to me like all of the functional areas you mentioned we already
have some sort of implementation.  It would be better if you could work
with the maintainers on these repositories to see how it can be enhanced
to support your use case.  As I mentioned in another email thread today,
I really don't want to see catch-all repositories being created.

If you have specific features that aren't covered by an existing
repository or you feel like you've ran into a roadblock coming to
consensus with the developers already working in those areas, we should
revisit making repositories for those specific functional areas.

>=20
> It is good to have any of below can be implemented with current existing=
=20
> repositories:
>=20
> - utilities to flash Ampere Host firmware and NVPARM: Boot EEPROM,=20
> UEFI/ATF firmware, ...

Are these extra utilities or the firmware update procedures themselves?
Have you already implemented support in phosphor-bmc-code-mgmt?  There
are other systems that have BIOS update for x86 done in that repository.

> - Control boot EEPROM based on current input GPIO and log the=20
> information into Redfish=20
> (https://github.com/ampere-openbmc/ampere-platform-mgmt/tree/ampere/altra=
/host-control/scp-failover)

This looks like something that could be implemented with
phosphor-gpio-monitor.  Have you looked at that?

> - Handle boot progress from Ampere's Altra SMpro, log the progress into=
=20
> Redfish and update dbus. Note that the boot progress is based on=20
> information from EDK2 and other firmware like ATF and SMpro.

You can probably fit this into the existing post-code repositories:
    - phosphor-host-postd
    - phosphor-post-code-manager

We recently did similar for a system where we get the post codes over
IPMB rather than GPIOs.

> - Handle events from Ampere Altra's SMpro (like Sideband controller) and=
=20
> log to IPMI SEL and Redfish.

This sounds like it should go into ampere-ipmi-oem?  I'm making an
assumption that the SMpro is an IPMB path, which might be wrong.

--=20
Patrick Williams

--2QM3Z4SF5SX1mAeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCME2gACgkQqwNHzC0A
wRlWfQ//VCousSfxEVKmMqO+bo2VB4CitwOUykmCJS55MPknSWq1LDjnJnGICSrv
VuLe8zZ8ror+xcoMQT8bNM8Rx8k9mrIDhCP4VF8dwRIINLsDS92pZRpRTHzg0yeW
VyB65ltD7w8WrqqtjRvz2mv3MkgcAfcoUf1WzOIn/4zFoGZtIJ6a14pkJQ79RAq+
iVoQteUvk1MUYHKLkRMOfVOn/Ujmb8zLccgmhklztIxGumikkw5rfv8H0v42Vtss
bXAVwPvyA1q8MfYYlgOH3z2t11YYLRnwwfltRTGkSBUQTTODuFuPPME60gGVctiA
97NEbj5XkUz0ojfviTIItk9COGRtXJxft//vGl9SWhTdSyb7SXl44AJ/nsNeR9C4
v/oa+pCvL9VQjhZZCVDJrXHkf121q0ni5eBIl1WG/r90I08B36NDDfc1BkbnANTK
DElB96axSTDyRwea5OKEDEnk+QLRkNA8dD4qxSV1t5DDE+Q7Pv7lbjH8NRlYTYgx
sIkhygVvqG7ZuGiUVWMzw0S4c3SozI0vWaMRlWKiaunfn5RDvShkNaZDYxnU0rsu
0PMNMxbD09L6Lico3PMdhNhkRz7EZR1IPnZ4vWZ9XGzQLBBV1eM6zJXGryrsVSEq
eWAuuuHGLEBTcMJ4TkGrnONyQKI6AqwgvWOeTxm+BDDXHF0bPsw=
=CeQC
-----END PGP SIGNATURE-----

--2QM3Z4SF5SX1mAeP--
