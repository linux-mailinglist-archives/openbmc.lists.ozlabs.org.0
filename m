Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECD126FAB
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 22:21:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f4Yq1QH8zDqXg
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 08:21:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="L7CvVTfP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uuxazcp/"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f4Y44q9VzDq9R
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 08:20:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 14E86802;
 Thu, 19 Dec 2019 16:20:38 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 19 Dec 2019 16:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=WN52k
 buuSK1XuTIsoiLw6OYH0fkCSrV1bCFTPm7BwV8=; b=L7CvVTfPJEjbFGLgWBg4g
 YTey3VS6jVWLpqJh9XgySEKgbmaoaVyB7O+3NsDo3WjrATkHDMdxMjaS08eXWEdm
 XcFhB6TwCVrQtAxaerIZsF+LQqGjJNzikKqzkiTxLJsXoqWuSKQcaszZ1V0WWvap
 R64JsPbVaHINr+Z2eRVyLW4cXGVMAmKkeTNBRQS/1BOINlW5U1hgwGmZL17VG0BO
 YDd974SUebTsE/oAjQ7Qa7FOskfUfCeo8l3qkkeyptL8nM+0kMp4hEAn5cIZD0H0
 /H+OeSVmdXxkhWARp9opTPSoLrGEer94YvITFmLH1YQsI/9DfioYG4NqvhnIEXeK
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=WN52kbuuSK1XuTIsoiLw6OYH0fkCSrV1bCFTPm7Bw
 V8=; b=uuxazcp/d5UVS8JMB5pPaPW+WrWN/J0vi1KnUI5fNrd5y7+xyp7LqBeT9
 xceF4RpiMBlkc1Px3gByX+6VXNYsxvxRh9U8t7xe+bXjoO0S7DYRlUJwzsM7CbR5
 kKl83o2Nk3fPXedOBvvdBbd//jNxm3l0DSHQWf9Ahl3IJnkMwVxk7/HQH+9aaDel
 oN0UiajYqVp/bujRadKBg8KCDmpfQkU8IgMlZW/NP7I3DOhqltHFXkeGgRVs8oYE
 /c3t9urf7Abl7ccT5o/XY8HJhYU1XQLDC5kGmWEd4jd69BmiXHnas243q7le/Ikw
 Kx/OXXPcp7zDN2F2iPccnjilkCuEQ==
X-ME-Sender: <xms:pOn7Xf_oZULlUh4a2aGv7BXjewYASePPCq6ZP6OVYUi8PmpV5VWxuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
 htqhertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgu
 rhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:pOn7XWZbZwIeI4K4asxtl3giboz92n3y1ZmSKMbRM8xzImwoAyKPqg>
 <xmx:pOn7XZfvpwW8QDxjyonnkLSDgx5jw5eBRpi3-OwWt8B3GlfoHAuuIg>
 <xmx:pOn7XReAx8TTWMG6-eTcPp2mjaSjuuOxZ9-M0RhjovRkzB7Ff7uorg>
 <xmx:pen7XQHmOszMgWh3jkJbgpk86WGFBuiTuxkOa9Mje_M4RCx8QFaiaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DDEA3E00A1; Thu, 19 Dec 2019 16:20:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <01a6577d-fcf9-486c-8993-f452698054e0@www.fastmail.com>
In-Reply-To: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
References: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
Date: Fri, 20 Dec 2019 07:52:19 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: =?UTF-8?Q?Re:_how_the_openbmc_running_in_qemu_communicate_with_the_opera?=
 =?UTF-8?Q?ting_system_running_in_another_qemu_via_KCS/BT=3F?=
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



On Thu, 19 Dec 2019, at 18:55, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Greetings!
>=20
> I am a learner of openbmc, for some reason I do not have a real BMC no=
r=20
> a real server, I run openbmc in qemu. Recentlly I want to learn how BM=
C=20
> communicate with HOST System. But it seems qemu can not emulate this=20=

> scenario.=20
> Can someone help tell me:
> Is there a mechanism allow me to run openbmc in qemu1 and at the same=20=

> time run OS in qemu2. And let qemu1 run as the qemu2's BMC hardware an=
d=20
> communicate via KCS or BT interface? Like the following sequence:
> [qemu1 [openbmc [bt-bmc]]]<------LPC-------->|-----system=20
> IPC-----|<------LPC-------->[[[ipmi_si] host] qemu2]
> And what can I do?
> I have seen there is some code in qemu source code:
> qemu/hw/ipmi/*
> and in linux-5.3 source code:
> drivers/char/ipmi/*
> Dose this can help mitigate my problem?
>=20

Liu Hongwei: C=C3=A9dric has done this for Power hosts in the past, I've=
 added him
on To:, hopefully give you some pointers.

(C=C3=A9dric maintains our ASPEED QEMU models as well as the Power QEMU
models).

Andrew
