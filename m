Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A88E4142
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:52:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znDg2Dl3zDqmF
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:52:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RoSjuQoj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YpX6VAwm"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znCs1zNtzDqby
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:51:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A03B74AD;
 Thu, 24 Oct 2019 21:51:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 24 Oct 2019 21:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=x/OFuf+nE1gUgssZceOAErQuh9E6AOH
 LpdTmVbSDLWc=; b=RoSjuQojx7F/a2U6EpffIFgWc0siTvvVNR1KKEcMd/dpP0A
 Uw8Jxz9wBcY95OnFn8fWqA6Qyz4+53O2HPVYImYkt1aTgTIaUip7AVKN71MC9IuI
 FyouraQPbsX3SauvZs3dlYZmz+hPCG79JHfYpIOZcrCGwt8Xrn6eI9pH6Q1B0lVQ
 6hQaU1ja192+y9Im3o2hlmzB8IpESSdFw62RF2+LE8Gdx0zSCUTsdSUdNJWtGnAl
 HPp1HHUXayFylTRSdWxk4yn4hrK6mKry0szy8Vynaxvfh0PBF0Qh1xphVUrpe/NX
 Fv3uGam88tvHSUDLk3eeZYhHdzR60Yo3VZI495A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x/OFuf
 +nE1gUgssZceOAErQuh9E6AOHLpdTmVbSDLWc=; b=YpX6VAwmSTw/ehPvgZCkPl
 10t/WpcPRjs9MEo6903Ijt0Y6s8tCC9FfXWjOGeSFOgeZeACgzbIIeP+3P/dUGtI
 Jl/+jf5nR2fmiWsRbHOu6YIifRcd8II/jIVY/VMN6brMJCDsrsWEI1HOCLoGVntP
 Z9AL6iH+VG8l9QGaNUUxTwJqhfYaYhUCkIQxb99Lrg6gpBKgESwoeoJbezCJMWV4
 D62lj9GZpSYlZujkfc67UqGBYa8ib4I8r9A4Y4HGKsFR5nrJ4i2RGNs7h2qPSFmp
 ofOmFSAsC34aEaK0SVZIvR2prHQhv/QJbErH1zIMn3Jzs5lvpUcsRDNqCx+91gTg
 ==
X-ME-Sender: <xms:NFWyXeva8AIBHFUkpsNpzoAyywNQ2Da8PtT1zsl-NoJ0Z6JIifzLeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:NFWyXfTCEf0E0is5jWwtLyvX4f1rRv3BWnJ8-eAwaFAVWBqL1eCLGQ>
 <xmx:NFWyXVJz-M46wtTp8UOoUra-wZKs7VS7Ono1okFxp0itcqJCUcKCKw>
 <xmx:NFWyXSsDq_XYMmn7LoAR_uU0okupGqhQsMxghn0IC9vTYjpJRAGofg>
 <xmx:NVWyXUHk_-sCkdnsjdFLuv8LD9rOgDeXp2LN5nMV1LURSrr9vKIvQQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 53E82E00A3; Thu, 24 Oct 2019 21:51:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <1ed6ba00-c8b9-4a90-ab85-e69f2a8ec2ec@www.fastmail.com>
In-Reply-To: <20191025010351.30298-2-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-2-joel@jms.id.au>
Date: Fri, 25 Oct 2019 12:52:51 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_1/7]_fsi:_aspeed:_busy_loop_in_the_wr?=
 =?UTF-8?Q?ite_case?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 25 Oct 2019, at 12:03, Joel Stanley wrote:
> We busy loop in the read case, make the write case the same. Note that
> this may cause issues when doing a break, which takes a long time.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
