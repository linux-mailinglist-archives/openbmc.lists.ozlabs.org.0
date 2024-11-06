Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA879BF914
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKMC0Y27z3cJD
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730869144;
	cv=pass; b=MIm3CyS/VUtmyLXie8h2GNRCa/zukxE+Q2YwGKIoENtC1kEm2/9cgAEpWj5TBppOiVkaiEPl0LiTFsf6kfEyKVCJ/6Yn3k9/zCRE65DDXDuP8YLp7qITiruYli1lVCTE3iEAlO+My1lw+ejbusH6N/2LGmS4zudsdGtt+ChwUY1bryaB3m3RBrElQeoPx3v9D0C2WItiiPIToJaIgvJMhasQrar9Wr5rDsa19w5pwHa7NJ+pRgW2/DrqjZwX5o1ZCng5+M2O+mCiQ99Q0fqJMGpp817Tbmxx4wdY87x37ULocOhZRa0NKp1at2GO1GuaVsEB4eNTy3j/nlPvgEYmTA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730869144; c=relaxed/relaxed;
	bh=ecItwFS3ArFGhx0+GgJ8EYmCOPLfUXjdU/5P3NzdDRg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hwb7xbliz2EDN1GnLFw6Dpvai3opiYQlpps2VBn6hU5HXKHWmqsucof6JGPUr447mMT3Zu59PoYb4ahqmkdicarOUhzm5WHHHcAbi12hD281raGdeQmr2Dot8hd+cX+p+gsezZi2MoaVUYmIlHok5ee128IJxZ4WtGZLvS3At8X/3AwFx6Vj8o5G+keBrx/rEx5vFn2Y2kMwlkMkv3hmNAUWmDtAuiCHYjhGevyzh0birSogEtBcDRpXRHCIKipXM2IFVEgZ/7p2y7zPJQodMesLEEN6RGygqhaOFXwnBb+Sfao6gMAdJN3BLxxYJIWmSM/MeZann+FlYi1KPHWrQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=0k3q2/V4 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=0k3q2/V4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c101::; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjtK26jVLz2y8k
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 15:59:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brRM/B1HfozYV36hinOe0JCtggiOfHj4JXQbRPCRx3v3dPGShUGpptR7+IECbTHxPZcmXn0UWTocq390rjt/8Wrp5RG5NFgQgPgzQBgEqFyH5SaWh3Ice6yoYTpLS8k2RYB0EFpu5Qz++AYc8uXskF2xgz1SQpX1zz2fn1zsi4i0CbTSamDcQp/6VTJcGr/wMkOZyvFA/wM9enaocojw1l2Q1Uz33C6Da/+8bWZaRqMMb/0hGJiuhAEBzLphuojD5ojzbXDhXDQQlaMu4UlPVjJ/FkKyX7kfR2qNK8B6VwltQBGdbQ0fYk9WEY+iiQil8SjV5toicfXEsHGc0d7s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecItwFS3ArFGhx0+GgJ8EYmCOPLfUXjdU/5P3NzdDRg=;
 b=dlM7NZstDSdNBQGgYd90sWbRRgjkxmfpQ0kfPlN0/I+g3S7af8MWOiriJ1Z/+4KKAGYBjOllqff1cwJBlAdMehhWtCOMNh8BVhnOE7zZkD+2qqkl2EWyPeNz7mbSH/ohQgAkvtHbzBl9pdtFD1sX+oAiLXGb4Mh6rEydZ6NwbvjfiAgEllWxr8VrZBnOl4M6h1CtUzlcbqKcT+V6pd/E+jZlzcS6WCRq+OUJHG7nYad5KZKXE/3UbfxZxYfdoUZAo1jCyeI61o6c6PYvz0lPj9bl9j0NpLfbqwMNsIVtucEnSHek4FzXSCpnmn6WAW1ZN4cSMe5u2NwtLnBcNO9MTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecItwFS3ArFGhx0+GgJ8EYmCOPLfUXjdU/5P3NzdDRg=;
 b=0k3q2/V4Kcj2718AgDjsZ59Sn5RHPmxEUnYmpFWT9VFKt1MZvbOKh95Y9uwGPtf87M9lmHsB4Q3QLnO5TiUAYwPqWryC1Ckp9qlGKRkFZH/k6uM+PZXyg9lQ1DqD/SrbduMHJkii9/tn4NxAjkohnNZgaajPhKVTnPX9xt6DG/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 LV2PR01MB7789.prod.exchangelabs.com (2603:10b6:408:172::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.20; Wed, 6 Nov 2024 04:58:28 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 04:58:26 +0000
Message-ID: <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
Date: Wed, 6 Nov 2024 11:58:06 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, dlechner@baylibre.com, javier.carrasco.cruz@gmail.com,
 andy@kernel.org, marcelo.schmitt@analog.com, olivier.moysan@foss.st.com,
 mitrutzceclan@gmail.com, matteomartelli3@gmail.com, alisadariana@gmail.com,
 joao.goncalves@toradex.com, marius.cristea@microchip.com,
 mike.looijmans@topic.nl, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
References: <20241106023916.440767-1-j2anfernee@gmail.com>
 <20241106023916.440767-2-j2anfernee@gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20241106023916.440767-2-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|LV2PR01MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 1534e541-ad9a-47a4-f625-08dcfe1fa61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Umo3clRNUk5LZVZ2Ym1CV1dadmU1YWJzQU1WZnpiUktIWjVjajJPaFlmK2lo?=
 =?utf-8?B?NW5SckU3YjRjd1JPM3ZlYW5iYTIvajE4VjdidmpCUm85VEQvaGdKYUZqMEJk?=
 =?utf-8?B?ZzZRR2hveFpIOGlLSkNKM2dOTlpMeERya2FDQ0pYWGtOQ1F1bU9ZdkN3TXpC?=
 =?utf-8?B?VnpOTU1vMDhSVjhiUGdPN2tHdnNOM3pjZDRWOEZBUXZxSGJBL0IwSmpIUWhp?=
 =?utf-8?B?UE9Eb2p1Q2EyZ25uMERnUjF5b1ZsS2ZjcnV0eVphM3hOenZFNGFMRHFzMjJ6?=
 =?utf-8?B?Yy9IUGs0ekRybG5qRjBNak5zU2hKanY5SlFZQkoxVW9IcitTK1B1YlNwNThQ?=
 =?utf-8?B?NERzalcrdUhueDQ5QVFhY2tqVEhZbHhJUnVZb2ovV09qQ1pnN2MxMmZwdVpw?=
 =?utf-8?B?WU5qSzNweTJWSUkzQi9ZQ1RGdFV6TW1vcCtDeTdYUDUzRmRXLzloN3NGT09R?=
 =?utf-8?B?aXNUNXNwZmJEcVdhYVRzcUxGUGlqcGVnSkpDV0dNZnBCdm5HRnNveUpDZzRO?=
 =?utf-8?B?Mzh5Q3cveHJhYmloQ05Pd0ZaWHFjd3o4MnAzWlRIcmkwNFlpeS94RSthS05T?=
 =?utf-8?B?SE5oNk01RkJneDFRYUVtdnl6dVpJOXNoT2ZzZUpDZmwwdUdQUjZxV1FkRUx2?=
 =?utf-8?B?NW1IY3BYZEtCQ1MzbU41M3E5TjFEM29Oclo3cW8xYmRrMEdmUzFnM0VjM2lD?=
 =?utf-8?B?Vy9RajJWQmhTcmxlRlJsUW50cHlURnlqcVZOWG5NcWxvMGpZZlk4WUVkQzZw?=
 =?utf-8?B?Z0VqR0lIbVJ6OHBrWUdmTjVwR0lTeFdQQ1dOTWc2Z3RFQTBWVWgrNWtiWjd5?=
 =?utf-8?B?eENVMzFuSjR2c1dNdkMxd1RNOEt5RHZ3Z00xTHpESy9Zd3RSRnhMV0I3WHh3?=
 =?utf-8?B?R1ErZ1ppMUo2bFROWGg3bTVNeDJxWnRzbnFFR3dDT1hZazlIYjdDa0ZLTjJl?=
 =?utf-8?B?UFYyTlFZeDAxcXQ2TlhQcXhwQ2l1QnptMkhDdUVNL0V5ZnRMbWZraEMvMFI5?=
 =?utf-8?B?c2xmQS9ZaXZRZjFoaXFZYXVtYnY4b2VxNGI3YjRoMTlHT2NUcUJQNmdBTkx3?=
 =?utf-8?B?UE5pajdvTUtHVWlCOGFEbC9jLy9jOU9zMktTTFNVMEg1SmZyZTRoQk8xZDUz?=
 =?utf-8?B?L24wK0RzMzdGY3AxNGdmWUdvRWc5S05qT2ZQRTg2WVM1QjhhQWJSd3A5akRD?=
 =?utf-8?B?WGJaSldaUUtVRy9mUjNqaXJhcXJBNnRKOWRielcyL25LdE9qNkFiUWVQVzJp?=
 =?utf-8?B?THNmdUJsS0RxUDMvWXJFeUlVZVA3ODBvZHVUZXdjYnNVSU8rWi8vcjJIWGpO?=
 =?utf-8?B?eTRVYmNhSGF6WGZvM29uWHVLNWVFVzkyMUdzM2gxYU8rZkRjS25oQy80U1Ay?=
 =?utf-8?B?WEVMZkY1SUM1WlFITTlYa2xQUG1aRTVhVTd2M2lua3VWQ3dlZ01qd2p5bzYz?=
 =?utf-8?B?aXo3QVNUSlQ3eGZIVEpZQ3pIQis1K0tFNm9Cdkx1cE0xMUVBNmhMZ0tYbEVJ?=
 =?utf-8?B?ckpJU1k5UjUzcmJaRkFybXpMMk1pMyt3VTZEdldsY0FnT053a3g2OTBIdzNw?=
 =?utf-8?B?VlFSdkFPRDlMME9mYW1rZmZadk1VeE5rVERvMVdOdkxLNzY3Tmt2aHZSdmVU?=
 =?utf-8?B?YWVZeVhjZkt1azNaQlluWDF1eDNXN0lmMGkwWDBZUmJJSmNGUDRKTkIrRTBJ?=
 =?utf-8?B?WVdFMzlCNXVibWdpUjVjNjFEY2JtRE5zWXZtMVY1bjUvczlVcEZiRFZnLzBs?=
 =?utf-8?Q?brb4D36s5Dfu29HgWlX+pABfMScgj6vS67B6rdM?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WmltanVkM1NPOG93MWVUc0JWU3NLVGc3Rm54aUtBOG12em1BMC9kSEhRQncw?=
 =?utf-8?B?cFRxa0o2KzFMdS9kQURvWGhZajBUT2xNYURtcTIxU2VzU1pmdWhidW1IUlBN?=
 =?utf-8?B?M3ZkYWUybkIrQ2FQN3VCdFhvZFZNeUxHemtOdkxEbE9jZWhTSDJDaWRxNk4x?=
 =?utf-8?B?V25iL1E3cW9uQWxpRlBUci9pclNuN1p1S3BvQXNkRVFROThXZEpLQjhOKzlB?=
 =?utf-8?B?SEI1ay96Q2pTUzNDc1BLYVhtb01FdVlNQ3drRkFUKzFwaUx6ZlJ4UUpPYkJW?=
 =?utf-8?B?RTVRbmtLL2RTUFpaTDU2S2RjTzNtV0V5RVQrNE96OW1RTk91Zm13a1VlaXFX?=
 =?utf-8?B?LzUxdVFHRWtxZjRqT0NPb3pxWG50eTF2elVYNjVtK1MydUs3RUsyejJ1a0t5?=
 =?utf-8?B?KzN0QitOdnFxT1BoZkZVRGt4b2JYdFpxNnZqVmJST0ljYmhYOGhvOEtLYVlG?=
 =?utf-8?B?OXZjaUVXZ3pSZTFwRzU3L0dJVHlKeU8zcGsvdWJHZ3VNTkUwRnBXejRpZ1pH?=
 =?utf-8?B?VWNuYnpsRHZCa04wK013Z1pYZGs4Yk4yelh3R0dveGdLMkVvMHVUOTcxRXdB?=
 =?utf-8?B?VTUvTy8zMnV6d0VJNERYNGJkTHBQVUVvaUN3c0VxUWdnUjlTVThMT2VYY0dm?=
 =?utf-8?B?ZW5sVHV0QUg3U2dpb0RoRUIxd3U1UFdTd25naGxaNUI3dkNmZ0NNOGZIWk5n?=
 =?utf-8?B?MEpZMmlBM296N0lNc2dYY09lTmVLT3JGMlJsSlRpZEs0b3dpUjBhT3I0TlN4?=
 =?utf-8?B?STdHZGY2cU0rdlcyYWFEUmdyeDVFMllIV3EvK21Pd2NmWmh1LzRlNG1HMnZs?=
 =?utf-8?B?cEZkMXUvYmhIV3I1VS80NjVxTnhoNkJOUnNIdTlkZ2ZKM25reVpCbjhLbW1p?=
 =?utf-8?B?U21yNjZxQTN5eTcrWmxTd3VZcG84TWhDUjF6Ry9jN0t5cURpSml3Tkdtcm93?=
 =?utf-8?B?L01VOVlvcHVlMkp4UGIyZi96aU5yQkQ3TU8zQVBQWk8rZDM4aVkvSjlacHFH?=
 =?utf-8?B?S0RDSFJKNXhRSlJUdm1NeG9Zd3hVRmgrVGFPd2ZNTHhlTlp4dnBOWHp1M2VP?=
 =?utf-8?B?am5GVzBFdU55ak5lUk5XT1hmekhIWThWQS9XNlZyZXk1UjNXRjM5dGl5Q3oy?=
 =?utf-8?B?MkZLZmZUTVNDOFFUMm0vR2MwWGt0SmhtaHJNTlRtQjIvOGMveEFNMnZFdS9w?=
 =?utf-8?B?S3dRRVVMWjladk9kK2ZscHIzVE5maEhTUHR1c0tyS20rZ3FiTnA3eFR2VUd6?=
 =?utf-8?B?RlE2ZHdzbm5tTERGNXdWZHhQOWtyaUdFY2M2TCtEbDlZMDBtOVJPSGVRb09q?=
 =?utf-8?B?VHNLbHJoYkFadkpad0RqYU5RUFVlNjdUTkQzMzUxQWpJTW1KTG93WnVLYlZo?=
 =?utf-8?B?NUFybHJkKytwc0JvbUt1ZUNOZzF2OHBzQkVrY3pnaWFHc0hQRmdpQjlWQWZu?=
 =?utf-8?B?Wjk3eGFoTHFnaEdNV2ZhTzBmOE92dnJ5ak1vaUpTZlhwVGtBdGcrM2cvMGN6?=
 =?utf-8?B?azRkOVY0cVQrTkkvSDAyamQvUXFMMFovNURjR3g5dFFUek9EanVJT0cwUkdt?=
 =?utf-8?B?VEkwSy9qRFBGQVgxay8wd2lQUjBod1luY2Qzc3F3RlNGY2dtYmNpdTlPaHZo?=
 =?utf-8?B?M1dxKzJsdTd6SzRmei82WUlpUEpUWHh3bDhTQTN4MXFEaGQzTXRzbHVVZlYv?=
 =?utf-8?B?RnVKcjA2c2Y4cjRQMStWNFZXWDNaaEo2VUpMOWdQbHhKRjkrc1RCS1ZBaERH?=
 =?utf-8?B?aSt3WGF2RXdUYkNnbUpHV1g5NWtNL2tTaHVtaWJzUlNFdDhzRi9TUDlya0FB?=
 =?utf-8?B?OCsxSWdkTjRvY3AxZStrY0p6Ri8yOTRlcnI0Nkx5OWlidmNwOEZxbGd1czVN?=
 =?utf-8?B?QlJMbUlMWmdnTkRXaElWZFRLdml5RFNDYmR1M2ZyNFhaZ1dOT0JoT0kwOHNQ?=
 =?utf-8?B?dXg1VFg2TFNZV0p6Q2tSNW1OR1h0T0JKaEY2YllEY0x1eUpCZUhvOGNLS2o5?=
 =?utf-8?B?ZjgzRmcwY0h4MHNlUGwvU0RSOEJ0TUQ4cWdxWktoaWtxclBNWng1NmZWa2Z3?=
 =?utf-8?B?UlloWDdsYk1Eb0JYaEhYSnVoci9NN0ZNRjFRMGZmanZyZktMZ1k0a2l1WFBE?=
 =?utf-8?B?RU9RZmxhOXBLUEJOTXJyb2JmRGxBaGgxV3IxRDVwSFkyK3NaR0VaOHRFam80?=
 =?utf-8?Q?LSVrqUJQHUbpmpUevsTBnAA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1534e541-ad9a-47a4-f625-08dcfe1fa61a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 04:58:26.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwsETz1LsFukeZENNeretEVE/h635q5y/PsdTLaMrEg9s/ZDZep9oOnyT24h11JGTpTTYayRDHJuD7WXAPEnSCOADVxDLap5a48nkEYsJUa2O65tUng6iXot9Id0a+xT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7789
X-Spam-Status: No, score=0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 06/11/2024 09:39, Eason Yang wrote:
> This adds a binding specification for the Nuvoton NCT7201/NCT7202
> family of ADCs.
> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> new file mode 100644
> index 000000000000..3052039af10e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton nct7202 and similar ADCs
> +
> +maintainers:
> +  - Eason Yang <yhyang2@nuvoton.com>
> +
> +description: |
> +   Family of ADCs with i2c interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7201
> +      - nuvoton,nct7202
> +
> +  reg:
> +    maxItems: 1
> +
> +  read-vin-data-size:

Is it generic property or vendor property? I tried to find in the
https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings 
, but it seems this property hasn't been used on other devices.

If it is vendor property, then I think it should include a vendor 
prefix. For examples:

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/adi%2Cad7780.yaml#L50
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/st%2Cstmpe-adc.yaml#L22


> +    description: number of data bits per read vin
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16]
> +
> +required:
> +  - compatible
> +  - reg
> +  - read-vin-data-size
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nct7202@1d {

I think the Node name should follow 
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation 


For some examples that were merged before

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/adi%2Cad7091r5.yaml#L102
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/maxim%2Cmax1238.yaml#L73
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/ti%2Cadc081c.yaml#L49

> +            compatible = "nuvoton,nct7202";
> +            reg = <0x1d>;
> +            read-vin-data-size = <8>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91d0609db61b..68570c58e7aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2746,6 +2746,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/*/*/*npcm*
>   F:	Documentation/devicetree/bindings/*/*npcm*
> +F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
>   F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>   F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
>   F:	arch/arm/mach-npcm/

