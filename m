Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2044FFF0D
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 21:20:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdsql5D4Wz3bZf
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 05:20:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=HJ1v4ksZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tqVOm7+/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=HJ1v4ksZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=tqVOm7+/; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdsqD2Fqdz2xfT
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 05:19:51 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DB5A5C0262;
 Wed, 13 Apr 2022 15:19:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 13 Apr 2022 15:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1649877586; x=1649963986; bh=vocJiadH1R
 0IbFmroLeLm33p1ytMh8orW0+VdGP4TzM=; b=HJ1v4ksZr6J1vY9XY6mvhxEcG5
 Q0saXM36w6XMib1Ztah5e5tXSHQIJ3PksPU3yQHQ5TR6KuQoH52QWLcXJtIXH8QL
 3UcxkPb0aXpjBRR1afNd+5GHcVpmlf+voh5NhkGJjzWn00/xp/dJL5G3GfjqEGs7
 h4lr/cYQalYCmAQmnmkoI3SRqKsPm1zQTCKrdueXycGd9RkGXEApFnhQ0lpkugm4
 CVEcCOzc2wBJqXM1BKlq0KDHuUiJFTm4WDZPLk3tuAaFQXyaPUTf+RcEVpwP0+Mr
 I/eSm/GptgAhZRmV3CzwNzt3BUxmi3vSB3IRXbIaEP1xY5n7nYPrVX0VrGOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1649877586; x=
 1649963986; bh=vocJiadH1R0IbFmroLeLm33p1ytMh8orW0+VdGP4TzM=; b=t
 qVOm7+/5lgRywOBW8kO7AluBoMdU3rB5X0lbOxaeZ0nlyQkAqQcFmsNKnfQ80hIG
 JtQSiElvx0TxU2+b0kYfSzzdGjEEUTCwzTUMqhX/BxTRUU6vDddPXdY6s95lNgfQ
 EtSPPS+QAKJvOKafANH/C+m2iin4YvourjED4E+xiTjDL3ZPBHUVpdzKVtjlLQWI
 5WfWL51OnvBd3M56JvQDx7Ksjl5nn5ZjaFU2R1TrXvM1wtkNFM16x9y/HGQVBAji
 WCb40LcfEibIzNR7xEkFFYZH7PtQ5NhAr5Ovutz0yOvTCsIEz53hsZhe3yv9gkhe
 1xeE7O7q13BqqtWmz6TPA==
X-ME-Sender: <xms:USJXYhNQJ3Mav2w24xxsu7Bt98g0MHL1K2xe1tkR2_2owWp4fBD_SA>
 <xme:USJXYj9GKO0QI7szMWBYZ63YqXzATxdO1RJP2eGOdf5pl5mkKpQg6hFoDjzYrMypJ
 d-43c7vp5ZHAZUtRnI>
X-ME-Received: <xmr:USJXYgTbtoTGb3KhXbwV_XTdNQjZ-w-j9x7oBy0fsy9sXxL6d8un2T7PeJOvfBGwAx5PISHnTihXO7v5Af44HSHykfrcnoIOY9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeluddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:USJXYttENG__02n76phe8QA5TXzGTOW6FVl0BGN-vLaYB9KekKIxbQ>
 <xmx:USJXYpfXRe_7KV3NhCOyutW3WZIVi5-_1yfGISWyqh9X4cHUktIXVw>
 <xmx:USJXYp0RidIToibov4rh-DVrlAYEGFyLV4P1Sb0Tr0RBVEkDoig2AQ>
 <xmx:UiJXYt4t9Tm1cTsp8pEIQg3a3dXMJvPxVIvzPYmnV8mfyVjLVhNhHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 15:19:45 -0400 (EDT)
Date: Wed, 13 Apr 2022 14:19:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Message-ID: <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9QAN2k471nE/ribf"
Content-Disposition: inline
In-Reply-To: <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
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


--9QAN2k471nE/ribf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 09:59:16AM -0700, Jae Hyun Yoo wrote:
> Hi Brad,
>=20
> On 3/14/2022 5:06 AM, Brad Bishop wrote:
> > Hi Graeme
> >=20
> > On Tue, Mar 8, 2022, at 7:40 AM, Graeme Gregory wrote:
> >> Hi, Please find attached updated CCLA with Updated Schedule A for
> >> Qualcomm Inovation Center Inc.
> >=20
> > Accepted!  Thanks.
>=20
> I checked my email inbox and found that Qualcomm CCLA is accepted a
> month ago, but CI build isn't triggered automatically if I submit a
> change into Gerrit.
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52577
>=20
> Should I make any additional request to make it available?

Hello Jae.

We should probably write up some better documentation on this process.
When Brad "accepts" a CCLA update that just means he's put it into the
Google Drive, AFAIK.  He doesn't do anything in Gerrit/Jenkins.

What we need to do is:

1. Create a quic/ci-authorized-owners and quic/ci-authorized group in
   Gerrit for your members.

2. Create a commit in openbmc-build-scripts to add quic/ci-authorized to
   the Jenkins approved list.

3. Add everyone in the CLA to ci-authorized and the CLA Manager(s) to
   ci-authorized-owners.

4. Retrigger your commit(s) in Jenkins so the approval process sees that
   you are in a CLA group.

In the meantime, I can manually "+1 Ok-To-Test" your EM commit above so
that Jenkins will run on it.  Can you confirm 'quic' is what you want to
see for your company CLA name and work on #2?  Andrew Geissler or I can
take care of #1 and #3.

See https://gerrit.openbmc-project.xyz/admin/groups for similar groups
for other companies.

--=20
Patrick Williams

--9QAN2k471nE/ribf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJXIk4ACgkQqwNHzC0A
wRkbrA//aeVlYw5JjVN+rFJeyHYQJHpAbys8IIDVi7l8v9POzYJo7UJ1YLUk6AsJ
4fJ4CEysQmop0Jypbuvf5hIYXuovo1o1Ee3o/HdWwW/EkhN1ZRC9lPTLTD3DJP+6
lND+3IP0akceZozgW80Ep5WQvv4CJsSOqGuvO6MtQn0Zxx7Wr1o5QE3YSUz8Ovfr
p8sFSxlfqeVS2jtG0GHx7HkAb1XZ1S1nL5s6ucn0jAg9udrufQhsmS6kf7nAdgUl
aVsXF+SopDDuHvByKsbLmOqcSoMitTGLi++s+QifFjbjyIUVFJtl9Xjjc8d/W9IV
YMqE9iYBoJFE8yRDOIaW1RQM2B1+fiaG158VZglEduhzeCriEFZ8flKmtVZcUMy6
jNnvHB+dyWxDf9AOhheC87xIE5/vLQ37Dk8IX1KpmH61ITgT/+5b1KxeA9OUMG9R
C9X0vwQhPCe8qAUlLCmNbCb0yexX7KJKlQdM6PP4S7emHo5yLoKyYyrZhaN8fUbd
ZWpO/x46Mk/85UyfBoq0M3Vz0RVkNLQ/CFSrUf1q46Uh4JFnT0LgNhnHUR41QKF7
Exq4u6SfLsfaTzFOika9aRQfvN9hJS8aSOf9QecjSxhL7GZgY1q4jTVwdd+IT7WM
uC9Jih61dBZVkjkBOUXOaqr6BG8oPA1M2e4TFtkILY9Y/MZMJOo=
=o0Za
-----END PGP SIGNATURE-----

--9QAN2k471nE/ribf--
