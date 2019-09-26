Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87605BF4E4
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fH7W6KXfzDql5
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:17:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o7qbHnc2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WKvFzw18"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGl62yCqzDqY0
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:59:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 619976D9;
 Thu, 26 Sep 2019 09:59:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=xdk7w
 GNyZjlCGfMfC18Kr8a3hd9Ec95NFu290tkiNEM=; b=o7qbHnc2uoAE9lxJmyyYu
 WviqYWGuLxFAVEt6aBqRoC7xjXCcg7lk3GPEESXzwTZWfTvix6VEsdpP35cy6lX6
 PVT3beElLuoqQwdGL7tr46vs75aDjasE7tbTt1p5/pdnoEy6Zj4khxOgsMEKDiRs
 738Pf3jKmqkeA4cqsxsd7eSpOUcb7mgiWXlGOkBSytGq++mHTcxeCoAbj9Vj8gR9
 +XMaMWef0f8FtzjgkG7SlZqzBW4rK2Vt/H8XYWtZ0alckDEPpnbUFLZIIDTRsjvf
 yfR3HMx9l6i9hNdSyl+KZKPzD6b3rTnFB4fDbnxTTstL8Qg2M13oIuhhElj0KBoo
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=xdk7wGNyZjlCGfMfC18Kr8a3hd9Ec95NFu290tkiN
 EM=; b=WKvFzw189viJVbNVAVy2lnAD8aWRnw5LarIrrM3GiZvxqrxNoDFdRPTRQ
 8fFxO/1CdMNzt7rGlmEySk6XqhISiYwugCR3loSOJU3YgsYiQpkhVEBDuqcSTFmR
 nRBXzqxGJOjrucWPnPcl1+S0gcJYW61WrBLq4NrYZtnalVBUHCT1rW9e4AkmR/wd
 0gtgvhC1GranbPu126aupGLDxvb2V9cCIfQJZvjTevty0T7YL0ApO9jPol2mZksW
 RU3XcAP4JlD8vexlyFReoyoUlTDZNwi51Mk9eHXPVGooB2Io7JnfaM/Y4YaGNFHw
 l/vuUzUPCG4UzFSMPJ9dysuE1KXag==
X-ME-Sender: <xms:Q8SMXYPyys3J-0HBu_Q1QYODNAgTpeaZkSAJKWrSuewTe4O699nmig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucffohhmrghinhepuddvjedrtddrtddrudenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Q8SMXcqsepuc2H7mt8dFh3Eo9d0ANalLFmWcJ9laLXf5MY4Haoi0Nw>
 <xmx:Q8SMXZukDKFy4MwlomdlTgQFO8E64c8TvsAzr7K6cao5x2mu-TiVNw>
 <xmx:Q8SMXY558yAu2nXvaPBgiRK1VG4o81SmB7nB7Sc3phQgtbkrHoPQ2A>
 <xmx:RMSMXXRrAgbrJVHCdO8uGCVJJRp0rt51Z_XnCaAmJbk6lepVmf4BHw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0D7BAE00A5; Thu, 26 Sep 2019 09:59:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <1ba3bebe-1a93-4848-a2ed-979e31c7b708@www.fastmail.com>
In-Reply-To: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
References: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
Date: Thu, 26 Sep 2019 23:30:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_how_can_i_use_ipmitool_to_interact_with_openbmc_which_boot?=
 =?UTF-8?Q?_from_qemu-system-arm?=
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



On Thu, 26 Sep 2019, at 22:24, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Greetings:
> i have build a openbmc image, and boot with qemu:
>=20
> #qemu-system-arm -m 256 -M palmetto-bmc -nographic -drive=20
> file=3D/home/openbmc/openbmc/build/tmp/deploy/images/palmetto/obmc-pho=
sphor-image-palmetto-20190926123057.static.mtd,format=3Draw,if=3Dmtd -ne=
t nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-=
:443,hostname=3Dqemu
>=20
> and when i run the following command in my ubuntu18.04:
>=20
> #curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST=20=

> https://127.0.0.1:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] =
}"
>=20
> it works well, but when i try to use impitool:
>=20
> #ipmitool -H 127.0.0.1 -I lanplus -U root -P 0penBmc power status
>=20
> i got "Error: unable to establish IPMI v2 / RMCP+ session". how can i =
do?

You need to add another 'hostfwd' to the commandline to expose the
RCMP+ port. At the moment you're only exposing SSH (22) and HTTPS (443)

Andrew
