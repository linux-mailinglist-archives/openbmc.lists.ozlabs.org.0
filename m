Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD54FFFFD
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 22:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdvLS3Ghlz3bWd
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 06:28:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=i+RBWRIm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RUJN0IdR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=i+RBWRIm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RUJN0IdR; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdvKw3cwwz2yg3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 06:28:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 443235C028E;
 Wed, 13 Apr 2022 16:28:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Apr 2022 16:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1649881680; x=1649968080; bh=UPXo21klev
 xVbqsQWghY8DGNBKGf+AYtK7dTiezgDGQ=; b=i+RBWRImmShyKxDGCQnGpP/+hy
 tnTSiqjYeunTD2a90RuWJm6/5yYPyZBBIlKllqOgBbrwFmwxDfS7dsA1YWouxGdx
 pxkfMjCuuDF/ykdQfNbz00W7OusgQV0Hjn9hyNSO8T70YuRYmj0CxyCcVLNbW3s1
 RzRgkh2QeehjDnoxTsooMGYvON1EScETWo0SbEB23SxG7/uAfIXWqxv2yonTR/qH
 +tQgnIWlpLgrfK2aJNd9PISKF25H4L59MqrnJ0UN6PTy2Hw5rsVAv6hbOH9iKMff
 JXu78VMYCXez+MNoxWIMi4VeyGynLpVjlRFdAFPhesWQ9HkHFHv/k7DUlwzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1649881680; x=
 1649968080; bh=UPXo21klevxVbqsQWghY8DGNBKGf+AYtK7dTiezgDGQ=; b=R
 UJN0IdRb/uY+9PdHeDdiPBETbsz2x6EcTt/Jq4acfQpeFL4OIXrSikoLhHTVlscs
 chCVk4kNwhnod+GGtp85hC8NlWPz7yZE8rEX1i233yEzEd0l01wAx/ty0Pi2LQYm
 /nh8PmQUPxCMTiWwQS2WA3nKZSHaeEPh1HR3XPtQzP4aQZdzqX5oIIhX9E5MGdZL
 nA+9pBwA0wnAt4lG5JOg3gauLoXynF6HxHpOA0gvo5V/DIUCbqsUetofuNbsEwa6
 7PQqQ4cMtrf7hJkT8VrU9Z6XJ+R3qhomLqOLaygey0Xebb1SF8xMsUSslJy+SHZm
 hj1ZPaVykDgpRJX676agw==
X-ME-Sender: <xms:TzJXYsmsVOOelVE0gp99XerIF-WkqS8VtXeqMtZgWkEVqrB1or3eTA>
 <xme:TzJXYr1DjL21N7yNno4CdoqtFYD_sCwogVCTzk3pRndRqThwjheJpxO7hrSsoXh8d
 Au9QtpMoBSNb5xlcLc>
X-ME-Received: <xmr:TzJXYqr9MAlyQNsvbxLJOwCxhZKe6EM1RU3bZa7KjGFi_wTEWnE0LFxoV5vpTkSygTSCaZUONAbIOe0XIwASKrfyQOuTkpnmn-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeluddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvhfejueduveeuteegvdevudff
 teeuhfeuieejfeffgedvteejkeehleekuddugeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
 ihii
X-ME-Proxy: <xmx:TzJXYokpXndBozddA5rplYQE14Ws5b7RHZ8XthtHlKEz4qynwUp6hQ>
 <xmx:TzJXYq2J-MDOR5lHM1e__fHz78cyDA3s_7MZLv76Lfqd21XaPT_7Ow>
 <xmx:TzJXYvuo5ucuLe7AiIe1Hn6YOW3AbFNwu7lxmyPcGZThB7DVAQpiuQ>
 <xmx:UDJXYvwSn16ws75uQwYGzDibKMGIDSYAj9d7Hr_SXzVgSXp7Q-rcEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 16:27:59 -0400 (EDT)
Date: Wed, 13 Apr 2022 15:27:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Message-ID: <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fc/1V490NjRXn53b"
Content-Disposition: inline
In-Reply-To: <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Fc/1V490NjRXn53b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 12:41:21PM -0700, Jae Hyun Yoo wrote:
> On 4/13/2022 12:19 PM, Patrick Williams wrote:
> > On Wed, Apr 13, 2022 at 09:59:16AM -0700, Jae Hyun Yoo wrote:
> >> Hi Brad,
> >>
> >> On 3/14/2022 5:06 AM, Brad Bishop wrote:
> >>> Hi Graeme
> >>>
> >>> On Tue, Mar 8, 2022, at 7:40 AM, Graeme Gregory wrote:
> >>>> Hi, Please find attached updated CCLA with Updated Schedule A for
> >>>> Qualcomm Inovation Center Inc.
> >>>
> >>> Accepted!  Thanks.
> >>
> >> I checked my email inbox and found that Qualcomm CCLA is accepted a
> >> month ago, but CI build isn't triggered automatically if I submit a
> >> change into Gerrit.
> >>
> >> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52577
> >>
> >> Should I make any additional request to make it available?
> >=20
> > Hello Jae.
> >=20
> > We should probably write up some better documentation on this process.
> > When Brad "accepts" a CCLA update that just means he's put it into the
> > Google Drive, AFAIK.  He doesn't do anything in Gerrit/Jenkins.
> >=20
> > What we need to do is:
> >=20
> > 1. Create a quic/ci-authorized-owners and quic/ci-authorized group in
> >     Gerrit for your members.
> >=20
> > 2. Create a commit in openbmc-build-scripts to add quic/ci-authorized to
> >     the Jenkins approved list.
> >=20
> > 3. Add everyone in the CLA to ci-authorized and the CLA Manager(s) to
> >     ci-authorized-owners.
> >=20
> > 4. Retrigger your commit(s) in Jenkins so the approval process sees that
> >     you are in a CLA group.
> >=20
> > In the meantime, I can manually "+1 Ok-To-Test" your EM commit above so
> > that Jenkins will run on it.  Can you confirm 'quic' is what you want to
> > see for your company CLA name and work on #2?  Andrew Geissler or I can
> > take care of #1 and #3.
> >=20
> > See https://gerrit.openbmc-project.xyz/admin/groups for similar groups
> > for other companies.
>=20
> Hello Patrick,
>=20
> Thank you for your kind explanation.
> I tried to find a way of creating a new group in the
> https://gerrit.openbmc-project.xyz/admin/groups but I can't find any.
> Probably a permission issue?
>=20
> I would really appreciate it if you can take care of them. 'quic' is
> what I want to see as the CLA name.
>=20
> Regards,
> Jae

I've taken care of #1.  You are the only one that seems to have a Gerrit
account, so I've done #3 the best I can.  It would be good if, at least,
your CLA Manager could create a Gerrit account so that we can add them
to the `quic/ci-authorized-owners` group and they can add new members
themselves.

I've manually "+1 Ok-To-Test" your EM commit, as mentioned.  Waiting on
you to take care of #2.  See this example commit:

https://github.com/openbmc/openbmc-build-scripts/commit/123ffbe91566073ecc7=
3553cb32ddccf7a8a342e

--=20
Patrick Williams

--Fc/1V490NjRXn53b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJXMkwACgkQqwNHzC0A
wRnmTg/+IiZHSMaXrA5+tZD2VyRvc8sXb7tUo5C/xbD4stEB0QZ7vsRuP3aB2y+c
mZxLrTgHkEEThp2pmlS7/NfPF+S+y70D46syJown75zRYZYTGSNedtuc1pSQihpH
s7ovVFK4bcBjLqgmgycKiCx3nrttjJ0vw2Zci888abmjz2NSm5ElR+qCM6HqGpKy
QR5CWbTH3W1iTi7MB0gSWZlHnE/rWKNLNckeLuHHlWcPgZwYMTdp1LqX4/PX6AnV
zmAsa/nMzcQrXQSzQe0B/wY04MpOAwe4EYfywwPBha4qXJ9PpqwLxYNr2VSNi/KS
+xlMTqc26Fm642+A/HeEW5jpM1TsbhvL9Ta9QK9esvJQs2qu8ClmrHYGOG7Jejy9
NgM0Fg72La6xIJeU8NVgs5OqyaC7CiHtt6it0E558i1Jk4DmQ7xhYguiDBtoyKbm
5C4ciuiOjWGWWpPCEeaPqWQZDRoMy/jJ+oLYToTHR8TKT1OwX/RcS2FvRKmWyl/t
zSmeB6rzqqF6HMdELkweSVCOrsNmbVCU5HYoDl7d1nQ8TId1AZYEzMU4vKAUQnSZ
VAwpa/4aY5O6j2utVvoN2FvQnNYUOZKLpI4qu+v489SVI2orag56L023FD7Q15uv
6V8xMugfFzCwyyp1TCqe4ePIRr/ZoyIWDnznTY1qVK+7fV6UhDc=
=hDzv
-----END PGP SIGNATURE-----

--Fc/1V490NjRXn53b--
