Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E1C1A13
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 04:06:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hQkY6SB2zDqNW
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 12:06:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SI7sutPc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RjzV6O3Q"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hQjv6jFMzDqN9
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 12:06:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BDE383DC;
 Sun, 29 Sep 2019 22:06:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 29 Sep 2019 22:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=d8pIO
 +fOCq7Fu0Wfdlu+L68sQtaeCjMMjL8uuF0FdKQ=; b=SI7sutPcWrC8qYKlXGCJx
 TTikUUs5jbozpFwWcjGTS2083ULRveFV7w3uKdkQglA5DW1BaODJJ/X+eluqRKqr
 OVyI+cK7ptRWlNt8X4Ias4J49xzw8dCzWdaHjIA/gXdMxewR3LK/WdmgMAHb4AoD
 +S1P+ZfjTCUwTmkbbyMwHuO+CmC5CR/r+fQDEXMU4UyPwMHv6QlLC1DwEQ83zwGI
 w4EYx57fKV9BYLWNRiBxDIt3XjA1xs/axOYbc8yurCxYpOmMAGD0vd3EBcycfCF5
 VCAmF44+Pe12Ow5yIbpOk6wXQ3G8Vv/f53Zd5HOT1ECBbMpFrilhLVzf57mk0Qkx
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=d8pIO+fOCq7Fu0Wfdlu+L68sQtaeCjMMjL8uuF0Fd
 KQ=; b=RjzV6O3QHWCZ0UEY2YNSA/LjAB7Hrx8sTKLlz2u0l8+j9p3yyjkCHRx9b
 7YVL+gREiBDDY0aFy8gBDXDO/U5Nr+mtgxCySmtQrQm/vpHQ4cqGlcNLSARnYvkP
 BYaarqi4nXtBa7OCegug/nMiutJ2TW8Owqy/H+2XwynjPWJgBOTi5u+qUBcAcqCf
 lSO8AU775z1291QHtpERvbdVRFnpGLX0r2O1isgT0B1tK+c8XSNTgSWrzirq7K7A
 ZtTqJELhjeU6q7RVbcEFLaO9bg4U+++0Hq9ATHt9wQmcGdFVwiwNpObfrLS+xJoa
 IaigeFc1xTQrJOxoXJqpnXI6x09/Q==
X-ME-Sender: <xms:DmORXYeY84YCxrawYOhjIf5D1C69i78M5FEyarbr7GOlqvlD5VGy3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgedugdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DmORXQvbomQThd66nan06-SdJQXjPG2W-nRsJgtQ2M1ZMteJEZveRw>
 <xmx:DmORXXgwMTsrFUUhiAT1gXcUGRykHccMq3JpNzVate5YOSuBgYveCA>
 <xmx:DmORXQu_xzF-ulIHybSN7TiY83irx7uRYuPDjUb8-OFqtg2PGLk5vQ>
 <xmx:D2ORXQkg5EIsWOb0O45hDszI65zaqELY6naE97SCqwp4RppK_xc0_g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D7675E00A5; Sun, 29 Sep 2019 22:06:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <e3883ab8-7318-4033-ad4c-94018bb0dac0@www.fastmail.com>
In-Reply-To: <tencent_AEA99F5038687CB8AB0765B1F867C9EB4C0A@qq.com>
References: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
 <1ba3bebe-1a93-4848-a2ed-979e31c7b708@www.fastmail.com>
 <tencent_34EA53595EFE6AF25F53F427650E7D1F1708@qq.com>
 <tencent_AEA99F5038687CB8AB0765B1F867C9EB4C0A@qq.com>
Date: Mon, 30 Sep 2019 11:36:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_=E5=9B=9E=E5=A4=8D=EF=BC=9A_how_can_i_use_ipmitool_to_inte?=
 =?UTF-8?Q?ract_with_openbmc_which_boot_from_qemu-system-arm?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Liu,

On Sun, 29 Sep 2019, at 17:04, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Dear Mr. Andrew and openbmc:
>=20
> Thanks a lot for your helping.
> because ipmitool use udp, so my previous changes for qemu cmdline are=20=

> not right. i change it as follows:
>=20
> #qemu-system-arm -m 256 -M palmetto-bmc -nographic -drive=20
> file=3D/home/openbmc/openbmc/build/tmp/deploy/images/palmetto/obmc-pho=
sphor-image-palmetto-20190926123057.static.mtd,format=3Draw,if=3Dmtd -ne=
t nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-=
:443,hostfwd=3Dudp:127.0.0.1:2623-:623,hostname=3Dqemu
>=20
> change "hostfwd=3D:127.0.0.1:2623-:623" to "hostfwd=3Dudp:127.0.0.1:26=
23-:623".
>=20
> and i run:
> #ipmitool -H 127.0.0.1 -I lanplus -p 2623 -U root -P 0penBmc power sta=
tus
> and i got:
> Chassis Power is off
>=20
> it seems ipmitool works well together with qemu^_^.

Awesome! Also, thanks for following up your questions with the solution,=

that's a great help to others who might try to do the same thing.

Andrew
