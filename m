Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FD331D16
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 03:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvfhn4yW6z3cJ8
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 13:45:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QOXTD5AO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aDdpVZRz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QOXTD5AO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aDdpVZRz; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvfhS2VXbz2ydJ;
 Tue,  9 Mar 2021 13:45:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C9CE5580795;
 Mon,  8 Mar 2021 21:45:14 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 08 Mar 2021 21:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=qRybQhRN/O0nr4FGzlsF5grYQeYZu8u
 crJLcVTZ+qd0=; b=QOXTD5AO8JgTi78Gox3qd+o0cQCodeaVASzuajwdav5Y2hC
 4avnt+mIqAteWzqQDJl9a+QBx+HWM83Gk8XIX3u3/8IoOxIpfAhVm0FteiFTDHU8
 UwnYHebv1bSlVT/QLDChvmP7j9MwiX+8RFkMT4zCiclkKaUOimes4zpaPZa94zB7
 BAu4JaRJB3JUe2FFr1s9ti6JN1lAbNCqTKBqSjZjKFnT5CkATt6/FEDBe1Fbe4gJ
 D0U2yfwxYdj1M8DA7OVJ8w0HqvbaDOcrNGrDuwksoN/ZhLutauiUsz50QyJjeiYI
 pceRzncgFai4/nRAJK/s+SQqGIgjF/NUaPhONoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qRybQh
 RN/O0nr4FGzlsF5grYQeYZu8ucrJLcVTZ+qd0=; b=aDdpVZRzVu/fS0qCUO6nOt
 oEgpCu/QYslFEzpsvzX7ndTe8eRiqTfW1+F4Fv5rSljjXczfv7nrbqAWr3zapAW0
 OjefFWXSx9RK3x20MIrnZcNoti7tW/oJNtSA/IV7IGOQHDvleipPI09EiprnhU9o
 kt5scxewJhaB6Qq51S97vCJklRMPZ9wqdCDkJp6r7hTpTZ25zNabBWCCaBJG9QKb
 9u6RelhaplCmdQf+JB8koj+J5GNSUsr4cXpmXqevWGEjrvMfmV3DRpgqVTIImVfo
 ECd+27HzMXYje4l4PuXUIUPvFoestcAbxKMjRp5oAEw7dxy3qsvV9LfT+/Sh16IA
 ==
X-ME-Sender: <xms:OeFGYDnuPNqO225nJFIOksYE4N-W8_TT57d--pKiJK5IItujip51ng>
 <xme:OeFGYG3AevxgNkp6GBMoCi17lsCIk0UfPd4Zb0S2-1acVmFRKmVe3pjedveEy_gHz
 CwHMO254a3PIWOkOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OeFGYJo0AqsS8xJQPVQeyVcw51jBuDXitZCYSpimI6GuXdKxDCpt9g>
 <xmx:OeFGYLktDhp7hqaYr6namfV8BupM_mzss-zlC4J7CcD3HGisilXfhg>
 <xmx:OeFGYB1y7aWjmsX_j2hoYnrsWZ1vIeNG-hTGQDkdrPZnB18ZfhWOxQ>
 <xmx:OuFGYLM4Nh9o6VssFPquDGq2opK0-qo-dL8LHWiAIMvmBVsXSXAgUg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 45659A00064; Mon,  8 Mar 2021 21:45:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <331c242b-cf22-4d0e-a08c-b9dbb06f2f32@www.fastmail.com>
In-Reply-To: <20210305230940.GA809870@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-18-andrew@aj.id.au>
 <20210305230940.GA809870@robh.at.kernel.org>
Date: Tue, 09 Mar 2021 13:14:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_17/19]_dt-bindings:_ipmi:_Add_optional_SerIRQ_prope?=
 =?UTF-8?Q?rty_to_ASPEED_KCS_devices?=
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 Lee Jones <lee.jones@linaro.org>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 6 Mar 2021, at 09:39, Rob Herring wrote:
> On Sat, Feb 20, 2021 at 12:55:21AM +1030, Andrew Jeffery wrote:
> > Allocating IO and IRQ resources to LPC devices is in-theory an operation
> > for the host, however ASPEED don't appear to expose this capability
> > outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> > registers for managing these resources, so introduce a devicetree
> > property for KCS devices to describe SerIRQ properties.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > index 1c1cc4265948..808475a2c2ca 100644
> > --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > @@ -47,6 +47,18 @@ properties:
> >        channels the status address is derived from the data address, but the
> >        status address may be optionally provided.
> >  
> > +  aspeed,lpc-interrupts:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> > +    minItems: 1
> > +    maxItems: 1
> > +    description: |
> > +      A 2-cell property expressing the LPC SerIRQ number and the interrupt
> > +      level/sense encoding (specified in the standard fashion).
> 
> That would be uint32-array with 'maxItems: 2'.
> 

Ah, thanks.
