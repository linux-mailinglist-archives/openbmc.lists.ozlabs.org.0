Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C01979C22
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 09:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6cHh5Wn9z3cCK
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 17:39:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726472365;
	cv=none; b=UZoA+V3Ru5PicULtrF5+aA2yN+gJ5G9tGpq9QKRApEPhnZtp8YvS9bZRTmBhljZFaLGz5skTOdMOfIOrzIkES5C7Dsn8rxf1y8MqtcdjOPShIAFgQ2ywMXBlcDCZ1Pw/m4qfEGF/os+CfOm1F4h8XDX74K4bX8LWdWr4B5EPDRIC41vKbx8YUArIgOyMK9J8yJg9XeS3s+YSWxcjT+IfUiT5LbTvDTUfyFaRDag4b5oZnBmEuD/bR7UStFlRortgyS6UZivhkCx0FeHBWISGvI9SMBARTs4edjXgrkl3M394sKuRj4x6/+2/muJC+vDl/TZaxZqjzuQfodBERXRpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726472365; c=relaxed/relaxed;
	bh=kQnXOVlyk9Y2rt+2zkkuyo0HpY0EVL+/gFIUH7R4kcc=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=lolQLQf97WnXviGsYUVZn3v2DFTkVP2HhDV0SnJUpCOt7WJ8jeEqFGm3UPfbd6kT51SffuKRVS2SjhFjNV34mDsc4Mfjo1gsgSLvZF91Z5W6JKz6JRqsh/46QeHULfhQBLeou4JrZmKOJny2wrdqBIJOYn3HfEyeWgM+h6XsYrMIuCugiJ8XrPV4l7jGQ7A4Ulckwnpi+oS8zACMEBqT8QpuHrD23lvV5oC8BiAahL/b8JpoJvgV56FTq7CT8Dv4cfrghUWiTYXlvHKlNNqXquVZfS6Rd+KBVQ4sSbJLYblEGqufCsvap7wqp2BhqMrNHoXPerg4kZDZyvv4p4sqag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HZMvbmR9; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HZMvbmR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6cHc311gz2xnH
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 17:39:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726472362;
	bh=kQnXOVlyk9Y2rt+2zkkuyo0HpY0EVL+/gFIUH7R4kcc=;
	h=Subject:From:To:Date;
	b=HZMvbmR9rRcMquUVHJOCy9PfUcoEVq9vN/hcdnSC9c/9oR5IR93vhp22IBUIC6lAi
	 kOUObFZ7HRL+970uF/McWnJ8hn/vK2RUNRBVYsx7Q3gQIw+0eozPWwUsiwXy8C3/Gq
	 1DS4MJ4x7x+ur0PGmKRfN2V4U0VfBoipp6zX1YRO5sL+bQyTr9W7TD9KTwaBHKi+r8
	 PZAUTo7GT/eGNL9e/gZA07BixHgGRp4VMk9pwkEMnxzyfiWC1Fa1EydaZMzBUhaiLs
	 hyRmOlLtL+wexWwQR1KddNyV/vK6A4Ey1xvTBZ82fHAL4TpRmRQRDGgCtbSDZuhbVn
	 mD+dJDt62f6XA==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5DDBF6506F
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 15:39:21 +0800 (AWST)
Message-ID: <0a691364b0d01644c9ca6dfee4b76e69106650d2.camel@codeconstruct.com.au>
Subject: Improving people's experience with technical engagement in OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 16 Sep 2024 17:09:21 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

Hi all,

At OSFC I spoke to a few people who were working with OpenBMC about
what they felt were pain-points in the project. If there was one word
to summarise the responses, it would be "fragmentation". There's
concern about:

   1. The identity of the project being fragmented by its downstream
      forks
   2. The fragmented set of maintainers that people need to coordinate
      with to land complex features
   3. The fragmentation of features and capabilities over so many
      repositories
   4. The fragmentation of focus (both project developers and people
      trying to exploit OpenBMC for their platforms) driven by the
      phosphor-inventory-manager vs entity-manager split

While there are some fundamental problems there, the feelings were that
there are quality-of-life improvements we can make to the project's
documentation. It doesn't help that the documentation itself is also a
bit fragmented, but this gives us a pragmatic place to start fixing
things.

The first point can ultimately be addressed with some thoughtful words,
but while that's the case, I'm going to set it aside for the moment.
The second point is harder to address with documentation; really it
needs some consolidation to emerge from the third point, which is a bit
of a social and technical reorganisation rather than a documentation
effort. However, short of that, it can be patched over for now with
some improved documentation to make the project features discoverable.
The fourth point I think can be tackled by documenting the problem and
the consequences of the choice, along with perhaps picking a more
modern platform than romulus to feature in the documentation.

So to tackle the third and fourth points, I guess there are a few
places documentation can exist:

https://openbmc.org/

Currently this links to the Linux Foundation announcement, some 3 year
old release notes (at the time of writing), the github wiki, the
project charter, and finally to

https://github.com/openbmc

Of all of these, the latter is likely the most helpful, followed by the
wiki.

I expect most recognised thing we have documentation-wise inside the
project is the docs repo:

https://github.com/openbmc/docs

But what I expect people will hit either first or most frequently is
the metadata repo README:

https://github.com/openbmc/openbmc

Currently this behaves as the documentation entry-point, as you're
going to need this repo if you're trying to build the project. The
README talks about the TSC, CI, and a few other things that start to
get a little tangential for the repo itself. If we acknowledge the
other places documentation can exist, I think this can become a bit
more focused, and we can move some of the tangential things elsewhere.

One suggestion was that to address point 3 it would help exploit the
organisation profile README[1]. For example, u-bmc provides a project
overview in the same way:

https://github.com/u-bmc

[1]: https://docs.github.com/en/organizations/collaborating-with-groups-in-=
organizations/customizing-your-organizations-profile#organization-profile-r=
eadmes

The OpenBMC github organisation is already linked to from openbmc.org,
and I think the profile README is something we should exploit.

My proposal is that we do so from the perspective of people trying to
engage OpenBMC with varying motivations. Here are a few I came up with:

   1. I'm an owner of an OpenBMC-based platform and I'd like to learn
      how I can use it
   2. I administer many platforms and I'd like to integrate an OpenBMC-
      based platform into my hosting environment
   3. I'm an ODM and I'm looking to port OpenBMC to my platform
   4. I'm a BMC SoC vendor and I'd like to integrate support for my
      products into OpenBMC
   5. I already hack on OpenBMC and would like to improve my workflow

If you think there are other perspectives from which people engage with
the project that are useful to cover here, please tack them on.

Otherwise, I think the next step is to identify what documentation we
can point to for each case, and add it in.

If there's no significant opposition to doing this in the github
organisation profile README I'll look at setting it up, and populating
it along the lines of what I've outlined above.

Andrew

PS: Thanks to the following for the chats (in no particular order):
Alexander, Marvin, Sam, Oliver, Jean-Marie, Marco, Arthur, and Paul,
among others!
