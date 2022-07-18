Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72027578E48
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 01:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmysd1rfyz3brc
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 09:31:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QzT7oZCX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JYHgyydW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QzT7oZCX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JYHgyydW;
	dkim-atps=neutral
X-Greylist: delayed 89 seconds by postgrey-1.36 at boromir; Tue, 19 Jul 2022 09:31:22 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmys66Phwz2xn5
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 09:31:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 78E2C5C00F0
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 19:29:48 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 18 Jul 2022 19:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658186988; x=1658273388; bh=FnCC36iht9
	Dz3cFs9yIUtg7sRkc8D6VGhnIjVSPatYQ=; b=QzT7oZCXnri3cYFUmokcS3ZJAM
	5uZg1m50XjTAbyVptkJ6Uhij7TPADxVnuC6FHgSrOOozezqFls/4v2am2uOAa+DB
	QzRCFTJIfP9Mm2madQGyd4jf+BopptWrDtOCbXiWuuCe3lLJwSt7BOyzIzCnTIQC
	1NHy912D/wMZvgMQov/lnGD7IleeVBYCsGmb2T0jEJWWWT8AIhD39avuwXpJXRpu
	6Ew7LV0fQDbs8NBuOXOJQdESx/WR4Rv6LK2mlDWfFyFJq09jLv1IcJ3zQy5wZO9P
	dX6+x7AnqGDlLh7zwqv+vzmPQgqvESpMWj3QY8qWeWJPt96WeBBzg1msXoRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658186988; x=1658273388; bh=FnCC36iht9Dz3cFs9yIUtg7sRkc8
	D6VGhnIjVSPatYQ=; b=JYHgyydWGvSXSyOytUmhJMymlBgZml681CxxC8WpUgR5
	soyJSh+Ckk27V+6wQnSYUlJYxD2k9hvj6aCLvQ6ZpWkx/MBgSBh7K6TJO1sHm3wV
	94OxD6D77VJ/c/e9HtZglwYi4EzV9RD/9l1NsC/zeji5RSkhSldfqn9q96c/DRUF
	u43iYKSXQqTXeLhFuclbh6Rn+Uhc6RJtvEV/fPdcC9GyT2JTHbYFsyFHGx+S9ncq
	ZZ8jzcpVGnsgqsfRV1UHZqshHNE4t//t+UQR83pxGASLsNjsb6WWIWZqBSj3XooJ
	TRW+HVzFMv1omSLSBGQF41yGK+QGz+1ByQdPzT1iJw==
X-ME-Sender: <xms:7OzVYlOaJthb7UFpz_LyTz2lH-Yq85M35GkqTvwnigJ9u9iO52uzGg>
    <xme:7OzVYn9jkD2-3rFJdO_HKvTVSYvOl1Nex3QeQkGqolP-6avztg_U3-_KFP7yvo0tU
    8SxNTyCNuz5sFDzDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekledgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludejmdenucfjughrpefofg
    ggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughrvgifucflvghf
    fhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpe
    ekfeelkeeffeevieffkeegtddtieetgeejgfeigfefleevkedutdeugeeikeduvdenucff
    ohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7OzVYkTPUsIERfxXfrTmlIFwYWl5ZcPf_sxDhF74A_q2dQVHa2pbkg>
    <xmx:7OzVYhvEDHM7fbt9GJg6V3NhzPfEzr77JwOZsdby9Uw4grY--NuyQQ>
    <xmx:7OzVYteFx-NazZAT_NMA_frK7wXmy-HvCDy1drTEWJ0XqxP2Xy97BA>
    <xmx:7OzVYnrcIj70-xF_Fq_aA2zH0LOcEhdF5EV9pH7VPa5_0S1k0yb7qw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2E4E3170007E; Mon, 18 Jul 2022 19:29:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <9ac589e0-d882-431b-898c-9a5e046d0b31@www.fastmail.com>
In-Reply-To: <1234822.1658139049@dooku>
References:  <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
 <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
 <1234822.1658139049@dooku>
Date: Tue, 19 Jul 2022 08:59:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: Extending phosphor-gpio-monitor to expose gpio objects on dbus
Content-Type: text/plain
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

Hi Michael,

On Mon, 18 Jul 2022, at 19:40, Michael Richardson wrote:
> Patrick Williams <patrick@stwcx.xyz> wrote:
>     > I'd say about every 6 months someone proposes a change to
>     > phosphor-dbus-interface with the addition of a "Generic GPIO interface"
>     > and it has always been rejected.  This has gotten to be so regular that
>     > I should probably try to track them down in a list so the discussions
>     > there can be easily referred to.
>
> So, clearly some developers think that they need this :-)
>
> I read:
>    https://gerrit.openbmc.org/c/openbmc/docs/+/55422
>
> and this is good, but is little too abstract to be useful I think.

Can you please provide this feedback as comments on https://gerrit.openbmc.org/c/openbmc/docs/+/55422? This way we can ensure all commentary is addressed before submitting the patch.

Thanks,

Andrew
