Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CF36B96A
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 20:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTYwb1lRJz302V
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 04:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=gn25KsUu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=joshua.giles@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=gn25KsUu; dkim-atps=neutral
X-Greylist: delayed 6537 seconds by postgrey-1.36 at boromir;
 Tue, 27 Apr 2021 04:54:23 AEST
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTYwH1bwjz2yxV
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 04:54:20 +1000 (AEST)
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QH3JbA031655; Mon, 26 Apr 2021 13:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=qxRSEsHTHlctgx6grBccZIQ+s6UowjzfTHF4GQOkcH4=;
 b=gn25KsUu5fHYlMUazHdP0jNWVnTjY6D5YQFJBMn1qyv9nvUPayx4OFEixULA2RXWLrOX
 fxti6yL4p+RIi279J3fjBdIvcIHuA2TssCKms9Q03k0HbdKYFJrZzfAMFIIOVIonWNzL
 YdRJ5mteOk/xkUkRCqsGD/SvjqoImjtbu+abfU6SWW54n+7mji9swF4tiOobSdbIa98t
 LD+ZNg5UZc2PN1c/a2+916rF9CyTEvXkjHWU4K9qcBF2jCnXUP1uuENz/k947+yWVdtp
 cT7o8eVzL3K7kcyLFq3N21xYtd7i/SuQaIjW6FoPEfeDUdsIxxHRS0/IWxC7U0JgJKmc gw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 384ed4dt0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 13:05:12 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QGuEW9123924; Mon, 26 Apr 2021 13:05:12 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-00154901.pphosted.com with ESMTP id 3850xxugxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 13:05:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJry048Hc9Wl3xPY+BnDVPm/fvTTG4nkzmOfR2FTzrLSaJz+FGFD/xWcf3szP8Wu8UpdaRTZkDgHvlYC8my0xJBT6aBUjQPb+j628T+nny5zTtXB5XGwzLH9TsKJZt1FfwJGecaa+Taich8EGPeK36hCUmaoK/JDasPc/Yag6ny4rSkeUnrhGWUPFAXuaJONacyJZ+l3fmCr0K4vAGkTpiyjUYVy1W2eOQ0lzZWdziiShKDfV/kHW9/bxI/UJLoyVwISc2vhG+lgzVYE6bwaaoM7pcVCIfEo1aWa0cCqJUG2ZybQPUk8B5yTT1ErgqsmLTQ1FsBm1S/LS3/gGfgp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxRSEsHTHlctgx6grBccZIQ+s6UowjzfTHF4GQOkcH4=;
 b=GTpVLN8HxnGrFKPuyPbMakwtuFULep04uahUayUNntBO/khHxUZqZmQjgcK9tFT5o5MbqXYs48wDZl9spiV/KZd61KRNbVMcRWMbrA4+vekbOyfz8PsFo5hCxbz0KvOMzikSoDbKtvXorjhRHiW1M0at96WXoDWiDQXO1NxgrD/uQMG+rl+HZlvLIYxxroRoksBH9+6JhsZFt5gwJ7J+Lc5zOneBekAlI8iC4GyDJNY8vQx9UAsET+1JMlQFleYXfEikTAVN2VXkVYl8w88hxPHQICQrh6JlA6LKPldzHj4FUQtSnu3QoyjsMVUOTekSdxETnOyXnNpI7J4y/FHT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3561.namprd19.prod.outlook.com (2603:10b6:5:1df::25)
 by DM6PR19MB3515.namprd19.prod.outlook.com (2603:10b6:5:206::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 17:05:10 +0000
Received: from DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::c2:3406:6d12:100a]) by DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::c2:3406:6d12:100a%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 17:05:10 +0000
From: "Giles, Joshua" <Joshua.Giles@dell.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, Ed Tanous <edtanous@google.com>
Subject: RE: Redfish Firmware Update: Host server actions required; PSU, BIOS,
 etc
Thread-Topic: Redfish Firmware Update: Host server actions required; PSU,
 BIOS, etc
Thread-Index: Adc4TCzQ8+x4eHZhRAWNdX36Z2BvrgAAtcaAAJtwPjA=
Date: Mon, 26 Apr 2021 17:05:10 +0000
Message-ID: <DM6PR19MB356114AF4E73394CCB4079FC95429@DM6PR19MB3561.namprd19.prod.outlook.com>
References: <DM6PR19MB35615E928676F78225B4385595459@DM6PR19MB3561.namprd19.prod.outlook.com>
 <bf864cd3-bea6-3e1c-e3f5-084b4831387a@linux.vnet.ibm.com>
In-Reply-To: <bf864cd3-bea6-3e1c-e3f5-084b4831387a@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=Dell.com;
x-originating-ip: [108.193.65.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7edbc283-e8d2-4fa9-e977-08d908d5731d
x-ms-traffictypediagnostic: DM6PR19MB3515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB35159A19C7CF9CEFD32F9E5995429@DM6PR19MB3515.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5xG/dOhFd3ZUSBUhv0q7k6DTwIZ2TKpb+iVzGmJpfyPzort2me2AB5Jqk8gZah8Dg9lmWoBCoRts4GLEcIZPYuEQrcpYNZaW9u3cS9e5R9RPB4BM3sanT6bxUxYp0PpZjOhiNbGlcmv2v17XHxJ7zJcKO56HGF4Ypm/VWFvXQyzzyugbHhtlSR99lwbwXRS80aB05tnvDEgNfXZayS6yzMqHuNVaoxhqGYVHanuQ/zX/BYrpfsAIlmFSGznpZYDALdLF1h+7HNNxmv5RW9v7zmBCellAve4riownRcfTWJsUTJro0r0Pb175sZq85CHxUmG3oglw0Ow/tPFGSdYsq1OZwFVBUOCom81Bo0V9ZrFg6GcQMEL9KrxWGSqXNkrlFTNPbgruNhgmD+UF5yX1oIv+PwR8qrDYAPrIsZQcnFqxxB5QAIVmpPySMC9UzYb1QfmsyNIKluXy4rUg1Wx46AYrXgI4ZRzvvIXP9J1e6Ieit8GGhYBxlZOb4s6Q22m8NP+xCuPygMUyd5NmxGN9pPPiRXJu6LtCTpoga1jUY9t6Xpe7oJmoa0LTvMizigwyKMRIqPLrlgM28ZAiMCfJ9d6fFRwzlLv0br2tBJQ2kCI2Pc/qMBrvCB7gSiEUKmYR1Mf2jYPNNmlY1BnBp8ZYsIMfIiAIELKpzt2Kirhyex8aO+0y2yuu9G7KvgtqH0gF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3561.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(66946007)(6506007)(66446008)(15650500001)(76116006)(83380400001)(4326008)(52536014)(2906002)(64756008)(966005)(33656002)(71200400001)(478600001)(8676002)(110136005)(8936002)(54906003)(66556008)(66476007)(122000001)(786003)(26005)(186003)(316002)(7696005)(53546011)(55016002)(9686003)(86362001)(38100700002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SDQ0cUdCYmZnWk82NVJNQ0FRaVF5cVNCREtHdzIwSmcxdDdRakVoVDlyTnB5?=
 =?utf-8?B?bE9SR3BLeUhuTmYyRzhCaDh0THZMOU9BYWUvUldFYjVmNzh4UE9HZTBKdE5E?=
 =?utf-8?B?d0s2dGFRZjBzL1VnMnNRdHRQMzExZjVYb01VWS9RTUpKRE8zRWRoRGZiLy9a?=
 =?utf-8?B?b0VkMTQyVTByY2RaT05TNDExK3VzUUxZY3NsK3hwVGN5NFUzdTJsMmkyMzFv?=
 =?utf-8?B?ZUNnWTY2MHNuREVwY2Zub1p0WUZOK1M2RHpFSDI1UEx5ekxQYVlhaXA0RGxU?=
 =?utf-8?B?RU9jS3g3b28xSTBsQThLYWdLNmZKNExwRk5vUXZPTGpLV3NFRkloT29rVXgy?=
 =?utf-8?B?Z2ZkRVEweEJyUjRjT2FsMm1OcElQWHBSZWdSdDJzTXBtVFBXM2xlbW14QmtH?=
 =?utf-8?B?RFNvM3o1RTQ2Z1RjY01Vdmk5RGJPU1M4OXRRbENmWklOdVYzMmFndzlKTXFV?=
 =?utf-8?B?cFpGZXFkVFJHNGlKRnY1cndTMWJTZ01JUHF4UDJIOE9OcjJCYmNsaFFkQnhr?=
 =?utf-8?B?aDBYWnZXSXp3RFQxbmlsZlQyeFNJaktPM1NPaVkvUjhQaStjd1Q4bm84TVor?=
 =?utf-8?B?eXd4QUsrTm96R0RpZnhKb3RORjhwS0doOWg3NzNpdkFHc3FxN1pkSWttOXAy?=
 =?utf-8?B?T3dRMDFrVFNDY2RSWG9YYVJSOFJFcWJPSStkcGhDSEowT1FKWnFYVVo1RUJX?=
 =?utf-8?B?ekZUQ2krRkJ2Z0Z0bEVQQWM0UkhNSTJoM1hOR0ZuY21KSjNCelV3NnV1THRP?=
 =?utf-8?B?dWRSTHNFUFgrNytzZlZnREZJdVhuSlA5SXppSjZFMlZ1K0Z4c2lQVTVWU0dy?=
 =?utf-8?B?bDFscTNsay9jWVVuOHVyTmpSUkxheWs3cDhnQUdpbGZmM3o2Q2VBZHhMb0Fi?=
 =?utf-8?B?QTNONjN4U2g0TW5Iek9YU2FiNU9rZXRZdHFOOXdIQlprYjlrTFlqak4rNC9K?=
 =?utf-8?B?ZE5CK0NPVVBVUzdCb3pYV2Frd3ZXUGoraVNPano2RXpGdEQzSnBEVUZGTjZk?=
 =?utf-8?B?ZlduWkQrbHIzR2RZdFlGV1c1YkZ5ZzVpU0FmZFBlK1AyZUFycDlGM0pFYWIr?=
 =?utf-8?B?NFJuQ2hFS3lHcE41SnhPaC9pcDhkb2pweXZmZ0ZMTWdFMmt0WDl6RFEwaDFC?=
 =?utf-8?B?SUM3RmJzdzEvVmI5b3BoQ1V5UVlRRmVxaGVpZHY3NUxZQ2MvQnFQa0t0T3VM?=
 =?utf-8?B?SHZMM0w5QjcvVC9NdFRDemJzek4xeDBySG1IVldQd1BVQVRlSmFaWHZhc1NJ?=
 =?utf-8?B?SFBRRjZXOEdNa1hmYjVJTHNQSklLd3Rza2JOSE8yZkFFSG5yTEtRWnREK3lQ?=
 =?utf-8?B?NGk1R25uTmE0ZCtWSmJZNG9BMEhERlIwU1dSaHZmb3VQbzcwNzVFR0tkRGxJ?=
 =?utf-8?B?ek9XOXBtdk9OWnVKQkthdW9XUVZaWEhOem9uaHU4bmw2Rk1UNjh6ZWRDSEhJ?=
 =?utf-8?B?bjByWjJ5TUtTWTFFLzNWbWwrMUsrUko3ZHZ4U3ZsakszZEFzYWhjdlVFMWJE?=
 =?utf-8?B?V2t1V0xBamdHZkpvN1pVYmRhQnJzVnBDaEYzTGVPK0QvRnI3NFlodnVQMVVO?=
 =?utf-8?B?aXFiaThjMkdlRTJ1RnRnYWlnUGE0dmZDWmVQeThjVG1sc0VOK085Y2VSOGNr?=
 =?utf-8?B?TTJVb0pRN0F2UTFhcWZ2Nis0aG91NFFQUnNqSzJiRlljai8yVEtXRzVsSTB5?=
 =?utf-8?B?WkJEMldRT2lzRXg4b0NTeGpGYWEvYzFab3J5WFJKLy9tWnBzdjNjZkJZbm9X?=
 =?utf-8?Q?HMJMR7Yj4YLmT1FrMMcmPAXs/suEiZaxZYsz1ra?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3561.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edbc283-e8d2-4fa9-e977-08d908d5731d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 17:05:10.0772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXbpzIqCM7Ee7oDooouhF03E4ySpQj9Mt54wtYSpDkfsQJgZF124Aed6mFKlzPjcTfbGIRaeQpy5guz5GswYRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3515
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_09:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260130
X-Proofpoint-GUID: gPne1fJXK3Ih6xglV7j2-r8kdpuCjS23
X-Proofpoint-ORIG-GUID: gPne1fJXK3Ih6xglV7j2-r8kdpuCjS23
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260131
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, "Rao,
 Balaji B" <Balaji.B.Rao@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VubmFyIE1pbGxzIDxn
bWlsbHNAbGludXgudm5ldC5pYm0uY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDIzLCAyMDIx
IDk6NDMgQU0NCj4gVG86IEdpbGVzLCBKb3NodWE7IEVkIFRhbm91cw0KPiBDYzogUmFvLCBCYWxh
amkgQjsgQnJhZCBCaXNob3A7IG9wZW5ibWM7IEVkIFRhbm91cw0KPiBTdWJqZWN0OiBSZTogUmVk
ZmlzaCBGaXJtd2FyZSBVcGRhdGU6IEhvc3Qgc2VydmVyIGFjdGlvbnMgcmVxdWlyZWQ7IFBTVSwN
Cj4gQklPUywgZXRjDQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gT24gNC8yMy8y
MDIxIDg6MjMgQU0sIEdpbGVzLCBKb3NodWEgd3JvdGU6DQo+ID4gSGVsbG8gQWxsLA0KPiA+DQo+
ID4gSXMgdGhlcmUgYSBwbGFuL3Byb3Bvc2FsIGZvciBSZWRmaXNoIEZpcm13YXJlIFVwZGF0ZXMN
Cj4gKFVwZGF0ZVNlcnZpY2UvU2ltcGxlVXBkYXRlKSB0aGF0IHJlcXVpcmUgaG9zdCBzZXJ2ZXIg
YWN0aW9ucz8NCj4gPg0KPiA+IEZvciBleGFtcGxlLCBzb21lIHZlbmRvcihzKSBtYXkgcmVxdWly
ZSB0aGUgaG9zdCBiZSBib290ZWQvcmVib290ZWQgaW4NCj4gb3JkZXIgdG8gY29tcGxldGU/DQo+
IA0KPiAiQXBwbHlUaW1lIiBpcyBob3cgd2UgZGV0ZXJtaW5lIHdoZW4gdGhlIHVwZGF0ZSB3aWxs
IGJlIGFwcGxpZWQuDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9waG9zcGhvci1kYnVzLQ0KPiBpbnRlcmZhY2VzL2Jsb2IvMzIzMDQ5Nzli
NDA0YzI0ZTMyZjE5NWQwOGM2NjdlNjViOWIzNDY5NS94eXovb3BlbmINCj4gbWNfcHJvamVjdC9T
b2Z0d2FyZS9BcHBseVRpbWUuaW50ZXJmYWNlLnlhbWwqTDEyX187SXchIUxwS0khd180a2pHUWpr
YzUNCj4gSldQWkxJY0U5UGNoRTRmZG9YNzdPajBJa3pTOHUyWWhaRTBPRFBTNjJkSHp2dF9ocV9m
aTYkIFtnaXRodWJbLl1jb20NCj4gXQ0KPg0KQk1DIHVwZGF0ZSB1c2luZyBBcHBseVRpbWUgd29y
a3MgZ3JlYXQuDQpIb3dldmVyIGZvciBCSU9TIHVwZGF0ZSwgb3VyIHJlcXVpcmVtZW50cyBpbmNs
dWRlIHJlYm9vdGluZyB0aGUgaG9zdCAobm90IEJNQykgaW4gb3JkZXIgZm9yIHRoZSB1cGRhdGUg
dG8gdGFrZSBlZmZlY3QuDQoNClNvLCBhcmUgeW91IHNheWluZyB3ZSB3b3VsZCBpbXBsZW1lbnQg
b3RoZXIgbWV0aG9kcyB3L2luIHRoZSBBcHBseVRpbWUgaW50ZXJmYWNlPw0KQXJlIHRoZXJlIGV4
YW1wbGVzIG9mIGhvdyBBcHBseVRpbWUgaXMgYmVpbmcgdXNlZCBfb3V0c2lkZV8gQk1DIGZpcm13
YXJlIHVwZGF0ZXMgd2hlcmUgYSBob3N0IEEvQyBjeWNsZSBpcyByZXF1aXJlZCBmb3IgdGhlIHVw
ZGF0ZSB0byBjb21wbGV0ZT8NCiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9mNThkZg0KPiA0ZjEzY2ZjYzY3ZWY5MDFj
ZDM5NzllZjdkZDQ3ZGE1OWRhYi9SRURGSVNILWNoZWF0c2hlZXQubWQqZmlybXdhcmUtDQo+IGFw
cGx5dGltZV9fO0l3ISFMcEtJIXdfNGtqR1Fqa2M1SldQWkxJY0U5UGNoRTRmZG9YNzdPajBJa3pT
OHUyWWhaRTBPDQo+IERQUzYyZEh6dnQxSUFQUHQ2JCBbZ2l0aHViWy5dY29tXQ0KPiANCj4gVGhh
dCBzaG91bGQgYWxsIGJlIHN1cHBvcnRlZCB0b2RheS4NCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9iLzgNCj4gZDFiNDZk
N2Y4ZDM5ZGIyYmEwNDhmOWU5MDA3MTA2Y2EzYTI4YzliL3JlZGZpc2gtDQo+IGNvcmUvbGliL3Vw
ZGF0ZV9zZXJ2aWNlLmhwcCpMNTc2X187SXchIUxwS0khd180a2pHUWprYzVKV1BaTEljRTlQY2hF
NGYNCj4gZG9YNzdPajBJa3pTOHUyWWhaRTBPRFBTNjJkSHp2dDRsUmlWZEokIFtnaXRodWJbLl1j
b21dDQo=
