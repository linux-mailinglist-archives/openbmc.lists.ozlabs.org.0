Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C000386F3B
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 03:31:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fkdkl1hPmz2ymQ
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 11:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aMzKAvTV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rsfkg6Gj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=aMzKAvTV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rsfkg6Gj; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkdkL3JLWz2xZk;
 Tue, 18 May 2021 11:31:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C0ACF580FBB;
 Mon, 17 May 2021 21:31:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 17 May 2021 21:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=0XYBfek4N1txXrYeiXMoQOHC8lS3/4S
 qSpfGCVp8qMo=; b=aMzKAvTVqrbFZlV3xb/oEkWBaNIEX2o+aYYBgch00bBDQ18
 nkO2hWo/UmPcCVFr4nea8ca6/GLl479MAZsiOLrL2pxAd+3mOH1gqE89Ywgbpoza
 WjHdriaYYRfX4/gfgVH/3F3UXL7vneDi77eta9UDpHe1SB5339AH3CxHGWiQ9/cy
 f08ZVdPGIp5Bjk0Cq8f/U4EPi7znwOt+zWnHdYyTbNSFUeWbP9WRH7LUQ2PuCMkY
 HbapQwgbGOTgdVlsMEj8Q68qDn54nFyzQ6VLDszpPeHfC7JZessv4/IptV+RP1xY
 XyNEmOppI4uiQFES7xxzX3FagPm1J0BkK1D5Bdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0XYBfe
 k4N1txXrYeiXMoQOHC8lS3/4SqSpfGCVp8qMo=; b=rsfkg6GjjT9UmcnxXih8BD
 zi3KrOCpGEOV9FhcWD9jFmMDoaDWnKk+/VAxp63AAlwYwWGzcibNLS681AqKTrHd
 LTtMJaywBc7foBrqQVIGsYp15Espv8Adm/qxftrQIDWT6vf0yil/l4WBiHgGLkwk
 I/Ssx5Vm44/fKdhxOCyKWwVKWJ9AU51zhVVC9ioUh+OVcRF2I3My0U/VZ8i+VSn2
 22yjhdG5oBEmAuXPXJaaMrqZWjuXB5zcn3smIsbEPtEpzWz7oN2TpdTp36gquuwD
 phhu9sdxTDaSqT1Jw9cQ3OwhEaNkvQXshKUDDTCqvGBBvEHcCLWpXJPM1uO7P/Ww
 ==
X-ME-Sender: <xms:1RijYNPEJcSw8F6N9IrCTvVTBfMdxEpQMNRW71eg8cn_DhRfeSoYtg>
 <xme:1RijYP97ZCd-_PxvDlhpy_NZV3AQ8HUXsEStyKNpwsQZwSbmb18OALlyXNfvFQAsy
 AF0nq-GMkBaIG70lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepffehuedvhefhgeekhfeigffftedtffefvedtueffteevfedttdetuedv
 hfffleegnecuffhomhgrihhnpehpohhrthdruggvvhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1RijYMQ9pHV_ZRFSQbvh5SlcrPMuEaG92BrNbJ9ByCbhag5oxJTeUA>
 <xmx:1RijYJvQ_9MoxHZvCdy36J5fB_oKqtUIVVVf64QAYoppKVRyX5hhfA>
 <xmx:1RijYFfYfg6Dk6Zf1kD-jwcku7XQ5C0XL2Bth3LYK0Hl4IPVL_n76A>
 <xmx:1RijYB5O5paHYbTKHCPfothf9iBE3AzFIv8-Q498iui71dG1vOwasQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F2E14A00079; Mon, 17 May 2021 21:31:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <d7918dcf-b938-498c-a012-3d93a748431b@www.fastmail.com>
In-Reply-To: <YKJ6aP/xqAe1hW6A@kroah.com>
References: <20210517124105.3565860-1-andrew@aj.id.au>
 <YKJ6aP/xqAe1hW6A@kroah.com>
Date: Tue, 18 May 2021 11:00:39 +0930
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



On Mon, 17 May 2021, at 23:45, Greg KH wrote:
> On Mon, May 17, 2021 at 10:11:05PM +0930, Andrew Jeffery wrote:
> > Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
> > LPC bus to the UART interface on the BMC's internal APB. As such there's
> > no RS-232 signalling involved - the UART interfaces on each bus are
> > directly connected as the producers and consumers of the one set of
> > FIFOs.
> > 
> > The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
> > at 33MHz. The difference in clock speeds exposes a race in the VUART
> > design where a Tx data burst on the APB interface can result in a byte
> > lost on the LPC interface. The symptom is LSR[DR] remains clear on the
> > LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
> > remains clear on the APB interface as the host has not consumed the data
> > the BMC has transmitted. In this state, the UART has stalled and no
> > further data can be transmitted without manual intervention (e.g.
> > resetting the FIFOs, resulting in loss of data).
> > 
> > The recommended work-around is to insert a read cycle on the APB
> > interface between writes to THR.
> > 
> > Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/tty/serial/8250/8250.h              | 1 +
> >  drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
> >  drivers/tty/serial/8250/8250_port.c         | 2 ++
> >  3 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> > index 52bb21205bb6..4d6f5e0ecd4c 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -88,6 +88,7 @@ struct serial8250_config {
> >  #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
> >  #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
> >  #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
> > +#define UART_BUG_TXRACE (1 << 5)	/* UART Tx fails to set remote DR */
> 
> BUG()?

Can you please expand on what you mean here? I don't follow.

At least, I think there might be a formatting issue (spaces vs tabs).

> 
> >  #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > index a28a394ba32a..4caab8714e2c 100644
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> >  	port.port.status = UPSTAT_SYNC_FIFO;
> >  	port.port.dev = &pdev->dev;
> >  	port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
> > +	port.bugs |= UART_BUG_TXRACE;
> >  
> >  	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
> >  	if (rc < 0)
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > index d45dab1ab316..6c032abfc321 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -1809,6 +1809,8 @@ void serial8250_tx_chars(struct uart_8250_port *up)
> >  	count = up->tx_loadsz;
> >  	do {
> >  		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
> > +		if (up->bugs & UART_BUG_TXRACE)
> > +			serial_in(up, UART_SCR);
> 
> Can you document why you are doing a call here to serial_in(), otherwise
> someone running "automated checking scripts" will remove it later as it
> seems to be doing nothing.

Good point, I'll add a comment.

Thanks,

Andrew
