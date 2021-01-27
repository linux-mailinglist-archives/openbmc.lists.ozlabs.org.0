Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C90E306822
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 00:41:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR0W132xlzDr0T
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:41:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=V2jVze4H; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pkmyvFmq; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR0V65b4GzDqX1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:41:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 34E9F5C0222;
 Wed, 27 Jan 2021 18:41:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=09e4d
 0fj/eTlRXitQlerFLdhLUtrByRmOwIeFer/71U=; b=V2jVze4HTNhL+ZfQJKMh9
 xxkauigv3ul+Wv32ohcBX4T+4vhw6aXFc9LWxK5nw9M2sQjTgG0a2ZNs0kFhR9PP
 kUC4xOnl3mcuRA6dsZWcRj6I0i9kuQWA3VbdZuwReCitS7RZr350tpl29SYGOr7V
 cSNANrLHZWyehgaH/hEsms4vz+45wIyG7tYKbB10ml0UeEjyRxAqM1HTs8k9BQjp
 mH2CCdaPg7+a+mKGUKF0DhTFbd/f9HG16iDnV/r+NHMlMPkagji9S6IBtnj3yyI7
 kN88wv0GzZOk4NTGoSHQHnjZN/SW2Y1YziED881fzkGQOGA6nCJx+gEN2VNeS6Ke
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=09e4d0fj/eTlRXitQlerFLdhLUtrByRmOwIeFer/7
 1U=; b=pkmyvFmqj9HjEwMhqEbLEYveLwjHjQYGSSvnYBnhBuXn8twyjb9XewEFy
 ohxJu0XL3OmHJRVZz+9+ujCjpryc0ANVZtZMwzCrBd1vwM9h5APz1Knkhde4Tskj
 PScVCdRkzBITyp/L8+OTGvH4/6lvcAls3tKhHh9KCrCwt2UjkrnsFKhgn/3piNMW
 2rEPgWVxdGuD9//RbmK4RW6r1vatCLEtNLNIDarD/hMAVAb8U/8h8CzvBlWFqTs2
 x7TdU1oT25k1pYgXy18rSl3vc+odS9s6C34//+prmwg6km2NqjmyUk2wTLPrJ5x+
 J6Sov80EMYIKLsymUKjQHAB/rS/ag==
X-ME-Sender: <xms:CvoRYFIWVRhn9uY_2gRmTpdy4cEFd09toaJBI99pyF97NC8QsnNqOA>
 <xme:CvoRYBJJ1sXmz38NJ2AYQRRZa3unQ-kcCoMMXTlek1QhvOKxsFnthKb7h_0ApxUuU
 U1cEVuies7M_HS_AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:CvoRYNug27EKxfLWxctan-aF2HQgtNzhg4TFoAfQZijWrRrdvAvlgg>
 <xmx:CvoRYGarz4XNiNot1T4cSJnYD6jHPhZDDgLlD1yobSMQL_b0nnYzsA>
 <xmx:CvoRYMZitT9auC4V8d82u4BZ-mMeb000_J8aRIN7V_UIRF08_D6HWA>
 <xmx:DPoRYHx9TnbnMP9Mlr0AzTgBF-Zg_OIPg-5mkuQ_gxb4vN39UFCvwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4CDA1A0005D; Wed, 27 Jan 2021 18:40:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <2a850fc9-d9fc-4bea-8a1c-37d14d6d57b0@www.fastmail.com>
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
Date: Thu, 28 Jan 2021 10:10:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/6] FIT verification
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



On Wed, 27 Jan 2021, at 17:30, Joel Stanley wrote:
> As part of our effort to enable secure boot in openbmc, this turns on
> FIT verification in the SPL and u-boot.
>=20
> It adjusts the SRAM layout to accommodate the extra code size, moving
> the heap to the non-parity checked 24KB of SRAM.
>=20
> It also modifies the way the SPL is built, including disabling feature=
s.
> This reduces the SPL size to 59716, meaning we could choose to leave
> ymodem support in the build for now. Please voice your thoughts when
> reviewing.

If we leave ymodem in, after signing we have 1536 bytes spare*.

I suggest we drop the patch disabling ymodem support so we don't have to=
 build=20
a separate SPL config if we want to recover.

Andrew

* Signing requires 512-byte alignment, and aligns the signed image size =
to a=20
512-byte boundary. So: (64=C3=971024)=E2=88=92((59716+3656+(512=E2=88=92=
1))&(~(512=E2=88=921))+512)
