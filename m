Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FAF333163
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 23:10:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw8Xt26qrz3cKK
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 09:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=fbHH+J0e;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OKr1csY0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=fbHH+J0e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OKr1csY0; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw8Xf0L5Mz30Gn
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 09:10:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 340AD1298;
 Tue,  9 Mar 2021 17:10:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 09 Mar 2021 17:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Ehx
 gkp28Ss+WgTw+ehf/6OdrJjlFJh60dTD6gZx+DzI=; b=fbHH+J0eOQSgpi3LmGg
 UJQ4Kz7cvZTyh7NsGhBlLqMVEqMqrBp9bTrkyvkDL9+nGkJLEHKdu+MWs0fg6sE8
 3bGtX9zv+hLdSViLJ98bn2oGgyVcx5VtIBRGaqU8izuKmQzmHA9djhDrDUBVz+td
 w5YQrqVKAhsDARWeuPGf6mTgpU4hdav406gWk3HH3gTF+25cQBsO2USxgeZnxaql
 Xo08oTV7rV1uQs3mSiAiK4vyDhsZcJ3zMs6KrrK3ZsnUwNN3DLZAyQJE1IuAotG5
 JyfYSTB2dtOz78UbcVSZb/EyfiURVkxO9K1IpDGajW0qYndkID1mpM++AAhfdQqP
 7bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ehxgkp
 28Ss+WgTw+ehf/6OdrJjlFJh60dTD6gZx+DzI=; b=OKr1csY0R1/k02FGExZd6S
 BzUlHMZw1awIqapmnn2UvNVZB+Zr4V8VKmgWI/URWGZ+Z5opgmRSC7TjUlaZcjjq
 nbC4JtJnB8IjTt1m7tV74d3zbLB/uPdqeabn3Ut7cWzG/XhsS8Kwv7WLeZM1s+fj
 x3QurgH2p752Xt9ZGXq8CrDkuHVA6y20+w2SdnMImuaktuOgxkI3l5Pa+DNxIDmp
 JTySIXfccXjajQM0tcniYl1u+Ueg6epFXBHFKNcWvOUFbVYT8R0AfMiRqhoFVpRL
 JnJHTc+y2dIy1+Ct5CZa2poNVJKIwfuaGxvtGRqdTyuR5jlnut8Vl5exFmX1P4jQ
 ==
X-ME-Sender: <xms:TvJHYMogBzCpYrxqNXTL23n1jnj0taJjAvlOyQ4zuFKAP1KoX-vhRg>
 <xme:TvJHYMQkSxz2yhefkyrmYUS07BGvFNtGoSdW9FGC8gcApq3YH2qL1q8o_6N2p-ykQ
 rcKLOviii2kGqK8Wr4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddt
 tddvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiii
 hivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepkeekleeitdfhvddt
 geeuhedvvdekiedvudejhffhvefhudejueegfeffledtjedtnecuffhomhgrihhnpehoph
 gvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedujeefrdduieejrdefuddrudel
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrh
 grughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:TvJHYBO3iB2mKiRGfr8CjcFURse_WBGqpR865SLCzdEvNsaaln4Hnw>
 <xmx:TvJHYHMNs9tY79Bi8PkFzmGMfpkWp-JMSzSI5RBLj5vlWF8iZ6onGw>
 <xmx:TvJHYJuPIHKKdOJDMhuPry3O-UdKXFiYNRP1Lvv5kXr4pgu9FfiYPg>
 <xmx:TvJHYObU63n0h-HeIuTYAiEMDeKwHUwxHX_XSNWti8NstxESPBSTrw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DC51108005F;
 Tue,  9 Mar 2021 17:10:22 -0500 (EST)
Date: Tue, 9 Mar 2021 17:10:20 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
Message-ID: <20210309221020.ut4gds26ivcp6mst@thinkpad.fuzziesquirrel.com>
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <8bfeaac7-8e70-c45b-8a87-8ab7d667cab2@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8bfeaac7-8e70-c45b-8a87-8ab7d667cab2@os.amperecomputing.com>
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

On Mon, Mar 08, 2021 at 12:52:41PM +0700, Thang Nguyen wrote:
>Hi,
>
>On 05/02/2021 09:27, Troy Lee wrote:
>>
>>Hi Vinothkumar,
>>
>>Please refer to the following two changes in Gerrit:
>>
>>  * https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
>>    <https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343>
>>  * https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344
>>    <https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344>
>>
>Are these changes merged? I can't access these links.

Hi - We changed our process a bit and now patches are to be submitted to 
openbmc/openbmc instead of openbmc/meta-aspeed.

To help with that transition I thought it would make sense to mark these 
as hidden in Gerrit, but that seems to have gotten in the way a couple 
times now.

I've changed the project flag again on all these meta-repos to read only 
- you should be able to view them again now.

If we want any of these merged - they'll need to be re-submitted to 
openbmc/openbmc.
