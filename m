Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64356BAD7A
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:32:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cCdG1W6czDqKb
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:32:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aoFkXU54"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A8d0Kt2D"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cCcl3Fw8zDqHJ
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:32:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C6906432;
 Mon, 23 Sep 2019 01:32:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 23 Sep 2019 01:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=7kh2bIy80eP8bJUhI1c90QUtsKmYyWf
 zIiBGg7ryI8c=; b=aoFkXU54/ZIMbhvP0nAjpdXs4Iwi25bWyw1GIq88ws9wI3D
 8aW1XEGhdj9M27/pjsvGsjE8JDniknDSR2rfwaFcf+ua/SEMTV3NDtxCd1U87GX8
 qfodDdV8mJREHpTGf/7km9C3e+qNvbE5b9BazT2FT5GfLS1vWr1W+Dw4D+jVhgMr
 pOgCSnOD6bZsvkwfpYZjgN/55/2KFOsiBDjSJYJrU6eSgXcmHPJne48DNB+RA22G
 rn3qhGaINjWD/yqjb0q+OKvUO4FLptorenxrNmltCKbc4xQtz4XIv85dZKH/KBbk
 btn92gPE2kQpujBvI5sbmNUKB40smheNMaK7wQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7kh2bI
 y80eP8bJUhI1c90QUtsKmYyWfzIiBGg7ryI8c=; b=A8d0Kt2DsYW74vk8Gto8q+
 ScXA9C4n1UskMUwFeEh/604lUqPkP6aqhatDP4UgBfg/kS0CWuNbSYhsJLVViNMd
 UauZuG57r2c8tmQHGAGKzLK821GgyvThW/ROv5hQJkQcJFncTC0IHvHXxB5w5Cym
 CTRRVNk/NYlC958M32NMjAh412GgjJ19pRMFAXG+AEE/Th/nJbBi/M8x3rdsq+kV
 +7O6CE0r7LKHtAhqQbb2B1QC9F0UB9o3Q8LJsxkewReo6zs692WgF/DVaIN5iXRK
 h/bllEK2nqabX26in8Bn2Oj0revfzKt5v7shpbf52bIP/i82vZRNcCY3As265pIw
 ==
X-ME-Sender: <xms:01iIXerAJOWk5pMvO9x8a6D_2yOzEt1u1YmrL606pnYLzj0lTakpxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:01iIXYPrJj8-PKq-BxkJ-HRiYsfx0B1Ecm5mwUic9p4BQwyKHEdTqQ>
 <xmx:01iIXbABM717Q3XD-32IzzYFhoNnQxPZOV4Ju4wsR2fuOhICBMsC_Q>
 <xmx:01iIXVOSGicGlwESIGx5hC0K0Uq7rQUPCD6Z6jug3DQZU3LlRwvkAQ>
 <xmx:1FiIXcTpsdd5fZPUmGIfghGoMYwCYYfbJh6tOP-8_y-ECvUiJ501XQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B3533E00A5; Mon, 23 Sep 2019 01:32:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <383cb8cd-c650-49b4-8479-c6ea2140b0c0@www.fastmail.com>
In-Reply-To: <CACPK8XdK1HYaDkywgFSauU7VCqMNjU49JY2azyqwc7MXPeA49A@mail.gmail.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-4-andrew@aj.id.au>
 <CACPK8XdHCM6h52vXFqF-3vzXfG+2--12nYM=3MdQQvdM1rMcGg@mail.gmail.com>
 <e45238b0-e1ad-4de1-9b18-15872ffc520f@www.fastmail.com>
 <CACPK8XdK1HYaDkywgFSauU7VCqMNjU49JY2azyqwc7MXPeA49A@mail.gmail.com>
Date: Mon, 23 Sep 2019 15:01:42 +0930
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



On Mon, 23 Sep 2019, at 14:55, Joel Stanley wrote:
> On Mon, 23 Sep 2019 at 05:11, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Mon, 23 Sep 2019, at 14:28, Joel Stanley wrote:
> > > On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >
> > > > The AST2600 has an explicit gate for the RMII RCLK for each of the four
> > > > MACs.
> > > >
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >
> > > Put this in the same patch as the clock driver changes when you respin.
> >
> > I initially did what you suggested and checkpatch complained. It's explicitly documented that DT header changes should be separate in the dt-specific submitting-patches documentation.
> 
> That's silly.

No arguments here :)

> I would ignore that recommendation, but it's your call.

Yeah, was conflicted but given it was all fairly explicitly requested I figured splitting it was likely the path of least resistance.
