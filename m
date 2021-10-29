Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3197243FB46
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 13:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgfxs0lhBz2yS3
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 22:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=KqemwPd8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.96.133;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=KqemwPd8; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2133.outbound.protection.outlook.com [40.107.96.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgfxP5KhHz2yNC
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 22:15:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwY2G1ptbBrs/J+nNoyJQ48/nkNcoQ1HbSbL2jNWEXOrj9UygWCSZmWmJ0vfYgtHE4f+h3ZqENZSfRcQ5CQUymEbTnIueQ5RAmS9UbRmkWGODr3raCFB44btrm5+1BorSKeEjYW/fAS9mjXzkAPvoVKEQ27wOvUCSnHTf2iJEsn3tdUCUVWPaA/1C4B6DMzGgFqKXsgsiB4iewNm2jieu8BgelIx4Hp7pmPVuHS4l4zedPQl2co/JjeWAsfnonaJwDeZJbxIGo4+TfsooOnWRelMqC8ekvKpefQjfXUyPlffRQvXJfXHseL3hV1pZweXX1TI8dB8F7Ee/gBGtYn+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L+rMsa2LuIKU6gpd6uwi5Kk+o0/6uJH41qt4nhcHrE=;
 b=N89+MDXCjsHUR93DfMvqrUZ8dtY+E1kqXe7NijUBkHlinfegVYrE8Y4fVorrn48Sp3v0ateywLXnIlQ7tsk4FoROpWyLLMfEir2oynegKgJV1UjO1J50LD754MKxRR8Uq67bWXWYbpTGxnCWqjgfavZD80WJhv5YWrsva+U0UAfT3ZBzt+L632328YldhTqhoc1/4slIkKObTPoyT0nM4TOt6mZN1WC2M5gWn2y066ajd3JnlsITaTTrsO51rFl5DBTJylr4yK5M78EdzVkgwbAqmhUI1gWWoUMixyGOevdvj/qg8ej5SC9ffLWEx4SGsDaUd5hflOnnL4fmm8jnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L+rMsa2LuIKU6gpd6uwi5Kk+o0/6uJH41qt4nhcHrE=;
 b=KqemwPd8GygnQ1Xao+YwOGBspmON4te1Li70Up8OY7UaY+yuo3p/tGJ4tAft9yzgYj5+yYmHh4u4fhmJYTcT3uDk77lmwaXnr7rXUfQo9uhg6+xFXKYg8bme7F9+h8E/sWWR56Hs9kGw1knnXVOvLmCgKVmCt6SZYyyqrsuyMV0=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4277.prod.exchangelabs.com (2603:10b6:a03:5d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 29 Oct 2021 11:15:31 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328%9]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 11:15:30 +0000
Message-ID: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
Date: Fri, 29 Oct 2021 18:15:17 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Content-Language: en-US
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Subject: Fix u-boot 2016.07 env fail on 64MB layout
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.197] (1.52.37.44) by
 SI2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.6 via Frontend Transport; Fri, 29 Oct 2021 11:15:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 380e0d92-07c4-4836-c933-08d99acd6b25
X-MS-TrafficTypeDiagnostic: BYAPR01MB4277:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4277AA11777C336F69E800048D879@BYAPR01MB4277.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQGGBk27PwdkODxwBJPU40mHBGUJ1rTlswZyk572hwCjopJjTcDqUcq1E3cwDJL+palUoh9Mcp8r8mmIegX6RVoqNKF+4S+MAVh1dk3JiVcvXxf2e20nBhGagCv8nUibFFXE3dqyXD6bW8Fa4699F3QCZX+28YIvZyQT6Hpyw8u1KGT8MYlsXEKVk+ZvyBf6BYyfpf3ZD2ArkyBrpw1Aqg6unUuz17PrELxgiMJhldZ8fK0NllIJPdPOEYZq3zNf4uIRHLeZO4SnJs9+dSebAdw36cPRrPk0ub+PUjbrLyP1Y/7hpKWTVDBjREBX31lCECq77eEh5L3jCQmpyG3M1gUveYBXz8IstCztTD+7Bxc1L1vNnErXHEAEcUCwgkyXfAvMoblh/Qjon12xZDR0mfEHRaATeXkiD/LN0pZnp+Qbwzd7CXwsBFhCl5lp6c5oHZfR8Tt47Z376638g7E/23KctFLZ1gmd1Wrd60zXHQn2o3Nu9RDPAKJPGqBbmoOnOdvXXLgRPOOXtwko3qwmvQhnuj3GiTVZAMvINDUoK1Zde/uRxPgXbinWsV4BJ0LEpHIRK++XbYBzD50xaqJQF3gzqd+3zo7nibG+iKFsaxNmEdKDVa/zZsrilgPXtVsEzyQmpyx7Ivyd5V/1RWHdA0dXvFjuBRxi7ZEPFwFXk2tgw3FrrutKMMTC9iZa/4ShkmhtsQQqTLWSKp8P+BPDNhT1Tdr2JBm6YzSH7ls85n/XkKoXxHu4IBBKKvrxjUvZQ4wBqLAhkwAGqWcGJoZrRhhYy8CH8Wo8WOgWOIvcgn+WOU04JUZG/e+JkljdIQM1LYDCn3vD3XkVa74ufiDGy1xiwIlfwSGGE1zNOmeJI8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(26005)(16576012)(8936002)(6486002)(31686004)(8676002)(66556008)(4744005)(42882007)(316002)(66476007)(6666004)(66946007)(83170400001)(956004)(508600001)(38350700002)(38100700002)(6916009)(186003)(2616005)(52116002)(966005)(83380400001)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNTKzBSTEtwNm9iWUZwVGpkNjRxV1ByYU5mQWNFbmwyMGxQQTIzait3cHJN?=
 =?utf-8?B?ZHpxc1JNNHllQzk0L1BHL2VZQ0dITnJBWUdSbjdMOUF2TkRPTWRxMHRnNTJJ?=
 =?utf-8?B?c0VuRkpIQzQ1V21hMDNVYWErWlBwaXIxWno5UWtHa2lTbHo3Ti9vcE9aMURW?=
 =?utf-8?B?akpENDYwY3FWNzYvQVhpRVI2RFFHL1hnZTJJdFdUYXRNcEsyU1AzVkhHdXNk?=
 =?utf-8?B?OVBNcEVlekJYYVlqUE5VNmVEbUJSMTh4MzBKbDc3YzBET2VYRXBjRHpaTU5I?=
 =?utf-8?B?NC9JY2RWMWRJMzF5UVV0NUpJS0F3eHJ0blZocDNYU01yOE9Gd01uWHM0bkNJ?=
 =?utf-8?B?bTZXcVV0TzdaeWxvWlE2VFJTUzUxUFhmMjBrK3ZuLzJUOU1HdG5TcmZscUVn?=
 =?utf-8?B?Ui9MZ3hQN3dJdHBuSHA3NXNhS3lEdm9DamFxZzNhVndtb0o1QkYwZHBDM292?=
 =?utf-8?B?aVlkcWZiR1hQd3Rsc1M5ZDBSRENob0pEclhGZlNTRjIraStDemhjdFg5V2pD?=
 =?utf-8?B?R2ppb2xMU3M0N3loeGNSQS9uOEVaOWU3blkxc04rcThmVXFtVUZocDZoR3Nu?=
 =?utf-8?B?RnhuN3FhelpjZU5aTVVRVlBwL3NFb1hJejdUOWF5SHAwN0gwOVhLVThjemdM?=
 =?utf-8?B?ckFnb2g4ZGs0VlFpVjNNcGVBMGFLb1IzemhrTmpOVHJiK2pKYWp5RkVqeUVP?=
 =?utf-8?B?UXlaOUhHZ0NVZHhkZ2V4bUJwSEtId1NENEU4aDFXdE1uMnNneE1vNktRbnFV?=
 =?utf-8?B?d1J2WFFKSjBrRnB5WjhLZUx5SENBY1ZUNWd5K3RlR29PN294aENDNFh0SmRS?=
 =?utf-8?B?Z29EdDdOSzBLclN2cFFLQjJnR1YyYTFTNllVOUpCU0Q1MTZEaGlHcnZCaWZv?=
 =?utf-8?B?V284dFZwS0ZhMVVOcGk2WHZ4aktibEU0eHBKSTlkVDdwTDRoR3FZamNMSXI0?=
 =?utf-8?B?dWFJNkFGdDFyemY0QjI5UUg2Qlg0bUo1Y3ArVTdhTTIwWjAzZW4xblQvTzNu?=
 =?utf-8?B?TnpVS1Q2bmFtejZQSnNaY1NPZDNBcDdsL2ZVY1cyRkJYZVZkMmNtblJhU05w?=
 =?utf-8?B?RW93aUc5eUJwOTZIakZ6Zm1sN2EvcWp4Z2tVSThtVm9aejM1VFlGUUxHenYx?=
 =?utf-8?B?bFJUU0ZLb241S3VDR3pQaXB0d0QySDY5OTZISEZ1RXFUK3UxYWl6YkJjc2U3?=
 =?utf-8?B?dU9iLzk5eUZKdElIb2xTb08xZjVRbjhEeWMrRlhQcGl1VDVCL3AvalY2Q09T?=
 =?utf-8?B?UFphZFJteDRoL0czbVgxU0pnMnczb1RydDZMNDMrSTBxQTFUdmFVUVY4UXRs?=
 =?utf-8?B?SHdNNWRZc2ZPeVB1ejd5Z2gxc2FmaU4wWVdTbWF1RktKWlBoTjd4dGhBVzBY?=
 =?utf-8?B?WmluREhkV2lmZ1o1RDJlS1M1blRlR3dzUjhxYW56Tnd3cFJOZlZZeSsvK09S?=
 =?utf-8?B?RUl4eVFoaDE4Y1psbGdpVTBvb2R5ZWp2RnQ5c0RrbEMvZWVWTkhNWVFnZG9Q?=
 =?utf-8?B?S0ZlaGZXZHVWNEpURUhlODN1V3g4VnNRV1pVTzdzcTVTWXdBcVl1ZU10NTVJ?=
 =?utf-8?B?RmpKdVZ3b0pja25qWDBSc29pVnQrYlBlZHQvSGRuSmtmc0ZPZGNUSlNWSzNF?=
 =?utf-8?B?THVxbTl4ckIrcHFCMXVkcDhPU1B3d3dRS0pGVXArbWc3WGRUa21raG44c2FH?=
 =?utf-8?B?V3ZpWitPeEVHRG8wb0YxV3RVK0NTd1E1b2xDYmh3N3QrbjNJZ0dVMEZBV3lS?=
 =?utf-8?B?WXN3Q1o3L0hqU3RJTUNzRmtvakFaMk9YU2pmTjJGT3VrWEZ1NE9TVFFnQVFp?=
 =?utf-8?B?R0Nkb254MXIwY2Ryb3V4a3dDa3hERk12YzBvTVAwOWd1anE5S25na240dVVa?=
 =?utf-8?B?UDF1ZHh2QUZBb0VxMEI0Zm1EK05MeHVzNFhncDIzV1FZR3FHOFBsMm9hSWFK?=
 =?utf-8?B?RzZhNmg4cXN3MjYxemNxY2o4RzdieGNJaWk2ZGh0SWZoOG9nUVdmdXkwck50?=
 =?utf-8?B?cUU3OWdGQmpsVWxlYmdxVVBod0t5aHFvUUtMTFJxZjkrRjBKZVl6eDIyalB5?=
 =?utf-8?B?cllQeWk1WHhJUEpOOHlpS1lOMUxrdldIKzJLcmlqMzl5SVAvUU5LYzRzRzEr?=
 =?utf-8?B?azBFcVBoQkgwMHcvZUVNbWhtK0R0a1I2TE5IbFY4VHNkU0tDK25pajU0QzNU?=
 =?utf-8?B?cFFwNEtOTllZeUZqY1ZjdFY1T0o0TWtUVmZXYy9TRlQrZWR5N2RudCtkNFUv?=
 =?utf-8?B?QWdJMHp3R3BJNVRBaElIajNZb3FNVFBTMWdxZFg3K2JncTkxTHQ1UUhNMkV5?=
 =?utf-8?Q?fppIfIych8P5AXjVCq?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380e0d92-07c4-4836-c933-08d99acd6b25
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 11:15:30.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er6BmnO3uQ1ClHB6ixOAItDVgXnMRntOSNcz3hzepr13TciN6Q+SyY+L4AWs91ChM0DJhgA3Td0VFVGQxIhgDyBgiHRgiwAWA1EzVgj7dLbPEFaybSk8rmBRZfL4pwas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4277
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

Hi,
My platform uses Aspeed2500 BMC with 64MB SPI-NOR. Since the change in 
BMC SPI-NOR layout at 
https://github.com/openbmc/linux/commit/985c3f59cc645c397726ad4ca0872cfaf7ef2579, 
the patch 
meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0001-configs-ast-Add-redundnant-env.patch 
becomes incorrect for 64MB layout (but still correct for 32MB SPI-NOR 
layout).
Do you have any idea on correcting it for 64MB layout?

Thanks,
Thang Q. Nguyen
