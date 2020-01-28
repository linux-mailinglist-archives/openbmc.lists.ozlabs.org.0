Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1014AD39
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:30:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4866vt53h7zDqGv
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:30:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=CddKjQXH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G10cCfjR; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4866v503JXzDqB7
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:29:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EE8744F2;
 Mon, 27 Jan 2020 19:29:31 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 27 Jan 2020 19:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=S+OzZ
 TZNfy5kZKaKZ5nxIPAU4I9Oy4edD0wvX1oFmG0=; b=CddKjQXH9KdZWnbwR0lWM
 X0WDIRiaoB8Wv1L/RwIkYsJeXiapRJ6V1ZULiSeC5pydi1x+SXvOokTESqwC3jWT
 gPAbw/A/H4+atBgttBnBx4y15wV5MgEAmdmgDcd+Lx8gDXMysI1fHZXZb2y8qZox
 w/R7cQGrtvWvsQ/3cWOZH8Gtyxtdos1ldF93uoxZi4ndv6DCdge+hb1QyoFNgiEu
 +r3e8buFHx+XhZ1jjzE8+PK9pIvMN1dRS+LUiXhja3knA4ZvHl/vgP6PIRGkQ9G5
 HpWGwPUdyzSOhjVeCc3IyV/vv6ojX4XLkeN7zK+6kdaxKKC+ZOasWVOgddSIZhhR
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=S+OzZTZNfy5kZKaKZ5nxIPAU4I9Oy4edD0wvX1oFm
 G0=; b=G10cCfjR5rg8v/1wZOXwZ7D6hNBGf5u+WaSiHaLzcCRqe9tAx+wFll4zJ
 d4k2DsUT4W3jMSa84ZtlAWjWum9gemInSq5zmcSlD/Q/o5iYM9MKMLTcUuGN9qEI
 y4oAgRVFGQZzVfMqq9eu3epK7IK8LiFBKzVjsexpszkn0jwZ7kytM3Vy6JJ7bszF
 wosgNOYodnHbBbYpiy/H/QK5RXQLZ5zQJPp3eVpxQuZiZCAWuAG6j3iF5AJFZd40
 Fovkq4vDVN7VTCb+Oxx0dRU/yT9xBNWVsqgRENn+5tJ0LFVvkFEyhJPPIaJlFdUh
 QuyXUvui4XPyEXAiSSesiJgzh/5bA==
X-ME-Sender: <xms:aoAvXlY-fIZPLJltkNNnCD7sgTICu6PkJIg0bY8PRsOzOJdi5q9nQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:aoAvXu4k3aaHhVweDlrJORmOuOfZQT3P1mHYf9GbbIavu8DPFG6Zww>
 <xmx:aoAvXoHqyCKdxSp74NgtZ6oli62GR5sZv1x7Uvx9VJ7QcuYb10SoTw>
 <xmx:aoAvXmk3hDbvNjtvIbV7hfxuRMIh1tilAAmfYHgySUILeBYOrQS4wQ>
 <xmx:a4AvXqmvDQWFxaiKTTSbQvWNy7iRHHTfNTKMMeel8cidAg0ra9voJQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CEC67E00AF; Mon, 27 Jan 2020 19:29:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <12e5a999-971b-4edd-b04d-aac018936a77@www.fastmail.com>
In-Reply-To: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
Date: Tue, 28 Jan 2020 10:59:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security workgroup meeting times
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Tue, 28 Jan 2020, at 04:12, Joseph Reynolds wrote:
> Team,
>=20
> Let's try again to establish another OpenBMC Security Workgroup meetin=
g=20
> time.=C2=A0 The current meeting time (every other week 10am Pacific Da=
ylight=20
> Time) is working for some, but not for others.=C2=A0 To be clear, we w=
ould=20
> use the same workgroup, just have alternate meeting times.
>=20
> First, let's find a time that works for Australia, Asia, and Europe.=C2=
=A0=20
> I've seen participation and continued interest from folks in those tim=
e=20
> zones. Because the current meeting time is bad for them, let's establi=
sh=20
> alternate times.
>=20
> Second, I am thinking we could establish alternating meeting times. We=
=20
> will not find a time that works for everyone.=C2=A0 I try to accommoda=
te=20
> folks who cannot attend by writing a summary of the topics and=20
> conclusions, and by pushing the work back out into this email list.=C2=
=A0 But=20
> that is not the same as attending a meeting.=C2=A0 I feel that the mee=
tings=20
> foster better responses and more participation than using the email li=
st=20
> alone.=C2=A0 For that reason, I want to continue to meet.=C2=A0 Hence,=
 I am=20
> proposing alternating meeting times.

What times specifically? I'm interested, and I'm in ACDT (UTC+10:30). Un=
less
we have people in NZ, I suspect the best time is sometime in my afternoo=
n
for Asia and Europe. Thursday or Friday after 1430h ACDT would work best=

for me.

Andrew
