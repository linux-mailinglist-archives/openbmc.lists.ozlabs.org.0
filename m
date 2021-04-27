Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FC36BE18
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 06:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTp270BJ9z2yxP
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 14:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bCVM03l4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X0aOk0FL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=bCVM03l4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=X0aOk0FL; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTp1f4NG1z2xfd;
 Tue, 27 Apr 2021 13:59:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 78E3E5C019E;
 Mon, 26 Apr 2021 23:59:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 23:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=eZfNkGx2BMSMQ83oloGLPtdwxAJCowu
 oCAnvMoQdjj8=; b=bCVM03l4/97d497QZGfYgytoNBX+T1CreC0zTE0q6c0+9wZ
 mEGA4RTEYR+eTwIllHD5sJ3k1BsNcy4B7NDmvbtYqm+gd2nbsE+RU4/xD96BnD9j
 LGzCxHzTYCQQTk2NONoSTkzzIh+x8DwvuQ/xJ4wGTVkr0tjXi8CSwovp6oZXW7wm
 sk08hWJfC09ydM3Pwqf9YEIJP+qYDUvOUaNLXI4rnHvjrSDrwN1RHww1wH9ZxdWe
 R8OBPUy78pvC8TktsOLmV06fOIyQ7kyoK3BwjMNWKQ9Tmse9YVHQn9UcojbsHoa+
 6N40imzKpA6fk6x6jKdfgrbK0zcHpiyxKoDkmyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eZfNkG
 x2BMSMQ83oloGLPtdwxAJCowuoCAnvMoQdjj8=; b=X0aOk0FLR+JJ2vqD5oDaKr
 Uritv7xfbgFrUCSGTg+8bCS+WsyTL0rMyPLn0u1IehKhwBRKFsNp4oGvthlkXj9/
 3afjivUZqn3NOVqvUL9o4BgmIQsx7OAdDx0z8He8SOux9HPnvBQHUsR6/w6C1Uv1
 pCVuWd+JB0wC4Y6dWvZtfHAP2SFgVzwlqkNN6QAvHU5m5rJj4ftfuo0+n9B2L1+N
 ez8Ts7Jt93j38xNFOotRSbbk869kTAesLvUiQOsVBuarMTieipjT7qGD1Vq1lMoB
 YIkf/u3+VVmnpE8xxZtQKrbTDJ0papDJYtZ/3GD9vcbORF9mJdoVLYVEHdLMmyxQ
 ==
X-ME-Sender: <xms:MIyHYLL89azaxFjwekkmWWjoOpLxc6CMprgVNyoDI2-YsdQmcd0dKA>
 <xme:MIyHYPKf0j0_tyVmd5aE9W-mXaJVVmM-xuD0VBMcSpCtl_Px32EoQXF354BbC8daP
 M0XJ36L0nrO6NTUnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedv
 hefhveeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:MIyHYDve2dQUlUboid9PDA4PTLOVOpqrsBANN4bmZnGbUYjbFAbx9Q>
 <xmx:MIyHYEYNtKviYmJndPX21uzTgIpm88701W5ffmOjJA8wwv9r3nhrgw>
 <xmx:MIyHYCZPYgw7pKFv6K6MIP8smjnu8oJ7lbaazwKspQpqRjadZ0MjXw>
 <xmx:MoyHYJzbJlkBhIZImGFb55oIa0jpv7oSRBAyowe0jM_AtAXkQ1yvyg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 07EF0A0007A; Mon, 26 Apr 2021 23:59:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <201d989f-882f-4b73-ab06-5085f99301ed@www.fastmail.com>
In-Reply-To: <20210416075113.18047-1-zev@bewilderbeest.net>
References: <20210416075113.18047-1-zev@bewilderbeest.net>
Date: Tue, 27 Apr 2021 13:29:22 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: update e3c246d4i vuart properties
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 16 Apr 2021, at 17:21, Zev Weiss wrote:
> This device-tree was merged with a provisional vuart IRQ-polarity
> property that was still under review and ended up taking a somewhat
> different form.  This patch updates it to match the final form of the
> new vuart properties, which additionally allow specifying the SIRQ
> number and LPC address.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
