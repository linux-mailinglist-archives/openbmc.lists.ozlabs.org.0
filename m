Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF58130CEE
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:18:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkLG1kt3zDqCC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:18:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dBOKJu3V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FTZ2eObe"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkHf4f3YzDqDT
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:15:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2393C49C;
 Mon,  6 Jan 2020 00:10:22 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 Jan 2020 00:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=M9ztwXIs2+UcqU8wb8O3pSYgj/lC03n
 FpJ9Mhrl1xpc=; b=dBOKJu3V5MoOcNyA2SmCCkjnGrBhukwP5cdt+LHCPArkGZg
 njCQRv8BxsRmfpOoNp9F1qAajXfBa83N9MFaW6qMOwOJYEXQm9xZGxWbZ8lA47cR
 CEt4gWhEitYY5w5SUbUlN5gFg83jIMriIjgYwLwxrIxxXiSR0xkHaZb/qa84ZSa9
 yp2MP43YovsNKCEbEheaROuXugCIhAgLT0zeGEegUg+eeJ3e9i4iwl8PiSa36mHP
 kbLABILlFE58Y9KxwVlQs5Lk3OM2FYele6R/HtqQ2Z3vIcb5oRZHTQQV6EaTX+1L
 83vIP+Lyfwk7/K4yREhRp+hR3gbtwJMRhu6lflA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M9ztwX
 Is2+UcqU8wb8O3pSYgj/lC03nFpJ9Mhrl1xpc=; b=FTZ2eObeZxIBJokuDaNvQX
 bt7zZCP6cwCxtbLXeOlfqRRPI52bZKofVUngPMr+ZFdiHiz6GtPcRYeI3vL5xRBL
 1pMK1XPBmEi20azo6QLtn/y0I84kaydlnYRvfcIxwN5wJMSBYwwIkctDK+KytBKt
 P4jce3w+kv+vwGzStUZW4FGJHhyLsAaFo41Jwrs51oxEaastR1qbzshgv7iNnF9j
 6oqu84WWNv01P452U9AiVrjmXwErgMaG4PNbNv1Ui/+IPa+HAzEa/O1Vd8l86c/Q
 AAE5mwNRXJPa5OL0n22PAT2AyA1CNljNAITsaleEQiNpbwh6FJiLZHK3rntYT/Eg
 ==
X-ME-Sender: <xms:PMESXoQ4Iw3tKSdPwnQpJpKaFVS1RZ3nfn6CR2DPzWIhQ0Xgypvx6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:PMESXhSvTSXnBgjLu8X4vke2JmB3Ny7skp5hGfQbtofoPCnQ4iPfYQ>
 <xmx:PMESXr06gFNMfq7uwFLShOoJsywaLQtPjfJXZu1VqTNi_P241nHNRQ>
 <xmx:PMESXpylIgXhNO_xbqdW0w5INfOm9WdzMjpYByQ_OGTuS5XoRgqVQg>
 <xmx:PcESXq3T18_QW_os_fKgsj8WdRzl9-BfSZqfDpUtHELhmbymipfb4w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DF7F3E00A7; Mon,  6 Jan 2020 00:10:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <20604395-8d8e-46c2-8e99-4225a9b25d12@www.fastmail.com>
In-Reply-To: <20191223134735.559200-2-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
 <20191223134735.559200-2-joel@jms.id.au>
Date: Mon, 06 Jan 2020 15:42:19 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/4]_ARM:_dts:_aspeed:_tacoma:_Fix_fs?=
 =?UTF-8?Q?i_master_node?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 24 Dec 2019, at 00:17, Joel Stanley wrote:
> This was broken when applying "ARM: dts: aspeed: tacoma: Add
> host FSI description".
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
