Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86649494344
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 23:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfLVc32M7z30hX
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 09:51:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=MSjB2aY1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gaVTuARK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=MSjB2aY1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gaVTuARK; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfLV63Lwcz2xv0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 09:51:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CD005C013E;
 Wed, 19 Jan 2022 17:51:21 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 19 Jan 2022 17:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=vqd0bmt32sMD2FhrdgDMOUdASKD1Nky
 +3PB95BIQMaE=; b=MSjB2aY1H9dGjZOlOOdfTnkJzQ3efHFAq0E/BkJ1H+69vkx
 eAMs7bXRQKnoLM7PwKzfLGZm3HiPuOMrTsvERhtjk0T9G6wMPQARL+uyfMyaaXgD
 h6dTOgzAPkf/VO2GdzBv40cc9n1nQ4OoGG55XWRsqYiHJTnZ8UFO5wihYXJ6l9ZW
 m/ZkWa387xWJ6JjJ+hHdUjSz1zWGmmPb4K7A4rFdiQDtSZprwW1xvQohXBGIpTp3
 KzLswpIrHl455C2XWYs3QNLhMCYIPmRc6oJ6xPaSi6n8P/RyDOcMS0s3BdCV9Z9m
 RIGPDdBzmmscSEnxT1AGSJM+d0O930xMZ6Cdo0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vqd0bm
 t32sMD2FhrdgDMOUdASKD1Nky+3PB95BIQMaE=; b=gaVTuARKhXs5gH8IPaNGNl
 CSMB6kZ/GsQStZctsrG/n/ljeDEpQy1mkw/xI8GdI3MGDJj/b+TXN0nLIe2ZMj/D
 c5xgFzxmPeyPdnY5aOLw5yLAmgoA0VYPA5Wa0JpYLPseCV0eqebYWGC7yNIHr9hU
 FFsVY8pfqMFbkBmXKutu3MCgCddeyJslLj+scDTS/aYZ2vK3u1eKjI1pLwEF9Z8r
 RtbOJm+yFPAMAOkGWGOB5Z0WonwJHc6Spr3nR1cj7aWjA5CCzrv9wvKVBDcS3nmu
 V+PLl4RafvqTBNXpC+rm0eiTNcBbz8aUV45DgOqSybJafsit0Kjaqv8HzdjXyoPA
 ==
X-ME-Sender: <xms:6JXoYR6yRboM4vZbpevTaGwh324bz7Wz00kEMi2xQW9tVYfXW9zX0Q>
 <xme:6JXoYe7mUW3wcOeQgta1RH3dttkprhL2nmgOHjSHRq0_aK45jDchPqvGoox0edFRI
 xNbppQWvEuqI1lIIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpefgfefffffghefhfeegfffhteelgffhgeegjeetleevvdeuleduteehkeeh
 hfeikeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgtohguvggtohhnshhtrhhutg
 htrdgtohhmrdgruhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6JXoYYd_IWBoPX-XKm_801ihBb3o_a0LBL4qXzPUrYKOTqLkE4WZDQ>
 <xmx:6JXoYaICLu48kUjOVncB9Y8hoKwi9bz47y9w6Dqhmx_Zecer0fI3yQ>
 <xmx:6JXoYVJvkOWJ7nldeWJF3Bf8CsoEEFFha84DXIzJrzd7jbiL5gtiYw>
 <xmx:6ZXoYV0fwwJm2wkjwGb5NpbV8HxY46Mm0KIzHsMX7IJV29h_hMzCvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5BE34AC0E99; Wed, 19 Jan 2022 17:51:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <ab4ba81d-1fd2-4afe-a628-f7c06a37c4a0@www.fastmail.com>
In-Reply-To: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
References: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
Date: Thu, 20 Jan 2022 09:21:00 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tung Nguyen OS" <tungnguyen@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Jeremy Kerr" <jk@codeconstruct.com.au>,
 "Matt Johnston" <matt@codeconstruct.com.au>
Subject: Re: MCTP/PLDM BMC-host communication design
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 18 Jan 2022, at 03:03, Tung Nguyen OS wrote:
> Dear community,
> [Switched the email in PlainText format]
>
> We are using community PLDM/MCTP code to design our MCTP/PLDM stack via 
> SMBUS on aarch64 system. Basically, we have 2 CPU sockets corresponding 
> with 2 SMBUS addresses, and the MCTP/PLDM stack looks like this image:
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303bbb6e9c8a6f646/current_design.png
>
> Due to the not supported of discovery process, we are fixing the EIDs 
> for host.

This is true if you're using the libmctp userspace solution.

This isn't true if you're using the in-kernel MCTP stack with the associated utilities from Code Construct:

https://codeconstruct.com.au/docs/mctp-on-linux-introduction/

Specifically, mctpd can handle discovery and network setup for you.

The kernel solution is the future of MCTP in OpenBMC, so if this isn't part of your plan then I'd encourage you to consider it.

There might be some work to do to get the latest work from Jeremy and Matt into the OpenBMC kernel tree, but I'm sure they will be happy to help out.

Cheers,

Andrew
