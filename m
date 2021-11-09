Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4C244B961
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 00:35:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpkqS12rVz2ymS
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 10:35:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=bJ3b03sH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LfeKyY22;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=bJ3b03sH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LfeKyY22; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpkq01tmZz2yPL
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 10:34:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 142335C0192;
 Tue,  9 Nov 2021 18:34:47 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Tue, 09 Nov 2021 18:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=mFG3TxqG5pHXHGz65SEwpvM5HsNO+oR
 f/rIAXH/ygFw=; b=bJ3b03sHEt8s2Rd9114NliesKLB6iwIKFtRrJxRvd7pOd2f
 BNdWr+Q7VXiWdxdRWPpYU7ayz5q+OsWvWgH8E4hHN7VGE4qaZ4GK4UbGuAk+5ePV
 qjkYGIWAFo66yQZnge7fANvLuBQCXdJO0VSAqYezN9Wgm8tU+GYdOpE1X2x419Ox
 rxIes4zqU6PX5jd3KunOxGXQPF0KFGIrX5B5u+g95FMN8gGuwawR/2gSJVZ8r/ge
 QTzyPU6ezUxsjaxwm8Xbs0hs5FzbaP1IlSR6lccaeT5qFUHGPaDo2HZv2Etje7vI
 1QiUsNid00MmGf5CaZmRyshFYcGOougDUCt4Waw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mFG3Tx
 qG5pHXHGz65SEwpvM5HsNO+oRf/rIAXH/ygFw=; b=LfeKyY22rv17mgb/qkeRG4
 ir0e5it3xLYL4t+7+RnjgaNasao2wKoJ2rc5zXWk1Z5cyDIXTaTQu8DCwQL3oIyr
 YPe0zbaG5Ndo6v3KeDntv9iQu/AhCg8YJAhMtgoQjGJw1BOheZT6wGjxG2EAGhNo
 t3hCrk01oQ2eGztMJQJbOjqSkQUx+oBT3wC1SKtOMeMIBAq9J4G0cu8xY/Bkg6s5
 Wo7rHRtrUjiII/y5DZudXlALX05czGjrgS+3e9IKOxyPYx5ecS/wZrvE1fBkbdmo
 hYpH20sT0mux8fZozRc+/uHPOWUZdpQ6m0RANg9RgwhLsSQu0nR4NlyCFNBg4kow
 ==
X-ME-Sender: <xms:lgWLYZ_dWib1v7nHyCyxXuP9V_Hf5QV-rFIODkfDNoyGfZQD4sqSdA>
 <xme:lgWLYdtSV3CmUXjaWNaPFrb2Yi13f71RymSm95SoHBsLE0ZDNGae4emiYWiFFenrn
 6-koX2Y2RpLC3RkvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhephefhfeekgfekudevheffheeihe
 dujeefjeevjeefudfgfeeutdeuvdehhfevueffnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lgWLYXBh44yRpzwv0otsX1COpL2d87GvCCwvKfqrQrGDQBNsvtaJfA>
 <xmx:lgWLYdeIfn4jKZPxMHY-SiH97WoP_USlqDMHo4RTsW5pGLCLhwRRlw>
 <xmx:lgWLYeMxSV9gKfuHcCnt8rVb1m-UE5kghD6HbKQE2WWgumjFAvt_LA>
 <xmx:lwWLYRbmIib6FhCHs0xSFpJsgBEqDZLuGyyBS47u0Lu-Es6y_JG-WQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D6D2BAC0DD1; Tue,  9 Nov 2021 18:34:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <37d65a1f-b6c7-4130-873a-00264d2b5cfb@www.fastmail.com>
In-Reply-To: <20211109185551.6e47o7xnzfesoaxe@cheese>
References: <e41ba66012487dbec35d73ed82fcc95a8a2927d0.camel@fuzziesquirrel.com>
 <a2ab6e03-9bf2-4b7e-aae0-7883fa325265@www.fastmail.com>
 <20211109185551.6e47o7xnzfesoaxe@cheese>
Date: Wed, 10 Nov 2021 10:04:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: documenting object associations
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



On Wed, 10 Nov 2021, at 05:25, Brad Bishop wrote:
> On Wed, Nov 03, 2021 at 09:17:55AM +1030, Andrew Jeffery wrote:
>>
>>
>>On Sat, 30 Oct 2021, at 05:04, Brad Bishop wrote:
>>> Hi all
>>>
>>> I recently submitted a patch[1] that tries to establish a mechanism for
>>> documenting our DBus object associations[2].
>>>
>>> The patch has been merged - I am sending this simply to highlight the
>>> change and to encourage everyone to document your past, present and
>>> future associations using this mechanism.  In case you missed the review
>>> feel free to reply here with suggestions for improvements.
>>
>>Seems unfortunate that there's duplication :/ Is there a way to resolve it?
>
> Right, I assume you mean that name and reverse_name are sort of 
> duplicated in both interfaces.  We could drop the reverse_names - it 
> probably isn't useful to know the reverse traversal association in the 
> context of the origin interface?  Now that you have me thinking about it 
> reverse_name is kind of an artifact of how associations are implemented.

Yeah, all of that :)
