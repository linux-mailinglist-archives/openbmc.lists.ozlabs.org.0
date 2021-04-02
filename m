Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E288535271A
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 09:53:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBXNW6Ggcz3bmg
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 18:53:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=l3ZwzFLb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.101;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=l3ZwzFLb; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2101.outbound.protection.outlook.com [40.107.92.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBXNG0lxcz2xZF
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 18:52:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMikWtmKpDESvHkZaLawM53CYDfqFy9kMpWvM5LkPkEMWaueqs53ccNR7jhGf/wbM/bY8f1gCfYAQDPCTfBAdP0JB2QMeZarJUfrFe38vZQ1GNON+Xl7A6a6COEdUZ7F2dY+3hihvdf0REt6ytmkkrIaGcHf7i5JI5pjOff+Wn1xSea2Y+OghjIgBa0KNlRalF8CNe6oftCKPSJJRWET+hpW4ScN2rE+f04V/Ft6mQxrKfin/ot1beN0CpGd5f65VBCxm7dUBDtd0zI5Mh7vX9ygv/WrXwkWfnFCb7z8mXSTzQ2t5BPzqiOTXYu2Jpc5anaVESR6oRWyBGenh2zGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/df3x1tcdw57vMBkFRnBrWPw9RXANxn2iprrNohqvo=;
 b=WdgeIJTuWpUU3Kb40NxVKD+48b+FJhC8T9wToWe5TCkBgLLqsXftVj5MQzbJwLPzmWQOhG3bhTdJUwdZ85xovsyw1aEbnHa8N7plglTXAk++4TpdNZc6b7OKSFYA2XrMcUakiVlnQJUF1/1b0UWCeRuaYtYNUnducTnTKVeRzudBgfVFqyzrNymxlZOJfby2rDZbHgC2dcMPFw8GdsXYq9FyzMa5c8ZmS6fPnklDd/gaRLr9P5F1/A3Og3RTTRgHFNnxgjxntXn56r+qxZnctRA3awjRKyfb5k/EyOEzK75xTzPVPVAT5xIVFHr36CezDhEaomZQVRY38sp5fBjhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/df3x1tcdw57vMBkFRnBrWPw9RXANxn2iprrNohqvo=;
 b=l3ZwzFLbZUEAXJ8ledROOekklj/tmXOaeilEwIO739Peq20wWN6grZmKqrdWqTkYLL6yiTIDcJr01yyaqR/eE5GrvfXVXACqGkUR9uY6NbwcClJ5dATkKabE4UBKDC8hTD3tMl9qhUxJnUCVNwBCudunmMXcjBwgB0VdeHzQ7KU=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4745.prod.exchangelabs.com (2603:10b6:5:67::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Fri, 2 Apr 2021 07:52:52 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 07:52:46 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Topic: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Index: AQHXJdOU6ZunssCJTkiHUAYwame9R6qeRj+AgAMNx4A=
Date: Fri, 2 Apr 2021 07:52:45 +0000
Message-ID: <7843F2AF-30DE-4F78-B7C1-2BBDC99689B5@amperemail.onmicrosoft.com>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
 <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
In-Reply-To: <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92241c4a-0773-496d-6905-08d8f5ac4ded
x-ms-traffictypediagnostic: DM6PR01MB4745:
x-microsoft-antispam-prvs: <DM6PR01MB4745DE6C4429A6131AABAB3E907A9@DM6PR01MB4745.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JuJj8JtO7qy45NNhwJDrwv4hn0JPf+tQfl5li2/BJ5fCxuy04LmfhrIo1OF0QzA2D/k8QGbVN0VnmA3w58xbNrpFJ6jBVLXkDCUQJrTZGcG/IWaC9qNSROh7f6zag8U1vrt1fZaVMbC99R87GegZUxNFxuGOgnUNBouhJ04nSJpU87y1uy7mV/gEftoko1DAM3tLHfXIT3N0lTnYOhrCz7OACQLQnIUsKQhLw6CutrOxoli9fvtAX9mbiE7RGLqcm0OHIusAREXiRvSeJx87dRaOSKoUs6JNlDuVbQMQq8+U4JwqUpPiASw5eiBzTCwgTkTpVlOifybAccim1R1m9iZHfBIYW7WWUMZ+t8bDJxa86h4VrNmcw+XjIV7SXM02FJX5VNe+oBw6vuZ+9eKxjBBUz+Ij+BVCf+WKpPH+NkCPsa/1p7QEkHcIE7rA7ZTfH0FD4Z6bPIVK3wGqWR643G5RYtOB36siXvZtOjbve6WCo1uXmLgOkx0JhmVTMQIW+3J2YsgNtjsV5pGpEuFdnJR7B0C0lMhzowMxWVyHp4vX7zK2VdhEmugk3hZ/kMptmzOWTc/drB4QoSSRiCBRhBInDIaZrdv0/beKUhwtHry7J030V7qLpfKqD0O3wSqwG0/hBQhe9U/ErYjmOYdhkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(8676002)(76116006)(110136005)(91956017)(66946007)(64756008)(83380400001)(66556008)(66476007)(6506007)(53546011)(71200400001)(33656002)(316002)(6512007)(9686003)(6486002)(86362001)(2906002)(38100700001)(478600001)(8936002)(66446008)(5660300002)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cm16MVNsbkplUHE3MWV6YVNKWUd4RTQyOXUvQlRxL2N4L1l2Nzg3MDZIWVBS?=
 =?utf-8?B?cGJkNGJlUUQvWnhTNjU2N2tHc1hKcS9HNG5pYnFXVTZXME9zVmtnMWU2czZO?=
 =?utf-8?B?SnkweTBsZGFrbkFkcG1lMXM3VDlZM2FaWVBUcEd1SFNQVUJldGtDZFg4Z29w?=
 =?utf-8?B?ME5YMFYxSHJabDVDU0hqU3B3bFA2Sm8zZzhnRldoa1VJVUtiRXJrbm50SXdp?=
 =?utf-8?B?M2l0akJ5bDZsUGFXSnJMdGxZOXpHYmlIMEdiRWJxdUd3Nzc3T0xjd0V1RXgz?=
 =?utf-8?B?ZnQ2NEJITXFldmkvRGdZeTB6Y2crWEFKeGx6VDFlV3d3dUZEaHVzbEJXM21S?=
 =?utf-8?B?RksyWmdHRytIVE1BQTk3S2lCbGZhTW5naERxZ1lUYmVjS1I0dk5HS09vSno5?=
 =?utf-8?B?SUxmNUF1YWZnMkgrSjVVS2NZdFRMRHE5YTFSUDN2MFJ1cEZpRmptVi9lZTRZ?=
 =?utf-8?B?Z3cybjlrV3o4NjlHSThkVWp2cktRa1RwK1h5MUNaUUJOVTR4OVBCM2pvUnB0?=
 =?utf-8?B?TmdVM2hwSzg3ZGJDazgvYU1JWWJxSWx2TThNWDk1OUNLL3lIcjRWTm9XL0xK?=
 =?utf-8?B?ZVU5eG1zejNUVU0xaFVXdlVTZ2xpZHZiYzFpMmk1R3o1S05zODlnN1VHZllV?=
 =?utf-8?B?YUJSS0psOXdRTDJCRTJPaTY1Wmpvejh4Y3p6cFlKYmplQ05aVEtrbFByR0du?=
 =?utf-8?B?WkRkK01id0ZUZ1dQQURuOTB0N1JqSVJOOTNNb3hlVjZNMndiOFE1VlpJTzlp?=
 =?utf-8?B?RGd4Rk0vaEhucFltQ1NCejR1VG5lbDdyUmN2L3VvZTU5K3hGSDZlSlVpTW42?=
 =?utf-8?B?OGlpVmRpWHlRa2Zsd1E3b0taRVhyYWYxbFBoQ1Z1TFA5ZnRDZE90MUVyZ1FQ?=
 =?utf-8?B?TE1ZYmJxN0hUM2Q5bUpaNFRDSDZKaEw4d25UM3I3bmRiZ2RTTHluS2hCcjhx?=
 =?utf-8?B?QzlFTnJlekk1OWJqVlR6UUI1SVhXUGR1SndIVWNxZUFwYk5CSG9sR1pkdlg5?=
 =?utf-8?B?VFZ2aHdGK0x4UG5aWlF3bDg4TjVaM3M1RDJzV2ozYUpRaXJSZ0RZTkxENm5t?=
 =?utf-8?B?MFdxOEdTZ0QrRmdRUVBYN05Pa0d1V3FXV0grb3ZhdmNVelJZZXZtY2hSYVMy?=
 =?utf-8?B?V3dQQWpSKzYvYjJUaldLS2FJZ3lKTzh3RGlFV2w5VVRkUThmL1l1NjFjc3dD?=
 =?utf-8?B?dGxwRC9uMVFlTnI2MFNJU3JtcFV5ZTVxdk5wbVBUNTA2MXdodENSQ09wcFZi?=
 =?utf-8?B?Tk13QjJJTHFHTXBoSFBBOTZvVlhOR1AxTTU4UFJtN0RlMXd0TXRQdnJNbW1P?=
 =?utf-8?B?WXZ6UExvZkhBaEpWR08rQTFDZktCRG5qQTBLd0JVOStjYnphaVVFZ1VZTTcy?=
 =?utf-8?B?eXRmREZNcWtadGNQMzVuVmZEWVZXQnlyb1VmOWdSYWk2SVpUMk15azhua21n?=
 =?utf-8?B?UlptRzJneEVlUDZTcDRaQWlZRUEwU1NqaTJ3RGlyMmRSbTF3Ky9xMldaV2VH?=
 =?utf-8?B?UzBzam5XZFNwR2VFL3RQNVV6UHF0NEtKaGM3Y3BOaFRsaHhqM1VWaEZVMng0?=
 =?utf-8?B?aURhNG44NWd3Vk5uSW40MHErK2t0REF2K0FMTHE4RmQxSXUvbUdJeG9ZTDVi?=
 =?utf-8?B?eGxMbC9vYzh6QzhtbG9lYSsrT3M3Snp6amZSdGhIRkhuSTdQYW1sYWMrOWUr?=
 =?utf-8?B?WHFnT2VoR2tqbHZ2VGxqTGNpeDl4dDB1R0o4VktUM25lNExXYzFndlFPbGRG?=
 =?utf-8?Q?uIZHD5QkRFn/5RvVlIt3KLGb8UEfTVMH9ZtbD+i?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B7574A701E0D945BA2EEE24ED6384D8@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92241c4a-0773-496d-6905-08d8f5ac4ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 07:52:46.1920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeasXnvqYBPhT9+LT4m+GRK7+pV6FN/1DqRqSxmgSJmig1NKVP0gvd9/M9pejGGeVJMuCp0lVXtvnsgGjj2fGG8my7H7yqBA4Esl2Rp7Pxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4745
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

SSB0aG91Z2h0IHRoYXQgT3BlbkJtYyBjb21tdW5pdHkgaGF2ZSB0byBoYXZlIHRoZSBzb2x1dGlv
biBmb3IgdGhpcy4NCkkgY2FuIHByb3Bvc2UgbXkgc29sdXRpb24gYnV0IEkgZG9uJ3QgdGhpbmsg
aXQgaXMgY29tbW9uIGVub3VnaC4NCg0KUmVnYXJkcywNClRodSBOZ3V5ZW4uDQoNCu+7v09uIDMx
LzAzLzIwMjEsIDIzOjE0LCAiSm9zZXBoIFJleW5vbGRzIiA8anJleUBsaW51eC5pYm0uY29tPiB3
cm90ZToNCg0KICAgIE9uIDMvMzAvMjEgOToxNCBQTSwgVGh1IE5ndXllbiBPUyB3cm90ZToNCiAg
ICA+IEhpIEFsbCwgQ3VycmVudGx5LCBJbiBNdGphZGUgcGxhdGZvcm0gb2YgQW1wZXJlLCB3ZSBo
YXZlIFNNUHJvIG1kZiANCiAgICA+IGRyaXZlcnMgKFNNUHJvIGh3bW9uLCBTTVBybyBlcnJtb24s
IFNNUHJvIG1pc2MgZHJpdmVyKS4gVGhlIGRyaXZlcnMgDQogICAgPiB3aWxsIGJlIGxvYWRlZCBi
eSBrZXJuZWwgd2hlbiB0aGUgQk1DIGJvb3QgdXAuIEJ1dCB0aGV5IGFyZSBvbmx5IA0KICAgID4g
YmluZGVkIHdoZW4gdGhlIGhvc3QgaXMgYWxyZWFkeSBPbi4g4oCNIOKAjSDigI0g4oCNIA0KICAg
ID4NCiAgICA+IEhpIEFsbCwNCiAgICA+DQogICAgPiBDdXJyZW50bHksIEluIE10amFkZSBwbGF0
Zm9ybSBvZiBBbXBlcmUsIHdlIGhhdmUgU01Qcm8gbWRmIGRyaXZlcnMgDQogICAgPiAoU01Qcm8g
aHdtb24sIFNNUHJvIGVycm1vbiwgU01Qcm8gbWlzYyBkcml2ZXIpLg0KICAgID4NCiAgICA+IFRo
ZSBkcml2ZXJzIHdpbGwgYmUgbG9hZGVkIGJ5IGtlcm5lbCB3aGVuIHRoZSBCTUMgYm9vdCB1cC4g
QnV0IHRoZXkgDQogICAgPiBhcmUgb25seSBiaW5kZWQgd2hlbiB0aGUgaG9zdCBpcyBhbHJlYWR5
IE9uLg0KICAgID4NCiAgICA+IFRoZXkgYXJlIGFsc28gdW5iaW5kZWQgd2hlbiB0aGUgaG9zdCBp
cyBPZmYuDQogICAgPg0KICAgID4gVG8gc3VwcG9ydCBiaW5kaW5nL3VuYmluZGluZyB0aGUgU01Q
cm8gZHJpdmVzciwgd2UgaGF2ZSBvbmUgc2VydmljZSANCiAgICA+IG5hbWUgZHJpdmVyLWJpbmRl
ci4NCiAgICA+DQogICAgPiAgMS4gV2hlbiB0aGUgRGJ1cyBwcm9wZXJ0eSBDdXJyZW50SG9zdFN0
YXRlIG9mIHNlcnZpY2UNCiAgICA+ICAgICB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkhvc3Qg
Y2hhbmdlcyB0byDigJxub3QgT2Zm4oCdLCB3ZSB3aWxsIGJpbmQNCiAgICA+ICAgICB0aGUgZHJp
dmVycy4NCiAgICA+ICAyLiBXaGVuIHRoZSBEYnVzIHByb3BlcnR5IFJlcXVlc3RlZEhvc3RUcmFu
c2l0aW9uIG9mIHNlcnZpY2UNCiAgICA+ICAgICB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkhv
c3QgT1IgRGJ1cyBwcm9wZXJ0eQ0KICAgID4gICAgIFJlcXVlc3RlZFBvd2VyVHJhbnNpdGlvbiBv
ZiB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkNoYXNzaXMNCiAgICA+DQogICAgPiBjaGFuZ2Ug
dG8gT2ZmLCB3ZSB3aWxsIHVuYmluZCB0aGUgZHJpdmVycy4NCiAgICA+DQogICAgPiBUaGUgZHJp
dmVyLWJpbmRlciBpcyB3b3JraW5nIGFzIGV4cGVjdGVkLCBpdCBoYXZlIHRoZSBjb25maWd1cmF0
aW9uIA0KICAgID4gZmlsZSB0byBjb25maWd1cmUgd2hpY2ggZHJpdmVycyB3aWxsIGJlIGJpbmRl
ZC91bmJpbmRlZC4NCiAgICA+DQogICAgPiBCdXQgdGhhdCBpcyBvdXIgc29sdXRpb24uDQogICAg
Pg0KICAgID4gRG8gd2UgaGF2ZSBhbnkgY29tbW9uIHNvbHV0aW9uIHRvIGRvIHRoYXQgam9iPw0K
ICAgID4NCg0KICAgIFRodSwNCg0KICAgIEkgZG9uJ3QgaGF2ZSBhIHNvbHV0aW9uLiAgQnV0IEkg
ZG8gd2FudCB0byBiZSBhYmxlIHRvIGJpbmQgYW5kIHVuYmluZCANCiAgICBkcml2ZXJzIGZvciB0
aGUgQk1DLWF0dGFjaGVkIFVTQiBwb3J0cyAoYXMgdGhlIHVuZGVybHlpbmcgbWVjaGFuaXNtIHdo
ZW4gDQogICAgdGhlIEJNQyBhZG1pbiBkaXNhYmxlcyB0aGUgcG9ydHMpLCBzbyBJIHRoaW5rIGl0
IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIA0KICAgIGNvbW1vbiBzb2x1dGlvbiBvciB1bmRlcnN0
YW5kIHRoZSBiZXN0IHByYWN0aWNlcy4NCg0KICAgIEpvc2VwaA0KDQogICAgPiBSZWdhcmRzLg0K
ICAgID4NCiAgICA+IFRodSBOZ3V5ZW4uDQogICAgPg0KDQoNCg==
