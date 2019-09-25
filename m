Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F4BD664
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 04:35:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dMcP2V3hzDqQm
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 12:35:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ji5J1phd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GnSLJGgY"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dMbn2R7BzDqNQ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 12:35:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C92FB221D8;
 Tue, 24 Sep 2019 22:35:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 22:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=R8hCktazs/vjO+3P4ZlFQqB242Rj8cr
 DrT4f/iJd2ZE=; b=Ji5J1phdNTNlEdISJ/qnooCAETsdXG1wfrBO1Si2JOn93y+
 n3BqEZ8yuwgzLRUF/2+RW0gqbdEpm3wFY7kNPijpwmAhYjcrN7hpiE5DjsxN1E3U
 jzmMD7+h1ZRjv6hn/9SWLOEXrE+cMZzwY8rJVbPrAaa9iS23+rKioVBtYCbrQsOy
 uq52OzT/QyXsxja8kPhMw8OMHp4F9agyhdRMpZEm4MjNedk57FIxGQjbrIhy9D/8
 ILqCEQROrGu4HOco/obMQW9WYnGGqgLIyjEtHbX5qMmvlyXvmfYlMEdwUoTk9cUa
 0SE/9FE5HVCEDn6UYUhoYXyonixCo87iB+1JHsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=R8hCkt
 azs/vjO+3P4ZlFQqB242Rj8crDrT4f/iJd2ZE=; b=GnSLJGgY1hKBKjUUUeC99L
 yLbo3KCxIG6AWowVE7vaAiHMMiTkKyZFGUkR21ZfSZQwwK81VEJvnT++WuYNCYEG
 fgXc4pFK9hy4W6S1tNfNrCiYOHyUV0TpxhGQEz6dEbWjOwHN9iKPYtsjCQCPe5Y8
 30opTriTcMVn9SxqtIMIw/AocHuM7lFltq1XlqXfEh1e/nncNWv0ZprvQRyRdc0o
 75vBLvJ46Ki1Yn5WMOsRzWPQ8xcu8uOR8AKDEZOsHz2KDZ8DhvneXJoPg7o1z0IV
 oum0eFoVWznKB/mHHAYmjItGiSlC9Q3NLFg5vOJZTd56JtefLvmZa4aCkmLNtzew
 ==
X-ME-Sender: <xms:YdKKXWjd32AqcWyOo1bhf3_O5_hjMZb4vS7TkqC6Fz5ZXjyA3yWwMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:YdKKXeoFeKZDRu3FAwxxaZcSiO6GrxMk4F5VwfKug6ZmNvvubFI0Rw>
 <xmx:YdKKXVfPfWaRP5gtqziOwej0iY9UpsqPYikC9Sf0VTOT18ImV7-8Bw>
 <xmx:YdKKXZxfNNL9NVpnUXBcc0_4yijihANFayyoQ-p-URjneB98lZ4D3w>
 <xmx:YtKKXTheZzZfvtiqoP3CUU-bMYHIBJBEF2BxUtEjq21tSrx-qXnecQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 52DCBE00AF; Tue, 24 Sep 2019 22:35:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <398ceb70-1f6a-46d0-8c19-8c95959d2a6b@www.fastmail.com>
In-Reply-To: <20190924194759.26854-3-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-3-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:05:56 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_02/10]_dt-bindings:_ipmi:_Add_aspe?=
 =?UTF-8?Q?ed-g6_compatible_strings?=
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
> The AST2600 SoC contains the same IPMI devices (KCS and BT) as the
> AST2500.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
