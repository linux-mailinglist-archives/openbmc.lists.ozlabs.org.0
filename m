Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F458280D91
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 08:40:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2gP11n3wzDqdn
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 16:40:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=o3eHthi1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UD5+W5mT; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2gL94qdQzDqd9
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 16:38:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BC39D962;
 Fri,  2 Oct 2020 02:38:22 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 02:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=D0PMBdn/wTvznX82sgNZM7vVGXxnoKD
 SpiAyvlQLC3w=; b=o3eHthi1QwJSs6IcOyc+L2ELEeD8+wE/aZLPhiWLsJC2IB/
 VbiY/LqO9Q0hp3hEMO6KoeBP3V171v07U4v/+eBSyLQLdkT5n7dL43CQ10QIjI2f
 wbTSx9IuNWQ/mGtjVzQwzIcJ3nl6fkfPBbKiVAzhlog/lX/mWYWUzyVjzcK9kG3t
 0JpaSSTZE3SxDJDU3rO84rgumer3PYoPiTIZPQJgkD9DQR0h8ZeYbMZoCqDCXh3q
 gFDF/Q1yuMB0JfeOXGifWl+vaSuGVCfpB3ZVwsSo+On95VBXRukEYpGy77m+BGy2
 Y0kIWVE0Un0lA1I76XB5KTy0ynbHYr1yx6qPelQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=D0PMBd
 n/wTvznX82sgNZM7vVGXxnoKDSpiAyvlQLC3w=; b=UD5+W5mTXMuGviSilBriAh
 +05bzliymxeflS9gY4e5PtcsBvW+psorXIFSl3lPN1bSnDDkVxAXRXHeicb5OtIK
 bZC8oDS1MaHmXw+FtF1bqiy/gF3+Zql/Scr+nOz7GbUzOFDpKu9ot3gZKk60w+79
 jzDtjPC4ifTKWjFlvqSANUr8QJb3fzhX5TUxPtKKdMRbDo3EGxlieMLV0AxqoqK4
 L6vAJE1m9/NhwQ+4WjJc3WQiRO6J5UNwvAM58mtNY1D64XmrbE88K+L42fso8LeX
 tEzs9qH2nnjnqYhbpsZ27Zpg0pNeRHeGOPGlSbbgAO72FGiByUmOj6rpqAxd6P+A
 ==
X-ME-Sender: <xms:3cp2XzJxbE_kPWDdelsT5VNYnPyzC6ilDRpbLwgEMOMxG9zPGNrbfg>
 <xme:3cp2X3I67TziiMiQburXk370PDMI6Udvp8-o2Z2AG7JZanfaL3Xc8-uSE-nz4qKgn
 Bwe3Gf2nJGGPtu_vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3cp2X7um_McYbnyCJzoTcHhviHLpFIkJIhQXM00_qYDWRgx7_OxBbw>
 <xmx:3cp2X8ZrpkdvtaFU7MGqS6VJWB1Z5cE9pmYeT97F_tEIZuxamLDp3w>
 <xmx:3cp2X6aLe1ExmGW8JVktvUzwwHiUD1bc5Y4uiHs7W7UwmFCe3Yuz5g>
 <xmx:3sp2X42JH-IicpqBEg9zoBf5Y4FbRa-B6mVaYY89NxvhHKq6q_6CBQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AD30AE0120; Fri,  2 Oct 2020 02:38:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <8e00a2c4-af03-4ff7-b631-fd81d0aad9fc@www.fastmail.com>
In-Reply-To: <20201002063414.275161-1-andrew@aj.id.au>
References: <20201002063414.275161-1-andrew@aj.id.au>
Date: Fri, 02 Oct 2020 16:08:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 0/3] Enable pstore for Rainier
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



On Fri, 2 Oct 2020, at 16:04, Andrew Jeffery wrote:
> Hello,
> 
> This series adds pstore support to the Rainier platform for recovery of oopses
> and panics.
> 
> Patch 3/3 is a minor cleanup. Only patch 1/3 is a requirement as 2/3 is handled
> by the config snippet in the bitbake metadata.
> 
> Please review!

`--subject-prefix "PATCH linux dev-5.8"` etc
