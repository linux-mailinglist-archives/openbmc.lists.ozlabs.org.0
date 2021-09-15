Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78240C6E7
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 15:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8hfD5w9fz2yNT
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 23:59:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=RtGkcr5d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0892d96fb2=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=RtGkcr5d; dkim-atps=neutral
X-Greylist: delayed 2384 seconds by postgrey-1.36 at boromir;
 Wed, 15 Sep 2021 23:58:51 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8hdl0m2rz2yJd
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 23:58:49 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18F7M3Tt012953;
 Wed, 15 Sep 2021 13:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=c553UYPd23Bi6qf1oDOkGSwm9SuNsfq42sNrtiSQyLY=;
 b=RtGkcr5d2F35IVkOPKxmKdCeIlVX3XQJvHvjQCgFiIIandRUR+ceWUQgmnY+f9d09dz5
 ZdGhDBEwzIsqYPdNF69pnLPV4CmpJ2Ut4RTkEIDpQoFCFGOvGLwnrai0OtwJRfalp4bk
 dDHlnmFtUO3o6VafNNkDDLMIWrL5v9OhEYNZhnwVC61VNl9thu9D4z6YK2upXwXs07vO
 ePsR69eP41v0T4WyUyLN8OkRT8gUuMQdw/OXUQ1ka4u+QNW4KvhOmQ65Xe7ckCKD/583
 Fk0uG3n8sFjyUt4ote841U3FHPhrBoY0/Ma6rSJgVmrHC/elaXxxVTWPwnCVHwh3IOpW hA== 
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 3b357j5k7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 13:19:00 +0000
Received: from G9W8455.americas.hpqcorp.net (g9w8455.houston.hp.com
 [16.216.161.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2353.austin.hpe.com (Postfix) with ESMTPS id 441F98B;
 Wed, 15 Sep 2021 13:18:59 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Wed, 15 Sep 2021 13:18:59 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Wed, 15 Sep 2021 13:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZQgT6PWg71TFq8ygrUAt3So2bp42OPERLv2n/FDCuTKjKQZuZzpyqfrFX6QpJAZC69E1C1dd3G2P6f0k43b1enKfvKnkUn9FDcgXPWQMruQTRFkgfip/OGqSLEF5vuSmvwF6JST0ZxH/k1MzK9qh10pRxXk8BS5jAR9C4ZJsHCX9gVDz+lWno+/3+Dag20xgIUtA/Q6ZdMJZV+35yePktgyUv3nPpKeT1W4dW5X4u8xZAVZUrJlg96nzstK+5avJkDd79Quc+dSSBxC/COxhGWV7eKPr+9ya/lsWO/aHhmhL6TvNLc+/pZMBSwUwjNHjWH8yaMzUKRq+NCMpPC2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xTFrbGuRlvf2G365hDDjOj4FzWvum40LffF5veaBfqE=;
 b=KuWwa0BxF9aLMz6Ca6gi4x3h6OhklL1yXOXx1br+WGf6YG7Ub0g3YztQJAdQQmqAt+wTOHLV7bz4qS4743dH/hhzHCN3NcFKp+Ko1ROdEJRs2HJnZaTjen90reB3tx9lpnob6TjqXkUSAC7X6/YfrNazuKfSU/wyCtoW+dLGCe/4BTR82lJ65vW6z+aa0QUjr9PJFlEeqgpx6f97PURp+VS3OLE3zn2fbwBj4a0vSWU7Zh4bvrzQWdN8gnqmPyuad3+sXwZotIltemlaZB5tydrKwq+hKAWUTsqbWjInLFkLOu0qSXSFgUKg6CS/Wn6cD0NXQVMhqvi4G1UKDJVhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0555.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7609::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 13:18:57 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8539:4975:c2f8:e9e4]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8539:4975:c2f8:e9e4%10]) with mapi id 15.20.4500.019; Wed, 15 Sep
 2021 13:18:57 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, Thang Nguyen
 <thang@amperemail.onmicrosoft.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: Read smbios2 file failed
Thread-Topic: Read smbios2 file failed
Thread-Index: AQHXqK1hdbyIwmnUjEuC+TnYHwgfmKuiLzQAgADn6wCAACLvAIABXVwAgAArQ4CAAFHdIA==
Date: Wed, 15 Sep 2021 13:18:57 +0000
Message-ID: <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
In-Reply-To: <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5d3ad56-f972-4d59-f8bb-08d9784b6008
x-ms-traffictypediagnostic: DF4PR8401MB0555:
x-microsoft-antispam-prvs: <DF4PR8401MB0555A00641363694C570B1C68FDB9@DF4PR8401MB0555.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VWgplPgt73WbGab0fMm2V9XqUlK1DWAFWxPzV55DL+3LaOZE5j1g8iZs4+AchbwzIIxZYBucajvNDp5Vg4Qaqwz1olraLURzFPO3rP9jo6BceRtGmAG8SXU8svlLVFmxedcYhP1vbvVpkZbQQknh0XcSSJdtOTV1T+aqX/Ch+qFg2AL+JsAUctMJ6gcwmDXrpZy1NUVtYGCPiGpbBYwrlI2i/2uuLC4HUPClFwWpxi8vrEmu1woirtJmanR9F4hCrZSwhQVg32JlcZmb/iTAs5gfIocG5s9/pGkMi80bL27Oaquv+VPV7G2w09ft+qYOrmdVCgMl8V3kyR7WfvOYKlVluhYcW+lCPOEmderY0OlyUG+YwvOEEek+rk+cuWSyWAqsgN9SbsBiQuDz7ix6Ja9jT32lxO0l0K00qhFjanvo6MbB/oK5uySDp5JoGxQiWlZpl+rwi9pN3L17NPze8j+Sb1MCnsM5ALTvVIYB4Fs4/1nxHJSv13cX4LtlLMEv41fwBg6LplziStRBW1/wJqRCXUSa4xCMxuqAJEfogf1pyAJuCVjqQY0XBRyAbjOT3kClC7bI7tOrjF/oXXveVVlcEKXOpNLN+OC5+A/5JtZuCkVD8BcMPed275zvZyH4RorH9oqFK4Y28JvBeZ2WsQfmKO8Bwx+Ng9VaY7cgjSCLtHgFiHhXJ33hUK/4ZHFLsuwblwN5rz84wPKdwR57Y4cgo15GnVsxOvs7qQty3oxpWbNhUhqV1hr9+y38Z1vJJfC4wemzudPnp6Yw19bNxTzqiqN+KmJ4vWlDQTTT7AEnvojDNCyeZvisuQHxkWCIe7qh/JaVMhl/XV+QjsfjYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(136003)(376002)(346002)(9686003)(86362001)(6506007)(966005)(2906002)(110136005)(478600001)(55016002)(316002)(66556008)(122000001)(64756008)(66446008)(38100700002)(83380400001)(38070700005)(26005)(55236004)(7696005)(8676002)(71200400001)(52536014)(8936002)(53546011)(186003)(76116006)(66946007)(33656002)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXZKY1lpSnFGVzlPRGg4V0MzNkcrbDlUNFZhZ2RzUVUzK3ZpM01Pd2VtbVdO?=
 =?utf-8?B?Z01sVWtVblo0UU0yVnlGTmVFRW93cTRmVlFLOU9GWTZ3Y01iWFhNZjdKeFRm?=
 =?utf-8?B?ME9VTEtObDYxUUowbGdlZWZCVkZOQmRBQlBwNmZXVHQxN0wvNFVSMjllRFRT?=
 =?utf-8?B?ZG9FaVhVMHhLUVhpMXRQZXhRamx3dis3Tm05MUx0VXlCNG93UWNPR24rcy9r?=
 =?utf-8?B?bUtvY0h4c3duaGNLcWcrbHJMSzZsalRGSUpQVjBSd0gwQk9NVVA2TTk5Nzhp?=
 =?utf-8?B?WTloVXBsN0lJazNGbWl0MFh6cTV3MVY0ZlpMQ1FRZzU1akI5Tm5OVkt0dnpN?=
 =?utf-8?B?Y3RSeEJkd1ZsM0NMUFhPZkZoL0x6ZTcxOE9ZdkZuZEozdTZCK0h5WHRlbmo3?=
 =?utf-8?B?TGhBTy9NaWNtaUozaGtoejB6aWFVNkhrNE9LYlUwU1doSUNCWWJuSzdFTG5N?=
 =?utf-8?B?ZjFQMjFVOWJ1Y00wRGU3NmFiWDRQV2VGalFkb3VNQ0pIYW1xSEFQd244cW9v?=
 =?utf-8?B?Q09ObXZBbGcxNFdtQ1BPMEpTTlNxODlSSkJxVmJ2QzBXUTZQZjE5ZlhqNDF6?=
 =?utf-8?B?a1FyaHU2ZHQ4ZWtvTmpBa2t5SXJMTkdnY1NMWDNBenZrVklwZnljZHVybHlx?=
 =?utf-8?B?UW5VdGdDYUhLNFl5eEFZVHRkSEtUMzZCSEFvMXZ5U1dBdFFsQjdkRnp3Q3Y5?=
 =?utf-8?B?OGY2Y1hPTG84TFpBRzkwSVJhTmpIV1Zxc05VbVd3ZjR0ZVQ2Z01FdG9oZ3Zs?=
 =?utf-8?B?dE9SenZzMWxTRloyZUdjeDExT0I4UmJrNW5xYytUMjlZcEJFTTVLQXgzb0Jx?=
 =?utf-8?B?aHhsR0paNnR2V1dlQVF4TnBMNytWM05Gc2lNdFhtUmUvYjI5bmlYeXlqc0x6?=
 =?utf-8?B?enY5a29DeXhxZm9NLzVlUU51M1Q0ak5mT29ZY0EzTllRWGN4a3JYNnRNVjcv?=
 =?utf-8?B?azV0RDZWWkdwc1h5aHJOd08zb21ISmJHWXpxTkd1VnUrdGJrd1FrM0FzVC8y?=
 =?utf-8?B?VlFVUHNoL3NRUTVBTm9Oa3RsSEpLYXRmVi9EcjFsK0lFNU1WZHNXOUJxQnkw?=
 =?utf-8?B?d3BiOC84N1plTWlrbG9zcXN6eitEaTFla2tGcEhtYmpWMytMeG1veFc2VmZz?=
 =?utf-8?B?TDRDOGV0RTBnRENIUlRDckFLbU1EUk1WUk90aHNkbzZ5cjg0TW1Vd2t6NERt?=
 =?utf-8?B?YWNTLzRmVzl4V09LN2F5TW05TU5LQzVhVG0yUEp6Zm1td2trb2M4cjVtNDBx?=
 =?utf-8?B?MVQzRXRzbzk5YzRiWkF3TEZvdkJ2MmJEb20yYzdlalcvMEZ2eUFDbHhUd2FN?=
 =?utf-8?B?NFMwNDdYYjVzb1hrbmcrTHB0aVU3YjdZU3FrYUlYbS8wa0FySkx6cEdlN2hl?=
 =?utf-8?B?YXVBTXVrVE1KYmhPOHI3bEVpRUpmNU0rRWZIOHBUQmt4c3loSDFxaU85bEJy?=
 =?utf-8?B?bHhxalFtSzRoSHE4Mi9oRHRxQlNUaFdHa3JyMDJoN0FGeGdvMVdaeGVUS2Zw?=
 =?utf-8?B?Q2dDUU9NbUFJbmllRExIbVVYdW1hVjFxUStoRkpzOG1iaFExVXJVbjg2dTJI?=
 =?utf-8?B?QW1ZalcvVk1zcGt0SnlLaXFDOGtiOURMYXFBeDZDTVlpTlpycFN5ekZTajhO?=
 =?utf-8?B?MStqbG1jcTQrUlhFWHZTaUVmRUdVRGVpc05LM040MmtrZWdQRklaR0J3K0xH?=
 =?utf-8?B?NmdnYmYyWG5JVUpQNDZCVFgzVUd0VFExNElPeUtXTDFzOGRqNHpUMmV0RjAy?=
 =?utf-8?Q?nNia0o+7BljG1TcYlt9bCB6J5KT796Q89GPZarQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d3ad56-f972-4d59-f8bb-08d9784b6008
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 13:18:57.6747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlaqLoepcJRIqNXLs1tkyy03PAEBLohsCenraL5NXpknf2T0Ps2Zd3wd/nTDr8Zalxz3WHk6pzP2VPFD4+/LPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0555
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: GcIuR3m9EuCJSeCMDVKmnlPtAFlCI2_a
X-Proofpoint-ORIG-GUID: GcIuR3m9EuCJSeCMDVKmnlPtAFlCI2_a
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_03,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150087
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

V2UgcmVjZW50bHkgZGlkIHRoZSBzYW1lIHRoaW5nIGFuZCBnb3QgaXQgd29ya2luZy4gIEFsbCB5
b3UgaGF2ZSB0byBkbyBpcyB0YWtlIHRoZSBSQVcgc21iaW9zIHJlY29yZHMgYmxvYiBpbiBiaW5h
cnkgZm9ybSAoZGVsaXZlcmVkIGFzIG5vdGVkIGJlbG93IGluIHdoYXRldmVyIHdheSB5b3UgY2hv
b3NlKSBhbmQgcHJlcGVuZCBhIHNwZWNpZmljIGhlYWRlcjogIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL3NtYmlvcy1tZHIvYmxvYi8zM2M5NDhhNDczYmQyNzNmZWEwY2ZmODJkNGM5OWI3MGI3
Nzg0YmU2L2luY2x1ZGUvc21iaW9zX21kcnYyLmhwcCNMMTE0DQoNCkl0IGlzIGEgbGl0dGxlIGJp
dCBmcmFnaWxlIGFzIGl0IGludHJvZHVjZXMgYSBkZXBlbmRlbmN5IG9uIHRoZSBmaWxlIGRvd25s
b2FkIGxvZ2ljIHRvIHdyaXRlIGEgbm9uLXN0YW5kYXJkIGhlYWRlciBkZWZpbmVkIGluIGFub3Ro
ZXIgc2VydmljZSB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IGNoYW5nZS4NCg0KTWlrZQ0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtDQo+IGJv
dW5jZXMrbWlrZS5nYXJyZXR0PWhwZS5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9m
IEFuZHJlaQ0KPiBLYXJ0YXNoZXYNCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTUsIDIw
MjEgMzoxNyBBTQ0KPiBUbzogVGhhbmcgTmd1eWVuIDx0aGFuZ0BhbXBlcmVtYWlsLm9ubWljcm9z
b2Z0LmNvbT47IG9wZW5ibWMNCj4gPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVj
dDogUmU6IFJlYWQgc21iaW9zMiBmaWxlIGZhaWxlZA0KPiANCj4gSSBkb24ndCBrbm93IHdoYXQg
aXMgZm9ybWF0IG9mICJkbWlkZWNvZGUgLS1kdW1wLWJpbiIsIGJ1dCBpZiBpdCBqdXN0IHJhdw0K
PiBkdW1wIG9mIHNtYmlvcyB0aGVuIHlvdSBvbmx5IG5lZWQgdG8gYWRkIG1kciBoZWFkZXIuDQo+
IA0KPiBTZWUgYW5zd2VyIGZvciB0aGUgc2FtZSBxdWVzdGlvbiBoZXJlOg0KPiBJTlZBTElEIFVS
SSBSRU1PVkVEDQo+IDAyMS1KdWx5LzAyNjg4Mi5odG1sX187ISFOcHhSITJ3MEZrUHMyS3lhQjZY
T3ZCOGV0NTJiV0txQU1MSW1tTC0NCj4gaVVrOUFfelpiSjhXTGhNZVhkdlJBcC1wY3h0OFEkDQo+
IA0KPiBPbiBXZWQsIDIwMjEtMDktMTUgYXQgMTI6NDEgKzA3MDAsIFRoYW5nIE5ndXllbiB3cm90
ZToNCj4gPiBIaSBBbmRyZWksDQo+ID4NCj4gPiBJIHNlZSBvdXRwdXQgb2YgImRtaWRlY29kZSAt
LWR1bXAtYmluIiBmb2xsb3dzIFNNQklPUyBzcGVjaWZpY2F0aW9uLg0KPiA+IEFzDQo+ID4gdGhl
IGRhdGEgZm9yIHNtYmlvcy1tZHIgZG9lcyBub3QgZm9sbG93IHRoaXMsIGRvIHlvdSBrbm93IGFi
b3V0IHRoZQ0KPiA+IGRvY3VtZW50IG9yIGFueSBpbmZvcm1hdGlvbiBJIGNhbiByZWZlcmVuY2Ug
dG8gcHJlcGFyZSBkYXRhIHRvIHNlbmQgdG8NCj4gPiBCTUM/Pw0KPiA+DQo+ID4NCj4gPiBCZXN0
IFJlZ2FyZHMsDQo+ID4NCj4gPiBUaGFuZyBRLiBOZ3V5ZW4NCj4gPg0KPiA+IE9uIDE0LzA5LzIw
MjEgMTU6NTEsIEFuZHJlaSBLYXJ0YXNoZXYgd3JvdGU6DQo+ID4gPiBObywgaXQgaXMgbm90IHNh
bWUgYXMgImRtaWRlY29kZSAtLWR1bXAtYmluIi4NCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDIwMjEt
MDktMTQgYXQgMTM6NDYgKzA3MDAsIFRoYW5nIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gT24gMTMv
MDkvMjAyMSAyMzo1NiwgQW5kcmVpIEthcnRhc2hldiB3cm90ZToNCj4gPiA+ID4gPiBZb3UgbmVl
ZCB0byBzb21laG93IGRlbGl2ZXIgc21iaW9zIGRhdGEgaW1hZ2UgdG8gQk1DLiBUaGlzDQo+ID4g
PiA+ID4gbWVhbnMsIHlvdXIgQklPUyBzaG91bGQgaW1wbGVtZW50YXQgc29tZSBsb2dpYyB0byB0
cmFuc2ZlciB0aGlzDQo+ID4gPiA+ID4gZGF0YS4NCj4gPiA+ID4gPiBGb3IgQk1DIHNpZGUgc2Vl
IGV4YW1wbGUgaGVyZToNCj4gPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9pbnRl
bC1pcG1pLQ0KPiBvZW0vYmxvYi9tYXN0ZXIvc3JjL3NtYmlvcw0KPiA+ID4gPiA+IG1kcnYyaGFu
ZGxlci5jcHANCj4gPiA+ID4gSGkgQW5kcmVpLA0KPiA+ID4gPg0KPiA+ID4gPiBXaGF0IGlzIHRo
ZSBmb3JtYXQgb2Ygc21iaW9zIGRhdGEgdG8gdHJhbnNmZXIgdG8gQk1DPyBJcyBpdCB0aGUNCj4g
PiA+ID4gc2FtZSBjb250ZW50IG9mICJkbWlkZWNvZGUgLS1kdW1wLWJpbiIgY29tbWFuZCBmcm9t
IEhvc3QgTGludXg/DQo+IG9yDQo+ID4gPiA+IGFueXRoaW5nIHNwZWNpYWwgaW4gZm9ybWF0dGlu
ZyB0aGUgY29udGVudCB0byBzZW5kPw0KPiA+ID4gPg0KPiA+ID4gPiA+IE9uIE1vbiwgMjAyMS0w
OS0xMyBhdCAxNzo0MCArMDMwMCwgQWxleGFuZGVyIFJhaWggd3JvdGU6DQo+ID4gPiA+ID4gPiBI
aSBndXlzLCBJIGFtIGJlZ2lubmVywqBpbiBvcGVuYm1jIEkgYnVpbGQgb3BlbmJtYyB3aXRoDQo+
ID4gPiA+ID4gPiBzbWJpb3MtbWRyIHJlcG9zaXRvcnkgYW5kIEkgaGF2ZSBlcnJvcjoNCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBSZWFkIGRhdGEgZnJvbSBmbGFzaCBlcnJvciAtIE9wZW4gTURS
VjIgdGFibGUgZmlsZSBmYWlsdXJlDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlcmUgaXNu
dMKgZmlsZSBpbiAvdmFyL2xpYi9zbWJpb3Mvc21iaW9zMg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IEhvdyBJIGNhbiByZXNvbHZlIHRoaXMgcHJvYmxlbT8NCj4gPiA+ID4gPiA+IEhlbHAgbWUg
cGxlYXNlISEhDQo+IA0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBBbmRyZWkgS2FydGFz
aGV2DQo+IA0KDQo=
