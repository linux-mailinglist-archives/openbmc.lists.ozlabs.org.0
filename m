Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5274D4A8
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 13:36:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=fV2ukxnm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZYDTxKbW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R025Q1n3Nz3bXl
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 21:36:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=fV2ukxnm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZYDTxKbW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 301 seconds by postgrey-1.37 at boromir; Mon, 10 Jul 2023 21:35:49 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R024k01vmz30PL
	for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2023 21:35:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 05D835C0174;
	Mon, 10 Jul 2023 07:30:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 10 Jul 2023 07:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1688988642; x=1689075042; bh=B7qxatu5gGYQT5pgrJjDspTk1USqb9wnfqe
	aQQz+zAw=; b=fV2ukxnm5t+1mo9RfA1WSudbuoRkAnQYgMxKkNyHbDcyiKn1Ihu
	+3GAdnroWuQVI9wfJzUy7sAq0h+r/pOZI5q7XtaXK/xyp2+2w0derKI8e+zALDkS
	SBtqZn4exbFsIMvSwJBA7IYCW8gv+y5PJ7nUFzrsTbb/lK+lpkFCUybGed8xXBMd
	8CbedaymN5C/TyvzvIUba8CfKKmReF1+nj7CPTbSdYsidftTQt0jklfZG2KCH5IC
	isyqNkn8WPVANrcJIag6alAdVDQ7QZO9E3WUssiLakff5LhyVqT42UUDKYRNFEAH
	epBmNvLmj/hwmUbdGTyO7PT1jTTmTNr0zBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688988642; x=1689075042; bh=B7qxatu5gGYQT
	5pgrJjDspTk1USqb9wnfqeaQQz+zAw=; b=ZYDTxKbW9xWoMqz/oaCVGA+DHUJ2O
	K+l4zgYbGAquo1sFgKoGWVHAlnR+MbuG7kjBZTpvarqIvqmAI1kUQaNsL6cK42AT
	uZ1RIpfOQE5mL0YJJB16c3vQigXPDWBaw4+YFmpjFbSRLYy3bXMAOaq9PAgdhsd9
	G8weWR+SlzbEzjEdG5CD6QP2pLRHPh5v2Xf/CALvBWx8Nq4GHz0TRl2OUlGy9pRm
	ztwDXw5iaxknoLf/OiogEjQXrgAVSZhJaZwEk4oOqUp+uFuBPl94WOvhOVyP82E4
	Q/IRh84cyLqsIPsbeewY0Gp4I63v+eiYjcrdKK3pGcLhBFdFYgMbrYDPg==
X-ME-Sender: <xms:4eurZIpGpM2monRqwIQdMaOi2oF2Ppn2NivHnXQquhGZ3vVaaRpRUg>
    <xme:4eurZOoggCGw-jW6HAxyciKlLvBaALeQH3ZxXJJO-qjfL5WNy6WX5wVp-Pa7i_M0g
    dXHKaqlD5VdyxnOvX0>
X-ME-Received: <xmr:4eurZNOXOJyur4P3rESYNrZQl48VbvCJQSoHv9xmaEYKiAHGXj1uhgN2J9UUUmRA9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdekgdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsegrtderre
    dtreejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhii
    iihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepgfejhffhkeduie
    eileetveeivedtgeeftdektdeftedvfeevudeutdfggffhkeeknecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiii
    hivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:4eurZP6i55F2IgEVZki_0gQkFmHMVNDqM95BtpX1JHmwzSl5ajUa_g>
    <xmx:4eurZH5efP6Bnz1rHlpnadGMWXEyBbZgDd9-yaEUYx4-timKW6fkKQ>
    <xmx:4eurZPgL6Ph9aGVDOa5FHbXKLCGt69wCf3JWrcjxdHHaYIKNVfflcA>
    <xmx:4uurZEi8Y3CaXRt-rLuL8WshoYxcjFEjOr03sSihjRA03RaLXgpRsQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jul 2023 07:30:41 -0400 (EDT)
Message-ID: <03a3c7979087fda82dba00d7fb39a843274ad646.camel@fuzziesquirrel.com>
Subject: Re: Sing OpenBMC Individual CLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Igor Kononenko <i.kononenko.e@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 10 Jul 2023 07:30:40 -0400
In-Reply-To: <CAJcExQmXxn4m3Y6ZqW_tU+yESU6K+6C1Jv7XPkbm-tapk9fy1A@mail.gmail.com>
References: 	<CAJcExQmXxn4m3Y6ZqW_tU+yESU6K+6C1Jv7XPkbm-tapk9fy1A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-bi6y79c++mp5/AbwtqAr"
User-Agent: Evolution 3.48.4 
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

--=-bi6y79c++mp5/AbwtqAr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-03 at 14:16 +0300, Igor Kononenko wrote:
> Good day!
>=20
> I send the signed `Individual CLA` and. Please, approve and confirm.
> The PDF in the attachment.

Igor, your ICLA has been accepted, thanks.

-brad

--=-bi6y79c++mp5/AbwtqAr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Mon, 2023-07-03 at 14:16 +0300, Igor Kononenko=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">Good day!<br><br>I=
 send the signed `Individual CLA` and. Please, approve and confirm.<br>The =
PDF in the attachment.</div></blockquote><div><br></div><div>Igor, your ICL=
A has been accepted, thanks.</div><div><br></div><div>-brad</div><div><span=
></span></div></body></html>

--=-bi6y79c++mp5/AbwtqAr--
