Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB8207D99
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 22:40:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sZly6fplzDqVB
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 06:40:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=SVvTX8Ae; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=knUZal01; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sZl00MXXzDqVB
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 06:39:38 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 47F655C0061;
 Wed, 24 Jun 2020 16:39:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 24 Jun 2020 16:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JBp7ei43FeKvUGsqYM+G5tXPXLb
 8szO4EPSKY8l1U/E=; b=SVvTX8Ae9ptA5uPbZJIrFcmBJSrsgPxx5mTl+dqZcey
 uCzREq5rPur5tJxWH5+kZPP7bvDqtyvmkhyX0onumLqACoSeXEcjLmRLPKmZl/9V
 U6PdnwkEr78mzWblumRW4Axy+Tx4xHS4fFfchpYZZCbpqDkwPB26IskvOHJzZPvM
 Voj0nJsvHdPu8YEm4dVsEUk8mAlK+JM4CwVqdI5PAH394cW+SfQ243/VctfemI8Y
 40VTdGf34WrmqoAI8kBQj1Key4IpwnGVIgvqN1jD2vL6megJFyiuPfxNdGe4pHsf
 5GhnR9KtWIZX3XE5iwGdvooWKbkno4xwPCYhXwnzyiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JBp7ei
 43FeKvUGsqYM+G5tXPXLb8szO4EPSKY8l1U/E=; b=knUZal01I4AolF3d7kVX9o
 k+bl3laelY0eNu9WPok/j33SW2tPyxb202KSCkpmUaCbMEpSwALK8KrP2AMJvQth
 Rxikq/wJcYLCrcQSuNWpKQOdgh5ZeMLpiigWGior5UGssNJj0pZULjiCYdXN+fug
 la6w3qojnTZzIvTOfsEhKD7MnVN5iNth/U/tDqROzxoo7EC9h/owcd7Tm71R6Z8S
 iKE2S4VthL69jkOfch/16RCFw5A4jDKJnhiH+0hChOd8hUwe656u92N2xPQCbQnZ
 y7cBAl/yyShX5ZtFHCq6tOl54+lVMGwdYZtmMWfzZTrwfj+TKWk/lSCSXUM37gzg
 ==
X-ME-Sender: <xms:BLrzXuCef55WL4iGmSIpyUpaxNqTIw7xUvO-nAVVsGeMg-OXZ69qgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekjedgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedrledvrdeifedrfe
 dunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:BLrzXogBiiNTZcHd3LOpS6G-5k7-AyRnNOsFfJUCZEtCPL_ffiTysg>
 <xmx:BLrzXhkv42_FJVrhAer33yvHpgEb43onaXvqddQDb0FpziNWuyjq5w>
 <xmx:BLrzXszv-h3_KSPu5MfcQO7f5RZoO_-EEPvD2ZdEasoPAF4pm2i9YA>
 <xmx:BrrzXudFSwjZkguZS1gluGrPFMhzd6MlNSirk9eb1HwmpfkgQJ-iAw>
Received: from localhost (mobile-107-92-63-31.mycingular.net [107.92.63.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0EFE30676F5;
 Wed, 24 Jun 2020 16:39:32 -0400 (EDT)
Date: Wed, 24 Jun 2020 15:39:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Redfish EventService Implementation
Message-ID: <20200624203931.GB3922@heinlein>
References: <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
 <6d97d36c-b78f-44eb-f808-2ae82184925c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <6d97d36c-b78f-44eb-f808-2ae82184925c@linux.intel.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>, openbmc@lists.ozlabs.org,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 09:24:03AM -0700, James Feist wrote:
> > 2) Have the mapping info from Redfish resources to DBUS Resources (Some=
=20
> > JSon file may have this mapping)
>=20
> This assumes the mapping is static, which on many systems it isn't,=20
> right? I think this needs to be developed to see what it would be like.
>=20

Don't we, in effect, have the mapping from Redfish to dbus by nature of
the Redfish providers that create their content from dbus objects?  Is
there any way to reuse this information to create the corresponding
Redfish events?

--=20
Patrick Williams

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7zugEACgkQqwNHzC0A
wRk3ig//S3UtZUgVBYf/CZ6wo7DZivOI5V0USwivlrUVcKFPaxfdaAMKKKNTikN5
vdBVC8n1+2nbhzVJYMHV0lyCyqFE6QgGgJF3S1BRedZ8NxLx+PfbVmj18zcGftvG
GiffFmt4u91Tb3x/2aMeShBC5SiFgj/bleqeP0qkbQBA57Dsxx1XPBb8OSdmV6Jv
/5hTWRaTz4XZ718YTKrBaJgOuYocVRNrYBMSEZg/FvUUmFdzhAWRFNGr8//cs80X
tbeel3pHmhri7AL3mryle81qm/HvQLi0JX7PJl7dY0B14GRWggAdXr4uZOhQ2YKu
dSDrpxkQWbXY6ExQvODzYH2GK5PlZM/p2gEcNPfPq+IYfVWMIlWztsfUQDvoLpxI
fnZW0A4QjjgYESF0PUf7pkkrD1Ae4oOMO7TQlr+UR3p0g+MJgZk/6GEh2qruNqrb
UgXIOnOASl323/N9fp7B+nUVtTM7QrgScklOppwKnk5uCQpLkon/aNGsbZLc29MS
bTANZMi2YwsTmXOPJmdrIeLLB4Dv1D+5X283T23+8EVqE/86G8Aookjf0VJa0scs
XgV0wdz9Mi4kkg4rONRRWeezCIP9LFKP2wAWZjY9B/5mUAyENTI5s1Zm3D2iSPiX
bvsjNh0/aE8Tnv14RNMDQg2gT9mCoVvHE319C4pY94RrDn1lfgs=
=5Ujo
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
