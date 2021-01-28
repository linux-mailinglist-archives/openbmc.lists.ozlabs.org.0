Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D43068FC
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:57:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2BM6tdkzDqWt
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:57:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=h9FlGqCN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=n7F+0tBL; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR24n5JxWzDqB9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:52:41 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 659EE5C01F0;
 Wed, 27 Jan 2021 19:52:39 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 19:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=0y65DFXh9Zb4Qdu3mtJH79VtP72P394
 M9yhJrNNqcj8=; b=h9FlGqCNA3+5EwilhcC+1RoTWWDzQP0Xq0d0yFDu9Lami0I
 Y1UID1SqGjVnFUjwLU4RUZuoiPIIcJ3VWk7kdWDWX+0qClX50f6tHaIkqu74DObz
 kVNnCiDyPBv/gED+Y2grNLsbVq4spPqey4ybkyZGmRChqvap97KYMlqcGn9VLNyj
 /LjtNcy94c7tSDPpgByWxETN5rvd909ELNJVTj2JXmwtbdFais2RI0iHgG8aZnUN
 MpWc+DMX3A+rFZaUijdsiZvQYHUGKYdiwOD0mJYNJNR9KkNv9WHslYjmePdS4tgu
 Ki5JGXsNUF71VhVirgVp/FRZlTA7lkEKJE5gFVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0y65DF
 Xh9Zb4Qdu3mtJH79VtP72P394M9yhJrNNqcj8=; b=n7F+0tBLA1dMpdo4KoIjG0
 PA9Kv+gB93g+6ULK3uJTTf6RsHUZjE28knfXefza44+fW3B5CSYNVDvAyfpX6/bJ
 OMiRNl1nKhy9ASaU1obPtIE2yFq2HF8IkF3IkN/0kWCGr9LlovnkKDDtC/avyVBs
 7UkN/DyGqU6TqTNormZkuj3k+GiS7tcenibSFiun6jbctqVPvkmIr1xRabWbnuAk
 B/LgpnPnSDtXk4Bgi/zQMlUHoD4sBLLd3UwI+WgYslTOlizyLyXiTZEA9E1Skuu9
 3YDQ1FEfptmy/VvxZcWmLrw+rUPwYFZ6wNJIOWzFu9rSfHlpHPXCJIdJRAowtSwA
 ==
X-ME-Sender: <xms:1goSYEvy64SihZRz5eQoOyQPhmA4WrEiVoMtD4-6qCtgoGfgoCjs1Q>
 <xme:1goSYBeoP0NkHvlHrh6Q_WUch9F6rqyoEec0Qo7yulwDeMlopknAAjSRQht3hughG
 0LrwsLth4fUK3pY5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1goSYPyTs7FRZ1xDlbYyeqRMZ5Ne5j7sqtrXtJoSKwMMZdcHssYqJA>
 <xmx:1goSYHPWnTl3iOvEDFaZyNeoB-zAa_sqszGQHd8fyiBOXB2VipCn1Q>
 <xmx:1goSYE9lJ__bAzo6okgoUAFVJXHOCwF3eQKR6KxLgEPhQBYL_o6EbA>
 <xmx:1woSYCkdgPwJqRx19hETahPDo-Q8WLuC4asb40-RFQ8qmOhDCCRqog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 65CC3A0005E; Wed, 27 Jan 2021 19:52:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <891e2caa-f7ab-4a93-a762-4c5a716d1bfe@www.fastmail.com>
In-Reply-To: <20210128001521.266883-3-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
 <20210128001521.266883-3-joel@jms.id.au>
Date: Thu, 28 Jan 2021 11:22:18 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v3_2/4]_config:_ast2?=
 =?UTF-8?Q?600:_Reduce_SPL_image_size?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 28 Jan 2021, at 10:45, Joel Stanley wrote:
> This modifies some features of the SPL to ensure it fits in the 64KB
> payload size once we enable FIT signature verification in the SPL.
> 
> We still build with thumb, as this is selected SYS_THUMB_BUILD (ie, the
> SPL defaults to thumb if u-boot proper is built with thumb).
> 
> The not using the arch memcpy/memset changes save 668 bytes. The tiny
> memset saves 52 bytes. (Anyone who wants to test the runtime impact of
> these changes should do so!)
> 
> The DOS_PARTITION change saves 229 bytes.
> 
> In total, this set of options reduces the binary size by 1105 bytes
> with GCC 10.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
