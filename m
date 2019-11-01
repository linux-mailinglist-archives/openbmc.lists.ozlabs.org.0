Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC60EBC27
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:01:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746Qt5KdxzF1JK
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:01:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XTXC7mKa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DRIbrle8"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746N14hc2zF6JJ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 13:58:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55A7E20F51;
 Thu, 31 Oct 2019 22:58:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 22:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=+JC2oF6nsnqeKYaDo0dWetVUa4y49Dr
 37lAKjuT3jD8=; b=XTXC7mKagUeQY3TcdLAf6sXZXYAncNbxwH6lBbSth6aWlmI
 7BfIZc0dRK9twKrZhS5q6b5M6xx/maw8gvEkkE6mnEUqr7V4lWLyRSHv8lzKR+/m
 NzhxLRmNxF8PQ/vKUAgwLxgmdzGZWqjqN/X65pCEUIMcPlbgyudCisVyyvyxedei
 GRt34KlOk4IEjHG0wOmNbxgrjS341BxppJwR/ZUTTuWcDtRXAbByiMlPNPvXuA0u
 6MxsjMFWNxD2mBJu/qCS0kCqGj28HsCcqP5UGfAzH6j82dVYYdNmBB/3YOUBwAgg
 m/t4MfTkqVOIRD1EqfTBGI5OX6XPVWDkayrLMlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+JC2oF
 6nsnqeKYaDo0dWetVUa4y49Dr37lAKjuT3jD8=; b=DRIbrle8gRMyuB92Nl9ClK
 5f+ZBEQFmbbTo8ViV+nLsE12o4vwFGAnAQ1vtzzywv17IiSmkjhX0q0tNrXu+tzA
 SEpfBE/0+18UpAq3wIbsAt+YqRQJAAluK3eUscJPgbw7KTlxUEufTC7QbGbBBqza
 sctiI8LxHdnVD91UQeRxsWRT1895QHmaFlvzR9mmHl6/P/0L+KXdbRQVxYsm8ste
 WbypKYbIx8DPDsnBrRTXdighRjC9pattAo0I95bvzapFGEqO3qH8WKt9dRvRoK2L
 9OmzmiesHPkuS/3HwhOUZOOLg0/Wu9FUFSYcw1hGlTMKFkTPQdnkpKMKBFxVaMSw
 ==
X-ME-Sender: <xms:b5-7XY2XLPbRfdJSDSOxjEq6R4nq5RpNyrCDO3W0z4JOv2zgm49EKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:b5-7XfYhzJ7DFVqjEHJ1oXTCryAH--YLNfNkkzbay0D3ljeCDNauWQ>
 <xmx:b5-7XTqDNLV-Dr4a9ucwOm1VpAMBzNaMfPCzULfbysWmtL8w_Ff28A>
 <xmx:b5-7XTqbTXObKWbh986kiR-GsiOyN87afHqYObhDXF0lza5zxEGj4Q>
 <xmx:b5-7XXFcnnvO1RDcBp057_hE9--qdIRDwtAKf--jKpvvV0XPkzsEvg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 22F64E00A3; Thu, 31 Oct 2019 22:58:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <b8d13e23-a21d-4687-8fe8-ca5110893e4b@www.fastmail.com>
In-Reply-To: <20191031053625.422-5-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-5-joel@jms.id.au>
Date: Fri, 01 Nov 2019 13:30:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 4/8] fsi: move defines to common header
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



On Thu, 31 Oct 2019, at 16:06, Joel Stanley wrote:
> The FSI master registers are common to the hub and AST2600 master (and
> the FSP2, if someone was to upstream a driver for that).
> 
> Add defines to the fsi-master.h header, and introduce headings to
> delineate the existing low level details.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
