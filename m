Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B842ACCF
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 21:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTQ2t6kjZz2yp4
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 06:00:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=WzS4D/QM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G4K2qKGH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=WzS4D/QM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G4K2qKGH; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTQ2R3Z1nz2yPl
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 05:59:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E0505C0189;
 Tue, 12 Oct 2021 14:59:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 12 Oct 2021 14:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=tSs
 FY4MKNRwQsHiKLTJ8TdVY8arR6jp1Hrkf+ZFMRC4=; b=WzS4D/QMwYOb9ZUEVJU
 e9Q4vvL1DItld4nbyYSGGc4L0jUllMCapvWd2I2lXyxQuFy5WZ41F/m9s4mMhmPo
 9OgH19M7jE9CpXX3GlCqyaycLF5z6YQVtJjOB/nAX6uhvGNFN6r+OLnvCHEaWLWx
 4vGBil+a8yqk68fOCit51cimVQxJPJibnhTqXvyJTmQ56q1ZXfnvp5pH9zfR1CUo
 vHZrTEPBJvbyn85A4k7aa/hXvyxAEX4iJrASeleQtk49KwYNm5QoPqsMNujz/ha+
 F3E61SR/GUeXy4/JlDGhP4RU0f4tBX3sQVQz4qtDlfGr17p6j4/E5KblNzVYPKJY
 iQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tSsFY4
 MKNRwQsHiKLTJ8TdVY8arR6jp1Hrkf+ZFMRC4=; b=G4K2qKGHpE5Z+LFtXg3DbM
 V8y9ep2NYFTQLOYZ/Fk/Lc0xMUHnFdCewl2rt0CLXxxYCqMeJhWrw6FupzDD3xg1
 Y/4SwggW9c6APrV30dmlmkuvgkZgHmn/oxTm7as0M4Eb1KlXHA7ZOZR6rc3fGWWI
 DHk2vzWg5mH+NtnMxoE/hq0TC+jYtIR689Vzhgxha6m3djBjg6APLiTFnu1T2drs
 IRySPYFzJONCXojkBKBOqcnofvyq8ZSi0abDlayqdjbZTNmRoK7T6AfCRQhCMIf3
 su8Go5YvbgQAEuc1mfMkVVlzSUdAsQ+9/WHSyebgrEO6X0alqqHEYwmeVSGZZt5A
 ==
X-ME-Sender: <xms:GNtlYaii0VkUrfwJ-NuMWRksh9CvJUCA4YdQTST67L_ygN_WLgxT-w>
 <xme:GNtlYbBNO4ETepCDpxh6zdJuenwtA-ThT3dAYzR_C6lA3OKvmmWQ4IfcnMsgatMcA
 nbsk5MwccnRGhaSK4Y>
X-ME-Received: <xmr:GNtlYSGMrIO5taXPHU8ynXcZdiAnItTU4QHY-GwuiItvIJvI-Thdz_bB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtkedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:GNtlYTS8rCf74OCNmkE2CjeFdE37H35hu-_eu9S7H1G9v35cgDaG2w>
 <xmx:GNtlYXye1umirdqfLF7TkQ-7poPgw7BGWJaIFvy8NlW2ipbT3RFzEw>
 <xmx:GNtlYR5_-4UX1fM6MQxYllGqrlbAho1m96Y6RJYZOrUKjs2uLBnK0Q>
 <xmx:GdtlYVasWAw9sZo_DjgigOKVYzJPkLU-yUHtU-i0d-exGiICXsJ3HQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Oct 2021 14:59:36 -0400 (EDT)
Date: Tue, 12 Oct 2021 14:59:34 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: Inspur's CCLA Schedule A update 2021-10-11
Message-ID: <20211012185934.blkhmnj2h4lczxko@cheese>
References: <CANFuQ7CvuyBbXZa==obw0q7K5UkHyQod83hGoCfGda_DuwZ0fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANFuQ7CvuyBbXZa==obw0q7K5UkHyQod83hGoCfGda_DuwZ0fA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 10:11:00AM +0800, George Liu wrote:
>Hey Brad:
>        Attached is the updated Schedule A of CCLA from Inspur.
>        Please help review.
>
>        Thanks a lot

Hi George, I've processed the update, thanks!

-brad

