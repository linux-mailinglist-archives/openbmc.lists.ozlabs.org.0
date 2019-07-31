Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C37B82E
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 05:13:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yz6C5kgjzDqc8
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 13:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TyfUodp6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="G4fyzKkr"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yz5G35YfzDqZP;
 Wed, 31 Jul 2019 13:13:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E802C2089D;
 Tue, 30 Jul 2019 23:13:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 30 Jul 2019 23:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Os4kyQEaIKRJ7mL6sANrafcKtrpvoRz
 xKXH6bleWE4E=; b=TyfUodp6+stoBnZOtnQz8vcPs3DXerH0OoBY+FLkvQlEfni
 ehWWVecw2avMP/G6JUNbfb9xcrNQ/B/ar6b5vXUz7omkyjvbBYEJZ5SQ35UXAfh5
 p3W0yyf/nwIob9p+gCHC7CJJ7KTYKXYYCchO3uY8nEy3sEkHXxW7GBGelNY1oi6q
 rDEqEDPFHKSRVJ0IYMNBW0oOKe/dQgXe89Pm313KKKBuSsOlgFiOkqIxipAbPi3k
 ZW+IDgUIyzBc7VmVh9J2BFFMWmopSaDJM8EuPuUsPjtpDqfeoo3gg3ydeZ3I9po+
 9ZugU/c8F3UPVFhmK4/KTXGlCp27p2mA8NCIE6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Os4kyQ
 EaIKRJ7mL6sANrafcKtrpvoRzxKXH6bleWE4E=; b=G4fyzKkr8HCt5T7c7ehwwY
 4MrON7N3Fis3WAHj0MwYXKd2nXumVBYpnYIM29BhAyD9vks3YQQezk1fKfpXMK53
 zRVIpW7l1alr3Assl3w81fEueuUia0OLGxObPcOu57PLoO7Ai1oQ0fmiHdfa+ekZ
 AN7DfgDM3sk0CS5zh4KgZ93yuGV9eQrI4glSXjY2qESRAYM0luy1GmTGh8AFLmEk
 nTllThzkvKqv4YuJBNBLAEq94L0R7GzoWOnglXW9JkWOb8KsYnDIs4PPLJyS3QFJ
 mZRTANlk3a0T50SlvYfoCKeNu5/8/2LjhKvis3ymm2KPvgc8UFjagb7JOqg6ADfw
 ==
X-ME-Sender: <xms:PAdBXdiTUSm90OENxknvFJDzGaMOUGj8AiTcyb0469Y46UHuLAyPAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleeggdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:PAdBXVT7EUuN_qFzZjRvDSM1hY6EZku5aWI_tOmhvxKjNEjY-pa41g>
 <xmx:PAdBXUlXCCzF0EWtrXssCpTVJnySyjL21EEujsLFThSPb0v0zmC9jg>
 <xmx:PAdBXf7SWQXqorwGPnmtP4vJdji8rC99iyiCytDwXNNFCj-Ek2SE7g>
 <xmx:PAdBXezR4wnEjxDB0ujxYl6leL7LHKu4MkoXx9GadUlqO3RiEiMaVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 02D76E00A4; Tue, 30 Jul 2019 23:12:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <b4670171-e161-4d7a-91dc-a1e5a95f7dbc@www.fastmail.com>
In-Reply-To: <20190731013404.243755-2-osk@google.com>
References: <20190731013404.243755-1-osk@google.com>
 <20190731013404.243755-2-osk@google.com>
Date: Wed, 31 Jul 2019 12:42:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Oskar Senft" <osk@google.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/3]_dt-bindings:_serial:_8250:_Add_documentatio?=
 =?UTF-8?Q?n_for_espi-enabled.?=
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Oskar,

On Wed, 31 Jul 2019, at 11:04, Oskar Senft wrote:
> Add documentation for 8250_aspeed_vuart's espi-enabled property that
> enables to auto-configure the VUART's SIRQ polarity.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.txt 
> b/Documentation/devicetree/bindings/serial/8250.txt
> index 20d351f268ef..4b8b9e502179 100644
> --- a/Documentation/devicetree/bindings/serial/8250.txt
> +++ b/Documentation/devicetree/bindings/serial/8250.txt
> @@ -56,6 +56,11 @@ Optional properties:
>  - {rts,cts,dtr,dsr,rng,dcd}-gpios: specify a GPIO for 
> RTS/CTS/DTR/DSR/RI/DCD
>    line respectively. It will use specified GPIO instead of the 
> peripheral
>    function pin for the UART feature. If unsure, don't specify this 
> property.
> +- espi-enabled: Only applicable to aspeed,ast2500-vuart.

Bit of a bikeshed, but:

Given it's ASPEED-specific I expect you should use a vendor prefix for the
property, e.g. aspeed,espi-enabled.

However, as I understand it you want to determine what polarity the SIRQ
should be regardless of which of eSPI or LPC are enabled, so I don't think
the property name should be an explicit statement about eSPI. Maybe
"aspeed,sirq-polarity-sense"? Anyway, see the point below:

Please use ./scripts/get_maintainer.pl to determine where to send the
series - Copying just the linux-aspeed@ list for upstream patches is not
enough. For instance the series needs to at least go via the linux-serial@
list given that's the affected subsystem, and you're adding to the
devicetree binding so you need to send to the devicetree@ list as well
(you'll need an ack from Rob Herring). The get_maintainer.pl script will
give you all the information you need.

Cheers,

Andrew
