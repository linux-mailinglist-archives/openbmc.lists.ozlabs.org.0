Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F66484627
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 17:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSz5t0WdCz303Z
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 03:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jiTm2CM2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QWDtF6e9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=jiTm2CM2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=QWDtF6e9; 
 dkim-atps=neutral
X-Greylist: delayed 416 seconds by postgrey-1.36 at boromir;
 Wed, 05 Jan 2022 03:45:57 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSz5K5Bc5z2xKR
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 03:45:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C8E01320208F;
 Tue,  4 Jan 2022 11:38:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Jan 2022 11:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm1; bh=WvkgBDrMnNSrKNHiOYmmAcAZ9BDCrI2XyavbRQ41
 ExQ=; b=jiTm2CM2MeR2zoNoue3552hVPLDsnrdoaP4X9r+VvkHvlWSzsAmiJGeL
 LrA/bbOGTQAJ+LTZ0xnW9fr3+cJFbJ0ULq7SPUe9AcTz//CKC+dBwLxiP/6eJ2RA
 BDcpZQQAZn/1RKBiGxwKue+GbX3eshCOGWEwe4THlBsPQrDVDedDBdc1Xd1sl8vj
 5acu5igd0mftiOrMt4fAb6Ltbhq/H513i6ScwcpE1f1cYXSat2FYdVBdH+T7C9RC
 4WUq9AHAh12Quf/YcqIRupDeex6GhT8nmRvqSoRRJpW//OKeOGqlQtyMcO0oplow
 AdGfxvwcfRWBVljzsqmb2RcOcklBIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=WvkgBDrMnNSrKNHiOYmmAcAZ9BDCrI2XyavbRQ41E
 xQ=; b=QWDtF6e9NbI+9AzE7Qh8u8KPxYB0V7vEM9KAY721uCMSHL9Gp1fAIl8pT
 fNUq7XAZkCBgRHUUMRHaHMZ5AS/camfN+mn80tmOF5w3dZe9oDEcsvcHLAUFJ5ZC
 9adE1dPXI//JSV3cGmwfyQSKvJfvnNWqn3U9h3JFp2coZTaFRb9ok6E0wU504Se/
 Mq8illtqHChI95cXU4n5pOA8tqAn8SCtr4gkaqlpqF2MggmfnOC5EhV49RuL8+c9
 uMCNFn0esVkYM/rX8LhgPS+jg+i5yQiKxREHpof3ZVKqO673/0j4XaHGqoGNMMRC
 2QLustAtikbmfbAAb+PUyTe3tL/SA==
X-ME-Sender: <xms:HnjUYdj_iE-Vf3vmtTXlwNmaFzhx_WlrGFJbPTuJiipw0w23taVb1w>
 <xme:HnjUYSAbR2b7APKFWzW5gpwfPNM30Vdct1ydb5IK8V57v2DXGbUcUYChUCHzHAO1S
 x-fZngm5g68nuH0A-M>
X-ME-Received: <xmr:HnjUYdGkhSckv_3Us8BKB0yB7Fy-hHyFgqRIFkHWww64yqJVYd6O21D-t_3uTx3dy8esXtAhMXQJ1MOdJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpefgteevtedvgedujeekieehudeiuedvveffledtffef
 uddvgfekjedtueejveffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:HnjUYSRfilmv7KWyyGzZXn9jkJ4N2I6NPArZ8oAXJZ13rXXRRBeCwg>
 <xmx:HnjUYaye2JrS5u_emdG5jGj13rd3fYSh2KU0_GYtzytRSaTmqmRPhQ>
 <xmx:HnjUYY6zQHzG312d7809mBChMhWcgK1F8isAPZ542lwGBsV4EZM7rQ>
 <xmx:H3jUYfqqeLONc18YsYLoIoJfAiRJyn-MRE0DiKoZ2KOiCFL0U69tjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 11:38:54 -0500 (EST)
Date: Tue, 4 Jan 2022 11:38:52 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Buddy Huang =?utf-8?B?KOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>
Subject: Re: Permission of Quanta CCLA folder on google drive
Message-ID: <20220104163852.t3ejj4pdjz375446@cheese.fuzziesquirrel.com>
References: <HK0PR04MB256331E079ABD02F8E39138B9D7F9@HK0PR04MB2563.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR04MB256331E079ABD02F8E39138B9D7F9@HK0PR04MB2563.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Buddy

On Fri, Dec 24, 2021 at 02:47:25PM +0000, Buddy Huang (黃天鴻) wrote:
>Hi Brad, Kurt and all,
>
>I would like to apply for the permission of Quanta CCLA folder on google drive.

I added you as an editor just now.  Thanks!

>We will send updated CCLA to mail list and put it on shared folder at the same time.

OK!

>Also, the attached file is the latest version of updated Schedule A of CCLA from Quanta.

I uploaded this one to the Quanta folder.

>Thanks for everything you have done for us this year. Have a joyful holiday season.

Thanks!
