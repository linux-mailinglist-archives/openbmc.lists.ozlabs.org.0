Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229C6F9B8E
	for <lists+openbmc@lfdr.de>; Sun,  7 May 2023 22:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDx8g6tjTz3c9V
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 06:38:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WDzYdeAe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=crgRPowG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WDzYdeAe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=crgRPowG;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QDx811TfSz3bl6
	for <openbmc@lists.ozlabs.org>; Mon,  8 May 2023 06:38:07 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 950B75C00D4;
	Sun,  7 May 2023 16:38:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 07 May 2023 16:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683491881; x=1683578281; bh=CQ
	YKLT07AGgXU6SvA/SM4EXoxFEmF+PPG53P53uRteg=; b=WDzYdeAevB+HKZNB/R
	v8+4GlhtLl3o2vCthM/f8WVSc7H17CXGdizavFG/sPzKm5cjJJ2SHDTseQgG8+tX
	woQZOC97ksarqMquhApZ+t7AeYqhIy4vIFtMN203OMVzLf4eYfZsQ/KxNA/fotMn
	O53X0MIPBcKAktoVtiTT4l/nwgYHXKNn1ZDaTSm1XdmY7ExLZ6c/WTwX4WRp34nA
	MHhLdMXIbFXB+GBWTknzZMqwgeUgaG+pDGXH0wOd6I9nIi+yauOhQvGG8Wjed76J
	icWCAjW/0k1WlTaNYmD2lD4pBaFsoAQUDI/nklMi7MM+n+FBbBsqW1t3pxS97eYQ
	Kt7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683491881; x=1683578281; bh=CQYKLT07AGgXU
	6SvA/SM4EXoxFEmF+PPG53P53uRteg=; b=crgRPowGRtzJv4aoGQZek6q/Ge6Ot
	9dg9yjT+QSGdxy1T238riPQpT18tH0knuQn+TcX5PChRtXm5GzjVwASIx0NdvGLJ
	tZlk8mRFSCf8oGKweU8eR/K1pQtP58jYX4NX6flsQb48e07PMiAK7F9IAGGkQWii
	1tcaIe0pJcfC5mE8n1dD4vnETX3Ri8fGpS8/YY3XK6YBp5rm6IiDE1KwtWcryo3y
	vBiQ8kMFbtyBJGsMEDAsQqJ4gKhnG2qLoSQLAULmfXu5NWa7o6gbMy8cMz1StaEM
	a/VPzGSh2NOQn82f/xCxZcYqXjgxA8vegLZ80rqw1IfFnN8yOMTF457GA==
X-ME-Sender: <xms:KAxYZN2HerIR54S7jMY1N-xqyEKpRPN7faXHFHLzYa7kNO--hORMyQ>
    <xme:KAxYZEGD7kEbzQ6i6OG2GVf4ZiEhrjQXafaQCQQx1cWWJwFDtO6FtacK4i7oPRUdb
    QTAZFD7gIQVddyvdDE>
X-ME-Received: <xmr:KAxYZN6gxrHkk302npy_bgjUYK1DuS_PzHlsnicjBG7k3f5KRXSirzDbWcsQGkR2K8w_06qZRzIf700Iz7-7l-dbKXpdbBxupIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefiedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvddtjeeuffefteduteejteet
    tdehheffveehgffgueetgefftdetffejfeelheeunecuffhomhgrihhnpehgihhthhhusg
    drtghomhdptghpphdqshhthihlvgdqrghnugdqtghonhhvvghnthhiohhnshdrmhgunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KAxYZK1epTtQ3Hw2lraJ5P6SZbGRo-9sl6HrtAmc7DCGcAO9HobWHQ>
    <xmx:KAxYZAGCOILhqYgaSg6gnrNQxeCc2dxCqn7lpdIRiJMWbMkVroITLw>
    <xmx:KAxYZL_crm6K0IYponIX276-fiSfhxd-hosP8FU4xzEH_ftiEB95qQ>
    <xmx:KQxYZLO755KPK0v791K0PvmC7pC8ZIPOMWMpjeiZt3vXELKKT6ixMA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 May 2023 16:38:00 -0400 (EDT)
Date: Sun, 7 May 2023 15:37:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: sdbusplus updates (client-bindings and namespace)
Message-ID: <ZFgMJz51IVKzo5IJ@heinlein.vulture-banana.ts.net>
References: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
 <CAGm54UF=8EWwzC0ZONoYFjHV2RagGyNocX3Ob-ftaYACpG9n9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jYKUGEtse7lTBzXP"
Content-Disposition: inline
In-Reply-To: <CAGm54UF=8EWwzC0ZONoYFjHV2RagGyNocX3Ob-ftaYACpG9n9Q@mail.gmail.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jYKUGEtse7lTBzXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 05:09:53PM +0800, Lei Yu wrote:
> On Thu, May 4, 2023 at 6:23=E2=80=AFAM Patrick Williams <patrick@stwcx.xy=
z> wrote:

> >     Interface: xyz.openbmc_project.Object.Enable
> >     Old Class: sdbusplus::xyz::openbmc_project::Object::server::Enable
> >     New Class: sdbusplus::server::xyz::openbmc_project::object::Enable
> >     Client Class: sdbusplus::client::xyz::openbmc_project::object::Enab=
le
>=20
> The previous class was using `Object` but now with the new namespace
> it becomes `object`, is it intended about the upper-case `O` becoming
> the lower-case `o`?
> If yes, why the `Enable` still kept the upper-case `E`?
> Do we have a rule that all the strings other than the last part should
> be lower-case?

Yes, this was intentional.

The older namespace code did not apply an explicit style to the
namespace or server but just used the portions of the interface name.
We happen to name interfaces in UpperCamelCase.  With the `server` near
the end, there was no name-identifier collision between:

    * ...Foo -> ...::server::Foo
    * ...Foo.Create -> ...::Foo::server::Create

By putting the `server` near the beginning you end up with:

    * ...Foo -> server::...::Foo
    * ...Foo.Create -> server::...::Foo::Create

This causes a collision because `server::...::Foo` is both a namespace
and a classname.

The project C++ style guide states[1]:

    * Structs, classes, enums, and typed template parameters should all be =
in
      UpperCamelCase.
    * Namespaces should be lower_snake_case.

In order to satisfy both the namespace/classname collision problem when
dealing with nested interface names and to closer align with the C++
style guide we have documented, I explicitly use the lower_snake_case
on the namespace portions and UpperCameCase on the classname portion.

[1]: https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.=
md

--=20
Patrick Williams

--jYKUGEtse7lTBzXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRYDCUACgkQqwNHzC0A
wRmr5w/+MlNgx5zOk3LaGstdikrMymAQMIsWr4KBUcbM7mypteukXaN1L27NzHwq
SKVDPGiZBFeSVfZXKvlED5mfWLi2AlJ6pDurrBJZZvDiWas8RNK6QoSbD8kFJpCk
eoGHAcz71kmbJZrpnV42ummQXo2qZHvmE+I667jxqPA05BUhzDVzvf+b7hELEM6D
Ay6oTMJ2W+3GmviH9zd+VtWGvHY+f9Bz5QJgsukNXAzHRt9z3ROpAPje65AfaPQj
Vp9iqPJKFAC6Xj7mIXzIMMcO5X42RjHc4MXtSSsVFt8Rya5VIMLZARPTRy4Ljng8
KA9cuhKE+sAkTRDKMvmOGQZN21gCJ4L1rvCmmO2YYi17zygF7rHCeoCrBjAep55z
tNAl2/OZJTrox/E6+d8SlAxkT25DmfEx+sg0QeQeFBcEIWRouVKewIPPkJN6Wfh8
o0cZbPt1JpCBFWqqYaXFWpoz8hgj7m9X5voaDtyiRYnGmgUj9d0pRCHataLD18iU
FStm12JHix9wM9KhwykFV66WHyQ838AVpo17dcMpQOgev4QcZdEk0DAPVn4xMTG9
l3Ib8XMJOm/EomRzvjeRkPz0cF9hnsXJCUhjx0DKzbXKLcLrj2NUpdiiZ4iTZyCs
1Zy8xFKIYvD+ghnzNSWxDkkGpiQSnd3cvzhaaHGN/tyyBuh6jcM=
=Tykw
-----END PGP SIGNATURE-----

--jYKUGEtse7lTBzXP--
