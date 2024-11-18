Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C48759D19B6
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 21:37:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsfYx3zFPz3cVJ
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 07:37:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731962225;
	cv=none; b=Yuayht4oLoA1sih1+N0UwYKc+oZLMiHUwWdwEOiSHeiVmaPJJDjj+Qt95lpaPMefyfTwjWF5i4/PrqRefjWymJ5+XNfuPBOSBiIBnBoOZPGJKwZLrKWPIfMKGkTulkTqiqjrx0hBxLq+BJLqAgoFDzKU7ZtmwFvmB/XupNv0eAVBmw1hmxwnIjSvD9p6qledrIC00SYVe8DYc27xa+0DTduqU0aXIVeVcqRe/dqgUvOfQ9edwfHo3ZPJipyUiY5pSyNsoQYPOKHwsYg8cxMHeBT5IlCfcTUErWi4v1o0/Qq7Q0X0+tJpN3bWJYHOx18sh/jP4U0jlUyWA6kr6r1idA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731962225; c=relaxed/relaxed;
	bh=GhLkrjjHJCZt+XXwsNnqLHRjRxad3DvYfXQ138de3Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QbLoQv9zi6j1j/r3V9UQs8whJyPcaLhhLJYeAW5lmDkSAkxs5Bo3bkxn6O5jLG9VaAd4dMdmrU3zVpU26zC+hmG8pj2T/zTMk5+/nyg271rwG1yeBGz45d5CS64GymPU0vbOl+XeDJSa2LiMVgEjFJhp5fSltR7e8tVk/d+tMkHB4EEj+igjdbumqD/0I2PfF3Ob5y/DdUavl6UNIWacR6U98Rg51drHJRfaBeFz6POd6LfLdTbMyeq63x/x32/BU22fibQEggSq0un2/k4ZjuGpjP1bAS0j3v8JPwaM3uVHVdisnpi+4FEmONXrj5vro5iKcp7Ja5OQOVs71+gxrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naYpVJPz; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naYpVJPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 19 Nov 2024 07:37:01 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsfYn1Wr7z2yGf
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 07:37:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731962221; x=1763498221;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XSa515/jKWOeNW5dUE8IgASVSjGF+JutZVIApEw0YM4=;
  b=naYpVJPzXaziQS5DwbrX8gZ1CHyfCDirppTLzEgs3+V1PNQOJiH/iALk
   mznKQYfaXJKqb/hlQEpvzpgwnXm9lFDrVEOQeEjnHDKAzPJZ4WD9HPZXN
   +DeiOvUpdT8y+LXy+UBdHHlnhequke7Z/T2WeQ9CABwEdAofTJWAd6V68
   vTrSvagaIyPb5CGWQuhzyU/WKThGSguns88Lo/rdaZ7mW588dIYGxrWhN
   c4kpl9fapZdn6r6V7X9yJm0FwcHx2w1gYl3an1XWIaj0vOZ9lODUcC54h
   k8ofekFV9EbLrqKxRi3YKE9kbiPsPrhKkbN76YwgsDTlO3wpwHQyhU2uD
   A==;
X-CSE-ConnectionGUID: KJpMTOHaQ6Of5708HIpWqQ==
X-CSE-MsgGUID: BvSndLtvRZCQbpvT2kQA6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32076596"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32076596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 12:35:51 -0800
X-CSE-ConnectionGUID: aALCUkvSRVKa5jtvJBkQJw==
X-CSE-MsgGUID: LoOAZHd4Tsm2SUrszkVAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89739973"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 12:35:50 -0800
Received: from [10.124.90.30] (jmbills-mobl1.amr.corp.intel.com [10.124.90.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 6AE0920B5703
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 12:35:50 -0800 (PST)
Message-ID: <81994aad-acc8-43f3-b29c-5f3e676760c8@linux.intel.com>
Date: Mon, 18 Nov 2024 13:35:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pruning obsolete BMC devicetrees
To: openbmc@lists.ozlabs.org
References: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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



On 11/10/2024 9:49 PM, Andrew Jeffery wrote:
> Hi all,
> 
> We now have quite a collection of BMC-related devicetrees upstream.
> There's interest in whether we can prune some of them out.
> 
> If you've added a board you no-longer require, or know of one added for
> a project you were working on that will not revisit upstream kernel
> support, please let us know if you're happy to queue it up for removal
> after the next LTS release.
> 
> For interest's sake, I did some analysis on when the Aspeed devicetrees
> were last touched by commits that weren't obviously broad fixups:
> 
>     2018-06-22 876c5d891c9d7442d2734871317bc6480cd9f80e: aspeed-bmc-opp-palmetto.dts
>     2019-01-10 869d1375a495e6217fdfda6a59b13812d2f3a569: aspeed-bmc-arm-stardragon4800-rep2.dts
>     2019-01-17 43d78e726a2b5fef0c0e0f07e2bed0faa4918d1b: aspeed-bmc-inspur-on5263m5.dts
>     2019-04-04 8bc7d3ed7cf4a1d44e63301c44bcbd41e6f50f65: aspeed-bmc-opp-lanyang.dts
>     2019-04-25 29b871f344f43ef428aa55ee9ed2a76b5bee0f87: aspeed-bmc-quanta-q71l.dts
>     2019-05-05 9831ae33750db5341bcfcb3a54758e016dfc0c81: aspeed-bmc-lenovo-hr630.dts
>     2019-05-21 130413736376e299e77328760209fd3307d02201: aspeed-bmc-microsoft-olympus.dts
>     2019-06-25 dc4bea0b989cfa3e3dfd8fe79a18abcfaca19767: aspeed-bmc-lenovo-hr855xg2.dts
>     2019-11-18 e4aab38ed5d1b8316f25786e6ec6adb34449b294: aspeed-bmc-opp-vesnin.dts
>     2019-12-03 53820e00aaa173db268e0288d0407806539b4c3e: aspeed-bmc-opp-swift.dts
>     2020-03-06 1f2c9d31e4806177aa97819d4ddc83dacd437ba2: aspeed-bmc-opp-romulus.dts
>     2020-03-06 fa09a28ca3e966582d6d92ef1536de360c8b194b: aspeed-bmc-opp-zaius.dts
>     2020-04-29 697538bd65ad22a92598b5efded3666d3c59d1cc: aspeed-bmc-opp-nicole.dts
>     2020-08-24 11c4124d5343b86e828c7c120cb8d1ece720dd0c: aspeed-bmc-facebook-yamp.dts
>     2020-08-24 f883a606097d0017079b0e40125aac47ab221616: aspeed-bmc-facebook-cmm.dts
>     2020-09-22 9e1cc9679776f5b9e42481d392b1550753ebd084: aspeed-bmc-intel-s2600wf.dts

Intel no longer supports this system, so it's okay to prune the DTS.

>     2020-12-21 13177f6ed3ea380011cea8a2f798c918e1ffc436: aspeed-bmc-supermicro-x11spi.dts
>     2021-01-21 286a596da2937d292828927a2b2ade4e03188f6c: aspeed-bmc-opp-mowgli.dts
>     2021-04-13 45171b7dd2b81dbd38dc4027686774f8b02f2390: aspeed-bmc-ibm-rainier-1s4u.dts
>     2021-04-15 f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2: aspeed-bmc-facebook-tiogapass.dts
>     2021-04-30 189e847a0f0bcf99df5aea85e634abada5fbfbf4: aspeed-bmc-ibm-rainier-4u.dts
>     2021-05-26 419cc0b8c127193f6f447b905b1240765d2087c7: aspeed-bmc-inspur-nf5280m6.dts
>     2021-07-18 00e9e776fa197592addc1f3002c63585f884a5dd: aspeed-bmc-facebook-wedge100.dts
>     2021-07-18 5501ab03b9f1412a44e993e469f9375276de5399: aspeed-bmc-facebook-galaxy100.dts
>     2021-07-18 c8a66b42d689e2b90878416e4b83a7ed3f58b708: aspeed-bmc-facebook-wedge40.dts
>     2021-07-19 813e3f1d51fda49c7c9ce8552177968cd63a2af6: aspeed-bmc-facebook-minipack.dts
>     2021-10-14 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62: aspeed-bmc-inspur-fp5280g2.dts
>     2021-10-19 2561b4f6ecc741cb96e67c5fe250915548a83bb2: aspeed-bmc-inventec-transformers.dts
>     2021-11-19 67ac01d03862b274d4ca3fa76092e96b00f478af: aspeed-bmc-vegman-n110.dts
>     2021-11-19 67ac01d03862b274d4ca3fa76092e96b00f478af: aspeed-bmc-vegman-sx20.dts
>     2021-11-30 4fcbe1f5b6ba71e0c464a303e3769bf1ce1fe54c: aspeed-bmc-tyan-s7106.dts
>     2021-12-10 b26965e99788ea163fc217bdca1c2b17a5d70c90: aspeed-bmc-bytedance-g220a.dts
>     2022-03-25 7b46aa7c008d2becd5df46c174d8cb4239e24659: aspeed-bmc-nuvia-dc-scm.dts
>     2022-05-26 94d0a03297615cad2d40b0f02ceab902a7339062: aspeed-bmc-portwell-neptune.dts
>     2022-06-23 390ffde2b97c8d50f87bf450208b3a4ed70cc2db: aspeed-bmc-arm-centriq2400-rep.dts
>     2022-06-24 7f058112873e86ca760f2d2b0e1ccc2ab111f418: aspeed-bmc-qcom-dc-scm-v1.dts
>     2022-08-30 50c7e281f44726249b5ab7f148c02bbba751fea1: aspeed-bmc-facebook-elbert.dts
>     2022-08-30 50c7e281f44726249b5ab7f148c02bbba751fea1: aspeed-bmc-facebook-fuji.dts
>     2022-09-22 3293fca4a689dae1090b997145a46c816ff03a4a: aspeed-bmc-amd-daytonax.dts
>     2022-10-21 fe87f88eaf696b064231143536a33a618d5e0cd2: aspeed-bmc-opp-mihawk.dts
>     2023-01-11 03d24e12749281f51545c9011fc953ac844df413: aspeed-bmc-amd-ethanolx.dts
>     2023-01-18 8803d9438ef65c96b03ae95472e19b3ac072c930: aspeed-bmc-tyan-s8036.dts
>     2023-01-19 28cfb03afcb20a841e96e821ba20870a7c437034: aspeed-bmc-ufispace-ncplite.dts
>     2023-07-03 3f2879e4040cd8145d4b2f66ee8f9738e438e055: aspeed-bmc-inventec-starscream.dts
>     2023-09-14 fe93af86526b93de6f11ca3c201525dbd961fb8f: aspeed-bmc-facebook-minerva-cmc.dts
>     2024-01-13 8412c47d68436b9f9a260039a4a773daa6824925: aspeed-bmc-facebook-bletchley.dts
>     2024-01-13 8412c47d68436b9f9a260039a4a773daa6824925: aspeed-bmc-facebook-wedge400.dts
>     2024-01-31 247997184b0eb70f7af29fbe3e32f7a4eff2651e: aspeed-bmc-asrock-e3c246d4i.dts
>     2024-02-24 dc260f505bd57f57b23bb343285e29533a6264f3: aspeed-bmc-asrock-romed8hm3.dts
>     2024-02-26 4ed43e8a1b9080a3ba393606b0523cf8bb311083: aspeed-bmc-delta-ahe50dc.dts
>     2024-04-03 c61838aa458b5f96d5824733bef164da2d7ee860: aspeed-bmc-asrock-x570d4u.dts
>     2024-04-05 f956245e4b74312cb238ce6a21fe02f60ef592f4: aspeed-bmc-facebook-yosemitev2.dts
>     2024-04-10 1bd612936b558f6868ea1c5734e72fcea3bc49f2: aspeed-bmc-facebook-cloudripper.dts
>     2024-04-30 d8bdd1e8acd54631a59c56f637b18816c5381f61: aspeed-bmc-asus-x4tf.dts
>     2024-05-01 c44211af1aa9c6b93178a3993e18a7ebffab7488: aspeed-bmc-asrock-e3c256d4i.dts
>     2024-05-20 76c5533925434b0383f95a56a4da2e81e3e8a3d3: aspeed-bmc-asrock-spc621d8hm3.dts
>     2024-05-22 787d4cbff0dc2fb5c4a344fb5f5f14ca5d7d0a9c: aspeed-bmc-ibm-blueridge-4u.dts
>     2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767: aspeed-bmc-ibm-bonnell.dts
>     2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767: aspeed-bmc-opp-tacoma.dts
>     2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767: aspeed-bmc-opp-witherspoon.dts
>     2024-08-06 326bed426c43645cdce46197c420f929969a18c4: aspeed-bmc-ampere-mtjade.dts
>     2024-08-16 ef1e32cb6314898da9188e2371a398c217db238a: aspeed-bmc-facebook-greatlakes.dts
>     2024-09-05 a16edad0afa57424b85ae512a574b21ad02ee9a5: aspeed-bmc-ampere-mtmitchell.dts
>     2024-09-09 8da6f02e0cbd2a54a1c322f12a104ae6d0aaac26: aspeed-bmc-facebook-harma.dts
>     2024-09-10 e87ee9893c576b2d3916b017bb672f2f3c0e231a: aspeed-bmc-quanta-s6q.dts
>     2024-09-10 e87ee9893c576b2d3916b017bb672f2f3c0e231a: aspeed-bmc-vegman-rx20.dts
>     2024-09-24 ef73fe22bdd97bd829246299f69cd701f29ffb07: aspeed-bmc-facebook-minerva.dts
>     2024-09-26 e9414665bb9f80c6072b8ecd3f43f395a0c5b916: aspeed-bmc-facebook-catalina.dts
>     2024-10-01 5270aac729e2f2ad5ed0529bcb2618c92735e9f1: aspeed-bmc-ibm-system1.dts
>     2024-10-03 faabe02697d7348f5c7cb7be4d93f9c9041021f7: aspeed-bmc-facebook-yosemite4.dts
>     2024-10-21 8e2e003ccafe87795a9940ffed456600f71a0fd7: aspeed-bmc-ampere-mtjefferson.dts
>     2024-11-04 275017f75a4fefd004962024c3b4a1587a95bdfe: aspeed-bmc-ibm-sbp1.dts
>     2024-11-06 c63cd57bb09abfb15b6907e85d2df7be152d9f25: aspeed-bmc-ibm-everest.dts
>     2024-11-07 2eff056a229e21d9e287a74f1305f947ff6b141b: aspeed-bmc-ibm-fuji.dts
>     2024-11-08 ed280dbf0e488347c33bef359f8b101f0835f89b: aspeed-bmc-ibm-blueridge.dts
>     2024-11-08 ed280dbf0e488347c33bef359f8b101f0835f89b: aspeed-bmc-ibm-rainier.dts
>     
> Out of further curiosity, I also filtered the list by machines that
> aren't mentioned in upstream OpenBMC (not that that's where they must
> be used, but it might be an indication of stalled efforts to upstream
> support):
> 
>     2019-01-10 869d1375a495e6217fdfda6a59b13812d2f3a569: aspeed-bmc-arm-stardragon4800-rep2.dts
>     2019-01-17 43d78e726a2b5fef0c0e0f07e2bed0faa4918d1b: aspeed-bmc-inspur-on5263m5.dts
>     2019-04-04 8bc7d3ed7cf4a1d44e63301c44bcbd41e6f50f65: aspeed-bmc-opp-lanyang.dts
>     2019-05-05 9831ae33750db5341bcfcb3a54758e016dfc0c81: aspeed-bmc-lenovo-hr630.dts
>     2019-06-25 dc4bea0b989cfa3e3dfd8fe79a18abcfaca19767: aspeed-bmc-lenovo-hr855xg2.dts
>     2020-08-24 11c4124d5343b86e828c7c120cb8d1ece720dd0c: aspeed-bmc-facebook-yamp.dts
>     2021-01-21 286a596da2937d292828927a2b2ade4e03188f6c: aspeed-bmc-opp-mowgli.dts
>     2021-05-26 419cc0b8c127193f6f447b905b1240765d2087c7: aspeed-bmc-inspur-nf5280m6.dts
>     2021-07-18 00e9e776fa197592addc1f3002c63585f884a5dd: aspeed-bmc-facebook-wedge100.dts
>     2021-07-18 5501ab03b9f1412a44e993e469f9375276de5399: aspeed-bmc-facebook-galaxy100.dts
>     2021-07-18 c8a66b42d689e2b90878416e4b83a7ed3f58b708: aspeed-bmc-facebook-wedge40.dts
>     2021-07-19 813e3f1d51fda49c7c9ce8552177968cd63a2af6: aspeed-bmc-facebook-minipack.dts
>     2021-10-14 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62: aspeed-bmc-inspur-fp5280g2.dts
>     2022-05-26 94d0a03297615cad2d40b0f02ceab902a7339062: aspeed-bmc-portwell-neptune.dts
>     2022-06-23 390ffde2b97c8d50f87bf450208b3a4ed70cc2db: aspeed-bmc-arm-centriq2400-rep.dts
>     2022-08-30 50c7e281f44726249b5ab7f148c02bbba751fea1: aspeed-bmc-facebook-elbert.dts
>     2022-10-21 fe87f88eaf696b064231143536a33a618d5e0cd2: aspeed-bmc-opp-mihawk.dts
>     2024-01-13 8412c47d68436b9f9a260039a4a773daa6824925: aspeed-bmc-facebook-wedge400.dts
>     2024-01-13 8412c47d68436b9f9a260039a4a773daa6824925: aspeed-bmc-facebook-wedge400.dts
>     2024-04-10 1bd612936b558f6868ea1c5734e72fcea3bc49f2: aspeed-bmc-facebook-cloudripper.dts
>     2024-04-30 d8bdd1e8acd54631a59c56f637b18816c5381f61: aspeed-bmc-asus-x4tf.dts
> 
> Some of the earlier devicetrees might be candidates for consideration.
> 
> Andrew
> 
> (data produced and post-processed with awful invocations of git log,
> awk and one-liner shell scripts. Happy to pass them on by request)

