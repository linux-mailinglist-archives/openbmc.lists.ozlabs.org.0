Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CB3A4311
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 15:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1hbH0Wnhz3btQ
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 23:32:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=I8SJBQXt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=079663bc00=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=I8SJBQXt; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1hZv4fw0z3093
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 23:31:48 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BDDsvr014363; Fri, 11 Jun 2021 13:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=NDoI20luWoNKLIbBy9XOOpj5oD8hdI0+88JAjzsSAY0=;
 b=I8SJBQXtcPRFutioHyPw/uVT8V2h0q3phQYqPRYC/xq3+2+lZ2OvQM/JBpj+DNsUV9xQ
 1Whce37XCe0xmGowYvHcjuD3asG+uSz2SnaPn09BLZnmGJTTAqdsz5gy5bOw52f3vhY9
 6eVbubrXwI4+kx+Ux2fyMGNzE/+Vd+RtkVZvjCC3OLZcb74mbkQPxboEwvACMUn/lWQO
 uo7DSjFFxFl/6BPhyhzqCNtZs5Q8YGshMwXK5+0HPlPRAT+3jmJifaTxHPFcz7iLMtAC
 R2vXdQ8ryVXLmqed5omZTYpyYjJWhSffL9r4wUVpI1CpQt3LNhjKQItXO9QbGLnmPLSw 7Q== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 3944fwhy42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 13:31:42 +0000
Received: from G2W6309.americas.hpqcorp.net (g2w6309.austin.hp.com
 [16.197.64.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id E86DB6D;
 Fri, 11 Jun 2021 13:31:41 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
 G2W6309.americas.hpqcorp.net (2002:10c5:4033::10c5:4033) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 13:31:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Fri, 11 Jun 2021 13:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsQSp1Dsc7pnTSJJW+Hcib/C/nCAF1rch3+lMFYJTBkny6/r5SIdDPhjx+Zg7vd2nJoObXJhFxE9OqT1UA9sGdE7q19KK7K51Ah/AQn0XdQ5YTa14T5EShxcDx+GlNOHfhACY5r2HrPRZRf4nTl3qkwXFbWppahJOxrS5+5gJpnfq7UjjlG3cfpbCCBaUTrCB3nBD0dhJkIMnajDIu8ran+qBXKLjEKQIe6TooGT0ONj7XHRwjTWdEPBLslbo7Wv9GGsGv08lsiCP2InnJfKDxJBYzUibtTmVvj/Lqk/p7Ty/LiWRMYunzyJyJa7nf8X/H2kFKQr6tWbCUqzjvwZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi/76anMTN43egHToITe0HOaCSmwWubVqC1v+J30EuM=;
 b=DfcMBBcQZiCLYDmGnGdUVG38CPiWSL2uUmwboYoJD+zP0uZjxGdl+wAFlnRDyn53gMD8Im6hcWUjZMiKeS7hrpsj4LYQxQQ8HHLRDQ9HMDmOGiz8wzTeB9OlI26wLYujnqo2OnH/J8AdWjMaW4viegskhG0de15TegCO77Zlufi+5Q8NxjA/DXRBL7XmKt/EsfOHs9KG3nFMnnuDC0laUQbDZL9qVIBrrOWN3DSgPKLkQOMu35aXJUWC223+LlZq/DDc97Vh8o5Nhh6J8gJYROVwLmTdbPvTe7lmOPM/miM2okOQVeqvqizNou2vSXZiEhu7+oNcjBdpyo3hPb/cKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB1129.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7611::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 13:31:40 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488%11]) with mapi id 15.20.4195.032; Fri, 11 Jun
 2021 13:31:40 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Subject: RE: RDE Enablement
Thread-Topic: RDE Enablement
Thread-Index: AddeNQks2n5bD9svT5WNVI3gUyZzFAAAqgIAAABuNjAAFUWKAAAN2/jw
Date: Fri, 11 Jun 2021 13:31:40 +0000
Message-ID: <DF4PR8401MB06345B74D9F70517688047C28F349@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAM=TmwVTAfesxeUodQwGr=3RSvR-7sXQAmF6j5_8Wa3S8fyq3Q@mail.gmail.com>
In-Reply-To: <CAM=TmwVTAfesxeUodQwGr=3RSvR-7sXQAmF6j5_8Wa3S8fyq3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.217.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13910d86-f3cd-4466-3169-08d92cdd3eea
x-ms-traffictypediagnostic: DF4PR8401MB1129:
x-microsoft-antispam-prvs: <DF4PR8401MB11292340A7FA0DA85743530F8F349@DF4PR8401MB1129.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brNXbUTJF5ExSVgLsGEkFlRPoMdY18S1WyjHKesD1WLhFHuMaO7voB+ib7jouwgmgV0VBLBAwRatxh0DUBNUsd0ip6VrMBeUPugWsmQsUS+kmcVyodyc/j2IRir/+MsI/gZHXlN2bQvxw+MA1k85cGN4Rxr8FXhB2TB9t4U5974gLPDP2a12Y51AL37zcmwZp9/Xr4fChbcmgVovTNGm0CWLutbv39LxLOWdV1qZX3ivO6Xbwlp+VTSdhUtRTBrFXlDLXvskV+6hYlvK2JZhmWrXXvg3q4bPGXyLbN6iY/lS4t/sEoTq8O3JwRH6pMl3RTxI7RRoT/XwtCmRaqV17vnsZdM1NVPWqyeyHQhTBwv67QyyBIZpkzaf/SN4zWgP4EbW1GoqwIDRfDHniYdnfRSvdas/lJdzlMMWTmKuXRo3jLNFkJBb8ih5qbdBBDbeoF1nHDDic6g1xy8qCn/8U4E/sNarhxKeevFCPtIJW8Kg5EYJY++nfYdqxLSoYCJArrQAMhq4/PL4MlKNUnM3aKAOJjTW62P2yyIYHq3T6246kej2J6VbMke94b0NRZpYAdU9mmYyFwM0cFxuPKKznHLqG0d6OK0EqC3UxgSBW9akc+LMTuf1hEXSLMuPVt996OoAvWwavbvTUNaJq9S3cMQgJv9Vaal1HpIkFI6XgaetnlNnICiF3uO2dVzaRlXbClQiJiijtomNYciG02H/Xrvgq0EE/Q/mkhsNnh8Upm4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39850400004)(366004)(136003)(376002)(2906002)(478600001)(9686003)(6916009)(3480700007)(71200400001)(4326008)(7696005)(52536014)(33656002)(55016002)(6506007)(186003)(8936002)(86362001)(53546011)(55236004)(26005)(76116006)(5660300002)(83380400001)(966005)(66446008)(8676002)(7116003)(64756008)(66476007)(316002)(66556008)(66946007)(122000001)(54906003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmcrYUNGZUxmc3dDTUJSK2FjKzVqQUJMZStxY2dMTk1rNkhOVTk1WW44emQ0?=
 =?utf-8?B?RjZybFJvT3gvM3JOUVlpZWczek52L1gyZDRKSFFJMGFxUi80SU15K0hrVUc0?=
 =?utf-8?B?K3RSUmtZaEU5ckl2ZXU5cGtkWERKallRTUdMY0E1WlQ3UjZDS0grbEl0d2Nj?=
 =?utf-8?B?bjhId25KaUY2ZFplcThkZUovS1Eyc0IyUXowWWZtMklnQVc3UndldWJLN1dU?=
 =?utf-8?B?Y3p4RUlsQzNTeXBOWXQ0VU9YRGhJc3Y3Yld0dmh4c2xuNDBqbVhySUs4Zzh5?=
 =?utf-8?B?VVhtZkZUUWprWHB5WHR5RnpGSFBMMGxLeVFEYmd1SE1SMFc4TXVGYi82a1hw?=
 =?utf-8?B?NVFhcW80eHY3NkJuSzhBQm1ocXRyWmFGYktnUmZZc00ycE1RZEl3eExYVFBv?=
 =?utf-8?B?Njd5WElGSlBsUno1cEVZbGhxaXdOK0x3c1Yzb0pVT29BTlhWaFBYd3JkM2tO?=
 =?utf-8?B?WndqWTZ0WEplYUJPQ0NCMEduWnYvblpSaVJGVGZ5NE9jOFl4R2JHOW16WXZq?=
 =?utf-8?B?NlJzeWNGT2k1eUQxY2d0cG5FckwxdHY0ZVBqa2VDUDkzeS85cFRjUGdmQkVT?=
 =?utf-8?B?eFphallPTWVqMWtpQ3dOZUhtR2IzU1NMUDhJV3Faak9RcUcycG9kSFZHcEdU?=
 =?utf-8?B?dFluM2lOQWx4Z1VHZkdHZitLbXkxb0EvNkl2MWk2QTdTNWlVNTc5TlRBS2dh?=
 =?utf-8?B?akJXcTRYS1hCYk00NVgxOHc0ZlhhSjZNRHV6SHVlL28xbU5GemVRQ3pZWk5r?=
 =?utf-8?B?NnhjVEZwRWYyTGVkTWpGY216UUNkUHNicVpjRXcva2w1akVkYWpvSFJHeUt1?=
 =?utf-8?B?dnRTblZIZC9iWXpvZXkvTGhVNEdBRVltWXNTZ25BRkNCdVVHZUs1OGNkbXVn?=
 =?utf-8?B?QXo5ZFpaTFZlbHJtR0dPb3ZwZ2pYa3JWU0xyTmZWWElEYzJKaEkydHBjR2Zi?=
 =?utf-8?B?ZnNub2EyenduR29IekR4VXZQbGFJNjg3VTROTjluV1c3VXhRM3RPNjlCUHRX?=
 =?utf-8?B?TlVkU3NHejBPMkYwMlZxcDJyUmFWakZPSjZaWkE5UE92VDQ1VklxZWZCN0pC?=
 =?utf-8?B?WDgxaTNwVmNpblRhRjhEQzJzZlFRbkJHRkg0RnhVT3pBR3RoSUtxZk5HSzVZ?=
 =?utf-8?B?cGtocHRaZDI5WGgxS0doVWh1Q3RtdWVLaGZvbWg5blBtdnFlSDh6cTNqeVVH?=
 =?utf-8?B?ZEdTQU9ONndNMG5ocTJpVjZLUmhjcUFEekovNWNEOXY3RU90amMyRG5FK1NT?=
 =?utf-8?B?OTYzUEc3aG0zSkZsMng1UVJwYWJhNXFJcXhTa2dmcFVrdkQyQ3VPZU9qb1c5?=
 =?utf-8?B?ZndWUHJKUmdwbzVWNENWTHZsZk1RNk9OcE9Qcnl0MmQzUEVlRXViOVFxaFVm?=
 =?utf-8?B?aVpkcTAyMkZhbHNIQUphZjhvOS9NSlNVd1M1a25HRTdHdE1MSDZvdzU2T2Jt?=
 =?utf-8?B?RjNYazMxSGlkOWZMVzRXYnV6SUVud1U3KzRSL0gvUllrcEx3VDdRQkN5Q0dE?=
 =?utf-8?B?WU9ZTStQRGlBWm1VNFlyU2d1WVQ0RTFyUUJGMlRSWUJaOUkxK1MxbkpLVDk3?=
 =?utf-8?B?anEwMlBnVHZEQVlUZHhtYlpYb1FDeGNNbFU0QTk4UW5ZRXRSQmpTcUNlSHpx?=
 =?utf-8?B?eHAyYlExdlhDREhuOVJIZGpzMTRjVHN3V0FPRDRBY2oxUHpocVZFMk5XdGVy?=
 =?utf-8?B?NkI3VFdoV0tiQWMyYzAvT2NxeG1aa2dEQk9ORWZZWnB1SVRXTjk1VDMrVHpO?=
 =?utf-8?Q?YrK/SOiZo5Hf3KnZwucgGRXY8xO5vZ/g2rzfxJ2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13910d86-f3cd-4466-3169-08d92cdd3eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 13:31:40.2426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcM7Y47XfSJOeXYu4DuIEHS2bOLOh6sfeCxFmRDtjCUkVP9sE8k7Onnb0DF+6fh+Bs+NHWQBJ3YVPepjzQinhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1129
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 4eeHvbgPfN9KioUoCYMkz4jgI1-K2BtX
X-Proofpoint-ORIG-GUID: 4eeHvbgPfN9KioUoCYMkz4jgI1-K2BtX
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_05:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110085
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRGVlcGFrLA0KDQpJbnRlZ3JhdGluZyBSREUgZGlyZWN0bHkgaW50byB0aGUgUExETSBzZXJ2
aWNlIHNvdW5kcyBqdXN0IGZpbmUgdG8gbWUuDQoNCk1pa2UNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IERlZXBhayBLb2RpaGFsbGkgPGRlZXBhay5rb2RpaGFsbGkuODNAZ21h
aWwuY29tPiANClNlbnQ6IEZyaWRheSwgSnVuZSAxMSwgMjAyMSAxOjU0IEFNDQpUbzogR2FycmV0
dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkgPG1pa2UuZ2FycmV0dEBocGUuY29tPg0KQ2M6
IEVkIFRhbm91cyA8ZWR0YW5vdXNAZ29vZ2xlLmNvbT47IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBSREUgRW5hYmxlbWVudA0KDQpIaSBN
aWtlLA0KDQpPbiBGcmksIEp1biAxMSwgMjAyMSBhdCAyOjI5IEFNIEdhcnJldHQsIE1pa2UgKEhQ
RSBTZXJ2ZXIgRmlybXdhcmUpIDxtaWtlLmdhcnJldHRAaHBlLmNvbT4gd3JvdGU6DQo+DQo+IEdy
ZWF0ISAgV2UgYXJlIGludGVyZXN0ZWQgaW4gUkRFIGJlY29taW5nIHViaXF1aXRvdXMgb24gYWRh
cHRlciBjYXJkcyBzbyB0aGF0IFJlZGZpc2ggY29uZmlndXJhdGlvbiBvZiBzdG9yYWdlIGFuZCBu
ZXR3b3JraW5nIGRvZXNuJ3QgaGF2ZSB0byBpbmNsdWRlIGFkYXB0ZXIgc3BlY2lmaWMgY29kZS4g
IEEgZ29vZCBzdWNjZXNzIG1ldHJpYyB3b3VsZCBiZSB0aGUgYWJpbGl0eSB0byBjcmVhdGUgYSBz
dG9yYWdlIGxvZ2ljYWwgdm9sdW1lIHVzaW5nIG5vdGhpbmcgYnV0IHN0YW5kYXJkIFJlZGZpc2gg
b3BlcmF0aW9ucy4gIEluIHB1cnN1aXQgb2YgdGhpcywgYSBzb2xpZCBvcGVuIHNvdXJjZSBPcGVu
Qk1DIGltcGxlbWVudGF0aW9uIHNlZW1zIGxpa2UgYSBnb29kIHdheSB0byBwdXQgUkRFIG9uIHRo
ZSByaWdodCBmb290aW5nLg0KPg0KPiBNeSBpbml0aWFsIHRob3VnaHRzIHdvdWxkIGJlIHRvIGJ1
aWxkIGFuIFJERSBzeXN0ZW1kIHNlcnZpY2Ugb24gdG9wIG9mIHRoZSBleGlzdGluZyBwbGRtZCBz
ZXJ2aWNlIGFuZCBoYXZlIGFuIHVwcGVyIGludGVyZmFjZSBpbnRvIHRoZSBzdGFuZGFyZCBkYnVz
IGludGVyZmFjZXMgZm9yIGludmVudG9yeSwgc3RhdHVzLCBhbmQgY29uZmlndXJhdGlvbi4gIEhv
d2V2ZXIsIEkgc3VzcGVjdCB0aGVyZSdzIHNvbWUgYWRkaXRpb25hbCBkYnVzIHdvcmsgbmVlZGVk
IHRvIGpvaW4gUkRFIHRvIGJtY3dlYiBiZWNhdXNlIHRoZXJlIHdpbGwgYmUgYSBuZWVkIHRvIGR5
bmFtaWNhbGx5IGNoYW5nZSB0aGUgUmVkZmlzaCBtb2RlbCBhbmQgc3VwcG9ydCB0aGluZ3MgbGlr
ZSBBY3Rpb25zLiAgQSByZXF1aXJlbWVudCBmb3IgdGhpcyB0byB3b3JrIHdvdWxkIGJlIHRoZSBh
YmlsaXR5IHRvIGRpc2NvdmVyIFBMRE0gZGV2aWNlcyBhbmQgYXNzaWduIElEcyAoTUNUUCBFSUQp
IGluIG9yZGVyIHRvIGludGVycm9nYXRlIHRoZW0gZm9yIFJERSBjYXBhYmlsaXRpZXMuICBJdCBp
cyB1bmNsZWFyIHRvIG1lIHRoYXQgdGhlIGN1cnJlbnQgUExETSBhbmQgTUNUUCBjb2RlIGhhbmRs
ZXMgZGlzY292ZXJ5IG9yIGlmIGl0IGFzc3VtZXMgZGV2aWNlcy4NCg0KVGhlIGN1cnJlbnQgUExE
TSBzdGFjayB1cHN0cmVhbSBpcyBtb3N0bHkgZm9yIHRoZSBCTUMgYXMgYSBQTERNIHJlc3BvbmRl
ciwgYnV0IHRoZXJlIGlzIHdvcmsgdW5kZXJ3YXkgdG8gbWFrZSB0aGUgQk1DIGFjdCBhcyBhIFBM
RE0gcmVxdWVzdGVyLCBkaXNjb3ZlciBkZXZpY2VzLCBldGMuIFlvdSBzaG91bGQgc3RhcnQgc2Vl
aW5nIHBhdGNoZXMgZm9yIHRoZXNlIHNob3J0bHkgKHRoZXJlJ3MgYWxyZWFkeSBodHRwczovL2dl
cnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9wbGRtLysvNDM0NjUgKS4NCg0KV2hh
dCBpcyB0aGUgcmVhc29uaW5nIGJlaGluZCBoYXZpbmcgUkRFIGFzIGEgc2VwYXJhdGUgc2Vydmlj
ZSBhcyBvcHBvc2VkIHRvIGJlaW5nIHBhcnQgb2YgdGhlIFBMRE0gc2VydmljZT8gSSB0aGluayBv
bmUgb2YgdGhlIGtleSBhc3BlY3RzIHdvdWxkIGJlIHRoZSBSZWRmaXNoIHRvIFJERSBicmlkZ2Ug
KGFuZCB2aWNlIHZlcnNhKS4gV2UncmUgYWxzbyBpbnRlcmVzdGVkIGluIFJERS4gSSdkIGJlIGhh
cHB5IHRvIGRpc2N1c3MvcmV2aWV3IGZ1cnRoZXIgb24gdGhlIE1MIG9yIG9uIEdlcnJpdCAoaWYg
eW91J3JlIHBsYW5uaW5nIHRvIHB1dCB1cCBhIGRlc2lnbiBkb2MpLg0KDQpUaGFua3MsDQpEZWVw
YWsNCg==
