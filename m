Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA91E29C2
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 20:11:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WhqB5BphzDqKl
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:11:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=24151d482d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Oj6VeHzf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=WDtD6x4X; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Whp55QkhzDq8M
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 04:10:19 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 04QI8dEA030400;
 Tue, 26 May 2020 11:10:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=oWi1usHwoxA6pSrB1bEHX/AuhUM8bLDTDM2AgeEMjHo=;
 b=Oj6VeHzfYSdtFpXKsTIF84ir4BjxfRwKJb0sVZ6llcSsEBim4eAxjcJUj072obA9qxKJ
 DGOG7uQa/M0K33vgQ6aNKFMGUqP5NqQ95MXTlodPimFOZAGVtI1S2B6jnEmVYItDgRwx
 KHa2UyfMKhUEAB0cb+em9+VV2Y/6FjXBbAQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 316ygpkkhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 May 2020 11:10:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 26 May 2020 11:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3ChbKBJCL4Hdsg3iVhOXNJQtEOKgnsAEJnZ6NULWaGCRwbijk9CKnuSBFIEzeXGdObXwDoJVc2A523VBcX+dzem9mJ916EaMYOiEmIGguR/KS0Pwt0UunUtAFuSza0IDR6R7qVIJGIzsrlRDrt6asJVNRnbJR358iImqlh6KVaCQRgBxIadbdtFCtKyUZjHvk/ru5NlVT5bKfM1BnMh+B8w/9q3DmJTQJXyz8tnZaanYyxCT4ATNPfiIAHJw+n6sum9/kjclO8b6350SBNLG7hYFwU1fjC43Rt1lDARn3owDL08wIWyd/ox+q+KS9XPMs98L/NacrBkfAQNruJ7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWi1usHwoxA6pSrB1bEHX/AuhUM8bLDTDM2AgeEMjHo=;
 b=JlNvQAu4tHRiys3YHqwZtJuW4K8oLp1ofjMX1Thi+wWgPaaM9kpxtdHFSS1SqFq/u8nbGKifaM3Y7922nfyfc/2x858zVPWaj0EPfMqxG2HxPP/FEORWaizVYNkLG00VBXniQFUwbksWsa/qBWfr0aBVE4c1cxmACNeA30FOne86KYzacLKvsdCynDYKmD+FSZcWbYk6gCd9hCZ3YAmdpA2EaudjG+z+GYCnA/NMP2pVw/PF/GnbNwZ+nc9v3hkXVcXMlFj6w2XVdfSfpJWVSPq7zHTS1yQsS9qgdyLx7YlLlu2uG5aaLg7/3ShjdgI/VWdRTa0GK+IdSUn4Xf1H+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWi1usHwoxA6pSrB1bEHX/AuhUM8bLDTDM2AgeEMjHo=;
 b=WDtD6x4XlkVGFeR+s0aAsUvsbleMldvxG42pDlao5k5ZipzAENjx9ZZ1VhPa9s4yjhClHsqKVBhP9hEN2DfZueZhxFlWo4F942b0wo6nr2cRk6KPG8/0dLHbmeinmYmEqLWvbWMEJF6V78wRZ0/NYtIGh99EsoPTjukpvnI0uwQ=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2824.namprd15.prod.outlook.com (2603:10b6:a03:158::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 18:10:12 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:10:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: Re: article on data in OpenBMC
Thread-Topic: article on data in OpenBMC
Thread-Index: AQHWMHpXfXuP/xMHpk2jzZ6JVDfZn6i6i2+A//+wDoA=
Date: Tue, 26 May 2020 18:10:11 +0000
Message-ID: <A969F89F-44AE-443A-BA7A-A58653C1424E@fb.com>
References: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
 <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
In-Reply-To: <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93731549-1be7-4410-8a4c-08d801a00862
x-ms-traffictypediagnostic: BYAPR15MB2824:
x-microsoft-antispam-prvs: <BYAPR15MB2824E924EC29BC4C2832E54EDDB00@BYAPR15MB2824.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gV0opchlsXf4+rc465pRogMPUgeHRSb9iCsIJo+sffdFGUKU7iOd963nE/LNhFUlOd3fMPH6D/5pWFUNQRSBNykGHCghjko8Jpc/dZMq0UzeEkqwTparLPK7yGZXxDuDERXY+LHD4XpdSrhvrNLXT0uKJ786x8OpoBR1wthYOwGcd8XDpMsk/uNYY9HNSQ7iPv4Fzc/ECnwIhdkqJHKjXppOOFLL/VQQfBhohIibhBU6SAdiyjbga02OAHV1nX2Ftmx77dYffznp2SiwUTBKrpfY2eDJ9S1VETy9lk34U3A8lGxRYzXT8IrcmWSbN8g+Hqh7mYoqd859Fy5moGjUWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(36756003)(66946007)(6486002)(2906002)(71200400001)(6506007)(53546011)(76116006)(4326008)(6512007)(5660300002)(316002)(186003)(110136005)(33656002)(86362001)(8676002)(8936002)(66556008)(478600001)(66446008)(66476007)(64756008)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: np5mMUg3HfB6aMNysMKjG6xp4uaAvU84ElzM/y85Kp1HNbH8mYnJbuIxTrF7HjVDpdi0Ud65HAQuRuv9MPiK8MCjVt8dSquZZvoS5GQAL4kCnYUoFXiOBCGyKf4C/+cZtn5Gti/SiS2URSRWi3avk2B2Wifi3AIZL5fydQCu2vTqCI82E0sdhmh0B6d8g5s7AzDPrWGjVSCkWlTiKvfLh+1STiZdP1Cod2JGvrISi5XCDBMOpK8i2Fa4QoCWzMAe1Ia6eFrTsMLokyACudnL0fKwCMCCUYNSiTtmyJ/sAxySvcZuXGsuKn/iL2cZw7/aJPH/VLQgQHzeQUTdmicN0clSbshPM4OQb5k1Jxifq5FQq6WVkXGY4TrL2gpV81vOdd60qaWMo2L0z9mKbzfRjKuxRrPqHwJ3In1qenwcVtCWcQzUHoDJDMnElZtcmdoxGGBVBeBApV1HPWd5X1EUeLsBI5kLZ9n+Q8bjbveHW82npLyZPNZLDncfY9et63i9mtMR4P60DEnxqdALixBtLOdXijDp9MWmdXhBS4cL7p8bbE+z6AiQbzXaQX0WFape
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7E5644040DF484BB5696853E8CBD1BB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 93731549-1be7-4410-8a4c-08d801a00862
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 18:10:11.8566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnthnsmM+mSadvn0GR09KPNQ37dJuwKHXkQHeQayZukYA3WC9mYWdPbOmWnH/5ztPQ/CzYq7vRUsjLE3X6e9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2824
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 cotscore=-2147483648 mlxlogscore=999
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005260141
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDUvMjYvMjAsIDg6NTcgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBbmRyZXcg
R2Vpc3NsZXIiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICAN
CiAgICANCiAgICA+IE9uIE1heSAyMiwgMjAyMCwgYXQgMzo0NiBQTSwgQnJhZCBCaXNob3AgPGJy
YWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+IEhlbGxvDQog
ICAgPiANCiAgICA+IEkgd3JvdGUgdGhpcyBhcnRpY2xlIG9uIGRhdGEgaW4gT3BlbkJNQyB0byBi
ZWdpbiBhbiBhdHRlbXB0IGF0IG1ha2luZw0KICAgID4gaXQgZWFzaWVyIHRvIGZpbmQgZGF0YSwg
d2hlbiBwb3J0aW5nIG5ldyBzeXN0ZW1zIHRvIE9wZW5CTUMuICBJIHNheQ0KICAgID4gYmVnaW4g
YmVjYXVzZSBJIG9ubHkgZG9jdW1lbnRlZCB0aHJlZSByZXBvc2l0b3JpZXMuICBUaGUgaWRlYSBp
cyB0aGF0DQogICAgPiBtb3JlIHdvdWxkIGJlIGFkZGVkIHRvIHRoZSBsaXN0IG92ZXIgdGltZS4g
IE15IGludGVudCB3b3VsZCBiZSB0byBhZGQNCiAgICA+IHRoaXMgdG8gdGhlIGRvY3MgcmVwb3Np
dG9yeSBvciB0byB0aGUgd2lraS4gIEkgd291bGQgbG92ZSB0byBoZWFyIGFueQ0KICAgID4gZmVl
ZGJhY2sgb24gbXkgYXJ0aWNsZSBvciBhbnkgaWRlYXMgYW55b25lIGhhcyBvbiBkYXRhIGluIE9w
ZW5CTUMuDQogICAgDQogICAgTmljZSEgRGVmaW5pdGVseSBhIHBvaW50IG9mIGNvbmZ1c2lvbiBm
b3IgcGVvcGxlIHNvIGhhdmluZyBzb21ldGhpbmcNCiAgICBsaWtlIHRoaXMgdG8gcmVmZXJlbmNl
IGFuZCBwb2ludCB0byB0aGUgbW9yZSBkZXRhaWxlZCBhcmVhcyBpcyBncmVhdC4NCiAgICANCiAg
ICBXaGF04oCZcyB5b3VyIHZpc2lvbiBmb3IgdGhpcyBhcnRpY2xlPyBBIGRvYyByZXBvPyBBIHdp
a2k/IFdpa2lzIGRlZg0KICAgIG1ha2UgaXQgbW9yZSBsaWtlbHkgdG8gZ2V0IHVwZGF0ZWQuDQog
ICAgDQogICAgPiANCiAgICA+IHRoeCAtIGJyYWQNCiAgICA+IA0KICAgID4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICAgID4gIyBEYXRhIERyaXZlbiBBcHBsaWNh
dGlvbnMgaW4gT3BlbkJNQw0KICAgID4gDQogICAgPiAqKlB1cnBvc2U6KiogRGVzY3JpYmUgdGVj
aG5pcXVlcyBmb3IgZmluZGluZyBkYXRhIGluIE9wZW5CTUMuDQogICAgPiANCiAgICA+ICoqSW50
ZW5kZWQgQXVkaWVuY2U6KiogU3lzdGVtIGludGVncmF0b3JzLCBzeXN0ZW0gZW5naW5lZXJzLCBk
ZXZlbG9wZXJzIHBvcnRpbmcNCiAgICA+IHN5c3RlbXMgdG8gT3BlbkJNQy4NCiAgICA+IA0KICAg
ID4gKipQcmVyZXF1aXNpdGVzOioqIE5vbmUNCiAgICA+IA0KICAgID4gSWYgeW91IGFscmVhZHkg
a25vdyB0aGUgdGVjaG5pcXVlcyBmb3IgZmluZGluZyBkYXRhIGluIE9wZW5CTUMsIHNraXAgYWhl
YWQgdG8NCiAgICA+IFt0aGUgbGlzdCBvZiBPcGVuQk1DIGFwcGxpY2F0aW9ucyB3aXRoDQogICAg
PiBkYXRhXSgjbGlzdC1vZi1vcGVuYm1jLWFwcGxpY2F0aW9ucy13aXRoLWRhdGEpLg0KICAgID4g
DQogICAgPiAjIyBUZWNobmlxdWVzIGZvciBmaW5kaW5nIGRhdGENCiAgICA+ICMjIyBSdW50aW1l
IGNvbmZpZ3VyYXRpb24gZmlsZXMgaW4gYml0YmFrZSBtZXRhZGF0YQ0KICAgID4gU29tZSBhcHBs
aWNhdGlvbnMgY29uc3VtZSBkYXRhIGluIHRoZSBmb3JtIG9mIHJ1bnRpbWUgY29uZmlndXJhdGlv
biBmaWxlcy4NCiAgICA+IFJ1bnRpbWUgbWVhbnMgdGhlIGFwcGxpY2F0aW9uIGxvYWRzIHRoZSBj
b25maWd1cmF0aW9uIGRhdGEgd2hlbiBpdCBpcyBpbnZva2VkLA0KICAgID4gb24gdGhlIHRhcmdl
dCAob24gdGhlIEJNQykuICBDb25maWd1cmF0aW9uIGZpbGVzIGFyZSBgL2V0Yy88cGFja2FnZW5h
bWU+LmNvbmZgDQogICAgPiBvciBpbiBgL2V0Yy88cGFja2FnZW5hbWU+L2AgaW4gdGhlIHRhcmdl
dCdzIHJvb3QgZmlsZXN5c3RlbS4gIFRoZSBmb3JtYXQgb2YgYQ0KICAgID4gY29uZmlndXJhdGlv
biBmaWxlIGlzIGFwcGxpY2F0aW9uIHNwZWNpZmljLg0KICAgIA0KICAgIE5vdCBzdXJlIGlmIHRo
aXMgZG9jIGlzIHRoZSBiZXN0IHBsYWNlIGJ1dCBJ4oCZZCBsaWtlIHRvIHNlZSBhIGJlc3QgcHJh
Y3RpY2VzIG9uDQogICAgZmlsZSBmb3JtYXQgKGkuZS4gdXNlIC5qc29uKSBhbmQgcnVudGltZSBj
b25maWcgZmlsZSBsb2NhdGlvbnMgKGkuP2UuPyAvZXRjLyAvdmFyIHR5cGUgDQogICAgZGVjaXNp
b25zKS4gQWxzbywgdGhlIHJlY29tbWVuZGF0aW9uIHRvIG1ha2UgeW91ciBkYXRhIHJ1bnRpbWUg
Y29uZmlnDQogICAgdnMuIGJ1aWxkIHRpbWUgY29uZmlnIHdoZW4gcG9zc2libGUgKHRvIG1ha2Ug
bGl2ZSBkZWJ1Zy90ZXN0IGVhc2llcikuDQoNCkkgYWdyZWUgd2l0aCBBbmRyZXcgaGVyZS4gQXMg
bm90IGFsbCBkYXRhIGFyZSB1bmRlciAvZXRjLCBzb21lIG9mIHJ1bnRpbWUgZGF0YSBhcmUNCnVu
ZGVyIC92YXIgYXMgd2VsbCBzbyBpdCB3b3VsZCBuaWNlIHRvIGhhdmUgc29tZSBwb2xpY3kgZGVm
aW5lZCB3aGF0IHR5cGUgY2FuIGdvDQp3aGVyZS4NCiAgICANCiAgICANCg0K
