Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F09004021A0
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 02:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3Qzg6FTcz2yPW
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 10:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=YI2LURvr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.183.28.62;
 helo=mx08-002d6701.pphosted.com;
 envelope-from=prvs=38843d7cda=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=YI2LURvr; dkim-atps=neutral
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com
 [185.183.28.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3Qz66wxjz2yHf
 for <openbmc@lists.ozlabs.org>; Tue,  7 Sep 2021 10:25:37 +1000 (AEST)
Received: from pps.filterd (m0132499.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1870K3RP025979; Tue, 7 Sep 2021 00:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=+8Ry0ENiWduX29DgY1II7aMk56PgpexdVXXcsVLDiFA=;
 b=YI2LURvr+xdM+ZGRhfBiNvoXtVJUk4vKeEI/jojbqoRUWV/qVflFHwLOq35YmkIsqd9+
 awMB+lx9vSf6hPrmSK+G9o7nfQ+4da7O8w8hT9c6Q3cdLEGv4udwBgcRMpr5RPu7rZiy
 8erUj2hDJgfLJggymWdLR25yUKt5LV1CYIXZz1gE6pQeZpESgbhumBuq+aRg5UWVeqE/
 MNUTw7V+z03dpFpoOQRz9eFrwcEcJOhN5Bxh7jFEJLnwsQq0fTjyOzEAK6saJGfMCwMS
 xyS1aJEF1CrpmoVzpJZuyPKzjeAcka/DgN2z59HB4gE4oEusaTg2Q1z+HGsMtOpLpSzg EA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx08-002d6701.pphosted.com with ESMTP id 3awbrp4cjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 00:25:24 +0000
Received: from DM3PR11CA0019.namprd11.prod.outlook.com (2603:10b6:0:54::29) by
 SN6PR08MB4640.namprd08.prod.outlook.com (2603:10b6:805:9d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21; Tue, 7 Sep 2021 00:25:21 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::fa) by DM3PR11CA0019.outlook.office365.com
 (2603:10b6:0:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 00:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.29)
 smtp.mailfrom=flex.com; aspeedtech.com; dkim=none (message not signed)
 header.d=none; aspeedtech.com; dmarc=fail action=oreject header.from=flex.com; 
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.29 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.29; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.29) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 00:25:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY4qJQUAHmB0ztFZWXdlzYhohHLPhIBEvTqoSN28W6lGKUSowvNfKUpC6xP6q7pt8+If6dSUbtAYPiMvAl++366bwoScqqysvefgeJdy99HHBK+uq3NjaQaHagseW8DAQ17vrjtHwDBVwnTNZ5S4obURqmyWqnMbGUdDbiUtoTUYcAC96em9DwjpQLqnwZv1F450xDCsCFUwdVlMDa2cmYztUVpE+KHfSFiMH3Z+54HbAcWez3tc+TBwe2PeanErEJVr2wl9adgPDLAzpGdxatIwmEqm3Q7tsaY4oLaqjFTb84eBPml/vVCK0paH+mEJyxix8/uV2MLUb0OIHN5qAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+8Ry0ENiWduX29DgY1II7aMk56PgpexdVXXcsVLDiFA=;
 b=PSsuao7XB2jZUY6gDrTm/wKv0D1Z9Fo/pcrMdIoAfUGx9a0kKReAAE69J0aKFxn3tBaoumCI5ql9bAX06OHFMus42F1VXyrQyeb0bedBirJgZBSJctXpkUsgFV0C1LUzQ2JrzVnMwrsSC79t+7tFb6a9hWs9DQd4dR8lfdiO4m54UJu+/Sat6deEcT6VTHp/ZMr9ACVuz/HJRbCYas3PyN3MuyjPqulmVRl53pXNcEJkU5EWvb1TXP5B7bMLrO8RnynVhNXNyUcCaiKAHwbNSpy93yhk5UKBzWh8LhbV11wD3Iywe2r4cPIb6vXaJH6Nj4MyjZZUuEZMFFSdrgN+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB5145.namprd08.prod.outlook.com (2603:10b6:5:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 00:25:17 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 00:25:17 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Troy Lee <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI (OEM) command
 development
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAAK+5CAAPCeOQ==
Date: Tue, 7 Sep 2021 00:25:17 +0000
Message-ID: <DM6PR08MB5514F53DEC09B48CEBF58582DCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <TYAPR06MB21581702B0E3680A6D9E32D08AD29@TYAPR06MB2158.apcprd06.prod.outlook.com>
In-Reply-To: <TYAPR06MB21581702B0E3680A6D9E32D08AD29@TYAPR06MB2158.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: ff8d6faa-11f6-7315-0a1f-6a6dd4752fe9
Authentication-Results-Original: aspeedtech.com; dkim=none (message not
 signed) header.d=none;aspeedtech.com; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8635143a-0d3a-465e-8566-08d97195f93c
x-ms-traffictypediagnostic: DM6PR08MB5145:|SN6PR08MB4640:
X-Microsoft-Antispam-PRVS: <SN6PR08MB4640BD29F7342B6B910A70D7DCD39@SN6PR08MB4640.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: C5E6+sgAcR1cF3BfJW3HFxYr07U/dZ8TfPzoc4vqwYyj0DPH5JLSd39fKx+/38EJhoYDo/6ZBrPeeYCPVF9NfPIViv+Mn4oEqSwLSQDVdjoQrcy+J/vol/jQKhq58gSfmHZZdmyGsYkB1f756EnbNBqNQgaBcE+8+ShGbk90fGWmqLAW1T2i0tN4Pxcb3mmmjoBLn0nckCXGp0dmH/Ky2NtE9xp996poJrQtAZv8OUjFYbsuhxbvxE4i+299C0vsx2iU++AfGbXKFoPGl5TeleDXGoEBWbbveeV2oiRbMLjUHAr+D4znvp+X3ANXFyLLD5y+/rkFFqddHSZYXrn+DX4R6myLfFymZ0vQYkwH4gmeS2gT9h7XHORjr0q7zRtrsA9S4b6DmqOTtWyShQBUucxdZuio5P6IZvTrvcnl/NVw+qCPl0fayRxEXPyXmpVWgEC+Ecr3VwIhh9F7XmzOnU4KjzlIN+wpx85VExu/xdUo8L/ggOnlNttZBdfTQ5XT3PaXk7sGTxp5Jbz9/598rQPwXZdWmLvwvwfV90ETAFRcAdA/p6tJAP/OhDavCLizVKp1FHud5jk2ISH0HUlmZvorarPExVwG4zXvUZTVkzA51VY0AagCUVTYI59I9NFN7fVEQgfN9UyFLJ64EIyaK8I8tsAdmNwYSnaVI+wS6CVBmRHur6lw7pxkWPBFS3lIg49kedCNK8FxBI3WhsJhmdRbw5kQIZVt/VlRTOdoWOkoEBeqwLpHQg91k/N6FbBv0hwkwkFNZkXyNF4eM7WQeohtub+tFFUimbAlXDDlrAFHhr54J2pAg0MeiprYg71Bl1bCg8sD1Ig4I678ytvx11+PoDQMnRuVZU/ZDiYSyhk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(7696005)(18265965003)(316002)(186003)(478600001)(110136005)(66946007)(66476007)(71200400001)(6506007)(86362001)(53546011)(9686003)(66556008)(33656002)(38070700005)(5660300002)(83380400001)(55016002)(8936002)(91956017)(52536014)(38100700002)(122000001)(76116006)(2906002)(19627405001)(224303003)(66446008)(64756008)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514F53DEC09B48CEBF58582DCD39DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5145
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40eb93ef-69c4-42d8-c170-08d97195f7da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iGTOFbVYYPVfVvXTbeTSfIGCImgUFgAz0KFux1PAiugmshK0gk+dbyh5e7IG8nDRT+cf0n19MZQoQUfcEvCstyZoEUsEdbruQI5pqw7fN9n4RvgsP7I6eymVyj+tyQsbgUsKCcU+jDtmOwa7sDjKqGqite72WzJIdd9Zhe3KmGzU5TLAn+x5Zzn8cQtN93L8HJ6IVnGZMuRD1nbtA9edumdJLb1cV+wCM5tQ8thoGfovKXU2FWatHIABIMUlLLkMJiVG+NxD4KJx8wi3E12bPfmVV3fJ1tlWIZYCIFgMB2uzMLZoqB0VNpxFFffWK0mb/WwR2veuVhqVQKTZw1EEM5sC5rJ9Bf5DnnWQDJiCwIpYAp9/DC9tofi7j6aiHUf+d1HZqugLmKa/gh/Iz/FRxZgRdYAm7XN0Ej6r5Quv6PtC0ns7r9eU4Xf99ldsJVd4ftnp1J38+28DcNH5JL8BLknrS7F9BrixVXtKC5IAIubQyhoURS32R+cDvQegHPjs270ab87y9pBZ8WjctHTM7R4AI2/ZiHu5QXDWU1xptav3DIexKhOflt/n9PTyBQnkFY80DyAG0AG5u8kVSmQmMiY1X8AIGhua0HHELp+mY9azvcwmyso1v4UL43pGXxEYKbLtVjYuUpgiWL/XjLEJSH8ILiWSP5zBPtICOaFrdoMeJE67IvuPxMm9BVdvNIEyFGRpOlZZfcBec+OQnJtDGKk7AxVDzsaU5BQDO9BCbp00zYdEOZnvHuusPqYM9HorbRy8wnTUcQNNvJFIpwvP0zBp52L7O98pDJA4Y/olPdP+7xnTQk9XQhWzS0R2wBCXQgAZ1Oc0G9hQdAFTBl6REUuvTLgIpmarP7SAV+GbAJHQn5HKaqQ8gH/5rks2ffU
X-Forefront-Antispam-Report: CIP:144.49.247.29; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(110136005)(2906002)(356005)(70206006)(508600001)(186003)(83380400001)(316002)(82310400003)(224303003)(18265965003)(86362001)(81166007)(8936002)(5660300002)(4186021)(26005)(36860700001)(7696005)(336012)(55016002)(6506007)(19627405001)(52536014)(53546011)(33656002)(47076005)(70586007)(9686003)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 00:25:19.2346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8635143a-0d3a-465e-8566-08d97195f93c
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.29];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4640
X-Proofpoint-GUID: G0OJYarRCmCBQk2vqcHJJotdApK3Fbiv
X-Proofpoint-ORIG-GUID: G0OJYarRCmCBQk2vqcHJJotdApK3Fbiv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_10:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1011 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070000
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

--_000_DM6PR08MB5514F53DEC09B48CEBF58582DCD39DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgVHJveSwNCg0KSSdtIGFibGUgdG8gc2VlIG90aGVyIGVudHJpZXMgbm93LCB0aGFua3MgZm9y
IHlvdXIgc2hhcmluZy4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCrFIpfOqzDogVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2gu
Y29tPg0KsUil86TptME6IDIwMjGmfjmk6zak6SCkVaTIIDA2OjAzDQqmrKXzqsw6IENocmlzIENo
ZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiBSRTogW3Bob3NwaG9yLWhvc3QtaXBt
aWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChPRU0pIGNvbW1hbmQgZGV2ZWxvcG1lbnQNCg0KSGks
DQoNClVzaW5nIGBgYGpvdXJuYWxjdGwgLW8ganNvbi1wcmV0dHlgYGAsIHlvdSB3aWxsIHNlZSBv
dGhlciBlbnRyaWVzIGluIGVhY2ggbG9nLg0KDQpUaGFua3MsDQpUcm95IExlZQ0KDQpGcm9tOiBv
cGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdHJveV9sZWU9YXNwZWVkdGVjaC5jb21AbGlzdHMub3ps
YWJzLm9yZz4gT24gQmVoYWxmIE9mIENocmlzIENoZW4gKFRQSSkNClNlbnQ6IE1vbmRheSwgU2Vw
dGVtYmVyIDYsIDIwMjEgNTo0MSBQTQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3Vi
amVjdDogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChP
RU0pIGNvbW1hbmQgZGV2ZWxvcG1lbnQNCg0KSGkgYWxsLA0KDQpJIGd1ZXNzIHRoaXMgbWFpbCB3
YXMgZ290IG92ZXJ3aGVsbWVkIGJ5IGJ1bmNoZXMgb2YgZW1haWxzLCBzbyBwbGVhc2UgbGV0IG1l
IHJlc2VuZCBpdCBhbmQgaG9wZSBzb21lb25lIGNvdWxkIGhlbHAgbWUuIEFub3RoZXIsIEkgYWRk
IG9uZSBtb3JlIHF1ZXN0aW9uIG1hcmtlZCAjNSBiZWxvdy4NCg0KVGhhbmsgeW91Lg0KDQpSZWdh
cmRzLA0KQ2hyaXMgQ2hlbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQqxSKXzqsw6IG9wZW5ibWMgPG1haWx0bzpvcGVuYm1jLWJvdW5jZXMrY2hyaXMuY2hlbjM9
ZmxleC5jb21AbGlzdHMub3psYWJzLm9yZz4gpU6q7SBDaHJpcyBDaGVuIChUUEkpIDxtYWlsdG86
Q2hyaXMuQ2hlbjNAZmxleC5jb20+DQqxSKXzpOm0wTogMjAyMaZ+OaTrMqTpIKRVpMggMDY6MzQN
CqaspfOqzDogbWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8bWFpbHRvOm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFtwaG9zcGhvci1ob3N0LWlwbWlkXSBRdWVzdGlvbnMg
YWJvdXQgSVBNSSAoT0VNKSBjb21tYW5kIGRldmVsb3BtZW50DQoNCkhpIGFsbCwNCg0KSSBoYXZl
IHN0dWRpZWQgInBob3NwaG9yLWhvc3QtaXBtaWQiIHBhY2thZ2UgZm9yIGEgY291cGxlIG9mIHdl
ZWtzIGFuZCBnb3QgdW5kZXJzdGFuZGluZyB0aGF0IGl0IGhhcyBpbXBsZW1lbnRlZCBzb21lIG1h
bmRhdG9yeSBhbmQgb3B0aW9uYWwgY29tbWFuZHMgYWxyZWFkeS4gQW5kIEkgYWxzbyBrbmV3IHRo
YXQgSSdtIGFibGUgdG8gbGV2ZXJhZ2UgImludGVsLWlwbWktb2VtIiBwYWNrYWdlIHRvIGdldCBt
b3JlIGNvbW1hbmQgaGFuZGxlcnMuIEJ1dCB0aGVyZSdyZSBzb21lIHF1ZXN0aW9ucyByYWlzZWQg
aW4gbXkgbWluZCwgSSBob3BlIHNvbWVvbmUgY291bGQgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25z
Lg0KMS4gV2hhdCdzIHRoZSBub3JtYWwgZGV2ZWxvcG1lbnQgcHJvY2VkdXJlIGluIGNhc2UgSSB3
YW50IHRvIG1ha2Ugb3VyIG93biBPRU0gY29tbWFuZHM/IEkgbWVhbiBkbyB5b3UgZ3V5cyBlbmNv
dXJhZ2UgbWUgdG8gY3JlYXRlIGEgbmV3ICJ4eHgtaXBtaS1vZW0iIHBhY2thZ2Ugb3IgdG8gbGV2
ZXJhZ2UgImludGVsLWlwbWktb2VtIiBhbmQgdGhlbiBhZGQgb3VyIG93biBjb21tYW5kcyBpbiBp
dD8NCjIuIEkgZm9yIG5vdyBhZGRlZCAiaW50ZWwtaXBtaS1vZW0iIHBhY2thZ2Ugb25seSBmb3Ig
dXNpbmcgaXRzICI8Q2hhc3Npcz46PFNldCBGcm9udCBQYW5lbCBFbmFibGVzPiIgY29tbWFuZCBi
ZWNhdXNlIEkgZmlndXJlZCBvdXQgdGhlIHNhbWUgY29tbWFuZCBpbiB0aGUgInBob3NwaG9yLWhv
c3QtaXBtaWQiIGlzIG5vdCBhYmxlIHRvIG1hdGNoIHRoZSBkLWJ1cyBpbnRlcmZhY2UgaW4gdGhl
ICJ4ODYtcG93ZXItY29udHJvbCIuIEknbSBub3Qgc3VyZSBpZiBJIHdpbGwgbmVlZCBvdGhlciBj
b21tYW5kcyBpbiB0aGUgImludGVsLWlwbWktb2VtIiwgYnV0IHdoYXQgaWYgSSBkb24ndCBuZWVk
IG90aGVyIGNvbW1hbmRzLCBob3cgdG8gcmVtb3ZlIHRoZW0/IHRvIHVzZSB0aGUgd2hpdGVsaXN0
IG1lY2hhbmlzbT8NCjMuIElzIGl0IG9rYXkgdG8gYWRkIG1vcmUgdGhhbiAxIHh4eC1pcG1pLW9t
ZSBwYWNrYWdlcz8gSWYgeWVzLCBob3cgdG8gbWFuYWdlIHRoZSB3aGl0ZWxpc3QgYmV0d2VlbiB0
aGVzZSAyIE9FTSBwYWNrYWdlcz8NCjQuIEFtIEkgYWJsZSB0byB1c2UgImludGVsLWlwbWktb2Vt
IiBvbiBhIHBsYXRmb3JtIHRoYXQgaXMgdXNpbmcgQU1EIENQVT8NCjUuIEhvdyB0byBwcmludCB0
aGUgImVudHJ5KCJTRU5ERVI9JXMiLCBzZW5kZXIuY19zdHIoKSkiIHBhcnRzPyBJIG1lYW4gSSBm
b3Igbm93IGNhbiBwcmludCBvdXQgIlNldCB1cCBpcG1pIGNvbnRleHQiIHN0cmluZyBhZnRlciBm
b2xsb3dpbmcgdGhlIGluc3RydWN0aW9uIGxpc3RlZCBpbiAiaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9EZWJ1Z2dpbmct
T3BlbkJNQyplbmFibGluZy1hcHBsaWNhdGlvbi1kZWJ1Z19fO0l3ISFIU250bENnIUVSNEY1RVFL
RGZ4WkRobE5ial91LTM3VmFJdUlfa2dreThacUd1aW9zbXJ1LS12RkdqRXNUNGNQMF9BeE9RSDkk
ICIsIGJ1dCBJIGRvbid0IHNlZSAiU0VOREVSPSIgd2hlbiBJIGV4ZWN1dGVkICJqb3VybmFsY3Rs
IC10IGlwbWlkIiBjb21tYW5kLg0KNi4NCjYuIGxvZzxsZXZlbDo6REVCVUc+KCJTZXQgdXAgaXBt
aSBjb250ZXh0IiwgZW50cnkoIlNFTkRFUj0lcyIsIHNlbmRlci5jX3N0cigpKSwNCiAgICAgICAg
ICAgICAgICAgICAgICBlbnRyeSgiTkVURk49MHglWCIsIG5ldEZuKSwgZW50cnkoIkxVTj0weCVY
IiwgbHVuKSwNCiAgICAgICAgICAgICAgICAgICAgICBlbnRyeSgiQ01EPTB4JVgiLCBjbWQpLCBl
bnRyeSgiQ0hBTk5FTD0ldSIsIGNoYW5uZWwpLA0KICAgICAgICAgICAgICAgICAgICAgIGVudHJ5
KCJVU0VSSUQ9JXUiLCB1c2VySWQpLA0KICAgICAgICAgICAgICAgICAgICAgIGVudHJ5KCJTRVNT
SU9OSUQ9MHglWCIsIHNlc3Npb25JZCksDQogICAgICAgICAgICAgICAgICAgICAgZW50cnkoIlBS
SVZJTEVHRT0ldSIsIHN0YXRpY19jYXN0PHVpbnQ4X3Q+KHByaXZpbGVnZSkpLA0KICAgICAgICAg
ICAgICAgICAgICAgIGVudHJ5KCJSUVNBPSV4IiwgcnFTQSkpOw0KDQoNClRoYW5rIHlvdS4NCg0K
DQpSZWdhcmRzLA0KQ2hyaXMgQ2hlbg0KTGVnYWwgRGlzY2xhaW1lciA6DQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlk
ZW50aWFsLg0KSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFs
IG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZA0Kb3IgYnkgdGhlaXIgZGVzaWduZWUu
IElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LA0KeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVz
c2FnZSwgaW4gYW55IGZvcm0sDQppcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsDQpwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5
IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2Fn
ZSENCg==

--_000_DM6PR08MB5514F53DEC09B48CEBF58582DCD39DM6PR08MB5514namp_
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
Hi Troy,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm able to see other entries now, thanks for your sharing.</div>
<div>
<div id=3D"appendonsend"></div>
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Troy Lee =
&lt;troy_lee@aspeedtech.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB6=A4=E9 =A4U=A4=C8 06:03<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> RE: [phosphor-host-ipmid] Questions about IPMI (OEM) com=
mand development</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi,<br>
<br>
Using ```journalctl -o json-pretty```, you will see other entries in each l=
og.<br>
<br>
Thanks,<br>
Troy Lee<br>
<br>
From: openbmc &lt;openbmc-bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.or=
g&gt; On Behalf Of Chris Chen (TPI)<br>
Sent: Monday, September 6, 2021 5:41 PM<br>
To: openbmc@lists.ozlabs.org<br>
Subject: =A6^=C2=D0: [phosphor-host-ipmid] Questions about IPMI (OEM) comma=
nd development<br>
<br>
Hi all,<br>
<br>
I guess this mail was got overwhelmed by bunches of emails, so please let m=
e resend it and hope someone could help me. Another, I add one more questio=
n marked #5 below.<br>
<br>
Thank you.<br>
<br>
Regards,<br>
Chris Chen<br>
<br>
________________________________________<br>
=B1H=A5=F3=AA=CC: openbmc &lt;<a href=3D"mailto:openbmc-bounces+chris.chen3=
=3Dflex.com@lists.ozlabs.org">mailto:openbmc-bounces+chris.chen3=3Dflex.com=
@lists.ozlabs.org</a>&gt; =A5N=AA=ED Chris Chen (TPI) &lt;<a href=3D"mailto=
:Chris.Chen3@flex.com">mailto:Chris.Chen3@flex.com</a>&gt;<br>
=B1H=A5=F3=A4=E9=B4=C1: 2021=A6~9=A4=EB2=A4=E9 =A4U=A4=C8 06:34<br>
=A6=AC=A5=F3=AA=CC: <a href=3D"mailto:openbmc@lists.ozlabs.org">mailto:open=
bmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org">ma=
ilto:openbmc@lists.ozlabs.org</a>&gt;<br>
=A5D=A6=AE: [phosphor-host-ipmid] Questions about IPMI (OEM) command develo=
pment <br>
&nbsp;<br>
Hi all,<br>
<br>
I have studied &quot;phosphor-host-ipmid&quot; package for a couple of week=
s and got understanding that it has implemented some mandatory and optional=
 commands already. And I also knew that I'm able to leverage &quot;intel-ip=
mi-oem&quot; package to get more command handlers. But
 there're some questions raised in my mind, I hope someone could give me so=
me suggestions.<br>
1. What's the normal development procedure in case I want to make our own O=
EM commands? I mean do you guys encourage me to create a new &quot;xxx-ipmi=
-oem&quot; package or to leverage &quot;intel-ipmi-oem&quot; and then add o=
ur own commands in it?<br>
2. I for now added &quot;intel-ipmi-oem&quot; package only for using its &q=
uot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; command because I=
 figured out the same command in the&nbsp;&quot;phosphor-host-ipmid&quot; i=
s not able to match the d-bus interface in the &quot;x86-power-control&quot=
;. I'm not sure
 if I will need other commands in the &quot;intel-ipmi-oem&quot;, but what =
if I don't need other commands, how to remove them? to use the whitelist me=
chanism?<br>
3. Is it okay to add more than 1 xxx-ipmi-ome packages? If yes, how to mana=
ge the whitelist between these 2 OEM packages?<br>
4. Am I able to use&nbsp;&quot;intel-ipmi-oem&quot; on a platform that is u=
sing AMD CPU?<br>
5. How to print the &quot;entry(&quot;SENDER=3D%s&quot;, sender.c_str())&qu=
ot; parts? I mean I for now can print out &quot;Set up ipmi context&quot; s=
tring after following the instruction listed in &quot;<a href=3D""></a>http=
s://urldefense.com/v3/__https://github.com/openbmc/openbmc/wiki/Debugging-O=
penBMC*enabling-application-debug__;Iw!!HSntlCg!ER4F5EQKDfxZDhlNbj_u-37VaIu=
I_kgky8ZqGuiosmru--vFGjEsT4cP0_AxOQH9$
 &quot;, but I don't see &quot;SENDER=3D&quot; when I executed &quot;journa=
lctl -t ipmid&quot; command.<br>
6. <br>
6. log&lt;level::DEBUG&gt;(&quot;Set up ipmi context&quot;, entry(&quot;SEN=
DER=3D%s&quot;, sender.c_str()), <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;NETFN=3D0x%X&quot;, netFn), entry(&quot;LUN=3D0x%X&quot;, lun=
),<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;CMD=3D0x%X&quot;, cmd), entry(&quot;CHANNEL=3D%u&quot;, chann=
el),<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;USERID=3D%u&quot;, userId),<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;SESSIONID=3D0x%X&quot;, sessionId),<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;PRIVILEGE=3D%u&quot;, static_cast&lt;uint8_t&gt;(privilege)),=
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; entry(&quot;RQSA=3D%x&quot;, rqSA));<br>
<br>
<br>
Thank you.<br>
<br>
<br>
Regards,<br>
Chris Chen<br>
Legal Disclaimer :<br>
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
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB5514F53DEC09B48CEBF58582DCD39DM6PR08MB5514namp_--
