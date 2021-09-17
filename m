Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4040EE4B
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 02:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9ZF04LB0z2yZd
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 10:13:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=ZEZ0Ruwr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38946560e9=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=ZEZ0Ruwr; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9ZDQ6cTKz2xxn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 10:13:24 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18GMwf7L008438;
 Fri, 17 Sep 2021 00:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=MREqPsWxSIXZWDUicsiGXYJSWi4HItjpmuucH21jpVc=;
 b=ZEZ0Ruwrpgd0DDIdrTbY8Mod6vbVIpWhlybxgqmZ0d/iRQzK1Hiwz4pHWCva1dFITD+i
 Gxplsv2InneZUwHoOa+DW+CE2xbVLVAwSHVnsmSwLnJlcg0gaP+28wU86jRoWhCic9HT
 bqMrvNfpw2dfMVKoak4Lp8YoIx4zouuLIZovPewxX85qSuJzqcS+vE/yvjTbC/SH5B7A
 ACvlNoxficweqtuTNT32U5OItsQSgwMS+1c9XN8U89x0vO4PVE33h6D8QNEB8eI/WdL3
 m1uJ/NQbqoA2jTT1VzcwaE9/EUQtXg1N4m2lF7Ypn6ASdaI7++qzYhOr1EuDmPa+qPcl 9Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx07-002d6701.pphosted.com with ESMTP id 3b3jd2fqub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 00:13:17 +0000
Received: from CO2PR04CA0001.namprd04.prod.outlook.com (2603:10b6:102:1::11)
 by SA2PR08MB6762.namprd08.prod.outlook.com (2603:10b6:806:11a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 00:13:14 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::4d) by CO2PR04CA0001.outlook.office365.com
 (2603:10b6:102:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 00:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.18)
 smtp.mailfrom=flex.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.18 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.18; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.18) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 00:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVGXilNdmUoHA34t5DR3WquPKEP6iSCEi0KbCWVWvy4UlUjvaenvo9q0A8Fk6onQI7m2JfjFkwVv7DyrqDismqFBxs3ueRxzmcNX9dBR0ZTFig2CQl8TKUgmsW04QBwsbc9VB/zURkyotyPtLKpXFityiNsOtFmIPlnZFK9M9sBfHv0M0vix70V386Jn68aKBhzkEoKhBAxcwOibD5voV3+I+U0vYICwltfPMdYy5xxqB9Ci0yBrtwOwxRw6Hvn9W003vZbjv3DzwgEjPNi4XpcqyzOlAff+7Rzm/Mu34nZPguS5FpQiXaimhR/Fq8Gn+NytM3LOqWYSQi7IluqJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MREqPsWxSIXZWDUicsiGXYJSWi4HItjpmuucH21jpVc=;
 b=bqkOXdZ1aq6Bm9lWie+pbdVkxBq1GoFUrkpbpZ95LGlgIKNbzOVWSzxHudhLt3RxydHf+cm7JSOEJRMYYWg4+UiP0N7IFuS6SWA90UVmLK1ho7bOvnfCTa3SPZIAtL8bgt0tKK5lGfxhJbPTPtyy2Ys4y0MPg27OvIQ3GhajRnx+84l0UBh4VCpCk9IsqFdyybY4L7kDxdjRPA4Eg4eUJFMQXXIvLc+oWJzZDRL6x0k3h1/cuvzXA+yIphxNf+7psJCMjlMCuEb/FLoY3hWwNiroXtzBHsa8Z36hn7S1uCgdjEN0i/JrBE0JuQ7JrcGk/0NAzt0ivqDaW1jbDPCpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB5659.namprd08.prod.outlook.com (2603:10b6:5:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 00:13:11 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4500.017; Fri, 17 Sep 2021
 00:13:11 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: =?utf-8?B?UkU6IOWbnuimhjog5Zue6KaGOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVl?=
 =?utf-8?Q?stions_about_IPMI_(OEM)_command_development?=
Thread-Topic: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlv?=
 =?utf-8?Q?ns_about_IPMI_(OEM)_command_development?=
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAVtLgCAAhJtE4AGM2SAgAL8sTA=
Date: Fri, 17 Sep 2021 00:13:11 +0000
Message-ID: <DM6PR08MB5514357A7DC38CA6E538563CDCDD9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <20210909201516.GA6614@mauery.jf.intel.com>
 <DM6PR08MB5514D9029C3FD3A9C5EB7A08DCD79@DM6PR08MB5514.namprd08.prod.outlook.com>
 <20210915023513.GC6614@mauery.jf.intel.com>
In-Reply-To: <20210915023513.GC6614@mauery.jf.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7503a917-9fe8-4dec-472c-08d9796ff0f6
x-ms-traffictypediagnostic: DM6PR08MB5659:|SA2PR08MB6762:
X-Microsoft-Antispam-PRVS: <SA2PR08MB6762C4FE7FD82280391231A2DCDD9@SA2PR08MB6762.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: w4q3/C5Hd5PM+WG3XB7da/cIfUUjX9qUsPR3u2TSBaxeluh31mZ1rovhOLN28M58G3n9lO2O56XTOa21Z+HzhLPALKwEBIefcsYpqQekBv5D8fl2vbE4VjZJK0OE0SlegRsL+umjcR/elqSz6RM7JGf0YmgiAOvtbMkYv0u/ec8xwvgJ4y/5avDR7rBjv+J+OU4h8e/bYif91tlnqgSgeFcb3sbtCDPbwlty13Lw+31ZMLtRdDgGTxJMQtGwt7whSxZOZ4z7kTQBVBrfM8T2ymjzPkcxjBTpTxg+2r1nqYPSBtacNGnNbjyji1UoxmNmFPB01zGaGGZTiPa/97i0a5kvQ7HMr5xcnyxhOzu5nGrLNSLvL2G/sD38K47H06cdA0TRnHMuZ22AtK3sVhDKJ00bFwXNrD08jVILcvVBqz9L3jmAkQ1m9+LPJI87ELMp7gvNWgfpyb0HBMPyFJv++ppsRz8SazUvNZ60/xzzRq/9tMn+CkR9J26OcsI5I1QMMGswnNF6xvF5cKB+4ua7QMzTsO4AbqSetSJ+t/aQN+LTgK7dRrWVmkbe6jJ0wQZGszkaNWscuUDxODikmMEzSVzUDT6UiUknj1iHnOlj6CaRfqJTFuCnLTtvBUXzi+Q6IEvSUXG4BWsyv1pY3CDAVXz5ekqDpYuCi7GQeS4umb0xJFqeMS3bAonEdAddD4HPY3NIzdvsUCwpNNRqCBbPq+Kg4aaSRoAPGNyrR6pMWUQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(52536014)(83380400001)(53546011)(38070700005)(186003)(224303003)(66446008)(6506007)(316002)(33656002)(71200400001)(8936002)(5660300002)(2906002)(26005)(122000001)(4326008)(38100700002)(9686003)(66946007)(7696005)(66476007)(508600001)(55016002)(76116006)(86362001)(6916009)(66556008)(64756008)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5659
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 05c6a142-5915-46b9-7f0a-08d9796fef5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DoA4IqvOwx+H0tJbQ2F9SjLAM1v6THvEKihARyNs1SfpyTqqoTdNo4J56endCffQijW4bzfqYpmSJ/eQnBdBubr8Szfml4JAtcQYYXE10or+XryDSZPklcs1WXSVl9b3MlT80n/Ys+eEy7tXFSwSOhhhoMHr5opRiTnwejCj7apYNXYbiLBORGRvKwyrP/ZMJ8+3rw8s8Wqmh60e0CcmLJ9spjkYQR1M0wDVi45QQzrSoLPcypzb0BfWOmWfbYxC6dTt+D0cX7qCwYIpALel36wzoBxZLPs7PMH7fCu8s78kgqvryoc1dqwPWOvHI1ay6quJYItRPilcMiTdSyhGnZzksXLyrRu910tCwZN2L6CrSPYa2Rxigwvby30/EsoBw82dg3YhiUk6vT7lr3IUZw5SULm6S5/83ID5SFD1DgyOmR79JtzVDDg3eN8BkEn5pXhumDpXZAB+zAW84DLmXyaTNBFzaDe2+s9Ngt841iiNpS/d3fGJKZnk0lO15jdUaChymP8mbCq/a29VVG7KytBmf1ytDpZsSJEDOUhLvWHWBjshwhDz4Pk+okFX4CUotOKuRZiCNJzOUwzhCKYmuVCytiLjHYSdT/rHm8wYcdVQJCcDDNYO8KZ2SPiXB/NHrCHRWwfb3A8jpPJ/SG67YjZX2Z6/PWhYPEzCrIHHUR3IBgDGLx5JR5WNo9YySm9iYyGK+JOY5Ap0StdqZW5PAk5uy21CyPXTgxDG4Z3RQiVYdsIVXsTdF6uY8jfXVEZq8qTgKR8CwBig+0pYbvFttQ==
X-Forefront-Antispam-Report: CIP:144.49.247.18; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(224303003)(6506007)(4186021)(53546011)(83380400001)(2906002)(4326008)(81166007)(336012)(6916009)(316002)(8936002)(82310400003)(47076005)(86362001)(26005)(36860700001)(508600001)(33656002)(52536014)(7696005)(5660300002)(55016002)(356005)(186003)(9686003)(70586007)(70206006)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 00:13:13.8169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7503a917-9fe8-4dec-472c-08d9796ff0f6
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.18];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6762
X-Proofpoint-ORIG-GUID: I02ti1KOAoOevnnfzTO2p7_9zbu_ZXdZ
X-Proofpoint-GUID: I02ti1KOAoOevnnfzTO2p7_9zbu_ZXdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160136
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

SGkgVmVybm9uLA0KDQpHb3QgaXQuIFRoYW5rIHlvdS4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFZlcm5vbiBNYXVlcnkgPHZlcm5v
bi5tYXVlcnlAbGludXguaW50ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE1
LCAyMDIxIDEwOjM1IEFNDQpUbzogQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hyaXMuQ2hlbjNAZmxleC5j
b20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTog5Zue6KaGOiDl
m57opoY6IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlvbnMgYWJvdXQgSVBNSSAoT0VNKSBj
b21tYW5kIGRldmVsb3BtZW50DQoNCk9uIDExLVNlcC0yMDIxIDAzOjU2IEFNLCBDaHJpcyBDaGVu
IChUUEkpIHdyb3RlOg0KPkhpIFZlcm5vbiwNCj4NCj5UaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQg
ZXhwbGFuYXRpb24sIEkgZ290IGEgbG90IG9mIGNvbmNlcHRzIGZyb20gaXQgYW5kIHJlYWxpemVk
IGhvdyBzaG91bGQgSSBjYXJyeSBvbiBuZXh0Lg0KPg0KPkhvd2V2ZXIsIEknbSBub3Qgc3VyZSB3
aGV0aGVyIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGZpbHRlciBpcyBjb3JyZWN0LCBzbyB3b3Vs
ZCBsaWtlIHRvIGNvbmZpcm0gd2l0aCB5b3UgZnVydGhlci4NCj4NCj4NCj4gICogICBJZiBJIGZv
ciBub3cgaGF2ZSAzIElQTUkgcHJvdmlkZXIgbGlicmFyaWVzLCBzdWNoIGFzIHRoZSBvcmlnaW5h
bCBsaWJyYXJ5IGluICJwaG9zcGhvci1ob3N0LWlwbWlkIiwgImludGVsLWlwbWktb2VtIiBhbmQg
Im15IG93biBsaWJyYXJ5IiwgYW5kIHRoZXkgYWxsIGhhdmUgdGhlaXIgb3duIGZpbHRlciB3aXRo
IHdoaXRlbGlzdC4gVGhlc2UgMyBmaWx0ZXJzIHdpbGwgYWxsIGJlIHJlZ2lzdGVyZWQuIFRoZW4s
IHdoZW4gYSBjb21tYW5kIGNvbWVzIGluLCB0aGlzIGNvbW1hbmQgd2lsbCBiZSBwYXNzZWQgdG8g
ZWFjaCBmaWx0ZXIgYW5kIGNoZWNrIGlmIHRoZSBjb21tYW5kIGV4aXN0cyBpbiB0aGVpciB3aGl0
ZWxpc3QuIEFtIEkgY29ycmVjdD8NCg0KVGhlcmUgaXMgYW4gb3B0aW9uIHRvIGRpc2FibGUgdGhl
IGJ1aWx0LWluIHBob3NwaG9yLWhvc3QtaXBtaWQgZmlsdGVyLiANClRoZSBvbmUgdGhhdCBzaGlw
cyB3aXRoIGludGVsLWlwbWktb2VtIHdhcyBhZGRlZCBieSBJbnRlbCB0byByZXBsYWNlIHRoZSBi
dWlsdC1pbiBmaWx0ZXIgZm9yIEludGVsIGJ1aWxkcy4gSWYgdGhlIGludGVsLWlwbWktb2VtIGZp
bHRlciBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIGJ1dCB5b3Ugc3RpbGwgd2FudCB0aGUgcmVzdCBv
ZiB0aGUgcHJvdmlkZXIgY29tbWFuZHMsIHlvdSBtaWdodCBjb25zaWRlciBhZGRpbmcgYSBwYXRj
aCB0byB5b3VyIGxheWVyIHRoYXQgcmVtb3ZlcyB0aGUgZmlsdGVyIHNvIHlvdSBjYW4gY3JlYXRl
IHlvdXIgb3duLg0KDQpUaGUgZmlsdGVycyBtdXN0IGFsbCByZXR1cm4gT0sgKDApIGZvciB0aGUg
Y29tbWFuZCB0byBnZXQgZXhlY3V0ZWQuIFRoZXkgd2lsbCBlYWNoIGJlIHJ1biBpbiBwcmlvcml0
eSBvcmRlciwgYnV0IGlmIGFueSBvZiB0aGVtIHJldHVybiBub24temVybywgdGhlbiB0aGUgY29t
bWFuZCB3aWxsIG5vdCBnZXQgZXhlY3V0ZWQuDQoNCj4gICogICBJZiB5ZXMgaW4gYWJvdmUsIHRo
YXQgbWVhbnMgSSBqdXN0IG5lZWQgdG8gYWRkIHRoZSBjb21tYW5kJ3MgTmV0Rm4vQ29tbWFuZElE
IGluIG9uZSBvZiB0aGVzZSAzIHdoaXRlbGlzdHMsIHRoZSBjb21tYW5kIHN0aWxsIHdpbGwgYmUg
cGFzc2VkIHRvIGEgc3BlY2lmaWMgcHJvdmlkZXIgb25jZSBpdCBleGlzdHMgaW4gb25lIG9mIHRo
ZSB3aGl0ZWxpc3RzPyBPciBJIHNob3VsZCBhZGQgdGhhdCBjb21tYW5kJ3MgTmV0Rm4vQ29tbWFu
ZCB0byB0aGUgd2hpdGVsaXN0IG9mIGl0cyBkZWRpY2F0ZWQgbGlicmFyeT8NCg0KWW91IHdvdWxk
IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYWxsIG9mIHRoZSBmaWx0ZXJzIGFyZSByZXR1cm5pbmcg
T0sgb3IgdGhlIGNvbW1hbmQgd2lsbCBub3QgZ2V0IGV4ZWN1dGVkLg0KDQo+UmVnYXJkcywNCj5D
aHJpcyBDaGVuDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj7lr4Tku7bo
gIU6IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPg0KPuWvhOS7
tuaXpeacnzogMjAyMeW5tDnmnIgxMOaXpSDkuIrljYggMDQ6MTUNCj7mlLbku7bogIU6IENocmlz
IENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPg0KPuWJr+acrDogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+5Li75peoOiBSZTog5Zue
6KaGOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkgKE9FTSkgY29t
bWFuZCANCj5kZXZlbG9wbWVudA0KPg0KPk9uIDA2LVNlcC0yMDIxIDA5OjQwIEFNLCBDaHJpcyBD
aGVuIChUUEkpIHdyb3RlOg0KPj5IaSBhbGwsDQo+Pg0KPj5JIGd1ZXNzIHRoaXMgbWFpbCB3YXMg
Z290IG92ZXJ3aGVsbWVkIGJ5IGJ1bmNoZXMgb2YgZW1haWxzLCBzbyBwbGVhc2UgbGV0IG1lIHJl
c2VuZCBpdCBhbmQgaG9wZSBzb21lb25lIGNvdWxkIGhlbHAgbWUuIEFub3RoZXIsIEkgYWRkIG9u
ZSBtb3JlIHF1ZXN0aW9uIG1hcmtlZCAjNSBiZWxvdy4NCj4NCj5UaGFua3MgZm9yIGJlaW5nIHBl
cnNpc3RlbnQgOikNCj4NCj4+DQo+PkhpIGFsbCwNCj4+DQo+PkkgaGF2ZSBzdHVkaWVkICJwaG9z
cGhvci1ob3N0LWlwbWlkIiBwYWNrYWdlIGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBhbmQgZ290IHVu
ZGVyc3RhbmRpbmcgdGhhdCBpdCBoYXMgaW1wbGVtZW50ZWQgc29tZSBtYW5kYXRvcnkgYW5kIG9w
dGlvbmFsIGNvbW1hbmRzIGFscmVhZHkuIEFuZCBJIGFsc28ga25ldyB0aGF0IEknbSBhYmxlIHRv
IGxldmVyYWdlICJpbnRlbC1pcG1pLW9lbSIgcGFja2FnZSB0byBnZXQgbW9yZSBjb21tYW5kIGhh
bmRsZXJzLiBCdXQgdGhlcmUncmUgc29tZSBxdWVzdGlvbnMgcmFpc2VkIGluIG15IG1pbmQsIEkg
aG9wZSBzb21lb25lIGNvdWxkIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucy4NCj4+DQo+PiAgMS4g
IFdoYXQncyB0aGUgbm9ybWFsIGRldmVsb3BtZW50IHByb2NlZHVyZSBpbiBjYXNlIEkgd2FudCB0
byBtYWtlIG91ciBvd24gT0VNIGNvbW1hbmRzPyBJIG1lYW4gZG8geW91IGd1eXMgZW5jb3VyYWdl
IG1lIHRvIGNyZWF0ZSBhIG5ldyAieHh4LWlwbWktb2VtIiBwYWNrYWdlIG9yIHRvIGxldmVyYWdl
ICJpbnRlbC1pcG1pLW9lbSIgYW5kIHRoZW4gYWRkIG91ciBvd24gY29tbWFuZHMgaW4gaXQ/DQo+
DQo+Rmlyc3Qgc29tZSBjb21tb24gbGFuZ3VhZ2U6DQo+MSkgeHh4LWlwbWktb2VtIGlzIGFuIElQ
TUkgcHJvdmlkZXIgbGlicmFyeS4gSXQgZG9lc24ndCBuZWVkIHRvIGJlIA0KPmNhbGxlZCB4eHgt
aXBtaS1vZW0sIGJ1dCB0aGF0IGlzIGp1c3QgYSBjb252ZW5pZW50IG5hbWluZyBjb252ZW50aW9u
Lg0KPjIpIHdoaXRlbGlzdCAocHJlZmVyIGFsbG93bGlzdCkgaXMgb25lIGtpbmQgb2YgZmlsdGVy
LiBGaWx0ZXJzIGFyZSANCj5yZWdpc3RlcmVkIGxpa2UgY29tbWFuZCBoYW5kbGVycywgd2l0aCBh
IHByaW9yaXR5LiBGaWx0ZXJzIGNhbiBkbyBtb3JlIA0KPnRoYW4ganVzdCBibG9jayBvciBhbGxv
dyB0aGUgY29tbWFuZHMgY29taW5nIGluLiBUaGUgZmlsdGVyIGlzIHBhc3NlZCANCj50aGUgcmVx
dWVzdCBhbmQgY2FuIGRvIGFueXRoaW5nIGl0IHdhbnRzIGJlZm9yZSBwYXNzaW5nIGl0IG9uLiBM
b2dnaW5nLCANCj5tYW5nbGluZywgYmxvY2tpbmcsIGV0Yy4NCj4NCj5JdCBkZXBlbmRzIG9uIGEg
bG90IG9mIHRoaW5ncy4gTWF5YmUgeWVzLCBjcmVhdGUgYSBuZXcgcmVwbz8gTW9yZSANCj5kaXNj
dXNzaW9uIGJlbG93Lg0KPg0KPj4gIDIuICBJIGZvciBub3cgYWRkZWQgImludGVsLWlwbWktb2Vt
IiBwYWNrYWdlIG9ubHkgZm9yIHVzaW5nIGl0cyAiPENoYXNzaXM+OjxTZXQgRnJvbnQgUGFuZWwg
RW5hYmxlcz4iIGNvbW1hbmQgYmVjYXVzZSBJIGZpZ3VyZWQgb3V0IHRoZSBzYW1lIGNvbW1hbmQg
aW4gdGhlICJwaG9zcGhvci1ob3N0LWlwbWlkIiBpcyBub3QgYWJsZSB0byBtYXRjaCB0aGUgZC1i
dXMgaW50ZXJmYWNlIGluIHRoZSAieDg2LXBvd2VyLWNvbnRyb2wiLiBJJ20gbm90IHN1cmUgaWYg
SSB3aWxsIG5lZWQgb3RoZXIgY29tbWFuZHMgaW4gdGhlICJpbnRlbC1pcG1pLW9lbSIsIGJ1dCB3
aGF0IGlmIEkgZG9uJ3QgbmVlZCBvdGhlciBjb21tYW5kcywgaG93IHRvIHJlbW92ZSB0aGVtPyB0
byB1c2UgdGhlIHdoaXRlbGlzdCBtZWNoYW5pc20/DQo+DQo+VGhlcmUgaXMgbm90IGEgbWV0aG9k
IHRvIHJlbW92ZSB0aGVtLCBidXQgeW91IGNhbiBmaWx0ZXIgdGhlbSBhcyB5b3UgDQo+c3VnZ2Vz
dGVkLiBBbHNvLCBpZiB5b3Ugd2FudCB0byBhZGQgYSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24g
KGZyb20gYSANCj5kaWZmZXJlbnQgSVBNSSBwcm92aWRlciBsaWJyYXJ5KSBhdCBhIGhpZ2hlciBw
cmlvcml0eSwgb25seSB0aGUgaGlnaGVyIA0KPnByaW9yaXR5IGltcGxlbWVudGF0aW9uIHdpbGwg
YmUgdXNlZC4NCj4NCj4+ICAzLiAgSXMgaXQgb2theSB0byBhZGQgbW9yZSB0aGFuIDEgeHh4LWlw
bWktb21lIHBhY2thZ2VzPyBJZiB5ZXMsIGhvdyB0byBtYW5hZ2UgdGhlIHdoaXRlbGlzdCBiZXR3
ZWVuIHRoZXNlIDIgT0VNIHBhY2thZ2VzPw0KPg0KPllvdSBjYW4gaGF2ZSBhcyBtYW55IElQTUkg
cHJvdmlkZXIgbGlicmFyaWVzIG9uIHRoZSBCTUMgYXMgbmVlZGVkLg0KPg0KPlRoZSBmaWx0ZXJp
bmcgbWVjaGFuaXNtIGRvZXMgbm90IGRpc2NyaW1pbmF0ZSBiZXR3ZWVuIHRoZSBwcm92aWRlciwg
aXQgDQo+aXMgdXNlZCBhdCBleGVjdXRpb24gdGltZSB3aGVuIGEgY29tbWFuZCBjb21lcyBpbi4g
RXZlcnkgY29tbWFuZCBpcyANCj5wYXNzZWQgdG8gZWFjaCBmaWx0ZXINCj4NCj4+ICA0LiAgQW0g
SSBhYmxlIHRvIHVzZSAiaW50ZWwtaXBtaS1vZW0iIG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2lu
ZyBBTUQgQ1BVPw0KPg0KPklBTkFMLCBidXQsIHllcy4gSXQgaXMgb3BlbiBzb3VyY2UgYW5kIHRo
ZSBsaWNlbnNlIGRvZXMgbm90IG1ha2UgdGhhdCANCj5yZXN0cmljdGlvbi4gSXQgbWlnaHQgbG9v
ayBraW5kIG9mIHdlaXJkIHRob3VnaCA6KQ0KPg0KPklmIHlvdSBsaWtlIGFsbCB0aGUgSVBNSSBm
dW5jdGlvbnMgaW1wbGVtZW50ZWQgYnkgdGhlIGludGVsLWlwbWktb2VtLCANCj5pdCBpcyBmaW5l
IHRvIHVzZSBpdCBhcyBpcy4gSWYgdGhlcmUgYXJlIHRoaW5ncyB5b3Ugd2FudCB0byBjaGFuZ2Us
IA0KPnRoZXJlIGFyZSBkaWZmZXJlbnQgd2F5cyB0byBnbyBhYm91dCBpdC4NCj4NCj5IZXJlIGFy
ZSBhIGNvdXBsZSBvZiBzY2VuYXJpb3Mgd2l0aCBzb21lIG9wdGlvbnM6DQo+MSkgWW91IGxpa2Ug
dGhlIGJlaGF2aW9yIG9mIGFuIElQTUkgcHJvdmlkZXIgbGlicmFyeSwgYnV0IHdhbnQgc29tZSAN
Cj5jaGFuZ2VzLiBUYWxrIHdpdGggdGhlIG93bmVyIGFuZCBzZWUgaWYgeW91IGNhbiBjb21lIHRv
IHNvbWUgY29uc2Vuc3VzIA0KPnRoYXQgd29ya3MgZm9yIGV2ZXJ5b25lLiBUaGlzIGlzIHRoZSBt
b3N0IG9wZW5zb3VyY2UsIA0KPmNvbW11bml0eS1idWlsZGluZywgZ29vZC13aWxsIGJlaGF2aW9y
IG9mIGFsbC4gU3VibWl0IGEgY2hhbmdlIGFuZCBzZWUgDQo+aWYgeW91IGNhbiBnZXQgaXQgbWVy
Z2VkLg0KPg0KPjIpIFlvdSBsaWtlIGFsbCB0aGUgSVBNSSBjb21tYW5kcyBpbiBhbiBJUE1JIHBy
b3ZpZGVyIGxpYnJhcnkgZXhjZXB0IA0KPmZvciBvbmUgb3IgdHdvLiBJZiB5b3Ugd2FudCB0byBv
d24gdGhlIHdvcmsgdG8ga2VlcCBhIHBhdGNoIHVwIHRvIGRhdGUsIA0KPml0IGlzIHBvc3NpYmxl
IHRvIGp1c3QgYWRkIGEgYmJhcHBlbmQgYW5kIGEgcGF0Y2ggdG8gbW9kaWZ5IHRoZSBjb2RlIA0K
PnByaW9yIHRvIGJ1aWxkaW5nLiBUaGlzIGlzIG9rYXksIGJ1dCBtYXliZSBub3QgYXMgaWRlYWwu
IEl0IG1heSBlbmQgdXAgDQo+d2l0aCBhIHNtYWxsZXIgaW1hZ2Ugc2l6ZSB0aGFuIGFkZGluZyBh
IG5ldyBwcm92aWRlciBsaWJyYXJ5IHRvIA0KPm92ZXJsb2FkIHRoZSBjb21tYW5kIGltcGxlbWVu
dGF0aW9uLg0KPg0KPjMpIFlvdSBsaWtlIGFsbCB0aGUgSVBNSSBjb21tYW5kcyBpbiBhbiBJUE1J
IHByb3ZpZGVyIGxpYnJhcnkgZXhjZXB0IA0KPmZvciBvbmUgb3IgdHdvLiBZb3UgY2FuIGNyZWF0
ZSBhIG5ldyBJUE1JIHByb3ZpZGVyIGxpYnJhcnkgZm9yIHlvdXIgDQo+b3JnYW5pemF0aW9uIHRo
YXQgY2FuIGZpbHRlciBvdXQgYW5kL29yIHByb3ZpZGUgb3ZlcmxvYWRzIGZvciBhbnkgDQo+ZXhp
c3RpbmcgaW1wbGVtZW50YXRpb24gb2YgSVBNSSBjb21tYW5kcyBmcm9tIGFueSBudW1iZXIgb2Yg
b3RoZXIgSVBNSSANCj5wcm92aWRlcnMuDQo+DQo+NCkgWW91IG9ubHkgbGlrZSBzb21lIGJpdHMg
b2YgYW5vdGhlciBJUE1JIHByb3ZpZGVyLiBZb3UgbWF5IGJlIGJlc3QgDQo+b2ZmIHRvIGp1c3Qg
Y29weSB0aG9zZSBiaXRzIGludG8gYSBuZXcgSVBNSSBwcm92aWRlciBsaWJyYXJ5IG9mIHlvdXIg
DQo+b3duLCBhZGQgeW91ciBvd24gb3RoZXIgT0VNIGNvbW1hbmRzIGFuZC9vciBpbXBsZW1lbnRh
dGlvbnMgYW5kIGNhcnJ5IG9uLg0KPg0KPlJlYWxseSwgbm9uZSBvZiB0aGUgJ3NvbHV0aW9ucycg
YXJlIGlkZWFsLCBidXQgd2UgYXJlIHRyeWluZyB0byBtYWtlIA0KPnRyYWRlLW9mZnMgaGVyZSB0
aGF0IGFsbG93IGluZGl2aWR1YWwgY29udHJpYnV0aW5nIG9yZ2FuaXphdGlvbnMgDQo+ZnJlZWRv
bSB0byBpbXBsZW1lbnQgT0VNIGNvbW1hbmRzIGFzIHRoZXkgd2lzaCB3aXRob3V0IGFueSBvbmUg
DQo+b3JnYW5pemF0aW9uIGJlaW5nIGEgZ2F0ZWtlZXBlci4NCj4NCj4tLVZlcm5vbg0KPg0KPkxl
Z2FsIERpc2NsYWltZXIgOg0KPlRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNz
YWdlIG1heSBiZSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuDQo+SXQgaXMgaW50ZW5kZWQg
dG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IA0K
PmlzIGFkZHJlc3NlZCBvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlz
IG1lc3NhZ2UgaXMgbm90IA0KPnRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgb24gbm90
aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIA0KPm1lc3NhZ2UsIGluIGFueSBmb3Jt
LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIA0KPm1l
c3NhZ2UgaW4gZXJyb3IsIHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQg
ZGVsZXRlIG9yIGRlc3Ryb3kgYW55IGNvcHkgb2YgdGhpcyBtZXNzYWdlIQ0K
