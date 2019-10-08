Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD575CEFE4
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 02:23:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nJ426B7BzDqN2
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 11:23:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aitZwk6P"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DYIA3zJg"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nJ3X3qhlzDqGx
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 11:23:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC55B20D56;
 Mon,  7 Oct 2019 20:23:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 07 Oct 2019 20:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=wyaRnJ58a9gSA76nsMec9TMx6JyiVR8
 GDflYJYt2/oo=; b=aitZwk6PAHMGnQVPdnDnKi8CTkebhjQZB7adjN9wgooFkh4
 uECyqTVL2lAch632XL/6RZeeXGh+h6yaEg5zlxwiIpiAoY5wdKKL6jktg1+pSIDO
 n+phbySiFHz5r+n/+SAHGd2VyHiew7IOllZUFBeISbaq5xCaIolFGCEjSsoVqdKo
 88bI7jbW+hXs/b/ur4r6VKCU+B1mgKDzlx4H19N+rwvA1IAvUdJLh88SzZclHczo
 7KFf5u9G1MOX5SMB1p2nBUarAhIfKvFSMesVFpgafUj/pXv9dSayVQ/nxMdOOi0I
 s1KbBeoo/qgOS9cALg8ln/V5soUJZ/SAwax7xYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wyaRnJ
 58a9gSA76nsMec9TMx6JyiVR8GDflYJYt2/oo=; b=DYIA3zJgAuIFb07WVTRmuK
 Lqj6ReE2pl48nZlrgadrUwSlkapby+GCUKct3ujRhkLoDY1SzBLaazHjOCsXeSys
 nk4ugw1SclZREO+yIsvMZPc6e2uTgmJghejMUKmw7+LVtLM7Vg8wFuGIsO8mWQo9
 tGN5tuyNZX5ukp+u5DqU/LfUG7T13QWniqAGaRZ6cxvC0EVmuKSDx+jRDRWtNhRI
 DAYaWIb2KF1YMwdkZuGGX+OcaM43GiwrgM8myM72WzEu/K60yEMRgpMa9NUEMspT
 SjKDCTp77yp7gtJ6hHIM5VH4yIU2NT6Ny86QWRfZy7FSbTrKnXPqzUWDI4pOFrEA
 ==
X-ME-Sender: <xms:89abXWWW0p19XBnrB3SKzHa0EX2msHkACK2tdGbp9_rNDctF97n_QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:89abXcN5eXxEO8OfdKbk5S06jU4G5BOHTUo_myvEoGGoCF-R6dzT5A>
 <xmx:89abXaYBtC5CNxxj4nxjqbaKZCBB8wP8UyuQ13QZVvmuVuyf8uKZPQ>
 <xmx:89abXQrgpUkhy-OeMhX-xF-_nYXAXBALKOQ-Zst81JEW9m8eAPHAiw>
 <xmx:9NabXcUqilBG8MtnzfOw4Vr_bYgkoHmMGJczN_Cq2MgJVotKNue2nQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CE20FE00A5; Mon,  7 Oct 2019 20:23:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <8712feef-4bcc-4720-aa9b-f79729a8e92e@www.fastmail.com>
In-Reply-To: <20191003222415.6938-3-eajames@linux.ibm.com>
References: <20191003222415.6938-1-eajames@linux.ibm.com>
 <20191003222415.6938-3-eajames@linux.ibm.com>
Date: Tue, 08 Oct 2019 10:54:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/2]_ARM:_dts:_Aspeed:_Tacoma:_Add_wa?=
 =?UTF-8?Q?tchdog_definitions?=
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



On Fri, 4 Oct 2019, at 07:54, Eddie James wrote:
> The first watchdog on Tacoma is wired to the fans. Use the second
> watchdog as the kernel/system watchdog.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
