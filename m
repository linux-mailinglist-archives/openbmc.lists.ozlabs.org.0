Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F638E6C04
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 06:38:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471k5R6tv0zDqfr
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 16:38:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=019953c221=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yW5h39YkzDqCF
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 11:11:59 +1100 (AEDT)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N0BqK9018989; Wed, 23 Oct 2019 00:11:55 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 2vt9shgv37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 00:11:55 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id 80296D8;
 Wed, 23 Oct 2019 00:11:46 +0000 (UTC)
Received: from G4W9326.americas.hpqcorp.net (16.208.32.96) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 23 Oct 2019 00:11:44 +0000
Received: from G2W6311.americas.hpqcorp.net (16.197.64.53) by
 G4W9326.americas.hpqcorp.net (16.208.32.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 23 Oct 2019 00:11:44 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.241.52.10) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Wed, 23 Oct 2019 00:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg2nKGufkcVhl4GlH/DhHGBaNREin1sQCVZPAWZcshhZrdQttvXO0TrD/7DlTAypD37g5BLtyKl0kms9lW5RMWelwf2mEThOyAotRfWSXcmdEmMSK3w7/4B0Q5IsE+pKwIjBYOr7/acvj8igbVNQhasJqnuXMqrSaKm2dpMJpNNLvrJh3+J81r7sj/aAlauUSx/euTeGSgsegSibywNt8GvyjHE7xvhWjtvbNcccty2s7YAho0pCuElnhl0kwP8bJtgOk3+VZUd0HeVMJS8RAi3yzVYeZPfv+RjVJk/Q+8I73m1HTdMCSwr73vs8PRW+067w94nqYtgXfV8mVxfxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/rpF7xuvyEZ0jENumLSSzGhocBSBn54wwbT/Ok2/IQ=;
 b=EkVCuyzSeIT3uLH2yT4t6tzx5KcuMhOCsgk8Lbfk8QgqIofqsduyK5BrOj+rLEZficnNPvasxIkdbyavkNx6nzyzuZMBPYouZCn9yv7xm2Xw7Ar+9ZoWuJ8PS+J8WH4ws18/sh4iLRLwOAj5KMFe1gbIxszRisisTwh1TpKfqnt51XCNRk6R0QFOs94RvDdwFuToQAkdlr4KnKTA4eiTOwwBeuS95qh9IWEtyf57afHivBq7tkrOagL+zZX4F3UIi7xxRfBusSb3YQBUMSBX2rJNxQdHV98ghnuto5HP41rONalaKa393HHzyOSuKtUbuiEEnTx2n4Yt1ru8ymhnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.136) by
 DF4PR8401MB0345.NAMPRD84.PROD.OUTLOOK.COM (10.169.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Wed, 23 Oct 2019 00:11:43 +0000
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a]) by DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a%6]) with mapi id 15.20.2347.029; Wed, 23 Oct 2019
 00:11:31 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Deng Tyler <tyler.sabdon@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: There is no image generated while build ast2500 evb
Thread-Topic: There is no image generated while build ast2500 evb
Thread-Index: AQHViLVQFyoPWZTRfEOkaxydgwCPXqdnSwpg
Date: Wed, 23 Oct 2019 00:11:30 +0000
Message-ID: <DF4PR8401MB10846D55E37921FB321B0EC4D86B0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
References: <CAO9PYRJk09g_NbpCWOedcFpeqbcec=jptfiOerO8TPDKGChOgQ@mail.gmail.com>
In-Reply-To: <CAO9PYRJk09g_NbpCWOedcFpeqbcec=jptfiOerO8TPDKGChOgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.226.189.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5039ff5a-2f96-4554-0051-08d7574d8e7c
x-ms-traffictypediagnostic: DF4PR8401MB0345:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DF4PR8401MB034572C6E8BF22AC393B5012D86B0@DF4PR8401MB0345.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(53754006)(316002)(5660300002)(476003)(486006)(71200400001)(86362001)(110136005)(11346002)(446003)(186003)(2906002)(7696005)(53546011)(102836004)(76176011)(99286004)(52536014)(71190400001)(256004)(26005)(6506007)(6436002)(3846002)(6306002)(6116002)(7736002)(606006)(33656002)(25786009)(9686003)(229853002)(66066001)(236005)(6246003)(54896002)(790700001)(55016002)(64756008)(66446008)(66476007)(66946007)(76116006)(14454004)(478600001)(8936002)(8676002)(81156014)(81166006)(74316002)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB0345;
 H:DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ynLUicYFeRRuaf7RmrvuGOzKdHZQSdB002gdRng8wyuQb7EX9Qy/822Nuxm4/Oh0IrFpBHWNBXPaYfVCsGiuxrUtUQwf8BwpYlOt2AmRMvDEK4nzZIL1vVzdsR2ptb0xfp4o08U3ocINjeb//W7l6hwll3xBTRQ2i1/Vjtmy8YooCARw5qKgxNGoko3Z9If43T6NL53v2sCPVAC0oSBNMTbTnHuNbjlKQZJHdbFjPOR4BSVnUu0qlePzzJkqfeyuOgAx0FlW8pFJGng20DazsZ3Ac4kFCiuDVYiwvwTbuD131k3U6YQ0EbikfqzVadTMAXhpaN9bT6KK/16zNzeIUGCdq+mwr81NSZwlYGRLB2H+f8XlWGOYL5gdr5XFs6+o8rdCOmg+Mpc/9Ywl3/gPsNm+FrrheD5FZIy9BdN6vo1KIjPE4mfmEJxMAtZ9+94eBsyoKlHhP7SbsPffvSLDG5cSUl9XGucleviMLuJK0GI=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB10846D55E37921FB321B0EC4D86B0DF4PR8401MB1084_"
X-MS-Exchange-CrossTenant-Network-Message-Id: 5039ff5a-2f96-4554-0051-08d7574d8e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 00:11:30.9534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHFYQIDqhnkfUr+c45Rp6iD/2t4iDKmF8jH/0DCSmbbKHyb+ONiupEWnyne+p8F+rVyYUwx7/W8cHp2945vocfOlN3xK6d545uYww0HWv+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0345
X-OriginatorOrg: hpe.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_06:2019-10-22,2019-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910230000
X-Mailman-Approved-At: Mon, 28 Oct 2019 16:36:40 +1100
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

--_000_DF4PR8401MB10846D55E37921FB321B0EC4D86B0DF4PR8401MB1084_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VHlsZXIsDQoNCkkgaGF2ZSBlbmNvdW50ZXJlZCB0aGUgc2FtZSBpc3N1ZSwgYW5kIGFsc28gZm91
bmQgdGhhdCBpdCBoYWQgYmVlbiByYWlzZWQgYXMgSXNzdWUgIzM2MTA8aHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy9pc3N1ZXMvMzYxMD4sIGZvciB3aGljaCB0aGVyZSBpcyBjdXJy
ZW50bHkgbm8gcmVzcG9uc2UuDQoNCkZXSVcsIGZvciBtZSwgSSB3YXMgb25seSB0cnlpbmcgdG8g
Z2FpbiBleHBlcmllbmNlIHdpdGggdGhlIE9wZW5CTUMgZGV2IGVudmlyb25tZW50IGFuZCBjcmVh
dGUgc29tZXRoaW5nIHRvIGVtdWxhdGUgaW4gUUVNVS4gIFRoaXMgaW5pdGlhbCBodXJkbGUgd2Fz
IHZlcnkgZnJ1c3RyYXRpbmcgYW5kIHRpbWUtd2FzdGluZywgYXMgdGhlcmUgYXJlIHNldmVyYWwg
Y29tcG9uZW50cyB0aGF0IGRvbuKAmXQgYnVpbGQgdXNpbmcgdGhlIHN1cHBsaWVkIGluc3RydWN0
aW9ucywgYW5kIHRoZSDigJxJc3N1ZXPigJ0gcmFpc2VkIG9uIGdpdGh1YiBhcmUgdW5hbnN3ZXJl
ZC4gIEkgZW5kZWQgdXAgdGFyZ2V0aW5nIGEgbWFjaGluZSBuYW1lIHRoYXQgaXMgc3VwcG9ydGVk
IGJ5IHRoZSDigJwuL3NldHVw4oCdIHNjcmlwdCAoZm9yIGEgbGlzdCBvZiBtYWNoaW5lcywgZXhl
Y3V0ZSDigJwuIC4vc2V0dXDigJ0pLCBhcyBkZXNjcmliZWQgaW4gdGhlIE9wZW5CTUMgV2lraTxo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2k+Lg0KDQpNYXR0Lg0KDQpGcm9t
OiBEZW5nIFR5bGVyIDx0eWxlci5zYWJkb25AZ21haWwuY29tPg0KU2VudDogVHVlc2RheSwgMjIg
T2N0b2JlciAyMDE5IDY6MjggUE0NClRvOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+DQpTdWJqZWN0OiBUaGVyZSBpcyBubyBpbWFnZSBnZW5lcmF0ZWQgd2hpbGUg
YnVpbGQgYXN0MjUwMCBldmINCg0KSGkgQWxsOg0KICAgIEkgYnVpbGQgb3BlbmJtYyBsYXRlc3Qg
dmVyc2lvbiwganVzdCBjbG9uZSBvcGVuYm1jIG1hc3RlciBicmFuY2gsIGFuZCBkbyBmb2xsb3dp
bmcgY29tbWFuZDoNCmV4cG9ydCBURU1QTEFURUNPTkY9Li9tZXRhLWV2Yi9tZXRhLWV2Yi1hc3Bl
ZWQvbWV0YS1ldmItYXN0MjUwMC9jb25mDQouIG9wZW5ibWMtZW52DQpiaXRiYWtlIG9ibWMtcGhv
c3Bob3ItaW1hZ2UuDQpBZnRlciBidWlsZCBzdWNjZXNzZnVsbHksIHRoZXJlIGlzIG5vIGZpbGUg
ImZsYXNoLWV2Yi1hc3QyNTAwIiBhbmQgYW55ICoubXRkIGZpbGUgaW4gL29wZW5ibWMvYnVpbGQv
dG1wL2RlcGxveS9pbWFnZXMvZXZiLWFzdDI1MDAuIENvdWxkIHNvbWVvbmUgaGVscCB0byBidWls
ZCBhc3QyNTAwIGV2YiBpbWFnZT8gdGhhbmtzLg0KDQpUeWxlcg0KDQo=

--_000_DF4PR8401MB10846D55E37921FB321B0EC4D86B0DF4PR8401MB1084_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBjbTsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowY207DQoJZm9udC1zaXplOjExLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1z
dHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCW1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtz
aXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48
IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNw
aWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHht
bD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBk
YXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0K
PGJvZHkgbGFuZz0iRU4tQVUiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYg
Y2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJF
Ti1HQiIgc3R5bGU9Im1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5UeWxlciw8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1HQiIgc3R5
bGU9Im1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1HQiIgc3R5bGU9Im1zby1m
YXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5JIGhhdmUgZW5jb3VudGVyZWQgdGhlIHNhbWUgaXNzdWUs
IGFuZCBhbHNvIGZvdW5kIHRoYXQgaXQgaGFkIGJlZW4gcmFpc2VkIGFzDQo8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2lzc3Vlcy8zNjEwIj5Jc3N1ZSAjMzYxMDwv
YT4sIGZvciB3aGljaCB0aGVyZSBpcyBjdXJyZW50bHkgbm8gcmVzcG9uc2UuPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tR0IiIHN0eWxl
PSJtc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tR0IiIHN0eWxlPSJtc28tZmFy
ZWFzdC1sYW5ndWFnZTpFTi1VUyI+RldJVywgZm9yIG1lLCBJIHdhcyBvbmx5IHRyeWluZyB0byBn
YWluIGV4cGVyaWVuY2Ugd2l0aCB0aGUgT3BlbkJNQyBkZXYgZW52aXJvbm1lbnQgYW5kIGNyZWF0
ZSBzb21ldGhpbmcgdG8gZW11bGF0ZSBpbiBRRU1VLiZuYnNwOyBUaGlzIGluaXRpYWwgaHVyZGxl
IHdhcyB2ZXJ5IGZydXN0cmF0aW5nIGFuZCB0aW1lLXdhc3RpbmcsDQogYXMgdGhlcmUgYXJlIHNl
dmVyYWwgY29tcG9uZW50cyB0aGF0IGRvbuKAmXQgYnVpbGQgdXNpbmcgdGhlIHN1cHBsaWVkIGlu
c3RydWN0aW9ucywgYW5kIHRoZSDigJxJc3N1ZXPigJ0gcmFpc2VkIG9uIGdpdGh1YiBhcmUgdW5h
bnN3ZXJlZC4mbmJzcDsgSSBlbmRlZCB1cCB0YXJnZXRpbmcgYSBtYWNoaW5lIG5hbWUgdGhhdCBp
cyBzdXBwb3J0ZWQgYnkgdGhlIOKAnC4vc2V0dXDigJ0gc2NyaXB0IChmb3IgYSBsaXN0IG9mIG1h
Y2hpbmVzLCBleGVjdXRlIOKAnC4gLi9zZXR1cOKAnSksDQogYXMgZGVzY3JpYmVkIGluIHRoZSA8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kiPk9wZW5CTUMg
V2lraTwvYT4uPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gbGFuZz0iRU4tR0IiIHN0eWxlPSJtc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0i
RU4tR0IiIHN0eWxlPSJtc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+TWF0dC48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1HQiIgc3R5
bGU9Im1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCBibHVlIDEuNXB0
O3BhZGRpbmc6MGNtIDBjbSAwY20gNC4wcHQiPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpu
b25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBjbSAwY20g
MGNtIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIGxhbmc9IkVOLVVTIj5Gcm9tOjwv
c3Bhbj48L2I+PHNwYW4gbGFuZz0iRU4tVVMiPiBEZW5nIFR5bGVyICZsdDt0eWxlci5zYWJkb25A
Z21haWwuY29tJmd0Ow0KPGJyPg0KPGI+U2VudDo8L2I+IFR1ZXNkYXksIDIyIE9jdG9iZXIgMjAx
OSA2OjI4IFBNPGJyPg0KPGI+VG86PC9iPiBPcGVuQk1DIE1haWxsaXN0ICZsdDtvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFRoZXJlIGlzIG5vIGltYWdl
IGdlbmVyYXRlZCB3aGlsZSBidWlsZCBhc3QyNTAwIGV2YjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjwvZGl2Pg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBBbGw6PG86cD48L286cD48L3A+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7ICZuYnNwOyBJIGJ1aWxkIG9wZW5ibWMg
bGF0ZXN0IHZlcnNpb24sIGp1c3QgY2xvbmUgb3BlbmJtYyBtYXN0ZXIgYnJhbmNoLCBhbmQgZG8g
Zm9sbG93aW5nIGNvbW1hbmQ6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+ZXhwb3J0IFRFTVBMQVRFQ09ORj0uL21ldGEtZXZiL21ldGEt
ZXZiLWFzcGVlZC9tZXRhLWV2Yi1hc3QyNTAwL2NvbmY8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi4gb3BlbmJtYy1lbnY8bzpwPjwvbzpwPjwvcD4N
CjwvZGl2Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Yml0YmFrZSBvYm1j
LXBob3NwaG9yLWltYWdlLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+QWZ0ZXIgYnVpbGQgc3VjY2Vzc2Z1bGx5LCB0aGVyZSBpcyBubyBmaWxlICZx
dW90O2ZsYXNoLWV2Yi1hc3QyNTAwJnF1b3Q7IGFuZCBhbnkgKi5tdGQgZmlsZSBpbiZuYnNwOy9v
cGVuYm1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL2V2Yi1hc3QyNTAwLiBDb3VsZCBzb21lb25l
IGhlbHAgdG8gYnVpbGQgYXN0MjUwMCBldmIgaW1hZ2U/IHRoYW5rcy48bzpwPjwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VHlsZXI8bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyAmbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_DF4PR8401MB10846D55E37921FB321B0EC4D86B0DF4PR8401MB1084_--
