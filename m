Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D87182153
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 19:55:34 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48d1PD6fjszDqPj
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 05:55:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
 dkim=temperror header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=s8CUX86Q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eLMtstQz; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48d1NT6y3bzDq9H
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 05:54:47 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C7D32213A;
 Wed, 11 Mar 2020 14:54:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 11 Mar 2020 14:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=77kyk91/e28Ep4pS3T+/Qd0vtDy
 JBy6/hN3AHD1xMSk=; b=s8CUX86QQzbmBtGyD1hjF2Ihvyw0UjC/tG8TYHWpXOu
 p1dedwIIT80e2hu0byVQ7prklMYyfLXlcY9CHF6kTFHpj2gDDVq7ZPrhIx7phn7N
 u3eYRI23NQa99INXoPbQWGKdlre3E4bm83MAHsxdqKU+gAniSbxpUj2zFwsOWFLf
 Wp7RMvVugEF6klkr8T3DCfSxcjRDHFJv3iN9bpJNGgUrZObWBo/I6rPTzrCc75Qv
 7INZzxFEMR8j3WfCOs2j7ANOAN8Tzi6CN8k27c/+qd5n7az8nS87TpvFHpNMBZJz
 pXtYqcPZuvM55trbC+tYnFu4iSgRQTiO4ve61bZXIpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=77kyk9
 1/e28Ep4pS3T+/Qd0vtDyJBy6/hN3AHD1xMSk=; b=eLMtstQzCzSQRhw6xKYP7s
 SPexvAGiCTMUMuJalaCY9zQS7E2qvJJcZMWq7269KDOX/BVs6vMTPv2qNO0UheBO
 X4T/cg3QUSsW9VcQJR55RGj4UhImD2DVtEsayFlMMrRAXdQsDgb9bfH+MSytloWM
 Q+9ty0BG3LpmnWS0HsINwtkQVxrkYCzLFoxKQwyDk48bjVfw6FJOk3UjgTTr00bZ
 +WKSl4YxcIydxOuxgOLqE1mb5d4S0npFoczDE3cv7cM0HaiA6XXnD0L6YudRMzPo
 gmwcAn4vQf2Q9JRlrRRS5VnMowbppE1wF/o8qdisFwu8sjUa5CAPc0eurPe+2KNA
 ==
X-ME-Sender: <xms:8TNpXmBayGKumYk8tnuGSOsvBVXN_tZvvkxCiMwTnAjn4JGOM8L0yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvfedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepjeei
 rddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8TNpXo8VxOlv1_By3KpAyTzAZEKNtOk6tURUja4pXoDAChoc6u6qXw>
 <xmx:8TNpXqAXnXky3gwC3DRJtjFJDH5WTVIuTHrKhQJHJBWMC4jIMKnv4g>
 <xmx:8TNpXlSeEtlOl3ZviMqNMGSvtAQWLrs8IZy1EN-5hMbDxiagBlX11g>
 <xmx:8jNpXs0gx6ajn-NXBcUh5Lyg2VJllXv0hghVG1JFFwhkTDA4e-4bCg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D07D3280066;
 Wed, 11 Mar 2020 14:54:41 -0400 (EDT)
Date: Wed, 11 Mar 2020 13:54:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Devender Rao <devenrao@in.ibm.com>
Subject: Re: Uploading authority certificate with expiry date beyond 2038
Message-ID: <20200311185439.GA4044@patrickw3-mbp.dhcp.thefacebook.com>
References: <OF332527D2.5730A8E1-ON00258528.00318A0D-00258528.0035ED8F@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <OF332527D2.5730A8E1-ON00258528.00318A0D-00258528.0035ED8F@notes.na.collabserv.com>
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


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 09:49:02AM +0000, Devender Rao wrote:
> As time_t data structure is defined as int32 it can hold up to a maximum =
value=20
There is significant upstream work going on to transition time_t to a 64
bit integer even on 32 bit machines (x86-64 and ARM64 already have a 64
bit time_t).

Kernel changes are already in as of 5.1 to support a userspace with
64-bit time_t but the kernel itself uses 32-bit internally.  There is a
merge that is heading into 5.6 to change the kernel (but I don't think
we need this):

https://lore.kernel.org/lkml/CAK8P3a2iZyA1VSFqvcEc9o59F76GgzLBiOAmEuHKD81FE=
rPLDQ@mail.gmail.com/

That pull request mentions userspace changes coming in glibc-2.32 that
will use the 64-bit time_t syscalls and transition userspace over to
64-bit everywhere.  glibc-2.32 is scheduled for August 2020.

> Probable solutions
> 1) Do nothing as the chances of uploading a certificate with expiry date =
> 18
> chances never happen
> 2) Return error to the caller if the expirty date is greater than 2038.

With this in mind I'd go with #2 in the short term until we get the
upstream changes.

These coming changes should cause us to think through any cases where we
might be relying on a 32-bit time_t, especially in serialization.  I
have a little concern that we're going to end up breaking some upgrade
paths when we are using binary formats (like some code using Cereal
might be).  How do we want to audit and fix that now?

--=20
Patrick Williams

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5pM+0ACgkQqwNHzC0A
wRkreg/+J/OesJufF4pv0P6yFtn9V3uQHHNXH2AbVjMVdZLTj6zV+0t3HFV4mcri
1Q0CkY2sJIZbaop2BBezRbR/exZNaf2EzynOfxiTbBKj2lxsF2gDOp1SaHfO5A3v
pLUckpHaXpRRe+4YCYTfIgOTgntaXX3YtyFd1rL3f3GWYqU6iWMzPXfgKu/4KGmd
PmXO9pE54QxeZBSvxvUI+BKkiEIY+byIamnF4YiKv6xSLKIcCGmcLGGu3Pt6/VDZ
cBnkcpLgvpdJwpguNWwvDCLfEqtBar8bbq/MrwDKOclL/Udg4zAiQaiv5z4f2yrE
keuQeIQNrB7kQLWNtlbffblnSQzp7HSFqQTkDsyRD9Q6DLaLUu4q/dejTuv5ir7N
2o1QgitLfUJ5TckljHZd7+iNi+3VoPvf5P3boJfReIFPuAFqxVGa7UVaXt2n/pw7
DbGoCh3N18nL9v47IKlO87xTuK6QmBs8ZsHGjQVriQ4sipbv/VMEXKk/5T7LzdT8
30qK7PhpU9ex8WsjwJj8R50POWT/itu7qefVGq+ZCqNsXxziLBFZTlhzGgBNgfG/
jSIOP0s1nWaZkt7xk9Cbi2JcdkKhwfciwiFF5IkPgELzCCcanrMHvIVDG+jTb/g8
/JpP9mbcOjUEpw3ni/UqMZyWv64aZDTVHHcLoRP86n8Ps58skog=
=9bWE
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
