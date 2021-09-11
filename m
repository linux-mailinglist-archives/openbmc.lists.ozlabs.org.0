Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC54074F6
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 05:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5zVD5Tzcz2yQ0
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 13:57:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=LPxpsY4u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=3888707f7f=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=LPxpsY4u; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5zTh6dZrz2yJY
 for <openbmc@lists.ozlabs.org>; Sat, 11 Sep 2021 13:57:27 +1000 (AEST)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18B3qfRd004751; Sat, 11 Sep 2021 03:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=0dBX12tKKXspJk9ZFgxK6iZdMR7UnKhYU6DYU7WxtCQ=;
 b=LPxpsY4uxzPckQWGL8wGELV0l6X/+rnQ4BdMp3RialrrtRDOKG1eBXx8tG/x04wlTj8l
 9yyrag5fGPOawB5U1aL+JN1odkHvMDCJtVr92GxX04eqkef13aZ/26mGVNTW2HBn9o9c
 dYfTCYhPEKePIIFIRlQcNl4u0sOlaIVFCvNAlpYvTwLBB4UhnN0D76b4ifeYcnFKUeVX
 Ec1Q1OYdbZiy1OJQTF2qQrdUMeLyDOpYUDIhMXhHdU3NfVictFlRTQsyJxzZzRvXJzJ5
 UZbLXrUqiZrkwewHxVUEjk8xaPDBRJEsskW2IPJcWwJBeOtZ1yKGkohaAu/DgBHxH5aG lg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx07-002d6701.pphosted.com with ESMTP id 3b0kad87hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Sep 2021 03:56:18 +0000
Received: from DM5PR04CA0032.namprd04.prod.outlook.com (2603:10b6:3:12b::18)
 by MN2PR08MB5742.namprd08.prod.outlook.com (2603:10b6:208:10e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Sat, 11 Sep
 2021 03:56:16 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:12b::4) by DM5PR04CA0032.outlook.office365.com
 (2603:10b6:3:12b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Sat, 11 Sep 2021 03:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.52)
 smtp.mailfrom=flex.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.52 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.52; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.52) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Sat, 11 Sep 2021 03:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oenzzfwaFI/+NRh9HfTHd415ENNFjB2L5O+otHAic9NKYlMK8MJlWZpDt1XEXkq3l4P9nL/f+0FdoEZPjQdrVlKVmc5ewTgnc9uf6jkz7cs0E/W3rrSwJh4t7eSLtN8gDy4Q+6JR+duK1U9y/MobfKdEBrv19jgZUFx4tkkXNe7vGWXhucsGzJCPaJx0rJRUcvu1FqrX0GWNXDsOwKXzePZi1KrUt81ww7PGppsBJdoEe6lWo3p84tFW5VqHaduKwH7ZSguKdu3i8bS6aHBMaF/h4lvSSGVnyvmzyV1qvwj5cLVcTqg81a53I+FX9JykexT05el+k7i/zPpuXLgmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QUoc018YRuLLqkySOMOexLaTO5sm/6OLyClHPcnv5V8=;
 b=mJqWVcGX8U/zrpVVcP7LOhq0AJocd4desJeJGFzExe56KgRfJ+wRG9VGclpZu1jlPCORfds/ns7mxhyQeB/+wK58oCu2ZFdjIVEJobtknxjpItCa+FeIGfo1FmBunnIPNmW/ucSpMPVJ6FJ0RUueyAMrbSfG84pB1h0cJWBIM8+cLWZ4EuOG+P6WQ8DKBW7NlbIUrE2JGgbyDuaZVCJ0/WNaT+UfB7NoWHB9qf36sTfB3Ms6MiK5xVGPv+7voyqByUWIhE6Qb8QJq1Vx8tyZRezNpNwJXSEcufSXs/pFPmEa4/jMbNwCBsX2JTE35rD/8NVzkbqi3WFDAN2X93gptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4266.namprd08.prod.outlook.com (2603:10b6:5:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Sat, 11 Sep
 2021 03:56:14 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4500.017; Sat, 11 Sep 2021
 03:56:13 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: =?big5?B?pl7C0Dogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91?=
 =?big5?Q?t_IPMI_(OEM)_command_development?=
Thread-Topic: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAVtLgCAAhJtEw==
Date: Sat, 11 Sep 2021 03:56:13 +0000
Message-ID: <DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <20210909201516.GA6614@mauery.jf.intel.com>
In-Reply-To: <20210909201516.GA6614@mauery.jf.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 69f63748-3b1f-5895-409f-aee9bad5c82d
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 513813e8-40d2-4214-1add-08d974d81ad2
x-ms-traffictypediagnostic: DM6PR08MB4266:|MN2PR08MB5742:
X-Microsoft-Antispam-PRVS: <MN2PR08MB57422F0309E02EA82643F3DEDCD79@MN2PR08MB5742.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kH3At8K2p8HXM73f0zMRIkVjxv8kikdzT3YwnZWDBSXzvd6V1vRpai93h0pydwhHXT1L+OLClzCYZ/t5uUZNrduOVDWhfABF+I0ADqk0l4FbgatflhP4MKKjduH5tsAGy9r0B1GeHMuBQXViEjjXm0Ge54VmKbeDhNiVwYk5cNUH7uubA2OgWQMeO2hZBsEkT+8cByzH6UqF0JY8ciXqBKxuRv4reGxpMzFyYagXOefV3h9IqpGEidm/tfRjW05rSfOA6Lp/K9KHDfI+3JSVYIbRVclZpSoJeZCXWGyyl/AjqFOuQqWVvw01rGKOUfRfJIvkyNf5AF/c4swmiCCPv1azxG04y7buCf3YJTsFAYXrw83GbqwVvSsYAmk3YrcdoXht7GkN/QDnJ5s9HRL8CVHKHXqmQKHYaMAgud/a2u5hfqn+jrQVRb+PMZcXru7dYSN3Q1OQnrpDDp0jFsFNxPCGBBcQfTn0wofdnEUO931EufwVZiqSOs+d2mSA87PrSXGDc7tplKLBbJknKP6S5mkzJFcBVZX0BlH7VOpZxGalmR2qHcX/lI8b6CvtMwqcwH0kZ/iX75dUPn9qfR5waXgPIop7CWZ2HknOuQtRxcUT6b4WelAS+Oxb3u/QKOGwgxHlU8YBja+VdIEdWa4qkuMZCnISEGi1Y+OjjQmDYChEDpt5aWG5z4GdAruuCk0RylJLWWQWsU3vb+57BuZPpF79CociVs1g1RzdzD1ooxE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(186003)(38070700005)(6506007)(4326008)(91956017)(8936002)(26005)(66446008)(9686003)(224303003)(19627405001)(76116006)(7696005)(71200400001)(66556008)(55016002)(52536014)(66476007)(64756008)(66946007)(33656002)(38100700002)(5660300002)(122000001)(83380400001)(2906002)(508600001)(86362001)(53546011)(6916009)(316002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4266
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1eb7424a-539e-4594-f972-08d974d81972
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhFpqJ15dwtaJzfFEXcB4QU5VcW4oZ2kW0b5di4rJMt+4rQU5BXUUARWmzXon7Tw7Y3e8CC0wsriq/NbBqOJY1VKtIytKzWpcywLdl9fTXzmzqrWufvxYunlhHsDZMp2imcPup13DZZqYOfll6R1sYcI6b9a69o3sfn0MkZk6Vfwh2+ia7vc0UKmlb/6emNlAm2oeLS9taahybNoX0BAzHFvtFnppl5O4h/Ny3SFfF68iO4tHXcqiF87qnPMLDJoE8QoY8Zo8aRb8OzYhLhcEMRVLfVHfhw3LU1UauX7my3H8+MSiT+bI0zH0777GPf39WjY9t5pSjJA9NvSDFXuDdKE2g6poH2QjZf+L6aAbOuQha44Qlzv+En+r0vQbxhlWOlbRnO98D6XEHVafuWSbylKrQqZV9zw41Zu6WUWqXW+nxw8D9hwbiY+Cma2+KsuhuTClYpTSFH2OX4+/dXUQzi1Oft3V1GFR2iWtNkg+K7c2rtoL3tCYu9Z2Yo0X8G6mnt/MvDfKuykeQGuRqZJwfRLVxsfagRH7otTBRnGm66hdPS5SRYNV6m/iIj45gjmw1Wxyx0WvH1maJr7Jlq1M3z/YlIgXg/mUiV6AqaA33r7KOV/AhfmS7Vd9uSV7dg1a/qjLlQocpXz/ZVD6HrbBvbac5upw2QH0XKhQ0WjJdPw11kqzsivRTr13xG5lNTyqSGMLAixgyQObOyTJoPs5QE7t4hYLv9vrzewIdP3z9lPjCYCB6It3AtA6ndkHN1l8GEZivO3Ka1m+UdHfqbVJg==
X-Forefront-Antispam-Report: CIP:144.49.247.52; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(376002)(39860400002)(396003)(136003)(346002)(46966006)(36840700001)(55016002)(70586007)(4186021)(9686003)(33656002)(26005)(7696005)(82310400003)(47076005)(316002)(30864003)(356005)(4326008)(2906002)(5660300002)(336012)(6916009)(224303003)(52536014)(83380400001)(478600001)(186003)(6506007)(81166007)(36860700001)(86362001)(8936002)(70206006)(82740400003)(53546011)(19627405001)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2021 03:56:15.8722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513813e8-40d2-4214-1add-08d974d81ad2
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.52];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5742
X-Proofpoint-ORIG-GUID: C7ceUCwBZJ700gI6g3027EZJXkRHvZa0
X-Proofpoint-GUID: C7ceUCwBZJ700gI6g3027EZJXkRHvZa0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-11_01:2021-09-09,
 2021-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109110019
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

--_000_DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgVmVybm9uLA0KDQpUaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQgZXhwbGFuYXRpb24sIEkgZ290
IGEgbG90IG9mIGNvbmNlcHRzIGZyb20gaXQgYW5kIHJlYWxpemVkIGhvdyBzaG91bGQgSSBjYXJy
eSBvbiBuZXh0Lg0KDQpIb3dldmVyLCBJJ20gbm90IHN1cmUgd2hldGhlciBteSB1bmRlcnN0YW5k
aW5nIG9mIHRoZSBmaWx0ZXIgaXMgY29ycmVjdCwgc28gd291bGQgbGlrZSB0byBjb25maXJtIHdp
dGggeW91IGZ1cnRoZXIuDQoNCg0KICAqICAgSWYgSSBmb3Igbm93IGhhdmUgMyBJUE1JIHByb3Zp
ZGVyIGxpYnJhcmllcywgc3VjaCBhcyB0aGUgb3JpZ2luYWwgbGlicmFyeSBpbiAicGhvc3Bob3It
aG9zdC1pcG1pZCIsICJpbnRlbC1pcG1pLW9lbSIgYW5kICJteSBvd24gbGlicmFyeSIsIGFuZCB0
aGV5IGFsbCBoYXZlIHRoZWlyIG93biBmaWx0ZXIgd2l0aCB3aGl0ZWxpc3QuIFRoZXNlIDMgZmls
dGVycyB3aWxsIGFsbCBiZSByZWdpc3RlcmVkLiBUaGVuLCB3aGVuIGEgY29tbWFuZCBjb21lcyBp
biwgdGhpcyBjb21tYW5kIHdpbGwgYmUgcGFzc2VkIHRvIGVhY2ggZmlsdGVyIGFuZCBjaGVjayBp
ZiB0aGUgY29tbWFuZCBleGlzdHMgaW4gdGhlaXIgd2hpdGVsaXN0LiBBbSBJIGNvcnJlY3Q/DQoN
CiAgKiAgIElmIHllcyBpbiBhYm92ZSwgdGhhdCBtZWFucyBJIGp1c3QgbmVlZCB0byBhZGQgdGhl
IGNvbW1hbmQncyBOZXRGbi9Db21tYW5kSUQgaW4gb25lIG9mIHRoZXNlIDMgd2hpdGVsaXN0cywg
dGhlIGNvbW1hbmQgc3RpbGwgd2lsbCBiZSBwYXNzZWQgdG8gYSBzcGVjaWZpYyBwcm92aWRlciBv
bmNlIGl0IGV4aXN0cyBpbiBvbmUgb2YgdGhlIHdoaXRlbGlzdHM/IE9yIEkgc2hvdWxkIGFkZCB0
aGF0IGNvbW1hbmQncyBOZXRGbi9Db21tYW5kIHRvIHRoZSB3aGl0ZWxpc3Qgb2YgaXRzIGRlZGlj
YXRlZCBsaWJyYXJ5Pw0KDQpSZWdhcmRzLA0KQ2hyaXMgQ2hlbg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KsUil86rMOiBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxp
bnV4LmludGVsLmNvbT4NCrFIpfOk6bTBOiAyMDIxpn45pOsxMKTpIKRXpMggMDQ6MTUNCqaspfOq
zDogQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hyaXMuQ2hlbjNAZmxleC5jb20+DQqwxqW7OiBvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiCm
XsLQOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkgKE9FTSkgY29t
bWFuZCBkZXZlbG9wbWVudA0KDQpPbiAwNi1TZXAtMjAyMSAwOTo0MCBBTSwgQ2hyaXMgQ2hlbiAo
VFBJKSB3cm90ZToNCj5IaSBhbGwsDQo+DQo+SSBndWVzcyB0aGlzIG1haWwgd2FzIGdvdCBvdmVy
d2hlbG1lZCBieSBidW5jaGVzIG9mIGVtYWlscywgc28gcGxlYXNlIGxldCBtZSByZXNlbmQgaXQg
YW5kIGhvcGUgc29tZW9uZSBjb3VsZCBoZWxwIG1lLiBBbm90aGVyLCBJIGFkZCBvbmUgbW9yZSBx
dWVzdGlvbiBtYXJrZWQgIzUgYmVsb3cuDQoNClRoYW5rcyBmb3IgYmVpbmcgcGVyc2lzdGVudCA6
KQ0KDQo+DQo+SGkgYWxsLA0KPg0KPkkgaGF2ZSBzdHVkaWVkICJwaG9zcGhvci1ob3N0LWlwbWlk
IiBwYWNrYWdlIGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBhbmQgZ290IHVuZGVyc3RhbmRpbmcgdGhh
dCBpdCBoYXMgaW1wbGVtZW50ZWQgc29tZSBtYW5kYXRvcnkgYW5kIG9wdGlvbmFsIGNvbW1hbmRz
IGFscmVhZHkuIEFuZCBJIGFsc28ga25ldyB0aGF0IEknbSBhYmxlIHRvIGxldmVyYWdlICJpbnRl
bC1pcG1pLW9lbSIgcGFja2FnZSB0byBnZXQgbW9yZSBjb21tYW5kIGhhbmRsZXJzLiBCdXQgdGhl
cmUncmUgc29tZSBxdWVzdGlvbnMgcmFpc2VkIGluIG15IG1pbmQsIEkgaG9wZSBzb21lb25lIGNv
dWxkIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucy4NCj4NCj4gIDEuICBXaGF0J3MgdGhlIG5vcm1h
bCBkZXZlbG9wbWVudCBwcm9jZWR1cmUgaW4gY2FzZSBJIHdhbnQgdG8gbWFrZSBvdXIgb3duIE9F
TSBjb21tYW5kcz8gSSBtZWFuIGRvIHlvdSBndXlzIGVuY291cmFnZSBtZSB0byBjcmVhdGUgYSBu
ZXcgInh4eC1pcG1pLW9lbSIgcGFja2FnZSBvciB0byBsZXZlcmFnZSAiaW50ZWwtaXBtaS1vZW0i
IGFuZCB0aGVuIGFkZCBvdXIgb3duIGNvbW1hbmRzIGluIGl0Pw0KDQpGaXJzdCBzb21lIGNvbW1v
biBsYW5ndWFnZToNCjEpIHh4eC1pcG1pLW9lbSBpcyBhbiBJUE1JIHByb3ZpZGVyIGxpYnJhcnku
IEl0IGRvZXNuJ3QgbmVlZCB0byBiZQ0KY2FsbGVkIHh4eC1pcG1pLW9lbSwgYnV0IHRoYXQgaXMg
anVzdCBhIGNvbnZlbmllbnQgbmFtaW5nIGNvbnZlbnRpb24uDQoyKSB3aGl0ZWxpc3QgKHByZWZl
ciBhbGxvd2xpc3QpIGlzIG9uZSBraW5kIG9mIGZpbHRlci4gRmlsdGVycyBhcmUNCnJlZ2lzdGVy
ZWQgbGlrZSBjb21tYW5kIGhhbmRsZXJzLCB3aXRoIGEgcHJpb3JpdHkuIEZpbHRlcnMgY2FuIGRv
IG1vcmUNCnRoYW4ganVzdCBibG9jayBvciBhbGxvdyB0aGUgY29tbWFuZHMgY29taW5nIGluLiBU
aGUgZmlsdGVyIGlzIHBhc3NlZA0KdGhlIHJlcXVlc3QgYW5kIGNhbiBkbyBhbnl0aGluZyBpdCB3
YW50cyBiZWZvcmUgcGFzc2luZyBpdCBvbi4gTG9nZ2luZywNCm1hbmdsaW5nLCBibG9ja2luZywg
ZXRjLg0KDQpJdCBkZXBlbmRzIG9uIGEgbG90IG9mIHRoaW5ncy4gTWF5YmUgeWVzLCBjcmVhdGUg
YSBuZXcgcmVwbz8gTW9yZQ0KZGlzY3Vzc2lvbiBiZWxvdy4NCg0KPiAgMi4gIEkgZm9yIG5vdyBh
ZGRlZCAiaW50ZWwtaXBtaS1vZW0iIHBhY2thZ2Ugb25seSBmb3IgdXNpbmcgaXRzICI8Q2hhc3Np
cz46PFNldCBGcm9udCBQYW5lbCBFbmFibGVzPiIgY29tbWFuZCBiZWNhdXNlIEkgZmlndXJlZCBv
dXQgdGhlIHNhbWUgY29tbWFuZCBpbiB0aGUgInBob3NwaG9yLWhvc3QtaXBtaWQiIGlzIG5vdCBh
YmxlIHRvIG1hdGNoIHRoZSBkLWJ1cyBpbnRlcmZhY2UgaW4gdGhlICJ4ODYtcG93ZXItY29udHJv
bCIuIEknbSBub3Qgc3VyZSBpZiBJIHdpbGwgbmVlZCBvdGhlciBjb21tYW5kcyBpbiB0aGUgImlu
dGVsLWlwbWktb2VtIiwgYnV0IHdoYXQgaWYgSSBkb24ndCBuZWVkIG90aGVyIGNvbW1hbmRzLCBo
b3cgdG8gcmVtb3ZlIHRoZW0/IHRvIHVzZSB0aGUgd2hpdGVsaXN0IG1lY2hhbmlzbT8NCg0KVGhl
cmUgaXMgbm90IGEgbWV0aG9kIHRvIHJlbW92ZSB0aGVtLCBidXQgeW91IGNhbiBmaWx0ZXIgdGhl
bSBhcyB5b3UNCnN1Z2dlc3RlZC4gQWxzbywgaWYgeW91IHdhbnQgdG8gYWRkIGEgZGlmZmVyZW50
IGltcGxlbWVudGF0aW9uIChmcm9tIGENCmRpZmZlcmVudCBJUE1JIHByb3ZpZGVyIGxpYnJhcnkp
IGF0IGEgaGlnaGVyIHByaW9yaXR5LCBvbmx5IHRoZSBoaWdoZXINCnByaW9yaXR5IGltcGxlbWVu
dGF0aW9uIHdpbGwgYmUgdXNlZC4NCg0KPiAgMy4gIElzIGl0IG9rYXkgdG8gYWRkIG1vcmUgdGhh
biAxIHh4eC1pcG1pLW9tZSBwYWNrYWdlcz8gSWYgeWVzLCBob3cgdG8gbWFuYWdlIHRoZSB3aGl0
ZWxpc3QgYmV0d2VlbiB0aGVzZSAyIE9FTSBwYWNrYWdlcz8NCg0KWW91IGNhbiBoYXZlIGFzIG1h
bnkgSVBNSSBwcm92aWRlciBsaWJyYXJpZXMgb24gdGhlIEJNQyBhcyBuZWVkZWQuDQoNClRoZSBm
aWx0ZXJpbmcgbWVjaGFuaXNtIGRvZXMgbm90IGRpc2NyaW1pbmF0ZSBiZXR3ZWVuIHRoZSBwcm92
aWRlciwgaXQNCmlzIHVzZWQgYXQgZXhlY3V0aW9uIHRpbWUgd2hlbiBhIGNvbW1hbmQgY29tZXMg
aW4uIEV2ZXJ5IGNvbW1hbmQgaXMNCnBhc3NlZCB0byBlYWNoIGZpbHRlcg0KDQo+ICA0LiAgQW0g
SSBhYmxlIHRvIHVzZSAiaW50ZWwtaXBtaS1vZW0iIG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2lu
ZyBBTUQgQ1BVPw0KDQpJQU5BTCwgYnV0LCB5ZXMuIEl0IGlzIG9wZW4gc291cmNlIGFuZCB0aGUg
bGljZW5zZSBkb2VzIG5vdCBtYWtlIHRoYXQNCnJlc3RyaWN0aW9uLiBJdCBtaWdodCBsb29rIGtp
bmQgb2Ygd2VpcmQgdGhvdWdoIDopDQoNCklmIHlvdSBsaWtlIGFsbCB0aGUgSVBNSSBmdW5jdGlv
bnMgaW1wbGVtZW50ZWQgYnkgdGhlIGludGVsLWlwbWktb2VtLCBpdA0KaXMgZmluZSB0byB1c2Ug
aXQgYXMgaXMuIElmIHRoZXJlIGFyZSB0aGluZ3MgeW91IHdhbnQgdG8gY2hhbmdlLCB0aGVyZQ0K
YXJlIGRpZmZlcmVudCB3YXlzIHRvIGdvIGFib3V0IGl0Lg0KDQpIZXJlIGFyZSBhIGNvdXBsZSBv
ZiBzY2VuYXJpb3Mgd2l0aCBzb21lIG9wdGlvbnM6DQoxKSBZb3UgbGlrZSB0aGUgYmVoYXZpb3Ig
b2YgYW4gSVBNSSBwcm92aWRlciBsaWJyYXJ5LCBidXQgd2FudCBzb21lDQpjaGFuZ2VzLiBUYWxr
IHdpdGggdGhlIG93bmVyIGFuZCBzZWUgaWYgeW91IGNhbiBjb21lIHRvIHNvbWUgY29uc2Vuc3Vz
DQp0aGF0IHdvcmtzIGZvciBldmVyeW9uZS4gVGhpcyBpcyB0aGUgbW9zdCBvcGVuc291cmNlLA0K
Y29tbXVuaXR5LWJ1aWxkaW5nLCBnb29kLXdpbGwgYmVoYXZpb3Igb2YgYWxsLiBTdWJtaXQgYSBj
aGFuZ2UgYW5kIHNlZQ0KaWYgeW91IGNhbiBnZXQgaXQgbWVyZ2VkLg0KDQoyKSBZb3UgbGlrZSBh
bGwgdGhlIElQTUkgY29tbWFuZHMgaW4gYW4gSVBNSSBwcm92aWRlciBsaWJyYXJ5IGV4Y2VwdCBm
b3INCm9uZSBvciB0d28uIElmIHlvdSB3YW50IHRvIG93biB0aGUgd29yayB0byBrZWVwIGEgcGF0
Y2ggdXAgdG8gZGF0ZSwgaXQNCmlzIHBvc3NpYmxlIHRvIGp1c3QgYWRkIGEgYmJhcHBlbmQgYW5k
IGEgcGF0Y2ggdG8gbW9kaWZ5IHRoZSBjb2RlIHByaW9yDQp0byBidWlsZGluZy4gVGhpcyBpcyBv
a2F5LCBidXQgbWF5YmUgbm90IGFzIGlkZWFsLiBJdCBtYXkgZW5kIHVwIHdpdGggYQ0Kc21hbGxl
ciBpbWFnZSBzaXplIHRoYW4gYWRkaW5nIGEgbmV3IHByb3ZpZGVyIGxpYnJhcnkgdG8gb3Zlcmxv
YWQgdGhlDQpjb21tYW5kIGltcGxlbWVudGF0aW9uLg0KDQozKSBZb3UgbGlrZSBhbGwgdGhlIElQ
TUkgY29tbWFuZHMgaW4gYW4gSVBNSSBwcm92aWRlciBsaWJyYXJ5IGV4Y2VwdCBmb3INCm9uZSBv
ciB0d28uIFlvdSBjYW4gY3JlYXRlIGEgbmV3IElQTUkgcHJvdmlkZXIgbGlicmFyeSBmb3IgeW91
cg0Kb3JnYW5pemF0aW9uIHRoYXQgY2FuIGZpbHRlciBvdXQgYW5kL29yIHByb3ZpZGUgb3Zlcmxv
YWRzIGZvciBhbnkNCmV4aXN0aW5nIGltcGxlbWVudGF0aW9uIG9mIElQTUkgY29tbWFuZHMgZnJv
bSBhbnkgbnVtYmVyIG9mIG90aGVyIElQTUkNCnByb3ZpZGVycy4NCg0KNCkgWW91IG9ubHkgbGlr
ZSBzb21lIGJpdHMgb2YgYW5vdGhlciBJUE1JIHByb3ZpZGVyLiBZb3UgbWF5IGJlIGJlc3Qgb2Zm
DQp0byBqdXN0IGNvcHkgdGhvc2UgYml0cyBpbnRvIGEgbmV3IElQTUkgcHJvdmlkZXIgbGlicmFy
eSBvZiB5b3VyIG93biwNCmFkZCB5b3VyIG93biBvdGhlciBPRU0gY29tbWFuZHMgYW5kL29yIGlt
cGxlbWVudGF0aW9ucyBhbmQgY2Fycnkgb24uDQoNClJlYWxseSwgbm9uZSBvZiB0aGUgJ3NvbHV0
aW9ucycgYXJlIGlkZWFsLCBidXQgd2UgYXJlIHRyeWluZyB0byBtYWtlDQp0cmFkZS1vZmZzIGhl
cmUgdGhhdCBhbGxvdyBpbmRpdmlkdWFsIGNvbnRyaWJ1dGluZyBvcmdhbml6YXRpb25zIGZyZWVk
b20NCnRvIGltcGxlbWVudCBPRU0gY29tbWFuZHMgYXMgdGhleSB3aXNoIHdpdGhvdXQgYW55IG9u
ZSBvcmdhbml6YXRpb24NCmJlaW5nIGEgZ2F0ZWtlZXBlci4NCg0KLS1WZXJub24NCgpMZWdhbCBE
aXNjbGFpbWVyIDoKVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5
IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJlIHJl
YWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNz
ZWQgCm9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBp
cyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55
IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0bHkg
cHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCAK
cGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVzdHJv
eSBhbnkgY29weSBvZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"margin:0px; font-size:12pt">Hi Vernon,</span> </div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"margin:0px; font-size:12pt"><br>
</div>
<div style=3D"margin:0px; font-size:12pt">Thanks for your <span style=3D"ba=
ckground-color:rgb(255,255,255); display:inline!important">
detailed&nbsp;</span>explanation, I got a lot of concepts from it and reali=
zed how should I carry on next.</div>
<div style=3D"margin:0px; font-size:12pt"><br>
</div>
<div style=3D"margin:0px; font-size:12pt">However, I'm not sure whether my =
understanding of the filter is correct, so would like to confirm with you f=
urther.
<div style=3D"margin:0px"><br>
</div>
<div style=3D"margin:0px">
<ul>
<li>If I for now have 3 IPMI provider libraries, such as the original libra=
ry in &quot;phosphor-host-ipmid&quot;, &quot;<span style=3D"margin:0px; bac=
kground-color:rgb(255,255,255); display:inline!important">intel-ipmi-oem&qu=
ot;<span style=3D"margin:0px">&nbsp;</span></span>and &quot;my own
 library&quot;, and they all have their own filter with whitelist. These 3 =
filters will all be registered. Then, when a command comes in, this command=
 will be passed to each filter and check if the command exists in their whi=
telist. Am I correct?</li></ul>
<ul>
<li>If yes in above, that means I just need to add the command's NetFn/Comm=
andID in one of these 3 whitelists, the command still will be passed to a s=
pecific provider once it exists in one of the whitelists? Or I should add t=
hat command's NetFn/Command to the
 whitelist of its dedicated library?</li></ul>
</div>
</div>
<div style=3D"margin:0px; font-size:12pt"><br>
</div>
<div style=3D"margin:0px; font-size:12pt">Regards,</div>
<span style=3D"margin:0px; font-size:12pt">Chris Chen</span><br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Vernon Ma=
uery &lt;vernon.mauery@linux.intel.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB10=A4=E9 =A4W=A4=C8 04:15<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B0=C6=A5=BB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;<br>
<b>=A5D=A6=AE:</b> Re: =A6^=C2=D0: [phosphor-host-ipmid] Questions about IP=
MI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">On 06-Sep-2021 09:40 AM, Chris Chen (TPI) wrote:<b=
r>
&gt;Hi all,<br>
&gt;<br>
&gt;I guess this mail was got overwhelmed by bunches of emails, so please l=
et me resend it and hope someone could help me. Another, I add one more que=
stion marked #5 below.<br>
<br>
Thanks for being persistent :)<br>
<br>
&gt;<br>
&gt;Hi all,<br>
&gt;<br>
&gt;I have studied &quot;phosphor-host-ipmid&quot; package for a couple of =
weeks and got understanding that it has implemented some mandatory and opti=
onal commands already. And I also knew that I'm able to leverage &quot;inte=
l-ipmi-oem&quot; package to get more command handlers.
 But there're some questions raised in my mind, I hope someone could give m=
e some suggestions.<br>
&gt;<br>
&gt;&nbsp; 1.&nbsp; What's the normal development procedure in case I want =
to make our own OEM commands? I mean do you guys encourage me to create a n=
ew &quot;xxx-ipmi-oem&quot; package or to leverage &quot;intel-ipmi-oem&quo=
t; and then add our own commands in it?<br>
<br>
First some common language:<br>
1) xxx-ipmi-oem is an IPMI provider library. It doesn't need to be <br>
called xxx-ipmi-oem, but that is just a convenient naming convention.<br>
2) whitelist (prefer allowlist) is one kind of filter. Filters are <br>
registered like command handlers, with a priority. Filters can do more <br>
than just block or allow the commands coming in. The filter is passed <br>
the request and can do anything it wants before passing it on. Logging, <br>
mangling, blocking, etc.<br>
<br>
It depends on a lot of things. Maybe yes, create a new repo? More <br>
discussion below.<br>
<br>
&gt;&nbsp; 2.&nbsp; I for now added &quot;intel-ipmi-oem&quot; package only=
 for using its &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; =
command because I figured out the same command in the &quot;phosphor-host-i=
pmid&quot; is not able to match the d-bus interface in the &quot;x86-power-=
control&quot;. I'm not
 sure if I will need other commands in the &quot;intel-ipmi-oem&quot;, but =
what if I don't need other commands, how to remove them? to use the whiteli=
st mechanism?<br>
<br>
There is not a method to remove them, but you can filter them as you <br>
suggested. Also, if you want to add a different implementation (from a <br>
different IPMI provider library) at a higher priority, only the higher <br>
priority implementation will be used.<br>
<br>
&gt;&nbsp; 3.&nbsp; Is it okay to add more than 1 xxx-ipmi-ome packages? If=
 yes, how to manage the whitelist between these 2 OEM packages?<br>
<br>
You can have as many IPMI provider libraries on the BMC as needed.<br>
<br>
The filtering mechanism does not discriminate between the provider, it <br>
is used at execution time when a command comes in. Every command is <br>
passed to each filter <br>
<br>
&gt;&nbsp; 4.&nbsp; Am I able to use &quot;intel-ipmi-oem&quot; on a platfo=
rm that is using AMD CPU?<br>
<br>
IANAL, but, yes. It is open source and the license does not make that <br>
restriction. It might look kind of weird though :)<br>
<br>
If you like all the IPMI functions implemented by the intel-ipmi-oem, it <b=
r>
is fine to use it as is. If there are things you want to change, there <br>
are different ways to go about it.<br>
<br>
Here are a couple of scenarios with some options:<br>
1) You like the behavior of an IPMI provider library, but want some <br>
changes. Talk with the owner and see if you can come to some consensus <br>
that works for everyone. This is the most opensource, <br>
community-building, good-will behavior of all. Submit a change and see <br>
if you can get it merged.<br>
<br>
2) You like all the IPMI commands in an IPMI provider library except for <b=
r>
one or two. If you want to own the work to keep a patch up to date, it <br>
is possible to just add a bbappend and a patch to modify the code prior <br>
to building. This is okay, but maybe not as ideal. It may end up with a <br>
smaller image size than adding a new provider library to overload the <br>
command implementation.<br>
<br>
3) You like all the IPMI commands in an IPMI provider library except for <b=
r>
one or two. You can create a new IPMI provider library for your <br>
organization that can filter out and/or provide overloads for any <br>
existing implementation of IPMI commands from any number of other IPMI <br>
providers.<br>
<br>
4) You only like some bits of another IPMI provider. You may be best off <b=
r>
to just copy those bits into a new IPMI provider library of your own, <br>
add your own other OEM commands and/or implementations and carry on.<br>
<br>
Really, none of the 'solutions' are ideal, but we are trying to make <br>
trade-offs here that allow individual contributing organizations freedom <b=
r>
to implement OEM commands as they wish without any one organization <br>
being a gatekeeper.<br>
<br>
--Vernon<br>
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

--_000_DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79DM6PR08MB5514namp_--
