Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A413666D
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 06:04:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v9rk0L4WzDqc1
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 16:04:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=CqbZE4F6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=n71tNMfR; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v9qr2d4zzDqQ3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 16:03:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4466F21116;
 Fri, 10 Jan 2020 00:03:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 10 Jan 2020 00:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=DMsFFxWchkLWXy09B4CIb8+qXB7cfZ2
 IcnpoSzLz9go=; b=CqbZE4F6KWuXHf2cNRJG2UcSgbeEkOl9ocI1CSSYFTBcFJ3
 zDjDpzmdxgTFf0aRKbLkxPTXWS0K2Y9mYsZ5KBrTjXwPn8CLEooUDQVIAZdiERmE
 4oBheDrPTKbnRVKHH5ykWdrS+cG7XvoyGY9O0pkOf2YUkfOP7hBh9kxk16mfVryk
 nOG7YOzXjOOVm/V1FaCS2/vbYwWAIuwGvP4377UlhnZTGpw7adus873rRTD8rnS9
 nGYCLFYkE/TKRKGjXkmIj7gV9pBeeEGKmvfWSgnCoICzH1gTlnpXDQ/pf3wKS7z6
 diXIpLkwcIkf5CjdEDY+LgSELTMOlI28/gTYGFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DMsFFx
 WchkLWXy09B4CIb8+qXB7cfZ2IcnpoSzLz9go=; b=n71tNMfRWRTlIFn/Egp6LV
 HkwL2A7pleFQfXXwhPNWLLnTtVAMEPiTic+1YhvZUDT+j9X3fFNzH4gcvJ/q+r/7
 lWdQ1jS5Yil5BDB6ZFuMweZdnmjmVCWFHaCDxXNAjm7iIzY6kwvc2VOTZZiVndWy
 Vzb0SOadsIIvxa8a0kNeYvaqlRIwQ4xpBM8Al/WilMXl/r/11pZK6yaSrS8wIWpm
 p4bqlVDj1CTRDpWKAeRG010yfANG5UhglHii8Dh7sCZAHvEWk51lS4E/2+yfa9wW
 +tL51ynBRRXhQrtFTkdRQIPcK9HG7UIfUM4Vrd4b+YBA6x2C4nnVITl50C59YCsg
 ==
X-ME-Sender: <xms:sgUYXtcP8-I3AumpOn869lFC6ZVGNtDMrh7yDSLDRZ9c8cfO39VN8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeivddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlqdehmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepnhhishhtrdhgohhvpdhgihhthhhusgdrtgho
 mhdpughmthhfrdhorhhgpdhoiihlrggsshdrohhrghdpughtmhhfrdhorhhgnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:sgUYXnKnMVe0jrpUqOqva34D51RPvZmGJFq8kryM1W8fTjphKjktcw>
 <xmx:sgUYXspTjrgy-9d0FT10elzd3gaEbPAYVwDrj-aJObKST8IiJZ6_1g>
 <xmx:sgUYXtUBvwCHLXA9cCrDBkvqrYmJAx6d4u2E-HrbynDidfY2lfrjgA>
 <xmx:swUYXsnMZuv1bcNXCVujTKdKorn6HAnTJJC5mEDHiWWJ9sGpComc3Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 42365E00A1; Fri, 10 Jan 2020 00:03:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <a21918d0-d5ba-4959-82b9-3193748fcf72@www.fastmail.com>
In-Reply-To: <29717.1578627606@localhost>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <29717.1578627606@localhost>
Date: Fri, 10 Jan 2020 15:35:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Richardson" <mcr@sandelman.ca>
Subject: Re: MCTP over PCI on AST2500
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
Cc: Sharad Khetan <sharad.khetan@intel.com>, rgrs <rgrs@protonmail.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Jan 2020, at 14:10, Michael Richardson wrote:
> 
> Andrew Jeffery <andrew@aj.id.au> wrote:
>     > On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
>     >> Hi Andrew,
>     >> Sorry for late response.
>     >> The plan is to have MCTP in user space.
>     >>
> 
>     > How are you handling this then? mmap()'ing the BAR from sysfs?
> 
>     > I plan to get back to implementing in-kernel socket-based MCTP 
> shortly.
>     > Unfortunately it slipped back a little in my priority list late 
> last year. I'd be
>     > interested in your feedback on the proposal when I get something 
> written
>     > down.
> 
> I have read through a few MCTP documents on dtmf.org, but they either dealt
> with too highlevel (SMBIOS tables), or too low-level (MCTP over UART).
> 
> Is there something that I can read that explains the underlying PCI
> relationships between the BMC and the host CPU's PCI/bridges?
> Maybe I just need to read the AST2500 datasheet?

Beware that I brainfarted in my reply above, so before I go further:

https://lists.ozlabs.org/pipermail/openbmc/2020-January/020141.html

But to answer your questions, you should read the MCTP Base Specification
(DSP0236)[1] and MCTP PCIe VDM Transport Binding Specification (DSP0238)[2]
and reference the MCTP Controller section of the ASPEED datasheets.

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0236_1.3.0.pdf
[2] https://www.dmtf.org/sites/default/files/standards/documents/DSP0238_1.1.0.pdf

> 
> (I was at one point quite knowledgeable about PCI, having designed adapter
> cards with multiple targets and dealt with swizzling, and BARs, etc.)
> 
> What I heard is that for typical AST2500 based BMCs, the host CPU can map the
> entire address space of the AST2500, and this rather concerns me.

Yes, this is indeed concerning. It has its own CVE:

https://nvd.nist.gov/vuln/detail/CVE-2019-6260

OpenBMC provides mitigations through the `phosphor-isolation` distro feature.
The feature enables this u-boot patch that disables all of the backdoors early in
u-boot:

https://github.com/openbmc/meta-phosphor/blob/master/aspeed-layer/recipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch

The distro feature is opt-in as it has impacts beyond simply disabling the backdoors
(there are some unfortunate side-effects to enforcing confidentiality of the BMC's
address space.

> I had rather expected some kind of mailbox system in a specialized ram that
> both systems could use to exchange data.

Well, a few of us at IBM have cooked up an LPC binding that is not yet standardised
but does exactly this. We use a KCS device to send byte-sized control commands
and interrupts between the host and the BMC, and use a reserved memory region
mapped to the LPC firmware space to transfer message data. I don't think we've
published the spec yet, but I can put the work in to get it onto the list.

Hope that helps,

Andrew
