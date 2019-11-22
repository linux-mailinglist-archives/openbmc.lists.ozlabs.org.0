Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1E105DD2
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 01:50:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JyWd092HzDrB4
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 11:50:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Aj4seljE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dAmMLynE"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JyVz3GHNzDr84
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 11:49:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B1ACB22E6A;
 Thu, 21 Nov 2019 19:49:28 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 21 Nov 2019 19:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=b3fcO
 /kVYCevJrAabc5AHQungPxOKwiAgfomEYEEEAA=; b=Aj4seljEHo6APhxOIexiS
 EXLpVZ+R1Ilysupix0DN5MD/B4qNUPfMDdGIjmnSJ/tZc6UXiQPV4yeN/hvneRNZ
 0DfgkAXEePgIkc4QxYXUsFELKCLWiKkmYIS7kiQ1zGplv2VLcPlM4SrQITa3amtS
 Bck9gE5zzHMLnEpSMAUV0E2pnK3uwjrofehSnazsUO1SN2l0Ln2aab4pXn8qXLQs
 ygEcVwBNV+aipicdEUWlVLF4oH1YAEzbNLPMcI+xld4K5mDMpclUsf7lvG7JsQuz
 rWdtkZCukNTmYHqFm9Ls7ky1lrjnvxr8FCcm9P6nIGJoQtkLvj5Y5En7lRyKBBiR
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=b3fcO/kVYCevJrAabc5AHQungPxOKwiAgfomEYEEE
 AA=; b=dAmMLynEFtt5cxYPbx2oRaCGR5rZPoTwa4l9BpJSyEjoHEUjT3JASQCTM
 LAn9jbnHZQXV4wpkAkY0s047YJmZCYesn2vCuunbkxv/n3VtAumg6e3GUyX5bkel
 F5buRUTJyXpkLjaBPYx0oT6PIdbD0kXsTdvTROcBZ3Gm99dXEkz84eZkHupY+a5v
 hU7u8JHqKewnQHTcEfDjbsVRzZXQbWE7t86fwzNwDKtxGsqExgxdF+k9JuBXbxKZ
 uHsr3LLzMfhm5LTAAZMYyFI9mwCao+eV0oPFyWv/gd7dGZys7jVD1cXM5tHdKjyg
 z9atYMmUZgVkfGB8EzG0m/GucZGKw==
X-ME-Sender: <xms:lzDXXee36OGqwIHYncommUNV0eHiUYN1vEtXgChmn9WjdqJPikFh8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehfedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:lzDXXcfMaMGdYzW7fMMxBXV01aMXMJ_gOKJMKlYnqV9PTLIQvXIojA>
 <xmx:lzDXXajnuJxrbJZYyj3Y3lOIt2HAVHmL8WtdxuVfPgocsOK6jBw_Hg>
 <xmx:lzDXXQScuigu7THnHySc9GsgltvwMnEonWNCyI1KkJ22dS6xx01wlw>
 <xmx:mDDXXZpLQJi5m1MYD2qRSZF-rQxbcRfNvUhxe-eASavNKOT_7PAbfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 990D4E00A3; Thu, 21 Nov 2019 19:49:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <e5994432-fcec-4994-a8bc-2ec46c103600@www.fastmail.com>
In-Reply-To: <9f3eaecd-6fec-8af8-21f6-8292c422593c@mail.ru>
References: <2edbb697-aa07-2610-3bf2-cbd7707c6259@mail.ru>
 <2fa9a025-abf9-45f9-88bc-eddcc2726c89@www.fastmail.com>
 <9f3eaecd-6fec-8af8-21f6-8292c422593c@mail.ru>
Date: Fri, 22 Nov 2019 11:20:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9?= <9165394577@mail.ru>
Subject: Re: NCSI eth0 (ftgmac100): transmit queue 0 timed out error
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Evgeniy,

Please make sure to Reply-All or Cc openbmc@lists.ozlabs.org on your
OpenBMC queries, that way others can learn from the discussion as well.

On Fri, 15 Nov 2019, at 18:53, =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9=
 wrote:
> =20
> Hello Andrew,
>=20
> It seems that I sent you not quite what you asked. Therefore, I send i=
n=20
> the attachment the final
>=20
> my_neptune_from_dtb.dts
>=20
> file made from the dtb file with the dtc utility, as well as the dtb i=
tself.
>=20
> Maybe you will find pin conflicts in it. Thanks for the help anyway.

Had a quick look but it would be better if you could send me the actual
source rather than the DTS decompiled from a DTB. Do you have access
to it?

Regardless, can you please build and boot a kernel with
CONFIG_DEBUG_PINCTRL=3Dy and send me the full dmesg output of the
booted system that shows your symptom?

Cheers,

Andrew
