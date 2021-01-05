Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D156C2EB420
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 21:24:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9P9M5NQlzDqdV
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:24:23 +1100 (AEDT)
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
 header.s=fm3 header.b=Vtl5gixg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ipa8S+9s; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9P8V4xbMzDqcJ
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 07:23:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C235D5C0148;
 Tue,  5 Jan 2021 15:23:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Jan 2021 15:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=zXLVTy8FpOQJeaC26bnFzYcB/f0
 ljyuE2eHE24n24LE=; b=Vtl5gixgbZVYlrOu/AzmOQpp/6Zl+rNPAc9Do0ENkjj
 Umcv6sn2Q+Qm4pJH2ubuK/etM5S7XFjxn7Tckolylnl/cRi1sqOl6qEdjae86HQk
 Tcx3AAxpJEsiR8I/8QrmkGSakJ4XYS5cxTRy9/E7hP0/DnXCyh9vxYXH0uMIquwx
 pb/1N091vsuyEvvH5nKo9Nbcj9eYQHqyeAVrb7VYYaRcHFlOHd2Vq8OAduPBfvDV
 NvU9a3BddvmdcoaG7CBWipnX6NdfL1LBLz988rVWxIRWqsxFqC2uTPYSg1qkrRSF
 wgVRMri8q3Nz1MQPkI2rLCldxRhVZqitaQuvKn5npDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zXLVTy
 8FpOQJeaC26bnFzYcB/f0ljyuE2eHE24n24LE=; b=ipa8S+9srYJ75eucYkJ8nY
 q6teeso+0Gxkx7Zmu3aI6yx2GF80YQCCbRz6VkEzxWDhLW///FxhjQF8sJgsoZ3/
 PSoVzPrL9bvWNh0OAKHZGi0ljZypnnPyX0Ei6Wp+i5tLjR0iIYH4jzoVRRS1LxZE
 /w9vySdY7WKqbGso1cwPxdJEF0ao97RvnmzMLCB2v0GoLAnfIm1x0DD4B6Ha3fTY
 htZHqB9ZVyzBHhUwWQFxrECaqSPQe3nFiUaNyJMRNdGxuQmOc5kNi0zJceGOSWmV
 4CO3SjzdDjok0AD/o1kEZwUR64zPWl5xzWxuTb7wHf/0JpTMsJ9cWmz95vMYwXmA
 ==
X-ME-Sender: <xms:xsr0X4GSWczfM1dw1fTa_irEnSIn_QZ9yb0SkSc049uK0Q36z7ZlhA>
 <xme:xsr0XxVjpbA-uvZzS088pCyQaJjkoFxSjedmBYJj5dHLr_4HHJmbb3uRoJsguUvj8
 tziTvCzrjfcg4xpAPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:xsr0XyJmLFJRed55Des6rd2eu3zQQtnuWEd0mNE_qrOc03w3hr7tGw>
 <xmx:xsr0X6F05ciGFpn5XLV6wKxbjShI7MOPKowhGAm0cnjTDvehOi_f6w>
 <xmx:xsr0X-USKw_Ag2_MFAX1iBpMmXTz5VnMZzJxuY4kaGUIaQMhs6-c0A>
 <xmx:x8r0XxcToF5qkgzZxkfdKme-4ZwWWnmU_Q691hSE-a1kBe2xwzlitw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5C7A108005F;
 Tue,  5 Jan 2021 15:23:34 -0500 (EST)
Date: Tue, 5 Jan 2021 14:23:33 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
Message-ID: <X/TKxS8ximiwRxLw@heinlein>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
 <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
 <CAH2-KxDECT96ZHfKadwLYUkbx2_MAqUBugteud-27XZVYELWPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gUOo/E0iC2CCF2i6"
Content-Disposition: inline
In-Reply-To: <CAH2-KxDECT96ZHfKadwLYUkbx2_MAqUBugteud-27XZVYELWPA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gUOo/E0iC2CCF2i6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 09:38:12AM -0800, Ed Tanous wrote:
> On Tue, Jan 5, 2021 at 7:59 AM Matt Spinler <mspinler@linux.ibm.com> wrot=
e:
> >
> > Also, we need a slightly tweaked median of our 3 ambient temp sensors:
> > 1) throw out values outside of minInput/maxInput
> > 2) if there is an even number, because we threw out one, choose the
> > higher value, and
> >      don't do the average of the 2  that I believe an actual median
> > would use.
> > 3) if we threw out all 3 (very unlikely), use NaN as the sensor value.
> >
>=20
> These kinds of corner cases are exactly why IMO C++ is easier in the
> long run.  Those 3 conditions are trivial to add to a C++ based
> daemon, but would require a lot of complex expertk code to define if
> the corner cases were found later.  In C++ they just end up as an
> extra branch.

I would agree.  If these are the kinds of problems that we end up
solving with PVS, exprtk is not appropriate.  The initial problem
attempting to be solved was "I have a small set of sensors that I need
to do some relatively simple math on".  The moment your "virtual sensor"
has an if-condition, exprtk is probably not the right screwdriver to
hammer with.

--=20
Patrick Williams

--gUOo/E0iC2CCF2i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/0ysUACgkQqwNHzC0A
wRmH/w/+JTyoaZ+n7FB8JCNyEu6UNq+vK44QeFJrtv6xkcbpPrU30GdBD/5NawSP
aqlagMPiZcIWh/YIXUquXl2zgPC0tYP2itrrAKBknB7/1Kubq+Gj900conBr5ZWO
1hFB9L1GT2djHiWd2F1QzU3zKnWgtOzDq0mql9pJKEeEQUeNCqE1MNudbGqYzCwd
9cYnISjcIJDWKO29cDn7AX3HhBB7NeHA0W2/oDD8O0iFvvD6I3WHdM6JYKou8Jgu
xmpz3XTPNyaBlkl+GiqWxV1OQJ0yl+PmbBBmM9OUXl2p7LxbKzR0p3D/wbS40Qs1
UJnBDl61I6tpS4oh03CD640U1xfRVMHrJnzU4RQxlBU4L/Q/dTwB+LRRuP0MSNIp
pRfiTYvLAffJS2+WeIdfxluwEDpKIbCbvgkIXDqTGfs5M9//ZIEB22gsE3Vknt87
W7u2TnWWeDrttTYMzBa2HGcYhC+ctnGKiIrmcHi4oRQ8nMCvyTsVfI4tP28FqkHr
NJQ6k5Jl9qTOQAZOfU/xFFxLHTXvsqpiBe1u3Cipm6amGTTnvnbXmS7XlhGt98tY
mdFNaT4+BhtK3UMXrRMm34gHaI0/yYezRwom1Vi3DTxk7AitZxb+GNrEr9eSQkCK
0ywP2C0rQsFphGAVSaB3GBZZKMDmjNAqoo4S+XaTgHZ8cMNiVDU=
=S+ed
-----END PGP SIGNATURE-----

--gUOo/E0iC2CCF2i6--
