Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAE35947D
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmm04rmPz3bmw
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:24:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=aSXk2orP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LLq6rlxZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=aSXk2orP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LLq6rlxZ; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmlk4pvFz300S;
 Fri,  9 Apr 2021 15:24:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A0960580747;
 Fri,  9 Apr 2021 01:24:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Tsg8t/mJg/l7Xo3qIgT/COuJ+KimOhQ
 l4GFUqpSEKJU=; b=aSXk2orPauSq4IpUw+9+U8Q+/ZS2pBnkJOqeVdwgpSBrKH4
 rwavWdTu3RER4VS7ec2GKaKA3VBup6i5FRgceSmosDEpNhR3yKU3Q9k1Z77gwZMq
 fMuDesrezZk0YDWrY7h5n2h24EtV5hXgtSNcriyPmIW5FXNfXAXnKbuKx6E3EmFi
 j4y/y5m2pg4ITm7HkFDTZitQ0YJl3fwHl0fSsGao+U8lB2V3H/G/H9dZj+KD9ImQ
 sV8T6R9FdYPLjzxVsFhD6AFW5Dd6144sISzIv3e7Auyv4KKMTc35BcPjLpP8ZIKo
 9iwvRqIHFtjEXrFzmQjYRp7iSFMEc6i6bP25Dzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Tsg8t/
 mJg/l7Xo3qIgT/COuJ+KimOhQl4GFUqpSEKJU=; b=LLq6rlxZTo+gKhwAqZOsyR
 oCA7427BBoQgCiUa3Vhu8hbEm+n8C8IcPqTyFsBmg6dvtdlxGRSdn2l4YhGgpp2M
 TEbAin9Abtfcf+PSvvcJTVuneaDzSRcDb2tZDKuY9bfMWflUgo+yoOv122yelZKe
 YX6GCr7VdccJr2l1tBYQmTVqTHT0x3HDIIJl5r6p4RWqC+vmyZC45kuLYkQaLAf3
 02wf4KYGtPtH9eNskdObT2YEGBzjiOiVeU9aWoSH3NkDT4DGxflX7E3ZsB0HGSzV
 40qQpDIGnIQ6U+FZYs4zJEv/sjjAWo3NJbfmlJYhebddUB9/FVIXErgRhOzksX2Q
 ==
X-ME-Sender: <xms:DeVvYCwFb7EEdjbVyV8_qSuW2T-zLc_alCF2XdjjD1aVQ6-7v-G-bw>
 <xme:DeVvYOTXcH-ajixVXiFwdSUnsvGkX7Z0IICsypUksj9EN2wT8niG2Guai-fx11Bab
 rQsAD4Tm5NN-kpsCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DeVvYEUck1pddY3R2NbSi-oYdazQXk0ZImdpcmIscJsJP402DUNc3w>
 <xmx:DeVvYIhziOZvZecLSXydXe2nG7op-y_qEsHyO4oFUhPDHEjqHH0Syw>
 <xmx:DeVvYEAliW1uFjF-Tk207fuTPbYMqRv_vfB04OVmG8dcEPq_4HcldA>
 <xmx:D-VvYE1AxOQX27pz2YOcLMaHbrSy6fojo_ag6CmEfA9FsEwyl_7Xtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7ADBDA0007C; Fri,  9 Apr 2021 01:24:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <a181f404-ea59-4956-abe3-60d0bee917d2@www.fastmail.com>
In-Reply-To: <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
Date: Fri, 09 Apr 2021 14:54:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v2 01/21] dt-bindings: aspeed-lpc: Remove LPC partitioning
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 9 Apr 2021, at 12:48, Joel Stanley wrote:
> On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
> >
> > The LPC controller has no concept of the BMC and the Host partitions.
> > This patch fixes the documentation by removing the description on LPC
> > partitions. The register offsets illustrated in the DTS node examples
> > are also fixed to adapt to the LPC DTS change.
> 
> Is this accurate:
> 
>  The node examples change their reg address to be an offset from the
> LPC HC to be an offset from the base of the LPC region.

Everything becomes based from the start of the LPC region, yes.

Andrew
