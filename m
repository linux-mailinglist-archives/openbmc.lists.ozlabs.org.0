Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0D28FCF7
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 05:39:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCBhv4XwRzDqQD
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 14:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=D1Ujtvlf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BYqlE794; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCBh43SLXzDqPW
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 14:38:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E1030EC2;
 Thu, 15 Oct 2020 23:38:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 15 Oct 2020 23:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=R/fmI1vtMzeLynE+87bROmHYWMpP5MG
 2lZLmGI/b2AE=; b=D1UjtvlfP7aq9mLOq7dZryv2F52iB4uOIxvounAnNh8zOqw
 09PzLGaVdSG59e/ma6mTVnr2jSlBPgQ28UtPKNHWPEf5WD4StzKGaI/3MdCjrV70
 RwsEYN26cB4qPUcfoUq2zyRRwqM/nrbdu39+gxtje321RQPlzrgMA5azPMfe0lYg
 dGbyKOnxsSkxIrXiqpFNEe5kcUcpNaHewh5sTevGX4Mx7MJRYGUR64cpJKPOZ2nD
 iXmnPqtA8kLc97+syaygWT3mjy1bXwq2NVjTH74w31dWHzgFo38iWDL/P9NAjB3R
 jKwFMHr7u+vjucpNeUC7SJjOfUxDCTJXkZuAn1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=R/fmI1
 vtMzeLynE+87bROmHYWMpP5MG2lZLmGI/b2AE=; b=BYqlE794HoY5S6xMD4axNL
 wsvNiVMxGxRK5OuDgWfsABPoOUi0UtHD8dtu8QBKu/sCYOJCUZZ/82GNqn+stxE4
 tFyoFolj25dU9/kTYDn5YXWiq58wiPt2Eb5Gi7fmHu3tb+44Kqr6X0gO0taxrIbo
 lgdXyQ29U7MAaZILKW2nFNYDY83cJn0vh5EE9tFqo8fNrOjY2Y4lKgnjXPiRdIA7
 1vdq7YTzT/1PDLmRzyf6BwCcF7/jQivwj3TBy74sXN6LcpqHNHyXCLa1hOzT2cgy
 VGdyG8yr2kireem4ufM5kzpQqjDoN5j3rQCsAQkhvm64mLVYVHyx7VWrpgiVt0JQ
 ==
X-ME-Sender: <xms:rhWJX6U_EJgh0C0lYMTw5HT581Uw7fC9-LGrjDOjR3eZE2n1pulo-g>
 <xme:rhWJX2lzK2I-F9ys2i3qEY8c26JYrFiDkLQ_8wT5cP99dq2NP6MueMuzgL_y-uRzY
 9Lv9vmWZpz4djpJjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieeggdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:rhWJX-bRXEDdUd4CsSd_0C8lX8soTmiihjgSMtGiWN_RndLWK_HtRw>
 <xmx:rhWJXxVvBQXJC_aN9u5b_5HffKfJKegKaEZrrUmzUAbj1vazIBPG4w>
 <xmx:rhWJX0nuvN5DdNkfmU8akaWlaHAajsfxTzoRt5rvLXINm-w3uOxyMg>
 <xmx:rxWJX2RKOfk-s0k3Ay7JRrlNMRL6ssQivRxXWyjfxqHx7nFf4rafeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 45D57E00A8; Thu, 15 Oct 2020 23:38:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-489-gf39678d-fm-20201011.001-gf39678d0
Mime-Version: 1.0
Message-Id: <e129afe2-2cdb-4536-89e0-04b7079cf1be@www.fastmail.com>
In-Reply-To: <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
References: <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-2-andrew@aj.id.au>
 <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
Date: Fri, 16 Oct 2020 14:08:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 1/3] ARM: dts: rainier: Add reserved memory for ramoops
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 6 Oct 2020, at 13:52, Joel Stanley wrote:
> On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Reserve a 1MiB region of memory to record kmsg dumps and console state
> > into 16kiB ring-buffer slots. The sizing allows for up to 32 dumps to be
> > captured and read out.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > index e6f422edf454..46a0e95049fd 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > @@ -47,6 +47,14 @@ reserved-memory {
> >                 #size-cells = <1>;
> >                 ranges;
> >
> > +               ramoops@b7f00000 {
> > +                       compatible = "ramoops";
> > +                       reg = <0xb7f00000 0x100000>;
> > +                       record-size = <0x4000>;
> > +                       console-size = <0x4000>;
> 
> This is conserative. We've got plenty of space, how about we make it bigger?
> 
> $ git grep console-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
> "%x\n" | sort -n
> 8000
> 8000
> 10000
> 10000
> 20000
> 20000
> 20000
> 20000
> 20000
> 60000
> 100000
> 
> The median is 128KB, which sounds reasonable.

Well, maybe? Why should we basing it on what everyone else has done rather than 
what we need? We're compressing the data before it's written to the pstore 
ring. Uncompressed, 16k is in the order of 200 lines of text. With the default 
DEFLATE compression we can fit 3-4x more:

root@rain15bmc:~# uptime
 14:44:20 up 14:44,  load average: 0.01, 0.01, 0.01
root@rain15bmc:~# dmesg | wc -l
640
root@rain15bmc:~# dmesg  >/tmp/dmesg
root@rain15bmc:~# stat -c "%s" /tmp/dmesg
44032
root@rain15bmc:~# gzip /tmp/dmesg
root@rain15bmc:~# stat -c "%s" /tmp/dmesg.gz
11059

I think 16k is more than enough for now?

> 
> $ git grep record-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf "%x\n"
> 20000
> 400
> 400
> 20000
> 20000
> 20000
> 10000
> 10000
> 10000
> 10000
> 20000
> 
> 64KB is the median record size.
> 
> > +                       pmsg-size = <0x4000>;
> 
> Do we want to add ftrace too?

I figured getting an oops/panic stack dump might be enough for the moment.

> 
> Should we also add max-reason = KMSG_DUMP_EMERG?
> 
> Logging reboots and shutdowns is informative (you know if a reboot was
> intentional or due to a crash that wasn't recorded) and allows for
> testing.

Yeah, that's a good idea.

Thanks.

Andrew
