Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD13388389
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 02:07:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCqd12mtz2ykM
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:07:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=TIoHkM0s;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Uuf834Ih;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=TIoHkM0s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Uuf834Ih; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCqK74Tvz2xxk;
 Wed, 19 May 2021 10:07:25 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6FA455805F7;
 Tue, 18 May 2021 20:07:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 May 2021 20:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=kIJvSpFWD6QHDHPhzb9ntcgPgn
 4w/LCFBFJ9RCTjTi4=; b=TIoHkM0sHSsjducPcvC1Ss4gb/P7sKBK6ZOfm8TTtc
 d0Yz4mjGZdZWjlJBvIFYU8Zty0FCMcs7Scjz3M1BqUcLdLxZt5Cf9L8ZuyAOJ98q
 AOWnPF3cNzVPcmcPccvfGbJgJBpBpGqcduyVkQ4xq6azYznWRNpO4NuqYa3LmFXB
 IXyTghSN8PGvupj16+PzLFuA9a1M966seYeG6N4AAJY/64FtqxOLeel8FOtUSILP
 gbvxbk/LjuU7FDxbl2r0Q0VQ393NavsbdQKKsZkrQnKq6yK3lKxEwtjJAs9lH7F/
 OqKgRhkRvc2JuOSjQZCkJJ7cCKxPK9Y5TnhMrAZZvPQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kIJvSpFWD6QHDHPhz
 b9ntcgPgn4w/LCFBFJ9RCTjTi4=; b=Uuf834IhHqMCxkknLbgFvWhJg98elUBWc
 y76VXgu0cBj7bSApJojkBQ6tXG13hGvHkzvMJxW0uSdKG9iozyt71z73R/Z48sev
 CSeJallINraOnhkLw7HGmtPx9DLEadhOijl6gxKmYmQpg1Ule1Nea+CO/JyaPS3o
 yhg2JrSYjUpJFit7X61q20weLLokZ41X2J/1QpsZ3zW36b2tgm23Tkm1GrkgrehV
 vFJKXiniWI03Uez6TbhxVEWzWW05t4ksc9RbJXeoHgLQ3HBUxNk6/C1vUE1Nd2Fc
 5DI5PL63nj5Id0l1tuwHNjniTyb2n1rhBF7EEbRbf+TxY1gcDT4bA==
X-ME-Sender: <xms:ulakYM9EmuUHsLnPgH75B8EZ4Ds5jkZv01yu4hpzcgIaDxsdID58iQ>
 <xme:ulakYEtiS5XXCdLHE_pAxlOJuUrpK-H3VBhXLvjk3MMGwc4WT63zthAOWE7Md97DD
 ssNsuifl9Vk9EYk_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
 ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
 ucfkphepvddtfedrheejrddvudehrdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ulakYCCU7OmYcifnTP7xL0KirYw095x0krpjui-HQNSYvQ7PugAdcA>
 <xmx:ulakYMc9M7mTd42rxif6Q6_Q8Ztzz19_VTgti1LHrusK_sOnVjTMSw>
 <xmx:ulakYBPcCabYVH-GxZnJq8ozZb7e2B8nS2wuOR1Sib8U2y9CgY6n1g>
 <xmx:u1akYKjEaJS08qP0dhCiRSDRxbMRfUDVJL6hvb5Zn9Y31DErHF9WCw>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 20:07:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 0/2] serial: 8250: Mitigate Tx stall risk for Aspeed VUARTs
Date: Wed, 19 May 2021 09:37:02 +0930
Message-Id: <20210519000704.3661773-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ryan_chen@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jenmin_yuan@aspeedtech.com, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Briefly, the series works around a hardware race condition in the Tx path for
Aspeed virtual UARTs. A write burst to THR on the APB interface may provoke a
transfer stall where LSR[DR] on the LPC interface remains clear despite the
presence of data in the Rx FIFO.

For the work-around patch, v2 addresses the request for a comment about the use
of serial_in():

https://lore.kernel.org/lkml/d7918dcf-b938-498c-a012-3d93a748431b@www.fastmail.com/T/#md75702fbc3704bd4b375f1251a1415bcddea26a3

The second patch addresses the request for use of BIT() instead of an explicit
shift by converting all of the UART_{CAP,BUG}_* macros.

Please review!

Andrew

Andrew Jeffery (2):
  serial: 8250: Add UART_BUG_TXRACE workaround for Aspeed VUART
  serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*

 drivers/tty/serial/8250/8250.h              | 32 +++++++++++----------
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
 drivers/tty/serial/8250/8250_port.c         | 10 +++++++
 3 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.30.2

