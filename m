Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD94447F06
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 12:38:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnpym0rVcz2ywH
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 22:38:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=HWDYiXFO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=59469fcd6c=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=HWDYiXFO; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnpyC2pvmz2x99
 for <openbmc@lists.ozlabs.org>; Mon,  8 Nov 2021 22:37:53 +1100 (AEDT)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A88JvBu017572
 for <openbmc@lists.ozlabs.org>; Mon, 8 Nov 2021 11:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=fhRZF816/Iyu6J3jXfLdiqWy07ot3lhxsnpyMi7NfZk=;
 b=HWDYiXFOrORWqnLm94rfHFYwToIqXjCv8B9Z5PReO0DllpJKERu6041dEve9YJU0BwZ0
 koHJAFubtsIh4ZoCyWf3mt25ejL8EWU1sCIta7BPKjxG7cLzX3sfxhxjz0sa3Ewani0B
 yAxDP+M8U7yFYXU8tiKy3PbCTPbh2J4LeJn7UWKRS92NRoCVeWchoy4i+ggGkebmxeUF
 oHmELJaBM5XPbByLtT3ma6xIH9rKnc/45cjO0Or3KWQiqVbGmvFuXI8yBVfVGWCWF34s
 O/SVvGeMyybZg5Uy5vyDxXZMeUEhqHJK9yhayFvy5OzhRrqm2W+lrG0Qty/L9Y+b90dy aA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx07-002d6701.pphosted.com with ESMTP id 3c6x2na069-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 Nov 2021 11:37:49 +0000
Received: from DM6PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:100::31)
 by SN4PR0801MB3806.namprd08.prod.outlook.com (2603:10b6:803:4a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Mon, 8 Nov
 2021 11:37:46 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::3a) by DM6PR03CA0054.outlook.office365.com
 (2603:10b6:5:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 11:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.87)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.87 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.87; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.87) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 11:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYU6cPy0hOs8KKzjNydBe1UctkOrJwKWSZHLebb9il0pNnWM348M/16oEUP1oWyqJ5eM5pGFbBSZCxhjeInrUunpMePjreplxmt88HZx3X0CJS9XLQbW6QRW9jT2gDW6Dqx4FPiTo92WBfV0TWkT6tI4WNaEicFdxvpsf5o81ExdB7zLmtD6QAOrn6SXlwRBxyRH6ce902TGstDcBvHL2wwMWMrYFDuZsxrrlbR+sOXN6dYK4EvcZ9+YkqhOuE2I9aWlaW3mvcvOCHR8jcpXbeU8M5b/WSGj3nYmntotDrm+RKhUlPoA0rMSScFH+up1dtNNWDLk1K+k7bmYjNP1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhRZF816/Iyu6J3jXfLdiqWy07ot3lhxsnpyMi7NfZk=;
 b=is5JlBaJ6BTCqcmBVyAAU6V3eCDef5A11MPzBUaSPyz17m1Uz5sMsbMFir2a/DW7JQ4SkgADvNW5MP946zKlm3PAnYiSFXDpoVlWMf9qxDTImxBAErIe2G2GLJ0GkY+FoXNpCDSb0RUHO2CFUJVPvN03op6VMKZMC4wSpNAj+OpU+V3ZUsrxavcxcF+5ymuk7QjeAtTw8TVKoj9DSpj+tYVaNttAltG/AIPXO7BhDhUfyrKIRsBaRg0GyqXK2VCcD97RSn+hCNtSwn/YyWQqyZWUngd96CQgDMnuSDXvITpHASuyWmM6cj3KX3LBIlalNz14X/UG2lBlIi+KOIQZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB5129.namprd08.prod.outlook.com (2603:10b6:5:43::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 11:37:43 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:37:43 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9uIGFib3V0IElQTUkg?=
 =?big5?Q?SDR?=
Thread-Topic: [phosphor-host-ipmid] Question about IPMI SDR
Thread-Index: AQHX1FMVcHHdqMI4+UCvhvFgn3/gJqv5es8P
Date: Mon, 8 Nov 2021 11:37:43 +0000
Message-ID: <DM6PR08MB5514160535BE1676DBC179E0DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB551412A7CBCEDFAA6D76C495DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB551412A7CBCEDFAA6D76C495DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3ae020a8-a048-7279-164c-d554e0f644d0
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a09bd83-3edd-415f-30b1-08d9a2ac2ef5
x-ms-traffictypediagnostic: DM6PR08MB5129:|SN4PR0801MB3806:
X-Microsoft-Antispam-PRVS: <SN4PR0801MB3806854806D32E91F331D7E6DC919@SN4PR0801MB3806.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6mItHQPW3rh+X1lNCS4I+gXWErhfmf4xnaqF96Y6Gy8YPS3L/zNwFQMRoY4AKnsQEACA3h8rNSzyv1zogN7mTazPHIqEfsuqtY9UqJ1DXaYmL5m99vFSYpYyB4WqyU9q9c3fmKcgw81xW7mNgjYn4t/OxiLPqGD9NYKgzKuFgb+LWYJeEllpdFb333BryhwItOXJ7zzuop4Jlgy7sjBYJPenQABqGfYDsVzDDWs4JM9MxFAXn4DQfPCkR4lnc34GDSBO10aZsuchD5sioHrOHnFK2l3pWbL3SMZxdwx1Y0B6809IvHmhPlXbdFbd/WJxIxsAPruU02iiT5NElhOIDf5N2RFNA+GgAE4SbjcErmWkgD+v8eslCfN//gTckXrtLIkoQmXXWhEfNmwio8JtaWxFKkVTFKjVBnyBYYnSdywE/cIG9qU+Kr7wLL5eDEwKll07Q1cMVMPZTURbH00j487PNKzQ5SzAE4dFYWmZ3k8rI2Y3h8KHrHmM57L+OlD7AJVqJDAvKOEVFf7vVpog37PbSDroGwu+FS63rHM/9CPzAzzOPtgK/tH+SHikORPG+2Rtuu+/n5p9X1OLAF4DeirfyiPNEEnaaOf4RnVMdsljNLKRePX0XUYhbWB2wYlht9K63Hu0aGXuK3CujLqpqgc8Rr/igZ7ehCHMnSkZrBxWKLfT10OfEc2NkM1HJOVgg+kHNjRP3RjJQ2CyA0A1xQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(7696005)(224303003)(122000001)(64756008)(2906002)(186003)(19627405001)(83380400001)(9686003)(71200400001)(6506007)(8936002)(6916009)(38100700002)(2940100002)(55016002)(52536014)(508600001)(66946007)(91956017)(76116006)(66556008)(38070700005)(5660300002)(33656002)(66476007)(316002)(86362001)(66446008);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514160535BE1676DBC179E0DC919DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5129
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f9c430fc-740d-4692-d97f-08d9a2ac2d8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYCDcagGLUmknTE+X1a8o8ZVhMF+keQyY8FXvc8cPXr61+1wdVNwj0A6sxwUuMmWBjeUUx4ENY9ec5JAe32AEilNGgPYGuuIAytqioXhj/txPURDZzW2wVXIzQT/CcPD4+EjtnZWnFkVjFHloGYfGVwGOht1SiLEjTElwK2zDPOuhISR/BJOCKQNQEqCVpDWfNgw41A3arKMG8XeKDq9q8tnfkImX+Me6HrjSt5V3os4PsmlAtk+xETVDR9DkC9pMpOzb6791LDACkaJ5QUavSj0xcLhuEumhr/diqGQPyMTB8UuPlOFUJ1LX6eN4dqb78n7pl5WEYnyuEeKxtN0kUrEdwywZ0IxrVW6rq1hRB4rUUuI1cPm9N/7qDSglqIU288ks5y2x08r/nhIFKfLUb7SJCTzc284hFo4zQ1J5LTtEUAzmupb1CTchZO+ortK5fJnW++VUOayaFRQOg1eBcmzsFLFODXbbxDbuJ1oeBMIN6wtM24QYJP9+Bx1Kv+FThkkZptc54MWCc6iirXiLNYh1NhEJRKBEukT939AQQ2db7USJ9Be19kHhffPhDqdciqFnSiyZS+O192YWBEa+0tpAbbt71IS4YoD5ZI5pnFUrSLLBeyCD3NNiZXw1YQ4XYfRePSuGtCNh6T6yxwTu0hjBkjyGPL2Nbh+vzkV9pQ9Hjjevak4tUQQ3V8RmQnqp5cs7SiMtxmvUGhjiwBHGoOGOM8Vd/6OIydJ+6VUwa4=
X-Forefront-Antispam-Report: CIP:144.49.247.87; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(356005)(224303003)(47076005)(36860700001)(86362001)(55016002)(336012)(83380400001)(81166007)(33656002)(2940100002)(6916009)(70586007)(9686003)(316002)(19627405001)(6506007)(7696005)(5660300002)(8936002)(2906002)(52536014)(4186021)(508600001)(186003)(26005)(70206006)(82310400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:37:45.2792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a09bd83-3edd-415f-30b1-08d9a2ac2ef5
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.87];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB3806
X-Proofpoint-ORIG-GUID: Fi7KgovfPljiwHHMEhdiaRRd9R7yRsh9
X-Proofpoint-GUID: Fi7KgovfPljiwHHMEhdiaRRd9R7yRsh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080073
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

--_000_DM6PR08MB5514160535BE1676DBC179E0DC919DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJIHRoaW5rIEkgZmlndXJlZCBvdXQgdGhlIGVycm9yIG1lc3NhZ2UgaXMgZHVl
IHRvIHRoZSBwaG9zcGhvci1oZWFsdGgtbW9uaXRvciBwYWNrYWdlLiBUaGUgcGhvc3Bob3ItaGVh
bHRoLW1vbml0b3IgZG9lc24ndCBoYXZlIHRoZSBpbnRlcmZhY2Ugb2Ygb3JnLmZyZWVkZXNrdG9w
LkRCdXMuT2JqZWN0TWFuYWdlciBhbmQgd2l0aCB0aGUgR2V0TWFuYWdlZE9iamVjdHMgbWV0aG9k
IGNhbGwsIHNvIHRoZSBnZXRTZW5zb3JNYXAoKSBpbiB0aGUgaW50ZWwtaXBtaS1vZW0gd291bGQg
YmUgZmFpbGVkLg0KDQo9PT09PQ0Kcm9vdEBodWRzb25iYXktb2JtYzp+IyBidXNjdGwgaW50cm9z
cGVjdCB4eXoub3BlbmJtY19wcm9qZWN0LkhlYWx0aE1vbiAvDQpOQU1FICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBUWVBFICAgICAgU0lHTkFUVVJFIFJFU1VMVC9WQUxVRSBGTEFHUw0K
b3JnLmZyZWVkZXNrdG9wLkRCdXMuSW50cm9zcGVjdGFibGUgaW50ZXJmYWNlIC0gICAgICAgICAt
ICAgICAgICAgICAgLQ0KLkludHJvc3BlY3QgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9k
ICAgIC0gICAgICAgICBzICAgICAgICAgICAgLQ0Kb3JnLmZyZWVkZXNrdG9wLkRCdXMuUGVlciAg
ICAgICAgICAgaW50ZXJmYWNlIC0gICAgICAgICAtICAgICAgICAgICAgLQ0KLkdldE1hY2hpbmVJ
ZCAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIC0gICAgICAgICBzICAgICAgICAgICAg
LQ0KLlBpbmcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIC0gICAgICAg
ICAtICAgICAgICAgICAgLQ0Kb3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJvcGVydGllcyAgICAgaW50
ZXJmYWNlIC0gICAgICAgICAtICAgICAgICAgICAgLQ0KLkdldCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWV0aG9kICAgIHNzICAgICAgICB2ICAgICAgICAgICAgLQ0KLkdldEFsbCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIHMgICAgICAgICBhe3N2fSAgICAg
ICAgLQ0KLlNldCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIHNzdiAg
ICAgICAtICAgICAgICAgICAgLQ0KLlByb3BlcnRpZXNDaGFuZ2VkICAgICAgICAgICAgICAgICAg
c2lnbmFsICAgIHNhe3N2fWFzICAtICAgICAgICAgICAgLQ0KPT09PT0NCg0KQXMgSSBrbm93LCB0
aGUgcGhvc3Bob3ItaGVhbHRoLW1vbml0b3IgaXMgYSBwYXJ0IG9mIHRoZSBiYXNlIHBob3NwaG9y
IHBhY2thZ2UuIEJ1dCB0aGVyZSBhcmUgc29tZSBxdWVzdGlvbnMgaW4gbXkgbWluZCBzdGlsbCBh
bmQgd291bGQgbGlrZSB0byBnZXQgaGVscCBoZXJlLg0KDQogIDEuDQppcyBpdCBvbmx5IGZvciBt
b25pdG9yaW5nIENQVSBhbmQgbWVtb3J5IHNlbnNvciB2YWx1ZXM/ICBpdCBsb29rcyBsaWtlIHRo
ZXJlIGlzIG5vIGV4cGxhbmF0aW9uIG9mIGl0IGlzIGluIHRoZSBwaG9zcGhvci1oZWFsdGgtbW9u
aXRvciByZXBvLg0KICAyLg0KY2FuIEkgcmVtb3ZlIGl0PyBJZiB5ZXMsIHdpbGwgSSBtaXNzIGFu
eSBmZWF0dXJlcz8NCg0KVGhhbmtzDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQqxSKXzqsw6IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cytjaHJpcy5jaGVuMz1mbGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiClTqrtIENocmlzIENoZW4g
KFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPg0KsUil86TptME6IDIwMjGmfjExpOs4pOkgpFWk
yCAxMjowMQ0Kpqyl86rMOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZz4NCqVEpq46IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlvbiBhYm91dCBJ
UE1JIFNEUg0KDQpIaSBhbGwsDQoNCldlIGhhdmUgYWRkZWQgMyB0ZW1wIHNlbnNvcnMgYnkgdXNp
bmcgZW50aXR5LW1hbmFnZXIsIGFuZCBsb29rcyBsaWtlIHdlIGNhbiBsaXN0IHRoZW0gd2l0aCB0
ZW1wIHZhbHVlIHJlYWRpbmcgc3VjY2Vzc2Z1bGx5IGFzIGJlbG93Lg0KPT09PT0NCnJvb3RAaHVk
c29uYmF5LW9ibWM6fiMgaXBtaXRvb2wgc2RyIGVsaXN0DQpCTUMgICAgICAgICAgICAgIHwgMDBo
IHwgb2sgIHwgIDcuMSB8IDI3IGRlZ3JlZXMgQw0KRElNTSBQMCBBQkNEIFAxICB8IDAxaCB8IG9r
ICB8ICA3LjEgfCAzNSBkZWdyZWVzIEMNCkRJTU0gUDEgRUZHSCAgICAgfCAwMmggfCB1Y3IgfCAg
Ny4xIHwgNDAgZGVncmVlcyBDDQpHZXQgU0RSIDAwMDMgY29tbWFuZCBmYWlsZWQ6IEludmFsaWQg
ZGF0YSBmaWVsZCBpbiByZXF1ZXN0DQpHZXQgU0RSIDAwMDMgY29tbWFuZCBmYWlsZWQ6IEludmFs
aWQgZGF0YSBmaWVsZCBpbiByZXF1ZXN0DQpHZXQgU0RSIDAwMDMgY29tbWFuZCBmYWlsZWQ6IElu
dmFsaWQgZGF0YSBmaWVsZCBpbiByZXF1ZXN0DQpHZXQgU0RSIDAwMDMgY29tbWFuZCBmYWlsZWQ6
IEludmFsaWQgZGF0YSBmaWVsZCBpbiByZXF1ZXN0DQpHZXQgU0RSIDAwMDMgY29tbWFuZCBmYWls
ZWQ6IEludmFsaWQgZGF0YSBmaWVsZCBpbiByZXF1ZXN0DQpyb290QGh1ZHNvbmJheS1vYm1jOn4j
DQo9PT09PQ0KDQpIb3dldmVyLCB0aGVyZSBpcyBhIGtpbmQgb2YgZXJyb3IgbWVzc2FnZSAiR2V0
IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlkIGRhdGEgZmllbGQgaW4gcmVxdWVzdCIg
YWx3YXlzIGJlZW4gc2hvd24gYmVoaW5kIGl0LiBJIHRha2UgYSBsb29rIGF0IGl0IHZpYSBqb3Vy
bmFsIGxvZyBpbiBPcGVuQk1DIHdoYXQgZXJyb3IgaXQgaXMuIFRoYXQgaXM6DQo9PT09PQ0KSmFu
IDAxIDAwOjAxOjI0IGh1ZHNvbmJheS1vYm1jIGlwbWlkWzE1N106IEdldE1hbmdhZ2VkT2JqZWN0
cyBmb3IgZ2V0U2Vuc29yTWFwIGZhaWxlZA0KSmFuIDAxIDAwOjAxOjI0IGh1ZHNvbmJheS1vYm1j
IGlwbWlkWzE1N106IGdldFNlbnNvckRhdGFSZWNvcmQ6IGdldFNlbnNvck1hcCBlcnJvcg0KSmFu
IDAxIDAwOjAxOjI0IGh1ZHNvbmJheS1vYm1jIGlwbWlkWzE1N106IGlwbWlTdG9yYWdlR2V0U0RS
OiBmYWlsIHRvIGdldCBTRFINCg0Kcm9vdEBodWRzb25iYXktb2JtYzp+IyBqb3VybmFsY3RsIC1v
IGpzb24tcHJldHR5IE1FU1NBR0U9IkdldE1hbmdhZ2VkT2JqZWN0cyBmb3IgZ2V0U2Vuc29yTWFw
IGZhaWxlZCINCnsNCiAgICAgICAgIl9CT09UX0lEIiA6ICJkOTMyYWI2NDkzNTk0M2MxYjkzNzk5
M2IzZDRjMDUxMCIsDQogICAgICAgICJfX1JFQUxUSU1FX1RJTUVTVEFNUCIgOiAiODQ5MDM5ODci
LA0KICAgICAgICAiX1NZU1RFTURfQ0dST1VQIiA6ICIvc3lzdGVtLnNsaWNlL3Bob3NwaG9yLWlw
bWktaG9zdC5zZXJ2aWNlIiwNCiAgICAgICAgIlBSSU9SSVRZIiA6ICIzIiwNCiAgICAgICAgIl9D
QVBfRUZGRUNUSVZFIiA6ICIxZmZmZmZmZmZmZiIsDQogICAgICAgICJDT0RFX0ZVTkMiIDogImhl
bHBlcl9sb2ciLA0KICAgICAgICAiX1NZU1RFTURfVU5JVCIgOiAicGhvc3Bob3ItaXBtaS1ob3N0
LnNlcnZpY2UiLA0KICAgICAgICAiX1NZU1RFTURfU0xJQ0UiIDogInN5c3RlbS5zbGljZSIsDQog
ICAgICAgICJfVUlEIiA6ICIwIiwNCiAgICAgICAgIl9IT1NUTkFNRSIgOiAiaHVkc29uYmF5LW9i
bWMiLA0KICAgICAgICAiTUVTU0FHRSIgOiAiR2V0TWFuZ2FnZWRPYmplY3RzIGZvciBnZXRTZW5z
b3JNYXAgZmFpbGVkIiwNCiAgICAgICAgIl9fTU9OT1RPTklDX1RJTUVTVEFNUCIgOiAiODQ5MDM5
OTIiLA0KICAgICAgICAiX01BQ0hJTkVfSUQiIDogIjNlNTVhNjkyODYyZTRhY2ZiZmVjMTk1NmRi
MGQwZWUwIiwNCiAgICAgICAgIl9TWVNURU1EX0lOVk9DQVRJT05fSUQiIDogIjIwZWViZmIzYTcw
MTQ1MmViZmMyMjYxMTdiMmNiYmU5IiwNCiAgICAgICAgIlNZU0xPR19JREVOVElGSUVSIiA6ICJp
cG1pZCIsDQogICAgICAgICJfVFJBTlNQT1JUIiA6ICJqb3VybmFsIiwNCiAgICAgICAgIkVSUk9S
IiA6ICJJbnZhbGlkIHJlcXVlc3QgZGVzY3JpcHRvciIsDQogICAgICAgICJfUElEIiA6ICIxNTci
LA0KICAgICAgICAiX19DVVJTT1IiIDogInM9MmQwZWViZjA2NWQyNGI3ZmJhNWEyNGE2NzBkMmZm
YmY7aT0zMGQ7Yj1kOTMyYWI2NDkzNTk0M2MxYjkzNzk5M2IzZDRjMDUxMDttPTUwZjg4Mzg7dD01
MGY4ODMzO3g9ZGVmYzIzYjg3YWY4ZTI5YiIsDQogICAgICAgICJUUkFOU0FDVElPTl9JRCIgOiAi
MzUyNDQ3MzY2OSIsDQogICAgICAgICJDT0RFX0xJTkUiIDogIjc2IiwNCiAgICAgICAgIkNPREVf
RklMRSIgOiAiL3Vzci9zcmMvZGVidWcvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdDk5OS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvaW5jbHVkZS9waG9zcGhvci1sb2dnaW5nL2xvZy5ocHAiLA0KICAgICAg
ICAiX1NPVVJDRV9SRUFMVElNRV9USU1FU1RBTVAiIDogIjg0OTAzOTUwIiwNCiAgICAgICAgIl9F
WEUiIDogIi91c3IvYmluL2lwbWlkIiwNCiAgICAgICAgIl9HSUQiIDogIjAiLA0KICAgICAgICAi
X0NPTU0iIDogImlwbWlkIiwNCiAgICAgICAgIl9DTURMSU5FIiA6ICJpcG1pZCINCn0NCj09PT09
DQoNCkkgaGF2ZSB0cmllZCB0byBmaWd1cmUgb3V0IGl0IGJ1dCB3aXRoIGxpbWl0ZWQgY2FwYWJp
bGl0eSwgY2FuIHNvbWVvbmUgaGVscCB0byBwcm92aWRlIHNvbWUgc3VnZ2VzdGlvbnMgZm9yIG1l
PyBJIG1lYW4gaG93IHRvIGZpeCBpdCwgb3IgSSdtIGFibGUgdG8gaWdub3JlIGl0IGJlY2F1c2Ug
dGhlIFNEUiBoYXMgYmVlbiBsaXN0ZWQ/DQoNClRoYW5rIHlvdS4NCg0KUmVnYXJkcywNCkNocmlz
IENoZW4NCkxlZ2FsIERpc2NsYWltZXIgOg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbC4NCkl0IGlzIGlu
dGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hv
bSBpdCBpcyBhZGRyZXNzZWQNCm9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9m
IHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwNCnlvdSBhcmUgb24g
bm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3Jt
LA0KaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNz
YWdlIGluIGVycm9yLA0KcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBvZiB0aGlzIG1lc3NhZ2UhDQo=

--_000_DM6PR08MB5514160535BE1676DBC179E0DC919DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think I figured out the error message is due to the phosphor-health-monit=
or package. The phosphor-health-monitor doesn't have the interface of org.f=
reedesktop.DBus.ObjectManager and with the GetManagedObjects method call, s=
o the getSensorMap() in the intel-ipmi-oem
 would be failed.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# busctl introspect xyz.openbmc_project.HealthMon /
<div>NAME &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TYPE &nbsp; &nbsp; &nbsp;SIGN=
ATURE RESULT/VALUE FLAGS</div>
<div>org.freedesktop.DBus.Introspectable interface - &nbsp; &nbsp; &nbsp; &=
nbsp; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>.Introspect &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; method &nbsp; &nbsp;- &nbsp; &nbsp; &nbsp; &nbsp;=
 s &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>org.freedesktop.DBus.Peer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interface=
 - &nbsp; &nbsp; &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-=
</div>
<div>.GetMachineId &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; method &nbsp; &nbsp;- &nbsp; &nbsp; &nbsp; &nbsp; s &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>.Ping &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; method &nbsp; &nbsp;- &nbsp; &nbsp=
; &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>org.freedesktop.DBus.Properties &nbsp; &nbsp; interface - &nbsp; &nbsp=
; &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>.Get &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;method &nbsp; &nbsp;ss &nbsp;=
 &nbsp; &nbsp; &nbsp;v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>.GetAll &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; method &nbsp; &nbsp;s &nbsp; &nbsp; &nb=
sp; &nbsp; a{sv} &nbsp; &nbsp; &nbsp; &nbsp;-</div>
<div>.Set &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;method &nbsp; &nbsp;ssv &nbsp=
; &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-</div>
.PropertiesChanged &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;signal &nbsp; &nbsp;sa{sv}as &nbsp;- &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;-<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As I know, the phosphor-health-monitor is a part of the base phosphor packa=
ge. But there are some questions in my mind still and would like to get hel=
p here.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li><span></span>
<div>is it only for monitoring CPU and memory sensor values? &nbsp;it looks=
 like there is no explanation of it is in the phosphor-health-monitor repo.=
</div>
</li><li>
<div>can I remove it? If yes, will I miss any features?</div>
</li></ol>
<div>Thanks</div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
<div><br>
</div>
</div>
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED C=
hris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~11=A4=EB8=A4=E9 =A4U=A4=C8 12:01<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=A5D=A6=AE:</b> [phosphor-host-ipmid] Question about IPMI SDR</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi all,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
We have added 3 temp sensors by using entity-manager, and looks like we can=
 list them with temp value reading successfully as below.&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
root@hudsonbay-obmc:~# ipmitool sdr elist
<div>BMC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 00h | ok &nbsp;|=
 &nbsp;7.1 | 27 degrees C</div>
<div>DIMM P0 ABCD P1 &nbsp;| 01h | ok &nbsp;| &nbsp;7.1 | 35 degrees C</div=
>
<div>DIMM P1 EFGH &nbsp; &nbsp; | 02h | ucr | &nbsp;7.1 | 40 degrees C</div=
>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
root@hudsonbay-obmc:~#<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"margin:0px; font-size:12pt">=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
However, there is a kind of error message &quot;Get SDR 0003 command failed=
: Invalid data field in request&quot; always been shown behind it. I take a=
 look at it via journal log in OpenBMC what error it is. That is:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: GetMangagedObjects for getSensor=
Map failed
<div>Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: getSensorDataRecord: getSen=
sorMap error</div>
Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: ipmiStorageGetSDR: fail to get S=
DR<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
root@hudsonbay-obmc:~# journalctl -o json-pretty MESSAGE=3D&quot;GetMangage=
dObjects for getSensorMap failed&quot;
<div>{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_BOOT_ID&quot; : &quot;d932ab6493594=
3c1b937993b3d4c0510&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__REALTIME_TIMESTAMP&quot; : &quot;8=
4903987&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_CGROUP&quot; : &quot;/syste=
m.slice/phosphor-ipmi-host.service&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;PRIORITY&quot; : &quot;3&quot;,</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_CAP_EFFECTIVE&quot; : &quot;1ffffff=
ffff&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_FUNC&quot; : &quot;helper_log&q=
uot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_UNIT&quot; : &quot;phosphor=
-ipmi-host.service&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_SLICE&quot; : &quot;system.=
slice&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_UID&quot; : &quot;0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_HOSTNAME&quot; : &quot;hudsonbay-ob=
mc&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;MESSAGE&quot; : &quot;GetMangagedObj=
ects for getSensorMap failed&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__MONOTONIC_TIMESTAMP&quot; : &quot;=
84903992&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_MACHINE_ID&quot; : &quot;3e55a69286=
2e4acfbfec1956db0d0ee0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_INVOCATION_ID&quot; : &quot=
;20eebfb3a701452ebfc226117b2cbbe9&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;SYSLOG_IDENTIFIER&quot; : &quot;ipmi=
d&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_TRANSPORT&quot; : &quot;journal&quo=
t;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;ERROR&quot; : &quot;Invalid request =
descriptor&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_PID&quot; : &quot;157&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__CURSOR&quot; : &quot;s=3D2d0eebf06=
5d24b7fba5a24a670d2ffbf;i=3D30d;b=3Dd932ab64935943c1b937993b3d4c0510;m=3D50=
f8838;t=3D50f8833;x=3Ddefc23b87af8e29b&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;TRANSACTION_ID&quot; : &quot;3524473=
669&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_LINE&quot; : &quot;76&quot;,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_FILE&quot; : &quot;/usr/src/deb=
ug/intel-ipmi-oem/0.1+git999-r0/recipe-sysroot/usr/include/phosphor-logging=
/log.hpp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SOURCE_REALTIME_TIMESTAMP&quot; : &=
quot;84903950&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_EXE&quot; : &quot;/usr/bin/ipmid&qu=
ot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_GID&quot; : &quot;0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_COMM&quot; : &quot;ipmid&quot;,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_CMDLINE&quot; : &quot;ipmid&quot;</=
div>
}<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I have tried to figure out it but with limited capability, can someone help=
 to provide some suggestions for me? I mean how to fix it, or I'm able to i=
gnore it because the SDR has been listed?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thank you.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chris Chen</div>
<div>Legal Disclaimer :<br>
The information contained in this message may be privileged and confidentia=
l. <br>
It is intended to be read only by the individual or entity to whom it is ad=
dressed
<br>
or by their designee. If the reader of this message is not the intended rec=
ipient,
<br>
you are on notice that any distribution of this message, in any form, <br>
is strictly prohibited. If you have received this message in error, <br>
please immediately notify the sender and delete or destroy any copy of this=
 message!<br>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB5514160535BE1676DBC179E0DC919DM6PR08MB5514namp_--
