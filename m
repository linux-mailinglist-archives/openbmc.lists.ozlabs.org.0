Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D916498A8
	for <lists+openbmc@lfdr.de>; Mon, 12 Dec 2022 06:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVrCc3yP5z3bfV
	for <lists+openbmc@lfdr.de>; Mon, 12 Dec 2022 16:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=U2+a5S/X;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VIcLud34;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=U2+a5S/X;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VIcLud34;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVrBx3n1yz3bM7
	for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2022 16:43:20 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CAD6C320031A
	for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2022 00:43:14 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 12 Dec 2022 00:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670823794; x=1670910194; bh=FMwXdmRYdSXpW/qKiWeq/pAUL6J2ymLswDL
	IMwk+Dgk=; b=U2+a5S/XzuxoJTxcta4Luc7DaoCuCWz77hfeZ7VjzMQVgHi/4op
	Xl8WtocuvVL0Z1GNMgKOQl+Tk1KRzsGW0HYQN7HX/WJokHjFVdQtg7knUESQQxed
	cg7y2FawWxr3Yr8TcJhVCG/PkTYYzEZ3On6R463vVtNk45odYMfNBMZ7aGKF77l+
	QJPnB51S3zYucXy2piKg15qErpYPu1l0uUf115pAQclGOq9a+idL4cx/3jUTwiPY
	Tgl61lYuOLyMfArUp1UAbl0lFVfX1IsGCCjEmhSzXLWGZS4o2sCHqyKwGd2QDWeQ
	Bg4uWahsjEYA9UZjYfJTsCnfrOgsIsTwcyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670823794; x=
	1670910194; bh=FMwXdmRYdSXpW/qKiWeq/pAUL6J2ymLswDLIMwk+Dgk=; b=V
	IcLud340a6NwzfiQQiMnex8DWNd8t0TXYh0hpSdtlQvKH9GLnbLjSZ4f3AQOnBL4
	EnBzsixPtQFtF/8jCeURt3p9yEwRhOv+GRTf4pSPHfUONE3nosKnr9wCDI5FNr5X
	qb0eUw/wppREhxJFzssQ2zd5fdwplT/46ZWsw9dcGf3GOA/ERgAnQ9tUKMXjXang
	upvpAebLDGI2oxPp05mqCcJHOZ0+wKO8wFJ/XeSK8bS2PS0Fyoxhrn+Tg/JvG/MH
	1ebXyGEFnQSzKrxD1Mw3lU0d5GYUXsgwkLCLeEOXwLW8T8ItvWnxZyYezcgQ4RLH
	jREaKE53+d0DZq02UPsIg==
X-ME-Sender: <xms:cb-WY4C3wSEImrtIlQAwi3M-aVfwzZt1LfBWq9W9m94u383mTtoDrA>
    <xme:cb-WY6g9Ttw52Wxmq3XH46VyJtbqgPrFbKPNkvoMtGBMQFRgCF6mf4Ww0JLih9Ezv
    o174fp6NpntKCWrww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepkeelhedvlefhgeetjeelgeevleejvd
    eufeeuffeivefffeelgffhuefgjeeftdelnecuffhomhgrihhnpehophgvnhgsmhgtrdho
    rhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cb-WY7mI9ZY1sZ-9vphjkv8WimNWaxRwXR4pvUDMXETKsyH10i3VEQ>
    <xmx:cb-WY-zY0Jx8aNnpdKo0ZkKqJ-DJdXj_hy9a4HwLf6EqPrFUam1o5g>
    <xmx:cb-WY9QopEWvf1k41ywj2sGJS7YrhhDgPsYS0Q5BV38-OO7GGfdinw>
    <xmx:cr-WY0eSwTwoJS-4AQmkyMv9yemBL9gL5f8JhHZfCDYiUcTsfiHgfg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E92D1700090; Mon, 12 Dec 2022 00:43:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <cc1edb1d-4d6a-4c64-a496-3fb23e3dbc41@app.fastmail.com>
Date: Mon, 12 Dec 2022 16:12:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Enabling forward progress in subprojects in the face of unresponsive
 maintainers
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

Hi all,

I'm looking for feedback on a proposal to give OpenBMC a process for introducing new maintainers to subprojects in the event that all of the existing maintainers are unresponsive:

https://gerrit.openbmc.org/c/openbmc/docs/+/58653

In effect, this process lays down some expectations about how long patches can be left unreviewed, providing an upper bound for both contributors and maintainers. The process is only valid as a social contract if people are willing to back it so I'm looking for your input (yes you, reading this email). A +1 is perfectly good input, though if you feel inclined to give it a -1 I can only try to accommodate you and develop consensus if you tell me why :)

The proposal is motivated by issue #20 on the technical-oversight-forum repository, which asked the TOF members to consider how the project should deal with unresponsive maintainers:

https://github.com/openbmc/technical-oversight-forum/issues/20

Looking forward to your comments,

Andrew
