Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F14A3CF9
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 05:57:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnG5468CRz2yQB
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 15:57:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=PbALlifW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GAEvCBDR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=PbALlifW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GAEvCBDR; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnG4c2dK9z2xsb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 15:56:47 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 212185C00E8;
 Sun, 30 Jan 2022 23:56:44 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Sun, 30 Jan 2022 23:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=f9ss2F/ZFp3MZnFUSM+pKPCWE2RBrx9U9YsNCN
 LQ8LE=; b=PbALlifWWQ8g15OdxVXc873+doM0+KO48BLVuEZyeyO0c7TDxwbuzQ
 /OEWe18b/GafWlzmPDEI8pCHvW2J/IlUU/tzrChimuftl36JCqYiVY9nCkeqoxfV
 nguaONouzpMAjIIDZOYmlbyEvdeeQBBqx22xVgSBUcrkdGAL4t0viR1WWXf9qRtG
 +W7nsnKMd/dhT6+r0m/noawXzu+s1sdN8WKlKxqw0Yl6sy7vH7KSujHDyj/hP70w
 VaHdAY7BoVb+iCfZQ65XsQuVB5sQO/vkHpuJOY5XF/Lcj2YWmGbti3ovpW5LdX0x
 N/i4lZX+liLoU7Y6blGlQG8MIjcn4DLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f9ss2F/ZFp3MZnFUS
 M+pKPCWE2RBrx9U9YsNCNLQ8LE=; b=GAEvCBDRwabLPws5tX02auWsGsZocdDBI
 Ye1ZqufY/S9goYAEI+37tyxt8S5pmzxaHNOhqR/ljn05KFRRGCQfGPV57nK7huwm
 CnYgVvSy2Ndygp1LmsV0A+wwjRsFeMZcChtleZ1fAR7bWo8DkCG2WsXgki4jn4Bp
 +AdYUNwYkCBWKT2VLEbUGxUXVFIb941ovM/cvpfclzcUPsBf9JZx1t4pMxwTJuy8
 ySRO/Jis9YAYuorvmDb7BoNNEBBfRZ20x+m+OUkV7qZrmwKmP7VMOzCalSiL+tbM
 6JN2mJ3XjTnNbeBpbneXcyMphJrYbAHr6KOKoYpkSfYQg52buoWaA==
X-ME-Sender: <xms:C2z3YXCedoHf9FPAXFEgCyiV8lFD917fAtUa-hdqJhmkYTQu0BUcKQ>
 <xme:C2z3YdgxECmUuFmR2NC0KOb_rC6NhNjTCMnkTgjcHfra0hdZ12pJK6uPjijwaDsqy
 6RzVypKW9WfpmplUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:C2z3YSmhLUP6CpuQ4u4SS5fLJYPSW68prwYBsidCE-a-hP6O4y3auQ>
 <xmx:C2z3YZzg5_0nv-7mH1_XfxgSHOeIxaElk_42NuEliuiwEJ3eyRxeLg>
 <xmx:C2z3YcSOmgOArYcLmBblX1FGWBawA0sZHYRL3RMQDSoBDrQUNcvU0g>
 <xmx:DGz3YbPHByZ1sKZZfXFqiUPypRUKZUUXWTjweINlVWNCYpwWKZ7txg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CDA22AC0E99; Sun, 30 Jan 2022 23:56:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <50603a5e-cdbd-4e31-8505-66c6f482a28a@www.fastmail.com>
In-Reply-To: <20220124191503.88452-2-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-2-eajames@linux.ibm.com>
Date: Mon, 31 Jan 2022 15:26:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 1/6] dm: Add a No-op uclass
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



On Tue, 25 Jan 2022, at 05:44, Eddie James wrote:
> From: Jean-Jacques Hiblot <jjhiblot@ti.com>
>
> This uclass is intended for devices that do not need any features from the
> uclass, including binding children.
> This will typically be used by devices that are used to bind child devices
> but do not use dm_scan_fdt_dev() to do it. That is for example the case of
> several USB wrappers that have 2 child devices (1 for device and 1 for
> host) but bind only one at a any given time.

(cherry-picked from 07e33711fec4f1106f36805b5dc830da07c783c5) ?

> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
