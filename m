Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FACC4021AE
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 02:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3RC12Rs6z2xXS
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 10:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=Q3C43nRw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38843d7cda=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=Q3C43nRw; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3RBS6tjjz2xXs
 for <openbmc@lists.ozlabs.org>; Tue,  7 Sep 2021 10:35:28 +1000 (AEST)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1870Vvf3015682; Tue, 7 Sep 2021 00:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=9J7Bcq2NR1JYBPzpNRH4PljKLNbHbNmV0oU08vlOaMI=;
 b=Q3C43nRwZ/jCYNw0w7ctYtw3LM9LQN/oe0ykaHijGKd4N5bW/LxikVkpOKms1bddnDC/
 6L5eimuOJrlU2gSfvbRnOLuyvtoSHEAMd/y0gnv1Q3F1PNYCetwGINLffX/xOs/CFXhz
 ALF3kTc0dHRNR4rwO2LKBDE0IAeQCnrspj4IDg2xunhX/QhrzluqOE3XV7w3Ej4bn8Zw
 T0A3d1lY/wEi7PGGkqaaRPAg7sRIyfQ6ofUtbAgXtL932wID+Y4DCMZfsu3kajZzX7pZ
 epSpLVFp8p7X55NjGfL3MACClZcJlyIPdV3f5omCu7bGgTGSr+uvxM2HC9cxTo1FZTMr ew== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by mx08-002d6701.pphosted.com with ESMTP id 3aw90tw27d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 00:35:24 +0000
Received: from BN6PR17CA0054.namprd17.prod.outlook.com (2603:10b6:405:75::43)
 by DM6PR08MB4779.namprd08.prod.outlook.com (2603:10b6:5:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 7 Sep
 2021 00:35:21 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::a2) by BN6PR17CA0054.outlook.office365.com
 (2603:10b6:405:75::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 00:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.19)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.19 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.19; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.19) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 00:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRiGib37YhZ77eRUMlkYXB0AIiZ/x6w/XlBg1bbZ0JzCuXrhv77iXodXGQ/nwupnr0NufAFpOQxkw68BQpsXPD+QgEQu2Hx66fNGvyFOUs1VPEdgO+CY0JzH+dk6Udpvj+qC/PY3lRrlpC124N6Ci2l76r8tnN6urOnM1WJbpN0iO/QKps6T65HJ4IbusByVhfeLwM/38798gc+GrQBoF54KaNQQJcaMFsU7Ca0qGbbhh2yqR9CjbYQcO4gLbXop3pJRnVrP20M7sWJBTiNZazLH3NEC7prqktgxv2d123a34SWapa4I7QCVMuWD0DAnuhP8pTGCqdrN+pUYM4XIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9J7Bcq2NR1JYBPzpNRH4PljKLNbHbNmV0oU08vlOaMI=;
 b=kzXyZZzPeyvTKkDsDTEOpoJJx5Ax6EkMOpxYZVVN7zyD9FLwCQMLOF+uLcQtJqVHaVkvN1rKVwRSIHzD8EAZjxVguaqT+VGHCXwp2H+ZXdIMCdGJCZdjtR2/qjfqgvPvwd22O3XNY9B2Bl7HZN0jX3vqJKfeQ2iFLpo4xV81GoFYCB9DlPdIq/q21QJLBQ/sR8RqOwSEXGKLvd3JQy8HxeIKheKteyphDgQWw0yZsxVkhICxi7nkaZYLbA9mlTd3daKkIZB5L+hsTXCma5e6soUTB4GUjtImBaTCjBzX3+0PIIDO44Nww9E7uSeM9tBoVIh8qKFU3M2AhO2MRpZSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB2811.namprd08.prod.outlook.com (2603:10b6:3:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 00:35:19 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 00:35:19 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0Dogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91?=
 =?big5?Q?t_IPMI_(OEM)_command_development?=
Thread-Topic: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAAOsACAAO1eug==
Date: Tue, 7 Sep 2021 00:35:19 +0000
Message-ID: <DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <6605257f36d729f8e4c57387209cb0df1b4a1ffd.camel@yadro.com>
In-Reply-To: <6605257f36d729f8e4c57387209cb0df1b4a1ffd.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5cd822ba-1531-d1b8-38f2-c2be5f40c2b3
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc7e9f2-300d-4c47-57e6-08d971975ff0
x-ms-traffictypediagnostic: DM5PR08MB2811:|DM6PR08MB4779:
X-Microsoft-Antispam-PRVS: <DM6PR08MB4779AFC8B1EB3DC60EF47C10DCD39@DM6PR08MB4779.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Cwl8PwF3enWyXuUFqJPO6JLX8VBaa6g1chtIzMcQPbc3J0ScyiZkrflFkDFCej8UxbkK84K5autCx23vK6BJ/OD/j76wwrPAYqwn33M8lunvIfIIDghCRzhI2mP5fDfzVYmrZ6VmYtvdy2FbDZTYAy8H8CKihzuwRm2PRN11WXxB5Oxf5R0vMCRYoLNxvpLLRPjQEbIBmlha43tlWE7vWDeNA+lz0B5LKJqRbaNa+E7GZYyQ8Afa/kdQaB+7NSgSjo6ApB8DxKEuf93cM0GgRawSTJeMqSiM6Je3fZDKNYqWq8jhZ4FFdtupblAGJ/eHH7K4oJE2DmNQBsfgc3U6wd7TtDWV5sSPrEKPHDk1XjLp3mg5OqaDOTbOvCKxLtWsWqfLv8Or3Yw78G6uE9oJXeGQTXXDLhvvzg8w5gnPHheiGxjM6izDSsZwwxyQoDtnQfhL7U9qXlFaeyGGcy79sESDg1HFRzGOn6iAcGvSvEZYnHtwK/sJrIOrLbFOsgO7ny1sfy3t6xSS2D1EGqslqaIifrwF8DRiIxrLKychknqYtGT5ije9tbwg7ftBVLEP/dTskt2zFDIisr0sTSS0SejviUYChI8gUOJ3loHs0iGQLRYG6YxHfCy/pg4mRMbfCAY56kqVZwr+4BpuRRqs6nzimDLANZ94z2cwXV4xPd7ox0EECI+fPoysxe3PtKMcQtNfKThixrT22iXlVsCUEZafsp/S3430ZApFhELnMKlgu53fEHYvc6jMUS3y0ppXs7Ujnx4VaelwR/wLMZCTL70DsVLTTRxdpcDlnA7NKm/cXa6bN7ZtLImK/l2BOWNZbpJ0Q9n/tqLdH5sPZD0Td+gKZEHdtyBj/LakrV+qQQR5WzFLmZ8tYvypo+c/0C6TmtO4ZAgUSqiTszoigHfKlA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(38100700002)(86362001)(224303003)(186003)(166002)(64756008)(76116006)(83380400001)(55016002)(6506007)(66946007)(8936002)(122000001)(19627405001)(33656002)(9686003)(38070700005)(66446008)(7696005)(18265965003)(52536014)(66476007)(91956017)(66556008)(71200400001)(478600001)(316002)(5660300002)(2906002)(966005)(110136005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?ek1JbXBmczBzRlhEL2NZQVFEd3VzWlNNdnFmVHpWYUREVFlXcW16eDdaWlVQQTV2?=
 =?big5?B?RVhBQU5xNWppR0lMVWthc0t5VHlvV1llZlpGT09QSVNaajhTU0RYUEg2dmxBYlNQ?=
 =?big5?B?WmNqaCtlT1JqVFk2bE5OOFRGMTRhVDRZa2xLVzkxZjV5SUovYjNaMXNrYUg2VFZv?=
 =?big5?B?RUJXRUVwUWIyR1dia1Z6NzVZM0RBWGc2VEk5dzdXSWtpdFZwVjd1ay92UU1YNUFZ?=
 =?big5?B?TXllTU1zS05HK0JIMVQ3cWt5a1d2WkRhSmozN1NSOWNwRzF4TjRqb1lLenVnOWF4?=
 =?big5?B?ZzZlZEJmM1hqa0JIcFVqL3Z2MEM4OUh0M1hvdXlIQ1NId2kxYUw1cFhjTDJROGRV?=
 =?big5?B?dFBtWm1nY2xXODFYOGJpYUYvYUVMcjJVRDNmSHNzblV5WlRBajYrd21VdlZrYk93?=
 =?big5?B?ZzkxeThDQnp2d0lDRUsyMXJwYUwyNGJueVA4djYyUzdwMGhLNThHUEJMbTg0ZlR4?=
 =?big5?B?TVpyVzdJWFJOcEdhTW1MRitDLzM4bWJROGx3dlhsNWlUT3YvelpmQ2hkZlhWQ3Zj?=
 =?big5?B?QlAxVlRiUk5ZZGxSQkYvODFsTUVLbHNEQ3oxRDRUYUZ3N2FWT2IvSXE1MVdpcHFX?=
 =?big5?B?ODNCWnJtb0tpK3FBT24zc3FoVEtERlJXOUtvdzEvZC9wK2Rzb01EQVNGckxRMXA5?=
 =?big5?B?dndWejRMeU5HcFBvQUdaYTZndWpOUDhXWWR6K2VZYnhGQnFiUktjU090Y0N3VDVP?=
 =?big5?B?MFZoRGcvRm5IMG1keElWdzFmMnVXTnVLQzgyemxIcmZOdVpLSGttVjdUcEZ4Zzd6?=
 =?big5?B?UE9ndHpDZ2xpN3FqMFZzN0Y2V016bWVhZER5SlZZQXM1a3Z4dXZRNEVxZFh3Ykt2?=
 =?big5?B?S1lJSEIzbzIrMldFODVraXFDYjJEQWRpNFhmeHdMSmhIUUY4NHUvT3VmU2p2RXd0?=
 =?big5?B?emJzczg1ZHhVbnBWQW0waEQ3amtvTW5RZENSaU1PM3MyTS9lR1hhTkthTjZ3eEJi?=
 =?big5?B?Z0VJV0xRcUdWbzd0azE1c1BYUmVSVEhyTzRvV3MrWWJpcTlKZm9lc2M5bDBsUk03?=
 =?big5?B?bXhnNWY5VEVXcDRuelRnNm1ZVjJaQWg2eCs4c01wa1d5WWtpNFlzLzFDRXlSVUFW?=
 =?big5?B?bEVtZktuMWg3MmJvS1pNeU1OQ0Uzd2lkZmFzUE44V1A3Snk1V1dHM1hEWTBDeS9z?=
 =?big5?B?YVpTbWt2aVJEdzJyYUw4TFlLYUtEa01wV21TdVZwOVlkTlIrVnFUV1pJL2tPdjJr?=
 =?big5?B?RTlHVFVqV2ZMWi85M0JRUFFoR2Frb096UnlxRUVQTGNLUTljVDkrL1VBWGNPRVFI?=
 =?big5?B?UUxCV1VCRHllTEVxdyt0WnFLMmdmZ0tEZ0Rha1Z3L0s0MEdhNi9iNDJTYVBCekto?=
 =?big5?B?MVA5Z1dQRzhtOFczY0gzK3RGd2djVzVGd3F5YmhldTFRR1MyU1V1SmI3aVhkMkNP?=
 =?big5?B?bmhyS0NMS0RKRFRMait6QzBGcS9DVUE0R0RONkxxdFp0cnhEamYxVDlEZ0N2WCtP?=
 =?big5?B?cUlUMFpBVzdubFcwQzlMNmtEaDFRNERzS3J1RkNGN2ZiVkNTYVBJeTVZem11Sk11?=
 =?big5?B?R2lvOVM3ZFc3ejlZZWRBTGxuSWNFNjErVFRjZFZpY3lhWVZMYi9RYTRMaWgyMEFq?=
 =?big5?B?Nk52Tzh6UHM5S2hDS3dkU2VtRzFUV09paXdJaEgwZHpFSlVLZFpManl1Q0F3bGNO?=
 =?big5?B?L0xYS3pyOHF4dFQ3Ym50aUl5c1M3QjMvNWlOaTBOZ1RqYitESEVlaWtNYWJDMjZT?=
 =?big5?B?dXZyeWM5RE5hYldRRTBNUDNSUzA5c1M4ZmdkU211cUEyMitIRWkvYUlEMk1JTk1O?=
 =?big5?Q?tdp7P7LY39DJPBdx?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2811
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6803dffa-86dc-4b7c-26d2-08d971975ed0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwhIb4gD/rGoQI4brd2h0y9gubp6L1kYr422W7x2HM06XcxhYDX3XCpnu7vIqwh7YDo7iZ1ASDOOVU4LUyEjIoK3BPkPJMN/FiPhOshB8SsnsjeMJmufT1HV6pE0Btd5pjfS8uFv1mhb8wTVBd2XozC4n5w+QoQ5HtK9cEusiZRkREz+VJZvnNgRmKxglT/qBScDwudD8D/1wmKV+6IYBiPgTGWCC/AhKqImYmzxwpsDdNjBSilOch2X+kOvSJb9UJltIRjRSuzH1jHLySKNpjAr3OBbSUzZzcAF/9Tn2Z78hEWPO5xrJgqGoNSyGfuGV8A7N0va7oWh9Lmifz/0E6tuv/BNszNZsVb64zOV3535+qNzvAH9ipKblDHNSJXgH1YtPa/dao8kx+89tYH5HaTv01vH/A3xZwhiEIOOY6kz6owVLIMqsVeiKenkw7RNqEHjj0WCWds+t2zpoIalzo5dVZ2Lha+osO6x/rWupmR7lXyDBili/aSGweT8JH5DZ7kiknEqg27kMh/eERUm+Re9R4Dfy+SSeutS9WAaatSqtnDnPJ2kJuTZlrn8t+hIxGZznR8ECup12orIcg2oIyr2jq5ExZ6kofZCOqlPNKOKUDyWHR+4YAnuSBHNqqIHK5Y2eH7ts6qam+YFUwGL42Qv6H3FtsHhv+fR4cnpyMHSJjUc7KtJfaaGXdRvNVhv/lyeXAB87u9Iu32A0g4vsjiaEKoHUkm2TY05b3FPD7siBjR3+tJoQJOmNkc09NQSHFrcnZ6Dhcz/t7+KYllzIKB/XBSNVi3AKxzu7MDl1AlCzFFP7Xvo6IZbnrgUM2GDAFvOm4TjMsIDcXckBnLJJ8/GvMtGN7XG2Ii6zi2qwsckKYjbJ7sLyJrsimjEaDSFzTMzF2RGc6hXJPVpTOnTwM62uqASFVFEr3tNa1VP5Y0=
X-Forefront-Antispam-Report: CIP:144.49.247.19; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(5660300002)(7696005)(70206006)(478600001)(86362001)(4186021)(336012)(9686003)(18265965003)(70586007)(82740400003)(19627405001)(47076005)(966005)(26005)(6506007)(55016002)(186003)(356005)(8936002)(81166007)(83380400001)(166002)(110136005)(33656002)(36860700001)(82310400003)(2906002)(52536014)(316002)(224303003)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 00:35:21.0704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc7e9f2-300d-4c47-57e6-08d971975ff0
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.19];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4779
X-Proofpoint-GUID: mgLf0yYutreVjKFQYcLJ8T9OSHfMZhoh
X-Proofpoint-ORIG-GUID: mgLf0yYutreVjKFQYcLJ8T9OSHfMZhoh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_10:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070001
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

--_000_DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5yZHJlaSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHBmdWwgY29tbWVudHMuDQoNClJl
Z2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqx
SKXzqsw6IEFuZHJlaSBLYXJ0YXNoZXYgPGEua2FydGFzaGV2QHlhZHJvLmNvbT4NCrFIpfOk6bTB
OiAyMDIxpn45pOs2pOkgpFWkyCAwNjoxNQ0Kpqyl86rMOiBDaHJpcyBDaGVuIChUUEkpIDxDaHJp
cy5DaGVuM0BmbGV4LmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KpUSmrjogUmU6IKZewtA6IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVz
dGlvbnMgYWJvdXQgSVBNSSAoT0VNKSBjb21tYW5kIGRldmVsb3BtZW50DQoNCkhlbGxvLA0KDQpJ
IGRvbid0IHJlcHJlc2VudCBJbnRlbCwgYnV0IGhhdmUgc29tZSBjb25zaWRlcmF0aW9ucyBhYm91
dCB0aGlzIHRvcGljOg0KMSkgVHJ5IHRvIG5vdCByZXVzZSBpbnRlbC1pcG1pLW9lbS4gTXVjaCBi
ZXR0ZXIgc29sdXRpb24gd291bGQgYmUgdG8NCmNyZWF0ZSB5b3VyIG93biB4eHgtaXBtaS1vZW0g
cGFja2FnZSBhbmQgaW1wbGVtZW50IG9ubHkgbWV0aG9kcyB5b3UNCnJlYWxseSBuZWVkLg0KMikg
QmV0dGVyIHdheSB3b3VsZCBiZSB0byBpbXBsZW1lbnQgcmVxdWlyZWQgbG9naWMgaW4gcGhvc3Bo
b3ItaG9zdC0NCmlwbWlkIGFuZCBzdWJtaXQgY2hhbmdlcyB0aGVyZS4gSSBkaWRuJ3QgaW52ZXN0
aWdhdGUgdGhpcyB5ZXQgc2luY2Ugd2UNCmFsc28gcHVsbCBpbnRlbC1pcG1pLW9lbSB0byBvdXIg
cHJvamVjdCwgYnV0IEkgYmVsaWV2ZSwgaXQgc2hvdWxkIG5vdA0KYmUgdG9vIGRpZmZpY3VsdC4g
RG9uJ3QgcmVwZWF0IG91ciBtaXN0YWtlcyApLg0KMykgVGhlcmUgaXMgcHJpb3JpdHkgYXJndW1l
bnQgd2hpY2ggeW91IGNhbiB1c2UgdG8gZGV0ZXJtaW5lIGhhbmRsZXINCmNhbGwgb3JkZXIuDQo0
KSBNb3N0IGZ1bmN0aW9ucyB0aGVyZSBhcmUgc3BlY2lmaWMgZm9yIEludGVsIHNlcnZlcnMsIHNv
IHRoZSB1c2VsZXNzDQpldmVuIGlzIHlvdSB1c2UgSW50ZWwgQ1BVcyBidXQgeW91ciBvd24gcGxh
dGZvcm0uDQo1KSBVc2UgImpvdXJuYWxjdGwgLXQgaXBtaWQgLW8gcHJldHR5LWpzb24iIG9yIHNv
bWV0aGluZyBsaWtlIHRoaXMuIEJ1dA0Kbm93IGl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBuZXcg
c3ludGF4Og0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL3Bob3NwaG9yLWxvZ2dpbmcvYmxvYi9tYXN0ZXIvZG9jcy9zdHJ1Y3R1cmVkLWxvZ2dp
bmcubWRfXzshIUhTbnRsQ2chRzYxWGNWeFVyOEhsaThIcUlsZWJWWWppM3RUUFhzbjMzVzVveW8t
RmxVOGZibTZaZDY2UzBINmNzZXJ1NkJjdyQNCg0KDQpPbiBNb24sIDIwMjEtMDktMDYgYXQgMDk6
NDAgKzAwMDAsIENocmlzIENoZW4gKFRQSSkgd3JvdGU6DQo+IEhpIGFsbCwNCj4NCj4gSSBndWVz
cyB0aGlzIG1haWwgd2FzIGdvdCBvdmVyd2hlbG1lZCBieSBidW5jaGVzIG9mIGVtYWlscywgc28g
cGxlYXNlDQo+IGxldCBtZSByZXNlbmQgaXQgYW5kIGhvcGUgc29tZW9uZSBjb3VsZCBoZWxwIG1l
LiBBbm90aGVyLCBJIGFkZCBvbmUNCj4gbW9yZSBxdWVzdGlvbiBtYXJrZWQgIzUgYmVsb3cuDQo+
DQo+IFRoYW5rIHlvdS4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXMgQ2hlbg0KPg0KPiCxSKXzqsw6
IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytjaHJpcy5jaGVuMz1mbGV4LmNvbUBsaXN0cy5vemxh
YnMub3JnPiClTqrtDQo+IENocmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPg0K
PiCxSKXzpOm0wTogMjAyMaZ+OaTrMqTpIKRVpMggMDY6MzQNCj4gpqyl86rMOiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gpUSmrjogW3Bob3Nw
aG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChPRU0pIGNvbW1hbmQNCj4gZGV2
ZWxvcG1lbnQNCj4gSGkgYWxsLA0KPg0KPiBJIGhhdmUgc3R1ZGllZCAicGhvc3Bob3ItaG9zdC1p
cG1pZCIgcGFja2FnZSBmb3IgYSBjb3VwbGUgb2Ygd2Vla3MgYW5kDQo+IGdvdCB1bmRlcnN0YW5k
aW5nIHRoYXQgaXQgaGFzIGltcGxlbWVudGVkIHNvbWUgbWFuZGF0b3J5IGFuZCBvcHRpb25hbA0K
PiBjb21tYW5kcyBhbHJlYWR5LiBBbmQgSSBhbHNvIGtuZXcgdGhhdCBJJ20gYWJsZSB0byBsZXZl
cmFnZSAiaW50ZWwtDQo+IGlwbWktb2VtIiBwYWNrYWdlIHRvIGdldCBtb3JlIGNvbW1hbmQgaGFu
ZGxlcnMuIEJ1dCB0aGVyZSdyZSBzb21lDQo+IHF1ZXN0aW9ucyByYWlzZWQgaW4gbXkgbWluZCwg
SSBob3BlIHNvbWVvbmUgY291bGQgZ2l2ZSBtZSBzb21lDQo+IHN1Z2dlc3Rpb25zLg0KPiAgICAx
LiBXaGF0J3MgdGhlIG5vcm1hbCBkZXZlbG9wbWVudCBwcm9jZWR1cmUgaW4gY2FzZSBJIHdhbnQg
dG8gbWFrZQ0KPiBvdXIgb3duIE9FTSBjb21tYW5kcz8gSSBtZWFuIGRvIHlvdSBndXlzIGVuY291
cmFnZSBtZSB0byBjcmVhdGUgYSBuZXcNCj4gInh4eC1pcG1pLW9lbSIgcGFja2FnZSBvciB0byBs
ZXZlcmFnZSAiaW50ZWwtaXBtaS1vZW0iIGFuZCB0aGVuIGFkZCBvdXINCj4gb3duIGNvbW1hbmRz
IGluIGl0Pw0KPiAgICAyLiBJIGZvciBub3cgYWRkZWQgImludGVsLWlwbWktb2VtIiBwYWNrYWdl
IG9ubHkgZm9yIHVzaW5nIGl0cw0KPiAiPENoYXNzaXM+OjxTZXQgRnJvbnQgUGFuZWwgRW5hYmxl
cz4iIGNvbW1hbmQgYmVjYXVzZSBJIGZpZ3VyZWQgb3V0IHRoZQ0KPiBzYW1lIGNvbW1hbmQgaW4g
dGhlICJwaG9zcGhvci1ob3N0LWlwbWlkIiBpcyBub3QgYWJsZSB0byBtYXRjaCB0aGUgZC0NCj4g
YnVzIGludGVyZmFjZSBpbiB0aGUgIng4Ni1wb3dlci1jb250cm9sIi4gSSdtIG5vdCBzdXJlIGlm
IEkgd2lsbCBuZWVkDQo+IG90aGVyIGNvbW1hbmRzIGluIHRoZSAiaW50ZWwtaXBtaS1vZW0iLCBi
dXQgd2hhdCBpZiBJIGRvbid0IG5lZWQgb3RoZXINCj4gY29tbWFuZHMsIGhvdyB0byByZW1vdmUg
dGhlbT8gdG8gdXNlIHRoZSB3aGl0ZWxpc3QgbWVjaGFuaXNtPw0KPiAgICAzLiBJcyBpdCBva2F5
IHRvIGFkZCBtb3JlIHRoYW4gMSB4eHgtaXBtaS1vbWUgcGFja2FnZXM/IElmIHllcywgaG93DQo+
IHRvIG1hbmFnZSB0aGUgd2hpdGVsaXN0IGJldHdlZW4gdGhlc2UgMiBPRU0gcGFja2FnZXM/DQo+
ICAgIDQuIEFtIEkgYWJsZSB0byB1c2UgImludGVsLWlwbWktb2VtIiBvbiBhIHBsYXRmb3JtIHRo
YXQgaXMgdXNpbmcgQU1EDQo+IENQVT8NCj4gICAgNS4gSG93IHRvIHByaW50IHRoZSAiZW50cnko
IlNFTkRFUj0lcyIsIHNlbmRlci5jX3N0cigpKSIgcGFydHM/IEkNCj4gbWVhbiBJIGZvciBub3cg
Y2FuIHByaW50IG91dCAiU2V0IHVwIGlwbWkgY29udGV4dCIgc3RyaW5nIGFmdGVyDQo+IGZvbGxv
d2luZyB0aGUgaW5zdHJ1Y3Rpb24gbGlzdGVkIGluDQo+ICJodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL0RlYnVnZ2luZy1P
cGVuQk1DKmVuYWJsaW5nLWFwcGxpY2F0aW9uLWRlYnVnX187SXchIUhTbnRsQ2chRzYxWGNWeFVy
OEhsaThIcUlsZWJWWWppM3RUUFhzbjMzVzVveW8tRmxVOGZibTZaZDY2UzBINmNzVlp0SFlNMiQN
Cj4gIiwgYnV0IEkgZG9uJ3Qgc2VlICJTRU5ERVI9IiB3aGVuIEkgZXhlY3V0ZWQgImpvdXJuYWxj
dGwgLXQgaXBtaWQiDQo+IGNvbW1hbmQuDQo+ICAgIDYuICAgIDEuIGxvZzxsZXZlbDo6REVCVUc+
KCJTZXQgdXAgaXBtaQ0KPiBjb250ZXh0IixlbnRyeSgiU0VOREVSPSVzIixzZW5kZXIuY19zdHIo
KSksDQo+IGVudHJ5KCJORVRGTj0weCVYIiwgbmV0Rm4pLGVudHJ5KCJMVU49MHglWCIsIGx1biks
DQo+IGVudHJ5KCJDTUQ9MHglWCIsIGNtZCksZW50cnkoIkNIQU5ORUw9JXUiLCBjaGFubmVsKSwN
Cj4gICBlbnRyeSgiVVNFUklEPSV1IiwgdXNlcklkKSwNCj4gZW50cnkoIlNFU1NJT05JRD0weCVY
Iiwgc2Vzc2lvbklkKSwNCj4gZW50cnkoIlBSSVZJTEVHRT0ldSIsc3RhdGljX2Nhc3Q8dWludDhf
dD4ocHJpdmlsZWdlKSksDQo+ICAgICBlbnRyeSgiUlFTQT0leCIsIHJxU0EpKTsNCj4gVGhhbmsg
eW91Lg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpcyBDaGVuDQo+IExlZ2FsIERpc2NsYWltZXIgOg0K
PiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmls
ZWdlZCBhbmQNCj4gY29uZmlkZW50aWFsLg0KPiBJdCBpcyBpbnRlbmRlZCB0byBiZSByZWFkIG9u
bHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQNCj4gaXMgYWRkcmVzc2Vk
DQo+IG9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBp
cyBub3QgdGhlIGludGVuZGVkDQo+IHJlY2lwaWVudCwNCj4gaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLA0KPiBwbGVhc2Ug
aW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBj
b3B5IG9mDQo+IHRoaXMgbWVzc2FnZSENCg0KLS0NCkJlc3QgcmVnYXJkcywNCkFuZHJlaSBLYXJ0
YXNoZXYNCg0KDQo=

--_000_DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39DM6PR08MB5514namp_
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
Hi Anrdrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for your helpful comments.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen&nbsp;</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Andrei Ka=
rtashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB6=A4=E9 =A4U=A4=C8 06:15<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: =A6^=C2=D0: [phosphor-host-ipmid] Questions about IP=
MI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hello,<br>
<br>
I don't represent Intel, but have some considerations about this topic:<br>
1) Try to not reuse intel-ipmi-oem. Much better solution would be to<br>
create your own xxx-ipmi-oem package and implement only methods you<br>
really need.<br>
2) Better way would be to implement required logic in phosphor-host-<br>
ipmid and submit changes there. I didn't investigate this yet since we<br>
also pull intel-ipmi-oem to our project, but I believe, it should not<br>
be too difficult. Don't repeat our mistakes ).<br>
3) There is priority argument which you can use to determine handler<br>
call order.<br>
4) Most functions there are specific for Intel servers, so the useless<br>
even is you use Intel CPUs but your own platform.<br>
5) Use &quot;journalctl -t ipmid -o pretty-json&quot; or something like thi=
s. But<br>
now it is recommended to use new syntax:<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
logging/blob/master/docs/structured-logging.md__;!!HSntlCg!G61XcVxUr8Hli8Hq=
IlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6cseru6Bcw$">https://urldefense.com/v=
3/__https://github.com/openbmc/phosphor-logging/blob/master/docs/structured=
-logging.md__;!!HSntlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66=
S0H6cseru6Bcw$</a>
<br>
<br>
<br>
On Mon, 2021-09-06 at 09:40 +0000, Chris Chen (TPI) wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I guess this mail was got overwhelmed by bunches of emails, so please<=
br>
&gt; let me resend it and hope someone could help me. Another, I add one<br=
>
&gt; more question marked #5 below.<br>
&gt; <br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; <br>
&gt; =B1H=A5=F3=AA=CC: openbmc &lt;openbmc-bounces+chris.chen3=3Dflex.com@l=
ists.ozlabs.org&gt; =A5N=AA=ED<br>
&gt; Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
&gt; =B1H=A5=F3=A4=E9=B4=C1: 2021=A6~9=A4=EB2=A4=E9 =A4U=A4=C8 06:34<br>
&gt; =A6=AC=A5=F3=AA=CC: openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.=
org&gt;<br>
&gt; =A5D=A6=AE: [phosphor-host-ipmid] Questions about IPMI (OEM) command<b=
r>
&gt; development&nbsp;<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I have studied &quot;phosphor-host-ipmid&quot; package for a couple of=
 weeks and<br>
&gt; got understanding that it has implemented some mandatory and optional<=
br>
&gt; commands already. And I also knew that I'm able to leverage &quot;inte=
l-<br>
&gt; ipmi-oem&quot; package to get more command handlers. But there're some=
<br>
&gt; questions raised in my mind, I hope someone could give me some<br>
&gt; suggestions.<br>
&gt; &nbsp;&nbsp;&nbsp;1. What's the normal development procedure in case I=
 want to make<br>
&gt; our own OEM commands? I mean do you guys encourage me to create a new<=
br>
&gt; &quot;xxx-ipmi-oem&quot; package or to leverage &quot;intel-ipmi-oem&q=
uot; and then add our<br>
&gt; own commands in it?<br>
&gt; &nbsp;&nbsp;&nbsp;2. I for now added &quot;intel-ipmi-oem&quot; packag=
e only for using its<br>
&gt; &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; command be=
cause I figured out the<br>
&gt; same command in the&nbsp;&quot;phosphor-host-ipmid&quot; is not able t=
o match the d-<br>
&gt; bus interface in the &quot;x86-power-control&quot;. I'm not sure if I =
will need<br>
&gt; other commands in the &quot;intel-ipmi-oem&quot;, but what if I don't =
need other<br>
&gt; commands, how to remove them? to use the whitelist mechanism?<br>
&gt; &nbsp;&nbsp;&nbsp;3. Is it okay to add more than 1 xxx-ipmi-ome packag=
es? If yes, how<br>
&gt; to manage the whitelist between these 2 OEM packages?<br>
&gt; &nbsp;&nbsp;&nbsp;4. Am I able to use&nbsp;&quot;intel-ipmi-oem&quot; =
on a platform that is using AMD<br>
&gt; CPU?<br>
&gt; &nbsp;&nbsp;&nbsp;5. How to print the &quot;entry(&quot;SENDER=3D%s&qu=
ot;, sender.c_str())&quot; parts? I<br>
&gt; mean I for now can print out &quot;Set up ipmi context&quot; string af=
ter<br>
&gt; following the instruction listed in<br>
&gt; &quot;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/=
openbmc/openbmc/wiki/Debugging-OpenBMC*enabling-application-debug__;Iw!!HSn=
tlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6csVZtHYM2$
<br>
&gt; &quot;, but I don't see &quot;SENDER=3D&quot; when I executed &quot;jo=
urnalctl -t ipmid&quot;<br>
&gt; command.<br>
&gt; &nbsp;&nbsp;&nbsp;6.&nbsp;&nbsp;&nbsp; 1. log&lt;level::DEBUG&gt;(&quo=
t;Set up ipmi<br>
&gt; context&quot;,entry(&quot;SENDER=3D%s&quot;,sender.c_str()),&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;NETFN=3D0x%X&quot;, netFn),entry(&quot;LUN=3D0x%X&quot;, l=
un),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;<br>
&gt; entry(&quot;CMD=3D0x%X&quot;, cmd),entry(&quot;CHANNEL=3D%u&quot;, cha=
nnel),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
<br>
&gt; &nbsp; entry(&quot;USERID=3D%u&quot;, userId),&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;SESSIONID=3D0x%X&quot;, sessionId),&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;PRIVILEGE=3D%u&quot;,static_cast&lt;uint8_t&gt;(privilege)=
),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; &nbsp; &nbsp; entry(&quot;RQSA=3D%x&quot;, rqSA));<br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and<br>
&gt; confidential. <br>
&gt; It is intended to be read only by the individual or entity to whom it<=
br>
&gt; is addressed<br>
&gt; or by their designee. If the reader of this message is not the intende=
d<br>
&gt; recipient,<br>
&gt; is strictly prohibited. If you have received this message in error, <b=
r>
&gt; please immediately notify the sender and delete or destroy any copy of=
<br>
&gt; this message!<br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39DM6PR08MB5514namp_--
