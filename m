Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7328CAEC
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 11:23:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9VT76rQ5zDqjn
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 20:23:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=pKxZYDY7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kKwDGLJz; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9VSG3ZX9zDqfN
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 20:22:22 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 22D905C00EF;
 Tue, 13 Oct 2020 05:22:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 13 Oct 2020 05:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=HWdJF
 01ZvdSLGw7KK/xr+xiaDHYrr9muavOeZuUKgqA=; b=pKxZYDY7Gk+TJ1vhXMoP6
 3C0dRYcR1kDaFl6ycmV31bupGF3LTAVuL1XtCWCe28Pq8QWKRqXm0EQxhLWI5fXg
 J8WzxylSbcK1mxoo1va3ZZyExEbMGtj4umDvRiYtvBXp5mIYggfPha871l+VfQbS
 Fc1u+CfAAWwallmaLDD9EUS/rUpjvCepLYFNSOJ3tlCzCFOBl7Npx3pzCR17bpUS
 +5h7yj3IsVP6O7HcvdaMJ3dQAZIrBjcxL4iZGYIqKKajDRZ4Sr/Omxs+2FKQ+c2e
 vPsmaHOK31tgTqkk8BADDvvUp7SNVaGmOH9VmvoY1LxDK3donNajKRV5ZIcZAjo4
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=HWdJF01ZvdSLGw7KK/xr+xiaDHYrr9muavOeZuUKg
 qA=; b=kKwDGLJzSq/y1L4ux/z9lstonJIbCN8VaOUFzCL4e7j6eBM2ld6aDzYMH
 QiJyn5yIIjxDMh0qtbbuoaswXcd1BiD8zuhAYrLWiqUm3lJfQNoWgPekfCtCOA6G
 1mRJzTHvFz53H/+D/ql36fEUlLfNywuImecH4R9NPZTEVCBhX3Sk1Tz0Wr+EXY2f
 ZODRVQWaEso1r6CbMkbomW3Luk8sxReAzqxmfUVmyf9GMmDR/p8pJOIrmAqmKIj+
 vQB6y0bY7482JkGLkSLijw01ye6Fc1mIG8bvAv1djB9nhN2Fhzrtf0UxeXB+/fsR
 bSAbJwZrpUTszzDNVJBtc59U4cgrQ==
X-ME-Sender: <xms:yXGFXybHw9TLQbkmPpntMu2ycNI35h3g6qKFALNkcppobMDTHrjA4w>
 <xme:yXGFX1YLRk-d8WTqiQJv2FKqH-45TU5q3JYcltkxTxl2cNiC3oi3CWSQmObBOAwaT
 Ue3ZkHkbBtyhN05Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheelgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvgeekheegfedvhfethefhud
 etteegueeggfeiieegueehkedugedtkefglefgheenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:yXGFX89vqq1-z1D0-ny2WZYo9V6Rm8WX0OAU0EbutwzudJu7pqIp_w>
 <xmx:yXGFX0oBvetUJlKU5jMUbrM0nRRUEILqKvY4zG2iYJq3YbBUTowHtA>
 <xmx:yXGFX9rMHcfixaJ_OodkZvCiJVgHEVeFBYIz-9pPlsu1_hDjZ0prEg>
 <xmx:ynGFX8QXoiAD0_YgK2VB8gyQ3I-V4VZGnI8lkXaDrdkcG8pVl7tr6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D1A06E00A2; Tue, 13 Oct 2020 05:22:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <581621fd-2e12-40fe-9a79-1d1575c7920b@www.fastmail.com>
In-Reply-To: <HK0PR04MB28839DFD113446F4DE202799FE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
References: <HK0PR04MB28839DFD113446F4DE202799FE040@HK0PR04MB2883.apcprd04.prod.outlook.com>
Date: Tue, 13 Oct 2020 19:51:56 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_The_latest_code_of_openbmc-master_failed_to_compile,
 _pleas?= =?UTF-8?Q?e_take_a_look,_thank_you.?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 13 Oct 2020, at 19:05, =E5=91=A8 =E8=BF=9C=E6=B8=85 wrote:

...

>=20
> the error as follow:
> zma: Memory allocation failederror: liblzma: Memory allocation=20
> failederror: liblzma: Memory allocation failederror: liblzma: Memory=20=

> allocation failederror: liblzma: Memory allocation failederror:=20
> liblzma: Memory allocation failederror: liblzma: Memory allocation=20
> failederror: liblzma: Memory allocation failederror: liblzma: Memory=20=

> allocation failedWrote:=20

...

> /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/includ=
e/sdbusplus/asio/connection.hpp:28,
>                  from ../git/include/dbus_singleton.hpp:2,
>                  from ../git/include/sessions.hpp:12,
>                  from ../git/http/http_request.h:5,
>                  from ../git/http/app.h:3,
>                  from ../git/src/webserver_main.cpp:1:
> /home/zyq/master-openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/bmcweb/1.0+gitAUTOINC+e436008377-r0/recipe-sysroot/usr/includ=
e/boost/detail/scoped_enum_emulation.hpp:17:1: note: '#pragma message: T=
his header is deprecated. Use <boost/core/scoped_enum.hpp> instead.'
>    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> virtual memory exhausted: Cannot allocate memory

Looks like you need more RAM for your build machine.

Andrew
