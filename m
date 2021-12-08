Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3346D679
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 16:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8LF82xPZz308b
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 02:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=VDCUpVeC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IspBUqjE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=VDCUpVeC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IspBUqjE; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8LDh645lz2xtN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 02:09:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 191CF5C023F;
 Wed,  8 Dec 2021 10:09:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Dec 2021 10:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=+bd
 Mr2u1yhR7+dEZFWRRhdDru9ZQSZx0rns8a3wR4co=; b=VDCUpVeCRn0wE2VyIgx
 yEdEw1bh5CzplAPZHOTw0ADAW/HNG3Y1TZxRAEuZCbz6ejfei0D49tOAkBYC299p
 u304lgTgBtLGskPVoa/1bEbvuo1fVGlG1F3/5Gu6o8L7EuKa2If42Wz+NkzDqjWS
 jdmGsSDOulx3OTAJ+CcOe/LXOCv6pRDlMxsdaewft+1Q33q0oFneAmLwMhp4Oodt
 PiSLT1gSkuM0HtzggvEH2jdVHZUlr10zSC54jpPjc/Xu3PdK/klXAt8pUBPdj7+I
 cuEbOJeG0ifzN4q9+pWhadcb3kvIHY+Ke+ajIPoC1C1EK2noVrOcZm6N/PuPvH2O
 JEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+bdMr2
 u1yhR7+dEZFWRRhdDru9ZQSZx0rns8a3wR4co=; b=IspBUqjEoVqTU/szqZA1hC
 3dshY2LzfIkIYTwsHzMtKrq5PPGzk2ya64k272Bc+hvdgPqQuzK1OL+9URDXSF7N
 bbV7Dao1rvgsT0QkI4O6quXI1XlFfJAPdRvdxo6U1cHGjqKS8rRlbJB6Br4x6FnI
 78Z/WaixDJFYTort2b6v2UnRGY9gXjdjXzsxSq7N3ACFK4/VbkM2CE3TjGx/xQHr
 zfOVXVi1g3W7MfKMSuQznA6kJb9jwmZHfH7ZD78Xb403j81Ho0DNtNgSsdClud1p
 731jm9q15DU6pBUdYoDJo3O3M+GaiPvjJG9ZWBpFHpnTzpuDKE5p8iN6IgGa0Asw
 ==
X-ME-Sender: <xms:rsqwYY6Eu80fzPHXaFHOZ6qkskGjR_ycS-SYDXXGCORtzbIhSASVYg>
 <xme:rsqwYZ4gzbA0JoRhgySipt6vfkXzsuj-E_No4-C0aMBTgIaaV7u8wKLipL7gGeKOo
 MQ0grznQckiCmOOeuM>
X-ME-Received: <xmr:rsqwYXcvrZ8t8pfMjEcYMLyfBlPI6TWcIYIVAxuq8kiFPCEz2Jz70Lue>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:rsqwYdKL-c3LUBls6sv3SnZiPd1C0baFkF6sr20f9qyGUsDg7_XRXQ>
 <xmx:rsqwYcL4uiT1qBc0toSVyl_EDA6g9nIfZhfwvAi3jr1i3NJbZZHDIQ>
 <xmx:rsqwYezS2K6D3yvu1LW9COaURbLfwL8Q6C-BpHxZZ2EQrmDI3wvbBQ>
 <xmx:r8qwYWwkThMyBwiwTTxWeNT_KGWHJtlCzZ3Syr_t-4JFj0WP4C8y2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Dec 2021 10:09:34 -0500 (EST)
Date: Wed, 8 Dec 2021 10:09:32 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Duke KH Du <dukh@lenovo.com>
Subject: Re: Apply edit permission for Lenovo CCLA folder
Message-ID: <20211208150932.u22x2bjaehup3v2h@cheese>
References: <SI2PR03MB58317B51F6CB17FF2910D4F0B66E9@SI2PR03MB5831.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <SI2PR03MB58317B51F6CB17FF2910D4F0B66E9@SI2PR03MB5831.apcprd03.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 05:44:35PM +0000, Duke KH Du wrote:
>Hi Brad and all,
>
>Could you grant the edit permission for me about the Lenovo CCLA folder in the Google drive?
>I will update the Lenovo CCLA.

Hi Duke, sure, I added you as an editor just now - let me know if you 
have any trouble.

thx - brad
