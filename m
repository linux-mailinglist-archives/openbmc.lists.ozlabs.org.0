Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D995320278
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 02:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj9l26cmDz3cPC
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 12:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=NI5G4870;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iaw3lPEl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=NI5G4870; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iaw3lPEl; 
 dkim-atps=neutral
X-Greylist: delayed 573 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 12:26:09 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj9kn0Gqyz30RQ
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 12:26:08 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3B979B45;
 Fri, 19 Feb 2021 20:16:31 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 20:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=HvIT3
 iC7l9JtXd1G61NuKsmQncwkU9dp0+yF0xpT1/8=; b=NI5G4870/R9rRFLoEPdeY
 d5c78C9sZPwuLGod3KZu2dgAhXpibe4NlKP2lsY4WScdIhLGziw0we6fvGsoTUsj
 +/wX3n+1kqTHdTDsGSjvpfZKeoznI+i/h4PJ+5Eo88nLm+5sSqlrQaW2YY1I27nO
 S/qoztKH9eK2pqc6HtKyDCWt8TpoU8sVfsZfANf1Fy5x2X4XlJt3hLIC+O/A/J8K
 tOX3yuKf4kAli9zUdZasUVOqyb8lxMwyw4KApD1Xl2Wv3Ad0cD+YPXpIvE48rOhZ
 /P06NJLbMmey/iP6QI7K+tuiNv98ruTJSjCFVBO74/kb1hU6iBhubY1ppNYJakY0
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=HvIT3iC7l9JtXd1G61NuKsmQncwkU9dp0+yF0xpT1
 /8=; b=iaw3lPElwpiSg+bj6Pgkd2WO9pz2EIfsKapLWVZ05LRCeMWr9iWjwpIXS
 Y6UJ1MkuTIXuOJIwrTsTh/uw0JHs0GoJXgCdD/VSSbso0V2MmG1B7ZSoK/C1bL4u
 p8Tgb9p4I9Qbvra0/LNzldkQ/S09LPDXh2kqmd1xKHhSwzPEIpRy1bmONuPt5a5v
 pLK4W3hZuUoAeoGda/Y1ZxDBmopH2q2rvDRgz+EXGVkBfI+sNXMGSrHhJrIN0ROA
 xcEcJ/bWpMPhwdZIIBMxR6ckWmlxqpsP0OlEQue+3mRTiEvP8SNfF4KAGo3zzLbg
 mcrcjASTHmWzBzoyROPh+BotBejpA==
X-ME-Sender: <xms:7mIwYBZYWNYFdVf6Gmk4tLOrWpzroxw-svrPmc6dlWA8myh2mQGdUA>
 <xme:7mIwYIZh_zJEmOnB7VvTXXlu5zSb8cxPGI070hCVOil5p-KGaNn2E6DnjX8lYAV5e
 1iPHc8Ky9lJ747cEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeegjeevjeeuuedttdegffeiff
 eiffetgffhfffgfeekudelgffhuddvudfhhfegjeenucffohhmrghinhepshhouhhrtggv
 fhhorhhgvgdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7mIwYD9CQzshiHzNWfuWZwnlJ0sBAOmAt34QUAQdwqMcE-VzlPb7Ew>
 <xmx:7mIwYPo6H6J9KYr8Pl47S_Wkw92GNsg39NModKkpLIeZaFtNWwVI0Q>
 <xmx:7mIwYMp8BH17gk6jdcju8boL3kAb9RfzSR-6LgQMKR5HNoU5tbkBwg>
 <xmx:7mIwYCH_n_Lr7aP8XAkTJ6kPVMP7jDe73gmEQhCNvL9T698dSHmqvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4F332A00060; Fri, 19 Feb 2021 20:16:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
In-Reply-To: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Sat, 20 Feb 2021 11:46:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kun Zhao" <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: overlayFS security concern
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



On Sat, 20 Feb 2021, at 11:01, Kun Zhao wrote:
> =20
> Hi Team,
>=20
> =20
>=20
> Have the following case ever been discussed before?,
>=20
> Anyone knows the root password will be able to let bmc run their own=20=

> code by scp the code into bmc with the same file path as any services=20=

> in rootfs. It will make the secure boot totally useless.
>=20
> =20
>=20
> So besides,
>=20
> 1. disable scp (but scp is one of the firmware upload way)

This isn't really a solution as there are other ways to upload files.

>=20
> 2. don=E2=80=99t use overlayFS (but it=E2=80=99s really useful for deb=
ugging during=20
> develop, and configuration management)

Possibly, but it's probably worth looking at IMA instead:

https://sourceforge.net/p/linux-ima/wiki/Home/

Andrew
