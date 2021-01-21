Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9522FEAB0
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 13:53:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM2PF5JHrzDqWn
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 23:53:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qNIngkuS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OuPj5CU9; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM2Gh4kvzzDqD0
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 23:47:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 85CB85C0186;
 Thu, 21 Jan 2021 07:47:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Jan 2021 07:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6GkBvjnOwnekxuNW6X1EOgsmERI
 VYx7kAkoFEIc9l+s=; b=qNIngkuSwLfkYqlfZ90mLuppQFLVtb/naqPwl6mCmBs
 KWlKv8e1QpJjDP/iGc4uRExbP8Qy4ylin+DjrBp8dzJvbo1/jiZ95IePpXgAYuqf
 5iydYxKwSNS4bTZhLHDP8hggpEg2D69mpiNDdiQgZdDhYrUZxnGuO4Nmq7WJ6qgk
 T7k+WmQ8PyPcAfNv0dyHluWC7rKdQGe6l7suHGFWkdaYVbCWb9Y9AG2akkvKW4F6
 i84+SlSjCVY7l2t0UBntO57Ea28F7oRgSLfRPKZG9UkaGcja/RFyrMCW++Ef5xKA
 x4zhSN8fJf/hdJpKVW62C1MoAiEXr9ss31YtTpflo4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6GkBvj
 nOwnekxuNW6X1EOgsmERIVYx7kAkoFEIc9l+s=; b=OuPj5CU9lfnRyEXkDuEHff
 uijtMqK06gNMi0tKWtErXZnPfYoYEjQTOgcwTjAvdCXlVoM+THQPLAoWgkE79gpg
 ayn3oUnq5WMexTMxBzdFGpWTZ0pP7jbqxRaOOuWdUyJ73KTlfoUkzAGvNjfgD21U
 hdTFXEdUfQXfrs2TG4EEnQfgi+jzsvmdBf5ka2kYMM3f+vG5BZF16C6uWicuBF9e
 X6HEkgIX7onH9BHt5DvbaG97euP3AIFlwEmIS0sJUgphFj7dl5qmwkNeD9pW+DOw
 +wracQsY6K7IlN208Akq1VIj4uQojvUnv+F1GJbeKGxxkQsTg3EpmO8FSthjOHCQ
 ==
X-ME-Sender: <xms:2ncJYAhbpGBZgm4hJI6ofFvXHj3okTKls4kcAlKL2mVpp0wKk0qyyQ>
 <xme:2ncJYJAOGvOUu94oqZhDECjzoejpFr1IuPZunnPiJleoJyMAgR12CjFwOlBI4H8f0
 Ut_OuqlU22PyO-VpeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegfeffueduueehudfhkedtgfefvdef
 kefftdeliedvffeiuedufffgtdevffevheenucffohhmrghinhepughmthhfrdhorhhgpd
 hgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:2ncJYIHrTS9VxeGBXytq32T5q4ugN5bVBvOaYp7JTOU2CeAgvpVutw>
 <xmx:2ncJYBSYkmOQUCiLxhBw-IsETCngOFiqgMJLqBk6od9dsgzPH_60cQ>
 <xmx:2ncJYNx8wOCjm7Lvp8UXXxLW4tzyZvuPcM7gOqChlYuCaC-2SPhvww>
 <xmx:2ncJYGuD-3_QSZP8bqJgq_iawQlDg483A6hJq9CMNZaEyq5E4Bdrkw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1FCC24005E;
 Thu, 21 Jan 2021 07:47:21 -0500 (EST)
Date: Thu, 21 Jan 2021 06:47:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Subject: Re: Discrete Sensors in OpenBMC
Message-ID: <YAl32I0oGFi5i7Cl@heinlein>
References: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="316FYYkeWbInux8E"
Content-Disposition: inline
In-Reply-To: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--316FYYkeWbInux8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 03:22:41PM +0100, Wludzik, Jozef wrote:
> Does anyone use or implement discrete sensor in OpenBMC? Redfish defines=
=20
> discrete triggers that use discrete values to detect that threshold is=20
> crossed and trigger action should be commited. Redfish does not mention=
=20
> about discrete sensor/values in other topics/schemes than Telemetry=20
> (e.g. MetricDefinition, MetricReportDefinition and MetricReport). I am=20
> asking about it because we are trying to find an example of discrete=20
> sensor to proceed with DiscreteTriggers implementation (aka Discrete=20
> thresholds) from Triggers scheme.
>=20
> Ref.:
>=20
> Redfish Telemetry White Paper -=20
> https://www.dmtf.org/sites/default/files/standards/documents/DSP2051_1.0.=
0.pdf
>=20
> Thanks,
> Jozef
>=20

My impression is that IPMI called a lot of things "sensors" which were
not really hardware sensors and they often became a discrete sensor.  So
far we haven't had any real hardware sensors that are discrete.  All of
the Sensor definitions are in phosphor-dbus-interfaces[1].

There seems to be a bit of a throwback to IPMI terminology here though
with Redfish Telemetry.  For telemetry it could be very useful to keep
track of things which are indeed discrete (but not really a "sensor").
For example, log-in attempts might be something useful to insert into
telemetry but have a discrete component ("successful", "failed").  For
cases like this, we wouldn't have them under the Sensors namespace in
dbus but whereever is relevant to their domain.  I think you could find
a lot of data out in various namespaces which might be interesting to
place into telemetry but are not "sensors".

1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Sensor

--=20
Patrick Williams

--316FYYkeWbInux8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAJd9gACgkQqwNHzC0A
wRluQg/8DM0mxMcVmIJUW92vwTtWbWvRzJGkrqjcrEmNnwKJnZBKW/8+nZYU8iUW
2jdEfweMAx5nYFIqmXEr6ZQOHpJE4B4coQ9NvgzsWLPnVUFhEWoJ2vRRSjPULSmd
XlJ/2LMjhYDSmduipOgvoGjxgEb/F2KJDP+i3XFgRcQtIV4h6ZW+pAWrh7FVFO63
W9GD92ppL4iX35UXFn50LNIrDhQLuswYc5m5JBEjEQ2zGz1S7diihytAbVzoaQIt
UMZ5F4hU30RERF3G8EsNtreGDL+v5J+K3rFzkkFoS2RcotP2MB5gsOqrhjXNMy+V
grFgXq7fnOXiNTC2SeUJi1CDaFgCUYfoiU5w3oPbVKxneNO/VhKP7GYrh0OL8emn
NoQ+O6Fy090ntocmVrf1qfJaqdz+5/uY1L1fTwhOmMrqcYqxs0YjTK93fq90I5fi
IaayaPd3ASRvKREJZfNdck+HTBPA3sY98H02WLM7sW3l0gW1kLeniYBRM/IOZGhG
/Sgpp6TRCTA3/Kfqrq8P6mL/qsjjs585BjU3XyQrmnzFhYIA3TutMinrlf0CVpZL
nKPX4ka+sulQ//259Is33byMFlRpa8f8F0JohcgeufQpIF19lAs/dGr1DL4MFhLf
+/cf1XMbq4y+H6DkaeMU691G/vcI6ndIg7ojTfMbqDLcO/KpP1M=
=1Zp/
-----END PGP SIGNATURE-----

--316FYYkeWbInux8E--
