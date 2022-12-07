Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87229645C2A
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 15:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRzn32T8Tz2xG9
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 01:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=gBjnUadv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bNb7ziVc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=gBjnUadv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bNb7ziVc;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRzmN0Xtfz3bWv
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 01:13:54 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F8DC5C021B;
	Wed,  7 Dec 2022 09:13:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 07 Dec 2022 09:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1670422431; x=1670508831; bh=7kYO31zYTI
	tduB3jvfIZXVqvm0MfcM9fPXacwQkvL30=; b=gBjnUadvtBZ25p8NWSwiq3IPwX
	pgdf0jYelFjTxP6uNWQt30AbOwu/mKqMiQQoC7ZTkRFX0++2FdUpb0zmhVOkSqCq
	tZ2xtazuFlpNCY0Un4FSPUdSoDmBIdEIIFr4Hzbem4MRxbkieSTL+AimZLVvGShZ
	wNHhne2nsfqMM1qbXNdlg6o0jd69wcL83slSUca4eKa+WMJbz2YH9JZaHFSGoMxU
	v3IdEo24lX5VDMSVvHK75SKsaAbsuartu+pCHN1Uj3JMfCo4fAG+fCuu5HO92UUS
	lc40kLn0U710qRbV4kTgK6kisIP1S9X8MBh5WKzzwfySmbDpkXycamPrEBcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670422431; x=
	1670508831; bh=7kYO31zYTItduB3jvfIZXVqvm0MfcM9fPXacwQkvL30=; b=b
	Nb7ziVcveLE6b3F4caxcKIKE5wVenm2cl6ur2hwv6Lpren2GmiNCNQEjPxxD58t+
	Hlkowr43rJ9UeI+4XElmvTGHXgS6njwnHqvcUV14ttQU8BdimxkWI+q0yDzhum5U
	3osVDruEECoSXKl6kpp647Lt7JWYu0KAHuGGtXqrD5Re/Yix4iwUTGfaQQttPlzB
	nRW4zDMm74y30kuf6e+NgTsiPXEPzvdK8fR1bqlRK7bKaXYSCp2gEubLihxeiOLE
	AGNByxXTkby7xjVyEmR59yDOd1W+Picidf3ilPbZEb+NBssD8fL/I7LjeACTX7d6
	dwu5WIbxPJlAiFK2nAptw==
X-ME-Sender: <xms:np-QY9RFfH2PtnvgG8d_y1WT3l3YS55fBLlHwpHm-iV9UpmENnYB8A>
    <xme:np-QY2xPDJTIRJL9L-ppJRjeYbGcBcJNAVHmS26NEwi62A5kvK7XLfPrCgH1MKmiv
    zKEp2kGtpLGaGLIRCY>
X-ME-Received: <xmr:np-QYy0xie8fVdtUr4Z3jAA_r86d_ubmZISSc2H8Q2mGINyWwQzd7ohGRVSKpE2JEdE05u5jDyVk_kdn6cjh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeegteekudefteejheevfeehkedtieefvdfhieelhfei
    hedvhedvtddugfeugfeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:np-QY1DK99-3yU_chHbUWZ92bJTGVgiBB1aFFZ8QV5iUnLkAs5ZkBQ>
    <xmx:np-QY2jISBp97xTSYxeiR8BxRv0Bv8zcD5kziLDP95BGZAaAGcJIiw>
    <xmx:np-QY5pg0QW7B_ULYt6avW4WK_Je185fJSegwTU2IxWBTAVwTQptTg>
    <xmx:n5-QY3t_50zkpJwxmsGtVpLGI2bCKFErMXP20NKEQOl1OJtIotUMAw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 09:13:49 -0500 (EST)
Message-ID: <e6a0017bb89c7e77a32ff2666273f36bafa3319b.camel@fuzziesquirrel.com>
Subject: Re: Ufispace OpenBMC CCLA Signed 20221206
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Jordan Chang <jordan.chang@ufispace.com>, manager@lfprojects.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 07 Dec 2022 09:13:48 -0500
In-Reply-To: <CAJ3czeSoe8rDaXP59BY3MKdNwzZiEQsZxqmrvC8uvDKPL9dfpg@mail.gmail.com>
References: 	<CAJ3czeSoe8rDaXP59BY3MKdNwzZiEQsZxqmrvC8uvDKPL9dfpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
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
Cc: Jay Lin <jay.tc.lin@ufispace.com>, Eason Huang <eason.ys.huang@ufispace.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2022-12-06 at 16:27 +0800, Jordan Chang wrote:
> Hi Brad,
>=20
> The attached file is Ufispace's OpenBMC CCLA. Please help to review
> it.
> Thanks.

Hi Jordan

Are you going to be sending updates to Schedule A or will Eason do that?
If that will be you, please add CLA Manager next to your name.

Also email addresses are not required to be on schedule A, so you may
omit those if you wish.

Thanks,
Brad
