Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B092AD8724
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:11:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tJlR0k5XzDqYW
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 15:11:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GeMxSITD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cMrIpK+N"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tJkf5j9xzDqWf
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 15:11:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 24C0C21165;
 Wed, 16 Oct 2019 00:11:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 00:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=7R/oOEnXQjupvQOBw86Ztg8MLWxl8Hi
 TnhPtsKbj4Zo=; b=GeMxSITD4EvKwjASxlPg+Rti7oNDmFm7d5nziLP8WXH3mFM
 6XVHHonevU4Fm4z6XxX47IUinlL5DEYPyoDmv9XYXzcRqyuvaWV3bW+hVIC7zpWf
 5KRErizQjTVlSrXRoNmPWsRoMOyzkMhohjraglv1WGPeyeOYGgKYLRk1nvvaPl0A
 ZKoysFbtaWSHT7LDacuQQnzHpvShifP4BIwIZzV92+UN7kEgpzFV0kXZd2BmGWHB
 wsdVDTANibaX4ELOSZuwhI/Gmb5O/+jZeftX9yOZ61VTCxWf+Tky6LGmACXmsRbB
 B+cq1ix5gqJ4wk6RaM245d4CCd0OdWvUIU2UcMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7R/oOE
 nXQjupvQOBw86Ztg8MLWxl8HiTnhPtsKbj4Zo=; b=cMrIpK+NuT8cBxbB/rkOby
 QHND23cA1gWFx0l52QzgRmtx/fIT5odzBZkokw9q2TGOhpYD0r6DsEtN3Iy1KqBm
 808tDFVH3nIRAbMnLXJQRt3rvwQ/g72BqHK0ud0PtvE2Ys7radWYo4bGYcQYDxUk
 VbngFa8KSKr4/aJpfdvbc7tqDxnIk1l7nDo3iFCR0Mc5eVJIayxxu0zVlohGsqLH
 p5ojxtb6qG7+nXaCbrcF6SWLEgBb+ERs9XQ/dh07E4+2MB8hGTTziNedzjub6o0T
 pYKUVidE18co19TomDx8nQCs2CieVydkKmQgSsOFTLDN6cN6BZ9EGNEZb8PnlwYA
 ==
X-ME-Sender: <xms:VJimXTcRQpF5Oeh_8WYIwB-QaINaXA5es5y4MFJIY0pQ0ZZkGYQoOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeggdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:VJimXUHIHzMJ-XWYV2zp13EjmaeGFgCfBFlT2UEbThA6spWBvSlHVw>
 <xmx:VJimXUVqja-x4hvQWkaybl4HgOC-LNcC4VlOaRRX_Hx7iz8GS2Gxkw>
 <xmx:VJimXTJLNgjyNnp7U_W2trKFTP8pzH1LgUyrlsjVEQnT2A9dtvJ-lQ>
 <xmx:VZimXf19HyJ6zdxO3RvMaPWywAFW8FoSpuNcDDpLk6Qhl1I0akzw7g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B890E00A5; Wed, 16 Oct 2019 00:11:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <a634057d-dd5b-4681-a92c-198336f7d669@www.fastmail.com>
In-Reply-To: <20191016024857.16251-1-joel@jms.id.au>
References: <20191016024857.16251-1-joel@jms.id.au>
Date: Wed, 16 Oct 2019 14:41:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed-g6: Fix i2c clock source
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



On Wed, 16 Oct 2019, at 13:18, Joel Stanley wrote:
> The upstream clock for the I2C buses is APB2.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

This aligns with what ASPEED have in their SDK dsti, so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
