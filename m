Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166C9D1BDC
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 00:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XskXc5JrVz3cTr
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 10:36:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.145.42 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731972972;
	cv=pass; b=HhHCsOoH0H+5C9qj0hfByOWxBXNOjJ0jB1g9ADaodgopaX9ZvvcJgF24JEBnmzHSRzXQ1jVexvvtF0gRz/uIuDcwkLws0WEVvgCWJUPz/cYRt2XOQ+wbScHL5TKpHQTyeav+ABUsJxL8kCIoLOKJMpMhvSXSOD2OdX7BWi9V9Pz7ej/EhJJUtTFls3mPRxQLntw51NDj6AfDHeKuAUtPnCEcepVNT/AYM5FdIlmkTE6JiyaBUUvWIIjq9N0t9C9Mmj1WvEI3Se+4cLRcMuo7QM8M/IfrhMUlgcT2pZNzYStNE7qTe82SOn5gOPTQCgCfojgfdK3hEijLDx7qksNT0w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731972972; c=relaxed/relaxed;
	bh=kcocklf+3lMcbUGuryqYVrn/RPgEeRU9NyqfjuDkLU4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DAYPewPXVPUOmBKgu7lrJxNHMHJkw+3aFtOPa59iS9TwhXUEYnPVImVmfRXh1VKss9s3jDiAc5IBsw+ZqdLLVwMae2/uV6IwF63Rrteuojlw7U5bL3kuEBu/nthWrKAxTHWDG3eZKOdMDoFGy7OvqVbsAUrZpaz1abrilzXqdkhzp0j+aHB1TTw6bAfqa3KZeeEC+RrJcA2fgyuzOTXiKMk/hqco2tx3YxPxsww56iIB2pQGuob+QDAPLcAHOniMM+4WK3pwbV5LW7iWMu1KbNdcUYZil3gtSsEf/Mon5ySkxEeNPR4HRDXXyomUsb7BCvDKg9B+DYviAmuxZbHVlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=L1gs5OYS; dkim-atps=neutral; spf=pass (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=6052bfac03=jagpalgill@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=L1gs5OYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=6052bfac03=jagpalgill@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 298 seconds by postgrey-1.37 at boromir; Tue, 19 Nov 2024 10:36:08 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XskXS6cp5z2y65
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 10:36:08 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AINRhBR015920
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 15:31:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2021-q4; bh=kcocklf+3lMcbUGuryqY
	Vrn/RPgEeRU9NyqfjuDkLU4=; b=L1gs5OYSsrvCy3a/kpbDohrajcMuzyt4/Yd1
	5sh0upnHgrT5gLew5+VL0l+7DPOsCxIaHGq2BI1AiDRLSBD7+UDmUBddeakja0iQ
	i3AO1KpQ8WFdsouWGozkMVwdwHHZosjVoeXCFLGVkQHY8m76q54ULUUI1hySdWP2
	VID/eW1RvFmK+SGjpkQqDJSeUxUVeEkC/gKRDVIFYU7PcQTYrqTU4pDuK23FFays
	wbvD/drMOEbq7Kbd+QTqfKGb6aPxulW6VQlubdJsSx2DNIrKdL0GqTcsVyrcbHn9
	69dgRSUqPxN10/Lc8Ndai6giMREs58d3hSycr9y4TwuNf/wJ2g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 430dyprgab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 15:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCJWZAcE8HwksZjjie/DltzQV0IZMv17bKhl+p/UdF4F8hPbd8b1pwDGcCvaaOV/Q28FnAxmwQ34/9/rE1B/gPsQ2PCN//3sUFblVwNofPRl5a/lGYP78F+B3FiO2/3mmLYihN2xnIR/YaQVaUKerx5ZvVSTHr+aOi4NahiFwfZD0msM1ahXUqJWnEl/twGXc4WrxQbwOcftYHhyQRxX6lvwihz44UEqIvA+QQ2b866mmVH7T7rJYVx9L4kPAJl/OsV57FTnUfDTwL2yU7fJNx12khMk4i/igF0i55cdolFrpQYqN20OUI0EdAjYpF5kCZwyo074+Qo9SHbprILeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcocklf+3lMcbUGuryqYVrn/RPgEeRU9NyqfjuDkLU4=;
 b=HOrzuBNKEe5oqnZxTK6ZQ4h2TRrjoWwhQiYAqwFxWnn+0qMoHpiFFM+8QPkPSS1y/fTngAN4e4oeoW7or7oqU0nePO8bsBqOmyUR4mZ2hpbcY2G/XpeDA5ppkNXOSV0QlakWE+zGSsQ28nxOzWiZHdQw/8h0QnbVpdvsEgmfyb1JUXtYmii3t5D47PxeVKj7Vk/p/Pyj2n23Gr66yrYgPyV5BzPcwbQwnh5RCkjNAFED0jUsozDGZ9rEKsDOnUA5oIZOGOQ2dVRXVmMZ+4lQoqK0/9rXCaGIrtUPOysFnqNNcUv/la5X0ingwqcaQaO8Rhp49UKQyzHcYfRe85pXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB5342.namprd15.prod.outlook.com (2603:10b6:510:1e1::11)
 by SJ0PR15MB4437.namprd15.prod.outlook.com (2603:10b6:a03:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 23:31:01 +0000
Received: from PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743]) by PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 23:31:01 +0000
From: Jagpal Singh Gill <jagpalgill@meta.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        openbmc_compute
	<openbmc_compute@meta.com>
Subject: Re: Enabling StartUpdate D-Bus interface for FirmwareUpdate
Thread-Topic: Enabling StartUpdate D-Bus interface for FirmwareUpdate
Thread-Index: AQHbOgWY8VseHPxTekKPAmk2+pt08rK9r8OA
Date: Mon, 18 Nov 2024 23:31:01 +0000
Message-ID: <5A454E9E-2291-4363-B1FF-8288E3592B78@meta.com>
References: <6A6A014A-8568-45CF-B8F0-199B82738B12@meta.com>
In-Reply-To: <6A6A014A-8568-45CF-B8F0-199B82738B12@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR15MB5342:EE_|SJ0PR15MB4437:EE_
x-ms-office365-filtering-correlation-id: a821cadf-e8c1-4562-317f-08dd08291057
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|8096899003|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?cVpGMWxqc1NSeUxjTU41TFJqdmladkZnMTE3SU52ODVCYkRyMGhhakdGMzE4?=
 =?utf-8?B?Y2p0TWg0UVB4S3NVNzlhbFFUOXNxMkg5VHNrczFGTGVKc0Izc29LOVE4LzJT?=
 =?utf-8?B?bk1KVjlRLzNENThSSDg1Qk9NRHFsYy8vMm1Qd3ZBdTU3YVBldlRhbnlicGFh?=
 =?utf-8?B?V05LSTk0Rjl4KzZCdFFvUU0vN3ppM0tFY0lhUnEvWnk5NmZmOWl1WVI2SEt4?=
 =?utf-8?B?VEtkNzJ2RW5vZ0d1Sk1pN3RGWDdCTU1GVit3aTg4enplTlZHOTE2bWFjaWd1?=
 =?utf-8?B?ejhBbzRNOTBrdTR5SU1OUnhZRTFOMTBjdk80UXV1UHhqdnhBWEVRLzdwaU5m?=
 =?utf-8?B?L1FoUXoxSHk4MVM4ZVppNUxaNjd3VmNQZ2J1dlNRUlVWVVhrem12R0R0N2Z3?=
 =?utf-8?B?UHZad3l1d0J6RnluWVM4OVNOWEczM3luL3dWZFdHYjRnbHVRbGZjdW5Tc1M5?=
 =?utf-8?B?bnNNZVZ2UkI2dU4vQTdFZ2Yvc20vOTFzTFZSK200UkExOSszZFRkd0xOM2RS?=
 =?utf-8?B?Y3Iwak10VVdvMVdMS1M0MTJPRHF1ejJWdCsvWS9GWngwSG1qN2w5RGozNmFo?=
 =?utf-8?B?UzgwODBLbWZFRE41WXFUblJ1SzljbGwwRmN1VFF1OFMxOExCdEVNVnN1MjVK?=
 =?utf-8?B?QXdHYVdRUS8vdmMyREtiV2xRbzU1WDhMK1NVVDE2cjBqVjNRbDZ0ekJJMk5F?=
 =?utf-8?B?M21ObXZoeU9ueEZuY2tXUzJyREZTaE1idk03STBCTzdNNWk5aURhVHQ2U1Z4?=
 =?utf-8?B?Z1JDU3QrOE9NdnVGajcvZVVKajhIcjFjV2VTbGRJbXR6UEVRMjhPOXhzZzNz?=
 =?utf-8?B?cExjRFV1OHpSa0h3cWw5YlJnWWk5eDFnU3RPN0I1cmdwejFTdVNPUW1pK0tJ?=
 =?utf-8?B?RTBOSUJNeFBpcU9ZMDhNRGp6TU1vZEg2MkxzWGhwaWNISUdRMU84ZzFDbE1M?=
 =?utf-8?B?UDd4cmlBUjhIUDFSTVNROHJVaDEvbzFtNE1lUGx6cmFFNjdqa01rU2NjMjZB?=
 =?utf-8?B?MkVnT0YxN3VuVzFQemZxUFVRRWlUK09oWUVLblFIKzlLNnQybUtsMXduLzM0?=
 =?utf-8?B?eklkT3JoWlVIczd1dzRKdHlmWlhRNXZpUHBncEE1cWgwemh3WEYrLzdyZ3cy?=
 =?utf-8?B?VnpCQVJjZ1Q0UXpTZ2syTEtpWUlBWFErL2JTZ1h2T3gzNFhLMGVSK2pHeE5w?=
 =?utf-8?B?NjRtNGVJWnlMZ0tJeWZDaS84WTd1bkVIbDgrVDBWeEVIZnZ1ajJhVGxLV1hP?=
 =?utf-8?B?MXlYNjdWQVBlMWdLaXNJcytxdXI0YnlrbXMzbWkxUWU4bmM4Sng0ZHUrT2gy?=
 =?utf-8?B?aEUyVzlkZzRRd0lVeWtMbnNaZTBxa0RMdEhuemFOdWVZSFJDNXdBa0hUc05z?=
 =?utf-8?B?NStNeGtCRloyMHdkSUUxdEptQnE1eHhnOFFReFREaHdXT1lRazYyNzNyUGhz?=
 =?utf-8?B?Wkx3TThCSDBmTU04T2V5MkxaamlSMk5icmRLbXYwN045NTJrK1VTMGovSkFu?=
 =?utf-8?B?L1pHNzR3S1NoN1VBZU5FSEFJSXF2aVc4djl0Rnk0dWVwMTdjUTVqdVRPMnl2?=
 =?utf-8?B?UGQzTzZDb2phSnBHQzN2dTd1VnFJWktoWWl0TXVhYmNHZjhqOUg5NnBJcWc1?=
 =?utf-8?B?N0xFc1lKM29zRGRkVGo5Nys1R0VoeVJ5WDNVUDRwUys4Mk1VQTBkQTBjNzZj?=
 =?utf-8?B?SUtXZkFNNzR2TEEyTmlOaU1EdkVweHppSVdWTmhVdnoySnZXNXZ1ei9SbXV6?=
 =?utf-8?B?MkVteXVWVms3MklmN0RLYytvVDFIN256WDJQUlhMaW13RFNwVHRDejBWTjJp?=
 =?utf-8?B?bXE1WXU5djY3Sm5JSklaUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR15MB5342.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ektvdWNZejJmalRsRDFtd0duTk9YenJJVkE4RzhWT0tIU0FwalJ3b2VkRzBM?=
 =?utf-8?B?UzIyakE1QU5idmdzYVY4ejFzejVMbmhNR0w3T2p2K3czOHc3ZWpFNWY3RHhN?=
 =?utf-8?B?YmgySkVZN1lhK2lFc3E2dkpCZ3Ixb2psM3pTdURhMS9RcjNKaTBWcUh6dXpU?=
 =?utf-8?B?OENaWHkxbWliWVd2NDBOOHpQcjVKUHorNHF3eFBWTVBEcEJ2elNScGdOcTRx?=
 =?utf-8?B?N2hibWpyTHRPRnhLN2VLeCs5QXhQREVsWEpkY0FkdVBxa2F2Umd2NjVqVk5l?=
 =?utf-8?B?QjR4Z0hoczd0NUs0MCsxbndWZDdjUXlzNGpXcU5CQ1JFYjN1YVEwc1lLVUhp?=
 =?utf-8?B?bEpxVCtheHJqaFB6SHhLS1JjTjRtU3R6YmZjd01STG9IbHFNRGN6T2k3aXVo?=
 =?utf-8?B?UTBSWlc3ZW9ZL2pLSVZ5YVVpZzJoM21ZcjlwK00rOWFBbzRKZXM4dmFFK1p0?=
 =?utf-8?B?L1NwS0VUYWd6Njhnc3ZIVVlSWS8yNStDVTVjT2M3RnFjdE12ZnNTdHRMekRO?=
 =?utf-8?B?TUhhMEVpTXVySmdxd1ZtYmZXeTZNcHIzUlBmbUd5SGJ0RmE5REVaL2dzVCtD?=
 =?utf-8?B?STlqRjk4Y3hnMHpGMURCZVdzRkkyT0VzblBFMDM2SXd1WEtpemRjYncvR0No?=
 =?utf-8?B?MGRvZVlQNHEzaHVZand5NTJITnpPblJxV0o2RUYwZmlCTldKdmtaTGdQckMx?=
 =?utf-8?B?V3ozU0ZhanBwUjFZMWQ0OHQ0dVBjWUEzdmFiNzdGeWFQbi9IMjNmaUQrb3I0?=
 =?utf-8?B?L24vNDQvdnB1ZEVDYlVWTXBtTXRZWERHRk5tdXliWjZmQVl3SFJ3bS82cWxs?=
 =?utf-8?B?aXZoNjJRajNVeDdNUkxsQjNHL09VTjRkQ2xFbWIzdEo0akJCTE9SSHJZZm9X?=
 =?utf-8?B?eVl4R0xMQTN1VVlsdzRJTlBRNytUdmdsU3g5RzV6alpJelMrYm83QVZxUTZ0?=
 =?utf-8?B?WVJYb1NDL0hFTmZ4aEtWZ1FLN21jUE4va1FNVnJUVitvTDhseHNOSEhIaHNB?=
 =?utf-8?B?ZnpQTVNOcTNkTXVXdis5Yk9wNGEwSXovTldGMEhNUjZqZHZhWWhJRWZ0Z3Bl?=
 =?utf-8?B?VkVQTGpadDA0REpmZnBJeW5CQ25yR2JQSGNsR01CZHptWC9VVksrMlNNWGtI?=
 =?utf-8?B?Wm9nQWZRSWhDR29xdzdvK3BaLzlKV1luUWZSZjJUTEo5NVFBYSt5OSttTGRa?=
 =?utf-8?B?V3lBQW4yc3ZFZ2ZNb2VoZ0JXQlh0WHJOUXM0VzdIUWJvMEpLVlJSTXBZTU5m?=
 =?utf-8?B?NWh2ckpKa2l0TytFd0lTUThaSUFnZjlTaDlTSzJVaVk3Q1p5RXJPWkdiMmgw?=
 =?utf-8?B?cDNXZExRRTlTZVgyTmdadk5iaXptdndPOG81R05idjdHWEpxNWxjYkh0UVpQ?=
 =?utf-8?B?UWtERTdReUVmb3oxbjdSU0RTc2JJMlRkZWFxOHc4TDROU2xBRHBvUzdROGRF?=
 =?utf-8?B?a25Gb0hIQnViVVdtY1RKZGdFN0RGcFhhUmQ1RTNGSUczL293NFNwSzhtc0Y5?=
 =?utf-8?B?aGlUSDNTc2FTR05VKzROSE8wcUN2USsyZWJRdWNZQzh6cmRPSk1rRU9Bc2Ro?=
 =?utf-8?B?aHp1bHZjWGU5K2tzTjFqN2tzZGZqb0tQRWRDOVhjNFlBajNCWjdFcjVLT1ZZ?=
 =?utf-8?B?VkhpOTBEVWI1SmVONXB6dG1TajdFMlFYSVh3blVKYnA4OGlUU0xHejZYbHVn?=
 =?utf-8?B?VUR2RytkS2NLeXBYMWhKcDlLdEZqZ2JnNU1NRnlkUnJ6ZTU5c1kwYnM3SWN0?=
 =?utf-8?B?SC95Ukd2M3VTb0ZuUmVxalVtMlVFWW1tS1NocGd5c2RUVkV3SURLSzAvQWdN?=
 =?utf-8?B?RldIejRqUGp4N1c2Wk5GUG5ZN3lNUXc4M1NOVGI1WHoraC9wVjE5UkRpdWlw?=
 =?utf-8?B?aW1Na09iRzBmQnlZZmI3VTI3UW5vb2xGZ1g3eVVWOEdORUNoM080UUgvZVdH?=
 =?utf-8?B?SjlJbkxld0JURmswWjgrNW1mdnBjekZObFVWK3Q0N1hiSm9qTmdXRGUyQ3d6?=
 =?utf-8?B?YmVtcVc2Tmp3M2JQRXFlS0g1QVgzaDU2dHJOdFJsQjZIMmhpTTBGUHE4elVV?=
 =?utf-8?B?dXNwcU9NSWRjcmZXTnZQL1RFK2VjY2FXV3k1RDlDRUpDVTdrMXlWN0VIK3RD?=
 =?utf-8?B?am1kMWs1TVg2anNLdlpsSjZJU1pZRE9RV0hrNzBScm9MbWpuT2R2Tll2NVVZ?=
 =?utf-8?Q?SUUp9TJm1hua6tk7AYxyEH8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_5A454E9E22914363B1FF8288E3592B78metacom_"
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB5342.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a821cadf-e8c1-4562-317f-08dd08291057
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 23:31:01.7150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AV6Md7vbPvIYtKA/EjuM9+5LjcrX8LzZgRzYEu3ZDo2lvgOKVQZRTtT8W+a9tHIPSMwcJF9yQyF/lJN2pPhciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4437
X-Proofpoint-ORIG-GUID: RyHm3rOEnach6cmnCoRq62UF4F6bG81a
X-Proofpoint-GUID: RyHm3rOEnach6cmnCoRq62UF4F6bG81a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_02,2024-10-04_01,2024-09-30_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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

--_000_5A454E9E22914363B1FF8288E3592B78metacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIFJlZGZpc2ggY2hlYXRzaGVldDxodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Js
b2IvbWFzdGVyL1JFREZJU0gtY2hlYXRzaGVldC5tZD4gaGFzIGJlZW4gdXBkYXRlZCB0byBpbmNs
dWRlIHRoZSBIdHRwUHVzaFVyaSBhbmQgTXVsdGlwYXJ0SHR0cFB1c2hVcmkgY29tbWFuZHMuIEJ5
IGRlZmF1bHQsIHRoZSBIdHRwUHVzaFVyaSBjb21tYW5kIGlzIHVzZWQgZm9yIHVwZGF0aW5nIHRo
ZSBCTUMgaW1hZ2Ugb25seS4gVG8gdXBkYXRlIG90aGVyIGNvbXBvbmVudHMgc3VjaCBhcyB0aGUg
QklPUywgb25lIG5lZWRzIHRvIHVzZSB0aGUgTXVsdGlwYXJ0SHR0cFB1c2hVcmkgZmxvdyB3aXRo
IG11bHRpLXBhcnQgZm9ybSBkYXRhIGJ5IHNwZWNpZnlpbmcgdGhlIGFwcHJvcHJpYXRlIEZpcm13
YXJlSW52ZW50b3J5IFRhcmdldFVSSS4NCg0KT24gTm92IDE4LCAyMDI0LCBhdCAyOjAy4oCvUE0s
IEphZ3BhbCBTaW5naCBHaWxsIDxqYWdwYWxnaWxsQG1ldGEuY29tPiB3cm90ZToNCg0KSGkNCg0K
VGhpcyBlbWFpbCBzZXJ2ZXMgYXMgYSBmb3JtYWwgbm90aWZpY2F0aW9uIHRoYXQgdGhlIFN0YXJ0
VXBkYXRlIEQtQnVzIGludGVyZmFjZSBmbG93IHdpbGwgYmUgZW5hYmxlZCBpbiBCTUNXZWIgYW5k
IHBob3NwaG9yLWJtYy1jb2RlLW1nbXQgYnkgY2hhbmdpbmcgdGhlIGRlZmF1bHRzIHRocm91Z2gg
cGF0Y2hlcyAgIzE8aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy5vcmcvYy9vcGVuYm1jL29wZW5ibWMv
Ky83NTgwMz4gYW5kICMyPGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMub3JnL2Mvb3BlbmJtYy9ibWN3
ZWIvKy83NTgwMD4uIFRoaXMgY2hhbmdlIGlzIGJhc2VkIG9uIHRoZSBkZXNpZ248aHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL2NvZGUtdXBkYXRlLm1k
Pi4NCg0KVGhlIGZsb3cgaGFzIGJlZW4gdGVzdGVkIG9uIHJvbXVsdXMgUWVtdSBhbmQgSUJNJ3Mg
cDEwYm1jIGhhcmR3YXJlLCB0aGFua3MgdG8gQEFkcmlhbmEgZm9yIGhlciBoZWxwLiBJbiB0aGUg
bWVhbnRpbWUsIGlmIGFueW9uZSBpcyBpbnRlcmVzdGVkIGluIHRlc3RpbmcgdGhlIGZsb3csIHRo
ZXkgY2FuIHVzZSB0aGUgYWJvdmUtbWVudGlvbmVkIHBhdGNoZXMgKGFuZCByZWxhdGVkIGRlcGVu
ZGVuY2llczxodHRwczovL2dlcnJpdC5vcGVuYm1jLm9yZy9xL3RvcGljOkVuYWJsZVVwZGF0ZUlu
dGVyZmFjZT4pIHRvIHRlc3QgaXQgbG9jYWxseS4NCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSBxdWVzdGlvbnMuDQoNClJlZ2FyZHMNCkphZ3BhbCBTIEdpbGwNCg0KDQo=

--_000_5A454E9E22914363B1FF8288E3592B78metacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D1A15C6773E88A47AF05E6CA2F7AA838@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQo8cCBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtdmFyaWFu
dC1jYXBzOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFs
OyBmb250LXNpemUtYWRqdXN0OiBub25lOyBmb250LWtlcm5pbmc6IGF1dG87IGZvbnQtdmFyaWFu
dC1hbHRlcm5hdGVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9u
dC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1h
bDsgZm9udC12YXJpYW50LXBvc2l0aW9uOiBub3JtYWw7IGZvbnQtZmVhdHVyZS1zZXR0aW5nczog
bm9ybWFsOyBmb250LW9wdGljYWwtc2l6aW5nOiBhdXRvOyBmb250LXZhcmlhdGlvbi1zZXR0aW5n
czogbm9ybWFsOyI+DQpUaGUmbmJzcDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kb2NzL2Jsb2IvbWFzdGVyL1JFREZJU0gtY2hlYXRzaGVldC5tZCI+UmVkZmlzaCBjaGVhdHNo
ZWV0PC9hPiZuYnNwO2hhcyBiZWVuIHVwZGF0ZWQgdG8gaW5jbHVkZSB0aGUgSHR0cFB1c2hVcmkg
YW5kIE11bHRpcGFydEh0dHBQdXNoVXJpIGNvbW1hbmRzLiBCeSBkZWZhdWx0LCB0aGUgSHR0cFB1
c2hVcmkgY29tbWFuZCBpcyB1c2VkIGZvciB1cGRhdGluZyB0aGUgQk1DIGltYWdlIG9ubHkuDQog
VG8gdXBkYXRlIG90aGVyIGNvbXBvbmVudHMgc3VjaCBhcyB0aGUgQklPUywgb25lIG5lZWRzIHRv
IHVzZSB0aGUgTXVsdGlwYXJ0SHR0cFB1c2hVcmkgZmxvdyB3aXRoIG11bHRpLXBhcnQgZm9ybSBk
YXRhIGJ5IHNwZWNpZnlpbmcgdGhlIGFwcHJvcHJpYXRlIEZpcm13YXJlSW52ZW50b3J5IFRhcmdl
dFVSSS48L3A+DQo8ZGl2Pjxicj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPg0KPGRpdj5PbiBO
b3YgMTgsIDIwMjQsIGF0IDI6MDLigK9QTSwgSmFncGFsIFNpbmdoIEdpbGwgJmx0O2phZ3BhbGdp
bGxAbWV0YS5jb20mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1pbnRlcmNoYW5n
ZS1uZXdsaW5lIj4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJvdmVyZmxvdy13cmFwOiBicmVhay13b3Jk
OyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6IGFmdGVyLXdoaXRlLXNwYWNl
OyI+DQo8ZGl2PkhpPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4NCjxkaXYgc3R5bGU9
Im1hcmdpbjogMHB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3Jt
YWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LXNpemUt
YWRqdXN0OiBub25lOyBmb250LWtlcm5pbmc6IGF1dG87IGZvbnQtdmFyaWFudC1hbHRlcm5hdGVz
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LW51
bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC12YXJp
YW50LXBvc2l0aW9uOiBub3JtYWw7IGZvbnQtZmVhdHVyZS1zZXR0aW5nczogbm9ybWFsOyBmb250
LW9wdGljYWwtc2l6aW5nOiBhdXRvOyBmb250LXZhcmlhdGlvbi1zZXR0aW5nczogbm9ybWFsOyI+
DQpUaGlzIGVtYWlsIHNlcnZlcyBhcyBhIGZvcm1hbCBub3RpZmljYXRpb24gdGhhdCB0aGUgU3Rh
cnRVcGRhdGUgRC1CdXMgaW50ZXJmYWNlIGZsb3cgd2lsbCBiZSBlbmFibGVkIGluIEJNQ1dlYiBh
bmQgcGhvc3Bob3ItYm1jLWNvZGUtbWdtdCBieSBjaGFuZ2luZyB0aGUgZGVmYXVsdHMgdGhyb3Vn
aCBwYXRjaGVzICZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMub3JnL2Mvb3Bl
bmJtYy9vcGVuYm1jLysvNzU4MDMiPiMxPC9hPiZuYnNwO2FuZCZuYnNwOzxhIGhyZWY9Imh0dHBz
Oi8vZ2Vycml0Lm9wZW5ibWMub3JnL2Mvb3BlbmJtYy9ibWN3ZWIvKy83NTgwMCI+IzI8L2E+Lg0K
IFRoaXMgY2hhbmdlIGlzIGJhc2VkIG9uIHRoZSZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvZGVzaWducy9jb2RlLXVwZGF0ZS5tZCI+ZGVz
aWduPC9hPi48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0eWxlOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5l
LWhlaWdodDogbm9ybWFsOyBmb250LXNpemUtYWRqdXN0OiBub25lOyBmb250LWtlcm5pbmc6IGF1
dG87IGZvbnQtdmFyaWFudC1hbHRlcm5hdGVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVh
c3QtYXNpYW46IG5vcm1hbDsgZm9udC12YXJpYW50LXBvc2l0aW9uOiBub3JtYWw7IGZvbnQtZmVh
dHVyZS1zZXR0aW5nczogbm9ybWFsOyBmb250LW9wdGljYWwtc2l6aW5nOiBhdXRvOyBmb250LXZh
cmlhdGlvbi1zZXR0aW5nczogbm9ybWFsOyBtaW4taGVpZ2h0OiAxN3B4OyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFy
aWFudC1jYXBzOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9y
bWFsOyBmb250LXNpemUtYWRqdXN0OiBub25lOyBmb250LWtlcm5pbmc6IGF1dG87IGZvbnQtdmFy
aWFudC1hbHRlcm5hdGVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsg
Zm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5v
cm1hbDsgZm9udC12YXJpYW50LXBvc2l0aW9uOiBub3JtYWw7IGZvbnQtZmVhdHVyZS1zZXR0aW5n
czogbm9ybWFsOyBmb250LW9wdGljYWwtc2l6aW5nOiBhdXRvOyBmb250LXZhcmlhdGlvbi1zZXR0
aW5nczogbm9ybWFsOyI+DQpUaGUgZmxvdyBoYXMgYmVlbiB0ZXN0ZWQgb24gcm9tdWx1cyBRZW11
IGFuZCBJQk0ncyBwMTBibWMgaGFyZHdhcmUsIHRoYW5rcyB0byBAQWRyaWFuYSBmb3IgaGVyIGhl
bHAuIEluIHRoZSBtZWFudGltZSwgaWYgYW55b25lIGlzIGludGVyZXN0ZWQgaW4gdGVzdGluZyB0
aGUgZmxvdywgdGhleSBjYW4gdXNlIHRoZSBhYm92ZS1tZW50aW9uZWQgcGF0Y2hlcyAoYW5kJm5i
c3A7PGEgaHJlZj0iaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy5vcmcvcS90b3BpYzpFbmFibGVVcGRh
dGVJbnRlcmZhY2UiPnJlbGF0ZWQNCiBkZXBlbmRlbmNpZXM8L2E+KSB0byB0ZXN0IGl0IGxvY2Fs
bHkuPC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHlsZTogbm9ybWFsOyBm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWln
aHQ6IG5vcm1hbDsgZm9udC1zaXplLWFkanVzdDogbm9uZTsgZm9udC1rZXJuaW5nOiBhdXRvOyBm
b250LXZhcmlhbnQtYWx0ZXJuYXRlczogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFz
aWFuOiBub3JtYWw7IGZvbnQtdmFyaWFudC1wb3NpdGlvbjogbm9ybWFsOyBmb250LWZlYXR1cmUt
c2V0dGluZ3M6IG5vcm1hbDsgZm9udC1vcHRpY2FsLXNpemluZzogYXV0bzsgZm9udC12YXJpYXRp
b24tc2V0dGluZ3M6IG5vcm1hbDsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46
IDBweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250
LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1zaXplLWFkanVzdDog
bm9uZTsgZm9udC1rZXJuaW5nOiBhdXRvOyBmb250LXZhcmlhbnQtYWx0ZXJuYXRlczogbm9ybWFs
OyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1udW1lcmljOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtdmFyaWFudC1wb3Np
dGlvbjogbm9ybWFsOyBmb250LWZlYXR1cmUtc2V0dGluZ3M6IG5vcm1hbDsgZm9udC1vcHRpY2Fs
LXNpemluZzogYXV0bzsgZm9udC12YXJpYXRpb24tc2V0dGluZ3M6IG5vcm1hbDsiPg0KUGxlYXNl
IGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMuPC9kaXY+DQo8L2Rpdj4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlJlZ2FyZHM8L2Rpdj4NCjxkaXY+SmFncGFsIFMgR2lsbDwv
ZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8
L2Rpdj4NCjxicj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_5A454E9E22914363B1FF8288E3592B78metacom_--
