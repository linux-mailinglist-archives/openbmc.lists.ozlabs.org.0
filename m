Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0434FDDAC
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 13:39:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd3g14wkcz2xsb
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 21:39:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=D4v8Jxx0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gNB7axSO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=D4v8Jxx0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=gNB7axSO; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd3fX5xc3z2xmQ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 21:39:32 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B18675C01F0;
 Tue, 12 Apr 2022 07:39:28 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 12 Apr 2022 07:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1649763568; x=1649849968; bh=r/qY83xRavC3sYTSh5bugFkiGfsvXSoRgaX
 jKI52me0=; b=D4v8Jxx0gW0fIsDrrLA3S4Z1Rewl+JzdLzIC0RWIkSM0qV/0OdA
 DoANkYOVqDrJa9A8p/JNkVVa7/1YdgY+BeJCssLC1zDSVB8tWgAykOzHlVE5BVUv
 fgbRunxs4/pdfmzmilbYB5QT/8c0Qk5VGfiGkkqPFfh1OSociDfr6Udl0gk1QVUh
 G1fIGinj76+ta11Hlq7dFuRXFetiH3NoaosG/wtdOcAF2dy6i8hlGyH6BdGKORh9
 9knLoDWhJjV1eM0+HuTLqAGQiQFJ+RxGiCZdc1erEd/RMQu5RvVViKJAi/tWHUEE
 nkECHh7hrR0GzD/rwUNqY56HlYhkKS7NxKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1649763568; x=1649849968; bh=r/qY83xRavC3s
 YTSh5bugFkiGfsvXSoRgaXjKI52me0=; b=gNB7axSO99dxiG20VUiKIJNK5ODZX
 qinfMzdSs3DYT4T/OIRYU196X6b0pWuieqmAn5yexzq7sK1coOmZtRKskGpWp/PQ
 ELwD8bPilTjwS9CbT4/8l6zgFU7lEE/BLdfUiGnwK+vIyTqTHJVmtIaqaQy7+xoq
 TSmtnAfmrAWvkWlYLcT97xURzYxle4V05gHuz+LBYyVlNXAY5Vep7ZYRbNrTCaXf
 l6LqQOc0GEiOVPJp8lQwXTMwsrypniEOZgBlK5RlsIrBSq+AVg/iteInivrkJwew
 kmHuY4PYjrMavXjGedyuHFFfuA6xyvoDMIa49/Ql/5OIYNUGqqsjids0g==
X-ME-Sender: <xms:8GRVYvGWsYf-UfQCWI94TIlLAK1JitCGotMXqdTq6oJ6i1KQAwJfAw>
 <xme:8GRVYsXmW8Du9okwYhKuteXzXIwEHP5B7kqKWSSYB1uMfc-YZClfSi55IwaGu3f3V
 CMyNbpBkEnj1vI2-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdludegmdenucfj
 ughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughrvgifuc
 flvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgv
 rhhnpeeigfefjefhtddujeffkefgtdeiudeuhfehleeltdfggeehheegvddtffekleeuge
 enucffohhmrghinhepshhtfigtgidrgiihiidpghhithhhuhgsrdhiohdpkhgvrhhnvghl
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:8GRVYhKYcgNsYgRyCBKFpAfiyFvWztzVQqObehxoC08d0O4rOW5g6A>
 <xmx:8GRVYtFX5n1DIahd4hz25xdbCqoLtdPHqyDyhOFY6bJKeJwnA9jooA>
 <xmx:8GRVYlXu6PwnMRjGM-N4QjURfj1QqNR4Cu0l6U83jYQnGs1aqQRIbg>
 <xmx:8GRVYmflH-8RrKi_QFfaRZyHTvK5a9LWZZf7GjttnMdo94DisczSWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3563315A005F; Tue, 12 Apr 2022 07:39:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-386-g4174665229-fm-20220406.001-g41746652
Mime-Version: 1.0
Message-Id: <59468f31-4bee-4a46-8966-5d12f3716a16@www.fastmail.com>
Date: Tue, 12 Apr 2022 21:09:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Existing development and maintenance workflows for OpenBMC
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
Cc: Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ed's thread on rearranging the way we maintain OpenBMC as a whole[1] tries to tackle multiple problems but is primarily aimed at solving difficulties with workflows.

Rather than carry on discussion of the advantages/disadvantages of a monorepo here I thought it might be useful to point out how some of us go about working with OpenBMC as it exists today. To that end there a few blog posts:

## Day-to-day development workflows

1. http://www.stwcx.xyz/blog/2021/04/18/meson-subprojects.html
2. https://amboar.github.io/notes/2022/01/13/openbmc-development-workflow.html

What does your day-to-day development workflow look like?

How do you share your work prior to getting it merged?

## Long-term maintenance workflows

3. https://amboar.github.io/notes/2021/09/16/history-preserving-fork-maintenance-with-git.html

How do you/does your company maintain its internal OpenBMC fork(s)?

At IBM we use a separate (internal and external) Github org where we mirror the upstream repositories. We apply commits to these forked repos via Github PRs against a non-master branch that has a consistent name across all the repos. For a (large?) number of cases these forks are rebased against the upstream repos using the technique in 3. The bitbake recipes are then adjusted to point at the forked repos.

Andrew

[1] https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/

