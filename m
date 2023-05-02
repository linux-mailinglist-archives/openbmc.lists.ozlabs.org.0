Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514A6F3F0F
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 10:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9Y2V6Mclz3cLF
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 18:21:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=G/ReWH/C;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y/xWbzku;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=G/ReWH/C;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y/xWbzku;
	dkim-atps=neutral
X-Greylist: delayed 325 seconds by postgrey-1.36 at boromir; Tue, 02 May 2023 18:20:57 AEST
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Y1j400Bz3bmH;
	Tue,  2 May 2023 18:20:57 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0A58D5803C3;
	Tue,  2 May 2023 04:15:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 02 May 2023 04:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
	ouqZ3mAY=; b=G/ReWH/CR4stPP8pBvKE2oH2tiIxeT1Y9djsugPvcan1vwLCNKB
	+CmHc2S3racpCMakxZ1qQRdhDmpzbTSxPsJLCIAsBgFwKTe+QJwmoUIe5cxfT6Wy
	tgZI7GBK40sokCJo7woyfvbYgCDiIcu9MJqEUid0mCHXVNlzPDjNZzJJBtLrLhF9
	X/mbJHalC7bJ1Xs6/CKvhniyT1ORP+ioH4B0Q9MMwa1hEm8wfe270mide7U5ucC4
	jYc1KiyRZtz0ezseY2LvXW4OKb5R6V9gMew5kODf8MnejtSKgLd/xIANaAqpsh7o
	O3SUD5day0+7MZzwDONO0PUZT+hvXwYxYyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
	ouqZ3mAY=; b=Y/xWbzku7vrNHNzte8uy72nMxc+pbAIi4IeA/XfvwUvtiZV9Est
	bPyNKEthPJpnwnx5/Y68ss9jDEmHmeNI9uaomvywj4LEhNdN2/6OUB0Ap6qjjHvb
	OQIPRGrLOJBmcaLg/XgkHAzTOPE5Xwu/E3de9zryJ4QMstqpCG+bbbWHvXXdfXgL
	L+W8t5CYwFrU7f8XrnzjjIYPTrCSQ2/hUzXAWg8+DhkBUcIkmt6eVQO+8Sms9yZ1
	Z+nDtml+a4kCprv84LWaOxgu+YrgM2G6hBbX6r3CD52Qvxv2Jvyac8zhWROAt9xl
	Ftb8duEVIIhaiX5H6fsUSxaLGjuOvtdmUyw==
X-ME-Sender: <xms:nsZQZGG99LYs7t6dhgAngkbsv9osgUeFMS5nCv0_eqkMW790xp5pVg>
    <xme:nsZQZHXku8NWvKl4XxdR48yR-0RVaLsU5fwZmJq18kazWD7vv8gAEIoPKVDAKkTuy
    5prPVni2U8mfnd5sN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfgjeev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nsZQZAK8fS_X5YYcPQ8tmCY5TK5FJ7gjlJsS0RCSCVoEK-Zwdrq3Yw>
    <xmx:nsZQZAFFLoJhNSVEvLGVyQfmt0zeZphfcdHG8-tw9pYY47GFwhKrNA>
    <xmx:nsZQZMUL4rbP96pvZI76ZCUHun2qRq8vNtMGMdc-nT5M5xb0isYJ2g>
    <xmx:n8ZQZPq1o7msWppgt2EUHhnFGcmwGcb09Ud671-g5_97NEtVzT49Eg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1C690B60086; Tue,  2 May 2023 04:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
In-Reply-To:  <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Date: Tue, 02 May 2023 10:15:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linu=
x-m68k.org> wrote:
>
>> Does your script also cater for .dts files not matching any pattern,
>> but including a .dtsi file that does match a pattern?
>
> I assume I built everything after moving, but maybe not...
>
> That's all just "details". First, we need agreement on a) moving
> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> been stuck on a) for being 'too much churn'.

Sorry for missing most of the discussion last week. The script sounds
fine to me, the only reason I didn't want to do this in the past is that
we had the plan to move platforms out of the kernel tree to an external
repository and I wanted to do this platform at a time and also only move
each one once. I don't think that is going to happen anytime soon now,
so let's just do your script.

Can you send me the script and/or a pull request of the resulting
tree based on my soc/dt branch? Everything is merged upstream,
and I think git-merge would handle the remaining merges with any
other changes in mainline.

        Arnd
