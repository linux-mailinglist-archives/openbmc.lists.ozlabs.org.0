Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2030BD72B
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:24:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dQ1L3m8dzDqkb
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:24:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XdHrSpNl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XkZjjyHA"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPhT74QTzDqZb
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:09:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3FE0A221DF;
 Wed, 25 Sep 2019 00:09:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 00:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=F1IPdjahKd8pvdWHPRHHhRgJ1DMaf1u
 vzFAl1o4XONY=; b=XdHrSpNln2oEZtJKRoLBi5yq/zowwK//unU7mzaM3fvA4Uc
 iLjjac+pSGsxtZylVMGslxQnqdj7DbuQ0OwpNT+swLysvc3YZS9lbzp9bzZmHWQ0
 QSmVNqsPiw2Cs3qH1VPY5KL+eJ4WqifJktFiM1li7n1f+39QwcDaXBM5mURr0XqB
 MF0ciVbLNqtUtUCgxr5EmQgxBZt0/hxNIfTJRoG9WzhgToIdpT0jgUm5YKdKcfHE
 2dQCjwiw274Up+vfYU9xJR0zbyBKlZuVkYzNd3hrMTULbgEt/GGMRKba6fzmQ1kr
 mggMkI3wPqxl2u9Vk/1BjcvyH7IDtG/uCXtVkAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F1IPdj
 ahKd8pvdWHPRHHhRgJ1DMaf1uvzFAl1o4XONY=; b=XkZjjyHAg3CgiJsSc75VOS
 wXWzA93aVXZ+Y8CotHFx6Kls9jlr43fSGTFRKBhMG8KnPgL3MBxESPCA5m2zz/At
 HdN9YMBwtwm47kCJe1wMKwcoXUzaRZiQ3WZ0gpL2fqZXCF3d86yepbNKqr9QGdfF
 XdjsiNNXBQ0T3rzumvBnni2GlVLhQizFlHLF6LbJVwbm5AQuPb0LQrLXZ9HY6n3D
 pb2+SSEy5lHe5oejs2vWkyXTdyYutS2DQnp41ZTvKn3JCJMK1ecHiT+x+CDIDADz
 TrqO9/Vbm6br0uR/eg1RzAYBVaBFZhOznRZKk17tqdQSzEmbYFV6lcO6vQo/cNBA
 ==
X-ME-Sender: <xms:duiKXddt1AXAGJaY1eAjP7sw7sivl247DheFI5mKJ1zQ4eZlJ9Bjcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:duiKXffjeqso8P3DU_AcflJN3Aws4L4IKhZVmH_mmS0qFfY9Wq-o6g>
 <xmx:duiKXRjngYcgr8wHe_jHeZ7g9elqYbOMAOvismllBL38Gg8w-w4nWg>
 <xmx:duiKXbT-DVHIcNcZys3eWSnW5G3RvEZSwcMhZKFz61NcfXnOddcpEg>
 <xmx:duiKXYQMhUPKoN7DLReCrgTBh6DsIh6aUO_b9AT_x40JFTRkjCyTzA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0C656E00AF; Wed, 25 Sep 2019 00:09:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <c548c6bf-e6ce-424f-91de-6cbddace034c@www.fastmail.com>
In-Reply-To: <20190924194759.26854-9-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-9-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 13:40:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_08/10]_ARM:_dts:_aspeed-g6:_Expose?=
 =?UTF-8?Q?_SuperIO_scratch_registers?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 05:17, Brad Bishop wrote:
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

I really should fix this junk some day.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
