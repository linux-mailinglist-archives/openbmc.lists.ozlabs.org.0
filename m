Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B12302101
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 05:15:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPGkZ4q4MzDqrX
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 15:15:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=DCe9sARN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HQrr0ZWc; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPGjd57BYzDqXJ;
 Mon, 25 Jan 2021 15:15:01 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 891225807D1;
 Sun, 24 Jan 2021 23:14:59 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 24 Jan 2021 23:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=ZqoO0c07wdhPozU6W/qvvj1if9TEa77
 alqdzsA7xV7A=; b=DCe9sARNOTcrbZtMd1LO5IaYIqpaBwZhQLB6ts1n8U22yQi
 i+V1pZz8QfrERiS0fgbT+hNBAu5HEU4tG88023g2dFhnnZUS1jtH0yaZ/Fwm3t+v
 aoiqffY0ko9Ref5A5mkNxuvx0U53ohyIe5zFzSKeINrJ0H7L8p9hxlHbmYps6LdQ
 M9EAPyZppMqO8CfwahqYqyiDmsd2kgZuak9UqZmFtsCuh9DNE/eDtOj/VumiODIy
 FlKZOcgQeK8bLo0gfJFV9mR/xYUqDpj5b/bDJGsUVqr38dQIqqvDTwr9WMa8SR6X
 xxDeW/0IqZ07dUWKjaly4C/C8sSJieqOf7CGviw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZqoO0c
 07wdhPozU6W/qvvj1if9TEa77alqdzsA7xV7A=; b=HQrr0ZWcWo3owkAk1X+f1C
 C0dAqGYm204Slm2PWS+z8RSs1O8sf2QL0ZElFCp62O7H2wTR7h6JlI5RpAmUyXLv
 8AKed3QGneuKEfA8kBsvRN6KTme/RBXRpub5FvVooc09Ut2UPmQSAjsopVKmAzQd
 rnpTBQOp8ElbNzngvrgGizE1l4r1Mk0F6TpZeRu2HS4aS1ffqiFlG2scFewE/CeE
 0LCyZS37f+MpRuC8jdiBeicbLEEiIFCjGUQcZY4nCeq5O8qOihC3xYaPCIauze5H
 fbdFZ6v3uHf4ZL/Zt4kq2PFqW4bqFGHqxsL5ATxEFWDl2uPs5qB81VeNBxWBwgUw
 ==
X-ME-Sender: <xms:wkUOYFm16-7WoOBbCXGyeG1_CYfU6I-xPgrbk1vl6TqMK7feGaOiIw>
 <xme:wkUOYA1JTCNZPQlUHK8dUJI9gK8NcoPMnxT1IedYwZzt-XMTHvnmiIyy6NLZ2xy06
 xqU1mEtNC8JeoTyBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:wkUOYLogeSZC9Q3AwNMxo0knJuOk1A5hIFZ52AO45GIAGLmS2LMrkQ>
 <xmx:wkUOYFl3VfH4OYR7VoFWz_MxZtBWhqIYKsmNNkRqy9WwvesBpNnV-Q>
 <xmx:wkUOYD2L7fqrvDqzzjN5PU_q8ets7P-CUZS2IHq-6pSlL7C7cWRGEg>
 <xmx:w0UOYBPSbSDBeY5s_slzwPN9n9oelEGcqdAi64SCatJ7bBq-Kt5jPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D4B48A0005D; Sun, 24 Jan 2021 23:14:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <2ee34adb-ca7a-43f5-9101-f48909667962@www.fastmail.com>
In-Reply-To: <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
Date: Mon, 25 Jan 2021 14:44:37 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v5_4/5]_pinctrl:_aspeed-g5:_Adapt_to_new_LPC_device?=
 =?UTF-8?Q?_tree_layout?=
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
Cc: BMC-SW@aspeedtech.com, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Using a Witherspoon (AST2500):

Tested-by: Andrew Jeffery <andrew@aj.id.au>
