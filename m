Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DAD105DC5
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 01:37:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JyFc16rCzDrBB
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 11:37:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rUfG+Zts"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="buuHlpOX"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JyF219l2zDr4g
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 11:37:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5FA6A22E6A;
 Thu, 21 Nov 2019 19:37:23 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 21 Nov 2019 19:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=vi2Av8onWOLfTJqQV8Tf6xK3jCztwZz
 tHSV14KXL8ew=; b=rUfG+ZtsKMR98CPK7EA9hBSCTaMsUkZ9MzHxnhIBzOlT4Fp
 fpPisw6zWIAMcehl6qjgVeWQDQzqJn8kY+pkmhGO1DT1+G2qRei3wV5y/uXyzzzo
 6zZUuz9C+ct0hw0f7EhpsD090DZdFVwKqfGJhZOixXaDBTOI/Q2ml1s9HrhwPcuh
 pYETIiT8eZiAq229z0dGf1gDLDlubBiXwUxvpnKppHPYU8krhvtmm0rjhIlE+Lu+
 s6NXVXxdrXcUOcuFYuBgw+zGfLhOnUxl22t6m3RBUM9nidGqOw3hB85ec1yi5JSn
 htfez8djUeRHDuGP3k1X42nqw7M0w8vQuHmS4Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vi2Av8
 onWOLfTJqQV8Tf6xK3jCztwZztHSV14KXL8ew=; b=buuHlpOXB8H8G3JvLeWQda
 A9B+bL/Mg/3fhaRIypuq1WWnqn1hbg9Br9f+gewKKnvl1igPBr5RS4cDhshneieZ
 TzORwinJOOAz/x/hzeTGxxMzftji+7tcU+wa0Q05k9mRBqLgRkssC5dIV0o1hN8V
 DzBxXKAVcRpVm0wINF00Kf55jhC/+EWDKzbDoN9tCo9faNaG3x0o4oManFnh4Ns0
 vpOsG3bIwBjvd5Dtdf/+OBNOdlIMjuScDTizeI0/RoZG/hSD+tRa/RvLrRpRPq40
 s+jcxxEhj974u7bqgwLLogo7jQUGKbBDlnIT9wXLb8wp+S0kxfQzxGpGsdFYEijQ
 ==
X-ME-Sender: <xms:wS3XXYhBp0Xwfc5mVuUAxl-m7FHkQS9oGWyEjvd09G4ZOAjXdEZJjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehfedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:wS3XXWulj_s4JYqPWiNy613aci_lzjITt_laJ5lKB2jj_BhRMB5pbw>
 <xmx:wS3XXRSjxLgTWdM-FCddSnIAFmEoTie2pTScY_JfbtQT-diQF2Xhdg>
 <xmx:wS3XXXGhLUxsFn46TcNbNcs6BD40Lwis-FmSYi2-0hL6NBCA_2VEtQ>
 <xmx:wy3XXVDQ-eOMWPpbKgtJqyezcVWUj6I5_9aSaFOHiVqbK-Wui-Q_Lw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C904AE00A3; Thu, 21 Nov 2019 19:37:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
Date: Fri, 22 Nov 2019 11:08:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sharad Khetan" <sharad.khetan@intel.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
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



On Wed, 20 Nov 2019, at 17:29, Khetan, Sharad wrote:
>  
> Intel is working on MCTP over PCI (VDM data transfers). We will share 
> details shortly.
> 

In the kernel? What does the userspace interface look like?
