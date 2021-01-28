Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5F306AD3
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 02:59:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3YQ2Lw2zDqPw
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 12:59:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=JqXEiPaH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZXD2on5c; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2Mb2LjxzDqPg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:05:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 477B25C0224;
 Wed, 27 Jan 2021 20:05:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 20:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=yDQ
 vnTndnbA+xOANVZZhS3a7/H1023cWwTFEqjsiJF8=; b=JqXEiPaHHIXWzDg2lNw
 KFepiPq0Zpmqqhd+/bD2NAVjOZLXbhHY4dLJfCF2vxiMCcKQkzm+zYBHEOR0+NQw
 mb4ylrWtaGZ6zvjzCvU8GSaLLqo8Q2niPRgHuBMkwES8/6uKk7UU36b4kptv8vAY
 Yu7T2+pCnQIcn3mV7xCoqCMsIS0uIYVoHXFlvLfUhU3yYNYJHWmwHZJQXCbxkrCO
 1/Bn78pZKhHs2PbBhHMiRGgz6Jtr7tqDgIOyPSB5X5x+CgTcajsQBPzQUjknV2RY
 Q1V01str8kCjD4LZRNCHZE4JdQMbWW+TVnK+IOf38T+++92AJby7WqMhbJqC8jFA
 bfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yDQvnT
 ndnbA+xOANVZZhS3a7/H1023cWwTFEqjsiJF8=; b=ZXD2on5cBcBpkNd0JQkQUh
 u6ZcYzA4w14G0J+iNJiLACckUZbTFSTHaMuXV6gal43LXdgdTAKMLm65vEZq7wqA
 3lWBSAhSHP+g/bBdBplQMupwuszmu7BaJ/aAPnsnQ4pMqk90ablcu6h4LCizhc3d
 lY/hCqFJbJ5qUFkbAi0JcHGvLb09KIfETopxT8FR5qj8Jj/Cs2Ok6GdJoZORPHsc
 CmVaMqIaVLex+pyQ+GazqILeO3QPQnmPQTscrhsAdHgm4S6QTQPtAYCFliNv1tGQ
 PcVoC7EihrKbp5RscU/BEPagfXUJdmm+najGiBARmOLWkr3gM58FSnVvTeEggWqw
 ==
X-ME-Sender: <xms:1w0SYCBBI6l32L1kVhf903WuqNjgFUbhsHLdEzIlomSCKaX1cey9jA>
 <xme:1w0SYCHauC0d1JU3hmxb93OkrFQO0C8AhCrlowkmjCWCR-qJmFiXXttEubBUAfgNN
 JJedxls_eXEH2UOb40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:1w0SYPINbFRKx4sFOFRs9LrwcM6RAL_i4lI9-3Hu5Gn7B_yZVZwDgg>
 <xmx:1w0SYBqaJ53CzZUmtgGxzkMacMfTS7nHbwBZtKML0xWgNRokTKfwtw>
 <xmx:1w0SYOgURJARNOA220BjZ1sN6Qzjv8FTHLdfvZp7SpWogkFoETXdxg>
 <xmx:2A0SYDoftrSnWYx0cg0ftt7d0j9P5cblqeedgPAbN1FNb8RcmrE7TQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CB36240057;
 Wed, 27 Jan 2021 20:05:27 -0500 (EST)
Date: Wed, 27 Jan 2021 20:05:26 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Progress Codes in BMC
Message-ID: <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <YArmnhlS33TpVo63@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YArmnhlS33TpVo63@heinlein>
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
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 08:52:14AM -0600, Patrick Williams wrote:

>I was also going to point to the postcode daemons as a good starting
>point.  On Intel platforms, the postcodes are typically 1 byte.  The
>previous postcode daemon got its data from the LPC "port 80" mechanism,
>but Facebook/HCL recently extended it to support multi-host and to be
>able to consume postcodes from an IPMB end-point (which is how we talk
>to our per-host microcontroller).
>
>I think it should be fairly straight-forward to add a new mechanism to
>pick up data from PLDM or whatever your path is on Power.  

There are multiple sources of the codes - on Power the power sequencing 
is done on the BMC and that is considered part of the server boot so we 
have both those applications indicating their progress along with the 
more traditional progress flowing down from system firmware.

>The daemons
>in question here already support keeping a history as well.  I think the
>only think you'd need to do is extend it to be 32-bit or 64-bit progress
>codes instead of just 8-bit, but I see no reason why that shouldn't be
>acceptable.

Our progress codes are much larger than 64 bits.  More like 64 bytes.  
Does that still seem acceptable?

There were lots of great implementation ideas in this thread, thanks to 
everyone that replied.

I'd also like to sort out the external facing interfaces for these codes 
though.  My straw-man proposal would be that these are just another log 
service with yet another additionaldatauri attachment in the log 
entries.  Is this a terrible idea?

- brad
