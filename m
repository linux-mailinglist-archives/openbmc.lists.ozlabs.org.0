Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBC388644
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 06:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlLJ26Ntnz2ym7
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 14:59:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Gv2lFV9F;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MINiyE8y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Gv2lFV9F; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MINiyE8y; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlLHf5nHfz2yWv;
 Wed, 19 May 2021 14:58:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F11B4580C43;
 Wed, 19 May 2021 00:58:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 May 2021 00:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=GEQi439rDfvTRkSJD56IhBuyWrsjBmH
 L/9eSU1ieZ5o=; b=Gv2lFV9Fn605qLRPC+zpp9WChhhrT9AxRaG3TMDpGHCAtMR
 jwhZ18nyIJIDw2zL3PV7GHtryhrBkuJr2Bk8+iDbkh0YiR2LZuhUWrRlkN+tr0xO
 ag/CDfIs42cgW2JoNzmgqPEPwdNCk8Jjfs8qOt2PR2Be27kjmY0u3KQb4klAJBcM
 dvdK3qzQcTS73rvhjOtuCo1ugyYkYDv7XB7yXxiFV0zWioWZ82AjCzweZ2n5k5iB
 B/TKViQv6MX5N5coiKo2ptBxsbqNCaSlMvoOco/ItqUQgAuzG3VaVd2xTbJrXyuR
 n/CUABA4xc3xQSH5CxbuejPCu5qK6S3vvxFRLrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GEQi43
 9rDfvTRkSJD56IhBuyWrsjBmHL/9eSU1ieZ5o=; b=MINiyE8y5zv0bN1unA3Fb9
 DBIGslbZgOkYTl0jzeHItc5j0owO+c4Fe6QvGHig3Vj8yDIM8JT3D9F10FrEQPL9
 LGhRsYam0qfs+ZLJNVcZ+JYNB9JKhQFQuc0qz5BgrMwmLjWXZSnbedfjJw1r6H5F
 TygU6HrXbdCcjaySOYw2nH8jjL3lu0Qw0UTxBCQTXv9AHhrmxZltOJppdKLmBKFp
 a1/YckF1f98/Xcoxmg+UJCwa5IK2Z1IelrgczYEa4AL+SYz4UbAkNS6WSTZVXhjO
 M9jFnbqOKX0tSyRjDH+2HYonEipTHI0ZMQoSq0navs+ZF6CFrmnZZ4G6z7lvs0OQ
 ==
X-ME-Sender: <xms:CJukYLxvctHXvDCbnuBn55ZWmBwj4JswGjHsd-y7RlAmZ3q-NUgSxw>
 <xme:CJukYDSXYk8Mm3rUnC3QIJROKIYBJz5D0oSL5a4qf8zSIp8fwtw6-eAJwvg3vHqcx
 JOwJ-k9L2s-Ral39w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepffehuedvhefhgeekhfeigffftedtffefvedtueffteevfedttdetuedv
 hfffleegnecuffhomhgrihhnpehpohhrthdruggvvhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CJukYFVxI9SCND9zi0IIic1Ps5hjLAk4qMpLMpEDUiWtzJs5AEACsg>
 <xmx:CJukYFgLKaDInf_kxFVmviyBaaFxQXO98D6u0Efypg4k6qo2sJfI7A>
 <xmx:CJukYNCoDhNqP6lZKS4ASeHanZQYmZix3YtaOcNvVVNBj2svKe_Rsg>
 <xmx:CZukYBuydz2DxcJ62WaUiFPHuFry4UmcWbVYIkOY9AWSXWVJqmB1dQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9368DA00079; Wed, 19 May 2021 00:58:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <66904cc2-a4ef-42db-a1c9-b12ceecb52c1@www.fastmail.com>
In-Reply-To: <CACPK8XdqeS+rE0Jz9SF+sSMUaxmg7vFtghhiZNbDpKRNbBZK=Q@mail.gmail.com>
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-2-andrew@aj.id.au>
 <CACPK8XdqeS+rE0Jz9SF+sSMUaxmg7vFtghhiZNbDpKRNbBZK=Q@mail.gmail.com>
Date: Wed, 19 May 2021 14:28:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/2]_serial:_8250:_Add_UART=5FBUG=5FTXRACE_worka?=
 =?UTF-8?Q?round_for_Aspeed_VUART?=
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 Jiri Slaby <jirislaby@kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 19 May 2021, at 10:28, Joel Stanley wrote:
> On Wed, 19 May 2021 at 00:07, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
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
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> > ---
> >  drivers/tty/serial/8250/8250.h              |  1 +
> >  drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
> >  drivers/tty/serial/8250/8250_port.c         | 10 ++++++++++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> > index 52bb21205bb6..34aa2714f3c9 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -88,6 +88,7 @@ struct serial8250_config {
> >  #define UART_BUG_NOMSR (1 << 2)        /* UART has buggy MSR status bits (Au1x00) */
> >  #define UART_BUG_THRE  (1 << 3)        /* UART has buggy THRE reassertion */
> >  #define UART_BUG_PARITY        (1 << 4)        /* UART mishandles parity if FIFO enabled */
> > +#define UART_BUG_TXRACE        (1 << 5)        /* UART Tx fails to set remote DR */
> >
> >
> >  #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > index a28a394ba32a..4caab8714e2c 100644
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> >         port.port.status = UPSTAT_SYNC_FIFO;
> >         port.port.dev = &pdev->dev;
> >         port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
> > +       port.bugs |= UART_BUG_TXRACE;
> 
> A future enhancement would be to have this depend on the ast2600
> compatible string, so we don't enable the feature for ast2400/ast2500.
> 
> That would also mean adding a compatible string for the ast2600.

Yep, I'll sort out some cleanups in that regard in a separate series.

Andrew
