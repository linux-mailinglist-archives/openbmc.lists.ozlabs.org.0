Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDD11FBE3
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 00:34:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bghy28sJzDqZp
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 10:34:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VTbj5pMF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gMw2MLwR"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bgh34ZGszDqWS;
 Mon, 16 Dec 2019 10:33:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E2EF822348;
 Sun, 15 Dec 2019 18:33:19 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 15 Dec 2019 18:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=lzvbMSFkVBR+nAocAB/eyxxphB8B1S4
 O1CMOCvIRkYg=; b=VTbj5pMFSVZMVT7DLLhNqZee/qfUdpnNDdx36+SC/dzZoul
 i6gJqNcdAXdAD7yXYiMZxGQ90NOYdWI+2m1rqljGkGtNtXAvtxTlgw5wIbG9f9sq
 XbS47Q53S0MIvRphJfNoVpVBG6iaR5/MA1C5JPyK1+6Di/BBMxSBg7ObycblOvH7
 /cwaSIp0lw33SYMBhyU1gDM+xnBaSA/0+PM8uimxpV0uVnPPfBPDX3eTAwcTd7ig
 E8jRLPAVr/aEp+g/nUsfbkrc9ktVmU5I+gM2oarsRqus72w1YfZJ80xz8xWA5YiI
 EDoLx1IKzrCzEAWrQUFkM0pgrVQcTyT1w9ZfLog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lzvbMS
 FkVBR+nAocAB/eyxxphB8B1S4O1CMOCvIRkYg=; b=gMw2MLwRV8HiPZPynrJvdp
 QFfd/wzjfxOiBSkUWVsAOcI739DKAuCe3x3dqIgCHRIgc8Q9ZM/7UxOzsykIN6uB
 utST9rch5vnvj9BApLN7Ysy1AfSTh32mb25RBNeYwZFcm1lqZz6rLbzuJ48kHTnX
 18zw5NNymXzMLFJJQxtydvu5wdd4qL6gGEI8mAaaP9+Jh23qSHcrBWe49Nz80kdP
 5LHVdqwqr42uVnJquUplkZIzjIh95y43kvvoeRAGaiSqRitmSN5Ftf1/l1D/GGa1
 n4BSk91Kk8d1JPdkkzwJffc2WMBqTa1U3rlZswIwshnYB8ZcXToByiIGhEPPISvQ
 ==
X-ME-Sender: <xms:vsL2XeKfNhmf3dE2gzpbzSs86ap6GIT2CTE7EPK6YQnAElmTyqdjZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:vsL2XQFldtGw-XBJ4xn4Sr5zMs6iCzbRlpQm8X6rp4tuqn3GhBl4VA>
 <xmx:vsL2XQnx8qCojcex_yzhvksBdgoI8_Oc_QIClvjdvJZucVCPsybWXw>
 <xmx:vsL2Xe01UqS1qt5wLIomDWeSscJlJ1dcSYXP7sFVH6wmLv1McK_Svg>
 <xmx:v8L2XS1LxoMGXcASWDNuCFtSobL8cOMOIezDEfUBHtK3xKa7FlhVfA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AE86EE00A2; Sun, 15 Dec 2019 18:33:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-680-g58d4e90-fmstable-20191213v1
Mime-Version: 1.0
Message-Id: <8017a61e-e579-41ea-816a-4a76a6dc41e9@www.fastmail.com>
In-Reply-To: <20191213135131.GA1822@cnn>
References: <20191213135131.GA1822@cnn>
Date: Mon, 16 Dec 2019 10:05:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: manikandan-e <manikandan.hcl.ers.epl@gmail.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v5] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
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
Cc: devicetree@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 14 Dec 2019, at 00:21, Manikandan Elumalai wrote:
> The Yosemite V2 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V2 platform based on AST2500 SoC.
> 
> This patch adds linux device tree entry related to
> Yosemite V2 specific devices connected to BMC SoC.
> 
> Signed-off-by : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> Acked-by        : Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by  : Vijay Khemka <vkhemka@fb.com>

In the future, don't worry about aligning parts of the tag text. Single space is
the custom (and is less effort!)

Andrew
