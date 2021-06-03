Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FEA39A3A5
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 16:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwpff5BJyz3018
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 00:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=XwVTStS9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=XwVTStS9; 
 dkim-atps=neutral
X-Greylist: delayed 175 seconds by postgrey-1.36 at boromir;
 Fri, 04 Jun 2021 00:47:51 AEST
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwpfH0fp9z306K
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 00:47:50 +1000 (AEST)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 153EiLIo009160; Thu, 3 Jun 2021 07:44:50 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0b-003cac01.pphosted.com with ESMTP id 38wngnc05c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 07:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEhd2RXbcEe26kT52p/C46aD1TCbJIwqQYgg+jiuJSOMIJst0uYKPkMq+7tp5sdsZ+LXAs/pnrXWS4Ww1UhVLI8ozmENk9UyRXGbW04QAVwcbaxk+IaxOKELutLm561Zdo9Z83mAkS5ngIbad4QYe+i87A9LvRQk70XqHnkv4NzZEru6lnPhekwYVXx38R82674k3qNFMl4fmUvD6j6YFFqylVt+v16h1AY273wa2rcOMXeHtc9VaHOM2BJD2JFBJPVrNuIOVbSPTq2pRHZa43jEn99aHI8vI5z0SVbb7B27b7FvOTAGCY1ZnhiA3WBHe0RXkaCP9EJJDfoVjNZGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9rqGOehMVOcyrQUcOaZBBFpSu7mNLgXqZQfT/Lob54=;
 b=E4F2laaXo9XQ63m3cxMI82d8w4DedMnUiVTzrZAkmKiqnxBnmBEtn24EP6BiNQQi8jOUPXuOQRN4x0wFSNTiGLKtgJN48lpSreCkhRnQSWgHCClV0IIKxZN8YnGkxdW6+hL708Ci5TGazl0u8kfC7prLftqqnz0encv/Xhscqq1pE5cmhYcufG/4So3/dV0eq35BW48BakuPgzvq7fYUIoG/digRlT/2C5TVZidwnID6AtY0xB80tBuusjBonaCOh/J88+wXBQUfpMHHaMmB1JkTFOHJKhxuLsDGA/P8Pj5cjGqcwshpl0ZoCAd8+0fQ/RsScvfVtM+H6FUGFZNTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9rqGOehMVOcyrQUcOaZBBFpSu7mNLgXqZQfT/Lob54=;
 b=XwVTStS99TJxWlZOivjPUS0FzBLalBPX0B0TYk9iyVJjatZ5+ryrNK1YKn9rHrKG3v8M9WMUuuYeJZalw8mHqpSnqpZWHtxH+dbWa211CHCFcSnZXd0SJMr2gQ5BeLf652E8TLy3ap5MAttFjvHQzsXPMRvgPt4CpTc/Mynhfdg=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (13.101.85.21) by
 SA1PR17MB4596.namprd17.prod.outlook.com (13.101.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.23; Thu, 3 Jun 2021 14:44:48 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c%7]) with mapi id 15.20.4195.023; Thu, 3 Jun 2021
 14:44:48 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: FruDevice/Entity Manager vs hwmon
Thread-Topic: FruDevice/Entity Manager vs hwmon
Thread-Index: AddUtYbuQlmqjpkgTbmHP6gPOH9bmADDilwAAAK1g3A=
Date: Thu, 3 Jun 2021 14:44:48 +0000
Message-ID: <SA1PR17MB4593DEDFE774B6AE24058A42963C9@SA1PR17MB4593.namprd17.prod.outlook.com>
References: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
 <CAH2-KxD_WvQtHVAXg6etVx1hW++QMrM9B-0qvepeUetO=_WEgQ@mail.gmail.com>
In-Reply-To: <CAH2-KxD_WvQtHVAXg6etVx1hW++QMrM9B-0qvepeUetO=_WEgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7bcdcb9-7333-45b3-dde5-08d9269e2302
x-ms-traffictypediagnostic: SA1PR17MB4596:
x-microsoft-antispam-prvs: <SA1PR17MB45962733A0EE4F6E5C159265963C9@SA1PR17MB4596.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +fjMpZ4zJQovBZdqNA3JFPUToObdCS7YDa6/YzQHkYI1wUdwvN4lF5X6gxTAHz1KLmO0BtauzmMwoL/mxGoGB2pI02MIBKgfSyafrR17gc4KHlcvdiLMrH6BJMLHEThVxAQtIERhVKbc8KA+G4mKWK/WvaFNLh/L2yN47OedsAfnkegKOMhnsjfyyhWlht9R9mendO2QVNARY1ASsxk8eT7XWyfu9oqh7P551GHSuZ/kFtrpGVBIKxxqPjOet6Dx2VMRTDWsOWhQ/zQ28HpL0hBzFHlz7K/L+gk9IFkJ+eQh56TbxEnKpUk/JclFJ1fAA6fJlLeA4FohOQ0b2xs3Gp3OmOeYAsWJKFMzFEycCp5QbR6+YClg/itBDxk/DawJ3ygOJIsVshb9O4XGN3o+6L6/V6WE7ql7ggpJN+JSJsqiqL10T5IcncmLoBolO3Pg3WKIOTeBPgsU61KaRiw0pTHTkP16owLFHDrDmoIW1ybS0UOtxP9BMxnqbes3lZBvr3ywLd4Xk8r4tgC3nhvPPviCge2WUg1/Wz3eEWx0D8KMUZip57A7A+6mkS++7fnEYsSs3+UTOUNp//sUAwyx7R3MjHrXdXun1C8raDAMqDQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(316002)(76116006)(6916009)(9686003)(55016002)(71200400001)(3480700007)(2906002)(8676002)(8936002)(86362001)(52536014)(6506007)(44832011)(5660300002)(26005)(122000001)(83380400001)(38100700002)(66446008)(53546011)(33656002)(66946007)(66556008)(64756008)(7696005)(478600001)(186003)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OWF4bXphUThzNnd0VkFaNW91UVNWcGVYTnl3RXZJZytleTVvd0t6WFYzcExV?=
 =?utf-8?B?dlE2bGdrcEF4dVEwZXFoTDJOdXZRelNNN1Z4S1hINnJOWVY1UGFpTWpuZkJr?=
 =?utf-8?B?SWllZ2FFRXpPOUdvMGIrNU92LzlFWUVzQStCcE5WbTVwaTlNTWZaRGpmcHdW?=
 =?utf-8?B?RXVhWkQ4ZnhoY3NSdFJDTHFHbmlWMHozZDdpam5YOTAxUmtldUltWUpFR2J3?=
 =?utf-8?B?QmdYZm5MQkhDMWxOUWtoSUh2Z0hjdjQwYTJHOEtCL2JFMVAvR0lKTG4zMVk5?=
 =?utf-8?B?TlpJbFRqemJZN1RNTmRJWG9wR2xZeitTaERUSWtjL3BKSDlmWUR3V1lHOTFU?=
 =?utf-8?B?SVN0NDNHMGpPTENDUFp6N3NKVFNHS0RSTy9XOFNhblVRdWo1ZjJiVFpCMFRC?=
 =?utf-8?B?OFowTEd0RGk2WHNwRWNVZ0g2djFKSko3c3dHQTAvNHZGV1FVVHhxNEgvQVhs?=
 =?utf-8?B?eGJsckU2OCtSL1QzUmRMRkpUR3JDQ0NWT2tNS2JSYkgxZm9yNks4Sit2WmJM?=
 =?utf-8?B?NklLQWhTcWZobk1SeXdDV3lESW1IbFhRZUlIQVpIbTlpL2xSZEFiWloyNTdi?=
 =?utf-8?B?d0lCSGFHOXBUbU1DYVpvV0xjdnZOVkUxQkcxQVE1V3pOTElHR1U1WXhMOXdp?=
 =?utf-8?B?dHlNQ3YyalpnaUkveUpmQUd3UU9JZFJxTkd2bVhMcDBwbXFGNTlqeWsxUTNr?=
 =?utf-8?B?alhjVFJiYUJCYnVDUXN2OWVrK09ZWGtVeEV3QkJINmhld2o4b2Ezbi9zM0V4?=
 =?utf-8?B?cWlCdnI5WnVReXc3OVR4cWNieTdHeW1HdG84dTJIUzlFY3RJK0hkWm5KQXZj?=
 =?utf-8?B?K1ZhNzZxQ2RnNExrVDlXaktlRmlJVXp1TDUxZDFYa0o5ZFFIcG9jQ0MxMzdp?=
 =?utf-8?B?K0RYQ1IwcXBmMnlCN1JtTE5lUjRmYXM3SVRoc1ppU3FvemlJdXV4Z1Mxa1Mr?=
 =?utf-8?B?TEVWMXVTYlZqNG9VRXlQbmhyNUk1MnFPYURZY0dMNzdaMUJBMCtObHdYWGVH?=
 =?utf-8?B?VTI0cXZDcWtUKzN5WkpDYlBKNmYzSEkrNXNCeCtSeEtzYVVJSmhCbXpXNUZi?=
 =?utf-8?B?bkF5bVJXQUJmUFFPalowZFIzMkwydms1WkdsS1dUMFFySFViS3NENndNcU9K?=
 =?utf-8?B?TjFrdXJuWjVKMEJRODA0WVZweFVMTXBvNmxLL2pYY1VWbWR0djFBaTQydys1?=
 =?utf-8?B?MnRod3RUaUFlUHR1eVF6TXVIVnVuc0pLdTRvRWljeC9Cdm5XR2tiYkxKSlcy?=
 =?utf-8?B?RXVrekZsLy9TVW4wdjhER1QreUxSNytuNUFaamlpMlVjcWxUOWsrK1pscVF6?=
 =?utf-8?B?M0MrdXhnOVkwTGp0MVRwWFl1RG8xeWllRFBORVZrRm9oWStqek9vWVIrWXZ0?=
 =?utf-8?B?R01VZkFBNXoxZlJraTFmczU2NWFCUFhKMlZwbjRRY09YRkNnL1R6VHg5TllO?=
 =?utf-8?B?QU1vMG1oaXFPSHlXZW1tdTR4K0NoNmZaWXVZd0tEQVZxKzBmd0F6T0F5bUtN?=
 =?utf-8?B?QWpBUHkxa0xmOGhuQXliV0JsN0VoSnFUWmVNQlZORDJKVFE1VmROYkkydFlP?=
 =?utf-8?B?dlNnUVZCbjVlcVZDK0FMc3FCQ3lUY3pULzUxQlFDWFV5bnZKQzRnZXpmUlRs?=
 =?utf-8?B?a3Jhdm9neE1udHE3dnpHZUdzTFViajNqRmUzMndnMlJ5L0xlYjV4WG50T2RD?=
 =?utf-8?B?QU5GZ0ZvOWVwZGpsUjNXakVpU2lVQWVJOHRncGw5S0RENFh6c1dQdU1yaTR1?=
 =?utf-8?Q?2/u5vignpplok8a4m2BW2gtKI2lONq+wp7vVqm2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bcdcb9-7333-45b3-dde5-08d9269e2302
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 14:44:48.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wz0YKf4SE3ophQi+XHHHZZw6jeiV1at/To8fB4sdJvLBXCxUwlfd/R+Aqmg9DMH4ILHqIxrNPPR5sGW/4Ps3B/bxhXlOQYT8yhHxKvu76PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB4596
X-Proofpoint-ORIG-GUID: bvPoIot1MUlIB_HqNo2YWMkDSrlcauZO
X-Proofpoint-GUID: bvPoIot1MUlIB_HqNo2YWMkDSrlcauZO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_09:2021-06-02,
 2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030101
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IEVkLCBhbmQgDQoNClBsZWFzZSBzZWUgaW5saW5lLiANCg0KTWFoZXNoDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkdGFub3VzQGdvb2ds
ZS5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKdW5lIDIsIDIwMjEgMTA6MjcgQU0NClRvOiBNYWhl
c2ggS3VyYXBhdGkgPG1haGVzaC5rdXJhcGF0aUBrZXlzaWdodC5jb20+DQpDYzogb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogRnJ1RGV2aWNlL0VudGl0eSBNYW5hZ2VyIHZz
IGh3bW9uDQoNCk9uIFNhdCwgTWF5IDI5LCAyMDIxIGF0IDEyOjQyIFBNIE1haGVzaCBLdXJhcGF0
aSA8bWFoZXNoLmt1cmFwYXRpQGtleXNpZ2h0LmNvbT4gd3JvdGU6DQo+DQo+IEhlbGxvLA0KPg0K
Pg0KPg0KPiBJIHdhbnQgdG8gZGVmaW5lIHRlbXBlcmF0dXJlIHNlbnNvcnMsIGZhbnMgYW5kIFBT
VXMgZm9yIG91ciBuZXcgcGxhdGZvcm0uICBHb2luZyB0aHJvdWdoIHRoZSBkb2N1bWVudGF0aW9u
IGFuZCBzb3VyY2VzLCAgSSB1bmRlcnN0YW5kIHRoYXQgdGhlcmUgYXJlIHR3byBhcHByb2FjaGVz
LiAgT25lIGlzIHRvIGRlZmluZSB0aGVtIHdpdGggdGhlIHNhbWUgaTJjIHBhdGggYXMgbWVudGlv
bmVkIGluIHRoZSBkZXZpY2UgdHJlZSBhcyBwYXJ0IG9mIHRoZSBod21vbiBjb25maWd1cmF0aW9u
LCBhbmQgdGhlIG90aGVyIGFwcHJvYWNoIGlzIHRvIGRlZmluZSBhIGpzb24gZmlsZSB3aXRoIGFw
cHJvcHJpYXRlIHByb2JlIGluIHRoZSBlbnRpdHktbWFuYWdlci9jb25maWd1cmF0aW9ucyBmb2xk
ZXIgc28gdGhhdCB0aGUgRnJ1RGV2aWNlIGFuZCBFbnRpdHkgTWFuYWdlciBhcHBzIGRldGVjdCB0
aGUgZGV2aWNlcyBhcyBwZXIgdGhlIHByb2JlIGFuZCBjcmVhdGUgdGhlIG1hdGNoaW5nIGRidXMg
b2JqZWN0cywgd2hpbGUgdGhlIGRidXMtc2Vuc29ycyBkbyB0aGUgaW5zdHJ1bWVudGF0aW9uLiAg
V2l0aCBlbnRpdHkgbWFuYWdlciBhcHByb2FjaCBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgaTJjIGRl
dmljZXMgYXJlIGNyZWF0ZWQvcHJvYmVkIHdoZW4gdGhleSBhcmUgZGV0ZWN0ZWQuICBNeSBxdWVz
dGlvbnMgaXMgd2UgZG9u4oCZdCBuZWVkIHRoZSBkZXZpY2UgZGVmaW5lZCBpbiB0aGUgZGV2aWNl
IHRyZWUgZmlsZSBpZiBJIGdvIGJ5IHRoaXMgYXBwcm9hY2g/DQoNCkNvcnJlY3QsIGFsdGhvdWdo
IHlvdSBjYW4gc3RpbGwgaW5jbHVkZSB0aGVtIGlmIHlvdSBsaWtlLg0KRW50aXR5LW1hbmFnZXIg
cmVsaWVzIG9uIHRoZSBuZXdfZGV2aWNlIHN5c2ZzIGludGVyZmFjZSB0byBjcmVhdGUgZGV2aWNl
cyBhcyB0aGV5J3JlIGZvdW5kLiAgSW4gdGhlIHBhc3Qgd2UndmUgdXNlZCBydW50aW1lLWdlbmVy
YXRlZCBkZXZpY2UgdHJlZSBvdmVybGF5cyB0byBhY2NvbXBsaXNoIHRoZSBzYW1lIHRoaW5nIChz
b21ldGhpbmcgSSdkIGxpa2UgdG8gc2VlIHVzIGdldCBiYWNrIHRvLCBidXQgdGhhdCdzIGEgZGlm
ZmVyZW50IHN0b3J5KS4NCltNYWhlc2hdOiBHb3QgaXQuIFRoYW5rIHlvdS4gDQoNCj4gSSB1bmRl
cnN0YW5kIHRoYXQgdGhpcyBoZWxwcyB0aGUgZHluYW1pYyBkZXRlY3Rpb24gb2YgdGhlIEZSVS4g
IEFsc28gd2UgaGF2ZSBMTTczLCBhbmQgb3RoZXIgdGVtcCBzZW5zb3IgVE1QNDMxYyB0aGF0IGlz
IG5vdCBkZWZpbmVkIGluIHRoZSBGcnVEZXZpY2UgcmVjb3JkIG1hcC4NCg0KV2hhdCByZWNvcmQg
bWFwIGFyZSB5b3UgcmVmZXJyaW5nIHRvPyAgU28gZmFyIGFzIEknbSBhd2FyZSwgdGhvc2UgZGV2
aWNlcyB3b3VsZCBleGlzdCBpbiBod21vbnRlbXBzZW5zb3IsIG5vdCBmcnUgZGV2aWNlLiAgVE1Q
NzMgYW5kIFRNUDQzMWMgY291bGQgYmUgYWRkZWQgaWYgdGhleSBoYXZlIGxpbnV4IGRyaXZlciBp
bXBsZW1lbnRhdGlvbnMuDQpbTWFoZXNoXTogSSBhbSByZWZlcnJpbmcgdG8gdGhlIG5ld19kZXZp
Y2UgbWFwcGluZyBkZXNjcmliZWQgaW4gdGhlIGZvbGxvd2luZyBsaW5rIHRoYXQgQW5kcmV3IGhh
ZCBwb2ludGVkIG91dC4gDQoNCj4gIE5leHQgcXVlc3Rpb24gaXMgZG8gSSBuZWVkIHRvIGFkZCBz
dXBwb3J0IGZvciB0aGUgTE03MyB0bXA3NU1QNDMxQyBhbmQgb3RoZXIgb25lIGluIHRoZSBGcnVE
ZXZpY2Ugc28gdGhhdCBpdCBnZXRzIGNyZWF0ZWQgcHJvcGVybHk/IENhbiBJIHVzZSBhbnkgZXhp
c3Rpbmcgc3RyaW5ncy9tYXBwaW5nIGZvciB0aGVzZSBzZW5zb3JzPw0KDQpJJ20gbm90IGZvbGxv
d2luZy4gIFdoYXQgIm1hcHBpbmdzIiBhcmUgeW91IHJlZmVycmluZyB0bz8NCltNYWhlc2hdOiBJ
IGFtIHJlZmVycmluZyB0byB0aGUgc3RyaW5nIG1lbnRpb25lZCBpbiB0aGUgIkV4cG9zZXMiIHNl
Y3Rpb24gb2YgdGhlIGNvbmZpZ3VyYXRpb25zLyouanNvbiBmaWxlIHRvIHRoZSBuZXdfZGV2aWNl
IHN0cmluZyB0byBiZSB1c2VkIHRvIGluc3RhbnRpYXRlL2JpbmQgdGhlIGRldmljZSB3aXRoIExp
bnV4IGtlcm5lbC4gDQoNCj4gIFRoaXMgaXMgbm90IG5lZWRlZCBpZiBJIGRlZmluZSB0aGUgZW50
cmllcyBpbiB0aGUgZGV2aWNlIHRyZWUsIGFuZCBpbnRlZ3JhdGUgd2l0aCBod21vbiBJIGhhdmUg
ZXZlcnl0aGluZyBuZWVkZWQuICBJIHNlZSB0aGF0IGh3bW9uIGFuZCBGcnVEZXZpY2UvRW50aXR5
IE1hbmFnZXIvZGJ1cy1zZW5zb3JzIHByb3ZpZGUgc2ltaWxhciBmdW5jdGlvbmFsaXR5LiAgQ2Fu
IEkgaGF2ZSBib3RoIG9mIHRoZXNlIHNlcnZpY2VzIHJ1bm5pbmcgYXQgdGhlIHNhbWUgdGltZSBv
biB0aGUgQk1DPw0KDQpIeXBvdGhldGljYWxseSB5b3UgY2FuLCBidXQgaXQncyBhIGJpdCBtZXNz
eSwgYW5kIEkgd291bGQgcmVjb21tZW5kIGFnYWluc3QgaXQuDQpbTWFoZXNoXTogT0suICBUaGFu
ayB5b3UgZm9yIHRoZSBpbnB1dC4gIEkgd2lsbCBoYXZlIGVpdGhlciB0aGUgcGhvc3Bob3ItaHdt
b24vRW50aXR5IE1hbmFnZXIuICBPbiBvdXIgc3lzdGVtIHdlIG9ubHkgaGF2ZSB0aGUgUFNVcyBh
bmQgdGhlIGZhbiByb3RvcnMgIGFyZSB0aGUgRlJVcy4gIE5vdGhpbmcgZWxzZS4gIElmIHRoZXJl
IGFyZSBubyBsb3Qgb2YgRlJVcywgSSB0aGluayBpdCBpcyBiZXR0ZXIgZ28gd2l0aCB0aGUgcGhv
c3Bob3ItaHdtb24gYXBwcm9hY2ggdG8gaW50ZWdyYXRlIHRoZSBzZW5zb3JzLiAgVGhpcyB3YXkg
SSBkb27igJl0IGhhdmUgdG8gd3JpdGUgYW55IG5ldyBjb2RlIHRvIHN1cHBvcnQgdGhlIG5ldyB0
ZW1wIHNlbnNvcnMuIA0KDQo+IFdpbGwgaXQgY2F1c2UgYW55IGNvbmZsaWN0cz8gIFBsZWFzZSBo
ZWxwIG1lIHVuZGVyc3RhbmQuDQo+DQo+DQo+DQo+IFRoYW5rIHlvdSwNCj4NCj4gTWFoZXNoDQo=
