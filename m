Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70735BAD6C
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:12:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cC9p74l2zDqLS
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:12:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VyKUoxaj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Gcui66fj"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cC9B0Jv8zDqCG
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:11:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 042565C9;
 Mon, 23 Sep 2019 01:11:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 23 Sep 2019 01:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=G2AR3yM5+I64jGXsAzvPABOBRgS195m
 sLM2APpzGtOA=; b=VyKUoxaj1j6/WrJ1LtRb52bc8+DRHJ533yTtame2nRiCi7W
 LSros1B7pLKcAfKmAe4YIXTvfg1AagxatESLHNcPNczPtOqtZsvkL7swIz0upW66
 gvBC770BDCJCVG3rM1JgLgxDqVPlQqXVhJNXlAOEvroVX8E2VWyqxncpoaekbUHB
 cH6wyx0OKd+9h5qXFfIlGu/iF4eniIZtaeyburdN1MM8uzAoZCQo8sjBjZosgK0h
 biOfZvfeJ9R8N5vLmfHDixrs1B8Qce2K8LorGr7RHZnOB7b1AletMDZKdkgaZEZL
 TLeyWlByqSBDSbPoCppaSNrBzB1sCdd7/EnDdHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G2AR3y
 M5+I64jGXsAzvPABOBRgS195msLM2APpzGtOA=; b=Gcui66fjRhrcEgTGAyIf7Z
 Wutfv6dmhN9fc/ng+GN7xEgPSpvJRtxPcBZHYDsal2J5QsBu2Tg/ZTlOYU4sLoOu
 JAIayI+ydmSoV7Pz60sngaC9n2NXqNpI9nug03+b5LYcDaGdNDdBuXKz3NozNNEW
 WJkn8ZxpDjOxJcAjsVQs/I+TsIQEm49WvCAkWkihe6RDqW53SJAaJ03YWc9s2/xT
 YtieznBPnksRSjW8nzUXZyZqScslAcO1N+bEwT6AmQeIEFGMhZVezIsgzDQ1ZdUy
 JAASkA1+EGJS2GOq6pStpQgeobI3fNKKtvPJjwsuQQ9gq/jDQII2yodqNPWGzMeg
 ==
X-ME-Sender: <xms:B1SIXRZNTRAaHMwudk2EqoxgFajwwT03OgRM24hMh2Tg46sWvKvSLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:B1SIXW4e3qd63ljt0R0VNbRzbTcy1SCSoDToVtn7Q4xL3AVmegekYg>
 <xmx:B1SIXfcHcBjiVQ-53DwxwwGQCizzj99vfudCHT6VAMM3VAm3lP9CEw>
 <xmx:B1SIXZzhCnupYii6Nc9jSZzjkhoYQ616eQrixWXdb_J18SUMSdvYgA>
 <xmx:CFSIXcroynnGMRBDQTWwPWztps7XtPgCtrLn_mtc2X2IkMBstciY_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9E73DE00A5; Mon, 23 Sep 2019 01:11:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <e45238b0-e1ad-4de1-9b18-15872ffc520f@www.fastmail.com>
In-Reply-To: <CACPK8XdHCM6h52vXFqF-3vzXfG+2--12nYM=3MdQQvdM1rMcGg@mail.gmail.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-4-andrew@aj.id.au>
 <CACPK8XdHCM6h52vXFqF-3vzXfG+2--12nYM=3MdQQvdM1rMcGg@mail.gmail.com>
Date: Mon, 23 Sep 2019 14:41:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_3/6]_dt-bindings:_clock:_Add_AST2600_?=
 =?UTF-8?Q?RMII_RCLK_gate_definitions?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 23 Sep 2019, at 14:28, Joel Stanley wrote:
> On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The AST2600 has an explicit gate for the RMII RCLK for each of the four
> > MACs.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Put this in the same patch as the clock driver changes when you respin.

I initially did what you suggested and checkpatch complained. It's explicitly documented that DT header changes should be separate in the dt-specific submitting-patches documentation.

> >
> > +#define ASPEED_CLK_GATE_MAC1RCLK       67
> > +#define ASPEED_CLK_GATE_MAC2RCLK       68
> > +#define ASPEED_CLK_GATE_MAC3RCLK       69
> > +#define ASPEED_CLK_GATE_MAC4RCLK       70
> 
> Nit: You call them MACnCLK here, but rmmin_clk in is the gate name.
> Please pick one and use it in both places.

Ack
