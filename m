Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51729706079
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 08:52:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLkLy1tf8z3bT7
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 16:52:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=5eMcEOu0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:7eb2::703; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=5eMcEOu0;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20703.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLkLK71GRz30Kr
	for <openbmc@lists.ozlabs.org>; Wed, 17 May 2023 16:52:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxSlazjwL1l0C8B148wS2EQWhoDVGl5DDhs1C7V9VUyvDcuR4LHrw6QW6A70FUpwTtbiG2oDTMRYH/Dd0wXg/klXBQRNwFPTg2yZ9t6U9rfFWHSHICiY7Sa7S7eLD2T5OIWaoUBzV2PCt4S+zDMGYZ6cRKFXpaXMLChkhp7HmzUw3GXyc1Iv3RvWN2TYxPIYmVp47MexshJTnUe2j1tfkYm9KoOobTCRJSZ/H4g0kXQCbeEzNf2IdPdVZCplFXnF5WF1j3lZ/8TANan59PVDVxjYPcyR7AKp8Z9vOGJfFK/PWtQKBP+xEuVI94/pEHlhI+u6cTqRsDHakpis7a8vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjBlPTJH0R6USG4k7yy6DF/ZZ+WTkZcyGANwo15YwUk=;
 b=YZGFF/k8MsARpLxMzShGcONMXsmdnK6utE8J8qzs3Y2YsX8hzGLGnDZ+Tw7ZdYyniW/H976cE4ELPHYGmXwXGHPHqk8y9fUzNMw5iNZ++cfDHj7+e+ks3tjO8TbOe/zShiRQp1b9mTGsQEK3yEY0wFYrTnlD8P4FxuBubqIrYtFZWfhFYUXbj/O95wtb41eV3c0xmWkCbgxuHsYCxxOLE7M5bXCw7zN+W3tLBlxxUy5PUOrTyePM+HPk+M6F6hDi97YomcNoQofsuDFeUk0NWZfUzXOI5IJaBOqa/9IA/f6vVF42BxTN2w7OwZRokeGpkqrPgAMniIsddY5lD080GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjBlPTJH0R6USG4k7yy6DF/ZZ+WTkZcyGANwo15YwUk=;
 b=5eMcEOu0vXg0Pjr20K05OGz2NyLO6xkBQNowcrT46QAs3g46E39G+oUUulxzfU5fBi+E4FHzL3qroHYd4fRM5eqChh+31BhStOBW81zqP0hg7pfDBOIRCOW1les9vBKQgpeYcapN7lwSo81iTYx6KehU2fiiT82HGxtgA+H9ErI=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 MWHPR0101MB3151.prod.exchangelabs.com (2603:10b6:301:2e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Wed, 17 May 2023 06:51:49 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::1ad2:30c1:adb8:e02e]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::1ad2:30c1:adb8:e02e%3]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 06:51:48 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to prevent Redfish to work on in-band Ethernet only
Thread-Topic: How to prevent Redfish to work on in-band Ethernet only
Thread-Index: AQHZiIwNRk6j3RB/q0OjgnJP3wqFug==
Date: Wed, 17 May 2023 06:51:48 +0000
Message-ID: <65A19043-2DC6-4724-882A-7D9203AE63D6@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|MWHPR0101MB3151:EE_
x-ms-office365-filtering-correlation-id: 3762576c-ac24-42cd-13a9-08db56a33002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4QCW/U9QijvqMYy4QSSJjGh2ay5YuiwWDVrrTpgfMYPjE+D8qELI8/buv8YOG2jzbqFLfuGUylrVAA4dn1sJrS4n2GdqNXlzMRhnlRyWGQCPcyM/ThJgD7r03QmiumTbHeNDPcBL31NeEpuoA9ZQoFE/f50eAdb2MJcYS6v9Ocr66/kBo3zLhvUXyJIy0SypvCKfz+VyV+8MfCPei3+ft+sshEuj3TAnUWHq94qUi3AclUop56CFiSczZwNa92QhlRuu/kNsHFO9WkdVYcHtbIyvuXJuNlOyJ+YPIJZxnY6f647EiSAII2vFy5xw4sdyHvNI5JG0pFj7XEKU5JiMhXCOhsXXSJSNpdxfCnPOzbL60VdIwFhr1UQ+UC6TOr0gC+scdv+ySCp3uTsorH3C9HvoBzy1rRxaUiy8wUARHkl3E0eyzeovOFfl8MYpPpvYYhlry4+xTKVYDdTqqHUljDdWPcxHI/XoEQNf50muyoQ41eCQEVnUs2DLmcWNafIwX9YiG/F83jrI1eVWHYeH5u9p8XEu02iuBgdTQ+y+ZIBZfle0q4U2Xdy4oaNj3KHv/1/DRmjLi39n1J716ERlZjcSLfIJjr+mr7tzVekBr8A=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(451199021)(6506007)(6512007)(478600001)(186003)(86362001)(71200400001)(66946007)(66476007)(6916009)(66556008)(76116006)(91956017)(66446008)(64756008)(2616005)(6486002)(26005)(83380400001)(966005)(5660300002)(166002)(2906002)(38070700005)(316002)(122000001)(41300700001)(4744005)(33656002)(8676002)(8936002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SzZxNFpZMXpJdTdtb2VOK01MYi9IbUVJVGIycHpTckcxMGFOMktHc0VnN09u?=
 =?utf-8?B?WWdjcnJCYmphdVh1dlVoWDJXR3NQSCtPMmpxMmdNUDBmR1NHTDZlTUJ3YXhN?=
 =?utf-8?B?Y2xDb0VJTWJQWnExekFqWlRLZm1EMWdOSjJSZXJ2aXZwMlVmQjloOWlQZDhh?=
 =?utf-8?B?THFWWUVzSExJeUpaY3dramxpejBscFpOQ1NVZS9WWGpTRXNyMHQrMDN0TWhw?=
 =?utf-8?B?eTFidURpYi9zKzlQbjg5Z0F2MXhHYkJkRVBmMFk3aHhGbllNVmVQbDhlNXBS?=
 =?utf-8?B?WkQvcFNPY2ZLcGdKcEJIZnc4TzRJZWxyc1RHeTN1Zmt0djJsOWp2TEdvMFNt?=
 =?utf-8?B?S210TDNCWXNlSzFOOE5YMkg0dFcxSW1CYmhPK3d6cHRVYjIyTEw4SitlR21n?=
 =?utf-8?B?enl1bmUybURmZmVyY1JFSVpzd0k2TXYzTWJGRGlsRVJLclMzVkFGLzR2OFQ5?=
 =?utf-8?B?TndtRC8zb0Rudm1iZjFNTXNqV3M4U2M3eW9WOUpYckN4MlFtS2VGM2lsZDI1?=
 =?utf-8?B?emlQL2JyVGUvT0VRWTQxUE5kVi9DZThaS1d4ZmdnK3lDczBNT0V4ZXZiRVJo?=
 =?utf-8?B?dnMvN0hvMU1HMUx2VzNaQWZVb04rK0tINlRoN2p3azNDVHpic2g2cldqQnVo?=
 =?utf-8?B?OTJNSTFITUNhb0ZEZjJYNXI2ZlErS0E3b2wwdDV5alRkeDVMS1NrbE55dkFv?=
 =?utf-8?B?Q0ZoV0FXSWtYblQ4dTlHamc2d0RObUxjMTJjN3pTaC81RERZaDhqVGFxVFk2?=
 =?utf-8?B?dUxGTml1N3Z5YmNIVTNQTEZwUFYzNjZMSEM5dnFUQmZ1Q09zRUZCc3MzV0Nr?=
 =?utf-8?B?SVhpTzlmUzdtSnA2ZnR3Mkppb250RjJTVTZOd3JBVWdCYytiVlNDVmtvd2Ny?=
 =?utf-8?B?MXVkU3JwN081SDExZ3FvbFdYbEpYZk5aMzQxc2F2d0NVRHVUaHdjdGRpMjBY?=
 =?utf-8?B?M25uQmo5R3NHbTFUN2syWDVIR0grajhvbmZkS3lFRU9PUGFtSGttd1VrVHBH?=
 =?utf-8?B?b3E1cnRRdnMrMDc1RWJVakR1Ymd4TnNPMjJMamQzVEJ2ZDU3ek5ZQnk0U1lE?=
 =?utf-8?B?WC8yNEVQSExrV3hVWjBTNVBFRHcvdlIxUDFHamwrdkEwcnRGbUI4WDBOdXVX?=
 =?utf-8?B?VXBUTUNuTVo0TGw2VFpuWWN5ajVmaXd0SFMvMktnWTFMTjlRRkx2TlY5Rlc1?=
 =?utf-8?B?SzgzWE54VHllYWZpMzhkUU5uYm1XMFVzRjd4MFIzbWFncmtpdGxWR21MTi8v?=
 =?utf-8?B?TTNVK0k2dU5XaXBPL0J3UXp6Q01IUkI4TzBla2cyQUV5a1ltWFFYM1pnTUli?=
 =?utf-8?B?QUtjdDJsV1hsQTdYK0dvaXozM2MvSnJBdVNtS1Z2bkZLZHVxdHJjREZXSnlY?=
 =?utf-8?B?TTFYbUVxdGxrRWxaUlZnUzRNdVFjT3NiSkJ2aDRvTHp2cUIzUTdHUVBYd2Zk?=
 =?utf-8?B?U2ErSTJlYkk0N3llTDRRR0t5czRKRzc0WkdWOXp6MUN1K3ZSaitDRDJ6alZP?=
 =?utf-8?B?QXRYYktBb3d5eDZpU203c1Q2K215cERJcEx1ZHNlWVZOajR5QnhrbEFjdUtG?=
 =?utf-8?B?WVo4SVlsaEl5S2dSajhmbE1qZk5SdWNPM294Mk04V05Id2xMbTluNG5DaXBH?=
 =?utf-8?B?RStzK3ZoTFdUTm9xazE4eWpxVjBuMlNySE02cmc1LzVrUW9RRlZjV2YwZU1D?=
 =?utf-8?B?aG1EbmVONG9tNHgvQUsvaGRCYk9hS28wQ1BHTnJGb3dSdVRxVjdXQUJ6V0dN?=
 =?utf-8?B?dnVEOEZKWjd1SFVWa1JUSEJ4anZpbE9tT1RSZ1ljN3BPTjJYRVJ6amM0a0Vs?=
 =?utf-8?B?NmJIeW5UcHgrR3B3aDM5Vmp4V3lEbEtSNm44NmliNlloYTlpaEJKbXVCTzUr?=
 =?utf-8?B?aXVGM1lQL3lYRW5IbDZIQzR3ajVXZ2pVRUcrYXk2Vmk2Z0JJTTBvRVkwMHFN?=
 =?utf-8?B?YUFFQW1oNHBJVFNteDFoNitHbnRNS0lSS2lVdnVUMTBtcGh1R2h6K2toTzVM?=
 =?utf-8?B?SlBucVEyR3JCclJaTTludUpiOHJQeDl6MVZMM096dHRxVSt6ak1jMWJvSVV3?=
 =?utf-8?B?L2ZLTmUvRytobUtxbG13ZFNHL3pKK2JzV3piKzROait2WXZiTVYrYW9NcHZt?=
 =?utf-8?B?UHFTUjNRVVAveFdBeURGVHduTDMvVGxxMnhLbkkrZGRCc0ZtU0h4OHZObC9J?=
 =?utf-8?Q?7mW40tRquwRcnsp4M6Y66/A=3D?=
Content-Type: multipart/alternative;
	boundary="_000_65A190432DC64724882A7D9203AE63D6amperemailonmicrosoftco_"
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3762576c-ac24-42cd-13a9-08db56a33002
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 06:51:48.7949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ADq8Ojbf91Dl5w22n6JQsFGQN7iJ0NPur8RSA2RPfn/6UEts3cWl4/ZiUpVWOlfmk52vLVffioSVmParN5weyvIAiCJovUBaYotSfXAiy1BfHusHgEaUm1C1A0Bl98j5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3151
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

--_000_65A190432DC64724882A7D9203AE63D6amperemailonmicrosoftco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpXZSBhcmUgc3VwcG9ydGluZyB0aGUgR2V0IEJvb3RzdHJhcCBBY2NvdW50IENyZWRlbnRp
YWxzIChOZXRGbiAyQ2gsIENvbW1hbmQgMDJoKSBjb21tYW5kIHNwZWNpZmllZCBhdCBzZWN0aW9u
IDkuMS4yIGluIHRoZSBSZWRmaXNoIEhvc3QgSW50ZXJmYWNlIFNwZWNpZmljYXRpb24gaHR0cHM6
Ly93d3cuZG10Zi5vcmcvc2l0ZXMvZGVmYXVsdC9maWxlcy9zdGFuZGFyZHMvZG9jdW1lbnRzL0RT
UDAyNzBfMS4zLjAucGRmLiBUaGVyZSBpcyBhIHJlcXVpcmVtZW50IGZvciB0aGUgdXNlciBhY2Nv
dW50IGNyZWF0ZWQgZnJvbSB0aGUgYWJvdmUgY29tbWFuZCwgc3BlY2lmaWVkIGF0IHNlY3Rpb24g
IjkuMiBBY2NvdW50IGxpZmUgY3ljbGXigJ06DQoNCkJvb3RzdHJhcCBhY2NvdW50cyBzaGFsbCBi
ZSB1c2FibGUgb25seSBvbiB0aGUgaG9zdCBpbnRlcmZhY2UuDQoNCkkgd291bGQgbGlrZSB0byBh
c2sgaWYgYW55b25lIGhhcyBpZGVhIG9uIGhvdyB0byBjb25maWd1cmUgYSB1c2VyIGFjY291bnQg
dG8gd29yayBmcm9tIFJlZGZpc2ggaW4tYmFuZCBvbmx5PyBNeSBzeXN0ZW0gKGJhc2VkIG9uIEFT
VDI1MDAvMjYwMCkgaGFzIGEgVVNCIGNvbm5lY3Rpb24gZnJvbSBIb3N0IHRvIEJNQyBhbmQgYSBV
U0IgRXRoZXJuZXQgZ2FkZ2V0IGRldmljZSBpcyBjcmVhdGVkIChhcyB1c2IwIGludGVyZmFjZSwg
SVAgMTkyLjE2OC4wLjEwKS4NCg0KVGhhbmtzLA0KVGhhbmcgUS4gTmd1eWVuIC0NCg==

--_000_65A190432DC64724882A7D9203AE63D6amperemailonmicrosoftco_
Content-Type: text/html; charset="utf-8"
Content-ID: <79B2E2976B828B41BD15F375A9779C71@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQpIaSwNCjxkaXY+V2UgYXJlIHN1cHBvcnRpbmcgdGhlJm5i
c3A7PGI+R2V0IEJvb3RzdHJhcCBBY2NvdW50IENyZWRlbnRpYWxzIChOZXRGbiAyQ2gsIENvbW1h
bmQgMDJoKQ0KPC9iPmNvbW1hbmQgc3BlY2lmaWVkIGF0IHNlY3Rpb24gOS4xLjIgaW4gdGhlIFJl
ZGZpc2ggSG9zdCBJbnRlcmZhY2UgU3BlY2lmaWNhdGlvbiZuYnNwOzxhIGhyZWY9Imh0dHBzOi8v
d3d3LmRtdGYub3JnL3NpdGVzL2RlZmF1bHQvZmlsZXMvc3RhbmRhcmRzL2RvY3VtZW50cy9EU1Aw
MjcwXzEuMy4wLnBkZiI+aHR0cHM6Ly93d3cuZG10Zi5vcmcvc2l0ZXMvZGVmYXVsdC9maWxlcy9z
dGFuZGFyZHMvZG9jdW1lbnRzL0RTUDAyNzBfMS4zLjAucGRmPC9hPi4gVGhlcmUNCiBpcyBhIHJl
cXVpcmVtZW50IGZvciB0aGUgdXNlciBhY2NvdW50IGNyZWF0ZWQgZnJvbSB0aGUgYWJvdmUgY29t
bWFuZCwgc3BlY2lmaWVkIGF0IHNlY3Rpb24gJnF1b3Q7PGI+OS4yIEFjY291bnQgbGlmZSBjeWNs
ZTwvYj7igJ06PC9kaXY+DQo8ZGl2Pg0KPGRpdiBjbGFzcz0icGFnZSIgdGl0bGU9IlBhZ2UgMjUi
Pg0KPGRpdiBjbGFzcz0ibGF5b3V0QXJlYSI+DQo8ZGl2IGNsYXNzPSJjb2x1bW4iPg0KPHA+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZTogOXB0OyBmb250LWZhbWlseTogU2Vnb2VVSTsgY29sb3I6IHJn
YigzNiwgNDEsIDQ2KTsiPjxiPjxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9Indo
aXRlLXNwYWNlOnByZSI+PC9zcGFuPkJvb3RzdHJhcCBhY2NvdW50cyBzaGFsbCBiZSB1c2FibGUg
b25seSBvbiB0aGUgaG9zdCBpbnRlcmZhY2UuPC9iPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXY+SSB3b3VsZCBsaWtlIHRvIGFzayBpZiBhbnlvbmUgaGFz
IGlkZWEgb24gaG93IHRvIGNvbmZpZ3VyZSBhIHVzZXIgYWNjb3VudCB0byB3b3JrIGZyb20gUmVk
ZmlzaCBpbi1iYW5kIG9ubHk/IE15IHN5c3RlbSAoYmFzZWQgb24gQVNUMjUwMC8yNjAwKSBoYXMg
YSBVU0IgY29ubmVjdGlvbiBmcm9tIEhvc3QgdG8gQk1DIGFuZCBhIFVTQiBFdGhlcm5ldCBnYWRn
ZXQgZGV2aWNlIGlzIGNyZWF0ZWQgKGFzIHVzYjAgaW50ZXJmYWNlLCBJUCAxOTIuMTY4LjAuMTAp
LjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+VGhhbmtzLDwvZGl2Pg0KPGRpdj5UaGFu
ZyBRLiBOZ3V5ZW4gLTwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_65A190432DC64724882A7D9203AE63D6amperemailonmicrosoftco_--
