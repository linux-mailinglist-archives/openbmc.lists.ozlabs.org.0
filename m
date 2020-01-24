Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A779B14754C
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 01:13:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483fkl03WSzDqZW
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 11:13:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=TfR9OSyr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EU20TE5w; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483fjL12hvzDqZW
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 11:12:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B2A805AF;
 Thu, 23 Jan 2020 19:12:35 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 23 Jan 2020 19:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=2jJLa8Eee3gPLPYF+DY9ds09gY85gBI
 T+je/5ZbB/sY=; b=TfR9OSyrrNbjN69ZJ5h9oHl3ZoLq3dL4fje3cDeTPYRcAUE
 6Fa3xag6Slc771cJoml1FScnXXuCx2BnaPPCNh+vT10QaBE8V52gyfA2QUnH5aZz
 hGQluIOZJBK0PcooipJL9tnNCaojwKIuoATDiQl61hPKPEC2eHC/JlYbVwXs0x+o
 2NU6rj91Yjm2cwAYexNkqzKecHEFhtFG92d2iakniEnjNMrbJWaWEg4SKDIDYWk9
 Y+XjQ0uSadvlj8Fb1uz5tD1gtUdtsbqWkkiEzPbLsM1N0ZD2etDLUPz474XL/Ffo
 ApxpzDKgBrX8nseyPF/0SlAhhgCnIba9VASD0+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2jJLa8
 Eee3gPLPYF+DY9ds09gY85gBIT+je/5ZbB/sY=; b=EU20TE5wTtPLiFEbB1WXrI
 N6wai2iLSyToB0zwWc1xEuzFO67FWcUvSsJocZvCuQgnf0tjVVVQmW4YHH0sr0ix
 Ng9P44LbawhXeA2/bgTGy5FHh5db45VRxANSPSbmhJi9n7vSAN94sojCZdKTWHvw
 1JAc6zQLLrVlaHVoxRNrr8x+EnQbyQU26otX5QUUasJP+BGgaa+aj22d57FyHZZ5
 aeH+B5T4M/C+8iG+8VqrZMgGNJEJ9GA3G1PwcKgi+iGOWix+i3Y85mshetbKUBMl
 CE+Iar1tu3voTBnOXuoMx9x9chjh+/qCwQVtL6ULoZbSyE4e+vxnPwRui5ACsCmg
 ==
X-ME-Sender: <xms:czYqXjzIq3FPt5UqKdBrjyo3yFfv3-WyhuisQ0OIm52PsbErrjnhrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:czYqXnSzTIg2NbckCJZH-PDIMToIEPs6fqpOTn9X0fBVQcvJ_1PdaA>
 <xmx:czYqXv9jhhk89ssfJJOClbnnSOym94hp_z7OT6BKdocGj5QOqmQKCA>
 <xmx:czYqXrt1ZR7eWFcyLO9fsPuEuA2WRWLOBZcr0X2BTTK5OIIiljCAvg>
 <xmx:czYqXqrpdcpVDQmVOVHkRxxSWJhgz6NxsPKvtMD4lUMu0OcjIB1iUA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 32B51E00AF; Thu, 23 Jan 2020 19:12:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-777-gdb93371-fmstable-20200123v1
Mime-Version: 1.0
Message-Id: <68fd7924-ecfb-43d7-be10-a96220f3a0d3@www.fastmail.com>
In-Reply-To: <20200123074956.21482-4-rentao.bupt@gmail.com>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-4-rentao.bupt@gmail.com>
Date: Fri, 24 Jan 2020 10:42:15 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 "Tao Ren" <taoren@fb.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_v2_3/3]_ARM:_dts:_aspeed-g6:_add_usb_?=
 =?UTF-8?Q?functions?=
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



On Thu, 23 Jan 2020, at 18:19, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add USB components and according pin groups in aspeed-g6 dtsi.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
