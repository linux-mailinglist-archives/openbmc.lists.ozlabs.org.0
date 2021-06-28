Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C03B6A02
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 23:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDKxz4t3bz3bZ6
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 07:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=RvAxawXt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pxvb2kWs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=RvAxawXt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pxvb2kWs; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDKxf4lpYz30B2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 07:09:58 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 645E15C01E5;
 Mon, 28 Jun 2021 17:09:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Jun 2021 17:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=Lgw
 /u3WpcgXE+dCh5ABxjMm4mJ6B3NNtLKcY06Xm2LE=; b=RvAxawXtOScNaZSoeo2
 zNlq59kttKXf8auXvNJ7SAGoKpXK+HNfivCfZg5lQjuhCMNizJQwfMFsJ+uZbD6W
 p+WeIspCrxvV4e5xuKNvbxLCu3JVkSQn0nqB3AxcmJdOmBqNuZeU11DQeCsi8NWA
 7/NlimuKa+f5kt148rZOH+zyZHUEJ+w0qHwcEpU6jJg3eXT6Lj8VaLcdWRj8J0d6
 dVCjIH3lD2l8iKq1QLc6W4U7D84Gt6iBjjcIONkXnEbvTaBcLgf40Fwo4CmjnMNY
 xc0lRtw8DqHxtJMLGvZz05OGLm5zHjVJpGWdBET66ynrFhbq41YIz//ME0pcenJQ
 ZQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Lgw/u3
 WpcgXE+dCh5ABxjMm4mJ6B3NNtLKcY06Xm2LE=; b=pxvb2kWs6vqm3bJuyJZu5l
 j0rgrD/HEelfa9PzS1qJuFP+WUL5e6uuTEceOCKXZTqPk8cdbdRyoFPobucYjdYd
 2t2tk5+GZhsXSv/2qzW7MhgjgTujgc2A6TpXH0c62vqdSuFww8F8IgBgGou9Ok8l
 iT+ATjGPtwrIdirc6gEERmrqRqScvrOZ9dCkVrnd3ukKWF3a0/C0p2p0p67RG63E
 udA1rphE+KVMzuUCHPjU55VchvRRMrRbw73bKuUhj9V+UbNgn4Fge8r93aFfT3tE
 EbyxrtkLXNCa3KlV1Nb8QsQWOKxA2Es6idNHdGsjBTcpQuNrU+gCACNLu+715inw
 ==
X-ME-Sender: <xms:ojraYHrHL3jjbC04ZN0wyeIfVuV1KxJ2FxDJ8oXY_pTCaDzM7IGmqA>
 <xme:ojraYBqn_RGeGEL7S5LUB1GZ8fWYvGAkeolZ12yJZVtg8EeZES680ml31lEWMnztx
 KKWeHPiHOrEvBsQJRQ>
X-ME-Received: <xmr:ojraYEPaeRzNNz9YH58Zal46QjpGgB23uGQoeF-z4gzPpdRUTia7PZuNTynbejbT9sK8dl4u21KOf8du8n8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:ojraYK6MoS7_zUzioXuPRZ47jJkI-QfskrEVKfABePa_yclgVprEJw>
 <xmx:ojraYG7-2M_j5xpWdiqSy11OGJMlSv3g8J7YzRgimL1Lk_NDJJ6MOw>
 <xmx:ojraYCjFSeYwW3MmsJgb9KNTBv5QB976k46NCKmGuFy--pHqw0p9Ow>
 <xmx:ozraYIS-4P5VQzaHtz1KiAson2bgnM2C16qFxz0tVry0uMuEFvma4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 17:09:54 -0400 (EDT)
Date: Mon, 28 Jun 2021 17:09:51 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Mike <proclivis@gmail.com>
Subject: Re: Inclusive Naming
Message-ID: <20210628210951.cpvmajlpayk2n73p@thinkpad.fuzziesquirrel.com>
References: <20210628193850.gylhta7melpevjju@thinkpad.fuzziesquirrel.com>
 <53876421-2E01-4546-BBE5-B724568C4F0D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <53876421-2E01-4546-BBE5-B724568C4F0D@gmail.com>
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
Cc: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 openbmc@lists.ozlabs.org, Sagar Dharia <Sagar.Dharia@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 28, 2021 at 03:02:57PM -0600, Mike wrote:
>Brad,
>
>The SMBus/PMBus technical committee is changing the master/slave terms, but had not yet voted on the change.
>
>Let me know if care and I can get a draft to you for review.
>
>Mike

Mike

Yes please, if it isn't too much trouble.

Thanks!

-brad
