Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573373E46EB
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 15:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GjyDQ1Tr1z30GF
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 23:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=L7sn6Nvh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0855b0850a=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=L7sn6Nvh; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GjyCr73kbz2ysq
 for <openbmc@lists.ozlabs.org>; Mon,  9 Aug 2021 23:51:02 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179De1Cn016921; Mon, 9 Aug 2021 13:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=hYgLw3Mf15Hq32r/BkH/2zlDa8lNlTU/0pwb84PlJw8=;
 b=L7sn6Nvh2LU5xmhd1tNnMyhHRh6LT3xmgMPMVfErIILoaJAN8Uji9lWCMzhmoruSxbvm
 yTvNENNeR95yJ0lkI2lwJbwtuWgNh8FFUi8spml4gkQLosLXop9sUAyhSVojNqYE+J1l
 EAODDxa94CX06LuvoJGh/4OZgbI9qHxws+XV6K4q93lsqVrDfyhUPMWZL6c5bk5VFtKu
 ubzkrN2Cg32tpBByyuK5VtUxHSP4abLha4E/8RgJgXxlQIw9sEbAvc2MVJaq2Lz1vrO3
 4gYEIV2FxN4LUaGHzTWMsVnmBumF5AuoNuCGmuBupGsQzooju4UxUnsRuQnLyIcnrVH6 pw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 3aay222yq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:50:56 +0000
Received: from G2W6310.americas.hpqcorp.net (g2w6310.austin.hp.com
 [16.197.64.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id ED53B60;
 Mon,  9 Aug 2021 13:50:55 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G2W6310.americas.hpqcorp.net (2002:10c5:4034::10c5:4034) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Mon, 9 Aug 2021 13:50:55 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.241.52.13) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Mon, 9 Aug 2021 13:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W41gW/8IRpFVQf5JXq6SFqqhkescajhk39vlQ7+Z0kaOVSocorj7DN4Asg9dd1zSmxgRqicEBw7mQyIy3+rcvDbZNX11KdZAi8PStxH31pR15KESFC+rIX4olbjeylwJdWk96ACY4uwbUi6LKYgFYb7t41G+VRyMMsCn1Fxzp31RCKGsYVy50ESl5KgyWWyV0OcRW/y4WreQKwB2xQqM9NVe8EjvcsRgc3g9sjiEWGmlZFqh1iczNDI0gO35YivCAzYS/w+cpT68zbWGvLg+0LhpM3ouzPfQXDjDQWTps/sYGCn7mV6U7Y8eHGpBb/xcUZ+wBmxiah5b43StCz49zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6uAsZhwvxuMw7QCVo8prw/ysnKRAz6c5IJHBRphqDc=;
 b=PLbnKIYypEhfC+KDfZ4IwaUjBWE3LS0WzkJNlCTqM867wdhBBaoi9KQJb27HbGf0YHnWIHKkHBfzncHW6RLQZTAlx92H49woED06YhDteh92KAvBl3dQ4+tsFXjnrWznqW0eYK/cFg9NwAdL2nEGW015WkaejZhshYAp9Rk9iWZQWRnIsIRaIfxU+mGhtjnfOc4JSg5oyntMZRl35ja86b/tfnJFTdfPl3KMwchBx1ha5640zxU0IdSjwlIjCpMyKsZVv6I4zl3blVxtldOiFhSJ/8Ek1qVupxChcfIy/+MPzkPn4pP8tuvVFJoB/K7ZnJUPk4Ltr44gbPZMZ83qTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0636.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7610::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 13:50:54 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 13:50:54 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Subject: RE: RDE Enablement
Thread-Topic: RDE Enablement
Thread-Index: AddeNQks2n5bD9svT5WNVI3gUyZzFAAAqgIAAABuNjAAFUWKAAulpAcw
Date: Mon, 9 Aug 2021 13:50:54 +0000
Message-ID: <DF4PR8401MB0634695C55B27FAE35516CFC8FF69@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAM=TmwVTAfesxeUodQwGr=3RSvR-7sXQAmF6j5_8Wa3S8fyq3Q@mail.gmail.com>
In-Reply-To: <CAM=TmwVTAfesxeUodQwGr=3RSvR-7sXQAmF6j5_8Wa3S8fyq3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7e6edd5-b676-4743-c34c-08d95b3cb53f
x-ms-traffictypediagnostic: DF4PR8401MB0636:
x-microsoft-antispam-prvs: <DF4PR8401MB06361ECB10838911B435FCE38FF69@DF4PR8401MB0636.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PiQfHa1HDnVPP5jEip1DIzgPRiFr27hhxz7cQ4iabXcGk+hbqF4KoCF/1CQ9Hx0gzKmW/5ms7IfAltHfresXtj8fnudfs/nDY9TSDQUHFs84vBvNyMv5NjuztzzOCxC0fOZOB8WLSyMp2D5DVurIAfxWI9zZkCBEvEieV+CgRz3/WxXnkzDTMBKgvX+ZCegANzsGpGfnH7P8CZHjkyqueeTT4KqmYSYwSBVqt5H34o2f8qcPh9SyRW03UGp3UT/Hz019AvhZaKmyKRwA4pTcB78FTJyhDGxmkQYML3mQ6WZOd0G9lhSwD02MB2toGGzd/nXBmpZvU+R0uFIvFDPUGTbBL4yhGWwx7DqcIJPTZgJXtiLcdfjarlHG9Z53Xq+77If1VhI11NbWXJLSryPjrT5QCysJAoBzv8CDhE//dkW65aRkKGFWbsAeI3KNeGzZSXyjkt+ulf45x/laki/LCh/yOxWfF3xFLUlhGketSUCAUDREmyo4jpjsbXH5elF47AvsDVrBlSJgJMOFaPhUjdwW6NcKQBKAZlUeGkbBGc79iUIk5h4qQ2ErkIARW/cly4owolu6McoCUV3jkRmwiwTSt+3vvDS6rHWqtWeSMcDiIkvIhjSHcIBqS3vw52WqQW+e4aDeCZ2zDNq4qzlw5HH2N4VgrANNcm0ZxwfE1W4+Z4RdRnUwFDHYyFfWRcNogR0oRmMMcjFFSeOI5v5veTs6i5tVCPQAmAMAKr8RXlwpWWvs06jSaSgPhoTO0AUFsluli/X3by1rmrJ+5GnL0mahJMGPZVRNXYGXgMfbnqM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(39860400002)(396003)(38070700005)(64756008)(55236004)(6916009)(86362001)(66946007)(66446008)(54906003)(71200400001)(186003)(8676002)(66476007)(26005)(66556008)(76116006)(8936002)(7116003)(316002)(9686003)(966005)(55016002)(38100700002)(33656002)(4326008)(122000001)(7696005)(53546011)(6506007)(83380400001)(478600001)(2906002)(52536014)(5660300002)(3480700007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHhNTENTOFA5aTMySmhvbVNSb2M0VlEzQ0ljRmJaQi9SUU8xSkZGZFJneW5a?=
 =?utf-8?B?czFWclBIU28wRHU4MEljRnVQZUFLUU5JbFNGa2xxMVZBaXVqUVJVbk43M0tO?=
 =?utf-8?B?bDY3dGFCbS9RaGJScTRQZzcrUUJ1MG80b0ZQdWZ0cXBPaThzdy9Ba0tBc0tS?=
 =?utf-8?B?OXlLY0pqaFpHM3RESnNGeVY2SHZsbUUwYUx4UCtJcEp5bnZZVGVkT3VwN0RB?=
 =?utf-8?B?ekptcUlIQklhcTkzWjNXT2hmeFZEd0VGMEplM21hUnphUGladVorS1JtRDVx?=
 =?utf-8?B?MUlCWXc3bm5BQmFrRFRoZzBSTHU1bnRoSi9mNDQvam03RFlWT2pucmZYVlQz?=
 =?utf-8?B?YWxSUHhVM2ZjaUJXc0JPcVlKbkNjWkVYMWRIanNhMm5HTjhVODdpenNHWnQ1?=
 =?utf-8?B?OFJBbXBEK0xSM2lKcnA5WTRzblFDWVdMb0lPZlMyOURYT1l4K1RkN1RkWE1C?=
 =?utf-8?B?TDlFOEJQcFpTSHRZT2t5RnhmL2FkQk5LVFRYOWlPN0VNUXlGZk9USVVSOXVZ?=
 =?utf-8?B?QkkzU0YvbTlwdjY2aXYzTHFBRE9tb2g3NVM2VmJXa2FDTXh2bnB2cndIQ3pH?=
 =?utf-8?B?VnVEUlZDQXk1ZG9qSFV6U3RJWlIva0o3R0dPZzdUWE9TQjVVT0lKd1NTM1ht?=
 =?utf-8?B?VzRoMXkrREFDbDB0MVVOMHRHa3NrZ0U1Y3F4MC9mcitxL0g3WE5HZmV1ZkRt?=
 =?utf-8?B?dXR4RjRUYmlzejRpN3Y0QU1Ib3FHSS9mUnJwbVRUaU9PaVhBWHZGZGkrUmpk?=
 =?utf-8?B?NWVNcnovY0J3eStWcUE2Tzh3aVJHRStxVnlORXNHb24vSkVmcWNDUXFZcXdt?=
 =?utf-8?B?MzE5RE8xdEVSaU1XdlQwMXQyVmZQWk5GQ0lFNnBvRWRyTFE5MkErN1BRMlFU?=
 =?utf-8?B?OXBCK3lpZFR0UFl3MVNIVjVMeHcrbFdWZXNSaTRDS0lHQ29RN3dUN1hJZTdG?=
 =?utf-8?B?cWhsdzliUHdCUXM4SURwR1RxMzZ1VkRGTGowOFVuNXNnSW5PSWtaaEJtdnh5?=
 =?utf-8?B?YUVyUXBPeDNGalpmOFh0QW1wZ3grWmRnVnlNcit3VDZTT0FicXZJTjZscVdq?=
 =?utf-8?B?M0lqU1NVUVkwaWZOZHNqOWMwdWtDL2U1dFAvOHNWVzVlT09zRlVyK0FHNDN1?=
 =?utf-8?B?OStSdFVRU1kyS1U2K2NiMWJlTEI0bHZjWkx0cG5jRzVPMXZTQmczZDJqeUhT?=
 =?utf-8?B?U2lzWUROQjJoYjZDeVpWdzFmOWsyYTZmS3JjU3c3bVNzRys1MEdZbUp4Q21h?=
 =?utf-8?B?TTJnZHlJdnJCcTRXcCtjZUQ5d3BFQ3RhR292dk5oT2w3Zk1VVWo3RWtOVnpV?=
 =?utf-8?B?azYveEN2SmpTbXZGT1RQWnMxRkFWaXFGeGRSVXRtR1hiL0p4a2VpdjlJQW9w?=
 =?utf-8?B?bXliY1V2bm5tZ0plL3dDdjFLUzdJVEM3UWlCbHkyeDVmbmw2UVJPeHZDVHNH?=
 =?utf-8?B?OHptWEVvOHJpQ2dlTXdVcGEzRlh6OEw3cXdscW5GeWV4Z0pxMmZVQ2JzVS8z?=
 =?utf-8?B?aWtPemlJRmcrazd6czFvWUp1SWdXZzhHRXlzci9Pd0hjOS9POEM4MzZkMFBr?=
 =?utf-8?B?SWZGd1dGOFpwSVBXYUNMT0o5UU9mTEc4MlY5b3pWdGQ2NVcxWVVDZ2ZQZFli?=
 =?utf-8?B?Nll6b2tGcmxzaFpRY1A1WllSL2l3NmhFczlqZGl4d2dOM29sRXZHNFZWMWdY?=
 =?utf-8?B?dHpVZUlMZ3FWR1Erbk9sdloxM2h0Z2pURWZJUFBHZHlsbmNPTUJDMGhZYWoz?=
 =?utf-8?Q?17pMJvhomESi3PCEtBkg0x2JXcdM44b8nOzi0TW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e6edd5-b676-4743-c34c-08d95b3cb53f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 13:50:54.5186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBGf9UryEnJYw1gTt8vLhncMwr2TeCxVnkuBt+dtgElT2wiT/9/yWnPBUhKFaXjwoUg2JzWrLPqDJSePjt5xrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0636
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: _SOyK_OR9VBeUHe_dp6xVpSgs2skhl9U
X-Proofpoint-GUID: _SOyK_OR9VBeUHe_dp6xVpSgs2skhl9U
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090102
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gRGVlcGFrLiAgQXMgYW4gdXBkYXRlLCB3ZSBhcmUganVzdCBhc3NlbWJsaW5nIGEgc3Rh
dGljYWxseSBsaW5rZWQgQyBsaWJyYXJ5IHRoYXQgY2FuIGRvIGdlbmVyaWMgQkVKL0pTT04gZW5j
b2RlL2RlY29kZSB3aXRoIGlucHV0IGRpY3Rpb25hcmllcyBhbmQgc29tZSB1bml0IHRlc3RzLiAg
SSdtIHRoaW5raW5nIHRoYXQgd2UgY291bGQgcHV0IHRoaXMgaW4gaXRzIG93biByZXBvIGFuZCB0
aGVuIGJ1aWxkIG91dCB0aGUgUExETSB0eXBlIDYgaGFuZGxpbmcgaW4gdGhlIFBMRE0gY29kZSBh
cyB5b3Ugc3VnZ2VzdC4NCg0KRmVlZGJhY2sgd2VsY29tZSwNCg0KTWlrZQ0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERlZXBhayBLb2RpaGFsbGkgPGRlZXBhay5rb2Rp
aGFsbGkuODNAZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMTEsIDIwMjEgMTo1NCBB
TQ0KPiBUbzogR2FycmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkgPG1pa2UuZ2FycmV0
dEBocGUuY29tPg0KPiBDYzogRWQgVGFub3VzIDxlZHRhbm91c0Bnb29nbGUuY29tPjsgT3BlbkJN
QyBNYWlsbGlzdA0KPiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPiBTdWJqZWN0OiBSZTog
UkRFIEVuYWJsZW1lbnQNCj4gDQo+IEhpIE1pa2UsDQo+IA0KPiBPbiBGcmksIEp1biAxMSwgMjAy
MSBhdCAyOjI5IEFNIEdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdhcmUpDQo+IDxtaWtl
LmdhcnJldHRAaHBlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBHcmVhdCEgIFdlIGFyZSBpbnRlcmVz
dGVkIGluIFJERSBiZWNvbWluZyB1YmlxdWl0b3VzIG9uIGFkYXB0ZXIgY2FyZHMgc28NCj4gdGhh
dCBSZWRmaXNoIGNvbmZpZ3VyYXRpb24gb2Ygc3RvcmFnZSBhbmQgbmV0d29ya2luZyBkb2Vzbid0
IGhhdmUgdG8gaW5jbHVkZQ0KPiBhZGFwdGVyIHNwZWNpZmljIGNvZGUuICBBIGdvb2Qgc3VjY2Vz
cyBtZXRyaWMgd291bGQgYmUgdGhlIGFiaWxpdHkgdG8gY3JlYXRlIGENCj4gc3RvcmFnZSBsb2dp
Y2FsIHZvbHVtZSB1c2luZyBub3RoaW5nIGJ1dCBzdGFuZGFyZCBSZWRmaXNoIG9wZXJhdGlvbnMu
ICBJbg0KPiBwdXJzdWl0IG9mIHRoaXMsIGEgc29saWQgb3BlbiBzb3VyY2UgT3BlbkJNQyBpbXBs
ZW1lbnRhdGlvbiBzZWVtcyBsaWtlIGENCj4gZ29vZCB3YXkgdG8gcHV0IFJERSBvbiB0aGUgcmln
aHQgZm9vdGluZy4NCj4gPg0KPiA+IE15IGluaXRpYWwgdGhvdWdodHMgd291bGQgYmUgdG8gYnVp
bGQgYW4gUkRFIHN5c3RlbWQgc2VydmljZSBvbiB0b3Agb2YgdGhlDQo+IGV4aXN0aW5nIHBsZG1k
IHNlcnZpY2UgYW5kIGhhdmUgYW4gdXBwZXIgaW50ZXJmYWNlIGludG8gdGhlIHN0YW5kYXJkIGRi
dXMNCj4gaW50ZXJmYWNlcyBmb3IgaW52ZW50b3J5LCBzdGF0dXMsIGFuZCBjb25maWd1cmF0aW9u
LiAgSG93ZXZlciwgSSBzdXNwZWN0DQo+IHRoZXJlJ3Mgc29tZSBhZGRpdGlvbmFsIGRidXMgd29y
ayBuZWVkZWQgdG8gam9pbiBSREUgdG8gYm1jd2ViIGJlY2F1c2UNCj4gdGhlcmUgd2lsbCBiZSBh
IG5lZWQgdG8gZHluYW1pY2FsbHkgY2hhbmdlIHRoZSBSZWRmaXNoIG1vZGVsIGFuZCBzdXBwb3J0
DQo+IHRoaW5ncyBsaWtlIEFjdGlvbnMuICBBIHJlcXVpcmVtZW50IGZvciB0aGlzIHRvIHdvcmsg
d291bGQgYmUgdGhlIGFiaWxpdHkgdG8NCj4gZGlzY292ZXIgUExETSBkZXZpY2VzIGFuZCBhc3Np
Z24gSURzIChNQ1RQIEVJRCkgaW4gb3JkZXIgdG8gaW50ZXJyb2dhdGUNCj4gdGhlbSBmb3IgUkRF
IGNhcGFiaWxpdGllcy4gIEl0IGlzIHVuY2xlYXIgdG8gbWUgdGhhdCB0aGUgY3VycmVudCBQTERN
IGFuZA0KPiBNQ1RQIGNvZGUgaGFuZGxlcyBkaXNjb3Zlcnkgb3IgaWYgaXQgYXNzdW1lcyBkZXZp
Y2VzLg0KPiANCj4gVGhlIGN1cnJlbnQgUExETSBzdGFjayB1cHN0cmVhbSBpcyBtb3N0bHkgZm9y
IHRoZSBCTUMgYXMgYSBQTERNDQo+IHJlc3BvbmRlciwgYnV0IHRoZXJlIGlzIHdvcmsgdW5kZXJ3
YXkgdG8gbWFrZSB0aGUgQk1DIGFjdCBhcyBhIFBMRE0NCj4gcmVxdWVzdGVyLCBkaXNjb3ZlciBk
ZXZpY2VzLCBldGMuIFlvdSBzaG91bGQgc3RhcnQgc2VlaW5nIHBhdGNoZXMgZm9yIHRoZXNlDQo+
IHNob3J0bHkgKHRoZXJlJ3MgYWxyZWFkeQ0KPiBJTlZBTElEIFVSSSBSRU1PVkVEDQo+IHByb2pl
Y3QueHl6L2Mvb3BlbmJtYy9wbGRtLyovNDM0NjVfXztLdyEhTnB4UiF4Y1JvbWFSOEJfMWNtc1hk
VGtqDQo+IHFrQTRfS3JHbTczUVJEOE54R3lJVTBUZzZVRjk1cVBLazhxMm1mVl9QWHZnJCApLg0K
PiANCj4gV2hhdCBpcyB0aGUgcmVhc29uaW5nIGJlaGluZCBoYXZpbmcgUkRFIGFzIGEgc2VwYXJh
dGUgc2VydmljZSBhcyBvcHBvc2VkIHRvDQo+IGJlaW5nIHBhcnQgb2YgdGhlIFBMRE0gc2Vydmlj
ZT8gSSB0aGluayBvbmUgb2YgdGhlIGtleSBhc3BlY3RzIHdvdWxkIGJlIHRoZQ0KPiBSZWRmaXNo
IHRvIFJERSBicmlkZ2UgKGFuZCB2aWNlIHZlcnNhKS4gV2UncmUgYWxzbyBpbnRlcmVzdGVkIGlu
IFJERS4gSSdkIGJlDQo+IGhhcHB5IHRvIGRpc2N1c3MvcmV2aWV3IGZ1cnRoZXIgb24gdGhlIE1M
IG9yIG9uIEdlcnJpdCAoaWYgeW91J3JlIHBsYW5uaW5nIHRvDQo+IHB1dCB1cCBhIGRlc2lnbiBk
b2MpLg0KPiANCj4gVGhhbmtzLA0KPiBEZWVwYWsNCg==
