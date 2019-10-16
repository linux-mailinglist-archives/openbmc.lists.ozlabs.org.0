Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2DDD8625
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:58:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tH750Zn9zDqjH
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:58:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SC46MleG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sbO/VYYw"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tH6F1dzGzDqWW
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:57:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DB3D821C47;
 Tue, 15 Oct 2019 22:57:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 15 Oct 2019 22:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=8Cufq9x5ok6+diW25TftF9G1dfSu1Ps
 3bEsgoSmK9nk=; b=SC46MleG8VxddrQbYQpm2qalO2hb4iLwHVd0IRRhnAQHv6D
 N8g2CtPnaOE/P7X2xVM2e8QKb1ThL7boM1ySSb9YCVYeEXsR3OCnMC20/yYylirN
 t/AveUvBgJKYx0+c5vKeER8YXU89WJxIaCVBmH25OA8WBZuEI+Ivv7tKZnUsDq8+
 WOrkBBR1fYwnQkwO6mnZ3x8nRpYtwjEMY1Ks0exPjlXTPU/aMucVRdAj1FOfoN7N
 vO5igdT2XIzxECmZHxjberbvps0smXgjt9vU5OcWAwTVYqwmG9Vi3fNUd2eLMaTd
 fEyvs4q0gGSdBD/UZra6P2ObXfW0qdslGzeOefw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8Cufq9
 x5ok6+diW25TftF9G1dfSu1Ps3bEsgoSmK9nk=; b=sbO/VYYw5EA6Exysp/VSiZ
 THAustNfY2X4Aw5BrexdbwzWQn/UroCQ/cs70QdqINfNywxpYyov1RqUaotwNwfw
 gPgKq/UGcGb6FbXRvDppOmRWzpBvPqI4CyytCoOnexmDTZzFsLL/oTMmnH9LbsSb
 kE24erjhcTp6R5A2Z7mCFYTlYF2tqY4ZCbimJTJPDQRcPXv6CjPkLDABludsnrzN
 5Cphw6j8OoLvMW0xwLgZm1kxAR1et6DTikRHDWx2xpqHPIsC3tGZKHlT31+Sy0lS
 V6ABgd/MIZ5JTUYK3OOwRXSmhigcMH6T98x/WD9FqXeNGa6NUsGOI0ML8n9IwEfQ
 ==
X-ME-Sender: <xms:L4emXe3y_ZMrJokkF_mGPIvYC323pf9FfTuRhY-nfF428BZGenIQhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:L4emXSf09wX2XvOs6DD_9JDod1tm16ZQeXOKeeA2wJcWVlm3aa8JQA>
 <xmx:L4emXQK-mNGIlfqvjeBbXgP6oHKljxxeJlJpnmCa7ACXihPYpkEaVg>
 <xmx:L4emXYFpjWJq05qQPcydRA_otfJOMhR2Irm_NaaXHI2R7q_tvw7qXg>
 <xmx:MIemXXwWJYk0f92t6_RSTy5n5dMNXF03F0NfxCR8QP3gf7mwdGkmsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 92666E00A5; Tue, 15 Oct 2019 22:57:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <55133d9f-7742-4802-8de5-287cd2f11d64@www.fastmail.com>
In-Reply-To: <20191016025121.16564-3-joel@jms.id.au>
References: <20191016025121.16564-1-joel@jms.id.au>
 <20191016025121.16564-3-joel@jms.id.au>
Date: Wed, 16 Oct 2019 13:28:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2_2/2]_fsi:_aspeed:_Add_trace_when_e?=
 =?UTF-8?Q?rror_occurs?=
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 16 Oct 2019, at 13:21, Joel Stanley wrote:
> This prints out three registers in the FSI master when an error occurs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
