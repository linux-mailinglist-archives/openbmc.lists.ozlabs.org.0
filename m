Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513D357798B
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 04:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmQQ61fWzz3c2v
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 12:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=BdQ9DLWl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dpPsCuPD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=BdQ9DLWl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dpPsCuPD;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmQPk1GVnz2ypW
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 12:09:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BF6B93200564;
	Sun, 17 Jul 2022 22:09:11 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 22:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1658110151; x=
	1658196551; bh=JXgAlZtYoP/3Lfaq3gj7ocq793p8+9iswWgjRxwzvZ8=; b=B
	dQ9DLWlF5D5b19jqjlpQpJbnHsDItvXsefqHiY7yDGbN20UqxwHX+WjcaYPJo07L
	CNGXeOwaXsaZjaQT956df/h/tglzxVfeWNl+6pKoqKZy+YjP3befCsaGTcb2BzQN
	212g8OY9MXarHJV2qgXh9DuW3e9BEFLENsUaYQ7rrpcT+rltjXVofccTq01Ky23S
	7/XQWOtQdsUO5A8HKWfnp3wJMLdTKPluggI1OSzf/fD3l38TGtpNVAGby94CPXM7
	a2da3NdKnFp/bX3QEJX9/XSJGmoTwaq4mRPkL7fWWETp7R/GecCecafB/WjcT62U
	QEr01Jv29fbgTEaSx0Xbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658110151; x=
	1658196551; bh=JXgAlZtYoP/3Lfaq3gj7ocq793p8+9iswWgjRxwzvZ8=; b=d
	pPsCuPDHOYaZ+zCWYy3KZukniyiBO4Jhx15zhnsgC/ncwvW9/XZSfGoqBk87iAI7
	wZM0ytB+Sx3oWHD4+7dKQ61OQ8qADhwfDcTKx8YRgHyKOeJoDZwq9+mWrU0zyp5A
	HDkvIYA4jWAfK+7mTgHAFzf/pGN+s/x7FmdbxbQwF7t/3ybepEMbDrk/raxzMeTm
	I2nIKEl9SfBN1pEbg9P+Qwi6VQ21/VXYXMDjOyhMA9EjmxlH7xtjub0DAa1ccvAx
	WkDWeuZK6PrimHy7CbFSc4UrKa7/skkwunsnMYbxq+XR4wacYSaX8DPBfg9/oGyq
	L4DswNG9LMTsS18fHbHow==
X-ME-Sender: <xms:xsDUYo5jwzpKWPKc9pdyzl9njJswKrWERvkGaTqD4rVNE4v4hOUeXA>
    <xme:xsDUYp4TgcPJp3nk2kZ2v4r4bc-01qCLWIdu5kW_c5CIL-ecCT8-522UoYy9WwnF1
    1m3ZEGNP0EI0KrT_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xsDUYnemnUZoD4vymewefm1xk7HOoW2j4KU3eJQVOG3R9L6i6I1hug>
    <xmx:xsDUYtI2RqHWsmBvH4NpujKcurOYWO_abWo_xNX6fkXyC0dnYhN45A>
    <xmx:xsDUYsLHAaLkVklvIlxC9coFPiPQ2SPibg2KyCxDq5TBK3C4RX-3bw>
    <xmx:x8DUYhH8d-WLMf1bEKfSPXQW5P0NTPg3s_N5s_FezwJ-_-Bx_bL4yA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6CEF5170007E; Sun, 17 Jul 2022 22:09:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <a0fd8555-e901-4afc-97c2-20487374b058@www.fastmail.com>
In-Reply-To:  <CALXuKJdau-XHxs5AEG+s+Ffd8JjuBkBfsO=ticLjqKAkjgkYQg@mail.gmail.com>
References:  <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
 <CALXuKJetkkPPCWZT8T24LFkfkYhqJzOi7oPdtLDOTH2VROHf8Q@mail.gmail.com>
 <CAH2-KxCViS3py6bZ4EX1_V9HU2i8t3o47DG5dhUeE48s8VApAg@mail.gmail.com>
 <CALXuKJdau-XHxs5AEG+s+Ffd8JjuBkBfsO=ticLjqKAkjgkYQg@mail.gmail.com>
Date: Mon, 18 Jul 2022 11:38:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "sri d" <srid.11486@gmail.com>, "Ed Tanous" <edtanous@google.com>
Subject: Re: Physical LED Design Proposal
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
Cc: Matt Spinler <spinler@us.ibm.com>, "Velumani T-ERS,HCLTech" <velumanit@hcl.com>, openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>, jayashree-d@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 8 Jun 2022, at 23:42, Jayashree D wrote:
> On Tue, Jun 7, 2022 at 9:41 PM Ed Tanous <edtanous@google.com> wrote:
>
>> On Tue, Jun 7, 2022 at 12:07 AM Jayashree D <srid.11486@gmail.com> wr=
ote:
>> >
>> > Hi Team,
>> >
>> > Could you please provide your suggestions on the above design for L=
ED.
>> >
>> > Thanks,
>> > Jayashree
>> >
>> >
>> > On Fri, May 27, 2022 at 12:42 PM Jayashree D <srid.11486@gmail.com>
>> wrote:
>> >>
>> >> Hi Team,
>> >>
>> >> Problem Description :
>> >>
>> >> In the existing phosphor-led-sysfs design, it exposes one service =
per
>> LED. Therefore, multiple services will be created for multiple GPIO p=
ins
>> configured for LED. To abstract this method and also to create LEDs u=
nder a
>> single service, a new implementation is proposed.
>>
>> You've kind of jumped directly to a solution without spending any
>> details on why this design is necessary.  What are you trying to
>> achieve?  Why does the existing solution not work?  You allude to
>> multiple services being bad, but you don't really state why, or what's
>> preventing that from working.  This is a section labeled problem
>> description, it needs to describe the problem, ideally in much more
>> length than your solution itself.
>>
>>  The Yosemite V2 Platform combines a Power LED and a System Identific=
ation
> LED into a single bicolor blue-yellow LED per host.
> A total of 4 =C3=97 LEDs will be placed along the front edge of the bo=
ard in a
> grid.
> The grid will be 2=C3=97rows of 2 =C3=97 LEDs to match the layout of t=
he card slots.
>
> Based on each host status, blue or yellow led needs to be blink, OFF o=
r ON.
> Therefore, bi-color led needs to be paired as a group and exposed in t=
he
> userspace.
>
> Based on the existing implementation in phopshor-led-sysfs, pairing gr=
oups
> will be difficult, since it exposes one service per LED.
>
> Therefore, refactoring the phosphor-led-sysfs repo to run under a sing=
le
> service and pair a group of LED which represents each host.

It's important that you integrate this justification into your proposal.

Regardless, the proposal should also improve performance on systems=20
that were tracking a large number of LEDs. Some p10bmc platforms suffer=20
here.

Andrew
