Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA1BE9F3
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:12:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dxjY55jjzDqkd
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:12:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XSnp5B96"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bGEMg8Gi"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dxhl4N3pzDqbw
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:11:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C5DD34F1;
 Wed, 25 Sep 2019 21:11:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=bEHtj3mgJ0SAGpFIGgx78iM72U/Mkst
 g2lHZpu8zcAg=; b=XSnp5B96xw/ig+molyavwOky9zpfArO9ugUTHUP70xxyTji
 VAkXW1HlSeQLI+Fz+UFGWizY1TD1I58TrWmBSTdCffRQxgyCiVgCKmPjJtxpY+Ov
 fMuZ8mRERp2As5RskLQI4wGsY6f8AYo5L58cL8RX3eXGikS59gpZd5xRyxnDpXo6
 kvXVu5CCIXmxydq8Fss5oejYENUqjQjAgsgX6uNZLNBllorzKvyN8mHPamad9pHE
 uQj/dbD/ktQ/na18nyuVBPXmoC+anaIn9mEwDN2Pjpr0hQIUoGJfXdG1PlAVUyDV
 iWMZ/DgbcVxLmM3GcE2Q4r7EEccc6UWi7qQsVuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bEHtj3
 mgJ0SAGpFIGgx78iM72U/Mkstg2lHZpu8zcAg=; b=bGEMg8Gi26JzdwhuxMrs/X
 f2UIj7rym4/9audQ3a6oAEw5uQ1SYXuzu6xaaUD6nAE/hUkM+/FTG6crsMkLbI2C
 v0yxtsaWHXuy0pt8dcLoQ3meMQVNoY7V0XI7pinzbneyf0oeyOl0Xt/Rfx27QFgP
 bUeerdoIO0vdY+92RL7x3LulM0pKak9njty2VWGF/5sSV9I7sBPpdHIqNqBuboPH
 K/gGrZOXNfNzU5oKWwB70PdoIxU5lz2pTT8wm4skiznr1T8AcbIX4T2gXCTRQJdZ
 3zQ1hlYTw15wJgc/if7gBAWFgltbR7QH6zxT6oyCB9y1dfV+YSe1LCK6ux0FKQtw
 ==
X-ME-Sender: <xms:QxCMXY-ErKayS3aQRhMH7z-epCqO9e1szDHA9lZ8zRfwsxEewKXy8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:QxCMXXnRjUfe69J_3o8ArjApX2q8fAwlQBykjTSS2SM4g2HVz48-FQ>
 <xmx:QxCMXWV5M47kgoG99WXNU_QnvMjjfU639MFG_JHRMFLsyKcCRFgNxw>
 <xmx:QxCMXUGYuM8QDvbvH57frp4enqRFqmVRYiwndhSyqWm-PKSvXPdf2w>
 <xmx:RBCMXcAi8a1GphcSMMH3SIm6oV2F19heVN0RNT7VCQ5Y8WZyhaTFzQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 50C02E00A5; Wed, 25 Sep 2019 21:11:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <b98ed28d-3d5b-483b-8919-7000413ed597@www.fastmail.com>
In-Reply-To: <20190925125610.12096-4-bradleyb@fuzziesquirrel.com>
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
 <20190925125610.12096-4-bradleyb@fuzziesquirrel.com>
Date: Thu, 26 Sep 2019 10:42:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_linuux_dev-5.3_03/10]_soc:_aspeed:_lpc:_Add_G6_c?=
 =?UTF-8?Q?ompatible_strings?=
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



On Wed, 25 Sep 2019, at 22:26, Brad Bishop wrote:
> The AST2600(G6) has the same lpc-ctrl and lpc-snoop devices as the
> AST2500.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Probably should be separate patches for upstream, but I'm not fussed
for the moment.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
