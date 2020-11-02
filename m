Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB222A229F
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 01:55:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPZG30q80zDqSm
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 11:55:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=b1WVHrkg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=emRxK5zs; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPZFB3LT5zDqJY
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2020 11:54:36 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EA2E4DBD;
 Sun,  1 Nov 2020 19:54:32 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 01 Nov 2020 19:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=19aGdT0jkcYsqwrGvqz8AQAFckB4jNp
 X0KyUw0VX1cc=; b=b1WVHrkgjWA85c91zBSSKNy+mMmlnJ9CwQ8ikETa/CNEpLw
 HCoNpfaF818RCY0d6ePL7K386L/UGSU+gTZTKSqVssx/XQFQl+NC5pzyl+qkNLiY
 +I1RdFf95yXVolJmr8zy8p5Yn3wgrgHG2jmSV7lmgkdrgiCanw5irVdqEZ13wI6n
 H60Y1IkcuAHHWpZW8Lqcwyxam3z0XiiWC9NP028kGlX97MjnEC2axyDPDiPaF7Er
 qYpIf11BaYfvTFYi2SbJlXNGP3WZgygA5clM1Hz4g0oYWG3FKECcGl3H3718t3vE
 l6VnXu1VYh/UP0sh5RGUFft7jUOBVbqUSsez6UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=19aGdT
 0jkcYsqwrGvqz8AQAFckB4jNpX0KyUw0VX1cc=; b=emRxK5zs3n61DGsZjLdfIJ
 sNvoKij5m8HJlvmO0LE/b8/tagNlOl3gNkNVGyeOES3YVFQ4CVQAeKNOw9LNkmD7
 qYApIPE5sIu/U6mK1+lHQhiX0XZY83kNwrTnUk4UFSRF4ZllzC6Im8kvZRIy6FIv
 J63Sgj+kr5TGwLP0O+r9r13omvHpoex/KBiibNc/Zbu22YIbFJbGnR1e5TZAxMZd
 W2whmxoEfHdaS09LIjGYSRjuMYyHE7REORHeiTPux26IK9FMe5TZvTcbHvfaoLFz
 yIV6QUUWkwfmA0LyKQsxe33xMFLAIkXGDYrSZJIK0yHMiXrHkGivZbBuEkYiBKXg
 ==
X-ME-Sender: <xms:yFifXzRa7pYhdCfvGiBz6p3V5y4eGU6uR2_ojaTlMUu51YPIZDCjEQ>
 <xme:yFifX0w8bfCvjReA4HbLb02f-PiwniJdvbyYknVN2yX7r6SqQuk5zrydDcc9t5Uu1
 --5p_FAgT6kQ6V3KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddttddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepheegieelveeftedutdeiffekvddvffefhfeftdekheettdevveefkefh
 iefhffevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:yFifX41MH_jejc8zIx3i9G5Fl0RiwSqxiO1LE8XQvgh7WrkQBMIqFA>
 <xmx:yFifXzCy-eDh_WP08wlHeMtbwDIOimnNhx6dRl8t_KbTQnxPNefd0A>
 <xmx:yFifX8jC60DKNfQ-c_ZMURNBkfJdnbLyMsQBELomK_OKkitSD__3Ow>
 <xmx:yFifX0KOQjg4Dzgi5FaqBBei0dp-jUZOi8JQbkuQ_aq8Lwqm7c1g7A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4B0E9E00A8; Sun,  1 Nov 2020 19:54:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
In-Reply-To: <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
Date: Mon, 02 Nov 2020 11:24:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Artem Senichev" <artemsen@gmail.com>, "Ivan Li11" <rli11@lenovo.com>
Subject: Re: SELinux support question
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 30 Oct 2020, at 16:25, Artem Senichev wrote:
> Hi Ivan,
> 
> Yocto has a layer for SELinux
> (http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
> it.
> But the layer depends on Python for management tools, which does not
> exist in the OpenBMC image anymore.
> The problem is that Python significantly increases image size, it will
> be more than 32MiB, which causes some troubles with qemu emulation.

The problem is broader than qemu though, it would also be broken on
any platform shipping a 32MiB flash part if the image exceeds 32MiB.

That said, if there are systems that ship bigger parts and enabling SELinux
for those is feasible, we should add those platform models to qemu so
emulating them isn't constrained by the existing platform support.

Andrew
