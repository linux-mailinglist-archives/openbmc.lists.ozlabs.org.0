Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DD3594A0
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmyT0SzWz3bTn
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:33:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=s7aTIHdP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=vVjXPiJf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=s7aTIHdP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=vVjXPiJf; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmy65hf8z3bTY;
 Fri,  9 Apr 2021 15:33:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D2E5C5803EA;
 Fri,  9 Apr 2021 01:33:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=6KsZEWbeiMrRF/Lxcx0y3lXRjdkXfUp
 TzDsTGr+HZU4=; b=s7aTIHdPkWUUh50pfSfs9YrIamJKh1LwCTdl5ksQMzQC06W
 EUdsfUV/ewk95//Jv4HuOkMH6DKQwTdKfwt43N2rRyyv/otaXCgjqriNAjr0oZU/
 luVeRv3frbUuwUACxK1JGYFu7MH0kGfn99b8lBJ5UQvMeOW0FaYpbGtRLf35teSt
 zEI4749bzFfvojnrKsZ6D/nzmfZWT9gP8dWOl7kHFELvpR38/e4O+3UQn2QPt3dW
 bR3r0+b3vzmlNqXNmD5E8Mh+r+n4oZ+9zI7H5do98CqAw93mTh1vM2/GxkmTBp5e
 sIA+VoXzUfbjG6f7IARyCiIvIC3+Yns+Ou0X8og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6KsZEW
 beiMrRF/Lxcx0y3lXRjdkXfUpTzDsTGr+HZU4=; b=vVjXPiJfvj7jy5w9gnua2w
 +cwGpZ82luDiAgmBszB9Z3ZlWAHaqeaIBMUjrXI9EMcSomQHDqw0vddA7kHlYB98
 6qMjW+jm0ZTMInHw/5uKOkrJcUs58Dt27z2YlBx4sXyvLuy3UcfTK5AiNvd+V5C3
 tBfc9/KnJEzRQa+sTJwqMvCjkU8b6JZVCqlwTDLHQUYKQ8Wpv73dg7NyG9dqWHfs
 ubziUCqQmYrLh5hIXH7LJeOesWu6c2agu8lY3ZHcJpIOuavtym9pkt+kuDMlGtGE
 1kOiadKVlYQGAxon/QHJ0ztKjTqy6yHJOA9i+LUbzPCrT5659Q2gCW+U0jLtBHnw
 ==
X-ME-Sender: <xms:K-dvYMWCw-GkUejkBXVxANm1D1ra_d_841lfbxXom5vnlQx9jHlSqQ>
 <xme:K-dvYAnITXOpW2LILhj2vnv0Ib0SG9IUMHl8E3_3Y6FXZF8tPz3feM1SaqU9NMxi7
 mPaHYMIhWihugK7hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
 jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:K-dvYAaagiduEK58TzVobAp1l4DaeIotxjjLKfobRejgiw3ukhaVlQ>
 <xmx:K-dvYLVkaJ8gOLQMa4vRVpks2YCgFrQuBlUUVVgeK6aPOQjdjDkx6Q>
 <xmx:K-dvYGlDDbOalalze6k3F3zSnWA2ULCrF0DWmztLDoCJxxZ1m5Yk2g>
 <xmx:LOdvYA0u63MbxX8FXcxHeKOEZtskhce-Zm-LuDsJ4Tk9Cw8ujUDE8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CC383A0007C; Fri,  9 Apr 2021 01:33:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <29937129-3a17-4a32-a723-191b693a1e0c@www.fastmail.com>
In-Reply-To: <YG/i9lSxxCMIzkRs@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au> <YG/i9lSxxCMIzkRs@packtop>
Date: Fri, 09 Apr 2021 15:03:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_17/21]_dt-bindings:_ipmi:_Convert_ASPEED_KCS_bin?=
 =?UTF-8?Q?ding_to_schema?=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 9 Apr 2021, at 14:45, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:48AM CDT, Andrew Jeffery wrote:
> >Given the deprecated binding, improve the ability to detect issues in
> >the platform devicetrees. Further, a subsequent patch will introduce a
> >new interrupts property for specifying SerIRQ behaviour, so convert
> >before we do any further additions.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
> > .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
> > 2 files changed, 92 insertions(+), 33 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> >
> >diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >new file mode 100644
> >index 000000000000..697ca575454f
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >@@ -0,0 +1,92 @@
> >+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >+%YAML 1.2
> >+---
> >+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >+$schema: http://devicetree.org/meta-schemas/core.yaml
> >+
> >+title: ASPEED BMC KCS Devices
> >+
> >+maintainers:
> >+  - Andrew Jeffery <andrew@aj.id.au>
> >+
> >+description: |
> >+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
> >+  interfaces on the LPC bus for in-band IPMI communication with their host.
> >+
> >+properties:
> >+  compatible:
> >+    oneOf:
> >+      - description: Channel ID derived from reg
> >+        items:
> >+          enum:
> >+            - aspeed,ast2400-kcs-bmc-v2
> >+            - aspeed,ast2500-kcs-bmc-v2
> >+            - aspeed,ast2600-kcs-bmc
> 
> Should this have a "-v2" suffix?

Well, that was kind of a matter of perspective. The 2600 compatible was 
added after we'd done the v2 of the binding for the 2400 and 2500 so it 
never needed correcting. But it is a case of "don't use the deprecated 
properties with the 2600 compatible".

I don't think a change is necessary?

Cheers,

Andrew
