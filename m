Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39895E0F1D
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 02:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yWJK3NfpzDqQ1
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 11:21:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Pl+G1G0s"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B37WkV9T"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yWHd4cpyzDqN9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 11:20:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD6922203C;
 Tue, 22 Oct 2019 20:20:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 20:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=jzGv83Z9FesPbJMjw0o00esjvlXd1+1
 qeQg6Uk5KdP8=; b=Pl+G1G0sWNAf5ohtq0I8ZbrJOSRo/ZBBtceaXGfFEQUrCmw
 DeFE+Tpcxi+rveitr17CtDBotBvHm3AzoLsXlSNoqjXxSHdbWZWe7iaQSBrZjKcY
 DZ1EM7Z07xiF4Fil2HGdUW+ESpo1wwta1aJW4o+MIC9nImf7Jc6mIKfRNEDmEudg
 411sy3nnXEKUu3G19TqsuggqTEnTyXNB3376//8hRIrFknxe6fLtWnOGX2GAcUSw
 xNREzT+a5fK4dmgV3F8ElKI2GY0J0IBs1HZNwQUQASL4/N7bLSBXnH8tnnYwYZQF
 nz1dCINeWEnL5wE5sm+2i5DGSLIldWjl+VdugeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jzGv83
 Z9FesPbJMjw0o00esjvlXd1+1qeQg6Uk5KdP8=; b=B37WkV9TYBVj+Ei8FJ4zTS
 Y61H6b1J9ClPUSMxc4afe4EvOFXdKzeuf2AxfRaLiCLkKWWGg5t24PsGTHHMzrZV
 ecebjDhnJJEYmK1ll02/F9QPAgKkoitCf971qjf5ZOZgTp1IT1VQbaU7GkcW68/N
 ErJfdviCfh2irFgWuGLpj+e2t2C+uuUYFfrIME48YHqlNQTSDFeYy1i4IPzWx4Qk
 Zxglu4JBIVj8ayJt0Qjy7xvEVDzm+ax6sOkk5oIvAO9IXyXEvdYB16KwuNH2pn2w
 MJ6o4sa3bA5d0lY2kjqnYOZgLDMQWKOP6Aer+KLEwf/HOjfIB6rftPtNS9eG3A4g
 ==
X-ME-Sender: <xms:2pyvXepGLY1tu8R_SCzZYDMGetYNaEn4B49kIwhGrMTerZNGOHUK9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeekgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:2pyvXSAZPgj-qkwWr_aPYxpNmkNEezDDblM5JcZjKkvPXjyG-nZj5w>
 <xmx:2pyvXW3t2K9FeBltBiSqiK4AwPLqvXGMZWu7D9d3JYl7J4H1VvxKjA>
 <xmx:2pyvXdx-CXTvVqRbc8raGjzXxgObIDbahqRnnzp8O691ektBBTvk4Q>
 <xmx:2pyvXVJWtnpnQtGQqXk7Iz-fDvDZGOY5L-X1NI9kNYxYarH2RxnC-g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 30CC7E00A5; Tue, 22 Oct 2019 20:20:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <3a8ba7ea-1b2e-4f5b-b272-c819a20620b1@www.fastmail.com>
In-Reply-To: <000001d583d2$a4456600$ecd03200$@linux.intel.com>
References: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
 <06d793dc-a0f0-4917-a0c7-135767f6c19b@www.fastmail.com>
 <11B7B23D-B689-4B0B-A177-E6E4891C923A@fb.com>
 <000001d583d2$a4456600$ecd03200$@linux.intel.com>
Date: Wed, 23 Oct 2019 11:21:43 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Yong Li" <yong.b.li@linux.intel.com>, "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: speed-bmc-misc driver
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 16 Oct 2019, at 14:34, Yong Li wrote:
> Hi Andrew,
> 
> Regarding this bmc-misc driver, I noticed the exported sysfs entries 
> are read-write. Is it possible to export the register value as 
> read-only? Sometimes we only want to display the registers, but users 
> cannot change them.

I strongly advise against using the driver for the reasons I outlined to Vijay.
For OpenPOWER systems we're using it, but with the knowledge that I'll
need to fix userspace when I fix the driver.

I'd prefer not to go adding features to the existing code now for that
reason, but I think controlling the read-write/read-only nature of attributes
is a good idea.

If you want to improve the "driver" so that it can be upstreamed I'm happy
to help out with that. Basically it should be changed to a light API that
enables creation of these types of attributes that can be called from
drivers for the device in question.

Andrew
