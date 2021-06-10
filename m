Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD73A3546
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 22:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1GZ323NVz3bt6
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 06:59:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=krzVCpnk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=079597c775=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=krzVCpnk; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1GYl1YjWz2xvN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 06:59:20 +1000 (AEST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AKEoVT005189; Thu, 10 Jun 2021 20:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=CSOfqg+kjgWCadOkhZF7qgTSBP1WW/0RZAQVeGVKjBs=;
 b=krzVCpnkki/Mj67xpAo8ahmJ2t+0R8FFKWzdcUpWlZXeZy4xhAzqvX/3con3wb/Re3vF
 d71VoKt/7I9Fd3oppRsHm4V0TueDjRr/WA6aB7IpTVI0M4HMMPy4/+KCtrVCZXmRF+9+
 Xk5wjzLfhWBxTQWoOVprJt7nDRJcEq5f3KJuMfRsflPk0Nvt74h6NGld6etfPZdKAExt
 hQKSS7UQFOHMkbVu7mH8c/kmzmfhupSyrhYcF9Kp8/eiyhT68iBB82KWhB2MdfsQCHSP
 m4dSDhV8smKwBX1CqtKisnzsA6Q2meeZlJJJ2F0DmMuUtxsIM/zaKrZAU8tKuwkVUeZZ ZQ== 
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 3933vn33sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:59:15 +0000
Received: from G9W8453.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.216.160.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id 016A04E;
 Thu, 10 Jun 2021 20:59:15 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (16.216.161.4) by
 G9W8453.americas.hpqcorp.net (16.216.160.211) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 20:59:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Thu, 10 Jun 2021 20:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKsmxqKxkvws7uq+AX0YcwRDcYKwWxrtK+Uz22IffvKt8EwZmqO1Q0w2o/4GRHarrllcyiK2IyiV8JpfHAK/Q4UHakHMRf0GMApaXBssZfzTGmwBCLN0GA1D1cVhKXFykT9dpmW3DjAivnOvS3wocwCgMOYe7BOGtiyT1JAJ4mph4MjV6ATE+eSxRrspRQZGOS1Ty/1MW3Y6JceqCRaGFvZ6bm9GTPSpkFRfCIXEVqnKide1GJdAAB6YbwVF1fC4h5OA6kTNjcZgXa3doemi1sCvnrwCvQwmPuM+K3i/4js5xRi7DDpGOOioBuxqbhbn4kkt/XKx7pyIECviOaV0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSOfqg+kjgWCadOkhZF7qgTSBP1WW/0RZAQVeGVKjBs=;
 b=CropDAQfVe4zri2rWJdfZ/54OYIqodnxFXxE4kM31gWy0qfmTktPzrJilWjmD8OYcsmLTulExLmrdhWYU8kzdwhc08rs6hF+/jgEx30VHOfU7bt4ZoP4LTTGr9ATazaFDByNH2HUQqH5RACcbUY/gWtWXMtLoILJK6XV5UaQzf4Y0mfRj8hnh2HBBjY3Rf6IbM8oilsa4edI4CPIz2f6HIR3Lyct8yqzV1HX6rdls0+jkeSKXr3yCkT8/Pw80e/ZTQAFNH+eW8Prvek2lX0W23ky5fngUHj3ouwMtS0ctSR6LTH9qkKytOYRilrACszbtJ8jtOXqj1LaQszDUbjrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB1307.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7613::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 20:59:13 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488%11]) with mapi id 15.20.4195.030; Thu, 10 Jun
 2021 20:59:13 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: RDE Enablement
Thread-Topic: RDE Enablement
Thread-Index: AddeNQks2n5bD9svT5WNVI3gUyZzFAAAqgIAAABuNjA=
Date: Thu, 10 Jun 2021 20:59:12 +0000
Message-ID: <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
In-Reply-To: <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.217.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9af13463-b01b-4714-21fe-08d92c5299f6
x-ms-traffictypediagnostic: DF4PR8401MB1307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB13070DF105CD04E9116EF3298F359@DF4PR8401MB1307.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E+MKOyBUfagd/vWzNRtOx8qASOvl9RQkleLkRsOCMjCNJ53pextNFODRJfxgyx/y7k/1gFRbt+l1ZQmJ/lm1EZ96yzRfF76+31yvUqb5K/+jTV2M89VUfpR9HVI/K65eGUnYptmDmmt9+wM3XshACU70DK8D/knrFDRBm+E2MCG5T0i15wfJ0ohVa8eGuSc1vYNcCwJzcdIeBAhscCFgVJqaIwL6+jNB/onEBYx2gpcK4IvbA6/+RZ6Rc1/0n8p3oWqyLR0Tm3WZ5spThG43RDbyFREJKqhd8qME9CotR2XPnM/l1KIa+KTofEBzLWKPo8WUigRfsGW6JxAYR2VFJbFAB6dmwnQZ9NbWX7i2tAowjCxwWp//sUUl5lXtGCcDJUUniy1nUEeblOiBfgjrUAYwRJSuVbM7ZLzQyS2bsvp1iz2nwIczli4TihN9gU87zPUL2AobdLuIlqBf/e03+w6gNxF2L3dvHD2e/pMoMDJWmQbMBV/rzU+mduzwiC5MaVvNKPjKbx6UmgpLyK3U5Uy2eMi3zdvhLoBBcHYuWqeMemgrZ0FgiIQm91qN83k5qoKwdz/9s6IY0r+SP+I5HTtsMNV1UiWym+0CgqJldZh64NLQfyBRbiTkwVAovY08CIMKe2Gy6utcfLps8G3XjV8DsHMnQYhnio4LNT6XLJkP4Ehme4aW/NpzLYqdqtoKW64+MsH00FYDTDK7YKmcHB6hx2894oN+j7395Jy10QbEuTRxns6B8xFF0I0CPgtW3BhKvp+JJrN6qqnqhEgveg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(396003)(366004)(376002)(346002)(7696005)(66946007)(86362001)(5660300002)(2906002)(4326008)(7116003)(76116006)(8936002)(186003)(38100700002)(83380400001)(66476007)(966005)(122000001)(6506007)(3480700007)(478600001)(55016002)(52536014)(316002)(55236004)(64756008)(71200400001)(8676002)(66446008)(9686003)(26005)(53546011)(33656002)(6916009)(66556008)(367364002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjJPaDExNWZTR0RCdDhSaW15RjRCNjh6S3JlOXVMU2VtZndaVWZlQUxOZzlV?=
 =?utf-8?B?amRIaFZHdTl5eGt5MVcwdDgvWTJMVjgvVzJFRC80cUxvNGEvOThiYXBqY1hB?=
 =?utf-8?B?R3Z0WklCWTQ1RmNacGtMVDhDVUpEL1Z4SzhqMU5MRFF2VjJqTTgyQWgzOUJ6?=
 =?utf-8?B?R0FlQmE2eEdVMXRhNjNBYzJwbFJ5NEJiclZ4ZXlCTTl2ZnRwbUhVR3lxZUs4?=
 =?utf-8?B?dTFPMUdsNWJKc0dFQ0pVbk1wbU42eVpZbmswWkU0K0RoOVFIdG9IYXpJbm1t?=
 =?utf-8?B?cWdweCtIVVRCVWpEbGZLMkxKMmdaUHhEVTZXQ04wRDFBMUp2Y1FZM0E2L3RG?=
 =?utf-8?B?NG1lT3VSVTZVRU9aRFJsMFRHVTJRTEFJcjZXMlJQME9EajNFUHlCZHBjSVdC?=
 =?utf-8?B?Tm51Mm53TGh4blVLK0JXcmdNR2hjRHdReG1jRkVlT2hUOTlqUmd1Q2w3a2Rm?=
 =?utf-8?B?TUt1ZnRNNll3QXdoY3A5YVJtaGg1SXIrN2d4ZDdnTUg0a3VmcjZiNXRuRHl3?=
 =?utf-8?B?elZoaGZUamRmUXlPOEphdlpYZGd5b3Y4UDRCODJ3eE1hcTJ4RmtEd0tWL2tP?=
 =?utf-8?B?WXRUOFFxYTgvOW54TmN1Z1RiUVQ4K0hmaC9xdmpjWkE0aHFCU3MzZjMrbEdr?=
 =?utf-8?B?UERVYnJvNkRXOUIweU81dXQwajEzSWVJM1k5bCs2c1NUQ3RoMzJjcklldWxr?=
 =?utf-8?B?SVh1ZWRqUlJJMFVKWUNwN1dUeUtNcENiRWdtN1grMnFOSHFxSzd2SjhhRFJC?=
 =?utf-8?B?SExMZUNsZFZ0Q0IwWGR4dVhmZllNZElnTEpzZlpXd2R1QktwU0J2YjlaTnNV?=
 =?utf-8?B?UG5ML1hHMldEREl4MDAzMURZQWZWS1pKdmtQU1BkN3lMZEc1Q0laVjZ0ZkY0?=
 =?utf-8?B?OC9Sc2hjUUVXR0VVbzFlY0FwMjZCN2wwUloyT3A4b0NqUXlITE4rc3hxZDFW?=
 =?utf-8?B?bmlWRE9tRG90SkxPY3hOdTJBRzdETkMzS2YwYjA5a0pGRmk3bkZqUFFBdG4z?=
 =?utf-8?B?L3FvNWhacUVDU2RLU1VJc0p6L01RRU9FRXpUY2Z2R2lCVXZ2bmhPWmthMXI0?=
 =?utf-8?B?QWhqN2pUNzhzVnVoL2NZUVoyTU1iTlVzcERRZDk0U1RhMUNNM0dHdS9WN3Ax?=
 =?utf-8?B?R1A1b1hmV2RlbEppU09Ocm1GcGkrVkg4d0UybndwSm1CcEhUekxjQkhkZUZU?=
 =?utf-8?B?L2tyT3BlT2czV0dBQmdFQ0tUdThpQzRWeDNzcFRKYVQ1ZDR0SEFHUGVSUXpr?=
 =?utf-8?B?M0s0Y3k2VTBPRDl3WTNURFJuTGZLRVpPRzdDVVNJczB0UmFZS3FKVkVOTTQ4?=
 =?utf-8?B?TTJmVkpHVFBaR0F6Ui8rdWRzaysrWEFlemZENmFzaG9EZ2RGQWtMRFlVeHJn?=
 =?utf-8?B?NnpmNnVSK3hQUkx3UTZaNHIyajRqK0Jld0krN05janJBL1pXQ3BWd3RVRzYw?=
 =?utf-8?B?SGtiZit0TzRyZTdwUVlNcTd2alg2WmEzMGliWDF2M3NZTFIwZ1VyeW93YVVI?=
 =?utf-8?B?SE9lelo4SlE1ZlIxYVZOVmg4RCtreTZyaHlkUGpRWDRVMm13YXVOTmdrSlRs?=
 =?utf-8?B?QW03MG9wbkRxb2p5RU9Vd09zdkx2RzhHeFNhb2hIN1NXZXI2TEZMQWViRDNw?=
 =?utf-8?B?RkUyMC9WcTdVZVBQSG9KcWVpcW5yeTlMSmE5cFF3M1RnU3ZodVRHMk80ejBn?=
 =?utf-8?B?dEVqSzBEbDRCRkJlNkpqbnM3Ym15SCtVZXdzMzllN0I3T2dOT1hhV0Focldo?=
 =?utf-8?Q?bjP6jCJqq4iIook8FRf9KIhLGeKkUUR6s48BR7l?=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af13463-b01b-4714-21fe-08d92c5299f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 20:59:12.9991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+6a/rIh/yfJo4crxsDQkGSWa0+hK0ugp708yhSvCcr9r3F++qpaLM/6ffNZfSNVe6A9TuRGKjYt01Vp0IuwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1307
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: e_bP2-Gy-3jI6Eu7d1S1LebtX3FNQVTp
X-Proofpoint-GUID: e_bP2-Gy-3jI6Eu7d1S1LebtX3FNQVTp
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100130
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

R3JlYXQhICBXZSBhcmUgaW50ZXJlc3RlZCBpbiBSREUgYmVjb21pbmcgdWJpcXVpdG91cyBvbiBh
ZGFwdGVyIGNhcmRzIHNvIHRoYXQgUmVkZmlzaCBjb25maWd1cmF0aW9uIG9mIHN0b3JhZ2UgYW5k
IG5ldHdvcmtpbmcgZG9lc24ndCBoYXZlIHRvIGluY2x1ZGUgYWRhcHRlciBzcGVjaWZpYyBjb2Rl
LiAgQSBnb29kIHN1Y2Nlc3MgbWV0cmljIHdvdWxkIGJlIHRoZSBhYmlsaXR5IHRvIGNyZWF0ZSBh
IHN0b3JhZ2UgbG9naWNhbCB2b2x1bWUgdXNpbmcgbm90aGluZyBidXQgc3RhbmRhcmQgUmVkZmlz
aCBvcGVyYXRpb25zLiAgSW4gcHVyc3VpdCBvZiB0aGlzLCBhIHNvbGlkIG9wZW4gc291cmNlIE9w
ZW5CTUMgaW1wbGVtZW50YXRpb24gc2VlbXMgbGlrZSBhIGdvb2Qgd2F5IHRvIHB1dCBSREUgb24g
dGhlIHJpZ2h0IGZvb3RpbmcuDQoNCk15IGluaXRpYWwgdGhvdWdodHMgd291bGQgYmUgdG8gYnVp
bGQgYW4gUkRFIHN5c3RlbWQgc2VydmljZSBvbiB0b3Agb2YgdGhlIGV4aXN0aW5nIHBsZG1kIHNl
cnZpY2UgYW5kIGhhdmUgYW4gdXBwZXIgaW50ZXJmYWNlIGludG8gdGhlIHN0YW5kYXJkIGRidXMg
aW50ZXJmYWNlcyBmb3IgaW52ZW50b3J5LCBzdGF0dXMsIGFuZCBjb25maWd1cmF0aW9uLiAgSG93
ZXZlciwgSSBzdXNwZWN0IHRoZXJlJ3Mgc29tZSBhZGRpdGlvbmFsIGRidXMgd29yayBuZWVkZWQg
dG8gam9pbiBSREUgdG8gYm1jd2ViIGJlY2F1c2UgdGhlcmUgd2lsbCBiZSBhIG5lZWQgdG8gZHlu
YW1pY2FsbHkgY2hhbmdlIHRoZSBSZWRmaXNoIG1vZGVsIGFuZCBzdXBwb3J0IHRoaW5ncyBsaWtl
IEFjdGlvbnMuICBBIHJlcXVpcmVtZW50IGZvciB0aGlzIHRvIHdvcmsgd291bGQgYmUgdGhlIGFi
aWxpdHkgdG8gZGlzY292ZXIgUExETSBkZXZpY2VzIGFuZCBhc3NpZ24gSURzIChNQ1RQIEVJRCkg
aW4gb3JkZXIgdG8gaW50ZXJyb2dhdGUgdGhlbSBmb3IgUkRFIGNhcGFiaWxpdGllcy4gIEl0IGlz
IHVuY2xlYXIgdG8gbWUgdGhhdCB0aGUgY3VycmVudCBQTERNIGFuZCBNQ1RQIGNvZGUgaGFuZGxl
cyBkaXNjb3Zlcnkgb3IgaWYgaXQgYXNzdW1lcyBkZXZpY2VzLg0KDQpIYXBweSB0byBoZWFyIGZy
b20gZm9sa3MgYWJvdXQgdGhlIGJlc3Qgd2F5IHRvIGdldCB0aGlzIHN0YXJ0ZWQuDQoNCk1pa2UN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91
bmNlcyttaWtlLmdhcnJldHQ9aHBlLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2Yg
RWQgVGFub3VzDQpTZW50OiBUaHVyc2RheSwgSnVuZSAxMCwgMjAyMSAzOjMyIFBNDQpUbzogR2Fy
cmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkgPG1pa2UuZ2FycmV0dEBocGUuY29tPg0K
Q2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6
IFJlOiBSREUgRW5hYmxlbWVudA0KDQpPbiBUaHUsIEp1biAxMCwgMjAyMSBhdCAxOjI2IFBNIEdh
cnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdhcmUpIDxtaWtlLmdhcnJldHRAaHBlLmNvbT4g
d3JvdGU6DQo+DQo+IEdyZWV0aW5ncywNCj4NCj4gSSdtIGFtIGludGVyZXN0ZWQgdG8ga25vdyBp
ZiB0aGVyZSBoYXMgYmVlbiBhbnkgb3JnYW5pemVkIGRpc2N1c3Npb24gb3IgZGV2ZWxvcG1lbnQg
b24gUmVkZmlzaCBEZXZpY2UgRW5hYmxlbWVudCAoUkRFIC0gRE1URiBEU1AwMjE4KSBmb3IgbW92
aW5nIGVuY29kZWQgUmVkZmlzaCBkYXRhIGFjcm9zcyBQTERNL01DVFAgaW50ZXJmYWNlcy4gIFdl
IGFyZSBpbnRlcmVzdGVkIGluIHByb21vdGluZyB0aGlzIHN0YW5kYXJkIGFuZCBhcmUgd2lsbGlu
ZyB0byBsZWFkIGEgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciBPcGVuQk1DIGlmIHRoZXJl
IGlzIG5vdCB5ZXQgc29tZXRoaW5nIGluIHByb2dyZXNzLiAgSWYgdGhlcmUgaXMgc29tZXRoaW5n
IGluIHByb2dyZXNzLCBjYW4geW91IHBvaW50IG1lIGF0IHRoZSB3b3JrIGJlY2F1c2UgSSB3b3Vs
ZCBsb3ZlIHRvIHNlZSBpdC4NCg0KV2UgYXJlIGludGVyZXN0ZWQgaW4gdGhpcyBhcyB3ZWxsLCBh
bHRob3VnaCB3ZSBhcmUgaW4gdGhlIGVhcmx5IHN0YWdlcyBvZiBsb29raW5nIGludG8gaXQuICBJ
ZGVhbGx5IHdlJ2QgbGlrZSB0byBoYXZlIE9wZW5CTUMgc3VwcG9ydCBhZGQgaW4gY2FyZHMgKE5J
Q3MsIEFjY2VsZXJhdG9ycywgZWN0KSB0aGF0IHN1cHBvcnRlZCB0aGlzIGZ1bmN0aW9uYWxpdHks
IGFuZCBtYWtlIHRoYXQgZGF0YSBhdmFpbGFibGUgdG8gdGhlIG5vcm1hbCBPcGVuQk1DIGNoYW5u
ZWxzIChSZWRmaXNoL2lwbWkvZWN0KS4NCg0KPg0KPiBXaGF0IGlzIHRoZSBub3JtYWwgc2VxdWVu
Y2UgZm9yIHByb3Bvc2luZywgZGViYXRpbmcgYW5kIGZpbmFsaXppbmcgbWFqb3IgbmV3IGZlYXR1
cmVzPw0KDQpUaGUgbWFpbGluZyBsaXN0IHRlbmRzIHRvIGJlIGEgZ29vZCBjaG9pY2UgZm9yIHRo
ZSB2ZXJ5IGVhcmx5IGRpc2N1c3Npb25zLiAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9j
cy9ibG9iL21hc3Rlci9kZXNpZ25zL2Rlc2lnbi10ZW1wbGF0ZS5tZA0KdGVuZHMgdG8gYmUgYSBt
b3JlIGZvcm1hbCBwcm9jZXNzIGlmIHRoYXQncyB3aGF0IHlvdSdyZSBsb29raW5nIGZvci4NCg0K
PiAgV291bGQgSSBzdWJtaXQgc29tZXRoaW5nIGluIEdlcnJpdCBmb3IgcmV2aWV3IChlLmcuIGEg
bWFya2Rvd24gZmlsZSBmb3IgdGhlIGRvY3MvZGVzaWducyByZXBvPykgICBXZSBjb3VsZCBwcm9i
YWJseSBnZXQgc29tZXRoaW5nIHN0YXJ0ZWQgZmFpcmx5IHNvb24uDQo+DQo+IFRoYW5rcy4NCj4N
Cj4gTWlrZQ0K
