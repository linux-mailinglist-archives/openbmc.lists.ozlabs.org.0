Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F36F6142
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 00:23:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBWfy5Kvgz3bmH
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 08:23:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XDiHTnmQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Wo2q2bl9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XDiHTnmQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Wo2q2bl9;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBWfM1SfZz3bTJ
	for <openbmc@lists.ozlabs.org>; Thu,  4 May 2023 08:22:34 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 312FB3200915
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 18:22:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 May 2023 18:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683152550; x=1683238950; bh=oOTo/d5OqB6bB+bdonFm/iQUS
	MMDYIBnBB2gJz2WmII=; b=XDiHTnmQmaYQMMoytctJTHKDvjW6sBqxCgFZXUt24
	70VkKqBygIWea9NpuF1T7UmU6LznAlH1mc9DzZ0ZIeR4HCOLYKg1lkmyxbjFiUKt
	4LTlGJyudW1Fsip3w+kbnLoDtc46UTSEpP5opx+q4SBuOSVWxHeKnNEkonT8NT/Q
	i1VGagjk3RSb6nDMm9w6OxXbQIZb6ctCTYDGs2yHQ082n5IpNeXZltjuwMux6dHO
	gcfmil/h8BlhzO3T7N/GyHZjx7rrQDeVQwLtQgWr5QsfELeDXt56R+BnFkXX9BmG
	8NvlE3XbgHwJrLBiTvqQLmA5t9OMxwWfqYYaxRdL5SMMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683152550; x=1683238950; bh=oOTo/d5OqB6bB+bdonFm/iQUSMMDYIBnBB2
	gJz2WmII=; b=Wo2q2bl9kqMwfaN/ePnmjaXXlJY+goGEZE52h+hT6K240Pkkzg2
	u2yqgFzPK5LeWopW4ez1V35uVVtJ4mQM6m1x7AjF4inO/zuIkmARLWL3w+YzSKxn
	kvWobSjeXnp9hC5FA7Fdes7BbM5GUXIgJoV7iUMKgZSfJ80ow2NVfALthtqyJL87
	Z/+cpO/6cNUy5jVBEX1QUkIDWbPur6KAPWtQmtqO+ot+TbsQfkWique/DywIYT/b
	C+9aVOBQDE37BRTQhCIsIVLDxvargovdigVjq0YFEtk9FcY9Jy1F86N5Cl71KMts
	/BSCVaae6OMqOljmZw1hBpJU7AlykANTHaw==
X-ME-Sender: <xms:pt5SZDF_IWrPJLiZlmSgi5FIOAJ8uIPx1Y3Z4OSAdtinXlVdkv9UuQ>
    <xme:pt5SZAVKq0_UDodt0NUbP_2iV3In5u0SIsFWxeZrSgXoeuPTswvO9OPCwYuKFy4oa
    -dkTPG3AN5oYFibxNQ>
X-ME-Received: <xmr:pt5SZFJaa1opWZgXT5GK49FijCIBvkC6BLMy1EWBuWR4iGe2H-RTVAR1C2mvnCl0rTYf9sJVE9gXL21XkW9QY4USKxdSVLkZNqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvuffkgggtugesghdtroertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeeihfekheeuudejkeeivefhfffhtedu
    uddvheegjeeigefffeefgfejgffgveetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    dpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pt5SZBGNVpdIiHbXexRq0DWiFRB-aXKrU932nXeRuG85MyF9vW_aog>
    <xmx:pt5SZJUahzgVd3QVSZBcPAJZ1rkk8XXdkmHZlxwrlp0EyP0mbtjq4Q>
    <xmx:pt5SZMPLqqvePP6azn5_LLYl30tpASTHsQnk9H2M47Z6M0R0cucdyw>
    <xmx:pt5SZIDYiuX0LnBMgdHs4nhQRxMQ-mHnt1-i1qz2M9yKw7qbx7lm-Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 3 May 2023 18:22:30 -0400 (EDT)
Date: Wed, 3 May 2023 17:22:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: sdbusplus updates (client-bindings and namespace)
Message-ID: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a04aRqpjSQZk4Y/K"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--a04aRqpjSQZk4Y/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

TL;DR: I have two announcements of changes in sdbusplus:

    1. Async client bindings using C++20 coroutines are now available
       for experimentation.
    2. The namespace for server bindings has changed, but the old
       namespace is preserved for a period of ~6 months.

----

As part of developing the async client bindings, I fixed a mistake I
made in 2016, which was choosing a terrible convention for the
namespaces of the generated server bindings:

    Interface: xyz.openbmc_project.Object.Enable
    Old Class: sdbusplus::xyz::openbmc_project::Object::server::Enable
    New Class: sdbusplus::server::xyz::openbmc_project::object::Enable
    Client Class: sdbusplus::client::xyz::openbmc_project::object::Enable

There is a type alias, enabled by default, which provides backwards
compatibility for old code.  I will leave this in place for
approximately 6 months.  In order to test compiling your code without
this alias you can `-DSDBUSPP_REMOVE_DEPRECATED_NAMESPACE`.

I have developed a client-binding using C++20 co-routines.  I've
previously mentioned the implementation of the underlying support in=20
sdbusplus for co-routines[1,2] using the C++26 proposed "P2300
std::execution" implementation[3] but now `sdbus++` will generate a
`client.hpp` for any interface-YAML.  This is already hooked up in
phosphor-dbus-interfaces and ready for experimentation.

Some interesting code:
    - An example client application[4] to go with the example server[5].
    - The generated client.hpp[6] for `net.poettering.Calculator`[7].
    - A class[8] to combine multiple client-proxies into a single instance,
      which is the client analog of `sdbusplus::server::object_t`.

Next steps:

    - Probably some bug fixes as other eyes start using this.

    - Implement something like `async-server.hpp` to create async server
      bindings to go along with the clients, which will allow a fully
      async daemon without Boost (and with a lot cleaner code than ASIO
      callbacks).

    - Add the opposite of `throw
      sdbusplus::xyz::openbmc_project::Common::Error::NotAllowed()` in
      the client bindings to turn an exception on the server side back
      into an identical exception on the client.

    - Add some kind of functions in the client bindings that generate
      `sdbusplus::async::match` instances for `co_await` on a signal.

    - Figure out a migration path for Boost ASIO such that
      `sdbusplus::asio::connection` holds an `sdbusplus::async::context`
      and code can be piecemeal refactored to C++ co-routines.

As always, please reach out if you have questions or run into trouble!

[1]: https://lore.kernel.org/openbmc/YaPzMYi%2FUHwvEiGf@heinlein/
[2]: https://lore.kernel.org/openbmc/Y9fgEdigX0aTiM0d@heinlein.taila677.ts.=
net/
[3]: https://github.com/NVIDIA/stdexec
[4]: https://github.com/openbmc/sdbusplus/blob/master/example/calculator-cl=
ient.cpp
[5]: https://github.com/openbmc/sdbusplus/blob/master/example/calculator-se=
rver.cpp
[6]: https://gist.github.com/williamspatrick/a4ffa6bc9154d5fe460d46c1654c04=
bf
[7]: https://github.com/openbmc/sdbusplus/blob/master/example/yaml/net/poet=
tering/Calculator.interface.yaml
[8]: https://github.com/openbmc/sdbusplus/blob/master/include/sdbusplus/asy=
nc/client.hpp

--=20
Patrick Williams

--a04aRqpjSQZk4Y/K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRS3qMACgkQqwNHzC0A
wRmTWhAAmn5o95/8gocGC2L/VK20Vd5KwcpCsRa7JFggq1Cc8QiAPPUMzAdvjHde
P6sXEm0n1v4YLI9t3MMjGhthOHYfXLw+UO1dxUJpdnCKz0Rw7fS5lA5vtnABOtQ8
ucMZ8t/1FTbgc/KPEv9Ug6DukxnnxE6vsjDqQ9T96/83h5eV7FOBenluaMcpv2vm
X6zc9NvVCG74bv1iRQlUsSaT8sTdpiLPnpY6RTxk7S2W8RaXSqvMmGWBcV/crmf/
TtnmMkI4U57DuYpfUIfVgUBN67IfA2fOx/jTS9BMIzkKFUF7JWcPqpEsVCl75r0f
G7NCQs7Pba6NqhNZaCRAiTPWYj6fhP95VyYeDvCkeucrj7XIiDU0xtPPCtrpRaMK
U71aFu8+IIVoNAcyt4R3whcryV1n5ruahymi5+NBoIG1jfQJUKNCQdZmZvhL36VA
AO9CqZQ4JwcSj1rJH1xHqdt57i/nmI5lfNexWSH0J1A6CbFz4Q4OV/2wubaTvZAf
strJ7az5OT5EG9BiCtv/RwD0UqgHaRON8x67KlsxwEGNsGZueptT8/ojH7fSMyBe
R97anKi0qKwkTS0CNQnPIbYRe/PDSxAatysZxoFbLZ7c0ZXW394VL6cL26i8izNK
hK7ZCcQYJYmKNQQWKRvyh73gxeUSxYm++AbH5mKPECuWl40zy30=
=9yny
-----END PGP SIGNATURE-----

--a04aRqpjSQZk4Y/K--
