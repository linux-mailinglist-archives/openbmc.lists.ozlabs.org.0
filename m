Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECF1AFA31
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 14:53:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494qWr5ZmLzDqd7
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 22:53:44 +1000 (AEST)
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
 header.s=fm2 header.b=EaavHSQx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZfVBGbWE; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494qVX01RGzDqC6
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 22:52:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E5C94700;
 Sun, 19 Apr 2020 08:52:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 19 Apr 2020 08:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=AQgfU
 vs2S7G94wptkAlwV79JMcYZhKRkhg4PZJHpalU=; b=EaavHSQxvhWLkBNW2eXDt
 1XI9VqNqRapCxx8N/NO2N7xaLLRJN+Kjir0J5mpETuarfK5rqCT3h/obs7UA4/HK
 GFk3Dyk2ksej1wLCQZe1FKQMaUlWmYh9kzROOWt8loOMh8WCPmMtopyiZYsJydF+
 XCLRNcp3J+O1qcO54QKS20t0HmGzPUVMwla6/s4s4MjMK5MW31aWAVEptx3LA7UU
 tuUbd73d94RufX86Kp92H3EOW7CxU9g0h3qDelkEyKZchm8Cd+RUPziQYMKknVHy
 2uqfkbU+NMw/P8PDPKut8VQ0nJrnGUIXLZcEH/4Q33aoJFGhXbKvf8UqeDy996Ds
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=AQgfUvs2S7G94wptkAlwV79JMcYZhKRkhg4PZJHpa
 lU=; b=ZfVBGbWEUtFfGIlUFmzL01fLkM8Qj6c01gJT9iksIzeJ1AphP+QDpbXqq
 HnfpoAg5BlS3LkoO/FQo0OvX8hS0WtyckJHywJbOv8NRl/cneL3+krZHFGPmT1nP
 laZd9HPgDqeKDJKE5V7jqs/OYOu9GYeK5I+bve7nOxB2MykijQdwfXDBwaB/6gPA
 D9G6XzVJNEpRdbz/Tyx8MbLETPPYxYeK5qAFLKCKg8tQWfMXXB4wsycHWFHrW2jO
 whMaTeaokzr899Dl5yoSc4ezyGHPUr2L6otu2u9sYu9l5uUuSnPymq4GVN1kaG9g
 KmYEwP3ceoFMjgiREpC/vrvSkJ4Dg==
X-ME-Sender: <xms:jkmcXtYvkoVGiUgdyDGIKMUDssaJTkal927HxxnUHV6cRcf5rAdNBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgedugdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jkmcXswq3uhoQI5HGxlYmzZBboXf_ULeFzAvTCIGv7_cnBfMK8Ov1Q>
 <xmx:jkmcXqPGUr6-E1jfA7EOnsFvXs00QCkTToBAz7FZvghgsNVdjTkS5w>
 <xmx:jkmcXgMP2PdrxJalUgE36u3QXgu-LwYecU5gqOKTHXfgoEGbd0-3rg>
 <xmx:jkmcXp2fCrmA-defTyCjvcRo6EeYOKb50zwekhLkA-Rwr2AobhZi4w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1130EE00B0; Sun, 19 Apr 2020 08:52:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <fd147288-3521-4667-abec-ae330dd328a2@www.fastmail.com>
In-Reply-To: <HK2PR04MB3826B414E7D2F68C81359C25FED70@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A2AAD55E77655BDFB558FED60@HK2PR04MB3826.apcprd04.prod.outlook.com>
 <1fbb893d-6a13-4d33-b11e-407f5283368e@www.fastmail.com>
 <HK2PR04MB3826B414E7D2F68C81359C25FED70@HK2PR04MB3826.apcprd04.prod.outlook.com>
Date: Sun, 19 Apr 2020 22:22:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: About RGMII mode setting of MAC0
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
Cc: "uperic@163.com" <uperic@163.com>,
 "shinerocky@yahoo.com" <shinerocky@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sun, 19 Apr 2020, at 22:11, zhouyuanqing8@outlook.com wrote:
>  Hi Andrew,=20
>=20
>  Thank you very much for your guidance=EF=BC=81
>=20
>  I have modified the  ${MACHINE}.conf file and recompiled u-boot,I wil=
l=20
> debug it on the board tomorrow.
>=20
>  According to your guidance, I found the correspondence between the=20=

> recipes specified in the  ${MACHINE}.conf file and the pn-buildlist.
>=20
>  In the compilation directory of obmc-op-control-power=EF=BC=8Cas foll=
ows=EF=BC=9A
>=20
> =20
> [work/arm1176jzs-openbmc-linux-gnueabi/obmc-op-control-power/1.0+gitAU=
TOINC+1146f8c6e5-r1/image/usr/sbin]$ ls=20
>  pgood_wait power_control.exe
>=20
>  The .exe file should be the executable file of windows, how can it=20=

> appear in the linux system?

So the rumour is one of the original OpenBMC devs was a bit lazy and
wanted an easy way to copy binaries onto the BMC. By tacking a '.exe'
suffix onto the executables he could run:

scp *.exe root@bmc:/usr/bin/

The binary itself is still an ARM ELF and not a PE/COFF. There's no harm=

aside from looking bizarre. Having said that someone should fix it,
because everyone asks this question. Perhaps something to add to the
"gardening" tasks.

Andrew
