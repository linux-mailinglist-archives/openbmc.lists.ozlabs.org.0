Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8285F010
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 02:29:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fJkw4gkCzDqY7
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 10:29:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oHFzw8no"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bJ2K1ryW"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fJkG3lBXzDq8X;
 Thu,  4 Jul 2019 10:28:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A7BC91BC6;
 Wed,  3 Jul 2019 20:28:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 03 Jul 2019 20:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=OWn2mLh7/XUi0TJMekxt7yvjPNcgULS
 BCoi83C82YNo=; b=oHFzw8noCMYk24pCj0ny/IlupuxDjd+p4ys/R9Ec8OJoqgX
 b3W4LGtgKvAEv8CvF0/syCO2IACosaB667bLAIzW1fCsT4+tekeXDMyl3zEFaOMC
 X3wfdHDxlVZ2cTvRtREUMNFakBGD3FdqJwxIFMPo9D5x+SRmJWwsmgZea8ZIokzx
 qFrQHBEN70Np0VbSVFiJ/FMG6m7Jvf/TSMEiuAnbFyR2Tj5P/2x3ep6feeqpCRUM
 /XQM4H5W+qvlFlPR14RfVf+2+cx9GET41XeY7GI/7STl9Yln4aJ0ywSKGl7l0hKk
 d7EGxMsXHkwxl3k9BOZNgrK3iFSDGCjK9ibJrrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OWn2mL
 h7/XUi0TJMekxt7yvjPNcgULSBCoi83C82YNo=; b=bJ2K1ryWC7mcx8ZrhtqG4p
 bjjDnClvZrJYisIta3ipWFXcHpUGkV/rnES74wiSO7RXuYiJVFVOG11bOPSZakuq
 efd8A+CAL9GVQaAiVrOlVZjqmdNj6hfv4JF8muUrXYaOdM8DJysv26hKoV9mgYrz
 UmJmWhxbXsIqSIS52KU/Kh/OU1wznmLyrn8+0mVHz4Uo7fXM75evRKb0Mh9Q6Py0
 mm3IwOJuNDTEtwNCEiqGvlLZwKQP4wClYP0BP01Ts2j/ix14AKaVBexjLqKcAlyA
 fZP4j3Z40fb+1wberXaFsYGNdkKBfKdRRVRg836sXTQlOB5kkMZIg5joW6eXgqSQ
 ==
X-ME-Sender: <xms:QEgdXaQCmhwW6lVppTwfGyVi11eyWy8KVOPmoh1yLSlVp3N1IFZpbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfedugdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:QEgdXddXftyY9CXDkmK4PtChKPg5uBek0H_VhgWsl11Dtv6_rfcivA>
 <xmx:QEgdXf53eT9-j9HP3nKzzEA7iAzI-6jSOkqbwtDVfPRDkMbXPLzIJw>
 <xmx:QEgdXeYtH0YWySTHIsemK5URyZ09CZlpVSlM3hwA-MMUfvxqQKc5Iw>
 <xmx:QkgdXeWYmYs6ZpjvMHl1vd32N4O17eliMjdtMYZk0YDJLRSaiEL4ig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BCEECE00A2; Wed,  3 Jul 2019 20:28:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <022b6528-7ab3-449f-807d-d711b6d2db51@www.fastmail.com>
In-Reply-To: <CACRpkdaxiFR3ezt4FzhRxpqc4DYYjsbBeysPUaaQH+_QgYjudw@mail.gmail.com>
References: <20190628023838.15426-1-andrew@aj.id.au>
 <CACRpkdaxiFR3ezt4FzhRxpqc4DYYjsbBeysPUaaQH+_QgYjudw@mail.gmail.com>
Date: Thu, 04 Jul 2019 10:28:45 +1000
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 3 Jul 2019, at 18:40, Linus Walleij wrote:
> Hi Andrew,
> 
> On Fri, Jun 28, 2019 at 4:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello!
> >
> > The ASPEED AST2600 is in the pipeline, and we have enough information to start
> > preparing to upstream support for it. This series lays some ground work;
> > splitting the bindings and dicing the implementation up a little further to
> > facilitate differences between the 2600 and previous SoC generations.
> >
> > v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
> > here:
> 
> I have applied this series, I had to strip some changes of the header
> because it was based on some SPDX cleanups upstream but no
> big deal I think. Check the result please.

Thanks. Have you pushed the branch yet? I just fetched your pinctrl tree
and can't see the patches.

Andrew
