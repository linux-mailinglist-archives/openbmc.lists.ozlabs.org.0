Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 9A64E8CA317
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 22:01:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=DJ+Mmhts;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Z7E7IrPK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjp9v4Krfz3fyl
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 05:52:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=DJ+Mmhts;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Z7E7IrPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=103.168.172.156; helo=fhigh5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 358 seconds by postgrey-1.37 at boromir; Tue, 21 May 2024 05:51:31 AEST
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjp9H6JKWz3dSq
	for <openbmc@lists.ozlabs.org>; Tue, 21 May 2024 05:51:31 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C029D114011D;
	Mon, 20 May 2024 15:45:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 20 May 2024 15:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716234328; x=1716320728; bh=DJz9nR3kOO
	6XU/OhJbqP5bLdS9VACp3EJE07wD+gYSs=; b=DJ+Mmhts0ka1hm3S71t/PjcJN7
	HEsY8uWc+6cbJk5orzNGIyHXyn0xR6+ivxQAcT65CF+KzAvmaYs52je7pV12jt5e
	cCeqJW6cex3q9J34AAthuS3F4QmtlymwKqlqY0obUigW6KxQxL6haOhdXQPqlRFK
	j8tylOB2bX847EFGCgpT7/Q6Hs6l3OErlDhU72mF0UIDOKtEQUYjKPsWBBGC3BGZ
	KoXc+ryhrmR6zjlR4P3JGhn5ZG9xJ6SopepAjnhJ5nEzTrcpwQlpJl5++6D/+KBs
	mjcDtCvKi95wjxhLFvbUOlr5oG5CYOM+HBtytkO+a7SX8r3CUvBrSTPftxxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716234328; x=
	1716320728; bh=DJz9nR3kOO6XU/OhJbqP5bLdS9VACp3EJE07wD+gYSs=; b=Z
	7E7IrPKM4eKbih6xYCzvAIMi7hcZlr9zKRYRePRlhpQ5ZkoAg/q1G53fOend5B4I
	LknM0cUH7wHjbWJJ9WUAlsEXJ9FvF12lQY9Tbg1lShrdaMEOH50RyrCiTaVJJn99
	EVY3kvZiRZuLSPZh9KMTr40GJ6F7OKTsfSLwCJwVXvmVXXlE1d3wuthlaE5/9nCg
	YbgTSCXV7dFSwtAssjSOFMBKHMqBdzK35ZcDWkMPgQVuR5uZOLWkWB/avTJgaCu5
	saFN2BwUGIgJRalkGpHKlY4Ynt76Kq8VS3NQHdyvbM8hTwVIpcGFZDYSsd434JbZ
	oPyYLrS5zBl+c4T6dkocw==
X-ME-Sender: <xms:WKhLZjw6Vt_YkF3AmNTRt-yfJN7PMthLDvFBdtUWWLo50DBliKklsA>
    <xme:WKhLZrTPTo9oGy7MeJpwsIivZhcSM1jItbEVZoAHHx-Sf_QyAPesnpAqbPWxcFb8t
    JklLa_sekd6TQXWuUk>
X-ME-Received: <xmr:WKhLZtV_elz48613ovA8aIJSm16F69cGK5rBdfnpBSD7pP7qBzIhmgt-WG79IRLk6m9v5Fxx3GWUfdxcI-Mox3RZtaFuCbr3bhyv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeitddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehr
    rgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
    gtohhmqeenucggtffrrghtthgvrhhnpedvfffhtdduieejtddvffejtdefgffhkeehkeel
    jeetffegleekheegheegkeeuueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgv
    higssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:WKhLZtg3QUKi-W7bIC2F7LcpJN0o9z62YpesGYkjdmAjPMpq1d_s5g>
    <xmx:WKhLZlCbVNU9mB44ghKmJm5kcQXucdIVFSefTfJDmtVNrLePJIvMVg>
    <xmx:WKhLZmKdNufY2pxLqu7b79GOATALGSIn7qtUQK2z5qOWIj1e3mNbzw>
    <xmx:WKhLZkCgnAiG8wO2Muun6qpGOfK8Liv6yOW9KFQWqgHAYpAZ14kDiw>
    <xmx:WKhLZkONnDwmipKqR7o58o0aVUb2AtGGZqCbqvMurJNhUxoqVSGNI1jf>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 15:45:27 -0400 (EDT)
Message-ID: <e0202b030a6c2e8c3b7d7d7164545842b9e061d8.camel@fuzziesquirrel.com>
Subject: Re: SDBUSPLUS in OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>, Kasra Amani <kasraamani80@gmail.com>
Date: Mon, 20 May 2024 15:45:27 -0400
In-Reply-To: <CACWQX817b2b2gHnBVYch0P-e92m0rs3pzCdrNZOX9vYrSfrLAw@mail.gmail.com>
References: 	<CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
	 <CACWQX817b2b2gHnBVYch0P-e92m0rs3pzCdrNZOX9vYrSfrLAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-05-20 at 09:59 -0700, Ed Tanous wrote:
>=20
> https://github.com/edtanous/openbmc_template_app
>=20
> For a long time this was hosted in an abandoned gerrit review, but
> that seemed like a mediocre place to host it.

Agreed!  Thanks for sharing this, I love seeing this kind of organic
self-hosted stuff.

-brad
