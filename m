Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3744B2EE
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 19:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpcdc1XsHz2yPv
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 05:56:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=E/H2hPIA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OdzffJXW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=E/H2hPIA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OdzffJXW; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpcd85n2vz2xDw
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 05:55:56 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 647C25C01B5;
 Tue,  9 Nov 2021 13:55:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 09 Nov 2021 13:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=b/T
 Y/wiOzNv7C0DlKBRTAvxt5fjVFZmlNyPqwaeMbDE=; b=E/H2hPIAMW/Z3XrdB1E
 wWFULsRaS2AdOHin+8m2U6i8EYOkD70DVz5sQMHaQdFHmr85USe0LelH+chqXkJ1
 Y3ZqzVQFKwKytFnkvyrwuLGznNlBU6nB+BshRdFlmTHTV4UWH2s+PHH2rXc0aCSv
 aa06O6v7x+rcpvpVhmhvg8AIVlMvjfUnjQRHIsaVUztYo5StgseVgaGZejKsd8+o
 NRKsVM3P8O8CeXRxH9vMFnLGbid6j7r9BGbQPh5TkATpro8SBH6DIlv55bMwLLDk
 2EdbrpVm8+xfLOXU7hFTfNMyXCKOO2948kLhuxU8XdEhyLMcsU8sX0tiQpHVvZFu
 BNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b/TY/w
 iOzNv7C0DlKBRTAvxt5fjVFZmlNyPqwaeMbDE=; b=OdzffJXW3+TxZOuuy9m89/
 Eue0AbigJkk0uBkH/SscBHwoVfuyBv8mj/CfhaUtaJff2YL3KaZVgBM/szU/N6qw
 ZsYE4n8mP46Eno3pffmALn219Ier/0BnmfHg68JzuXlopRtELe4xIIzQXJj5/B9H
 aAuGjTtpVFjxJkoVuoRpZYpqElY1DXPxoq3a+UMbnNqIenIA6MqHy8EvjTl/zLIP
 GX1hvaIva10vEfxnEALUujmdL2aJ3PgtAmYbBN+0JIYLWkNRD8Ueo8WFcMCUuoI/
 NUEpQ/K67cdLPtP64gTapy/ccx6KK1+sZQJpdpBsP5l2FZiNbFLNoq4bR3zZRJqA
 ==
X-ME-Sender: <xms:OcSKYQDjMlUASUPkJxn0IvB_SlFrKmyjFrSjb_dXgi_4EpcAnMSE_Q>
 <xme:OcSKYSjDkor55hblioVfMGHFOiRSqaV-wfl6-hdcdep_peHNfRtaqmTJAuRt3iqh_
 HIHMdtGMBlZbgOToB0>
X-ME-Received: <xmr:OcSKYTlgE2zp0puSz8xKQC4ENB8xy5RuTi2W6cdo2PZeZzwuCbfG1E4e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:OcSKYWyaItRs0bBGT-OXtFSipp1zPJC5MZBGGJ-LcsGQ6b40syROcA>
 <xmx:OcSKYVSMTKlVG4_hq5VjAvHK5GltSYG4TF3PnejOEshYNI3X1AlV8g>
 <xmx:OcSKYRbUAZJmuOGFlyda29TBwJ5NCtzdKJH4EXAIx8FUariIZCMdmQ>
 <xmx:OcSKYW7rzG7BGBlMftlXssHGZW05UfelKfF1EaCrnuGL603dbCL5PQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 13:55:52 -0500 (EST)
Date: Tue, 9 Nov 2021 13:55:51 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: documenting object associations
Message-ID: <20211109185551.6e47o7xnzfesoaxe@cheese>
References: <e41ba66012487dbec35d73ed82fcc95a8a2927d0.camel@fuzziesquirrel.com>
 <a2ab6e03-9bf2-4b7e-aae0-7883fa325265@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a2ab6e03-9bf2-4b7e-aae0-7883fa325265@www.fastmail.com>
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

On Wed, Nov 03, 2021 at 09:17:55AM +1030, Andrew Jeffery wrote:
>
>
>On Sat, 30 Oct 2021, at 05:04, Brad Bishop wrote:
>> Hi all
>>
>> I recently submitted a patch[1] that tries to establish a mechanism for
>> documenting our DBus object associations[2].
>>
>> The patch has been merged - I am sending this simply to highlight the
>> change and to encourage everyone to document your past, present and
>> future associations using this mechanism.  In case you missed the review
>> feel free to reply here with suggestions for improvements.
>
>Seems unfortunate that there's duplication :/ Is there a way to resolve it?

Right, I assume you mean that name and reverse_name are sort of 
duplicated in both interfaces.  We could drop the reverse_names - it 
probably isn't useful to know the reverse traversal association in the 
context of the origin interface?  Now that you have me thinking about it 
reverse_name is kind of an artifact of how associations are implemented.
