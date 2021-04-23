Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7863696A9
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 18:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRfPn057yz301j
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 02:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=nUn4cHwl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.137.20;
 helo=mx0b-00154904.pphosted.com; envelope-from=joshua.giles@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=nUn4cHwl; dkim-atps=neutral
X-Greylist: delayed 6375 seconds by postgrey-1.36 at boromir;
 Sat, 24 Apr 2021 02:09:33 AEST
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRfPT5Pl9z2xZ2
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 02:09:31 +1000 (AEST)
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NEMSLB027952; Fri, 23 Apr 2021 10:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=BU6LikZXAZFUh+pCv1CxlK8v9CYh05dngAV2CjTs/38=;
 b=nUn4cHwl7jfPRoWJkOx/Xz66o/yVCY9/X/7pfqqnZlphE54EZcwkoZsdKXwDu43Kj9Wt
 dgpTwBDDtJkheqsMGKuKPi2/Xf0oNF5G2Xhj9aw9yTTV/00MtQyBqXEOcp5OM3TGsixD
 CrStFfeswZJ9XfMnmHYjlPZ+IQIRV2+GRENo9SmOmfjRly+X+m2hHmsihNH18Pjx5EOC
 Mc3y6X+rdmyqGTikynfyScezhjjjsZABK++wThiV5duTsyZ53kRtHdRL02qnz/tTS7li
 H8oabwLYS2OOMIYt5T6NzfmENfQVRQ6lj8aMX2gBkqBtPBoqhmeBj+wmGE0BdsoxDtfD qA== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 383177x023-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 10:23:10 -0400
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NEJttO128221; Fri, 23 Apr 2021 10:23:09 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0b-00154901.pphosted.com with ESMTP id 383fr5uvsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 10:23:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfCePHMEWLV8uWSGyF5SdvNzDL9UIPBDAAMQqDNeW5kKKCpZ33XoNuj/cQxTyY+vMAMUWO631SaNT+kypsGE3mjOcYdRw1U0ZgIpyXAASyij1gpq7mx8jGPuGeeIAbYvfNYDsKR8AO8S3IU439rJ2bbFFJbHmO/V7CrSgHyhHlaQwr3XZuja8kjj0TAQuC0wSBZBPq9dWfvXx9ShF41I+JcF0xW8mJH3Dejq08kFXqQD15GE9xK2pKdUPPf5/c7E3X2B6jgC6rldzqdBCH+XECOtXk3h1xXQHIcDiNOPJA2JSOS7+d0KkQq9TCCCVA0deWQeKgDTnhDNqQ2heLeSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU6LikZXAZFUh+pCv1CxlK8v9CYh05dngAV2CjTs/38=;
 b=SsFxZz74/Q4o2IWOU1zxfvvSuOqfPgdVDJ6TNFyJBSWOLGD/VPOTXKekMUI4ELdOxbFIEvk+Bj8pZ8AAbgAykgDb5gLQaEmJvHMK2vc+mR62FM/QjRDuPwF0BVmmZmVuncbeaW3Pra+ZB6Och5mY8GKxvIhTDu9u34BVuD+9CXQOJmmHYDjlekvqRmRaAVdPu/MdXfSg/qKk9vh6pgu2HXm2+pZ6zMQjwYXqP3So0foIxbLnI05kdkb1DVQweDsVg9cGFHgFKqSeUeXJps9tzjq3r0SS+Fj4OZP5L+GUPm1P5ZlmLCJBKrcgLWRkd3mInp8DiYPZ+dZZmHJB56HvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3561.namprd19.prod.outlook.com (2603:10b6:5:1df::25)
 by DM6PR19MB3884.namprd19.prod.outlook.com (2603:10b6:5:246::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 14:23:06 +0000
Received: from DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::c2:3406:6d12:100a]) by DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::c2:3406:6d12:100a%7]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 14:23:06 +0000
From: "Giles, Joshua" <Joshua.Giles@dell.com>
To: Ed Tanous <edtanous@google.com>, Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish Firmware Update: Host server actions required; PSU, BIOS, etc
Thread-Topic: Redfish Firmware Update: Host server actions required; PSU,
 BIOS, etc
Thread-Index: Adc4TCzQ8+x4eHZhRAWNdX36Z2Bvrg==
Date: Fri, 23 Apr 2021 14:23:06 +0000
Message-ID: <DM6PR19MB35615E928676F78225B4385595459@DM6PR19MB3561.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [108.193.65.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfa34454-12d3-4209-1f33-08d90663501c
x-ms-traffictypediagnostic: DM6PR19MB3884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB38847A338D9C18D6BA71F59E95459@DM6PR19MB3884.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BO1chivYawAGihLFxgHSYb6XFKbs6TnhS3DnD5JAi2Zo7L3gvFh2GmvVKK56Gqc59d1qJq0GW3gPHo2y4FuHmVXdwVxqVn4p8tH+TxW76Wz75FzBYH9ELyvgrt+oSis3yWG/sy50lwqwgFHsdRmXsorOT5enqCqyq/m7KFGbV6sGHh9hXjugP6UBJq8hIGaKkzuscypI72rdIKfW9a0eoLG0Cl5Ug5o8kwumacxfCpjNee4HgBcHeqppxhCIyZ6H+ArcobkmT/BCd8Qv/CPSuMIPkoyvdiQDTLDdR2TZQbPos6d7OJcPCA3JxFYJAacn+NKi9NvPThM1lipFGoQ890Nmq7Lq7YIJAeS9cM2pg9CtlSHho2FOPjegdtM2bfqWBDErdBR4wkR1Aw5grc36RKyS1e5zw3ga05208QaQ+BouHn8RY6SnXSafBtLZslljcxsWM3huCO6wMREITjBGLwoBFZt6hrWrHJ4ZcJX57MRuKWsvhFr2VtAIyAyuCsAVWZkrKf+JWPI1PV6XBNTwrmaDpz7aPyUhJvyZJ/Bg77Hyfy3/Ak9ev1j7xLDst5MD3wSTL2VRYUJDP7wUDVCRpZz2Fg9VmvLqlo5wAczvV98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3561.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(66556008)(54906003)(76116006)(66446008)(66946007)(52536014)(66476007)(38100700002)(478600001)(6506007)(8936002)(9686003)(71200400001)(786003)(8676002)(110136005)(55016002)(7696005)(64756008)(33656002)(5660300002)(122000001)(4744005)(83380400001)(26005)(2906002)(4326008)(186003)(15650500001)(316002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N0JoU2NNNmRaOW52YW1YbXdYUklVR3pISmZFYWR5TnlzdTBiOVZSMGg1ZEdS?=
 =?utf-8?B?QklsZ255L29sQWdFWUZoUnN5Ujg3ZUJIYW1zZ0VWMDdBQkovT3hvN2cwZHVD?=
 =?utf-8?B?VFVmbm4xeWNVdGZZSXhZbWZJM2lic05MbXlVek1FMHhjYmFsMHE4Y2VONnNy?=
 =?utf-8?B?SlJkc2tqV05NczFqTFJmcmJDNmxES2ZwT2YyN20wYUo4NDA3WEFxM1BORzRG?=
 =?utf-8?B?UnBqSEo3MmpWdDZtY0w0bHVCY28wTHhIeTdGWDBDOWF4T2ZVdTB1V3lpczlH?=
 =?utf-8?B?am1pYm85eHA4d0Q3eXdXNlpYU0NOSVdnZFdtTHd6enBRZWJxclgxUnJaVFpY?=
 =?utf-8?B?VmdkSGNwcEs4VjZhRFVpbXNja1lyUzlyTkZ1VnNBL0JDTnVjYkV0MWx5V1ho?=
 =?utf-8?B?RE9rdEhUQWZDUEk0U2wwdGxVNnR3WG1lSkY5eVZEbDRDelFMOXR4RHZYMi81?=
 =?utf-8?B?NlNIZmhpRUtyZU5nNGgzY0E0WkFrK09qTlVPY0dyTmpSOHkyVTJDclR0WVR6?=
 =?utf-8?B?Q0EyQ0dJeU1VdFVWdmRQRG4wZXZZc3RZY3pxZndRYUV3ZURRNVdjYnYvSVpP?=
 =?utf-8?B?ZDVDb2tsa2JiSThNK3NSMEYwcldxWmtPekhOL05QZklKbnJma0xaby9CUmRw?=
 =?utf-8?B?Z0JBM2FKQ1dPQ0JmVHV3aHAxTmIvY2djSGk3c0I5RXJnZzRERkNsWXRQdE5j?=
 =?utf-8?B?em9Sbkc1cDJTcVdKV2NPMzkyRk5WT3FLbnRuWXp1RnFEV2ZBekhMcG0wUlBX?=
 =?utf-8?B?cXdWdk53cks3ZS9pbmdqeUM2dWpmaXo2VVNiS2VEa0lyb2VuL0Ewb0k2WVUv?=
 =?utf-8?B?WFVNODAwOTc4eG1jRkExRWl2RVltYnhROFJ1RWI0WHhuSmxoc0JXVFlCK2Z3?=
 =?utf-8?B?YlFDTkFjQkp3OUJFbzNVeTZvQm5uU2FSN01veVRodVM5SXF3ajY2Qmx0U2pk?=
 =?utf-8?B?NkwyWGNOYmVJSEZnbG5lNEF2QTNkeVBrY3JVbjNKcWZlU3N4Z1FmWDh3aWoz?=
 =?utf-8?B?RVgzMjRUc0kvWXh6WjNmMXhwS3phOHhsV05Gb2tSNEZVTkFEQk9EYmZXU1lp?=
 =?utf-8?B?M2ZoUW95Z3RLV29taS93amE2RkFoeTIzZTVBaW4yd1ViYXRQUzZHUWs5ZGo3?=
 =?utf-8?B?MndGS3ZNeS9CanZsaWxXd25QWmJodjlEZ0lOa2hMS0ZQWFcrSzBIYUd0NENq?=
 =?utf-8?B?WXcvb2MrcURVbFNBcnBYMVFncDNNaEFBdDhQVi9lYnRSZ3BmU25leXJoeCti?=
 =?utf-8?B?MFF2TmhZa1JvMXZxUWdEcHl1alQzYnYvejc1NWZBUlhLMTZNQllPMmMvMmZJ?=
 =?utf-8?B?ejVKak5kWkJZUEFFalI0OUQ4MWdDenM2N3YzSEYyamdsWld4TklEaU1lTTNX?=
 =?utf-8?B?RkhDMzUxeFl4MTVKM0VDUmpJK3RIVVJxNG5LQ2kzTEdGdE1LSEVWN0xIL01X?=
 =?utf-8?B?SnJyNEVsbVBSdk4wWTB0a2dkWmZLUGJBV2l3Ynlmdzh2aEdzcjJWN3ZYeTFo?=
 =?utf-8?B?aFR1WmVYVlJIL3NiR1B0SnBJKzBnMzBxYjlidEJqUlIzN2tYd3FnczJGczY2?=
 =?utf-8?B?eWp4a3FtNHdTTXg1QjNkdmp2amRsejFFU2luMGdpQzNYQy85QWdUOHFuV3BV?=
 =?utf-8?B?aXVGOFoxN0F4bjFrVmtSR3E0T0RsS0dadEc3UTV6bWVVRG1OTEV0UEtKV0M0?=
 =?utf-8?B?aFoyaEFxUXhlcDgyem9KQ0hHT1oweG44UlU3d292bDdKd0hlNHFrVXYzcDhS?=
 =?utf-8?Q?/cl9glVwgi3vEp8vHckG5XMY5SLAN6pCAMEZnh8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3561.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa34454-12d3-4209-1f33-08d90663501c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 14:23:06.4915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7ly0CSyiMFnL9GGiLdSBadSDVE1I7YIlWpzbrmkSjqsgMPgWgoGQdxOrzdP80pkGdjsw8Z19yh54iVfXmiR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3884
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=909 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230094
X-Proofpoint-ORIG-GUID: XuPuKMbfRvbNDWWT4kfkKND-V82tJY5H
X-Proofpoint-GUID: XuPuKMbfRvbNDWWT4kfkKND-V82tJY5H
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230094
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
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Ed Tanous <ed@tanous.net>, "Rao, Balaji B" <Balaji.B.Rao@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gQWxsLA0KDQpJcyB0aGVyZSBhIHBsYW4vcHJvcG9zYWwgZm9yIFJlZGZpc2ggRmlybXdh
cmUgVXBkYXRlcyAoVXBkYXRlU2VydmljZS9TaW1wbGVVcGRhdGUpIHRoYXQgcmVxdWlyZSBob3N0
IHNlcnZlciBhY3Rpb25zPw0KDQpGb3IgZXhhbXBsZSwgc29tZSB2ZW5kb3IocykgbWF5IHJlcXVp
cmUgdGhlIGhvc3QgYmUgYm9vdGVkL3JlYm9vdGVkIGluIG9yZGVyIHRvIGNvbXBsZXRlPw0KDQpX
ZSdkIGxpa2UgdG8gbWVyZ2Ugb3VyIGVmZm9ydHMgYXJvdW5kIHRoZXNlIGJlaGF2aW9ycyB3aXRo
IHRoZSB1cHN0cmVhbSBjb21tdW5pdHkuDQoNCi1Kb3NoIEdpbGVzDQoNCg0K
