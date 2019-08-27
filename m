Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794C9DA66
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 02:11:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HTnQ09C7zDqlZ
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 10:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pMIvHTKZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oi9vzr2o"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HTmn65jLzDqjW;
 Tue, 27 Aug 2019 10:11:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDCF33BCB;
 Mon, 26 Aug 2019 20:11:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 26 Aug 2019 20:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=CDTuiZrelUWEgf3y4KZ7WxVJzGTyvoY
 nwkgEV9GS9EA=; b=pMIvHTKZfpHH9DiPjpIImmW3Ww53CpcROqSmFp5Tys75FC4
 TBMkOOioKeLUpn+0eyWjmt2bHiT0j1gjmAm2EM0D8d4a4czex3Scxw1LdcIbarZc
 jZUgoUkf2I/bJFh4UEA3AXiKP/PzDt0e2V1IOFCOA7qsGnwF0U4O56YD8zX0Pe2n
 Aqpjhw2SU30W1GAjSG6lXTKgTqoT/iiKSYdi7lDONGb1cVAKKtPubdxgbVNY++7N
 LJQ2HIhXr3egKtJlhvdme2KxFrE478QhhNgExi7HyrZV8BOpHDyIUSAcPEpLlw5p
 huCY1LaXN99OXfdn8r12DnPn/wrN6AIOvKnbpWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CDTuiZ
 relUWEgf3y4KZ7WxVJzGTyvoYnwkgEV9GS9EA=; b=oi9vzr2oQAO4M9UzRhnh7x
 xG/WjjXFbS9aYWXUHhD0sX20VMN0v1Ylj/GoOPxJn77BK0VfCJMwMCRL/fiG0DWF
 /TvV4rPWpwMWCClxFPBM+DxcO1SqWLREyw0Jh8EfKJKmkp5/AjB61jHD3ANsO6+P
 DCeTe7QKCCG8iWjn0PqZHSmIibVhG6VoVUU4HLYIC8O/LudJfArrj3b/Od0c6cYm
 sx8cQ32bmEwH45dbR4VPLuEb5Z8ldOxz+avgSxBYxDB/eMHFgL+v+ALfS23EVBnx
 QN4JzC484C0aXxJGcJ4xdVcl4GvNqjDOYvv99g5gyBSiUgaeFGvOwSuojOCKfCZw
 ==
X-ME-Sender: <xms:E3VkXYYUAs1qVZX0bxp2cCivuf6mqWaKBKA32yy6F1UDS54wmR32aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehhedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:E3VkXUCRvqid6DYMA7CP5qTwQWTota8AuxMsxAzHOQOdmliQ3a44Ag>
 <xmx:E3VkXeEnNc3xf7FKhFrDLweXn-j111DuNyJpS-Bz7mDlVZ5LasnN1g>
 <xmx:E3VkXXMrjR2fwsgTDPKwwyYleaJsez8kBnIGKOWim1lg8tV1ofLwzw>
 <xmx:FXVkXceB8jxtGO1j6CzyihvzBhYsA89B7faXbulxE_RYbHG1KEIxow>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5EF99E00A3; Mon, 26 Aug 2019 20:10:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-139-g73fcb67-fmstable-20190826v1
Mime-Version: 1.0
Message-Id: <fab64830-69be-44fb-9e6f-ed8783b821a4@www.fastmail.com>
In-Reply-To: <d040fee1-d12d-9ac9-a72a-e76137a4579f@roeck-us.net>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
 <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
 <d040fee1-d12d-9ac9-a72a-e76137a4579f@roeck-us.net>
Date: Tue, 27 Aug 2019 09:41:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Ivan Mikhaylov" <i.mikhaylov@yadro.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_4/4]_dt-bindings/watchdog:_Add_access=5Fcs0_opti?=
 =?UTF-8?Q?on_for_alt-boot?=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Alexander Amelkin <a.amelkin@yadro.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 27 Aug 2019, at 09:38, Guenter Roeck wrote:
> On 8/26/19 4:57 PM, Andrew Jeffery wrote:
> > 
> > 
> > On Mon, 26 Aug 2019, at 20:17, Ivan Mikhaylov wrote:
> >> The option for the ast2400/2500 to get access to CS0 at runtime.
> >>
> >> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> >> ---
> >>   Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >> index c5077a1f5cb3..023a9b578df6 100644
> >> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >> @@ -34,6 +34,13 @@ Optional properties:
> >>                   engine is responsible for this.
> >>   
> >>    - aspeed,alt-boot:    If property is present then boot from alternate
> >> block.
> >> +                       At alternate side 'access_cs0' sysfs file
> >> provides:
> > 
> > Why are we talking about sysfs in the devicetree binding? This patch
> > doesn't seem right to me.
> > 
> 
> Correct; this is the wrong document. The attribute also will need
> to be better explained. "At alternate side" does not explain (at
> least not at all clearly enough) that the attribute only exists
> if the system has booted from the alternate flash / block.
> 
> > Also if we're not supporting the aspeed,alt-boot property we should
> > probably document it as deprecated rather than making it disappear,
> > unless you're going to fix the systems that are using it.
> > 
> Sorry, you lost me here. Where is it made to disappear ?

Oh, hah, I read the bullet '-' as a diff marker. Maybe I should go back to
bed!

Andrew
