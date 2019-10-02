Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A4C9546
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 01:57:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCk26TxHzDqW8
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 09:57:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iWosrl3l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Cg6RrbIU"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCj60bJZzDqWH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 09:56:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 60BB4220E1;
 Wed,  2 Oct 2019 19:56:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 02 Oct 2019 19:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=46TELnxz/mm0bxpvJdgDgggp6UpfQ1F
 KgUXpGdgZmmk=; b=iWosrl3loHN1FcP2Lv/uiQBkFG9+4NQxhwa22FCAWb009TX
 foH9YOfahvzfYGrNwPO7fvEF5XKtRebwz9CWPHVyyBmywZeeXvqpSJM2MBKJzpW4
 lgOxcQjz+sB274DjnBO/59+5QMQV4QHxiuWpNyVSPt+RkpEQtWqGE/3rnF7tMSgv
 5cdsrwPzIEWx2KBb61DTUggDuZ9/MB8srpv32HTJ4UTVUyKOtE7M62XUzfEO6n7F
 4z0posU4GT1UN7290xqwjFRFddR6pFEy78bhuGVYdRGa0tvpnOYI0MWUAj0Myawi
 FipoUythYhgNynGUtok6SIIiKpqwIih4W4IM2ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=46TELn
 xz/mm0bxpvJdgDgggp6UpfQ1FKgUXpGdgZmmk=; b=Cg6RrbIUjcM5cWXh3sT5sX
 KmcJdL5Y8Vu4FBznlCbs2Xq/+4nekUTZBIFG1V28nQBsQLeIB/FwPufVhHRiBEbR
 anBP3iTapF/rqgPAB7ARdS5CH8zId39LPFBBIK3aK+kRQ6UP5ZfWcWjgSE8fN5Iy
 mhBMolq6bAxyqFv2a+ML7GjIsoHJU6Qj2kMvtIO1r3z7rDVYSsyBnntU7lzTQW4N
 dx/pStmWvNEBn/t5ltfU+42VDBS+ESnM60oR/bn3S2t8if/csyonEAJFJmnT/1fo
 ST6ww4FKcMXDBzXqzGw8Kp9JX+hS8a5EL1hLYJiF8OGbvpZhXNSOJXQWDrBzjlOw
 ==
X-ME-Sender: <xms:NzmVXcIID7uTFGLCWDx1HzODZXSz1uPUi23g491waxLJMtxHb8iUlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:NzmVXWOr5hzzyQntN038ojigW-HaZUZJKg7iONw6l97aJ0CUtxrEjg>
 <xmx:NzmVXflD87WSsOrrVrI5AEdvxDetZzgYHT4XH8lr7a8dUheItcP_tw>
 <xmx:NzmVXRWSlmjNUsGvTszwtdaGfxpVPMvDPN5LacCCDlfHWFE7ghb5Vw>
 <xmx:NzmVXVCG9U7pHRju42ZTDYlT1K32mi9pbdxKNeiXzb_U20mpansfnA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 36EE1E00A5; Wed,  2 Oct 2019 19:56:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-359-g64bf1af-fmstable-20191002v2
Mime-Version: 1.0
Message-Id: <c6399a1d-e6be-4c52-a8dc-332cb8be67f3@www.fastmail.com>
In-Reply-To: <20191002102328.5196-3-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-3-joel@jms.id.au>
Date: Thu, 03 Oct 2019 09:27:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3 2/4] ARM: dts: aspeed: tacoma: Enable VUART1
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 2 Oct 2019, at 19:53, Joel Stanley wrote:
> Like most OpenPower machines the VUART is expected to be at /dev/ttyS5
> for communication with the host over LPC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
