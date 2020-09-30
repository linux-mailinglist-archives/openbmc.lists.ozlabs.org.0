Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096E27E046
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 07:26:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1Pqt2PM3zDqYY
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 15:26:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=he6mFLxK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=e50vznJg; 
 dkim-atps=neutral
X-Greylist: delayed 163 seconds by postgrey-1.36 at bilbo;
 Wed, 30 Sep 2020 15:25:29 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1Ppx6LLGzDqD4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 15:25:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DB4CF11F4;
 Wed, 30 Sep 2020 01:25:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 01:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=hBz+/GGJoFYTgY+PTM/b6GAnurNvKDm
 S4T8x5g6IkuY=; b=he6mFLxK0KmAqvoFgBZsoPEeYds9Xt5SnIbdAPEubhdngqn
 vAjSb/KDrx1VyoeUsmavJ/OI419wlPkzYi1jsPZvM1yAJfpb9VrOW45rL5HHTRHY
 tSVBZbKJlqHoByYT3wTM8hzaAMnbaGq1yQo5nIbO03JrNKjgxWzCNj8gQrKdXwP/
 tVYTbFgHanGbYlE+c7TWebXWqIKiWC7nTvZpCpeuWws7XynYaZc+VoW7/fIL5ICb
 JEtjmiBfZzpawDuHUWOAY9Z/Oufi2loYtUKLzBWAeFwaI6/Xz360H/4J2Tk6kqhm
 rk822bQVGMrQsIVydhkcfZyJBiWqkiTOYZttgtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hBz+/G
 GJoFYTgY+PTM/b6GAnurNvKDmS4T8x5g6IkuY=; b=e50vznJggWlHOWBHF5Se5M
 aDQ41iMz2v1CibGCSu0Xbu1nTaidAkK3pmHYKPtP0U5s7ZcbiNR6d8DrputYMC6+
 7TZHKkLBEoAMS7ayR/afgJPTBZFZfRw91/HtfY82AhwKlKha+Cy2cmLocIIMlWSb
 x2CTtsXIkeGTFGxlmB+pNNsmbhLz0E8CP5156Sq+SFGLTU3PJALUFMW/3T+CBUwe
 BQ4pfzPDcGxXIJo2At7DO9b1JBoRbFD4srHPVoo+05zx2dyYdtiZhRoaT/NdIGYv
 IMnhVVMX8O0gAWHHzZretU2V4kLaPyOOMCABbe741/p9e9HHtXlbVC0XQPHHrgxQ
 ==
X-ME-Sender: <xms:xRZ0X122R73JEoQkDdTraAlVaFuhEQ0sjQr8FE_mndfsur8_g1ABFw>
 <xme:xRZ0X8FPEhGbe_JnGRz8NFQ6qGjaT6O8WbromsH0hGvF7E9q3Ej_HvW0SDke1cJLN
 mTW_Hn_RsXfNKv6XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedtgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xhZ0X16zv5MFHc-s42Nx2L9pBzoi-6oRx9G5J8B6wwzrclXXgzZ35Q>
 <xmx:xhZ0Xy0_UUd2uE-cw4Z-w6AbaYlhOhFYtPcrCCqoqA4iY3Uth9lFHw>
 <xmx:xhZ0X4EYGtz-6rfBJhD53ObKwzJEk0GD8pZtsY3njBKqmC3MnhqFhw>
 <xmx:xhZ0XzOeAJMkMoCHFCP8IzAwQaNgzXY5HHPVaIXLPkz7BFYQreR-vQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DBA7AE011E; Wed, 30 Sep 2020 01:25:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <4801ff6f-22f4-439e-9a84-7d8035ce460b@www.fastmail.com>
In-Reply-To: <BYAPR14MB2342ACDCCED409D23AC7A689CF3A0@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB234222A907DAA5A640E1DABACF3D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <a06ec8b9-0b1b-8817-d33c-6256289df9e1@linux.vnet.ibm.com>
 <BYAPR14MB2342ACDCCED409D23AC7A689CF3A0@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Wed, 30 Sep 2020 14:55:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kun Zhao" <zkxz@hotmail.com>, "Tom Joseph" <tomjose@linux.vnet.ibm.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Security Advisory - CVE-2019-6260
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

On Tue, 22 Sep 2020, at 01:39, Kun Zhao wrote:
>  
> Thank you so much, Tom.

FWIW I've pushed a little utility for people to test their systems for
CVE-2019-6260:

https://github.com/amboar/cve-2019-6260/

Andrew
