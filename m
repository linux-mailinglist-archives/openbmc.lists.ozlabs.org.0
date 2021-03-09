Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273B33319F
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 23:41:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw9DC0JcWz3cLN
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 09:41:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=kueR0Fme;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=balaji.b.rao@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=kueR0Fme; dkim-atps=neutral
X-Greylist: delayed 4015 seconds by postgrey-1.36 at boromir;
 Wed, 10 Mar 2021 03:23:59 AEDT
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0rv6Nhsz2yjM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 03:23:56 +1100 (AEDT)
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129GMn3S001608; Tue, 9 Mar 2021 11:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Bp9UfC1eKC5EXpw1N4ETQ2c0WPCQ17TyWkYujKr9Zfw=;
 b=kueR0Fme5wG1hJc5+sFrieaRA12Uq0/FAmaPGe5c3hPQpIibLYXYZ8yzTE/45gue+eIO
 7/yB2V71FUjR7Z+ZvVy14IHr+y1OApBglWB7IrAeCXgflhrApmqkOAqmSbiLuAUrPsM8
 ou9sXGcJJgTvOdS6etWCRoFesppZMSdb9p67ekE6lszA4ZUUz2mmPR3FMq0OXhv2SUF9
 Gr2WniiIjclACjQGrZS9VzznpzeTiw5VlTRH96elYkPrzymDMxdnfUHt2dCZFJJevrgj
 du7LrnA1VfCh5nnqOCr+f3DtPnbEf4chmXx107khVmEIUBHktqX+oT9t+D0UxUzdWNk3 aA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 3745xr1dj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 11:23:46 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129GKQdZ140739; Tue, 9 Mar 2021 11:23:46 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56])
 by mx0a-00154901.pphosted.com with ESMTP id 374r96hhnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 11:23:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsiHn32BK6XpuVJOmfqZtFWlgEN09r9gidub6jjcPSFUKf7PeSzruWeXX8P5i8Q26oM5i8Zb2h3SA4GY8n0rYeA3655QGGnAVrlF5XKVscsTfZbJ9B6kwUAeJLIBBYKxWpBid2nDmji/qrtY32Om2Gr6ycPJuGV/HSXlY5Dmg54hFIVJ/Nb0owhI/qHqWz+VxD52+BUpODvFXMbKY1exX++bx0rLMoNWIxQeP3UYheu5eVr4qlxWxQuIo3Zg9QVQsdCAPQ3tWf7pYTnr8Rve+o4hO8EIWKhpjj8JwE0HfzCklL9dnjKaGf21MuR3rEwGAuDNQD51QLYCKZTW+fUAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp9UfC1eKC5EXpw1N4ETQ2c0WPCQ17TyWkYujKr9Zfw=;
 b=L290n9MUNLpyEwD+fTM+M1ubviye8/BfkaLLPxTgSqTnA0XExcBQAItJoAXOLu5UWA3z2MFeIqKC05GRECubfvCEkOhrp666L1pBXZ0ToqVIDKJsXmYk5KkzT97k1kpRl08J1o0alYfmEhpZfkvm+KKKjqNKPd0KZ1E4zgrMRtASht7FK5U0OeipqojIiLMWB+ekobIPmyEYM1mrdQ9xOzs8/blPNVg5QgFEBLQ/JV5TfGhbA5d4Y92KTTmckclESlgCff5xE3WUISL0J5n2Pc6rbs/6en8o+KuaskxbzNreHFmcmkj6ntXofwPV1jpP1Zz6/pCVLBN/Os3W/7IY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4574.namprd19.prod.outlook.com (2603:10b6:a03:283::14)
 by BYAPR19MB2759.namprd19.prod.outlook.com (2603:10b6:a03:f7::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 16:23:44 +0000
Received: from SJ0PR19MB4574.namprd19.prod.outlook.com
 ([fe80::b154:e9ad:cb98:19b4]) by SJ0PR19MB4574.namprd19.prod.outlook.com
 ([fe80::b154:e9ad:cb98:19b4%3]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 16:23:44 +0000
From: "Rao, Balaji B" <Balaji.B.Rao@dell.com>
To: "Giles, Joshua" <Joshua.Giles@dell.com>, Ed Tanous <edtanous@google.com>
Subject: RE: ObjectMapper & Redfish Update Service: Software.Activation
 Missing (SW Version Mgmt & Image Update)
Thread-Topic: ObjectMapper & Redfish Update Service: Software.Activation
 Missing (SW Version Mgmt & Image Update)
Thread-Index: AdcU9RfwkTp+VM+oRIKXZejr+c5iLwACvsVw
Date: Tue, 9 Mar 2021 16:23:44 +0000
Message-ID: <SJ0PR19MB457412BCF84B3397154E2258A7929@SJ0PR19MB4574.namprd19.prod.outlook.com>
References: <DM6PR19MB3561D5FB2E6B326E1ABD8E8C95929@DM6PR19MB3561.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB3561D5FB2E6B326E1ABD8E8C95929@DM6PR19MB3561.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Balaji_B_Rao@dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-09T16:23:42.7052158Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=f7eb15fc-67e4-4c2c-8f6b-d2441c6e1e18;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=dell.com;
x-originating-ip: [75.31.22.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 263a212f-1564-4329-4366-08d8e317b575
x-ms-traffictypediagnostic: BYAPR19MB2759:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR19MB27598EAECC6B121EFCE55BD1A7929@BYAPR19MB2759.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9v9RccEkAUckF5YS9DjJQkNKXlKCxPyA0AdOwv+wfACnL/8ZPu/SotL4i/IcLSWNhWwRvK3enlCzQy+R8rRzWjzlXuA8cWo1v3z3lRPnYIJg2sMVwMLH5E/6XR7Pxd6nB1KsYA8KbeV2cBhGHIIj5exr/+bd4QPgQ1qJ/BcuSAfIeopzXrpSOdYFFnXyDUriSFcGi9He0qBrHBy0QxRQvblyuWdEVzfhu21zQbKx0J+Y3LYAGdgeZnQGIWqFDvbFYsESgYlqikOTD0SZLcBm12yZ6NnLaiOvDYBZgsowsJh+VrfbA059OsnbwxP66EPiOWlJ+BkRYz7nDt3iWZXt2usa6yGleLVckIfxabu6a4qExuM2c/pTqZl8X3uDY6OoFHCfV3je0uxMOlxpYrrPaVIETCHk6tqU/UVVUPMW0nrKUbQZ4TOu5RtYn1Yt8h0dw8oLMqMWkECiL7XTvU6qEUb/zeByaPlOKFNY+PvmZGU2VogZF0I/u1w8lW7IzMe6EKfgEutGO7SYhLs2iNbBN4wZzBzLoos2jHfhxdyw7zO6D/1EhVTUPg4cT77fIkhZv5nmet5ttBRx3lc3PgOyWyzmRngaY/X5ljwChgAzPeY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4574.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(52536014)(83380400001)(8936002)(316002)(9686003)(186003)(55016002)(2906002)(5660300002)(76116006)(66946007)(66446008)(64756008)(110136005)(15650500001)(66476007)(86362001)(66556008)(54906003)(4326008)(7696005)(53546011)(33656002)(71200400001)(6506007)(26005)(966005)(8676002)(786003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eHRIeGFSd1c5eDFGR0JPUXdoOHBlcCswV3R4YW1tcWIweFE4dUtTMnFuWDY4?=
 =?utf-8?B?cERWSHZNYW1GMnpVejJjUlk3WnZsR0d3a3d1Qll2NlBQZUlBWkhHY3VQWkp0?=
 =?utf-8?B?OTJqVHYxYzNLTkc2Ni93UGNhb05oamZZc25JenFacmpxV29hZ1VoOTA1cm1t?=
 =?utf-8?B?WlYyMU15RDJBa3paU3RjVlUxeU5UYmJWWURrY21lcm1nc2lZR2hkN0ZIdVVa?=
 =?utf-8?B?R2xSTE9JaGgzd2VoYnV1cHRoQTdQOGFTYWVtcnBINFBVWCtaUXBjNi9GVzVS?=
 =?utf-8?B?dFIwU3k1dGJ2NnpydXlrZytralVVV1oxVEh4WkgrOTNxS3J5cC92WTloeHdT?=
 =?utf-8?B?a1czWFZOYmFIYUk1WkRlVG02K25FUEZMeXgyU215cHZaV1lGbXNNaFk4cFcz?=
 =?utf-8?B?Uko1enR4OCtYd3pUb0FiRGVwR3paY3d3ZHFhSG5sWUFGMVJQTGMwUTJCWWt0?=
 =?utf-8?B?YjhJS0FucjNZMTN0MFN1VXc4QkUwQ2p5b3E0TWxFQnpFbGRWaFA3R0I2cEhY?=
 =?utf-8?B?eHlMek15U09ObGVqb2d3anYxN1pXak83QkV2Zm4xaElLN0JNcUxYVFI3aHRm?=
 =?utf-8?B?aUFCTzhRcVMweFQ3ZXZiT1pFeXBqeTZwWjFvNVNQb1lxblFEQU9lWVFFOEJh?=
 =?utf-8?B?QTVpa3VOOTRxRkZHVmFFMEZEOWUzdUxUcjd6OExZdkJaN2pwY3hYcFJxaFFx?=
 =?utf-8?B?bTRKK0pQSkFINGxQSXJFZHc4a1dmSkRyL0tyRXFRcjJJcTJ0SWg5TVpNeXFL?=
 =?utf-8?B?bDZNZUlNTDFhZXBCQzRtcFhKNVZiSEU5TFRhWDlYcFVJSmFreWFXbVhPU2VK?=
 =?utf-8?B?M3o0YVlTNWlwUjRhcm54dmNob3lFWjZxQ2VDY1BMaUNjcStYS1BaY1FISVZ2?=
 =?utf-8?B?MjNYSFNSNHBrZWZPbWhnY0c3a3djTEZRbVU4MmNHTklTL00rc3VPQkc5Mmdp?=
 =?utf-8?B?QXNSeUV0dDlPbEJINkNhNWRqU1l4S29VWStyWU96Z1NmaVJhNXIvZTN3SllU?=
 =?utf-8?B?c1Nub0x5UG1ETi8xcXdDTmRTUDRQR0l3WDMxRi9jOWtlTnJOQ1ppS0RhelVV?=
 =?utf-8?B?S2Q5bEJlZlRJVTZRdWJSamRQYVNnV3diYnBqY3R1NVcvbmNVM05FdVFqand2?=
 =?utf-8?B?NExOWndKaGZVb2NXUnBKOFBncE51Tnp6WjlOeU9tc2RsY2RLVlZlSGZpMFlv?=
 =?utf-8?B?TDNvZDUwaDlNUzZiTFdjM2tCRUpDRDI5dGMvdThJWEtFNXVGT0lWSFBMK1Vk?=
 =?utf-8?B?UnlqR2dqUVVlT2ZldXA0TVB2N2x6YXEybkdzYXE0L3p0L0JZSG4wQTFlNFp2?=
 =?utf-8?B?TGRPYTdBYU03TjlkaFVOSEgzUWdvUjRBMU14VldQU256YjdyeXVDdFhwVURy?=
 =?utf-8?B?QTA4bGQzNjZJUnhaeklXOEJ0aTdKamZMMDB6d1hDR3pJZld3bENnVUt1K3Vx?=
 =?utf-8?B?ZFZCY2pJYktJSFZ6SEpiM1k1VG1zSk1mZjVTZjVRU05uWlFzMllJRERlRGJT?=
 =?utf-8?B?QlNDUm9PWUE4Q283TEM2WStNSTJkeHpDSlNlYXJUc0Rtb3U1b3lrYm42ZmI3?=
 =?utf-8?B?UGM4S3Q0RDJlWW1qODZTS2F1QlR1ZC9CMmR3b1NpOVlQeFNRYXF2MG54SFdl?=
 =?utf-8?B?L2F6TVZPTzdEQTc4dlY1R0o3RUxxZThybmNKVmYvVmZEZ3ltdGtlNXpWOFpu?=
 =?utf-8?B?ZCtwU1Z1Q1phTGFZdnhkdW5RU2I1MC9UdmkwV2QzUS96aS85STRJUGxpVmFm?=
 =?utf-8?Q?UtAIhjmwNMZDsDu4pM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4574.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263a212f-1564-4329-4366-08d8e317b575
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 16:23:44.0292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwnLFWdPLdDFFgzSXr6E9dw6/x8UAxasxZ68qkQAnhnm4AZWkhIyzcCXdW1kpWyrCK7p/wdkRFd9ZnFyP3zbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR19MB2759
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_13:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090081
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090081
X-Mailman-Approved-At: Wed, 10 Mar 2021 09:40:59 +1100
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9zaCwNCg0KSSBzeW5jZWQgdXAgd2l0aCBFZCBhbmQgTWF0dCBvbiBEaXNjb3JkIGFuZCBm
b3VuZCB0aGF0IHRoZSBpc3N1ZSB3YXMgd2l0aCB0aGUgT2JqZWN0TWFuYWdlciBJbnRlcmZhY2Ug
bm90IGJlaW5nIGFkZGVkLiBUaGFua3MgdG8gRWQgYW5kIE1hdHQgZm9yIHN1Z2dlc3RpbmcgdGhl
IGZpeC4gSSdsbCB0cnkgYWRkaW5nIHRoZSBPYmplY3RNYW5hZ2VyIEludGVyZmFjZS4gSSdsbCBy
ZWFjaCBiYWNrIGlmIEkgZmluZCBhbiBpc3N1ZS4gVGhhbmtzIGZvciB0aGUgaGVscC4NCg0KVGhh
bmtzLA0KDQpCYWxhamkgUmFvDQpEaXN0aW5ndWlzaGVkIE1lbWJlciBUZWNobmljYWwgU3RhZmYN
CkRlbGzCoEVNQ8KgfCBGaXJtd2FyZSBFbmdpbmVlcmluZw0KKzEtNTEyLTcyOC0yOTcxIC8gQmFs
YWppLkIuUmFvQERlbGwuY29tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBH
aWxlcywgSm9zaHVhIDxKb3NodWFfR2lsZXNARGVsbC5jb20+IA0KU2VudDogVHVlc2RheSwgTWFy
Y2ggOSwgMjAyMSA5OjAyIEFNDQpUbzogRWQgVGFub3VzDQpDYzogUmFvLCBCYWxhamkgQjsgQnJh
ZCBCaXNob3A7IG9wZW5ibWM7IEVkIFRhbm91czsgR3VubmFyIE1pbGxzDQpTdWJqZWN0OiBPYmpl
Y3RNYXBwZXIgJiBSZWRmaXNoIFVwZGF0ZSBTZXJ2aWNlOiBTb2Z0d2FyZS5BY3RpdmF0aW9uIE1p
c3NpbmcgKFNXIFZlcnNpb24gTWdtdCAmIEltYWdlIFVwZGF0ZSkNCg0KSGVsbG8gYWxsLA0KDQpQ
cm9ibGVtOg0KTXkgY29sbGVhZ3VlIEJhbGFqaSBSYW8gYW5kIEkgYXJlIGxvb2tpbmcgYXQgUmVk
ZmlzaCArIEl0ZW0gVXBkYXRlciBpbXBsZW1lbnRhdGlvbiBhbmQgZm91bmQgc29tZSB1bmV4cGVj
dGVkIChJJ20gYSBuZXdiaWUpIGJlaGF2aW9yIGNvbWluZyBmcm9tIHByb2Nlc3NlcyBpbnZvbHZl
ZC4NCkluIHBhcnRpY3VsYXIsIHRoZXJlIGlzIHNvbWUgZGlzY3JlcGFuY3kvZGlzYWdyZWVtZW50
IGFyb3VuZCB0aGUgT2JqZWN0TWFwcGVyLkdldE9iamVjdCB2ZXJzdXMgaW50cm9zcGVjdGlvbiBv
ZiB0aGUgL3NvZnR3YXJlLzxpZD4gaW50ZXJmYWNlcy4uLg0KDQpJbnRlcmZhY2VzIG1pc3NpbmcN
Cj09PT09PT09PT09PT09PQ0KQUZBSUNULCBSRiB1cGRhdGVfc2VydmljZS5jcHAgaGFzIGEgdGhy
ZWFkIHRoYXQgbW9uaXRvcnMgYW5kIGN5Y2xlcyB0aHJvdWdoIHRoZSBpbnRlcmZhY2VzIG9mIHRo
ZSBvYmplY3QgaW4gcXVlc3Rpb24gL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvPGlkPiBh
bmQgd2hlbiBpdCBmaW5kcyB0aGUg4oCc4oCmU29mdHdhcmUuQWN0aXZhdGlvbuKAnSBpbnRlcmZh
Y2UsIGl0IHdpbGwgYWN0aXZhdGUgdGhlIGltYWdlIGJ5IHNldHRpbmcgdGhlIFJlcXVlc3RlZEFj
dGl2YXRpb24gcHJvcGVydHkgdG8g4oCcQWN0aXZlLuKAnQ0KDQpUaGlzIGZyYW1ld29yayB3b3Jr
cyBmaW5lIGZvciBCTUMgdXBkYXRlcyBidXQgSSBzZWUgdGhhdCBmb3Igb3VyIEJJT1MvSG9zdCB1
cGRhdGVzIFJGIG9ubHkgZmluZHMgc29tZSBpbnRlcmZhY2VzIHRoZW4gY29tcGxldGVzIChleGl0
IG91dCBvZiBpbWFnZV9tYW5hZ2VyX21haW4uY3BwKTsgUkYgdGhyZWFkIHRpbWVzIG91dCAoMTBt
aW4pIHdpdGhvdXQgZmluZGluZyB0aGUgU29mdHdhcmUuQWN0aXZhdGlvbiBpbnRlcmZhY2UuDQoN
CkhlbHAgV2FudGVkDQo9PT09PT09PT09PQ0KTm90IHVudGlsIHRoZSBvYmplY3QgbWFwcGVyIHNl
cnZpY2UgaXMgcmVzdGFydGVkIGRvIEkgc2VlIHRoZSBleHBlY3RlZCBpbnRlcmZhY2VzIHBvcHVs
YXRlLg0KTG9va2luZyBmb3Igc29tZSBndWlkYW5jZSBvbiB0aGlzIFJGPC0+T2JqZWN0TWFwcGVy
IHJlbGF0aW9uc2hpcCwga25vd24gcHJvYmxlbXMgd2l0aCBPTSBvciBkaWZmZXJlbnQgd2F5cyBv
ZiBzZWFyY2hpbmcgZm9yIHRoZXNlIGludGVyZmFjZXMuDQpSZXBybyBvYnNlcnZhdGlvbiBTdGVw
cyAxLTUgYmVsb3cuLi4NCg0KU3RlcHMNCj09PT0NCjEuKSBHaXZlbiBhbiB1cGxvYWQgb2YgYSBo
b3N0IHVwZGF0ZSBwYWNrYWdlIHdlIHNlZSB0aGUgb2JqZWN0IGluIHRoZSBhcHByb3ByaWF0ZSB1
cGRhdGVyIGFuZCB2ZXJzaW9uIHNlcnZpY2VzOg0KIyBidXNjdGwgdHJlZSB4eXoub3BlbmJtY19w
cm9qZWN0LlNvZnR3YXJlLkJJT1MuVXBkYXRlcg0KYC0veHl6DQogIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QNCiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlDQogICAgICBgLS94eXov
b3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2YxNGYyZDE1DQojIGJ1c2N0bCB0cmVlIHh5ei5vcGVu
Ym1jX3Byb2plY3QuU29mdHdhcmUuVmVyc2lvbg0KYC0veHl6DQogIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QNCiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlDQogICAgICBgLS94eXov
b3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2YxNGYyZDE1DQoNCg0KMi4pIGludHJvc3BlY3Rpb24g
c2hvdWxkIHNob3cgdXMgdGhlICJTb2Z0d2FyZS5BY3RpdmF0aW9uIiBpbnRlcmZhY2UgYW5kIGRv
ZXM6IA0KIyBidXNjdGwgaW50cm9zcGVjdCB4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkJJ
T1MuVXBkYXRlciAveHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS9mMTRmMmQxNQ0KTkFNRSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBFICAgICAgU0lHTkFUVVJF
IFJFU1VMVC9WQUxVRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkxBR1MNCm9yZy5mcmVl
ZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlICAgICAgICAgaW50ZXJmYWNlIC0gICAgICAgICAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0NCi5JbnRyb3NwZWN0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIC0gICAgICAgICBzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0NCi4uLg0KW3NuaXBdDQp4eXoub3Bl
bmJtY19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXRpb24gICAgIGludGVyZmFjZSAtICAgICAgICAg
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtDQouQWN0aXZhdGlvbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgInh5ei5v
cGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQWN0aXZhdC4uLiBlbWl0cy1jaGFuZ2Ugd3JpdGFibGUN
Ci5SZXF1ZXN0ZWRBY3RpdmF0aW9uICAgICAgICAgICAgICAgICAgICAgICAgcHJvcGVydHkgIHMg
ICAgICAgICAieHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5BY3RpdmF0Li4uIGVtaXRzLWNo
YW5nZSB3cml0YWJsZQ0KIFsvc25pcF0NCg0KMy4pIEhvd2V2ZXIgR2V0T2JqZWN0IGRvZXMgbm90
IHNob3cgdGhpcyBpbnRlcmZhY2UgYW5kIF9sb29rc18gaW5jb21wbGV0ZSAob25seSAxIGRpY3Rp
b25hcnkpIHdoZW4gY29tcGFyZWQgdG8gdGhlIGJtYyBlcXVpdmFsZW50ICgyIGRpY3Rpb25hcmll
cykuLi5ub3Qgc3VyZSBob3cgdGhpcyB3b3JrcyBvciB3aGF0IGl0IG1lYW5zIHRob3VnaC4uLg0K
IyBkYnVzLXNlbmQgLS1zeXN0ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJv
amVjdC5PYmplY3RNYXBwZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qvb2JqZWN0X21hcHBlciB4eXou
b3BlbmJtY19wcm9qZWN0Lk9iamVjdE1hcHBlci5HZXRPYmplY3Qgc3RyaW5nOiIveHl6L29wZW5i
bWNfcHJvamVjdC9zb2Z0d2FyZS9mMTRmMmQxNSIgYXJyYXk6c3RyaW5nOg0KbWV0aG9kIHJldHVy
biB0aW1lPTE2MTQ5NTc5MTUuMzI2MDMxIHNlbmRlcj06MS4yNyAtPiBkZXN0aW5hdGlvbj06MS44
NDggc2VyaWFsPTUxODcgcmVwbHlfc2VyaWFsPTINCiAgIGFycmF5IFsNCiAgICAgIGRpY3QgZW50
cnkoDQogICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuVmVyc2lv
biINCiAgICAgICAgIGFycmF5IFsNCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVkZXNrdG9w
LkRCdXMuSW50cm9zcGVjdGFibGUiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3Rv
cC5EQnVzLlBlZXIiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3RvcC5EQnVzLlBy
b3BlcnRpZXMiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuQ29tbW9u
LkZpbGVQYXRoIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVj
dC5EZWxldGUiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdh
cmUuVmVyc2lvbiINCiAgICAgICAgIF0NCiAgICAgICkNCiAgIF0NCg0KNC4pIGdldC1tYXBwZXIg
c2hvd3MgU29mdHdhcmUuVmVyc2lvbiB0byBiZSB0aGUgc2VydmljZSBhc3NvY2lhdGVkIHdpdGgg
dGhpcyBvYmplY3QgI21hcHBlciBnZXQtc2VydmljZSAveHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0
d2FyZS9mMTRmMmQxNQ0KeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5WZXJzaW9uDQoNCjUu
KSBIb3dldmVyLCByZXN0YXJ0aW5nIE9NIGFwcGVhcnMgdG8gcG9wdWxhdGUgdGhlIG1pc3Npbmcg
aW50ZXJmYWNlcy9kaWN0aW9uYXJpZXMuLi53aGF0IGdpdmVzPyANCiNzeXN0ZW1jdGwgcmVzdGFy
dCB4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVjdE1hcHBlciAjZGJ1cy1zZW5kIC0tc3lzdGVtIC0t
cHJpbnQtcmVwbHkgLS1kZXN0PXh5ei5vcGVuYm1jX3Byb2plY3QuT2JqZWN0TWFwcGVyIC94eXov
b3BlbmJtY19wcm9qZWN0L29iamVjdF9tYXBwZXIgeHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RN
YXBwZXIuR2V0T2JqZWN0IHN0cmluZzoiL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvZjE0
ZjJkMTUiIGFycmF5OnN0cmluZzogDQptZXRob2QgcmV0dXJuIHRpbWU9MTYxNTIzMTUzMy44NTk0
Nzkgc2VuZGVyPToxLjQ0OTggLT4gZGVzdGluYXRpb249OjEuNDUxNyBzZXJpYWw9MTI4NyByZXBs
eV9zZXJpYWw9Mg0KICAgYXJyYXkgWw0KICAgICAgZGljdCBlbnRyeSgNCiAgICAgICAgIHN0cmlu
ZyAieHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5CSU9TLlVwZGF0ZXIiDQogICAgICAgICBh
cnJheSBbDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3Bl
Y3RhYmxlIg0KICAgICAgICAgICAgc3RyaW5nICJvcmcuZnJlZWRlc2t0b3AuREJ1cy5QZWVyIg0K
ICAgICAgICAgICAgc3RyaW5nICJvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIg0KICAg
ICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0LkFzc29jaWF0aW9uLkRlZmluaXRp
b25zIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0LkNvbW1vbi5GaWxl
UGF0aCINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3QuRGVs
ZXRlIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkFj
dGl2YXRpb24iDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdh
cmUuVmVyc2lvbiINCiAgICAgICAgIF0NCiAgICAgICkNCiAgICAgIGRpY3QgZW50cnkoDQogICAg
ICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuVmVyc2lvbiINCiAgICAg
ICAgIGFycmF5IFsNCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVkZXNrdG9wLkRCdXMuSW50
cm9zcGVjdGFibGUiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3RvcC5EQnVzLlBl
ZXIiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMi
DQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuQ29tbW9uLkZpbGVQYXRo
Ig0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVjdC5EZWxldGUi
DQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuVmVyc2lv
biINCiAgICAgICAgIF0NCiAgICAgICkNCiAgIF0NCg0KUmVmZXJlbmNlcw0KPT09PT09PT09DQpo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2FyY2hpdGVjdHVyZS9v
YmplY3QtbWFwcGVyLm1kDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFz
dGVyL2FyY2hpdGVjdHVyZS9jb2RlLXVwZGF0ZS9jb2RlLXVwZGF0ZS5tZA0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzL3RyZWUvbWFzdGVyL3h5ei9v
cGVuYm1jX3Byb2plY3QvU29mdHdhcmUNCg0KLUpvc2ggR2lsZXMNCg0K
