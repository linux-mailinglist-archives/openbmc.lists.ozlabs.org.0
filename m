Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 926039D9E8
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 01:31:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HSvY602DzDqgp
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 09:31:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aFz1cHDq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BxSEo+u+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HStt6FqjzDqVs
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 09:31:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1FCCC22040;
 Mon, 26 Aug 2019 19:31:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 26 Aug 2019 19:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=iuPaaJn1D7FJVmPjsziINbvGaIdTpuq
 ezOl6sQ8x4YE=; b=aFz1cHDqETEAtJ0i2gXpcLwDKvznjJ6MFwRQs7jg/qZlIq2
 jVF4ZqACSQ6G2Bz3+gb1l2LGWqT7ZAGwHgR+GzXhXCdS2TkoS2224Kn+4CoyOnCd
 PQaomUIxFNMWzVPjq6Ox8f3l1SPO8FPbf1LxfapFXieOvRrAMfiwihjjC3r5HlL6
 NaeIr9mmYLL6WLizjK5GTmNt8JqN6zWJi8iw6U8IQYp+tXSumrvDIV7thCpiSeXb
 oV8ML9WZtBMHZ7OCHEmKtR1AspDU127u57JfpV+ruRTxcvyjHg3ryEsi14cYo9TY
 a4tf1gRe/mL6Gz9CPDYufUCaA3TRIcPK0ABO+5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iuPaaJ
 n1D7FJVmPjsziINbvGaIdTpuqezOl6sQ8x4YE=; b=BxSEo+u+ZYJu2fga4mXudZ
 p1culW8NGJ/4MtWyFGYJN36/KDfMJf+GWOEkdpxyqrxQ6mFI5Ur2zdJTZbdCTfK1
 N/A5dg1HKQg2eUfOvP293wWaO5976Lvy5TxKmK2JAz3k5A5ztuBmh7JP3HF736R0
 hMbLJh6SZHSn5xKKZNhbgWRwb4d2yuBZtkqrmXfFambAdCNwvYANrvMJHi5gE4nS
 MUIa+Fjp7U6xXWsItmZPpVF1ZpMA36dq7s2Qo/AMO2rAXJr8gE67RWRzyy4aEon2
 gpC8Yf4DFncrf2l0PvRtOoWcHNRlRynCkwA/pX8ZkinsrLNb3F5SDqLzJ+2U6Ojw
 ==
X-ME-Sender: <xms:wGtkXSzIuBmTVjJATPoz7EYIbma2nGwouttxdb3Ujs-KG-x-Lpo59A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehhedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:wGtkXf7J3b0YEDNLyTe5oWnGMPuxxDtXUpB74JFENGm7SVaoIrWRGw>
 <xmx:wGtkXYYa0_vs7BH9ELhIMg4MgXdGc7JlCJsUS_4Wl3jrMUe9cvUIJg>
 <xmx:wGtkXe9VUFAkddxW2j4w05zCOnSx19UehD3-TOJfLI8I2WGoIWg7mA>
 <xmx:wGtkXWWpbUVzyDnXbHhfFSdArXBjzVK1iobSbaXFxcAw59Uz30PB-Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2F04DE00A3; Mon, 26 Aug 2019 19:31:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
In-Reply-To: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
Date: Tue, 27 Aug 2019 09:01:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Johnathan Mantey" <johnathanx.mantey@intel.com>, openbmc@lists.ozlabs.org
Subject: Re: QEMU native compile issue
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

Hi Johnathan,

On Tue, 27 Aug 2019, at 05:39, Johnathan Mantey wrote:
> Friday I ran into an issue compiling qemu-native. I tracked the issue 
> to the the fact that the most recent kernel creates a new definition 
> for SIOCGSTAMP in sockios.h. The prior definition was in sys/socket.h. 
> I have pushed a change request to the QEMU code base. 

Can you provide a link to the change request that you pushed?

Cheers,

Andrew
