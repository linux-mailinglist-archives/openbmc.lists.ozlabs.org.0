Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265D388337
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 01:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCCr1sVlz2yxF
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:40:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ib4T8VxK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ukghisW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ib4T8VxK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ukghisW6; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCCP32bPz2xxk;
 Wed, 19 May 2021 09:39:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6CED58055C;
 Tue, 18 May 2021 19:39:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 18 May 2021 19:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=1/zMW2aeJhVElhvVTN2cN12wqUkxW2C
 anpM2QtRA+mM=; b=ib4T8VxKRN4kNFT3DSwJ++tD128xKVOkvxKxW5hAvG8cYhP
 MYnUN4gC4ULusCj4TsVVq/Ym7sZRZEdiTcrNx3vahWzN7hnZgMR4VH5yilouc8cF
 U2wVZC6J4te1kqBGN4lIaRfQxwxmaDn/B4eLWg8poWFd5yj27Nj8vCbdOzff96X9
 f6YiFZ+GRdRMbKr92fkhtm8xDG4YaO4y37D29GgmVTMxzsm7nbvwTlvWqc6rMrjT
 +o+Xd92OPMOeunvnL5baYLsI6r8XqMqQv+5ZluvrLqGJUJb4fEWZN/FwK/TaHdce
 kT3LY/CY6R7Lysj51WXPamP8lqzs5C+r4vtXs/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1/zMW2
 aeJhVElhvVTN2cN12wqUkxW2CanpM2QtRA+mM=; b=ukghisW6YZIgDpuJm3HNjE
 axZzHi69XNt+aQFF12xsWnT7yvTKq+Dirie5tRFv2FuI/ZFjjDEKeIUAaA46CLeE
 iTGSsRer79dqmYOLn+EZkzuhp63Ty5xk0imLxgUofxqG8omrsMJieYXLLtN7oCC5
 +ZmnToD0UzKcIu7gqfaxZE7caGeZldNnrg0MsmmrGeiyVQFj6ON/cK3AW9Ct++9s
 uP0P1wCOvgVqAnyYOWa6UlvbL/eVp4zbfaTzO0t1SBntERBfh4zy66ayR19yXx8B
 KJgrxGUeVnoBStXvH93NpKdfiMrrdnqeTusC0nEh141lz2KVR/Tj4TbK1JfvTCfA
 ==
X-ME-Sender: <xms:OlCkYEfRqm6v7oHh-FASOw5RQJsP7WMW4nHBOajybasGjrZcuqpB9g>
 <xme:OlCkYGMBK14sI3TUj8Vt-FINLLxQVOBxyJZLfwx--XoSK0P-G2EZOCbf6nSkehGhU
 GZ2zZaX8fL0_QxBgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OlCkYFjhMtQDlkvdntaw19wxXcO6Clz2FFQv12RbmzWdRu1uOf3DMA>
 <xmx:OlCkYJ9uImJmkdeXm6ceGvbIqV7l5_Pg4e9EMhXHBRNqjHZ2So_64g>
 <xmx:OlCkYAu449BhmouZCdJEvZWzewvXiWtoE8rFHaQopbjNtVroKRgGvg>
 <xmx:PFCkYCJ1vAzdWkrhXUSQA5Y5cfv0O1k0dydqQlh18AXusoDrkXysWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B0F5FA00079; Tue, 18 May 2021 19:39:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <f37dff04-7f54-4a8e-a31f-d29988f302c3@www.fastmail.com>
In-Reply-To: <YKNgziMXms4zWRoY@kroah.com>
References: <20210517124105.3565860-1-andrew@aj.id.au>
 <YKJ6aP/xqAe1hW6A@kroah.com>
 <d7918dcf-b938-498c-a012-3d93a748431b@www.fastmail.com>
 <YKNgziMXms4zWRoY@kroah.com>
Date: Wed, 19 May 2021 09:09:04 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_tty:_8250:_Add_UART=5FBUG=5FTXRACE_workaround_for_?=
 =?UTF-8?Q?Aspeed_VUART?=
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jenmin_yuan@aspeedtech.com,
 Jiri Slaby <jirislaby@kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 18 May 2021, at 16:08, Greg Kroah-Hartman wrote:
> On Tue, May 18, 2021 at 11:00:39AM +0930, Andrew Jeffery wrote:
> > 
> > 
> > On Mon, 17 May 2021, at 23:45, Greg KH wrote:
> > > On Mon, May 17, 2021 at 10:11:05PM +0930, Andrew Jeffery wrote:
> > > > Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
> > > > LPC bus to the UART interface on the BMC's internal APB. As such there's
> > > > no RS-232 signalling involved - the UART interfaces on each bus are
> > > > directly connected as the producers and consumers of the one set of
> > > > FIFOs.
> > > > 
> > > > The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
> > > > at 33MHz. The difference in clock speeds exposes a race in the VUART
> > > > design where a Tx data burst on the APB interface can result in a byte
> > > > lost on the LPC interface. The symptom is LSR[DR] remains clear on the
> > > > LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
> > > > remains clear on the APB interface as the host has not consumed the data
> > > > the BMC has transmitted. In this state, the UART has stalled and no
> > > > further data can be transmitted without manual intervention (e.g.
> > > > resetting the FIFOs, resulting in loss of data).
> > > > 
> > > > The recommended work-around is to insert a read cycle on the APB
> > > > interface between writes to THR.
> > > > 
> > > > Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > ---
> > > >  drivers/tty/serial/8250/8250.h              | 1 +
> > > >  drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
> > > >  drivers/tty/serial/8250/8250_port.c         | 2 ++
> > > >  3 files changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> > > > index 52bb21205bb6..4d6f5e0ecd4c 100644
> > > > --- a/drivers/tty/serial/8250/8250.h
> > > > +++ b/drivers/tty/serial/8250/8250.h
> > > > @@ -88,6 +88,7 @@ struct serial8250_config {
> > > >  #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
> > > >  #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
> > > >  #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
> > > > +#define UART_BUG_TXRACE (1 << 5)	/* UART Tx fails to set remote DR */
> > > 
> > > BUG()?
> > 
> > Can you please expand on what you mean here? I don't follow.
> > 
> > At least, I think there might be a formatting issue (spaces vs tabs).
> 
> Ick, my fault, I meant "BIT()"?  To perhaps use that macro instead of the <<
> symbol.

Ah, that makes a lot more sense.

I'll send two patches. I'll leave the explicit shift in the bug fix for 
the VUARTs for consistency, then in a subsequent patch I'll convert the 
UART_{CAP,BUG}_* macros to use BIT() (which will also clean up 
UART_BUG_TXRACE).

Andrew
