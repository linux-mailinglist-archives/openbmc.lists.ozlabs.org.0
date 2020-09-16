Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E726D06E
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:12:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJqQ4w53zDsGv
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:12:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=bgRlWIJU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=hHWmtSWO; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6p5b35zDqq7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C84DE5C11B6;
 Wed, 16 Sep 2020 13:20:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 16 Sep 2020 13:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=acxrLTMk2MXDlZDypAv5Pl/rGEV
 2/9oq2CUt6/1fer8=; b=bgRlWIJUwHy4TdsZOsWmzhkUjL/zqjwOehKCVAZh+uk
 vJQ0+xEEpFhYkP/QFZaIur26yrfUqzhyblmXhjuL+13W0Fi90Nsnbtjy0v3nxpui
 Mtkika6BqUcAuZgej+ZACSFc8M062OECwuXid5k2OVaZVuF/AHb6cOueyQ5R6uys
 uRf1V7Gwllnd9+xYRXM1PrXu76rgpUCzcK9wGuqwz7fShDuMCCZFhay3uDFTHMGE
 Y2Pt2maLeUBuei12yeccJ6yxknnQccRBmOiGl593DRG1dKGrLlRYC311+JXsohDV
 j6S+Er81Blxm9AVuD+S2VwwJW7t15MOIsmxKwOCNEaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=acxrLT
 Mk2MXDlZDypAv5Pl/rGEV2/9oq2CUt6/1fer8=; b=hHWmtSWO8P+PjJJG99Efr9
 t32pjK2Ht+2b7qFiza/kpNhwoZfQNfR1HDohMTYP0Ob2miK96w6NiQ+PKJwlOD98
 fpFxh3D9QoyPiPotO+6Ci4M6rMSYyAb971wgTGCbXV3zjF3wLOJ2Am6BEP1PKnOF
 YSUEatzI0ZDt70IjSHidjTIWNyDSWjH9nxwQsDj1kXSP/5iSk0tFJ50NcQbB8aW9
 lLXKfNHYqQe160grezjuptALZyY+mqw+93LxP0097HEN+7h/4X8km25GJ/95uscM
 JYiL10C+h18GJ+NXFJ7nnO1vXtM551yygFqRzeU9zp+Zhxx2g+sTYVpl4p05oVvA
 ==
X-ME-Sender: <xms:bkliX1_Ulmb0m1x2oUqXCw8M38n58BpODSeiIdre4FLYNQ2G3urAzg>
 <xme:bkliX5vij6K7i2RgVtXVcpnjwt6_1J_XcFpZWFgzdTS4gP-wh2hzOig9ZKH4V_P53
 CNo1igx1aP0778bYzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epudeiteeiueeiudevleffteeijeektdejtefgvdfgtdeiuefggfelgeeihedtvddunecu
 ffhomhgrihhnpehprhhovhhiuggvrhdrnhgvthdpghhithhhuhgsrdgtohhmnecukfhppe
 ejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:bkliXzAWH8UWixQG99YKWkocYCp4dsvuZPwpyOTZyhReSjsIump7Aw>
 <xmx:bkliX5f-TjVcMNp4dg_MQEhvfYDiTsUgfHwSgtha3goOVxqAz4ytsg>
 <xmx:bkliX6PU1YwctpGwghyyQcLSNoBIftyr4_iNsuK6jib_9fnuGbSxbw>
 <xmx:b0liX82leJ9dWg0PdcATQ4DP7a1BeFtywJ_QgwtvA5XVwZ1hFk_rbw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F48E3280059;
 Wed, 16 Sep 2020 13:20:46 -0400 (EDT)
Date: Wed, 16 Sep 2020 12:20:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: manoj kiran <manojkiran.eda@gmail.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
Message-ID: <20200916172045.GD6152@heinlein>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline
In-Reply-To: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "ed@tanous.net" <ed@tanous.net>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
> Hi Ed & James,
>=20
> Till now IBM was using phosphor-settings infrastructure as back-end and u=
ses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp)=
 for setting the IP address of hypervisor. And now we are planning to lever=
age the capabilities of bios-settings-mgr(backend) as well to set the hyper=
visor attributes.
> do you see any concerns here ?
> Thanks,
> Manoj

These end up being two quite different implementations from a dbus
perspective, which could have implications to Redfish and webui users.

With 'settings' there is no generic settings interfacess on dbus; every
setting is required to have some modeled interface.  This is great when
you are exposing some hypervisor setting that the BMC also has for
itself, such as network.  We have a single dbus interface for all
network end-points and it doesn't matter if it is for the BMC or the
Hypervisor.

With 'bios-settings-mgr' there are only generic free-form settings
values, which presently can be either int64 or string[1].  This means
there is no overlap with any similar settings we have on the BMC and
there is no programatic way to ensure the data is of the right type and
named with the right key.  This approach is better when you have large
numbers of attributes for concepts which the BMC doesn't have itself.

My understanding was that the 'bios-settings-mgr' was typically going to be
used for uploading a large blob of configuration values and the external
interfaces would have fairly minimal code related to individual
settings.  My concern with using 'bios-settings-mgr' in general is that
it will end up being very tight coupling between external interfaces
(Redfish / webui) and BIOS implementations.  When you use 'settings',
you can implement much more generic external interface code and likely
limit the coupling, if any, to the PLDM provider.

Net is, if you're expecting to be able to modify hypervisor values
through Redfish or WebUI, I think the best approach is to use
'settings'.

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54=
aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.=
yaml#L44

--=20
Patrick Williams

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9iSWsACgkQqwNHzC0A
wRkX7g//bDbHElt9rDtnadq0MhW5a3Nfp4uQL2LdeJXZVcnZVeTf8uxfxMKT3QYC
eHmjN0aeEPxRm3eSOkmh3L+WzmCr2qruHffdSyMcK+w8AXaOEbe0a9EMN7E9drNE
sC+YdVgB2Y86tOMHLDtbcZTCCYgbo9Kspq1Rnvod0q67qGAc3yCmxxS2d0WQ8Bw6
OKFdhlB0iDIjYrDu1Tarb5flFZb+Ula7zoMR2psMaJLkPx/MzVr+C0Tm1llgLaX4
GC0TkVtfrdSGCaiSyHz1X7XsQ6uhR33FclvGxNeSj8AZMdsjr5YTX+zMHw+F8YfE
VuB2Ersdr+nrSWzhvwbc1vXfEnPmVhplPrsH35jYsN2kp9Gvwm8NXrw60haBMv0q
qD/JEzvno3LjpbYPZaMtkChdLI7vHcwss6R7hP67JlFd2PBbXm4XyraMVcMFwhnb
tupc0SsOL5EhxbvRWXRpYrl72E3NRGEQ7DPN4640SczE8vS14gT4VHQ1GU7JDPiG
nWzoTVH2OhDgor9pkAXBjI84caTkbzb9ppTMLY44NYAQSVw6e39dIPlo1YnCY7Pq
qrDECrSEgDa8vrtOPQRVzbku3Pyp+RV5Pmg7kBRHEDRzm9HhHt1xZacmnbkf3nIt
c3DADc34PnlSyernP9vkLZT6ro3iOfWMJK42LGtjklvOzhXl7iA=
=2JJd
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
