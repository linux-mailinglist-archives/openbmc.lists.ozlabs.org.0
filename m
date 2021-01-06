Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FA2EB6C7
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:24:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9VTz2PgKzDqd2
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 11:24:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=ajm2ov1q; 
 dkim-atps=neutral
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9VSt3NpSzDqSk
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 11:23:07 +1100 (AEDT)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106086j4014932; Tue, 5 Jan 2021 16:23:03 -0800
Authentication-Results: ppops.net;
 dkim=pass header.s=selector1 header.d=keysight.com
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
 by mx0b-003cac01.pphosted.com with ESMTP id 35ts4juv0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 16:23:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec8WMdDpxv5otNpotFZvlcAoBvlUBnOQc2ZPNuNxog0B6zNrmXjiF3dKXcAFLzbAkpdQMZjauEzVhEtCIQ20xiOQTWT7oOJMJNg2XXoKQYU7Hg60Ik+HYLpaJBIUB5WPhq5AT1cUw7dLj0cVk/GUub6Dd3Dk0ndWBo37IUc5UoVmJG7VqafcnqpjUXNaTByfskgPbW3vgAO3oIKPSp6sMezsV6gIUYrMpSaMOndCAiZQ6qr8Qk96Vm94d+qXSQrkxeGNf/FRfxok+jJmfXpbwG7ZS3s91Fbfp1/Lpn2TItt7WjytzEklXGnJIZvrVTdSmcv77gsK2qB7HnsfRCzQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IarVy9A8ftedU5Iaz0EPQe5rkm+eR21qmn3wp3fNpm0=;
 b=mKMLm8iwpgeXHyPSRwIYjT5Ugh+EoZg01k7XQ+8P/d1kDgDgdJHibFq9kfp63J3k9S8OHyR3ziJn3+VSh/UMFjFXLw1rhL0v/yauVxPCS/u82uLxf7uRsqpJqfhovPksvFTVFCVMuudbzG2JpRBcV3cOhA3MSLfVlU5nBNU0WtKK+GQoe8nTZWH5fQPU0aTMwCsptKCIGCPePqY/oZ46poPn6yAdQqF9gaHadY+Z7VkEdahnozcgjjUN67DvvMwdk9lowX6Hy1HTiUe1+EY/BPoJ+v6TQrXhW71ScvHvhBeb7qb0JkDskPagRab+cxeT4AfE8R1PVFDpFJEbVpsdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IarVy9A8ftedU5Iaz0EPQe5rkm+eR21qmn3wp3fNpm0=;
 b=ajm2ov1qAfsx386tist9VpSh1t/zk3fDaqtuiH2k4yJ3rwg2SBNo7FXjbQ9uN58GYSfNPV466uvvc/K9Ew+oqqTUlqi1cm5y2zMl0De3+tWER3C2gwz1YOtR7mv4x4dfj1/pVebkk24yJVjysKhWPzXYIgHnGARZgnOhpaJ2WpY=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SN6PR17MB2271.namprd17.prod.outlook.com (2603:10b6:805:41::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 00:23:00 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13%6]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 00:23:00 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: add a new yaml interface definition
Thread-Topic: add a new yaml interface definition
Thread-Index: Adbi09Kn+0NMxZAyTvq9aP/32+RboQAtE4sAAA5TchA=
Date: Wed, 6 Jan 2021 00:23:00 +0000
Message-ID: <SN6PR17MB2558B1D463069389138AF0DA96D00@SN6PR17MB2558.namprd17.prod.outlook.com>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <CAH2-KxBV9_0Dt79Quy0f4HkXXPdHfBw9FsG=4KwdWXBYNEA-ew@mail.gmail.com>
In-Reply-To: <CAH2-KxBV9_0Dt79Quy0f4HkXXPdHfBw9FsG=4KwdWXBYNEA-ew@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 321aac10-dbf4-4966-307b-08d8b1d939a6
x-ms-traffictypediagnostic: SN6PR17MB2271:
x-microsoft-antispam-prvs: <SN6PR17MB2271E9C1CC87790124F0E1B496D00@SN6PR17MB2271.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g1OuZaTMPnudbY5V/HeKjIyhcTy83LxmJlgCfr32mr3jxdXtVRfLXlmb10aqNAG+dWdeWNCg22BZnMJZScInNxw+rH5Atqb4yzzOfTaVduxkRdW5cHhiPV3WpXvX4lMbl2Y/LxcFdpurGR63swx2YQ1DIiVYNUJfm4g0Nx5kfOnGNUgKMH9+KwpN7B+T3rJOEGCd076E4UyO4WTH2xQ/cLJ50VsP5Kg1KViZs7inRo8ry3hopR0zfe3kFMvJww8d2sC/JmvpK6P7JDsiH7tp2HHzEcmDeFWcNt151gLmnEzAnfag2XHTk2E5rwMKmB1BzIcl5P01Rv/Psjgs3+lThlya1sTPMTZi+XpLWyGJT3AToDSc9anJbSZ/fJ7EkdLDOlcAyS5b50cAoOFPKGK74w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(55016002)(33656002)(76116006)(7696005)(44832011)(6916009)(64756008)(66946007)(52536014)(4326008)(9686003)(478600001)(86362001)(186003)(8936002)(26005)(83380400001)(66476007)(5660300002)(2906002)(53546011)(6506007)(71200400001)(66446008)(8676002)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZVhTNzB3ekFiN1VjNjJyb1ZVcmd6VnpkMWVEZ3J2QWxlM3pkbkxhb0lLd1hK?=
 =?utf-8?B?MHNLaGZSUXZocmVoMEdxZ1M2eW1aZDc5SVZqdmYyYXhQcEJ6YkFsT2F0VXRi?=
 =?utf-8?B?U1ZiWkdFWklQVk54TnlBQndlYlpMaEJPNDdycXprbThaTDE2M051bXF3SnBi?=
 =?utf-8?B?QlFQRUp2cFdVZk8raHJNOGgxR29DTk1pM0lhNVFkSkoyVVcyTDhSQkllSjhM?=
 =?utf-8?B?MzROUmYyVnZjS1hQQ0pGWHg5Zk5aME5UL2FyeWVDWk9IZUFRWkZhLzZTdUc4?=
 =?utf-8?B?YnVKOXNWTzlXL1crcWxUVmx4SUQrYU9aZlROV3NSSlFsMEJKdGZyN3pvUWJq?=
 =?utf-8?B?eisycjV6UzEycVpjbmlXOUVGNzU0UTJNQjNjOGY1SjB5MmNlR2xNR1p5NW1m?=
 =?utf-8?B?QjAwLzFvcU0xMEVHTGxRVk4rZ0NJNDQycFBOcU1DMldQMm93QWc2ZmRibE01?=
 =?utf-8?B?Nnl3d3gzZzV1bTR4TVVCMGJtUjhhOXI1M2phbjJXckRPbTVxMDVyTmF0Y1N2?=
 =?utf-8?B?VmNHaE1RbWIzNjAraDhmc2tGTThXekJ2NlpwRzFjUWc5NmhzeXFZMS8xYld6?=
 =?utf-8?B?S1ZQcm9zd1l3VXgxY2xudEZ4bDNDTFRBbkN0b0IyYzRaa2xJZmpwM2o1T2Vr?=
 =?utf-8?B?elF6N1RnWDVXK3lJOXdlK2VKTE02dElkSExoYVFzSng1SnlZK2l1M1FUYTRi?=
 =?utf-8?B?alpMNTBabGpQN2JocWsvbFcyeGZmOVRUZUwyekhLVTF6elNrbnpDejRTRWZa?=
 =?utf-8?B?YmdsRk9XMWpQWDlPYmMwNGxOU2NrVnJZMk94L29JenJ5L2JBaExVQng3cktE?=
 =?utf-8?B?Sys3aE5lRmhpV1I0cCs4UmNWa2p1T0ZZaS9SaDJGejhHamVLNGhHMlFjWnBj?=
 =?utf-8?B?OEkvc0tOaXdqZ1V5cXRPVUVLWHQvampNK2RpMHJKWGlpc1lYSzJ6dlVhUDZi?=
 =?utf-8?B?Z2dvU2c1d0VoVmUwQWZEdnRSTWEzNlBJM0pOR2lHQ1BqQzFmYWtoZWV0eDIr?=
 =?utf-8?B?NWdDcWJ4OHdHa1hzRk1tQzZ6Q3NLZGJHSXFlK1FNUjlzOGZrUE1odWJwSFZy?=
 =?utf-8?B?V0dYcTZlejNxS3pobi9YeWVhQ2ZpUUdmMktRd2ZyT0xBeXRFSFhITnJxNkFy?=
 =?utf-8?B?ZEI0c0dyeDYrVmhJaG9sYWc4Z3VtQVJXdlZMZkNaSDFuekFSb1hMZitOVk8x?=
 =?utf-8?B?QUpqS1A2bVdyRWJadHFJdXZ1Y1JWL1p0RzlEWFdQdUs1bVhQa3BudWhXN3BH?=
 =?utf-8?B?QTlqNXZ3dDRWVEMrVmdUMkNPZVFKUmtxVFFXVjBFTTNOSlpCVzRzQzdWM1k4?=
 =?utf-8?Q?iyCnqFMApOo4o=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321aac10-dbf4-4966-307b-08d8b1d939a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 00:23:00.5178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/qZ6fJqzpNr7rP4IvLddtl4VDMR9ELzYVWcezawPCuLydJlqCrtFisWl9uegmjNRGb3P1dD22adYCcIcMEDm4c/rVsOn+dFggLXIFYp2oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2271
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_09:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 adultscore=0 mlxlogscore=721
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101050139
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

SGVsbG8gRWQsIA0KDQpUaGFuayB5b3UgZm9yIHRoZSBndWlkZWxpbmVzLiAgSSBhbSBhbHNvIG5v
dCBwbGFubmluZyB0byBleHBvc2UgdGhlIEdQSU9zIGFzIGlzLiAgQXMgeW91IHNhaWQgSSBhbSBp
bXBsZW1lbnRpbmcgdGhlbSBhcyBhIHNlcnZpY2UsIGZvciBlLmcuLCBhbGFybSBzZXJ2aWNlLCBh
bmQgZXhwb3NpbmcgdGhlIEFsYXJtIHJhaXNlL2NsZWFyIGFzIGRidXMgbWV0aG9kcy4gDQoNClJl
Z2FyZHMNCk1haGVzaCANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVkIFRh
bm91cyA8ZWR0YW5vdXNAZ29vZ2xlLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDUsIDIw
MjEgMTE6MjggQU0NClRvOiBNYWhlc2ggS3VyYXBhdGkgPG1haGVzaC5rdXJhcGF0aUBrZXlzaWdo
dC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogYWRkIGEg
bmV3IHlhbWwgaW50ZXJmYWNlIGRlZmluaXRpb24NCg0KT24gTW9uLCBKYW4gNCwgMjAyMSBhdCAx
OjQyIFBNIE1haGVzaCBLdXJhcGF0aSA8bWFoZXNoLmt1cmFwYXRpQGtleXNpZ2h0LmNvbT4gd3Jv
dGU6DQo+DQo+IEhlbGxvLA0KPg0KPg0KPg0KPiBUaGFuayB5b3UgZm9yIHRoZSB2aWRlbyBvbiB0
aGUgcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzIGFyY2hpdGVjdHVyZS4gIEl0IGNsYXJpZmllZCB0
aGUgZGV2ZWxvcG1lbnQgZmxvdy4NCj4NCj4NCj4NCj4gSSBhbSB0cnlpbmcgdG8gZXhwb3NlIHNv
bWUgb2YgdGhlIGRpc2NyZXRlIEdQSU8gc2lnbmFscywNCg0KV2Ugc2hvdWxkIHRoaW5rIHZlcnkg
Y2FyZWZ1bGx5IGFib3V0IGlmIHdlIHdhbnQgdG8gZXhwb3NlIHJhdyBHUElPcyBkaXJlY3RseSB0
byBkYnVzLiAgSW4gcHJhY3RpY2UsIGFsbW9zdCBhbGwgR1BJT3MgbmVlZCBzb21lIGtpbmQgb2Yg
ZmlsdGVyaW5nIChkZWJvdW5jZSwgcG93ZXIgc3RhdGUgZmlsdGVyaW5nLCBtaW5vciBzdGF0ZSBt
YWNoaW5lIG9mIG90aGVyIEdQSU9zKSBhbmQgdGhhdCB0ZW5kcyB0byBiZSB2ZXJ5IGRpZmZpY3Vs
dCB0byBtb2RlbCBkaXJlY3RseSBpbiBhIGdlbmVyaWMgd2F5LiAgSW4gZ2VuZXJhbCwgaXQncyBh
IG11Y2ggYmV0dGVyIGlkZWEgdG8gbW9kZWwgeW91ciBHUElPIGFzIGEgaGlnaCBsZXZlbCBjb25j
ZXB0LCBsaWtlIGFuIExFRCwgb3IgYSBQb3dlciBzdGF0ZSBjb250cm9sbGVyLCB0aGVuIGV4cG9z
ZSBhIHdlbGwgZGVmaW5lZCBBUEkgdG8gZGJ1cyBmb3IgdGhhdCBkZXZpY2UuICBUaGF0IG1lYW5z
IHRoYXQgZG93bnN0cmVhbSBjbGllbnRzIGNhbiBpZGVudGlmeSB0aGUgR1BJTyBpbnRlcmZhY2Ug
cmVhc29uYWJseSBhbmQgZXhwb3NlIHRoZSBhcHByb3ByaWF0ZSBBUElzIHRvIHRoZSB1c2VyLg0K
DQo+IGFuZCBtZXRob2RzIHRvIGdlbmVyYXRlIGF1ZGlvIGFuZCB2aXN1YWwgYWxhcm1zIGZvciBv
dXIgbWFuYWdlbWVudCBzb2Z0d2FyZS4gIEkgd2lsbCBkZWZpbmUgdHdvIG5ldyB5YW1sIGZpbGVz
IGRlc2NyaWJpbmcgdGhlc2UgaW50ZXJmYWNlcy4gIEZyb20gdGhlIHRyYWluaW5nIHZpZGVvIEkg
dW5kZXJzdG9vZCB0aGF0IEkgc2hvdWxkIHVzZSB0aGUgc2J1cysrIHRvIGdlbmVyYXRlIHRoZSBj
cHAgYm9pbGVycGxhdGUgY29kZSBhbmQgbWFrZSBpdCBwYXJ0IG9mIHRoZSBsaWJyYXJ5LiAgSSB3
aWxsIGV4dGVuZCBteSBkYWVtb24gY29kZSB0byBpbXBsZW1lbnQgdGhlIGFjdHVhbCBmdW5jdGlv
bmFsaXR5IGFzIGV4cGxhaW5lZCBpbiB0aGUgdmlkZW8uICBXaGVyZSBJIGFtIHN0dWNrIGlzIG9u
IGhvdyBkbyBJIGFkZCBteSB5YW1sIGZpbGVzIHRvIHRoZSBwaG9zcGhvci1kYnVzLWludGVyZmFj
ZXMgaW5mcmFzdHJ1Y3R1cmU/ICBIb3cgdG8gZG8gdGhpcyBpbiBteSB5b2N0byBlbnZpcm9ubWVu
dD8gIFBsZWFzZSBoZWxwLg0KPg0KPg0KPg0KPiBUaGFuayB5b3UsDQo+DQo+IE1haGVzaA0K
