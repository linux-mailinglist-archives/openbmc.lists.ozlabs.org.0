Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA51662AC
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 17:28:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ng5J637KzDqMX
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 03:28:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=oLSgpPWy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=M9hER/Sh; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ng2l0Tx0zDqLs
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 03:26:38 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id E49C565BE;
 Thu, 20 Feb 2020 11:26:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 11:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=iFVc6D6NNBsoNEPevEmoQOMX2W0
 +OGtVKZYs/o/0ldc=; b=oLSgpPWyDqFFli9Gro+KMddYpc14WowmTyh2ixWd6S6
 mjTPGWYPjSiEJRNscWlSaN1befTrw85hAxgmfVcONkNQjMko/q2Dzfb41YkuWieK
 QYB3vfgYs5b9rjNhlxD7FCHqC9q0Dn7r5WceQnbbYuB7vvi51gVT53HuNx7Sn7Fy
 Y+P0C2a8kYARY4mYNH+NzV9X/F+03ZeCYf1t0O/lz9Hrr+ga6Do7l0aQV3HQs8YX
 WBnbZDBzWYb2uoK5lgTr/qG4TsapTOO8do1vw8O7o/ppd7JL25zlhBNfL/FxZWFu
 7JAtiUrevQNKSGVy9mZaUpqM9nz17ixhC416UsVoj6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iFVc6D
 6NNBsoNEPevEmoQOMX2W0+OGtVKZYs/o/0ldc=; b=M9hER/ShOXxyAeLOHe1Hbt
 7Mg3T3bm0lIzd/iIh3f5kEBEOO4L8Kx1Vvuik0wiyiBm3NEuyQlYk7ptO2TAQ1dC
 o2GwegUjzhHDScvf/nk4ti1jzA6WTFqNFv85GEkDHa5DIexWMn13oR9WnoFqAQJA
 fqOQxFfa0CNAb1sh/vxoGrVsRpyg9HyX+S/BaA8gaVvrYa2ESq0HCn7dnAmjaVOb
 iK6QPk2EDac8EH01Vx9aOug8VIo6ual+BLAKqsEKPputXKJuxle5CudVwRWlnZZR
 aoBJyVL1/pqmO11bXQ3bn1IK/FqXMWn82LUUuVzeemLfsxHRCqMWym7u7MWJLW7A
 ==
X-ME-Sender: <xms:OrNOXlRXp6euiby2IdoKQ9pZTQkVuZ5R32KoEQBI6y6D5XnIK52k2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepohiilhgrsghsrdhorhhgpdhgihhthhhusgdr
 tghomhenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdig
 hiii
X-ME-Proxy: <xmx:OrNOXtAsnnYNXCXGknxpFV3dEJn_-D5uYOQKtKuoycPYzZmr5zrLFQ>
 <xmx:OrNOXkI4qkSyJt-up88GxJgQrx9R4hWFiTO_5nyN1khkmoNwkq_0Yw>
 <xmx:OrNOXgATwjoHqwg-BG0_TStCtA6LDgv__wVfu7vOQBAhngVS84WdHg>
 <xmx:OrNOXv8r5rSgk8W6WuRudNSh6-SzIGwG4wHTwEDAf0_iKnMqtgz2MQ>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52B8D328005A;
 Thu, 20 Feb 2020 11:26:34 -0500 (EST)
Date: Thu, 20 Feb 2020 10:26:33 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
Message-ID: <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 05:05:09PM -0600, Joseph Reynolds wrote:
> On 2/17/20 4:29 PM, Joseph Reynolds wrote:

> > 6. (Bruce via email):=C2=A0 BMCWeb Cert valid for 10 years -
> > https://lists.ozlabs.org/pipermail/openbmc/2020-February/020488.html=C2=
=A0=E2=80=A8
>=20
> Change BMCweb=E2=80=99s default self-signed cert to a maximum of 825 days=
=2E=C2=A0
> Recommend 30 days.
>=20
> When this is done, if BMCWeb generates a self-signed cert, and it is not
> replaced, and the BMC=E2=80=99s time is sane, then browsers that connect =
to BMCWeb
> will start to complain after 30 days.
>=20
> The recovery is: The BMC admin should install a valid BMCWeb site identity
> cert, then clients can re-connect to the BMC. (This will serve the updated
> cert and make the browser happy.)
>=20
> The =E2=80=9CBMC Admin guide=E2=80=9D should talk about installing your o=
wn cert.
>=20
> See docs here: https://github.com/openbmc/bmcweb/#configuration
>=20
> Ass code here: https://github.com/openbmc/bmcweb/blob/91243c3b28b1df66e68=
2f5a3ee96341fdc516b5a/include/ssl_key_handler.hpp#L205
>=20
> Will there be a warning for the BMC admin (that the BMCWeb site cert will
> expire soon)?=C2=A0 (And don=E2=80=99t rely on a warning from the browser=
 itself.)

If I read this correctly, the side-effect of this proposed change is:

   - If I leave my BMC running for 30 days without it crashing, the
     certificate it presents will have become expired and no longer
     valid.

Is that true?  Can we put something into bmcweb to detect its own
certificate has expired and generate a new one?

I know self-signed certs aren't great, but the minute I have more than 6
systems I'm not going to want to follow some "BMC Admin Guide" to update
certificates by hand.  So we're effectively forcing everyone to develop
some kind of certificate management infrastructure, without providing
(or pointing to an existing) implementation.

--=20
Patrick Williams

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5OszkACgkQqwNHzC0A
wRkoLg/+J0fgF3RnHDYQRVb/i/o3sHK6bHM6OjaxZ1XTurzeg0hBlMZlB1lKvmLF
VylJeZq9jGIz0iGxy1wD7UxyW8dNTuhLGdQHWywlQ+7sVc5GP1tCok5YlvB7voG4
OwpHlGxKt6x6BekWpUw0v1urdqKEga67ZxCAL8fVdply2vcXLEY+oJ0Wb0gLqFmD
6LmkqwKB/Njoi4pUKuoWR/K9dk0D8F9jWmVXtMGSNyMvIRlcOqe7gM6SjZDdCzAy
B1ASVmOZQeLM5mQOTEi5dQv3rvGMqIIyw4eEGnkIGp5o/mxoCyltighHHHs2bNE9
7/ZiSL/l36WGRLidS1lE5leSF3UW2EuLpJjZvgNXMP8DCRObTJQZ0/HW9ToPEwWt
JrWJUHzpCpVDGpifmpBeNrNjhu3UY98Aszc1YenM3SLA8FtWlbvSZXmGgnQz8Ekq
nEBMNsQoQc5nHG2Ivd9FpJ9Pg/9tyRWGgDJVY+5GofcY1sYT+IpxatsGaywGSMQL
4Da3XU0PMWdP37DfqYBWU8q6Jfb6d9vC5dL8PadW2aVsm2kTDi9zlr14ThidzE7A
Dbzjql8fk4MzFHIffrgM4Xz+zUv6oVv7VpGk8HmP3+Vfgq6u0saXFmHLsmhqnxI3
gTT9IS7NIRHpKWtzGESLhG7CxHyAkiclsllHqoGjBT/YUdWDaGE=
=0cXE
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
