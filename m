Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59A103421
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 07:07:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HsgB5PzQzDqT2
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:07:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="edouY/yf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ariIa8DS"; dkim-atps=neutral
X-Greylist: delayed 94 seconds by postgrey-1.36 at bilbo;
 Wed, 20 Nov 2019 17:07:11 AEDT
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HsfR2dwRzDqFJ;
 Wed, 20 Nov 2019 17:07:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 867435870;
 Wed, 20 Nov 2019 01:07:08 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Nov 2019 01:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=TGFoOR8k4c4tdXLrnHIT+DIILptA4jZ
 EVoNDESk6+yw=; b=edouY/yf5Ltb2h4tveU+VBLDqigm6a+1o88WqNYbDlnHSuY
 NBdl3gWfrhkds2iRT7jM3shb6CLSHf0fy6Oob5Vv/fm8cHXsf+Lauk1vF2SFesqI
 DNinzU6/eCcVHcmCORlwu2A3KBQF61/VdvU3QlrI8kcCUlr1TokQgz55E8JkiZs2
 WKyQyLY2kdh7CPFL6RhyuXX87PhdPh+uKfsFioJBxWLmUkWI0SrkS4FL2TMPncRZ
 Qv7kaNH0kB9ELX31uGZDL/mXVhS66ynXtF0nl7mDo3MQCM5AYuMmDTBGUMYskln8
 NeYoZgIHkcNwqrZS3f68eOaVDkGtBTc8eiFBkOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TGFoOR
 8k4c4tdXLrnHIT+DIILptA4jZEVoNDESk6+yw=; b=ariIa8DSRjxdXYdh8Z5Lro
 DB+BCB4mf3iRxK7QxOA0RgQ8uVPrJ/4XOrFwysxaZYZvtVC0XGqBi0a9KM08R1VZ
 xm+vvuxDR2X5LFe4PohbZ1Dew5/jXxQWhuX3CtmzEGJFsUzf112wv4wiZ4tuXXu8
 187pdMVL/LB9txSCIbpJ+9HuE0sOYvv2RZgmP959W5su918V2mLCmVsBY+0qb9md
 5war8QCBhkRlbCB4tetpXLAXn44wDQzJerFHdk6HrZt1pV2h5a4i/tf+h+ZDvyy1
 PnJxolhBvXl1nnDjet9V/d2kL+B4BgtS/HbgGW+m7niln0yYiTZ423UPretPb5Uw
 ==
X-ME-Sender: <xms:DNjUXRYMKacsLTHV0VrBYTs7OAVFK5z3O6F0DRECwlISpOLCvx-QPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegledgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:DNjUXUOJZPIWiblwnQxzM3JsDfovVhv1VV0EMZfwN2Fyi_21oNEegw>
 <xmx:DNjUXabHS0fhLPD9p1WVOx8WakeGSKcVzb2e5OpjGdro-hw6ChiH8A>
 <xmx:DNjUXcUq1gW5LvqJNwgeoskUiwgzvWqExEzZleeaRe4cAwEqRQ8MQg>
 <xmx:DNjUXaKBqLPDutNNhrlKe1gwGe_K4mBpHPBswL1Ow9qg9zF-IKU7Tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 14E75E00A3; Wed, 20 Nov 2019 01:07:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <794a7661-b4c1-46eb-bc78-79e7358ff999@www.fastmail.com>
In-Reply-To: <20191118104646.3838-3-i.mikhaylov@yadro.com>
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-3-i.mikhaylov@yadro.com>
Date: Wed, 20 Nov 2019 16:38:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ivan Mikhaylov" <i.mikhaylov@yadro.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_2/3]_mmc:_sdhci-of-aspeed:_enable_CONFIG=5FMMC=5F?=
 =?UTF-8?Q?SDHCI=5FIO=5FACCESSORS?=
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
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 18 Nov 2019, at 21:16, Ivan Mikhaylov wrote:
> Enable CONFIG_MMC_SDHCI_IO_ACCESSORS on the aspeed board. 

s/on the aspeed board/for the ASPEED MMC driver/

but otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
