Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 245382844DA
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 06:31:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C54KQ3hMVzDqKJ
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 15:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=UkC6r+5s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=INOqo4o7; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C54JY4WMZzDqHK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 15:30:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AAAE45C00DC;
 Tue,  6 Oct 2020 00:30:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 06 Oct 2020 00:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=KIvO/V6n4HvrdwLPjOd+c4heLgc0P/6
 mPdd+0dIFLlw=; b=UkC6r+5smFafPeW9jX+RRGduc/AZuuGw6b0q0wN6VdQ+21d
 lIikcv6trpuLmeaz7X1VELIci6QlC6OELIYfGwnm2gGyD0G19TvaziVb5xPLeVQ9
 wlz8tjCiamscDp40Gflh1zVG/hEwEfHLpRLdmratrYMyCbpylKzu8NP67a8obOR0
 xjHzJdQEk76SAsSLmzA91e7rT4lI0JaoYwxwyYl5MJcvfzmon8+w4D8IsU2snup4
 8SGD2G2nwXmhptgKZIhHn52MpkN/F6JrtvPg7QkbBnaBDrPABHrLvEaIW0NQJ1vw
 OlVRTi5g30283Dk+yBlWq4pzML3Xn9V8Ru2NTWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KIvO/V
 6n4HvrdwLPjOd+c4heLgc0P/6mPdd+0dIFLlw=; b=INOqo4o7xzBESh/5AIj7Ac
 9eQNUUpcWmoRe93j5B6kEGWg2T2Quki0+qxXpzjsjV6JRRr8HkZ77xgsYL5ZvIfU
 FQU3GugGM7sUF688lRC2/nxUuLFp0GJ4MDLFCRI7ofxWlfoxuSqE/ivwJpMDUCy+
 80BW8kVQ+JkGkjfJmrojz2JGcs3zwVReJOlYF5WpfNuxQllsjASwfKR98CwIQk5O
 zlBgAWT512+pPH4cltWIHT5oryY5EalZuQo9f8LEarWoImBnLaWAYNNHXKfQz4f9
 2lgFNZuAcu2d9wL7yGZOH4Gz/2/sQppGqGQQ7cJhlNW+hn9u8miGK2+DIpkshD1A
 ==
X-ME-Sender: <xms:1_J7X9MHqvKDshUyYUSaPqlHO1fPimOLU1mpZuthFwNPr0NrBpdgAg>
 <xme:1_J7X_8C541jc9phkT97Ke1tX9hgT-XsWkP-taOzX7W3z41Xl_K-HbU1VtjeMKVhz
 55-b9SMFwGhw82AgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeefgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:1_J7X8S4gdQMsm_T5oVubfCSDqDO_gqyXHu7QVaKG2N12sghiYb5YQ>
 <xmx:1_J7X5svz5hyZ6tiSjAfeVOhYaigcvkvdrx0x-011hEkxuIQfgId0A>
 <xmx:1_J7X1dLJL4NK9aeU-iSfBJv2LIw_3wGDuDUrRx3xz5sSDnjiZqs-w>
 <xmx:2PJ7X1mqG4_RDycq-4WiIYcA7mtrs9Qi7aLrRgFBbET80qUPK5AcyA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6C858E011C; Tue,  6 Oct 2020 00:30:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <43278529-11a5-4892-b965-96c69ff1a772@beta.fastmail.com>
In-Reply-To: <OF049DC1D4.E5E0E847-ON002585F9.0017C7A1-002585F9.00184577@notes.na.collabserv.com>
References: <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
 <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-2-andrew@aj.id.au>
 <OF049DC1D4.E5E0E847-ON002585F9.0017C7A1-002585F9.00184577@notes.na.collabserv.com>
Date: Tue, 06 Oct 2020 14:59:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>, "Joel Stanley" <joel@jms.id.au>
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



On Tue, 6 Oct 2020, at 14:55, Milton Miller II wrote:
> On October 5, 2020 about 10:23 in some timezone, Joel Stanley wrote:
> >Subject: [EXTERNAL] Re: [PATCH 1/3] ARM: dts: rainier: Add reserved
> >memory for ramoops
> >
> >On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >> Reserve a 1MiB region of memory to record kmsg dumps and console
> >state
> >> into 16kiB ring-buffer slots. The sizing allows for up to 32 dumps
> >to be
> >> captured and read out.
> >>
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> index e6f422edf454..46a0e95049fd 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> @@ -47,6 +47,14 @@ reserved-memory {
> >>                 #size-cells = <1>;
> >>                 ranges;
> >>
> >> +               ramoops@b7f00000 {
> >> +                       compatible = "ramoops";
> >> +                       reg = <0xb7f00000 0x100000>;
> >> +                       record-size = <0x4000>;
> >> +                       console-size = <0x4000>;
> >
> >This is conserative. We've got plenty of space, how about we make it
> >bigger?
> >
> >$ git grep console-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
> >"%x\n" | sort -n
> >8000
> >8000
> >10000
> >10000
> >20000
> >20000
> >20000
> >20000
> >20000
> >60000
> >100000
> >
> >The median is 128KB, which sounds reasonable.
> 
> How big is the dmesg after we are booted?   How big is the default 
> kernel buffer for 2 cpus (the kernel config has a base size, but 
> also a dynamic size with a base + n * cpu min at boot).
> 
> Having the console space larger than printk buffer will not help.
> 
> We could config the buffer up if we are not capturing enough of a 
> boot and some runtime.
> 
> >
> >$ git grep record-size *.dts* | grep -Po "0x([0-9]+)" | xargs printf
> >"%x\n"
> >20000
> >400
> >400
> >20000
> >20000
> >20000
> >10000
> >10000
> >10000
> >10000
> >20000
> >
> >64KB is the median record size.
> >
> This probably affects the effective compression, assuming
> each block is a seperate compression input.
> 
> >> +                       pmsg-size = <0x4000>;
> >
> >Do we want to add ftrace too?
> >
> >Should we also add max-reason = KMSG_DUMP_EMERG?
> >
> 
> The admin guide lists KMSG_DUMP_OOPS and KMSG_DUMP_PANIC ?
> https://www.kernel.org/doc/html/latest/admin-guide/ramoops.html
> 
> We could have something monitoring for OOPS , copying to a log and 
> then unlinking the pstore after committed.

systemd-pstore already does this for us, no further configuration required.
