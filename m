Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7F19B5F4
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 20:52:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48swLR2VXbzDrBs
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 05:52:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1360369fbe=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Wyf5BcR4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=i+LyeoB3; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48swDg4lF8zDrBg
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 05:47:46 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031Ik3W1008304; Wed, 1 Apr 2020 11:47:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=r148NuwOUe0W5Lszow9BEhOG5X/HoToOkIr+uebP0kk=;
 b=Wyf5BcR4Ot9t53YX1146MQkvEt+7YWeOWE7z4R2d38LSiFoT6yQ82pIKHhGDk1IU6H+U
 CtF5gHe95Gn/lOsBY59LW31ctliJuvLEyH+MI0osPq2Hjb7CiBjZVShwELh6RphvwlWc
 jR4ryg1yFcDV1LOeZTJgzab2A5iW+S9xUm4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303vbkx8qw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Apr 2020 11:47:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 1 Apr 2020 11:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTJ0BAG4zC2I18uSW3vlaE0VxUqN2XJ3TWBN2He9cTGyBZazJle5S7wydU4Em5WF7ymoJ6QmiBVpr195mOb1l9k0kGwhB8ijSqSjKzKeAqhDkDM6KtvzobBCBv/HC1mPQotRGdRmx+TRIbEVg5+RIxlflyA9TLQV7iL2Dv73adR+NVrrFuA5Rdg+JUvrE8kXn14ogrCRU9MLSN02HK7X5blS0kxyLg1HGLRnxSDikD8FXQjlaARLSz751s9/oKVbNTrBOC43cCHpzrTk3IRnoPhOFVYFh/v/P7nWkZgkMDFRN8J8j8IgXP/KBjrazrHoObB3Dqf2f83iNWVqRNyXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r148NuwOUe0W5Lszow9BEhOG5X/HoToOkIr+uebP0kk=;
 b=YiP6LkVQ353jy6u3qVRzeXGQ1rAj/oweFR8bPbWipUmbJwarI/K2JeOt8tFTtd7UjewKfJ+sRHu5rmSVPQSm8VEmvWLwcYrlfeGJV0t2w4296zKdGg+k6npr6SXMndqaVEved8BdY1RSO5HfNg49fr2gwLO7NftLFvWBLMEIIDAhbs8vN2DL2UaAuAtEzt0KR0UZCcjLrOOmxJ7uxJX19UDTh44ieMF2UgU4X/Hi5uGsGQqwvPlCRaX3/ac4jgE7qcomqkL9TE/5ZTk9dAOkWl/odPm2waOeDyMbs582LRJeBCzwsydn5Sh+ruAGfU9W8gzrWV52zbUyaqkjCGFZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r148NuwOUe0W5Lszow9BEhOG5X/HoToOkIr+uebP0kk=;
 b=i+LyeoB3676Jf6YO8HgryRgPxDzj66RmaZWFe6TVZp+xKvLNVQ/DrypR1UBgmQj+7m6HdxRIj5SPSlAUocpGO6PALgyfOfkDq0XPss/8r5L+QmtrwwXUX1c9ZpBshZGG6q5vU0EpiCPL8NgA8Ep/X5tX4ra39P9rQJzJ2avvtmY=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3770.namprd15.prod.outlook.com (2603:10b6:303:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 1 Apr
 2020 18:47:39 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 18:47:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Richard Hanley <rhanley@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Janitor/Gardener
Thread-Topic: OpenBMC Janitor/Gardener
Thread-Index: AQHWCEwz8Ox6Qocn30auvC12nO6LVKhkJhYA
Date: Wed, 1 Apr 2020 18:47:39 +0000
Message-ID: <F7B1155E-705F-402C-A60B-3C7B39E2675C@fb.com>
References: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
In-Reply-To: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:8884]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 143ad4ce-a655-45af-2a82-08d7d66d273b
x-ms-traffictypediagnostic: MW3PR15MB3770:
x-microsoft-antispam-prvs: <MW3PR15MB37708E34574A8856190D5BE0DDC90@MW3PR15MB3770.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(39860400002)(376002)(136003)(366004)(110136005)(66946007)(316002)(6512007)(36756003)(86362001)(6506007)(53546011)(66556008)(66446008)(64756008)(76116006)(66476007)(2906002)(5660300002)(966005)(186003)(3480700007)(71200400001)(2616005)(478600001)(81166006)(33656002)(81156014)(8936002)(9326002)(6486002)(8676002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9mZWP/qT9bbYsw4BFpGosd1gV7EwEjco5nLD43vitW/0kycG0FSRzJMk+ytHWYT1Tr7LBgmcLdz5+knFWbIaa4/ROBZevfwBoQUxHpMfl8vQp9QYimdqGwkrP5sLB6/1JEmhrHqnm00ls3E+OYUE4kPILKqshT/JSijJc6RXgG1dWT4X5L5rQFrSU6uK3e8wVZoDqsghSBzMnTnAZMEBlJXLpo3DS9jAgpDcIA0WKfFXvvqVqAiBUmuHKoj43PUeHTACek/K6r8Iycn5WwPRfCb/dKyzEbVXpmFmY7C531Y3J17c2wmwcw/cJOgvTzRE9AhdjM7CnL5WHWRq3+D9ODCuq6W9L0VZn9fYQrkJACu4A81SHqTxWGe6GeXo+CAbQqkCJ4sZtZl3OfEqh1lw2K0aBC6Ghr558JycgkTIGt0LUFtVkQqbJXAZ133HWYUY9HWnNhBWl6su/rY29ivt5swPrrZvi9VxO274g/r2NJleEnQ4g3Kof5vZVgCTmQYVxPgw22iQj0lRtEYWs+avxg==
x-ms-exchange-antispam-messagedata: GM+FjCILIgtU+BdVt4ixn/tTyhHk9Z1k0eG96LqlX8hrpYEN0dWstvynkmVcVl1oV5bQupvGk/arG12p3s4FrOHGR6mniMXrlHhHsoUyGAUfLgZMkkk9eODROKftaYAAUiS5iRYh8LcnF7aEuHsrdaQaoEz9zPURCoIqLzSqH9iKEhdrR12vydzwXxagDCpY
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_F7B1155E705F402CA60B3C7B39E2675Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 143ad4ce-a655-45af-2a82-08d7d66d273b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 18:47:39.3067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xz9Mboep1UAmsor27HD7eflQ8D+dBiKsOMmZeo05W82Ln52AO2+XqWSn7o8GQwt8uzz1Nh2El6JSqMlN0lHVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3770
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010153
X-FB-Internal: deliver
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

--_000_F7B1155E705F402CA60B3C7B39E2675Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNClRoYW5rcyBmb3Igc3RhcnRpbmcgdGhpcyBpbnRyb2R1Y3Rpb24sIEkgaGF2
ZSBiZWVuIGFsc28gdGhpbmtpbmcgaW4gdGhlIHNhbWUgbGluZSBhcyBoYXZpbmcgYSB3aXNobGlz
dCBwZXIgcHJvamVjdCBhbmQgd2UgY2FuIGNvbnNvbGlkYXRlIGl0IHRvIGNyZWF0ZSBwb29sIG9m
IHNtYWxsIHByb2plY3Qgd2hpY2ggY2FuIGJlIGdyYWJiZWQgYnkgYW55b25lIHdobyBpcyBpbnRl
cmVzdGVkIGluIGNvbnRyaWJ1dGluZy4gVGhpcyB3aWxsIGFsc28gcmVkdWNlIGR1cGxpY2F0aW9u
IG9mIGVmZm9ydCAgYnkgbXVsdGlwbGUgcGVvcGxlLCBpdCBjYW4gYmUgYSBjb21tb24gaW1wbGVt
ZW50YXRpb24uDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJv
dW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBS
aWNoYXJkIEhhbmxleSA8cmhhbmxleUBnb29nbGUuY29tPg0KRGF0ZTogV2VkbmVzZGF5LCBBcHJp
bCAxLCAyMDIwIGF0IDEwOjM3IEFNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KU3ViamVjdDogT3BlbkJNQyBKYW5pdG9yL0dhcmRlbmVyDQoNCkhpLA0K
DQpJIHdhcyByZWNlbnRseSBsb29raW5nIGludG8gdGhlIGxpbnV4IGtlcm5lbCBpbnRyb2R1Y3Rp
b24sIGFuZCBJIG5vdGljZWQgdGhlIGtlcm5lbCBqYW5pdG9ycyBodHRwczovL2tlcm5lbG5ld2Jp
ZXMub3JnL0tlcm5lbEphbml0b3JzPGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92
Mi91cmw/dT1odHRwcy0zQV9fa2VybmVsbmV3Ymllcy5vcmdfS2VybmVsSmFuaXRvcnMmZD1Ed01G
YVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgw
dlhra2NySWFxVTdVU2w1ZyZtPVp6ZkJRQXphUjJ2WVdLNnVWWGdPV2xjVkpSV0xnOU5Uc01tX2R4
Z3M0bVkmcz1ya1J5NTZWM3liaEpwSV9jcnR5QzNLd3FyMi0ydE15NkxreTJmSXp2WWFFJmU9Pi4g
IEl0IHNlZW1zIGxpa2UgYSBwcmV0dHkgaW50ZXJlc3RpbmcgaWRlYSwgYW5kIEkndmUgYmVlbiB0
aGlua2luZyBhYm91dCBqYW5pdG9yaWFsIHRhc2tzIGluIE9wZW5CTUMuDQoNCkZvciBzb21lIGNv
bnRleHQsIHdlJ3ZlIGhhZCBhIGhhbmRmdWwgb2YgbmV3IGRldmVsb3BlcnMgam9pbiByZWNlbnRs
eSwgYW5kIEkndmUgYmVlbiBsb29raW5nIGZvciBzb21lIHNtYWxsIHJlZmFjdG9yaW5nIHByb2pl
Y3RzIHRoYXQgdGhleSBjb3VsZCB3b3JrIG9uIHVwc3RyZWFtLg0KDQpTbyBJIGd1ZXNzIHRoZXJl
IGFyZSB0d28gcGFydHMgdG8gdGhpcyBlbWFpbC4gIEZpcnN0IGRvZXMgYW55b25lIGhhdmUgc29t
ZSBiaXRlIHNpemVkIGltcHJvdmVtZW50IHRhc2sgdGhhdCdzIGJlZW4gb24gdGhlaXIgd2lzaGxp
c3QsIGJ1dCB0aGVyZSBoYXNuJ3QgYmVlbiBhbnlvbmUgYXJvdW5kIHRvIHdvcmsgb24gaXQuICAo
SW4gcGFydGljdWxhciB0aGluZ3MgYXJvdW5kIGJtY3dlYiBhbmQgcGhvc3Bob3IgZGJ1cyBpbnRl
cmZhY2VzIHdvdWxkIGJlIGFwcHJlY2lhdGVkKS4NCg0KVGhlIG90aGVyIHRoaW5nIGlzLCB3aGF0
IGRvIHBlb3BsZSB0aGluayB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gcHVibGljaXplIHRoZXNl
IGtpbmRzIG9mIHJlZmFjdG9yaW5nL2phbml0b3JpYWwvZ2FyZGVuaW5nIHRhc2tzLiBPbmUgd2F5
IHdvdWxkIGJlIHRvIGNyZWF0ZSBhICpnYXJkZW5pbmcqIHRhZyBpbiB0aGUgZ2l0aHViIGlzc3Vl
cy4gIFRoYXQgd2F5IHBlb3BsZSBjYW4gc2V0IHVwIGZpbHRlcnMgZm9yIGlkZWFzIHRoYXQgZXhw
ZXJ0cyB0aGluayBhcmUgYSBnb29kIGlkZWEsIGJ1dCBwcm9iYWJseSB3b24ndCBuZWVkIGRlZXAg
ZGVzaWduIGRpc2N1c3Npb25zIHRvIGdldCBzdGFydGVkLg0KDQpBbm90aGVyIHdheSB3b3VsZCBi
ZSB0byBoYXZlIGEgbW9udGhseS9xdWFydGVybHkgd2lzaGxpc3QgZ2F0aGVyaW5nIG9uIHRoZSBt
YWlsaW5nIGxpc3QuICBUaGF0IHdheSB3ZSBoYXZlIHNvbWUgZGVkaWNhdGVkIHRpbWUgdG8gZGlz
Y3VzcyBpc3N1ZXMgb2YgdGhlIGRheSwgYW5kIHB1dCB0aGVtIHRvZ2V0aGVyIGludG8gYSBtYXJr
ZG93biBkb2N1bWVudCAobGlrZSBhIHBlciBwcm9qZWN0IHZlcnNpb24gb2YgdGhlIHNlY3VyaXR5
IGdyb3VwIHdpc2hsaXN0IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9T
ZWN1cml0eS13b3JraW5nLWdyb3VwI3NlY3VyaXR5LWZlYXR1cmUtd2lzaC1saXN0KQ0KDQpNYXli
ZSB0aGlzIGlzIGFscmVhZHkgaGFwcGVuaW5nLCBhbmQgSSBqdXN0IGhhdmVuJ3Qgbm90aWNlZCBp
dC4gIEFueXdobywgaG9wZSB5b3UgYXJlIGFsbCBkb2luZyB3ZWxsLg0KDQpDaGVlcnMsDQpSaWNo
YXJkDQo=

--_000_F7B1155E705F402CA60B3C7B39E2675Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9AE3E2942E83C348B097E4513B0A4579@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29D
aHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4w
cHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjox
LjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNl
Y3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0i
Ymx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+SGkgUmljaGFyZCw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPlRoYW5rcyBmb3Igc3RhcnRpbmcgdGhpcyBpbnRyb2R1Y3Rpb24sIEkgaGF2ZSBiZWVu
IGFsc28gdGhpbmtpbmcgaW4gdGhlIHNhbWUgbGluZSBhcyBoYXZpbmcgYSB3aXNobGlzdCBwZXIg
cHJvamVjdCBhbmQgd2UgY2FuIGNvbnNvbGlkYXRlIGl0IHRvIGNyZWF0ZSBwb29sIG9mIHNtYWxs
IHByb2plY3Qgd2hpY2ggY2FuIGJlIGdyYWJiZWQgYnkgYW55b25lIHdobyBpcyBpbnRlcmVzdGVk
IGluIGNvbnRyaWJ1dGluZy4NCiBUaGlzIHdpbGwgYWxzbyByZWR1Y2UgZHVwbGljYXRpb24gb2Yg
ZWZmb3J0ICZuYnNwO2J5IG11bHRpcGxlIHBlb3BsZSwgaXQgY2FuIGJlIGEgY29tbW9uIGltcGxl
bWVudGF0aW9uLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5SZWdhcmRzPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tVmlqYXk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7
Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4i
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7
Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4w
cHQ7Y29sb3I6YmxhY2siPm9wZW5ibWMgJmx0O29wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVt
a2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBSaWNoYXJkIEhhbmxl
eSAmbHQ7cmhhbmxleUBnb29nbGUuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5XZWRuZXNkYXks
IEFwcmlsIDEsIDIwMjAgYXQgMTA6MzcgQU08YnI+DQo8Yj5UbzogPC9iPk9wZW5CTUMgTWFpbGxp
c3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+
T3BlbkJNQyBKYW5pdG9yL0dhcmRlbmVyPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSwgPG86cD48L286cD48L3A+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIHdhcyByZWNlbnRseSBsb29raW5nIGludG8gdGhlIGxp
bnV4IGtlcm5lbCBpbnRyb2R1Y3Rpb24sIGFuZCBJIG5vdGljZWQgdGhlIGtlcm5lbCBqYW5pdG9y
cyZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/
dT1odHRwcy0zQV9fa2VybmVsbmV3Ymllcy5vcmdfS2VybmVsSmFuaXRvcnMmYW1wO2Q9RHdNRmFR
JmFtcDtjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmYW1wO3I9djlNVTBLaTlwV25UWENXd2pIUFZn
cG5DUjgwdlhra2NySWFxVTdVU2w1ZyZhbXA7bT1aemZCUUF6YVIydllXSzZ1VlhnT1dsY1ZKUldM
ZzlOVHNNbV9keGdzNG1ZJmFtcDtzPXJrUnk1NlYzeWJoSnBJX2NydHlDM0t3cXIyLTJ0TXk2TGt5
MmZJenZZYUUmYW1wO2U9Ij5odHRwczovL2tlcm5lbG5ld2JpZXMub3JnL0tlcm5lbEphbml0b3Jz
PC9hPi4mbmJzcDsNCiBJdCBzZWVtcyBsaWtlIGEgcHJldHR5IGludGVyZXN0aW5nIGlkZWEsIGFu
ZCBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgamFuaXRvcmlhbCB0YXNrcyBpbiBPcGVuQk1DLjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Gb3Ig
c29tZSBjb250ZXh0LCB3ZSd2ZSBoYWQgYSBoYW5kZnVsIG9mIG5ldyBkZXZlbG9wZXJzIGpvaW4g
cmVjZW50bHksIGFuZCBJJ3ZlIGJlZW4gbG9va2luZyBmb3Igc29tZSBzbWFsbCByZWZhY3Rvcmlu
ZyBwcm9qZWN0cyB0aGF0IHRoZXkgY291bGQgd29yayBvbiB1cHN0cmVhbS48bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+U28gSSBndWVzcyB0aGVy
ZSBhcmUgdHdvIHBhcnRzIHRvIHRoaXMgZW1haWwuJm5ic3A7IEZpcnN0IGRvZXMgYW55b25lIGhh
dmUgc29tZSBiaXRlIHNpemVkIGltcHJvdmVtZW50IHRhc2sgdGhhdCdzIGJlZW4gb24gdGhlaXIg
d2lzaGxpc3QsIGJ1dCB0aGVyZSBoYXNuJ3QgYmVlbiBhbnlvbmUgYXJvdW5kIHRvIHdvcmsgb24g
aXQuJm5ic3A7IChJbiBwYXJ0aWN1bGFyIHRoaW5ncyBhcm91bmQgYm1jd2ViIGFuZCBwaG9zcGhv
ciBkYnVzDQogaW50ZXJmYWNlcyB3b3VsZCBiZSBhcHByZWNpYXRlZCkuPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoZSBvdGhlciB0aGluZyBp
cywgd2hhdCBkbyBwZW9wbGUgdGhpbmsgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIHB1YmxpY2l6
ZSB0aGVzZSBraW5kcyBvZiByZWZhY3RvcmluZy9qYW5pdG9yaWFsL2dhcmRlbmluZyB0YXNrcy4g
T25lIHdheSB3b3VsZCBiZSB0byBjcmVhdGUgYSAqZ2FyZGVuaW5nKiB0YWcgaW4gdGhlIGdpdGh1
YiBpc3N1ZXMuJm5ic3A7IFRoYXQgd2F5IHBlb3BsZSBjYW4gc2V0IHVwIGZpbHRlcnMgZm9yDQog
aWRlYXMgdGhhdCBleHBlcnRzIHRoaW5rIGFyZSBhIGdvb2QgaWRlYSwgYnV0IHByb2JhYmx5IHdv
bid0IG5lZWQgZGVlcCBkZXNpZ24gZGlzY3Vzc2lvbnMmbmJzcDt0byBnZXQgc3RhcnRlZC48bzpw
PjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QW5vdGhl
ciB3YXkgd291bGQgYmUgdG8gaGF2ZSBhIG1vbnRobHkvcXVhcnRlcmx5IHdpc2hsaXN0IGdhdGhl
cmluZyBvbiB0aGUgbWFpbGluZyBsaXN0LiZuYnNwOyBUaGF0IHdheSB3ZSBoYXZlIHNvbWUgZGVk
aWNhdGVkIHRpbWUgdG8gZGlzY3VzcyBpc3N1ZXMgb2YgdGhlIGRheSwgYW5kIHB1dCB0aGVtIHRv
Z2V0aGVyIGludG8gYSBtYXJrZG93biBkb2N1bWVudCAobGlrZSBhIHBlciBwcm9qZWN0IHZlcnNp
b24gb2YgdGhlDQogc2VjdXJpdHkgZ3JvdXAgd2lzaGxpc3QmbmJzcDs8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvU2VjdXJpdHktd29ya2luZy1ncm91cCNz
ZWN1cml0eS1mZWF0dXJlLXdpc2gtbGlzdCI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3Bl
bmJtYy93aWtpL1NlY3VyaXR5LXdvcmtpbmctZ3JvdXAjc2VjdXJpdHktZmVhdHVyZS13aXNoLWxp
c3Q8L2E+KTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5NYXliZSB0aGlzIGlzIGFscmVhZHkgaGFwcGVuaW5nLCBhbmQgSSBqdXN0IGhhdmVuJ3Qg
bm90aWNlZCBpdC4mbmJzcDsgQW55d2hvLCBob3BlIHlvdSBhcmUgYWxsIGRvaW5nIHdlbGwuPG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkNoZWVy
cyw8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJp
Y2hhcmQ8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_F7B1155E705F402CA60B3C7B39E2675Cfbcom_--
