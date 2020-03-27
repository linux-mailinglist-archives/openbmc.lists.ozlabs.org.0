Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426E194E30
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 01:47:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pNVP3dJNzDr48
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 11:47:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=LV/t8I1t; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KV5OESJq; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pNTh4XBfzDr32
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 11:46:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5C693875;
 Thu, 26 Mar 2020 20:46:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 26 Mar 2020 20:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=tsD2Vw3VQ1g9o4e77oCUrXFmfATWqfF
 LOUe814cRV+Q=; b=LV/t8I1te3VWX4yToC6piTCaDzBFrT20cfd/hyGAzDsC3OR
 gBns3w2Ms/1vQIO0xTMxhk8G9w0zt7CWHvb83sKWL8CMAWfGJCNF8nLivYd6iHPr
 rN/31fSGnzVRxhrE/TFdzKA+zImJBb1zO0OjG27YpVMDtBb5NkLmOFK2gEJxJfN5
 hxCvJgVCUMYmarFQFMDefY+IkFwtRdbXwPDrzu2angO89pvE+0smekTZhGpC84dl
 NgmkLkUXRXrks5vHCvWhPN+cjzJ1hxsVeIg2PPs9nDFDMDs5DxyEr2ahDgRdAjrw
 uvlUujz0LRv9UU4hlZ806cJWJwOfqRHjWfFYSgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tsD2Vw
 3VQ1g9o4e77oCUrXFmfATWqfFLOUe814cRV+Q=; b=KV5OESJq6N69sjz+stVGKO
 sh+DPWPwcNLIW2WjyeL0JEC34J76FLxQ5KSGN0G7pdcclWKauwZPh0KomDgzl+bF
 Doy0n7um84a7t3bQzo0hqgDO6+nA3cKqeuh6zeMgmo6PrcjE3LI3OPVi9IHRRgt+
 r6V5NQhx0LC14LkC3/hMLTpfp858miX+XUMabj6+3pHkya5gUxjSRPk3Dy1efuYQ
 g3IflL77Bs4XjtXwZ38r6rBgm19NvvAlIF9Y0O9I6cjyRt2cbz7xdUIjAwYKXUB3
 m/d5sLd2icz1akDL+TWK9Kcu44c2jNT6qpqSvAGqsROYOTA8UeevtQGlnq0mThLg
 ==
X-ME-Sender: <xms:8Ux9XqnNJkFb7wMdeHhovCgoaEzNghUWa-koH4ZDboWt_6xBA3pwgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:8Ux9XmFcPGG1nd0Eg0CjdVd4bkmF-JHf9cQM83F3SI9KJg9u-nWkaw>
 <xmx:8Ux9Xjpoyar6yfR-fx8TfoZ90uo7cJtXLspcGiaMMoLZ1VpIWFRTsg>
 <xmx:8Ux9Xi6G3BvRUeVrEofc-nfcG0Z88_q4XJclyjvfB25HUoNvitxHtg>
 <xmx:9Ex9Xi5okRi7QxfaS2Bx10kVAWExakqlYHhop1DUVfPNWAbmxafwsg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C8C93E00BB; Thu, 26 Mar 2020 20:46:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <0f5f8f77-317e-4f05-85bb-835e7db399c3@www.fastmail.com>
In-Reply-To: <20200324112530.293386-2-joel@jms.id.au>
References: <20200324112530.293386-1-joel@jms.id.au>
 <20200324112530.293386-2-joel@jms.id.au>
Date: Fri, 27 Mar 2020 11:16:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Andrew Geissler" <geissonator@gmail.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/2]_ARM:_dts:_aspeed:_tacoma:_Add_GP?=
 =?UTF-8?Q?IOs_for_FSI?=
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



On Tue, 24 Mar 2020, at 21:55, Joel Stanley wrote:
> GPIO Q7 is no longer used for air/water. It is repurposed on Tacoma to
> indicate cabled (low) vs internal FSI (high).
> 
> GPIO B0 controls the muxing of FSI to the cable (low) or internal pins
> (high).
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Good times.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
