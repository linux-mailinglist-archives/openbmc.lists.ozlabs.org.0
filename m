Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C0388787
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 08:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlNHC6CRJz2yxk
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 16:28:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IAlTlTk/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rqUBadeI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=IAlTlTk/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rqUBadeI; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlNGp5mbGz2yXc;
 Wed, 19 May 2021 16:28:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7F74B580D37;
 Wed, 19 May 2021 02:28:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 May 2021 02:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ZQqIDNjegD+sDLfm5aGwnybvoXnL4d+
 m25V093T+MCk=; b=IAlTlTk/SoQiNwmA80MnW0XoVydNXktP3zTa9kv77qM7SDU
 Irn6xqQH0a0hMTDvR+efIIZSRPp0v6gteRp5OcuJvpRHhEPfTb7fChbCpdXiT8Xd
 xn1L5DDqLw2+ZcZdk6PT3IFJ27l/AYcgAixUPTD0XUNUaJFcTR7yTWvuDDLCHX/I
 uSFpQ3bfiBT+aLHixvDsKFByJJTVtPd4IxDe9sQuOMUjGmjoLRXYS2UwKK88+rSK
 TWhazV/vKiLIA/T78Ne6AY+cga1DPB4MyyMsEnjZHxe4ZseKFJ3bzq0KvvauKDr6
 c7zfFHJFYOzvS3ezutmLvRs+hNf/yz2D3rt/SMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZQqIDN
 jegD+sDLfm5aGwnybvoXnL4d+m25V093T+MCk=; b=rqUBadeIeBeUvBDi9c+IuK
 +JmxFjGQXQZChGk6T9WrzEQ7GGw2KY+nU3zwm66tcMfoKkhQyp+rX073hegad+j6
 VXjiyctLWbjIhCtUEErcNxbvwZSmZ6JcCtHIyrm/XnbImmACIoycZ5dsKVFD58E4
 XlsCPnNmRiKcRsJUZcRApHm+APZS8JJ5tj1Z32fGsOigUjV9UtN//sfjkvb6zqFH
 GR1jMlx92bTAiWtE6qPUi2D7i/5mTwtkmIoDA34AyqtmV7vI3at6+ltUxxP1jHIy
 ShPde321oeSZflusKhcsDCD0HftYbwaEkRsVhMGWszIyeOkarguTkhcSad8cchTQ
 ==
X-ME-Sender: <xms:_q-kYKycpXMLw8AQ1PQgAVN52MW9TSzhWR63jWwoJmH2Cg8t1NjM3Q>
 <xme:_q-kYGRZzObRj1viunLQ2QWCKWXgtag7hBTYcX3luh1EryiiXVCgU_uhIot6SHFOW
 7l6Wo5T4ejthVH9-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfek
 fefhfeekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:_q-kYMU_4vShvTrxTCNFqHjPWUo9l6y6NCSyQC8LHMinI-8kUxyjOg>
 <xmx:_q-kYAiRH24iwWvK1nsliTYRPcUKrQ_UngVnEUlz35rPltCXOaFpJg>
 <xmx:_q-kYMC0YR-rtkOBYc-kexg0WbpyEIyvGuCrp6wTwNbCJMIEZmIvsg>
 <xmx:_6-kYI2j5O5WLzbC6WAmNZJpbRiVZBhcj9c3AELIlElJIrUer-1jmA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1C47AA0007A; Wed, 19 May 2021 02:28:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <2bb7dfc4-a20e-4e3e-8fa5-74ff264c4e44@www.fastmail.com>
In-Reply-To: <56ec152a-560b-1eed-97e2-c12e4fed171a@kernel.org>
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-3-andrew@aj.id.au>
 <56ec152a-560b-1eed-97e2-c12e4fed171a@kernel.org>
Date: Wed, 19 May 2021 15:57:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jiri Slaby" <jirislaby@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jenmin_yuan@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 19 May 2021, at 15:44, Jiri Slaby wrote:
> On 19. 05. 21, 2:07, Andrew Jeffery wrote:
> > BIT(x) improves readability and safety with respect to shifts.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >   drivers/tty/serial/8250/8250.h | 33 +++++++++++++++++----------------
> >   1 file changed, 17 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> > index 34aa2714f3c9..4fbf1088fad8 100644
> > --- a/drivers/tty/serial/8250/8250.h
> > +++ b/drivers/tty/serial/8250/8250.h
> > @@ -7,6 +7,7 @@
> >    *  Copyright (C) 2001 Russell King.
> >    */
> >   
> > +#include <linux/bitops.h>
> >   #include <linux/serial_8250.h>
> >   #include <linux/serial_reg.h>
> >   #include <linux/dmaengine.h>
> > @@ -70,25 +71,25 @@ struct serial8250_config {
> >   	unsigned int	flags;
> >   };
> >   
> > -#define UART_CAP_FIFO	(1 << 8)	/* UART has FIFO */
> > -#define UART_CAP_EFR	(1 << 9)	/* UART has EFR */
> > -#define UART_CAP_SLEEP	(1 << 10)	/* UART has IER sleep */
> > -#define UART_CAP_AFE	(1 << 11)	/* MCR-based hw flow control */
> > -#define UART_CAP_UUE	(1 << 12)	/* UART needs IER bit 6 set (Xscale) */
> > -#define UART_CAP_RTOIE	(1 << 13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
> > -#define UART_CAP_HFIFO	(1 << 14)	/* UART has a "hidden" FIFO */
> > -#define UART_CAP_RPM	(1 << 15)	/* Runtime PM is active while idle */
> > -#define UART_CAP_IRDA	(1 << 16)	/* UART supports IrDA line discipline */
> > -#define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
> > +#define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
> > +#define UART_CAP_EFR	BIT(9)	/* UART has EFR */
> > +#define UART_CAP_SLEEP	BIT(10)	/* UART has IER sleep */
> 
> 
> Perfect, except the include: BIT is not defined in bitops.h, but in 
> bits.h (which includes vdso/bits.h). In fact, bitops.h includes bits.h 
> too, but it's superfluous to include all those bitops.

Maybe the recommendation in the checkpatch documentation should be 
fixed then?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/checkpatch.rst?h=v5.13-rc2#n473

I didn't dig through the include maze to optimise my choice.

That said, I will switch to bits.h based on your feedback above.

Thanks,

Andrew
