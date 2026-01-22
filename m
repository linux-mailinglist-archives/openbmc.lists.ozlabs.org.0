Return-Path: <openbmc+bounces-1268-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBn8MEWNcWkLJAAAu9opvQ
	(envelope-from <openbmc+bounces-1268-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 03:36:53 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73460FD6
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 03:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxQDx34Ctz2yFm;
	Thu, 22 Jan 2026 13:36:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769049409;
	cv=none; b=kDeHW9emyCawPNjDoSFZce1+tcndnDLf6arifD7nobqykO4z9abQ6Mky3WXz85A7NaumqomyOtuJvMBp9RJspJISApN35njgLC90mpMKlLfJsYaS5R/xtsRbytam6OOR4lmNKK2ATLCpvtNU57xVnTNFapZpMuuUzlu+XuFybapyeDLaDeoF9Cv1+El9sBmSw0jQ8DCRj0QbMQS8LJEnq3ofxJ7x1e6Y8is0brWwAj6cJ/IqQkNQgEi80CHulEQU3zrVFTTZLGIGh9GLXIM3sxFA3bqoIzHwrrGKIuiypZyiFuwsyDjwBXXZZ9oBBBl1aUc/tIPlA5rDpq9LVohQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769049409; c=relaxed/relaxed;
	bh=3kpjwoEJSDHI0OBsXC0gJrgPES5QP4LrFhIHgiJ3dhM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=BJFVIEXiy7lRQRUCDCLDjWbDO0DO9K8cVFIDubL6wEJPo/cGKRyDsp8C3O47BNz49Hs1ixKnzaGDeavCn0025KXGabnortDnGfmL9M/iCXF5QsLn7sUvM+F2ixSJBiixRqCIc9tvuOw7JX5nCOlxOc0WEdWFrcEju6P42+Uhhj2z3zRhXw7tM1pShBRXQFeYKVrFHudOMWaoQaMn778wHZR7h0BJlJT/aEaD39HDWcNkVx4Stb6U+11tvx4cj0UOfqkZxDs2fQMjhR30tkvVI5SloEtef7NJSSEsexopOJA+TJn6gvkk68zD+22A7G/i+IEHWCCCAXLOXw5x2yNJFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com; dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=stG7TCHP; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t+2th9vD; dkim-atps=neutral; spf=pass (client-ip=103.168.172.147; helo=fout-a4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org) smtp.mailfrom=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=stG7TCHP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t+2th9vD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=103.168.172.147; helo=fout-a4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxQDs5kMlz2xS5
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 13:36:44 +1100 (AEDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 5C26FEC0120;
	Wed, 21 Jan 2026 21:36:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Jan 2026 21:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1769049401; x=1769135801; bh=3kpjwoEJSD
	HI0OBsXC0gJrgPES5QP4LrFhIHgiJ3dhM=; b=stG7TCHPtrIoVeMLCaby/T45+o
	d5obTWzIPipBkpeRrAHkJukeDfVGH7UrRg6Nn/IsQT6Ymq71D/mcaZMl5Kd586iK
	aIHKyjfsUZjBaXODxH9oyy2V5XSuJ13Iy8ag5/S6JKF56jtF1tiHtBNAI5zXQrYq
	xSc+EIom5S15qABZzQWIeVpKdMnZzrvUyDBoPQchP2hnD5LE/lXb4eALkBZn3bAl
	B7uhvLHgqJVcCNuABDFwg/VlP3v4rYnrD+6NswXndMlcVY+kFyaYv2uKqtGOAcRd
	TGAAUmJ7aVXEbKWwCvXsyNH7AftzsYaWIfnaBav+uYVjey+UGboheReF7vNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769049401; x=
	1769135801; bh=3kpjwoEJSDHI0OBsXC0gJrgPES5QP4LrFhIHgiJ3dhM=; b=t
	+2th9vD9IVG+MQ5Tfgaqq0lDC9RPPKVS6Cqiz+D+TjVgXvbynrzw+gEtGoRSFkWt
	hR5atNx3qqO7TDrSi9iSNWX+GLBz2Hq4bhs5HPvZCj0l6iroNb5BbiV0J4WhOpGz
	Txq8YE3jZdj42aW9XS8qsTttKO3xDogGbnFzzqQpxU472LANy4q7Pdk5pR0+YPnH
	B9xpXrcKiUd5jL9JU2ndX2LKg4zDe7bO3UT8hps4l/+ZiFivUQPgucSVQwTqN4G1
	bNERiOLKl7dE7Y17Nhrvd+N7aagLw6SiPS24OMD+cFP2TIIvQgjZe5SSlDjzOvDt
	ydPBjzHLPpWKKQBBc4waA==
X-ME-Sender: <xms:OY1xaR1UA-k8TopkqdwDYYOT_dE_aMAc5hzaVOyYPLQtt_gjHlSlRg>
    <xme:OY1xaeF9TL0tLvGbuCTsY9AB6C0zllxGtveFUah-wBFAyVFSK2LYv8e_axzLnp7LK
    L2XTyS0Zc-Cl2pWWHTuWGpG7y_Mwn6Qz9NcAzFa349h0gggomDDoiI>
X-ME-Received: <xmr:OY1xafi0XrCS_oNRejxgb4GaMt7Msxc8cyYiUPUMbpWQry34GYa-xFm6CZkdp2b_sc-xI1ZM6eWs0DlCdh8GOYZDrvH26bD-Ot1p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeegleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurheptgfghfggufffkfhfvegjvffosehtqhhmtdhhtdejnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnheptdehffevfeetveeufeehvdfftdeuveekkeethedufedu
    teeukeffveeitedthfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
    fhhuiiiiihgvshhquhhirhhrvghlrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggs
    shdrohhrghdprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:OY1xaZ8mZDvjLK9JnZUYp48rMkK9jf92LCc9CiLTnNsIyD2APccKRQ>
    <xmx:OY1xaWrJsaqhOI7cGvPvKBdJnAlTzReJU_nh_3yEkdb4P36WF64T1Q>
    <xmx:OY1xaY_p959-xVUMWa8lBDDLvCClOWLbo4IBe4uk2pgYWLq00J7TNg>
    <xmx:OY1xaaWezQVnXPiMNPhEFq1TS8yItR1ZuofSGf156sXuL_2-mcvTeg>
    <xmx:OY1xabYOiyMoQ3f8j7RReLblFyBYNVhpTWSnz37kDnbQPNlmmP1qtOpR>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 21:36:40 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Subject: Re: TOF elections for 2026H1
Date: Wed, 21 Jan 2026 21:36:29 -0500
Message-Id: <0B94A9CC-5E8F-4467-A0DC-7BCB58F083AC@fuzziesquirrel.com>
References: <aXDmS4BmR6AGXKGW@heinlein>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (23C55)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[fuzziesquirrel.com:s=fm3,messagingengine.com:s=fm2];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-1268-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[fuzziesquirrel.com:+,messagingengine.com:+];
	DMARC_NA(0.00)[fuzziesquirrel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bradleyb@fuzziesquirrel.com,openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 0C73460FD6
X-Rspamd-Action: no action

Hi Patrick

I=E2=80=99ll nominate myself.

Thanks,
Brad

> On Jan 21, 2026, at 9:44=E2=80=AFAM, Patrick Williams <patrick@stwcx.xyz> w=
rote:
>=20
> =EF=BB=BFHello,
>=20
> It is time again for TOF elections.  The current roll-call is available
> at:
>    https://github.com/openbmc/tof-election/tree/main/2026H1/rollcall.json
>=20
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayoth=
.
> All 4 are eligible for re-nomination / re-election.
>=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
>=20
> Nominations are due by Sunday Feb 15, 2026.  The election, if
> required, will be held beginning March 1st with more details to follow.
>=20
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
>=20
> --
> Patrick Williams
> <signature.asc>


