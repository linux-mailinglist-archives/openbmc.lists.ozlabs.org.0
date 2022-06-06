Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232253E533
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 16:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxSj3XjXz3bkh
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 00:58:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=Nn8HGEp1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Gsoe7zSz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=Nn8HGEp1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Gsoe7zSz;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxSD5sYHz2xrS
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 00:58:03 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D40005C0036;
	Mon,  6 Jun 2022 10:57:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 06 Jun 2022 10:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1654527479; x=1654613879; bh=4aaeeMYo/7
	ZPVpa+Hb8TYJLLf08FSzjVJEPbysms7Cg=; b=Nn8HGEp1JJYN5xy00FM/DbFVo3
	vKSn1XTW6VKS2kfgueJHnvRna+HXM7T3IeJdg0DhI5TE81bStxJmf2BR/8YOgZmU
	JNjwcN/cZsWDsOfXJuX61qK1bWmsK4gsAZOs8qKZMi0lM4sxqiaAGceZqtAfV6mb
	XScu5Jo9rNu1WygcIlV6w9A1NIuBbUsDz7yxR3Mw3VLu0C+8UupNghQ0M0zN3kv4
	EFX/7uvcqafftX5E/omB9Q0TeQieDBEE4r2W/EsxW4NsVed4Q5jExDWmyVw11VzV
	lXsvb3r5AKS/YUFKiUa9axf+kKyr1YtK169j11UbOdejqSHQU2BJlZgDc+Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654527479; x=
	1654613879; bh=4aaeeMYo/7ZPVpa+Hb8TYJLLf08FSzjVJEPbysms7Cg=; b=G
	soe7zSzGbcBb5X4Xv5Uz2FCe2BLJPI9G+JZ+5Zg0ADlwl90JFF7d82CZfA97ubmr
	W5GlbrsmggLHBjauGc3FfniISsvTetydzs36OrPsd03SVbKLPHrocHEeLIo/CUmG
	e8Y4s/L92SqOfd6NZLpYQxajr/awJ61TvmxGlZb04LvByDNw8MDfa5kiL3OtAF/5
	NWPuj3zoRTmyEX8TaVxhLfqt69TSBMI1jsAaTu6FApjKpvRqP2/Qt+zsFWoTJNXL
	6ZHCWctSGD5Y6UM4KnY47phZxzvYtKc4GuZV3ULxKW5+qQbFgzlwOmmlRxr8kuuD
	P2OSGyTte8PILEDgE1ArQ==
X-ME-Sender: <xms:9xWeYrimGetpukoFh_KUZI4qQLQXfyHky0uBBoSIiK1eKs2EW7UlTQ>
    <xme:9xWeYoBoS6-EWYY1QNe9B0uLW1FXWzj63qdv6g2k8W1x8Ih38Nktfj6qvqCJYCBlj
    FGxoSSI2mjPLQszh_o>
X-ME-Received: <xmr:9xWeYrHWXrC0wQLvigqcjunpajDgWg8Ju8M4S6TJSw_Td1D6hZP5WIo-PuSJ9ZegV3q0a-0sq4HOOxdy3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtgfgfggesth
    hqredttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsges
    fhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedvfffhtd
    duieejtddvffejtdefgffhkeehkeeljeetffegleekheegheegkeeuueenucffohhmrghi
    nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:9xWeYoTbU_s2-8gFn9sei51xvSBwSbL_kqTu4i-fm5JthxOAdUTYEg>
    <xmx:9xWeYozT4GtSijxUepxI_9iPXM3WlcwCzFc5NdvEYpjFWcgVfk-OFg>
    <xmx:9xWeYu52wNqRpo77dbwuQ-uCK_B4CeyhDijUXWsttSDPTHbbbbN-xw>
    <xmx:9xWeYua4c8JVcXMe4RecXo7XgqRIzv5z0q5K8Lrz5oB6snopnG__kg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 10:57:59 -0400 (EDT)
Message-ID: <67926d72c3633b9524370b8dfe89f4bfed3fac89.camel@fuzziesquirrel.com>
Subject: Re: Re: New repo request: kunlun-ipmi-oem
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?UTF-8?Q?=E6=88=90=E4=BF=AE=E6=B2=BB?= <xzcheng@kunluntech.com.cn>
Date: Mon, 06 Jun 2022 10:57:58 -0400
In-Reply-To: <ADcAWwCYIkAPjA1*LBfWfKqP.3.1654481771063.Hmail.xzcheng@kunluntech.com.cn>
References: 	<ADcAWwCYIkAPjA1*LBfWfKqP.3.1654481771063.Hmail.xzcheng@kunluntech.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
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

On Mon, 2022-06-06 at 10:16 +0800, =E6=88=90=E4=BF=AE=E6=B2=BB wrote:
>=20
> I have created an issue No.15:
> =C2=A0=C2=A0=C2=A0 https://github.com/openbmc/technical-oversight-forum/i=
ssues/15
> Is it ready=C2=A0 to create this repository ? or need I do anything else
> for this?

It is ready and you do not need to do anything.  I created it just now.
Please let me know if there are any questions.

Thanks!
Brad
