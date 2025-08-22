Return-Path: <openbmc+bounces-505-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16381B31601
	for <lists+openbmc@lfdr.de>; Fri, 22 Aug 2025 13:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7cg60QNQz3cZp;
	Fri, 22 Aug 2025 21:00:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755860449;
	cv=none; b=hE+M/vUcCHnfQxuMgy0eGZg3+qoy4ZM4JToEHQrUQtK/mgwVf2XFn1x4o/CbvKzdJ1+YXWBc753oavOzvJTHXalcAXkwShleKe9Wm0vB1Qe7Nfdu5ifGlQ8+GD7s06+aFopWmYEsuQYtEewGNQv9bUGk+tlOnp0Qs2Ph085BH4D7ILccIOdts2HGTlBV68bfx6d0H73zJ3U5BXxEYeJsojVOjpuGo95YFGoJFONzJMO/9WoGEuOTu5N/9MIC3uNztnkPKD1/6yQArX4wBG2yBL+FX+zLDSyPH2riAVY4gNjzfXl45wUrK44cucu+mKTpqOgmym3+MwHLi5J4JUNF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755860449; c=relaxed/relaxed;
	bh=LsEQJ92dbeDoE8gM4T1VoJaeuWmJK9cqyvFtDb4SI70=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 In-Reply-To:To; b=brvVSa8MpLMzTLJCbPsSvcc8m6bujGXAtLxvQCpyh8aVRiqBlpdtlx3fFfaLUq/R7FpB0IImKwmncOFXhXL3Gpt4QNrPi2dnm6o+SksB4Zm/9traRFJjywG9ySTVkbCp3QXrXdv0QpIADaibwC4IEWHBjT+IQji/WWKG4o8nKm6sz1qtBtyzF49qO8YdgBHXVM9p3aHGE2mdcytewP7me4xiRqp4xUHeLVq+NHTYThYnLvgf5aBHzny+8SJtA0bYeEVGw3E4/Ja1zyIgZ67BKBkX15ZcXHTSMOpWEONqA8M9jcRioVr52tnYMEXuwjcjUw9jkuYtzkjJVaOsZi9poQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=Rd/WQAp3; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J+U/SfrX; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=Rd/WQAp3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J+U/SfrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7cg211w9z3bqP
	for <openbmc@lists.ozlabs.org>; Fri, 22 Aug 2025 21:00:44 +1000 (AEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 256AE14007D3
	for <openbmc@lists.ozlabs.org>; Fri, 22 Aug 2025 07:00:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 22 Aug 2025 07:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755860442;
	 x=1755946842; bh=LsEQJ92dbeDoE8gM4T1VoJaeuWmJK9cqyvFtDb4SI70=; b=
	Rd/WQAp3ig/IpbrG2kE3nWtKPwrq1O/PtX6AEqUvIbVXOTmE7bNGsrxyzo+nx6nC
	VsxNsIDUZRjamr8zeL8IFMPHlbTULm7YCss9+hNkgckdgV69KCt8hSel9QErBAte
	xl8nWXAvU/aSpk6y9avrxzn/utNPj14x72kqndGPS7yYpoV+LXyzqNJ0iZ+gIq6e
	WeA0qZ2XtZ4ehweOVRkrJZYSTSO9pqcJ9POCdyvBXBKJsxKy9Ttln3ibnY3Oj3Vt
	VFBanZEstyu4piTsRgNI3DTZIMQGiRsmWjssnc+fmu6+w/aNkF3nYUfNDaUO3cRo
	AVwV7cbH1c8EhPAKwJSHPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755860442; x=1755946842; bh=L
	sEQJ92dbeDoE8gM4T1VoJaeuWmJK9cqyvFtDb4SI70=; b=J+U/SfrXEOUaMBSyC
	RZiqzF1DFJxkXcG5ba6yb+7rWdzwxulsCya0Mh9XJ3CiQ82DEhTl4WH7a1+SRlUM
	uzqtcnWrkqNCPrL52DmLj8LptH6K64kdR/429kAdp3mas8GSKsBMQcf0Z0dYsKXC
	Nq+0cCFe3v1MBu+uyDs3vzZXzwR5b4abue1GNXyCVgHjCM5d/2CTGYq/9+BKnvZX
	hIgu/yzL4akh6N/WO8cPRbSBtqHJHBNp7mwK8bYn1ZCTUscVJ49pnStNTjkzZ76d
	eEPfH81GaoNw1XwBOZwjOiAW/gTnohG3jNMBqmTXc9UYTwiN2LBrxPnw0Xyayx1v
	EFISA==
X-ME-Sender: <xms:2U2oaI1t--JGCctj03ZenJa4jrfppt58MoHZrVybgL93BJQIKur9zw>
    <xme:2U2oaFG-mElR02-JhVi3UcXcbEX2aJdqMCFcHGIzGP9rBFmYmdluvKHCB5upEVDXG
    aQkGROctJtceZBmQV4>
X-ME-Received: <xmr:2U2oaKRPJ6pnl_DX-jpECiJZpu8wHBDvrRNMnZJSkQPs35NBpcVTU5dr8BTVEucHDwE1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpegtgffhggfufffkfhgjvffosehtqhhmtdhhtdej
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefggeejhfeffedtveejieeffedvjeei
    kefhgfdvheetuddtjeelgeejudfgudevveenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdho
    rhhg
X-ME-Proxy: <xmx:2U2oaEA2nwiPYzG7xEXJ0VJZ4fhRYVluubPXlmo55O75QtxktKJL3A>
    <xmx:2U2oaC2GMvtDEY06oHhKtUadeaWLYnGuLT38Ij4DZYnnSJeIdrDxdA>
    <xmx:2U2oaKWYih-NDViMvQSfL3qf3iiy6I-stk4JUnOn4wqUaxW6sL3pXg>
    <xmx:2U2oaMnb1pnPC0tZ3Cmc3UuIujQoEvrukJJB6Nt9enRqP_3BIy6pZA>
    <xmx:2k2oaHBjqq2ejmWN1PRNbs_McTViwvMpawQ7BT74HEAegZh5GEuVwyw7>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 22 Aug 2025 07:00:41 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: TOF elections for 2025H2
Date: Fri, 22 Aug 2025 07:00:30 -0400
Message-Id: <7E7035EF-ABF5-4B19-AA97-7A9C5FA1C7CB@stwcx.xyz>
References: <aKOKlY97pOtfuaEv@heinlein>
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: iPhone Mail (22G100)
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We do only need a single nomination for an individual. The vote itself occur=
s later.=20

=E2=80=94 Patrick Williams

> On Aug 18, 2025, at 4:18=E2=80=AFPM, Patrick Williams <patrick@stwcx.xyz> w=
rote:
>=20
> =EF=BB=BFHello,
>=20
> It is time again for TOF elections.  The current roll-call is available
> at:
>    https://github.com/openbmc/tof-election/tree/main/2025H1
>=20
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew Geissler, Ed Tanous, and Manojkiran Eda.  All 3 are
> eligible for re-nomination / re-election.
>=20
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
>=20
> Nominations are due by Sunday August 31, 2025.  The election, if
> required, will be held immeidately after with more details to follow.
>=20
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
>=20
> --
> Patrick Williams
> <signature.asc>


