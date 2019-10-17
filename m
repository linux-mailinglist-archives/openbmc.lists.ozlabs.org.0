Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7835DA471
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 05:58:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46twQ560vkzDr9B
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 14:58:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NoS2KLhu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jUOPZ1Ya"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46twPR4R6DzDqZk
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 14:58:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD93E21FDF;
 Wed, 16 Oct 2019 23:58:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 23:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=MYhQVvn+oGqLE6FtplDhrdUFqTLd8At
 cMx3nUe/Gq68=; b=NoS2KLhuALx6n6JesbHF6C5IF5b5McJChSTPIi2CIYJXref
 93aq6R2KpdGBbFRjr/IP1geZPsaexLp4zcENIHDRGRK81Ui+yT9bqrDJagLGQxx9
 S2An2iem83pEv8l3ln/QYt0ibJ3OplxpeDQZMhr8S6JvD/3QfEE/VTQeVuReCes/
 4kF/ZDhPphUpAcEa829JOdu9ejgA5MGIm/hu2mxRCUOARgh1zlLk4pzBaGMogNH1
 s6dMCekkFZ7xKVAJjtLzzYJ4TTy4Dou1nUsteBJ/yjBY1L6dlYyCcBQNHslAJ+1P
 US0e0ROBng6DZI7s0ER7wwCkhi2Mx3spVCDDrUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MYhQVv
 n+oGqLE6FtplDhrdUFqTLd8AtcMx3nUe/Gq68=; b=jUOPZ1YapzIhJLvVoGgOjI
 fidwaOug54mRge/JEUpAXPJhd8F8O03SnwTpRt3x8nhhH+i83kwj1nw+zYZP4suG
 Yf2swGwgpL9N3XeKMpWxapA/yCqUpTz1CEqQZx2/Xm86uxlikW1T3Sn9eqBKvFTh
 Tx6lssvS09WJzqhCc2Uctp5jHwAixO1LCM2GVwFkttnP7WyIaRfeJIfAIiRKHyYq
 QlimzENBniPejD1X1qIUDGbM3L4zLHQFEnH3LThZmm2xWt9hSkJZYEiNxQEo/frB
 RUIRUc+IIPw+CIKN6t8nnIzwIyIDKHGi+ztciwXG4tm8zR+ATwQ6p3O1OkG5EXCQ
 ==
X-ME-Sender: <xms:1uanXTHRc0s9Q8GpYDTgDC6QyQVcumRaIXBHx3TnHNEzM03rXl-vyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:1uanXcoEGUd9SzzXNXdEZhoQEMYEY1X40Tu09zOiaP0_zeu6YVgOPw>
 <xmx:1uanXX6PK2XLrVTCuY4TOrE3r-kaYru1FSm6iBm20wVuS0XqRFEDQw>
 <xmx:1uanXS7sMptTMheXe2CYXpMqzyUMqcCZLQA70hqbB2psRmVNbCtKNw>
 <xmx:1uanXf6mVM0jj8uaynfLuWHo1e0UC0WPgnw1f7d3dHuNKhap_miing>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59AA8E00A5; Wed, 16 Oct 2019 23:58:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <b26d9e89-3027-4502-ae7e-74c11413eae7@www.fastmail.com>
In-Reply-To: <20191017035630.18840-1-joel@jms.id.au>
References: <20191017035630.18840-1-joel@jms.id.au>
Date: Thu, 17 Oct 2019 14:29:11 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3]_ARM:_config:_aspeed-g5:_Add_DW_UART_?=
 =?UTF-8?Q?and_ADT7475?=
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



On Thu, 17 Oct 2019, at 14:26, Joel Stanley wrote:
> This adds the Synopsis DesignWare UART quirks, which is used by the
> AST2600 A0 to workaround an issue.

I tripped over this, so +1 from me.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
