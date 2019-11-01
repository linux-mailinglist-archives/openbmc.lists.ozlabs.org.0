Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74795EBB9B
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 02:14:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4744376hfyzF6Tk
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 12:14:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="m8IApwsm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fUUXaP0c"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47442N6f5CzF6Tk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 12:13:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 73BDF21C47;
 Thu, 31 Oct 2019 21:13:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 21:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=WfEljS9AxNkwJEqRExqU9CEi+mCnXr8
 X9OcWCC056wA=; b=m8IApwsmukHIS0n4798k1JhDLjaCNRAFpgPD5MCTE8zmVSF
 jERtrs3ueX/ySyZHBsSNO8XSMsUgJEXmw541gxFTvfA7dvs061QGcQVDhLB5zvKi
 oc0/cGv8a99wJa8jPxiO16/iCryz670c15HUq6Y1HxUnpaSQhY4QwRYL4BjpQWvB
 m3EdUAQhtCyewlT4/I5tXlTE8C21i8ZqINCgdFl5vGCpjF5KJrTxfxJtTusIi/A6
 gB3J170rO9VlUezfEWNmduCZ24cZCSGXoh1T6E4duWAM5KCkM6wdgeJqREj6Jxgf
 qIvhu2NKJCAYqi6oh9rIHR7i0/VYREiEBZ3aN5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WfEljS
 9AxNkwJEqRExqU9CEi+mCnXr8X9OcWCC056wA=; b=fUUXaP0cyhm/N1nkJnvrBa
 35ee/jdRObsWCIVvRySRi1wHp4bOFUIw5poqQGzX6uVl1JVkIT+U4Mz+/2Ldy9sR
 3mdxyrFZSuARTl8aVRDgP74A0UL3aq+0r9EclmCATKjtjolaxx3U4Q3W4lMpnDXp
 tI851HsjBXvDFaTUJD6d+wiykJW9ZdvFDwcjjWzpmnaKjAXR/+l7STiAv/ManSNC
 IaYxJskfN0ya9Gf4TqHMbILNqxcrzSaJlMsAKvcVxx8i3PlRyBfpdE8tjsQ0F4Qt
 Bso0/D6BH9QokFIzySL5qJvzQAgRVV0qZ45wIVFtrmyqc6VSqvCVcZH/D1husJVQ
 ==
X-ME-Sender: <xms:uIa7XemZ8z2YZnamlfTOuJyO0Lw1fkaAlO4grtjqZ-v-KJUrHnyHww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:uIa7XfMpMv8Ztbys39893sGvjaN4VgVpgNV4dZ16PXkYP0a8K_vBAw>
 <xmx:uIa7XVJsD_BeCJNCvXLtgvCzsKvZF5LuEU5t8wiZslQ7AszNBvXF9g>
 <xmx:uIa7XSFJs0UxQDS6atU3xl1uxghrLESzY8vcX3QqTFHyQ4AiNNr-ig>
 <xmx:uYa7XYZFqgACNmF3oFgw9k0-KesnVHCnCvtCbJhWRTsOHQQtwUf9dg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 708E5E00A3; Thu, 31 Oct 2019 21:13:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <ac3001e5-3513-458c-a3d5-d80d7731e188@www.fastmail.com>
In-Reply-To: <20191031051438.28589-3-andrew@aj.id.au>
References: <20191031051438.28589-1-andrew@aj.id.au>
 <20191031051438.28589-3-andrew@aj.id.au>
Date: Fri, 01 Nov 2019 11:44:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/2]_fsi:_core:_Fix_small_accesses_an?=
 =?UTF-8?Q?d_unaligned_offsets_via_sysfs?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 31 Oct 2019, at 15:44, Andrew Jeffery wrote:
> Subtracting the offset delta from four-byte alignment lead to wrapping
> of the requested length where `count` is less than `off`. Generalise the
> length handling to enable all valid offset and size combinations.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/fsi/fsi-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1ea15621e588..889349beb284 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -559,8 +559,8 @@ static ssize_t fsi_slave_sysfs_raw_read(struct file *file,
>  		return -EINVAL;
>  
>  	for (total_len = 0; total_len < count; total_len += read_len) {
> -		read_len = min_t(size_t, count, 4);
> -		read_len -= off & 0x3;
> +		read_len = ((count | off) & 1) ?
> +				1 : min_t(size_t, count, 4 - (off & 3));
> 

Actually, I've cooked up something that's optimal and still fairly compact.
Assuming some macros like:

#define BIT(x) (1 << (x))
#define clz(x) __builtin_clz(x)
#define ctz(x) __builtin_ctz(x)

we can do:

-		read_len = min_t(size_t, count, 4);
-		read_len -= off & 0x3;
+		read_len =  BIT(ctz(BIT(ctz(off | 4)) | BIT(31 - clz(count))));

This gives the following lengths for input offset and sizes:

offset  request length
0       1       1
0       2       2
0       3       2
0       4       4
0       5       4
1       1       1
1       2       1
1       3       1
1       4       1
1       5       1
2       1       1
2       2       2
2       3       2
2       4       2
2       5       2
3       1       1
3       2       1
3       3       1
3       4       1
3       5       1

The implementation in the current patch generates some sub-optimal
lengths for certain offset/size pairs (i.e. a wider access could be performed).

Andrew
