Return-Path: <openbmc+bounces-859-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E4C4261C
	for <lists+openbmc@lfdr.de>; Sat, 08 Nov 2025 04:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3MGz50C0z2yqP;
	Sat,  8 Nov 2025 14:43:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762572016;
	cv=none; b=j38BGN1Fbhqed8sqIY82qKnQvZqcoA1qBo+DFbfzRyEFDFbLd4MhcpQ6ZIxWFtilNvXIFZnzPO/NADP7UAUy/b+EoVp32A1u9dycQ0PLeisdnG14Rj6fKjscSxBp1rjC+Wi1/UmiUYSxPJ6rn7cFjmnZQ6bVDIXx5imyWN5EFe1GsdrLRWPUSwijAcouUzVcskLXjdyvJ0PoTQqCqIZkRE6kEWA11kqvD/j0NO4dkuDGwgqJ/GaxBc02LFob1HNnoOQZAtP7rFoXXu0n/4MXnL/8Hz7pT/RxrsbWL9lrQMsXcDpsjJp3wnrgl2BzW38RzfVQRiwlH+8h3YtvJZJ1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762572016; c=relaxed/relaxed;
	bh=aeOxMzJ+i3IvySd7PiH9VVEq2pkYuGK1IybeIZufS9s=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XvsvuXvx/emOFdrgM9QsunO3s1JG9UxJ6WoxRgH7Yd0ScRpyQzWw03vhaG1uGasUc+4IufOQdKNrKalT4HemXiArmDrqkeCEwaumuRqzC4RsaaIX4uWshB9UFSyEGol1LMFPRRY2fKQD/tv8INzD2JefpKirzyTj4vqu4FLUFpilwvSUltoYCsy7AeQePGJkyCOjZoKBmtlyAI19X9PqiKb+NvIO4ASsU2qOAF5kqsZ7+r5xidqz8EwX7mnbZ1ZJDzBW57JHtiOL/phfdYcNyFOTC9qYWPXs7XeLK9NQXYGEBlP6fy1dzHCsKEUk6WGPzAy+ZDkeg6MK06H9whTAOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=g6Kcxc39; dkim-atps=neutral; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=g6Kcxc39;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 980 seconds by postgrey-1.37 at boromir; Sat, 08 Nov 2025 14:20:15 AEDT
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3Llg1Pnlz2yjw
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 14:20:13 +1100 (AEDT)
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4d3LH00KdjzCtbq
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 10:58:52 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aeOxMzJ+i3IvySd7PiH9VVEq2pkYuGK1IybeIZufS9s=;
	b=g6Kcxc39M5z0HarPRlDQvDmT5RWQ7Oy5k6O+0cs6isVoOs5A04mX+zNuHttY3AFR6BCr7lVur
	pDJJhKYH2Nq2PZXMbgUmWx8z6/tpHeznO66HSGBhbx3J//OxLYa+qXgn69nW+pp5JTp6kAYv4bH
	sE80RxNBvs+1fEMD7bdtgKs=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d3LLh1fn9zpStp;
	Sat,  8 Nov 2025 11:02:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A4412180493;
	Sat,  8 Nov 2025 11:03:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Nov 2025 11:03:38 +0800
Subject: Re: UBIFS errors since Linux 5.15
To: Eddie James <eajames@linux.ibm.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <sethjenkins@google.com>,
	<adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
Date: Sat, 8 Nov 2025 11:03:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

在 2025/11/8 1:38, Eddie James 写道:
> 
> Hello,
> 
> We are updating some BMC (Aspeed AST2600, ARM32) systems that were on 
> Linux 5.4 but observe consistent UBIFS errors with Linux 5.15 and later. 
> The errors seem to vary; there is a sampling below.
> 
> 
> We performed a git bisect and came up with the following commit, which 
> of course is completely unrelated to UBIFS. Reverting it does prevent 
> the issue... Does anyone have any suggestions?
> 
> commit 33fc9e26b7cb39f0d4219c875a2451802249c225
[...]
> [    8.180486] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad magic 
> 0x101831, expected 0x6101831

Hi, look here, the magic number 0x101831 vs 0x6101831, the difference is 
the highest bit(0 vs 6[0110])
> [    8.189578] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad node 
> at LEB 17:64664

[...]
> [ 3739.678968] UBIFS error (ubi0:2 pid 13): ubifs_check_node: bad CRC: 
> calculated 0x9179af29, read 0xa760f4f5

[...]
> [10412.723111] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad magic 
> 0x6100830, expected 0x6101831

and there, magic number 0x6100830 vs 0x6101831, the difference is lowest 
bit(0 vs 1).

So, I guess the crc error is caused by the similar reason, maybe there 
is something wrong with the nand driver or flash? According to the 
version information(5.15, and the unrelated commit 33fc9e26b7cb3), is it 
possible that there is a compatibility issue between your nand(bsp) 
driver with kernel nand common layer(which from different versions)?

> [10412.732436] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad node 
> at LEB 13:60248


