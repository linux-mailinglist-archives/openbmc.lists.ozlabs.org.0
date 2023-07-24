Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 280907600CC
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 22:58:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=EQKp9cqu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kffKNEgD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8sv20RPlz308W
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 06:58:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=EQKp9cqu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kffKNEgD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8stN0Q0Rz2yGD
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 06:57:31 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8210A5C00A5;
	Mon, 24 Jul 2023 16:57:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 24 Jul 2023 16:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1690232246; x=1690318646; bh=LW
	GoKQ+4X/zi/fwEyaeTE68i2SOOW1IchzJowRVPs0w=; b=EQKp9cqu1qpKOOTs9d
	VpFfUj4+phyi7OyaLlr8reP2sXC2kflivuEhRq2PlHWq/wF5S6z7vV7MXSkWbhfd
	GVM9McvmlTWuyhXwrJ25ZMDIn4mrNXF9SBb7ESzqvQ6A/A8Lie8UUr9R+ki/dZR/
	n2X0k8g7BJ8aBWZmUXRp36cmTlHN3sdbUWZyzG66TAZdb/Jn3bUtMzcRmau+PNaB
	d5FJtYEtxK8A0odlMEqWW1VK4yNPrH3sHYLNURgXIvURYzcI2+/ADaqhYO9fMxxB
	KWXbRccWFI42KgAForbrfDiYk/NKcA3b84Usq5qUOKpk0JWitRFKNJteYBvQ5ZGt
	u6hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1690232246; x=1690318646; bh=LWGoKQ+4X/zi/fwEyaeTE68i2SOOW1IchzJ
	owRVPs0w=; b=kffKNEgDFgwqxy8JGyFa+yVz/y+Ht9eajXKmDADCRpUUHsiTUCL
	CLT62OcupwFsmXKrGYNXnt7gOnCg7kDYY4Xh9xzGqexh37cE+kd8WNfbdoSDmyJz
	dxyxioygNv4Tl0fljD8fQYEzAQXX9V4CZ77M0mAdS6IskN/DVAt/qIe1TOHqlw3/
	ZiW/PWvuMWROI6iFA0TUA26rSOZx+csv+EG3/fNm89tV3a1Z0RLjAVg71ti47ALg
	eAmPLOk6MQZBrcRJQ4vn2KMbQ0qLC943dtcY/B8zH1NOPZ/GIIO2SaTqDZ4QF88S
	btETwo05X3tkwQuIhN1ZdH5lSOT8T84TT6Q==
X-ME-Sender: <xms:teW-ZApS0MVt9P22czwne83WLnaxFgvM60AWtBkaIMiJNTfJEqu73g>
    <xme:teW-ZGoGlvgNadRuGcOXu5_WUl_je84XWMozPlVFkxRS7w9OG6uZgbuETMeEkiznA
    RAvYlPis5pKHD9GBlQ>
X-ME-Received: <xmr:teW-ZFNPvG6Lu8xZtdWD8nRkwuNHtIlrIyapRzBiMBpzYWm2EIfRO3Gd2bC5FcX9uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheekgdduheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtgfgfggesth
    hqredttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsges
    fhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekud
    efteejheevfeehkedtieefvdfhieelhfeihedvhedvtddugfeugfeiteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfh
    huiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:tuW-ZH7E2bT26GGnjmS34SVQMYhZVFZnb4eLUHLiWBcZ3_VUILwKTg>
    <xmx:tuW-ZP6hrUvLcelDbCif8QTb_bFf39qq_9DcUBCOztZIDy-PiAZyzQ>
    <xmx:tuW-ZHjJhlPiyfGTz6NYaN9Jz7yhSMr-1WOT71ENMDlQ8GI3FbqWCg>
    <xmx:tuW-ZC0OqYydN2qjpYRiOc_7imWYmw1bvIo7Sg_iDMYg6pPyqcq9EQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jul 2023 16:57:25 -0400 (EDT)
Message-ID: <c340ad4c1cb5efaca51a07593381daeaa9634892.camel@fuzziesquirrel.com>
Subject: Re: FW: [OpenBMC] Please help to update new Schedule A for CLA
 member
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "ido.almog@nuvoton.com" <ido.almog@nuvoton.com>, 
	"openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Mon, 24 Jul 2023 16:57:24 -0400
In-Reply-To: <TY2PR03MB4320C59678817818AF4EBA6BE602A@TY2PR03MB4320.apcprd03.prod.outlook.com>
References: 	<JH0PR03MB8099983C2E08B5571336F705CF2EA@JH0PR03MB8099.apcprd03.prod.outlook.com>
	 <PUZPR03MB598968C899FE99DB71C6F4B8922EA@PUZPR03MB5989.apcprd03.prod.outlook.com>
	 <JH0PR03MB80992180E593B30FC1E71573CF2FA@JH0PR03MB8099.apcprd03.prod.outlook.com>
	 <PUZPR03MB598963D87660375FC3CF7B91922FA@PUZPR03MB5989.apcprd03.prod.outlook.com>
	 <SEYPR03MB80777A11D5A5E26E59C3F198CF37A@SEYPR03MB8077.apcprd03.prod.outlook.com>
	 <PUZPR03MB59892A0FE94982BAEA70A8C49234A@PUZPR03MB5989.apcprd03.prod.outlook.com>
	 <PUZPR03MB59895D9337D9BCC44C34403C923BA@PUZPR03MB5989.apcprd03.prod.outlook.com>
	 <TY2PR03MB432076CE0349AE63F4F1F929E63BA@TY2PR03MB4320.apcprd03.prod.outlook.com>
	 <SG2PR03MB43738B926FD9FF3D5C17A812AE38A@SG2PR03MB4373.apcprd03.prod.outlook.com>
	 <JH0PR03MB80999843DE2C3CB5AC31F493CF02A@JH0PR03MB8099.apcprd03.prod.outlook.com>
	 <TY2PR03MB4320C59678817818AF4EBA6BE602A@TY2PR03MB4320.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
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
Cc: "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>, "Eyal.Cohen@nuvoton.com" <Eyal.Cohen@nuvoton.com>, "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>, "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-07-24 at 05:07 +0000, ido.almog@nuvoton.com wrote:

Hi Ido

In the future, please send a PDF.

I see that you are not listed as a CLA manager on the existing Schedule
A we have on file, nor this new one.  Only CLA signatories or CLA
managers are permitted to update Schedule A.  Can you please have one of
them send the update?

Thanks,
Brad
