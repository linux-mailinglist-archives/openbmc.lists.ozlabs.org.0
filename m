Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545543AE3E
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 10:40:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdldF0XBHz2yQH
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 19:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=dbR7+Dhk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=49332ae7e7=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=dbR7+Dhk; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdlcj6lmCz2xtK
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 19:39:48 +1100 (AEDT)
Received: from pps.filterd (m0132504.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19Q0rYlS003290; 
 Tue, 26 Oct 2021 08:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=INj7LFYx/6JWqg/olJ8s4N8k28DC8ZvDFg+f8LqqA+0=;
 b=dbR7+DhkpCtAuxlNbN4q6/8xXKk+uM1Qac9IBllDAIs26CYVitU5LI18VFukKtMCYNZy
 pkAkmf0ePfM9OlfVj98LznN0A6IUevhkVesGKi5UzqaAXBcOxh9nsuCSxNJMs+4GLDdD
 t6QX+vnaibI9UEwdfQUZqbkCttjVLhlzcmNEyBFfaiopq7Zx/cVtHtTxS51yPu+73B3Q
 cI6pl1ijkpOG9uj+VSjtgm2gZWNLcbTOPxaBAjCBJW6fy6tWacoqiIOttm/+5pREu8kG
 XWVkQw30pbYZvqvUQ7J/ZOmWTX2ftR5483iQRMNzpeInMDqsBN4gxjtzoDhbLSIolj6p Yw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx07-002d6701.pphosted.com with ESMTP id 3bx4e9tquu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 08:39:44 +0000
Received: from DS7PR03CA0346.namprd03.prod.outlook.com (2603:10b6:8:55::9) by
 CH0PR08MB7275.namprd08.prod.outlook.com (2603:10b6:610:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 08:39:42 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::d8) by DS7PR03CA0346.outlook.office365.com
 (2603:10b6:8:55::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 08:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.76)
 smtp.mailfrom=flex.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.76 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.76; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.76) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 08:39:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlaE6Fzsep+yasroaa3cYjYL+2RaawkZB4CCoX54CGWP8k/O4xYfxiWH6yCvcS6doBSxUTRDa9Q/uGdLOjm2x2f5OONy0EGtndzlv56ACK2oNsa8TYa21XTTjoACwlLF8QBT3tfEz6RUPhaxS+eRlBLITA5rLgIknXDO5XZHU0zKsnRIZ1bMgbG3r389AuU9JruFUYf2SKp/CPC5mYel4PvpboEllu+8I4hSinFiljJdFLjffrovxUR+2VwdW3T5RnFcopavfNXFLd3AAOfUOw+wwzPZK+HhJKGZGj5JcYvJPF1e8EfqNkgkcWqJiiR2KohvdgW+lgW/yQ5G+8Us1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKL9Yh61V8dQW6B2LtzDmrY6ORJ0bGw9XinVULFbxN8=;
 b=V6QYBgd16WMgPenO3r/2efR2l3cBRz5x5tnE4yUkPShKhsPb8qFAH/bM9K5GtK1yOizbBWTKMksQcI3N54Wcee5+x6aWf9Uz1zU0SpHNUtppw5nY/x1p8wUwS47sznZauDPSfy35PHUHMgbFQcR/u8Bo2IDcKazPjnpH38paXjGVNvvZWSrm50cxZrXFcWz+uZfs/4xIazXpiHQohlv1t7i6jSWF7mISWDkjDNpXxkjbL+XgCuEkycsf2szB5QuJgFgbT43surFnaD/y8T0eQcBQh99gGS34/30YmTOhvb9TdDhP8MvBIXL9LaOfsFmF82UhoTyCsaYqNDuLZnHu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB2811.namprd08.prod.outlook.com (2603:10b6:3:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 08:39:39 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 08:39:39 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Lei YU <mine260309@gmail.com>
Subject: =?big5?B?pl7C0DogW1BoaXNoaW5nIFJpc2tdIFtFeHRlcm5hbF0gUmU6IFtwaG9zcGhvci1z?=
 =?big5?Q?el-logger]_How_to_add_a_journal_entry_manually?=
Thread-Topic: [Phishing Risk] [External] Re: [phosphor-sel-logger] How to add
 a journal entry manually
Thread-Index: AdfJj9dxnWWV0JDhS1CKjHs8M84D5gAVIMgAAAuJj4AABk7D+gABmNGAAASy964=
Date: Tue, 26 Oct 2021 08:39:39 +0000
Message-ID: <DM6PR08MB55140A91066EE39C8AB79F6ADC849@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
 <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
 <CAGm54UHh2CUhvRSD4fKzTgbqZENPVfzesvxcK0Gxd4QtGQ1nVw@mail.gmail.com>
 <DM6PR08MB55145AC2D3451DF2CF042092DC849@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CAARXrtmF9KVYyB-qN7AGhEuvT6dAaUcz9wwr-Oy7kfyW6tFPeA@mail.gmail.com>
In-Reply-To: <CAARXrtmF9KVYyB-qN7AGhEuvT6dAaUcz9wwr-Oy7kfyW6tFPeA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7ca3a0fa-f5d8-6f6d-aa0b-652067673aa0
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 15dda9e5-dc8b-48b6-0f60-08d9985c27c5
x-ms-traffictypediagnostic: DM5PR08MB2811:|CH0PR08MB7275:
X-Microsoft-Antispam-PRVS: <CH0PR08MB727590C74889274F44B913CBDC849@CH0PR08MB7275.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3SEFH/GNtoiC5xbQIxZqk5Aa1GJ+OJRCpm0szE6JJO1a4BlYljHgrzBvayRgFx7p0UDWnoLS3m5/gfpkaZ2IWIEbDZ1rU65p2jfnZuZCdisHowdZnYucF4d5QJjiNkUsd7aKDfWZYM/v7KBXiwvABGVsSLNOV7VSfVdSfZcHRJ2fFYAkaYRqM3soZoXWF2/+H3BT3qjI8jlLPpggEUY9hLTnz0+tg7S9DR+XkQuEhtC+dwxL1dUTKe64FiFonpn6g6cLym0REBGVszoseeGNiB1cEThQRU3S2tgLchLYPqTDnFv4CQBbG2NQI3Ez6gXRPJbnjKVs3NK5IqOUbg04ukBiSb/QNLjg8SaSgtMyPKfFSa+SzToeW+UX0AhZvfTSNmVtv9Yr/W5rzWFXSoKdGC91WTtLmOwvQmqK3ezCU/xN9xqWGOu/N4XkXHpUnVSD7uIjMTwG9PEwmHv1zsE9hA61akSZ0SkybUjoy2DaXrp5MFsUcZ6O8cgyFLMrpeYAcQqqCMM2rXxJycvQzfeggJY/eGvcnxF9oOhA/S+AOjgTVj3rOSRMzlLvQFIlQY73ze0ZYMO2fcXmp1g0wlCXTjOIe4dM4io5VbvnA/uTUfI9QsKYzJAAeKoRTo99j/lP5gy30oGw4acRWiosfFGRlVk7SXRldxOr4MlsvUCL4E7SfzywOKXxtIHCXtt954UMRAkASAAIEXaiecFVbx7bHA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(186003)(33656002)(2906002)(76116006)(71200400001)(91956017)(9686003)(38070700005)(6506007)(53546011)(38100700002)(7696005)(122000001)(8936002)(6916009)(66476007)(66446008)(5660300002)(66556008)(64756008)(316002)(55016002)(66946007)(86362001)(4326008)(508600001)(83380400001)(224303003)(52536014)(19627405001);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55140A91066EE39C8AB79F6ADC849DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2811
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 389ea57c-d7ca-4550-0fec-08d9985c2633
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmIUqUj1uqD0ZwJhIbQIXBeFbKlJTQDS6FAsPrtjPvDvBx/8qRT7P0Z5zJohm99uSZhhcvR8lgO2+nw4KehFxRi8jJeoIJxShzTxo8FmvRQ0MqIgMRTv01Sm8QrQNc6gqj3hX9+y1/F8L3pHae1+Uumuo1X/FlbZAOaj/oc0yjfLks84FbNWkBRdozPleUODJh8Rd2MbgQm7gP+P/WJC13K7df8yazd/Mu37noYw9jJRclBHank24Q9P9kTgA1G1Ew0d7of/WhmghzprSLlOP/64+0EcN5JQMhY1NUHkmEZB5EMb77r05J1I9jA0AR6tNLDdj2hinzJDTGaegdZ9mNYE1wwwljhql+IeBUsPGZRvW24AWmnnHyUQZs7nLa28Bd8ZApl4ziWcdxI67omzNSOtFj9zSYdvQ/RbCwoweXz5UO9yRPTZZ6ZViLmobhmEhZ4ctxK9GSfHwZ/DJffJs+15Cn0v4c/wpLbUzsU+tdE+CIP7rUUHKETGmkD0CzuPZm+DAIsBlTylRPeQTIb5DkqcItLqnDDaIkblQCIILykfRP7kUjoo+XmgTYCiM9W0fkpOHwXvItQO0SXVYAhhGMnHLnhm8a7A2Z/hPbZB6xzWIHSqqB1z1ikpws4fgKaCtc6leeMjbpFrhLVdGPQCYVAvWWgDGEmxMzyTeYu4rZWCoIB6sjx0MDoHFbEEFDV1CUVHvWmbj0nSidYXYYtD2F/eQ3z/6+G7k145aBQLGL4=
X-Forefront-Antispam-Report: CIP:144.49.247.76; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(508600001)(7696005)(70586007)(336012)(70206006)(356005)(53546011)(186003)(19627405001)(9686003)(6916009)(26005)(36860700001)(82310400003)(2906002)(6506007)(52536014)(5660300002)(55016002)(4186021)(83380400001)(33656002)(224303003)(316002)(8936002)(81166007)(86362001)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 08:39:41.9695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dda9e5-dc8b-48b6-0f60-08d9985c27c5
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.76];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB7275
X-Proofpoint-ORIG-GUID: 5VSme7StcbxTrlnUJOmwD41_LQxPWgQl
X-Proofpoint-GUID: 5VSme7StcbxTrlnUJOmwD41_LQxPWgQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110260048
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

--_000_DM6PR08MB55140A91066EE39C8AB79F6ADC849DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgTGVpIFl1LA0KDQpVbmRlcnN0b29kLiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uDQoN
ClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQqxSKXzqsw6IExlaSBZVSA8bWluZTI2MDMwOUBnbWFpbC5jb20+DQqxSKXzpOm0wTogMjAyMaZ+
MTCk6zI2pOkgpFWkyCAwMjoyNA0Kpqyl86rMOiBDaHJpcyBDaGVuIChUUEkpIDxDaHJpcy5DaGVu
M0BmbGV4LmNvbT4NCrDGpbs6IExlaSBZdSA8eXVsZWkuc2hAYnl0ZWRhbmNlLmNvbT47IEJpbGxz
LCBKYXNvbiBNIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT47IG9wZW5ibWMgPG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiBbUGhpc2hpbmcgUmlza10gW0V4dGVybmFs
XSBSZTogW3Bob3NwaG9yLXNlbC1sb2dnZXJdIEhvdyB0byBhZGQgYSBqb3VybmFsIGVudHJ5IG1h
bnVhbGx5DQoNCk9uIFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDI6MTYgUE0gQ2hyaXMgQ2hlbiAoVFBJ
KSA8Q2hyaXMuQ2hlbjNAZmxleC5jb20+IHdyb3RlOg0KPg0KPiBIaSBKYXNvbiBhbmQgTGVpIFl1
LA0KPg0KPiBUaGFua3MgZm9yIHlvdXIgc2hhcmluZy4NCj4NCj4gSSBhbSBhYmxlIHRvIHNlZSB0
aGUgc2VsIGluIHRoZSAvdmFyL2xvZy9pcG1pX3NlbCBhcyBzYW1lIGFzIEphc29uIG1lbnRpb25l
ZCBhbmQgYWxzbyBzZWUgdGhlIHNlbCBieSB0aGUgImlwbWl0b29sIHNlbCBsaXN0IiBjb21tYW5k
Lg0KPg0KPiBIb3dldmVyLCBmb3IgTGVpJ3Mgc3VnZ2VzdGlvbiBvZiBhZGRpbmcgInNlbmQtdG8t
bG9nZ2VyIiBjb25maWd1cmF0aW9uLCBJIHJlYWxseSBjYW4gc2VlIGl0IGJlY29tZXMgYW4gZW50
cnkgaW4gL3h5ei9vcGVuYm1jX3Byb2plY3QvbG9nZ2luZy9lbnRyeS9YIHJhdGhlciB0aGFuIHNh
dmluZyB0aGUgbWVzc2FnZSBpbiB0aGUgL3Zhci9sb2cvaXBtaV9zZWwsIGJ1dCBJIGNhbid0IHNl
ZSBhbnkgc2VsIGVudHJ5IGJ5IHRoZSAiaXBtaXRvb2wgc2VsIGxpc3QiIGNvbW1hbmQuIEl0IGxv
b2tzIGxpa2UgdGhlIGlwbWlkIGRvZXNuJ3QgcGFyc2UgdGhlIGVudHJ5IGludG8gYW4gU0VMIHJl
Y29yZC4gSXMgaXQgdGhlIHNlbCBlbnRyeSBJIGFkZGVkIChidXNjdGwgY2FsbCB4eXoub3BlbmJt
Y19wcm9qZWN0LkxvZ2dpbmcuSVBNSSAveHl6L29wZW5ibWNfcHJvamVjdC9Mb2dnaW5nL0lQTUkg
eHl6Lm9wZW5ibWNfcHJvamVjdC5Mb2dnaW5nLklQTUkgSXBtaVNlbEFkZCBzc2F5YnEgImhlbGxv
d29ybGQiICIveHl6L29wZW5ibWNfcHJvamVjdC9UZXN0IiAzIDE2IDMyIDY0IHRydWUgMHg4MSkg
anVzdCBhIHNhbXBsZSBub3QgYSBmb3JtYWwgaW5mbz8gb3IgZHVlIHRvIG90aGVyIHJlYXNvbnM/
DQoNCkl0IGRlcGVuZHMgb24gdGhlIGNvbmZpZyBvZiBpcG1pZC4gWW91IG1heSBiZSB1c2luZyB0
aGUgZHluYW1pYyBzZW5zb3INCmZlYXR1cmUgKEZFQVRVUkVfRFlOQU1JQ19TRU5TT1JTKSwgd2hp
Y2ggZG9lcyBub3Qgd29yayB3aXRoIHRoZSBhYm92ZQ0KY2FzZS4NClRvIG1ha2UgaXBtaWQgd29y
ayB3aXRoIHRoZSBsb2dnaW5nIGVudHJ5IC0+IFNFTCBwYXJzaW5nLCB5b3UgbmVlZCB0bw0KdXNl
IHRoZSBzdGF0aWMgc2Vuc29ycyBkZWZpbmVkIGJ5IHlhbWwgY29uZmlnLCBhbmQgdGhlbiB0aGUg
Y29kZSB3aWxsDQpwYXJzZSB0aGUgbG9nZ2luZyBlbnRyeSBpbnRvIGEgU0VMIHJlY29yZC4NCgpM
ZWdhbCBEaXNjbGFpbWVyIDoKVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3Nh
Z2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRv
IGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBh
ZGRyZXNzZWQgCm9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVz
c2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRo
YXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVy
cm9yLCAKcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3Ig
ZGVzdHJveSBhbnkgY29weSBvZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB55140A91066EE39C8AB79F6ADC849DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Lei Yu,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Understood. Thanks for your explanation.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Lei YU &l=
t;mine260309@gmail.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~10=A4=EB26=A4=E9 =A4U=A4=C8 02:24<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B0=C6=A5=BB:</b> Lei Yu &lt;yulei.sh@bytedance.com&gt;; Bills, Jason M =
&lt;jason.m.bills@linux.intel.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org=
&gt;<br>
<b>=A5D=A6=AE:</b> Re: [Phishing Risk] [External] Re: [phosphor-sel-logger]=
 How to add a journal entry manually</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">On Tue, Oct 26, 2021 at 2:16 PM Chris Chen (TPI) &=
lt;Chris.Chen3@flex.com&gt; wrote:<br>
&gt;<br>
&gt; Hi Jason and Lei Yu,<br>
&gt;<br>
&gt; Thanks for your sharing.<br>
&gt;<br>
&gt; I am able to see the sel in the /var/log/ipmi_sel as same as Jason men=
tioned and also see the sel by the &quot;ipmitool sel list&quot; command.<b=
r>
&gt;<br>
&gt; However, for Lei's suggestion of adding &quot;send-to-logger&quot; con=
figuration, I really can see it becomes an entry in /xyz/openbmc_project/lo=
gging/entry/X rather than saving the message in the /var/log/ipmi_sel, but =
I can't see any sel entry by the &quot;ipmitool sel
 list&quot; command. It looks like the ipmid doesn't parse the entry into a=
n SEL record. Is it the sel entry I added (busctl call xyz.openbmc_project.=
Logging.IPMI /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.=
IPMI IpmiSelAdd ssaybq &quot;helloworld&quot; &quot;/xyz/openbmc_project/Te=
st&quot;
 3 16 32 64 true 0x81) just a sample not a formal info? or due to other rea=
sons?<br>
<br>
It depends on the config of ipmid. You may be using the dynamic sensor<br>
feature (FEATURE_DYNAMIC_SENSORS), which does not work with the above<br>
case.<br>
To make ipmid work with the logging entry -&gt; SEL parsing, you need to<br>
use the static sensors defined by yaml config, and then the code will<br>
parse the logging entry into a SEL record.<br>
</div>
</span></font></div>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB55140A91066EE39C8AB79F6ADC849DM6PR08MB5514namp_--
