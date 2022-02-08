Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E803F4ACFF4
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 04:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt8MM4kSzz3bTH
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 14:56:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=xNLHyRt4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H9fUJsAn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=xNLHyRt4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=H9fUJsAn; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt8Lt0nJpz2xXW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 14:56:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BC27C5C01F5;
 Mon,  7 Feb 2022 22:56:02 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 07 Feb 2022 22:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=sZxcbCKQeVYtYPFLt0ncyjk1sdeTMnAdU8oDJ5
 rEt9A=; b=xNLHyRt48CxY4tJw00dZBMDl03rtWFOglEsL5aBeVb9FCazUXEO7uH
 7LPK775880o3WH6lXnzUEnPWTGZopH+a+pj5kFxH9Bg6/ExtHkqarknP1mpKOCVy
 HmDn5IpW2wEC3WbhJu2lCSowDB7+rfHqX0WMionSNU1dNQz9dHaJ10PmxYMwGLnX
 P0Sv2NZiT0442H8CR70l8R4B0ZfD3m03CcZ1NS4fuX+U9AT9rL78804uhoFz81dO
 tu2IxRj0hpiVMYlqkF8Nx3rC1dG5Kl1iOa2Bwk9g9JAByODpXwq5I37QTgtXH5VI
 Cn2mX5DoEW4wfK6cQ536WP3b/8jYuIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sZxcbCKQeVYtYPFLt
 0ncyjk1sdeTMnAdU8oDJ5rEt9A=; b=H9fUJsAnCdyLVlbBsdsTMVVUo7+ZWX/75
 vK2qM/9c53KbQ52q2X/RRmvMq6OBsp/xFszIUW0EOHY5KifPT0pD4G/nKC+Q8JRa
 nlamEB9Ca9s2IUJovfmnsTIp1NJK5kIKPr0S1P+dFxdRYFqfk9b5BvmuAXa/lemU
 pjoyxVmIhGqwRHP7TqLur0vKKOHNcfnwhpDRm/EdHYRy242JLKhVj0VL4qkAgivQ
 1M0y69m3f/GC8JLKUxrcDelAmznMrzKDT9hi1PzSShtE/+JB7FamrH2eN8IVl/pn
 vwP46mbopqNJRwYyGx2nB2Cnx0oWMGrhg0a419tGq74JeBw1Q3mHQ==
X-ME-Sender: <xms:0ukBYi_ejGBP2GnM7OlCUVqc7dPMSU72SVojZZ-lyIivz4DErkrfJw>
 <xme:0ukBYivw4ojKWpanbKpJuArz5P8d8YDAIEh7GMl0TnGo5HVW_uHk2pULzXnUSjmIJ
 Yw5s7MQZqlnZMfQHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:0ukBYoA8a9XR7xR-q8aAmbM29-_vY2CUItVqt3ouoir7qKl8uDonbQ>
 <xmx:0ukBYqcu50E17e7uQq2OyL5NRmqDs5f02oGA1UDX-00svgJoHRsK3w>
 <xmx:0ukBYnOrkNO7Wo2Jws9oBMD1gk8MpCAJ_RgILpEwxUJUiwtM96iRlQ>
 <xmx:0ukBYpVpM4TdAA6qFZCGRObVC4Ig16sH0lJcmqP5efhwNfRK_JeISg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6AB191920081; Mon,  7 Feb 2022 22:56:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <7df201db-9bc1-4a01-8651-3ecc2a1b78c5@www.fastmail.com>
In-Reply-To: <20220207231334.59845-6-eajames@linux.ibm.com>
References: <20220207231334.59845-1-eajames@linux.ibm.com>
 <20220207231334.59845-6-eajames@linux.ibm.com>
Date: Tue, 08 Feb 2022 14:25:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 5/6] Add GPIO hogging
 support for AST2600 openbmc config
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



On Tue, 8 Feb 2022, at 09:43, Eddie James wrote:
> Enable GPIO support in the SPL and hog the GPIOs in the SPL only. Also
> increase the size of the malloc size in the SPL to get the GPIO driver
> loaded.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
