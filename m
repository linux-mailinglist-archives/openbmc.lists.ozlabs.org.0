Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D874302E5
	for <lists+openbmc@lfdr.de>; Sat, 16 Oct 2021 16:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWlYZ2C8cz3bWk
	for <lists+openbmc@lfdr.de>; Sun, 17 Oct 2021 01:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=n1GcmgLy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DT+MjIGY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=n1GcmgLy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DT+MjIGY; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWlY50XjQz2yy3
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 01:15:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DB7D5C0120;
 Sat, 16 Oct 2021 10:15:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 16 Oct 2021 10:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=yC3g6sn9yQVUhbIfKTfPQcCv1C
 1zRUg5OrSmd9fR3wg=; b=n1GcmgLyoBX0jR+T0lZwoqrISNpPnYaW28OMjwuIQ/
 CU/bQX3cuMufibsdeZC1jgVIEGzpZcojO8A4nJ5m/Io+vz1NjXFtrK9zhoySGCo3
 tp21eqVSpJR/IbV6xGg7fUBbL21uBYleADEoHt+4+XLa7w/rYZ8IGqyvpNvpHGAE
 xfHPcQPDX33vd0G4QHcmS3bdXDUWTJ0sG5+zGLqBYNiTlSjv9HwJWdEByRe3wnQc
 XXQ29Gd4xKAWERfXJHR3xFQV1P2W+K3ExXF15hPI1T0trkfaeHR6uBBQFPT++31H
 SlnXRhFhQkazivUGpGh24ESl7d1Em/tiHiejqh5QhzYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=yC3g6sn9yQVUhbIfKTfPQcCv1C1zRUg5OrSmd9fR3
 wg=; b=DT+MjIGYZ64X6mMs23X6EYWUk8wfjZ3Vy0Hkh0s94O3Y/pOIUobnoTLV+
 o8ehu1KmI0vWPcjSAFqiJs9UwzdN1tTcHocedFQG+cmOCG6SbpWyeOlzZX+tZaBW
 no1yKF5asgQ3w6x+2RDA0o1QC1XEtM23Yl+smAAeWb/Z7T3sEyWvy/Gt+2GPCxVu
 QovxQd1xxZGEmEYRvISZf7oZKSXcGvMM1+XkMtpqfEuqaaE+EZrYAOnlk8P3Cr1/
 ApYG1cNNRqusbnt350SG9TXvCghcHdGxKwfxuEda2SpU34pDheISlkSukrS5CCtu
 CvuHjgQ+sXFv5DYaJkUrtUrNltI9Q==
X-ME-Sender: <xms:k95qYZTNpXFRcquAgjT4u8pSugHzWqWln52-__96tNXtA76HPjhuoQ>
 <xme:k95qYSycsX7MTFEXCcldQu9jUDTtAEx9PGZGkS7f45bAVrkCAWa85d3BQ3890YAr0
 BqWxMUuLrbB111SKg0>
X-ME-Received: <xmr:k95qYe1e35vYGLcvO53zodiBs9bhoFIIYsEiypLBHlAn6AmxVTDD_tAHLz5r3v_R3GsNMRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduiedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeduvdevhefhvdfgvdehieekleeigfdugeeltdffvedv
 ueeiffejudduffdufeeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:k95qYRDFw1ooka3AnymYPGHUABloPpYNk343Qoca386QufNgVQsckw>
 <xmx:k95qYSgMa0-Pi9q_C961LAg7jRCDaNvviGz9_0n_yo_scoiVPkE8LA>
 <xmx:k95qYVq5RmM6iEE4ei4g2TPFVFbHKGEaT4lJ7ynPBBVdAXeq90zNOA>
 <xmx:k95qYVt27A8nBbkCW5Vm5sE0a7Ujrlygs-LNu2PMdWZyj3KLS5bwsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Oct 2021 10:15:46 -0400 (EDT)
Message-ID: <652c5454eb848697f26f787ddb718c5b239a30e3.camel@fuzziesquirrel.com>
Subject: Re: - Re: OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Janny Au <jannya@hyvedesignsolutions.com>
Date: Sat, 16 Oct 2021 10:15:46 -0400
In-Reply-To: <BY5PR04MB64218DD3B1FDFC009ED5877BDCB69@BY5PR04MB6421.namprd04.prod.outlook.com>
References: <BN6PR04MB02751CA806D404FA7CA19855B9819@BN6PR04MB0275.namprd04.prod.outlook.com>
 <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
 <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
 <BY5PR04MB6421D6EB8BF4D9EB43BE0024DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
 <BY5PR04MB642185E5B4FFBAFCAC253259DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
 <C24B224E-DDEA-4573-9090-49EB4FD602F0@fuzziesquirrel.com>
 <BY5PR04MB64218DD3B1FDFC009ED5877BDCB69@BY5PR04MB6421.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Phil Yeh <phily@hyvedesignsolutions.com>,
 Eric Kuo <erickuo@hyvedesignsolutions.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2021-10-12 at 05:59 +0000, Janny Au wrote:
> Thank you Brad.  I have modified Schedule A as attached.
> 
> Regards,
> Janny

Hi Janny, updated Schedule A accepted!

Thanks - brad

