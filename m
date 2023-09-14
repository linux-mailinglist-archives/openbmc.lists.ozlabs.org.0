Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D479FC20
	for <lists+openbmc@lfdr.de>; Thu, 14 Sep 2023 08:37:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=QhEZximW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DANMI1kP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmSKf4Cczz3dPs
	for <lists+openbmc@lfdr.de>; Thu, 14 Sep 2023 16:37:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=QhEZximW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DANMI1kP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmSJx5ys8z2xm4
	for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2023 16:36:32 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 498C0320095B
	for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2023 02:36:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 14 Sep 2023 02:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1694673387; x=1694759787; bh=btXaAXOHx05Wk5YEc/DwV3+oU
	LvMDF1HxUU1kQcvxMM=; b=QhEZximWg7MagxSasGd6uGPy9CZ2LwrwUK7tbS9p9
	odJMA64zSdfXsoTlUA0TM3+jLIDjulZqCzNm3pOtJoAbFFHJrRYN2YkptU94pudM
	ek0C9e7x48Cy3YegJYcUaZYIVxE2QMtqCx3mURPm5PnX27n4+h7MqEecTgjEq4H0
	dBJqsM66s31ObaVVMy+s91P/zWEfuMlXwdJsn7j0Glv1q2FfLakxEuIQbpZOVDWp
	7mZ+9PYMo375FeLogITeZLvQ7gAfrb9wso0aeC5L9HxR/3d6IKz8JcurfkSzf8Xl
	lfpe4/UfEr1JruD79mtZHuC1VyxFVBMD2RZS8TB92wvmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1694673387; x=1694759787; bh=btXaAXOHx05Wk5YEc/DwV3+oULvMDF1HxUU
	1kQcvxMM=; b=DANMI1kP+4tVeXcZw7Mg+nmH2yGT3fKgnzzS54PbVlsU7H/qEw/
	NfWXEn4YfRDlvUX/rYit9cTEq16li6gmZYgBzc977+eN8qXpGsSq/xBiAWrolwfM
	SzwwgIljzTe6aw7v1eI+L2hEvd05u/BePgdMGCq9FKd914XN7Df17JT3LwT6rN8k
	BHEX0xcBq794Ztd1y8EbR1xAQpik4Fc5YtP7vAzJsTMCeFyJJIo0GFkNe5PKEFLM
	eudakWU9roGPsBFXm5uD76sE4mcHIqpp/YOy1YkqyWLiLz4jm8kSgU/NUmJmIhnq
	DGR4FGMhZEWN2kasPywTi8Ke6FJAKDOz7PA==
X-ME-Sender: <xms:66kCZUp3b5xVURle3G-hvgIStHPcdP3fX0nwhXzI6XZgAuNDv2kMoQ>
    <xme:66kCZapi0CymXO-ZybwfYZa3ubyam_ys81J_TeD_rDjqClRIfgZkwWUicPFPDUMcn
    1-lp_1_HQW8f59HdA8>
X-ME-Received: <xmr:66kCZZMWd6VR4DvEzsRBz1PPiwMg5JPs6PecXWd3JdUrtxt0plK6KcA5t0yNtNCba-BCEY8XuLE3IBGEbfdEKksT1fM1Jh6e93U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeiledguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddujedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfelgfeggeffgeelvdfgueektddu
    heehgeduudfhffelkedutdevheeuveejieenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:66kCZb4aZAAf4nbdcKGggZKGB3J7h2_JHlU9MQuDd_S92YI7ai98tQ>
    <xmx:66kCZT7bEcJBnJt_flnUhImS5HI5jX163OQDMTk4L6HpfmzFIGJYSg>
    <xmx:66kCZbipog5ore279vbUYoXz6Rc5l3lsGy9q1i2nMautJJiQvRK8dw>
    <xmx:66kCZcWAenyZQzBXdH0wz6fiPBGyFmbOOU38PJFmb9FtnRTQHxTUEw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2023 02:36:27 -0400 (EDT)
Date: Thu, 14 Sep 2023 01:36:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Towards less magic strings.
Message-ID: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pZfRZWx5clW3y2Nw"
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


--pZfRZWx5clW3y2Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

One annoyance of mine has been the large proliferation of magic strings
related to dbus.  By a few simple calculations, it appears that we have
somewhere between 670 and 4200 instances of "xyz.openbmc_project" or
"/xyz/openbmc_project" sprinkled through the codebase:

```
$ find -type f -name "*.[ch]pp" -exec grep '"/\?xyz.openbmc_project' {} + |=
 grep -v build | grep -v subprojects | grep -v .ccls-cache | wc
   4161   13869  465728
```

https://github.com/search?q=3Dorg%3Aopenbmc+%2F%22%28%5C%2F%29%3Fxyz.openbm=
c_project%2F+language%3AC%2B%2B&type=3Dcode

When I look at these, the vast majority of them falls into 1 of 4
different reasons:
    - A well-known service name.
    - A well-known path (or path prefix).
    - An interface name.
    - An enumeration value.

Today I merged support in the dbus YAML[1,2] to cover the first two
cases.  The other two cases have long been covered by the dbus YAML.
Thus, at this point, the vast majority of these magic strings can be
eliminated and derived from constants that show up in the
phosphor-dbus-interfaces headers.  I think it would be great if we
could see some refactoring towards eliminating these magics.

Below is a "howto" on each of these string types.

## Interface names

The interface xyz.openbmc_project.Foo.Bar has a number of header
files which are generated:
    - xyz/openbmc_project/Foo/Bar/common.hpp
    - xyz/openbmc_project/Foo/Bar/client.hpp
    - xyz/openbmc_project/Foo/Bar/server.hpp
    - xyz/openbmc_project/Foo/Bar/aserver.hpp

These headers will give you the constant:

    sdbusplus::common::xyz::openbmc_project::foo::Bar::interface

Any of the non-common headers also alias this into their own
namespace/types as appropriate.  Eg.

    sdbusplus::server::xyz::openbmc_project::foo::Bar::interface

## Enumeration values.

Any enumeration xyz.openbmc_project.Foo.Bar.Baz.{Value1, Value2} has
an `enum class Baz` defined in all the same header files.

    - xyz/openbmc_project/Foo/Bar/common.hpp

This enum class is intended to be used in your C++ code rather than
strings.  sdbusplus already has automatic conversion to/from the C++
enum-class and dbus-strings.  If for some reason (rare, but maybe for
serialization to a file) you want to explicitly do one of these
conversions, `sdbusplus::message::convert_to_string` and
`sdbusplus::message::convert_from_string` are what you should use.

## Service Names

I think it should be rare that you need a hard-coded service name in
your code, since typically you'll want to do some kind of mapper lookup
(based on the interface constants mentioned above).  There are a few
cases where we use explicit service names, such as mapper itself.
The [1] commit mentioned above documents a way to add these to the YAML.

Typically I expect to see a new YAML entry in Foo.Bar:

```yaml
service_names:
    default: xyz.openbmc_project.Foo.BarService
```

This will create `xyz::openbmc_project::foo::Bar::default_service`
constant.

If you have multiple services you want documented, the YAML and
generator supports that, but I'll be somewhat surprised to see any.

## Paths

Similar to the service names, we sometimes have static paths.  There are
3 classifications of these in my mind:

    - An explicit path to a singleton instance (typically called the
      "manager").
    - A path prefix to a collection of objects (I call this the
      "namespace").  You see this in logging, sensors, etc.
    - A path segment used to identify a purpose for a particular
      instance.

All 3 of these are now supported by the generator, with similar YAML:

```yaml
paths:
    - instance: /xyz/openbmc_project/Foo/Manager
    - namespace: /xyz/openbmc_project/Foo
      segments:
        - name: Bar
        - name: Baz
```

This will create the following constants:

- sdbusplus::common::xyz::openbmc_project::Foo::instance_path
- sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::value
- sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::bar
- sdbusplus::common::xyz::openbmc_project::Foo::namespace_path::baz

---

Hopefully these are useful and we can start to work towards eliminating
the vast majority of the magic-strings.  Please reach out if you'd like
more details or if something is not working correctly (I already fixed
one oversight while writing this email[3]).

[1]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66364
[2]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66429
[3]: https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/66597

--=20
Patrick Williams

--pZfRZWx5clW3y2Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUCqecACgkQqwNHzC0A
wRnnuw//U7gByts50VHw2LEFHgpAh2eZrtV2lFxWAF55MFbEA7uziJ+hw2E1KQWW
CJ2FyTIzzkyXUCVQp9R2iY4HWbxfsYduCVUhLsBTxgO6xzFbqSlsLD0YcepDKaUj
8t+ac5XUI7QFfHKUEwH/nf6wsAKu/GW1vMKuwoWJeEziiaGmzuxBEPmHTTduSydg
mEcx4q1XPXg0Ly5bhxbLV63YbJntXLz4x3vbWlpaZsIvbYHWjv5yTyNrNnX4wkm2
S/2FBZ8b5A26H2qFWL5XXhVCue1mZGD0Yu+dzCatVa64LxfvjxNXDUcF7sd+qPti
CN7aBlqGXT9jA4PoJ7lF1i6cmtQ6+axM1h6wTluInl+U8c/FoDMULE7G7SCBDVAa
ml7kMPW0sW0jz7m+BJD+gLgECCy1vLbnFNEkybtYELYkfH1DxNlEfm544OnNdW3X
i1ckZYZJP846A9+0Qe0vAiYkDF3Nox1jfGkOvy31HA7aKNOsuUB0yrcWw7k5VgSt
9tVpfRQHdYA2JOuAjXElaIXj8zzFuOg0gUXlnsCWT2EgkGUkhuIegesb7sOm9sE6
44zc0EDarzK0xudDr06IPp3un9z2SKbKmkyaYXWF9OcVfMrXdJ7Y+fdZlu+sT6Xd
PphWtXJDts0rSJaBb1/ofYPuxCBgHJlydjK6ct2eTsoJdfx4o14=
=WoaJ
-----END PGP SIGNATURE-----

--pZfRZWx5clW3y2Nw--
