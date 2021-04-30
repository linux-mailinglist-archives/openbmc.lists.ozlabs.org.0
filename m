Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCE370262
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 22:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX4F968Y6z301W
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 06:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=cfigE24/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UU2uTdd/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=cfigE24/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UU2uTdd/; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX4Dx4TC4z2yZ2
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 06:47:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 60D141CBF;
 Fri, 30 Apr 2021 16:47:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 16:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=bHF290OXvk5tRkVcIvlBZzX4GlI
 GO5p/e3HIDVPJqrA=; b=cfigE24/s7uoEy7rxyGQbw3FCZAByaa2bYQeeh89DYv
 jNFE1K3QBIbk16mIQS8vI6PESs0Xx3gIWgk7/PZPXwRy7Gpb1AnQ09FhiS4KzdgX
 jHKSN0fGjuowE9lc8ra5ObZP6H9WzsWllhQpLBjVF5Uy21grlvR7wj7juBkY4iql
 hfsh3Y2FOrcCObFsv7JNIOb0tPjVykmA5qskNMnDiER0siKgATt7nKc6X6wN9PHr
 p+caJ4A0PM88w6J7WvN7glUAeY+4iV/XiHoVNRgjGdEXEq6AZzQhtpo/ySzY1F8h
 HKPHh+RuPlS8e3JFfBAtqLuadQZjVqsj2x5GQiqlf0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bHF290
 OXvk5tRkVcIvlBZzX4GlIGO5p/e3HIDVPJqrA=; b=UU2uTdd/xlYn0BS4nNnr54
 QqVZqc3vhy9E0t0V+7VdBOsXwZ7rbAWv4k+mX0iSgBBZoe1oj21bBe+GKkqXHstH
 +V8iAu0ege+iWsHjhAMuQKY+1ZYWSnFUKaAAnu0x/9SoYAl8cK9fWBIwQyueM0IC
 3OszK5uPjR11BUnzN9HzBOfskjves4iIGoDwqcYgY8DpNrq42fJmpzRU6bJ3dLgG
 e8mOxPVNrwRNuJyrMTgl9yItuVXHmk99KsnllfC5JUYp8norBimRZBi+u9QtKJl3
 dUFcsiHf2v4ZvoDG7UccciQ0FlXvyRMkUi9Bzy682sOVAzLTTmpWH3qJfTCudiYQ
 ==
X-ME-Sender: <xms:3myMYEeaEweqSAJqGaofSWcUaBXS9XN0wwji4soU6PNoKCfZe2zD3Q>
 <xme:3myMYGOWXrNkP6UO875CKav2u9SBdC37vsLSUWnk8LjqeT5nREHrg9nBa4g5CmgbY
 W4b0z0Z9vpLz_07eVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedruddtjedrudekge
 drgeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:3myMYFhSB8-hh3vHcO1WnhOR8l995V5bxsv4m7rGFMqmICujJ1WXfQ>
 <xmx:3myMYJ-LHDjUuXvJc8PPe6ACf8XBS7jUOBEPdoHZHac1m4kiZg_cCg>
 <xmx:3myMYAsRcF7I4AyFYNED4a0xpBUYrhYR87Flk6TZp0rx0hyedi5scA>
 <xmx:32yMYJ4SrIcZDb8QIHiVVZeHExELpltE5qWWDQ3b6CmhQgKJamr0Eg>
Received: from localhost (mobile-107-107-184-46.mycingular.net
 [107.107.184.46]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 16:47:26 -0400 (EDT)
Date: Fri, 30 Apr 2021 15:47:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jason Ling <jasonling@google.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Message-ID: <YIxs3WRvvOujqmNB@heinlein>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
 <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
 <CAHBbfcVBH803ADi0+Xm-0MT5TfOtDPD1TLU0rXzdKmz-=-5Uuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3/Ko0T8NqsBFo8LU"
Content-Disposition: inline
In-Reply-To: <CAHBbfcVBH803ADi0+Xm-0MT5TfOtDPD1TLU0rXzdKmz-=-5Uuw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3/Ko0T8NqsBFo8LU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 08:53:27AM -0700, Jason Ling wrote:
> Yup, this definitely isn't pleasant but it's doable. Have you had
> experiences where unbinding/binding caused lots of pain? The only pain th=
at
> I've seen is that telemetry daemons generally don't take well to having
> hwmon sysfs attributes yanked from underneath them.

Yes, our current hwmon daemons don't take kindly to the device being
pulled out from underneath them.  That's the big concern.

On top of that, other daemons that consume those sensor readings don't
really like the sensor going away either.

> Just spitballing.. but for devices that need to be upgradeable *and* need
> to report telemetry, that such things should be done in a single service
> and perhaps it makes the most sense to do it all in userspace (to avoid
> ugly unbinding/binding).

This is not ideal to me, if I'm understanding what you wrote correctly.
It means that any PMBus device for which we want to do upgrade we won't
be using the pmbus+hwmon subsystem but instead have to rewrite it all
ourselves in userspace.

My top preference would be to work with upstream about supporting field
upgrade on devices.  Second would be to figure out how to safely
bind/unbind.  Reimplenting what the kernel already has and we already
leverage should be way down our preference list.

--=20
Patrick Williams

--3/Ko0T8NqsBFo8LU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMbN0ACgkQqwNHzC0A
wRnlwg/+IwPHVlNhybl9dV/8zXpMGSkNVSecMTiAooCfxqVi7JZHZwZICHhN3JvD
DJQTYpmy+cbfZc+eRR4D41Ejg72wcdnoe+dtvrOkNQlNIpRV8q3K39Ysq4PPoaqh
3AWNCUP+0nIvWeQiZedU6ELWH0Agzsy+NbFOxaczgteLiyO+S3itUcXlYU8WvgvW
YySYtXPgCtWvz08P3ygN5USo7/1Tp4q7oFu0K9wTnRL+YlRvUMnh3QD4MeiaZbv9
/sS/SfhUhIalQ75OqFFpWlkf7VNl0OpkZuJqJ9vmPPJxNhZDFnott57toX89z/fb
vhgV8UK/6vVeTztiSg+M8HFrNaCT2+VAx1hjeFH7sTOf7Y+H1QXwFaWiBnW1fcgI
1fLYmHJfRRJKm5yx3gDdYQ3Bs8mSiaA5hC+z6/dKrCLG4u01xnaYdRgeqZ9MjIq7
OTo0WcWldsV1oQttFM7rteajpKHIgqboqSQtpfqlmneOoJsHSDvbr8sIwosMmY8F
5r4ocNb+Q8cJuz71u2x/csloSVuCZ25jXPTkg+Iaa0d/u9rivh8vfzGvZ4+dO34o
1reEh1sk8MVSBKtyXDwFMD3cFUUdOLhQ+aW5n6mQeXDhZJdH2oEF4raRI8dAC2Ad
v4HPeN06DlQbbUtAJzyFpQ68OFaAGODwecoq/cvAXY8c8b8KMKM=
=7T37
-----END PGP SIGNATURE-----

--3/Ko0T8NqsBFo8LU--
