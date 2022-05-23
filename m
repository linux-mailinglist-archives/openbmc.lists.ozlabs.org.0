Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4885314F2
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 18:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6NBX0rWjz3blX
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:31:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=HbggWUzT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jOWltbNz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=HbggWUzT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jOWltbNz; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6NB314mCz2yMj
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:31:06 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C1C375C011B;
 Mon, 23 May 2022 12:31:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 23 May 2022 12:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653323462; x=1653409862; bh=mzQYa1dywV
 baVQANF+skD9EUWFvYadpNqz6bFjFhM2c=; b=HbggWUzTdpUXfSm1nAog3NEfZG
 5FDc8zvBsRYQiGdWasXw1xDN3h06966B9Usge5fNvYyG4iSf/zRZGofCm9kE/CEU
 C7vH1I181cLNSfq6tk/ZRzmo10Mcil0WDa/xjhhE9LKlXsQKukkott8qTyrCfWIl
 h2O6i7lGNNgtj93M1y47iV4D4+FP+pgeXPKkcmfGu/zHKqA4VqQ/fPraBTv/ys81
 1jw+5QySWGBoM3/23lXC7aqQrUsI+sTXNcKyguoLV7s+iDA33x/cyM0JerjHPFeT
 ir+NeexjrohzH95KfFT0Lbx+QPPwYZq2wzQbw3+TeZGmCTw/Dw76JL3Ztfsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653323462; x=
 1653409862; bh=mzQYa1dywVbaVQANF+skD9EUWFvYadpNqz6bFjFhM2c=; b=j
 OWltbNzwm2rqcnk43ZEgKOiKkpjtsKiyhebjoFy13zlqMkUlUpXJ7kW2gBm/4czU
 Q4PLY4mAtcVdXhvh4V9MjAmmcHpKto7Ss3iXkA4/J6mzgFtTcDTGQoUX2SsCPu8j
 iCdIwYIFeVDzAz0NT2toXu8c8KRk6qtSTOKPuwUK1O2RNwZKf7WPCXAC1doMfEGd
 yEyFjxA1yOWgcIWVKCHrkmJMUW7gl68SnUR8jqtVfASVCpT/6YqtC8LPVg1pDUX2
 Zh98jYt1P4zfWk/G+br1p3S7ONMFSaZd/U1PYeIJF7DEtjKOZLGOAO9EK8uon4uK
 hFGvTEMhAUBnPIZGcXBeA==
X-ME-Sender: <xms:xraLYk07g_Jq4nCxXa0_QvXrLM6R0ntuj8HquvjrIqIpMCHOQsLWHw>
 <xme:xraLYvGJGeLrM1XFJIHUPS1ifP8PiciQPSfeTS9Pb7jvlfu9kxS4QDR-0PPKMLJRt
 OTogythtwfpG0zEGik>
X-ME-Received: <xmr:xraLYs6ZWlagk9bP5NQr9i9P2HG_qPHY-w-JckbsldhUexacLMPxyAgM6NAFAnM1_fhk21qCXDOZCtP4Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjedugdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefkuffhvfevffgjfhgtgfgf
 ggesthhqredttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvg
 ihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpefg
 gefflefhvddtteeuudduvdelgeekveevueelfeekgeevudffledtveehfeevgeenucffoh
 hmrghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlh
 drtghomh
X-ME-Proxy: <xmx:xraLYt38jd0oRFRJU2dCeyHbzUTmWgZ0Z_3FGZFrpXuZ6CcxWiMMyg>
 <xmx:xraLYnH8ouTTMctJ-5Oa8lCd9HDGXvtnWXsAtPS2QVkUF192_1RBMg>
 <xmx:xraLYm-eRf9PokGYeYSzjs07krl7-YKYfuCJV8_yH2Y_7iOwMU5MJw>
 <xmx:xraLYqPiR7x9jIBsncNP2a1JKm-SpgYStkGmuwDBUkc5L00a5Js9mw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 May 2022 12:31:02 -0400 (EDT)
Message-ID: <8d3ddb32d48cba42ac7eaf7b407432d4a587f808.camel@fuzziesquirrel.com>
Subject: Re: Signed OpenBMC CCLA from JABIL
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Edward Chen (TRK)" <Edward_Chen@Jabil.com>
Date: Mon, 23 May 2022 12:31:01 -0400
In-Reply-To: <DM6PR02MB52746D7376A293C78A774F9087D39@DM6PR02MB5274.namprd02.prod.outlook.com>
References: <DM6PR02MB527414D4F123D6FCF3A5B37B87E69@DM6PR02MB5274.namprd02.prod.outlook.com>
 <DM6PR02MB5274AE1CA4CFD952D49F39B287EF9@DM6PR02MB5274.namprd02.prod.outlook.com>
 <20220418124145.vn2ly3okgtuk54vq@cheese>
 <DM6PR02MB52746D7376A293C78A774F9087D39@DM6PR02MB5274.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2022-05-20 at 03:22 +0000, Edward Chen (TRK) wrote:
> Dear Brad,
>=20
> We, Jabil, have four new members will join openBMC development.
>=20
> Following is their signature; please help us to grant the authority.
>=20
> Attached is previous approved CCLA for JABIL.

Hi Edward

When you add developers to Schedule A you don't need to get their
signature.  You can just provide a list of names (email addresses are
not necessary).  Here is a good example from IBM:

https://drive.google.com/file/d/1hnO_NMCc0_gvEQdDtZ3ouFP92NElh-Br/view?usp=
=3Dsharing

Please send me an updated version of Schedule A that looks like that.

Thanks,
Brad
