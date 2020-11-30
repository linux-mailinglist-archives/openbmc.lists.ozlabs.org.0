Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A90212C8BCF
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 18:56:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClCbJ49FTzDqd1
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 04:56:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0603b952ba=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=ard+3++n; dkim-atps=neutral
X-Greylist: delayed 1290 seconds by postgrey-1.36 at bilbo;
 Tue, 01 Dec 2020 04:55:34 AEDT
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClCZG21CPzDqZC
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 04:55:32 +1100 (AEDT)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUHR1Yq019381; Mon, 30 Nov 2020 17:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=h/HHEc9UEQi9z8bDZ+qDKk5COrrtGTK41uxo+8eKHTQ=;
 b=ard+3++neeirUaayCLi0vW0ZTTyf9QO8Ea+24PaQmN6cnAgF5JiAxClAFD5RtNO3wE17
 nqFgLHYk46s+HJ+d2VQ5JXDWw5aSXFKV1N3e//enkWAVX7IsPX4yIxjsKA4Gu0ZBqJXz
 w1bmLn1EYJQs3J1MD8egkIArEWIIRSC/ZKCmvVe5iWJZZdmxaXqWP0D6gl+ze+VFnOF/
 pLF/cMXmwGAOtsUvRpBmyWpI4Datd0kA9QlQFpXE2IiREcEytUM34rZtb1ebsbhh4jq9
 oyW410VHjEPTgj16xPDkuMYCgmjxFBMYg7t/04s3feVB0Jay5hSaedqdyagcm9ZrxvmP Mw== 
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 354096b3n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 17:33:59 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2353.austin.hpe.com (Postfix) with ESMTPS id 8673082;
 Mon, 30 Nov 2020 17:33:58 +0000 (UTC)
Received: from G9W9209.americas.hpqcorp.net (16.220.66.156) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 30 Nov 2020 17:33:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.13) by
 G9W9209.americas.hpqcorp.net (16.220.66.156) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 30 Nov 2020 17:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4CSizH97HlrFfvpV5BXWOtkJz/J37mjdOtdiPtGoFAX6oTinV3yt0Uvo4Ll6Hjneqq9Zhf7Ois9QKCOXxHc4OncCMP4aHEkJTHh64YPGSKwJNH4dcGYehKp8e0QQk62+mtRcolsWxqiWqFPgkJuBrEhyKl//572KxzXm2A44USYkaJtG4/nHeMgJ5aCyKtLZPxzYEXgeXxdBHb4xEZDXW2xjkeZU8yYXKCL/e14KqB/7IAbQxlYJdg6bi4/GAN3b6teyAR14uVoykUx5C8XV3o+YgAqDgazpnxryAwYsJr+YO50IcVUz7rXdVTYfrcpFH2kztFSkpl5MPa2ucZBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/HHEc9UEQi9z8bDZ+qDKk5COrrtGTK41uxo+8eKHTQ=;
 b=GYjx1wAqnvLEkSl1pgoeanUNgDMohPSbHkuw7tmnT4ihyLbZweGR1BlWlS4J+XY6hx7kFUQ7GC/2WtowUgNbmnGUYogoTSh8fRmI0jYixyuZlZ/z8IlJLUwUranWVu4CD9ys+3o/8RX/N/CT+sgDhg/CNjt4PuRyB6RXbDryNk9NNsU0fxnE+K0pnl1RBiwKngXVd6nQjeatpzn53hQk0CAZMHl6+o5INQZYj+SmW0HqG5z+gL2+bZ3f0J7amfPCCoMElWr8R+CejD+Slc2sgkMU9fiO+zHXS69s48W5ohBOH9XeU7GtPgnLEhwPgQCuZfXBE3T+6qajKbzgUptj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7421::16) by AT5PR8401MB0370.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:741d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 17:33:46 +0000
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::74d5:f2f:a026:1a5d]) by AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::74d5:f2f:a026:1a5d%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 17:33:45 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>,
 "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
Subject: sync meta-hpe
Thread-Topic: sync meta-hpe
Thread-Index: AdbHPsiok08wA3/oSM6x3I2v8znLRA==
Date: Mon, 30 Nov 2020 17:33:45 +0000
Message-ID: <AT5PR8401MB0626829664E197404ABEEE5F8FF50@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.216.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af2a0d2f-e7fb-44e9-4a22-08d895561712
x-ms-traffictypediagnostic: AT5PR8401MB0370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB03706B79878F185AC29DE4128FF50@AT5PR8401MB0370.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LY8gf1FTJGjnmYLwNZHZDhN7gN/mhlN98Wmm0oJgo38GsemPJFfo0K5YntrNOzZHGOZb9chOoLM1vYOgo7WTKvx09xbXVqy5f5sfGIcx+dknG48b9m6rZcc4XOH2nV7b/l0tNt9zKcz4rY5h5AiRBbXvHUXvJraf0bN55OCQHUhjk/dxdKXakmVbSujvzv/G4gp50Z6+a2o+Iz2mb2ri+ifbb6jgUE48O1UzaEXlfs1RxSLXwQpRslq2cK/L/Roa64DqYEpnpuK/9bjgJwE1w21Huo3CTUxzisswO/gGi1qnQKTN6747fjf9ZnedAE0tkKB1ZLXLLYruOfw9Pk2VnKoMSkDo+eu3aUyNrY0D4CGXZRvuRLWmI+CQcBp1gCkK+fibG7k1dV+mpV5e6ttiBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(136003)(366004)(376002)(76116006)(5660300002)(64756008)(9686003)(55016002)(66446008)(3480700007)(66556008)(86362001)(7696005)(558084003)(8676002)(110136005)(66946007)(33656002)(26005)(6506007)(2906002)(316002)(186003)(8936002)(71200400001)(83380400001)(66476007)(52536014)(966005)(55236004)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NmNnVzEvODl3N0lBRUowUXJiVVMveGJkR1dCM3RYTlNIdGluanh3OUNFQURE?=
 =?utf-8?B?b01WVDlkQlVJWWl4aU5Jekp1cE9iczlZbElaNzdlSmk5cFJIekNjMWUyQ2Jj?=
 =?utf-8?B?cTAzOGY1U0JaVHpRbzRzTitLQk14TzNVbXhJcDc5YTQ2cjRzWmY2TytET3pB?=
 =?utf-8?B?Unpud3llVVV6SDBoN0J1Zm5ITnpUSTBRN0tiWXFZdXVRQVlwYkRaK1dHc3Fh?=
 =?utf-8?B?NWE1VHdycEJaaWo4dGdXZkJTcW9ZazBCZHc0WGZ2NENxbmdBeVFQVGJzQWpV?=
 =?utf-8?B?a1Q0Y0hRYmMxZ21iV2F3S3NDNlg4Zm9vRnJpM3E0WmYwK2VxVDhkTWFRK285?=
 =?utf-8?B?SDk3TDVSdUhGNUJGbkhuTHRXNlF2c1NrTkZacnpTOXQ5dDJmai8xNDRQVWVh?=
 =?utf-8?B?UStMSXo1ejB2UnFxWGNnTm13U1dmN2REV0dYWXlJOFNmNW82ZWtLRHBGR1ZP?=
 =?utf-8?B?Q2dNQ3JIKzlENDZFVkVxaUZaUElTUzdIMXozMXR1LzBqamx0L2hoZHBLd3Nk?=
 =?utf-8?B?b2tVc2ZkMHRPVm1pMFFSaG53eENsV2FZaXJLYVhGeERjckg4L3ozZEp6dmsz?=
 =?utf-8?B?Q2I1c3BvQVZ4RDcwbzlBRkxhTXpPV3FXdEFCck9TN01SUGZuZ1Rsc3RIVWZR?=
 =?utf-8?B?ajFSVFNKS3Byc0RlSUw2UG9ieG5BQjRZMmcrbzhPRGVJVGd0bjlMMjFFdE5B?=
 =?utf-8?B?dlgwYndPV2lTM1VqazVJZE1YckdIbjZpdjBUZjI3bkhneTZYZFFnZFp5QTlx?=
 =?utf-8?B?R1ErbkszaFg2QzVtUDIzUHJCU2o2SlRadjRqL3k2cC90NExvdFVsclpHL1JZ?=
 =?utf-8?B?Z3c0MnhFdWtwQ3hQM3hST3F0TjRvUDd5MnVDZiszQVY0SDMvMWE4RE9hOEps?=
 =?utf-8?B?ck90aG5BM0hLL1FKN0ZZc245dVFsSVZWSnlGUTNxV0J1aXd1a0t6V1BCZm4v?=
 =?utf-8?B?ODc0WThBUTBSNkJUSlhYcWFuYWFISFpxaEFTbGN0ZVZKYXBQQjhTRUxob2Nr?=
 =?utf-8?B?QXhZdGdqSmlRM3lxUHRBL3ZWTU0xUTJ4UGVETFhxRXhGUWhsL05JQU1qYlp4?=
 =?utf-8?B?YjdXdndqZnp2N1oyVFRDWWJBNmxTbjU0MHJad1F5aURiaFBYQ0MwR2RSb3p4?=
 =?utf-8?B?eFJFa0NUQk1jemlSTmZTVEZBS3VxQ0M3SERNbXM5YVdXVDFnS3M0dU1pVlhV?=
 =?utf-8?B?dDFpS1E2cmdzSFRNd3NGTm5FRmxWTGhaNUc0Y1QrcE9uU3NEc0pxUEZrSWU1?=
 =?utf-8?B?aU8yWWRoTmQrOWRyNVBxZTJoc3l4WUhFL1N3Nm5tSU5pSThwWUhhSUV4TG9z?=
 =?utf-8?Q?2sHA41AbqSJNHiMiygIicUUwofKEqXkkwd?=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af2a0d2f-e7fb-44e9-4a22-08d895561712
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 17:33:45.8726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zD6YPTzDRZ1LfDnqJBRxr+SvMMORtsfmRQfpZ7pD+JTb9AkutnV+Hc9xS+zfh0vHOd261fe+tbx5k9ixCLwymQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0370
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_06:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=550 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300113
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

SGkgUGF0cmljayAtIGFmdGVyIHRoaXMgY2hhbmdlIHdhcyBtZXJnZWQgaHR0cHM6Ly9nZXJyaXQu
b3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvbWV0YS1ocGUvKy8zODQ2NCBJIGRvbid0IHNl
ZSB0aG9zZSBjaGFuZ2VzIGluIHRvcCBvZiB0cmVlLiAgSXMgdGhpcyBzeW5jIG5vcm1hbGx5IGF1
dG9tYXRpYyBidXQgY3VycmVudCBkaXNhYmxlZCBvciBkbyB3ZSBuZWVkIHRvIHJlcXVlc3QgaXQg
ZWFjaCB0aW1lPw0KDQpUaGFua3MsDQoNCk1pa2UNCg==
