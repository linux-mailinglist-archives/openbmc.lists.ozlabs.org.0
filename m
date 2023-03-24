Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B16C876E
	for <lists+openbmc@lfdr.de>; Fri, 24 Mar 2023 22:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjwGM69w9z3fS3
	for <lists+openbmc@lfdr.de>; Sat, 25 Mar 2023 08:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=e/F69InY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BOjl8uYF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=e/F69InY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BOjl8uYF;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjwFg5dSyz3cLx
	for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2023 08:24:22 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 39AA85C00B4;
	Fri, 24 Mar 2023 17:24:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 24 Mar 2023 17:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1679693057; x=1679779457; bh=1P
	6UJDorTtqYx2WtHaKmWSkmBbIUCfcHAVpYRPEi7LE=; b=e/F69InYGnY2XIDtJz
	nkfZlkSWZJ7/P4d+aqvAZ1cQTiKhddtfOz/BQXhPUDX7RC/7HSkWWqwv6qpTDLaP
	hZbCkWmCn5IogJA2W1G8MnnnC6oUUz7moWFt+zHMwxZm9LPVGZNw3ELrTMafpnyC
	ir45wc9FBFA+tH9VcxGpPhsKrLKwsq7h83/p8RdaR4ejVWeifJ4WEgCmsqxYaYB1
	7UeFwaJPeTHnuDBiaiT+oYD4el1Kr09640SGmDyX0leUazYZ/OHje8WAiBnlRJ/D
	HJihdc+G2u3ps2AY11vwiixeA+SXu14RFrtyLHMwwc3+w9oWSt4cPJdJGeGQIwEh
	xMOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679693057; x=1679779457; bh=1P6UJDorTtqYx2WtHaKmWSkmBbIUCfcHAVp
	YRPEi7LE=; b=BOjl8uYFQASzvurh1otwlA6ZotTgVuxUyebonPR8Bk5lIUpDNCa
	+oo+CBVNKzpIDDcbp6HU7wrs2orHIBLwtN1cr+cnbLCS9uQhZR32FPIRpA/5aCau
	gVE3bW4mPj/s/Tg/yM8IXVbD1LBRSpiX0d+MJIs/hmx9L+nCDBDo37V1hJPEDjJS
	/gMFBUawzyPcLEN0x/HTTW6Kg7I5pkN/GTkCOQlUcvEVb3EYz+GBtElPv6o62Km7
	69fNbEyWH+eb0RNTtrr7ZVisndXkZ9wVk32wj3XOtuFbT570rAqm1+3r3Z/GZfO0
	nQQFwMzfpuxS8I0XaGV3xgkXkYeg5cA+2yg==
X-ME-Sender: <xms:ABUeZFvdg7RXNzEaPM8689GtN9uZwFbpnCbRbdiPCn_DKFB6UETWiA>
    <xme:ABUeZOcd35bmHq5KdxEMEbPhMhgw9JzS1qreWn_9pruSLIwYVPTpRE-ImqmSbQv8n
    aSgg9fvGtsMIiEMYyk>
X-ME-Received: <xmr:ABUeZIydMYwj_iC8ZyxhpRJH-rRwuMolg9FeyayYSM6K2NpZtE-wZjgB9sMkd5snFgY80rSYkevKpqJy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegiedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehr
    rgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegteekudefteejheevfeehkedtieefvdfhieel
    hfeihedvhedvtddugfeugfeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgt
    ohhm
X-ME-Proxy: <xmx:ABUeZMNIny5qf7kkkdJzNYwWL06Hl9ZzqGaUyZevQeN-Ym_aUj8ACw>
    <xmx:ABUeZF_xOF-Wr4fIGPNSusG_79In9qprlsroUZFe07fKDgujiPLk-w>
    <xmx:ABUeZMW7lBqViSp7bZD6RcRs01S-h1et82-RElJtSZUXjP_tTXpjxg>
    <xmx:ARUeZBZXIxTfglIdF0i0oyKhVxqnfTGl2LIWf27AWD3et9DYjhwHDA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 17:24:16 -0400 (EDT)
Message-ID: <68f767784c3b39d3935ace6d7e6db708c58d216b.camel@fuzziesquirrel.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E8=A6=86=3A?= [External]  Re: Quanta's CCLA
 Schedule A update 2023-03-20Wayland.Lee@quantatw.com
 <Wayland.Lee@quantatw.com>
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Richard Tung =?UTF-8?Q?=28=E8=91=A3=E5=BD=A5=E5=B1=8F=29?=
	 <Richard.Tung@quantatw.com>, Litzung Chen
	=?UTF-8?Q?=28=E9=99=B3=E5=88=A9=E7=90=AE=29?=
	 <Litzung.Chen@quantatw.com>
Date: Fri, 24 Mar 2023 17:24:15 -0400
In-Reply-To: <TY0PR04MB635735F6211AD9C0D8748A0EE9869@TY0PR04MB6357.apcprd04.prod.outlook.com>
References: 	<TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
	 <f93b92cdf5eb0066d3f1e48fa4d88539c29e5977.camel@fuzziesquirrel.com>
	 <TY0PR04MB635735F6211AD9C0D8748A0EE9869@TY0PR04MB6357.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Phyllis Lu =?UTF-8?Q?=28=E9=99=B8=E6=80=A1=E8=90=B1=29?= <Phyllis.Lu@quantatw.com>, Steven Liou =?UTF-8?Q?=28=E5=8A=89=E8=A8=98=E6=BC=A2=29?= <Steven.Liou@quantatw.com>, Wayland Lee =?UTF-8?Q?=28=E6=9D=8E=E5=AE=B6=E7=91=8B=29?= <Wayland.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-03-22 at 09:17 +0000, Richard Tung (=E8=91=A3=E5=BD=A5=E5=B1=
=8F) wrote:
> Hi Brad,
> I would like to update Quanta's CCLA, see attached file.

Hi Richard, Schedule A updated and approved, thanks. =C2=A0I will be able t=
o
take future updates from Litzung now - thanks for your time on this.

-brad
