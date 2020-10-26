Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06E298532
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 02:00:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKGhY3YsHzDqMT
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 11:59:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=bbVRUjYl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=NFVIlTmV; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKGgp5nXpzDq6k
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 11:59:18 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D53D5C009F;
 Sun, 25 Oct 2020 20:59:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 20:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=g8VWp774b7jgttFOi5Wi1Ip4Vej+Qsq
 jkn/VxB+AlNU=; b=bbVRUjYlQ53v6yZ6slJqrDgh4lDh+U4i8R3e9qDdgkIM8DY
 l+/froNh9V1jocXg04fWfjE5UsO4IEEgSNOxLmmLNyXHp+JI49xDU+5CyYUjaTz0
 Nf3KRFMMn+qXWMpoOofDEIohFRSOcniwWZwgpHWEdgVPDLKsJI43Arx1rUjNwpAc
 AX9L+/Q/vQMh2ROz2W0qIq0xbahzC3Dc7NnbbsR3CWdPTEYu/ikRsyEL5o+f7VmM
 prHAlomtaLQU3xaTS8U+cXiIoz4DgQnmhYAvpQs9cvJcB0qISgpwMBcvkzVM76pr
 H2/ew6sZKOo3CUGaQLTmNxhGdDg9lpcD886Iotw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=g8VWp7
 74b7jgttFOi5Wi1Ip4Vej+Qsqjkn/VxB+AlNU=; b=NFVIlTmV62viV+p2GZEi8R
 eUqbZgDAnOZ9MQnjsX/4i9fqFU/4OuSlh+aadAbm/jWuKpfCeIQJtDF3dlAO4iAi
 g8UYtCLcR/cdQQMLcrFMcF5Na+KJms1s5rJ9qo8MqfBdWAj4idq5TzZZFbxgx4MP
 19/Lq+PaxH3tqrnFlh9/MbVRYetgCznGzi+4d/psG3LyvCD95vuovzXHz0RfEr2G
 RD4IY9GYzHhNwwVgwGigVu4Bflb2jY4Q8LwXQgqRgSmwy7H03d9LwhzKG7Hs9lWB
 oMD50GIq4DoHvVc2wRGFMhVPDTcAoc4jWKJxqtUAKlkShQ2DJveqBb45OH/XgUqg
 ==
X-ME-Sender: <xms:Yx-WX7xmMfk88M9glfwMIMU45uQvjyz72Ln8MF3249OnCqenGkZODQ>
 <xme:Yx-WXzTCm4GA-p98lcSTtCNjmMgQiLLNv67FuoVPkb8ceMzMyj9k2HmZg35q9-z9t
 4gjSAn2UbjvnQZGOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Yx-WX1XAHDfGpkLr1WF59dsRGLYTR5BwE8233BhRJewa1rf55f_a2A>
 <xmx:Yx-WX1iuSZXAQWygnJ95FlzuDMQf6EIP-WK5kiTwAj6AZbRkieavqw>
 <xmx:Yx-WX9APZghZ0udhxkcatXf1xXt-cRlDhd9EnSYeH3H7ew8peL9Zmw>
 <xmx:ZB-WXwqzv7XfrM2q3m_2Rb7knFRje3yZGi54iIeZG0kZHBDR-gULIg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 01779E0416; Sun, 25 Oct 2020 20:59:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <63aac251-77da-468c-911c-5e24b2a9e5fe@www.fastmail.com>
In-Reply-To: <20201022081002.2665132-1-liuxiwei@inspur.com>
References: <20201022081002.2665132-1-liuxiwei@inspur.com>
Date: Mon, 26 Oct 2020 11:28:54 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "George Liu" <liuxiwei1013@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH]_ARM:_dts:_Fix_label_address_for_64MiB_OpenBMC_flas?=
 =?UTF-8?Q?h_layout?=
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



On Thu, 22 Oct 2020, at 18:40, George Liu wrote:
> Signed-off-by: George Liu <liuxiwei@inspur.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Joel: Is there a reason the 64M layout isn't upstream? I don't see it in 
aspeed/for-next.


Andrew
