Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610645342DA
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 20:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7fWq262hz3blS
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 04:20:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=rAdeLjlz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RiEyq3Ko;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=rAdeLjlz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RiEyq3Ko; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7fWL4z5pz2yph
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 04:20:29 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 33E7F320091E;
 Wed, 25 May 2022 14:20:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 25 May 2022 14:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1653502825; x=
 1653589225; bh=VzmupsBAOvvd4MFo9bsGp+RmAdqwid1Uvrl4rEL+dnQ=; b=r
 AdeLjlz+NnAJrf/g38fkMJaVenRE2IXhno55AaH+2gg8MIxbLh7JwhhcsLenanam
 tqdXSe3hE24krwZaILeE3jAOHcJNz/yF/PqhJGvA6ROiGFVVYl28Oey5fr7FeD/J
 8rOyMfVCAY/XEKmCKZLDe2C14UhWwIU/lPS6FiVGFBwVK9llJgVu+u/hBTTeTrOZ
 7u8xC4UXV9eSf49pAzckoLTECgpYmXp0vJZCeiggOVuI712V5F9wC2koQed6M7xB
 RowZBrp0m035TrwjLLfQXerB4UhxxpbzAfC9xYLlzSppNTnu4lcgHIoBGB7uEemC
 9VzlsyLmVdw9I5B8uNA4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653502825; x=1653589225; bh=VzmupsBAOvvd4MFo9bsGp+RmAdqw
 id1Uvrl4rEL+dnQ=; b=RiEyq3KoAnlxIueiOud3EYF/gg0jKzdU1xCYlUBdvI7X
 iCildswYrbSDYt9o7iv+gQDD4B09EZ87GQkLFdcwbOShmXeaJiPgAo0dqq5sAG0z
 stSTYoZwsx7XNa1JUqs/wLLhdXJfeU8Av3q/HqgUBLPh8AZ2TTzQnjHIwWBWiPIi
 c+V/srB/GVPys731c7NP6jGFQJgdLprreTJRgxchX4GsuB5k/xkKuBeF5xvlJKtj
 r4Ckpnz2dXRCvQFNoYWsa0EWJ+oLihM6ULHrQztjzgTrz98zMiuPo+IxiANKdODb
 esN5h/5XYPb0FquFIEWKB1e5iBtyukkrph97oq8raQ==
X-ME-Sender: <xms:aXOOYk9srj2GyxMTxUzN9Z1U3tAu8QdelzGHy1fax3pgHVia54tUtA>
 <xme:aXOOYsszXZt5nex2DGY5HbckfQl_0ll-FhbH3jCp4Z1hsfIKuh8RSNKj7SkQIKGhr
 WsyXBAyCR6kMauryic>
X-ME-Received: <xmr:aXOOYqDHu6P8SwflfCwDOA0GxtYif6RccwdCpeRyAM9VOh5X2XfPpzc5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeegteeuffegtefguefgtedtudfguddvudekhfffteff
 fedvgeelvdeileetffduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:aXOOYkcrsXg1jH1tWnl0zA91qMElfMMB7vWiGL3XfwvHtEE5Lw9FjQ>
 <xmx:aXOOYpP7CEShmutfCzeOW-XDP8xyGOVUB3wmGeE-T172rQ-ynIQKag>
 <xmx:aXOOYunLQ_DqMVwksMsCo8RgVsQy_AFslq2eb2WhS_yFtQbmGQkaOg>
 <xmx:aXOOYrU4nh5qt3LVaLyRs2vc42QtVlNgI_Cpv_mldmrp4I3c2GaNWg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 14:20:25 -0400 (EDT)
Date: Wed, 25 May 2022 14:20:23 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Edward Chen (TRK)" <Edward_Chen@jabil.com>
Subject: Re: Signed OpenBMC CCLA from JABIL
Message-ID: <20220525182023.doskhua3aux6cux4@cheese>
References: <DM6PR02MB527414D4F123D6FCF3A5B37B87E69@DM6PR02MB5274.namprd02.prod.outlook.com>
 <DM6PR02MB5274AE1CA4CFD952D49F39B287EF9@DM6PR02MB5274.namprd02.prod.outlook.com>
 <20220418124145.vn2ly3okgtuk54vq@cheese>
 <DM6PR02MB52746D7376A293C78A774F9087D39@DM6PR02MB5274.namprd02.prod.outlook.com>
 <8d3ddb32d48cba42ac7eaf7b407432d4a587f808.camel@fuzziesquirrel.com>
 <DM6PR02MB5274042EB3676743B627D95987D79@DM6PR02MB5274.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR02MB5274042EB3676743B627D95987D79@DM6PR02MB5274.namprd02.prod.outlook.com>
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

On Tue, May 24, 2022 at 01:39:16AM +0000, Edward Chen (TRK) wrote:
>Many thanks for the instruction, Brad.
>
>Here is the updated version of Schedule A. Please kindly review and approve.

Schedule A update approved and accepted.

Thanks,
Brad
