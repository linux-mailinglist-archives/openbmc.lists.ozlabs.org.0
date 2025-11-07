Return-Path: <openbmc+bounces-856-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E3C41101
	for <lists+openbmc@lfdr.de>; Fri, 07 Nov 2025 18:39:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d35sC2lV6z2xQ2;
	Sat,  8 Nov 2025 04:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762537151;
	cv=none; b=QkWXTeQjIycXuPDBSqhesv8+OxvzeHSRK9MvotdaXUcxWKjkrEhiucCD6FjxA7/cjROITJ2gp26r5d23/BdwH02JW3vwEj89EdfrS6V1uE0cCug+0PnAKfEEXxREk69raQZJuu24gTh7P+jIobWBrNjLa7DH9Pk4BXqt0sz631YXc4986Qnhe82+2mALtThrPdCTwQDDP5QxexNTzAVxK3HpFteVjTsyCw8RISTRWSJHyyEZTo4ZvHqQL3x0g+vmwTEIH1W8EU5kUB72N6rKGDrelVX0bRmQ713DPjp2ytrib1qJPAJNjoQD/y0n0fVhjKnZ1LYiwmZTiNK1oP/fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762537151; c=relaxed/relaxed;
	bh=G3KZCle5tmyRJPBpYlgsCyOqKs6Rtd6ca8BnW3+kb7o=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fJdhDvI7Gke6B/ZZMsCKwZfluL0cfrm8hIvGtqbTuPMDVhJTAt3x4CZUjn0jsYsmcGGBng9qchSg2KnPvEsNpumlaVmn8bnIIA6OHoUkiZ0eQiPbshGsjQAEB8+2v07UZMN9CQdQm2utreGPcquOZH4wE12PKw1W/pZ4l5urEjaly4W4dyElPQvasT+sA8B1Nc4Cavw3Tvaq/SJlCGfU0HXNGvQGGYDLNNH4dr8+HfcsQB2m3zt6I+R86eXeRB3P981lNtkP7VJnYe88zXiDnt1sCO84ElPhTdx2gh6kj5QeP7anmGjI2c9hCwn+E0hM51/M+rVr4yUbc6b34NRuRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=re7PypcW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=re7PypcW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d35sB1bqlz2xQ0
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 04:39:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A787TDZ024476;
	Fri, 7 Nov 2025 17:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=G3KZCle5tmyRJPBpYlgsCyOqKs6R
	td6ca8BnW3+kb7o=; b=re7PypcWwE+ql/SaBUUFOQDQ5hs2+dsol36Lx/jhsbed
	ApBbDT1S6n5g9iVuw2Z7zdEF8LXm0g0JUYuo8WFwH6b21C2sJpTXLzS58uXpPgkc
	N/5cXBMVGDrniRE5NVuosdEST6oSMyVEFD8UXVHkv00pRwqx8/C5gfCSbDaoad7Y
	KWyfLG775o73tzSY8OFGpFddSEIpGTq/q6T9ybnfTT18aO0dHKzHn+zjf3YBdOHT
	r1yKnlH0E2LOm3/GXQWjgVTGSFH4Zx++bZmZlQCJqGnXKYd9lnu0QO87auKOlKTw
	U5SrClrsa65DBuN4lW+6DGF9g/tjWEfOeADc899aow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuxd0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 17:38:56 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7HVjlS030187;
	Fri, 7 Nov 2025 17:38:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuxd0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 17:38:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7G0lRv009874;
	Fri, 7 Nov 2025 17:38:55 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kuxjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 17:38:55 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7Hcspk13370034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 17:38:54 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91A7D5805C;
	Fri,  7 Nov 2025 17:38:54 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63FC55805A;
	Fri,  7 Nov 2025 17:38:54 +0000 (GMT)
Received: from [9.61.104.176] (unknown [9.61.104.176])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 17:38:54 +0000 (GMT)
Message-ID: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
Date: Fri, 7 Nov 2025 11:38:54 -0600
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mtd@lists.infradead.org, richard@nod.at, chengzhihao1@huawei.com,
        openbmc@lists.ozlabs.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        sethjenkins@google.com, adobriyan@gmail.com
From: Eddie James <eajames@linux.ibm.com>
Subject: UBIFS errors since Linux 5.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cXvgH3AkVFWNXh026KQ3aCzl4xTC8slt
X-Proofpoint-GUID: 1TJLb8w43kCNnS_g8sEEvgG_MzjT7_UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX8gi5XdW8DYF5
 18DcBrMPgMIXTg09qI1IhrS+69panatt+7wMvcDFyqBhzxKq38kwjUhzbN5klrOccchoQxsjM3o
 gnAvVuL/3L0hyQhKYWGdZsPD+0a+fHYSAKnVI2u8QNW8bpLmMSeM8F2GbCGKkIabowk1ZS3ejMQ
 tINzjvygHIGXU1B92OZRyA9ykDde9dlW1rgeOoHKPNsQbnsnYCHajuuQcB4ccNte14p3nFbVha2
 vViI5ZHaI/i5TO1NiDaEoSn1lc69SoCWPDHPeyFxkgSzsoxPF3PyDm6KHgkG7HDvxCUOjw5/JWi
 9wj4WomvpXoeIToOvMV6Lx5e1Gn/Kq2RBAkZhNup2i16meuJ+bItohCafNPE/hOh1p0z3lEVSQx
 H1b7IIHYCFTAoVxB1EQ7xwn8fipfCQ==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690e2eb1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=EsJ8aQFCCmnRt_eA2acA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hello,

We are updating some BMC (Aspeed AST2600, ARM32) systems that were on 
Linux 5.4 but observe consistent UBIFS errors with Linux 5.15 and later. 
The errors seem to vary; there is a sampling below.


We performed a git bisect and came up with the following commit, which 
of course is completely unrelated to UBIFS. Reverting it does prevent 
the issue... Does anyone have any suggestions?

commit 33fc9e26b7cb39f0d4219c875a2451802249c225
Author: Seth Jenkins <sethjenkins@google.com>
Date:   Thu Oct 27 11:36:52 2022 -0400

     mm: /proc/pid/smaps_rollup: fix no vma's null-deref

     Commit 258f669e7e88 ("mm: /proc/pid/smaps_rollup: convert to single 
value
     seq_file") introduced a null-deref if there are no vma's in the task in
     show_smaps_rollup.

     Fixes: 258f669e7e88 ("mm: /proc/pid/smaps_rollup: convert to single 
value seq_file")
     Signed-off-by: Seth Jenkins <sethjenkins@google.com>
     Reviewed-by: Alexey Dobriyan <adobriyan@gmail.com>
     Tested-by: Alexey Dobriyan <adobriyan@gmail.com>
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Logs:

[    6.450395] UBIFS (ubi0:2): Mounting in unauthenticated mode
[    6.470547] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, 
PID 64
[    6.478908] UBIFS (ubi0:2): recovery needed
[    7.299651] UBIFS (ubi0:2): recovery completed
[    7.304454] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2, 
name "rwfs"
[    7.311869] UBIFS (ubi0:2): LEB size: 65408 bytes (63 KiB), min./max. 
I/O unit sizes: 8 bytes/256 bytes
[    7.321399] UBIFS (ubi0:2): FS size: 5690496 bytes (5 MiB, 87 LEBs), 
max 97 LEBs, journal size 523265 bytes (0 MiB, 6 LEBs)
[    7.332661] UBIFS (ubi0:2): reserved for root: 268775 bytes (262 KiB)
[    7.339141] UBIFS (ubi0:2): media format: w5/r0 (latest is w5/r0), 
UUID 7E9147BE-0964-4405-8FC7-12EF85CF0943, small LPT model
[    8.180486] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad magic 
0x101831, expected 0x6101831
[    8.189578] UBIFS error (ubi0:2 pid 66): ubifs_check_node: bad node 
at LEB 17:64664
[    8.197309] Not a node, first 24 bytes:
[    8.197336] 00000000: 31 18 10 00 a3 80 84 00 05 00 21 00 00 00 00 00 
80 00 00 00 00 02 00 00 1.........!.............
[    8.214233] CPU: 0 PID: 66 Comm: rm Not tainted 6.1.130-0c9470d #1
[    8.220464] Hardware name: Generic DT based system
[    8.225299]  unwind_backtrace from show_stack+0x18/0x1c
[    8.230611]  show_stack from dump_stack_lvl+0x24/0x2c
[    8.235739]  dump_stack_lvl from ubifs_check_node+0x258/0x280
[    8.241547]  ubifs_check_node from ubifs_read_node+0x18c/0x280
[    8.247438]  ubifs_read_node from ubifs_tnc_read_node+0x7c/0x1b0
[    8.253512]  ubifs_tnc_read_node from ubifs_tnc_locate.part.3+0xec/0x1d8
[    8.260282]  ubifs_tnc_locate.part.3 from ubifs_iget+0xb0/0x4cc
[    8.266263]  ubifs_iget from ubifs_lookup+0x1ec/0x2c4
[    8.271366]  ubifs_lookup from __lookup_slow+0xd4/0x104
[    8.276654]  __lookup_slow from walk_component+0x88/0xd4
[    8.282017]  walk_component from path_lookupat+0x88/0x110
[    8.287469]  path_lookupat from filename_lookup.part.16+0x48/0xac
[    8.293614]  filename_lookup.part.16 from vfs_statx+0x60/0x12c
[    8.299517]  vfs_statx from vfs_fstatat+0x54/0x70
[    8.304282]  vfs_fstatat from __do_sys_lstat64+0x2c/0x60
[    8.309656]  __do_sys_lstat64 from ret_fast_syscall+0x0/0x54
[    8.315370] Exception stack(0xbfbb9fa8 to 0xbfbb9ff0)
[    8.320461] 9fa0:                   7ef33faf 0000000c 7ef33faf 
7ef33cc0 7ef33cc0 00000077
[    8.328670] 9fc0: 7ef33faf 0000000c 00000000 000000c4 00000000 
00000000 4ea70fa4 00000000
[    8.336871] 9fe0: 000b34a0 7ef33cb8 00090268 4eb44178
[    8.342060] UBIFS error (ubi0:2 pid 66): ubifs_read_node: expected 
node type 0
[    8.349459] UBIFS error (ubi0:2 pid 66): ubifs_iget: failed to read 
inode 15929, error -117
[    8.357903] UBIFS error (ubi0:2 pid 66): ubifs_lookup: dead directory 
entry 'work', error -117
[    8.366682] UBIFS warning (ubi0:2 pid 66): ubifs_ro_mode: switched to 
read-only mode, error -11


[ 3739.678968] UBIFS error (ubi0:2 pid 13): ubifs_check_node: bad CRC: 
calculated 0x9179af29, read 0xa760f4f5
[ 3739.688901] UBIFS error (ubi0:2 pid 13): ubifs_check_node: bad node 
at LEB 56:48856
[ 3739.696772]  magic          0x6101831
[ 3739.700480]  crc            0xa760f4f5
[ 3739.704362]  node_type      1 (data node)
[ 3739.708463]  group_type     0 (no node group)
[ 3739.712855]  sqnum          119441
[ 3739.716384]  len            1633
[ 3739.719660]  key            (1338, data, 11)
[ 3739.724062]  size           4096
[ 3739.727329]  compr_typ      3
[ 3739.730386]  data size      1585
[ 3739.733760]  data (length = 1585):
[ 3740.458131] UBIFS error (ubi0:2 pid 13): ubifs_scan: bad node
[ 3740.464115] UBIFS error (ubi0:2 pid 13): ubifs_scanned_corruption: 
corruption at LEB 56:48856
[ 3740.472733] UBIFS error (ubi0:2 pid 13): ubifs_scanned_corruption: 
first 8192 bytes from LEB 56:48856
[ 3740.490666] UBIFS error (ubi0:2 pid 13): ubifs_scan: LEB 56 scanning 
failed


[10412.723111] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad magic 
0x6100830, expected 0x6101831
[10412.732436] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad node 
at LEB 13:60248
[10412.740386] Not a node, first 24 bytes:
[10412.740426] 00000000: 30 08 10 06 10 2c cb 50 22 1c 20 00 00 00 00 00 
80 00 00 00 09 00 00 00                          0....,.P". .............
[10412.757797] CPU: 0 PID: 297 Comm: login Not tainted 6.1.130-0c9470d #1
[10412.764391] Hardware name: Generic DT based system
[10412.769225]  unwind_backtrace from show_stack+0x18/0x1c
[10412.774551]  show_stack from dump_stack_lvl+0x24/0x2c
[10412.779689]  dump_stack_lvl from ubifs_check_node+0x258/0x280
[10412.785502]  ubifs_check_node from ubifs_read_node+0x18c/0x280
[10412.791392]  ubifs_read_node from ubifs_load_znode+0x90/0x47c
[10412.797210]  ubifs_load_znode from ubifs_lookup_level0+0x140/0x2c8
[10412.803460]  ubifs_lookup_level0 from ubifs_tnc_locate.part.3+0x5c/0x1d8
[10412.810227]  ubifs_tnc_locate.part.3 from ubifs_iget+0xb0/0x4cc
[10412.816207]  ubifs_iget from ubifs_lookup+0x1ec/0x2c4
[10412.821312]  ubifs_lookup from __lookup_slow+0xd4/0x104
[10412.826599]  __lookup_slow from walk_component+0x88/0xd4
[10412.831972]  walk_component from path_lookupat+0x88/0x110
[10412.837423]  path_lookupat from filename_lookup.part.16+0x48/0xac
[10412.843576]  filename_lookup.part.16 from vfs_statx+0x60/0x12c
[10412.849490]  vfs_statx from vfs_fstatat+0x54/0x70
[10412.854253]  vfs_fstatat from __do_sys_lstat64+0x2c/0x60
[10412.859628]  __do_sys_lstat64 from ret_fast_syscall+0x0/0x54
[10412.865342] Exception stack(0xd00a5fa8 to 0xd00a5ff0)
[10412.870442] 5fa0:                   7e98d758 ffffffff 76ed8d00 
7e98d5a0 7e98d5a0 7e98d758
[10412.878661] 5fc0: 7e98d758 ffffffff 00000000 000000c4 0026a7e8 
7e98d5a0 00270bc8 76ed85a8
[10412.886871] 5fe0: 76eea084 7e98d590 76ed8250 4eb44178
[10412.893099] UBIFS error (ubi0:2 pid 297): ubifs_read_node: expected 
node type 9
[10412.900645] UBIFS error (ubi0:2 pid 297): ubifs_iget: failed to read 
inode 173, error -117
[10412.909019] UBIFS error (ubi0:2 pid 297): ubifs_lookup: dead 
directory entry 'tallylog', error -117
[10412.929539] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad magic 
0x6100830, expected 0x6101831
[10412.938710] UBIFS error (ubi0:2 pid 297): ubifs_check_node: bad node 
at LEB 13:60248
[10412.946635] Not a node, first 24 bytes:
[10412.946674] 00000000: 30 08 10 06 10 2c cb 50 22 1c 20 00 00 00 00 00 
80 00 00 00 09 00 00 00                          0....,.P". .............




