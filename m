Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA803ED234
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 12:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp9nY6CqCz3bhl
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 20:46:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=ZRJ3BNot;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=286272d5ee=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=ZRJ3BNot; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp9mz6rBmz30L2
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 20:45:53 +1000 (AEST)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GAc2KM025916; Mon, 16 Aug 2021 10:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=FDKVmIb6mJ3QL05+eLb33H1TkQPi33C2yZZaIceDl3M=;
 b=ZRJ3BNotwy8MQp30TkKv92VWCWPh9ldI9reoHUM+8+MTWfbmwxyBzGaEf4qBbsuPOoTK
 r/wB/F9rXtIVY1PjQAdUrMIEAOmPAnT55+sApEzPNsS5dDuUUPRJQIrFkQXMon1Q1wyl
 DMp6Z8qKwlqUqWaMpP3HOu0f5CPQJMuQK1WE//FlR71tP+hc4Pg1kFrUFmpxCNH5Kd3v
 H9XVYAbO2BqmU0zhobTyT9K+O6ATQ2u31gvbgwIX2kqflsJw0H2df2KZiCiT7VrWbezO
 iBahMxu6UzJ/bsoELnOpulWFAHuokXurpAa5K6C+OBbYqDCwQ6iUsVKUvdtg0GVUwO5u hQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx07-002d6701.pphosted.com with ESMTP id 3afnn7g7yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 10:45:44 +0000
Received: from BN9PR03CA0804.namprd03.prod.outlook.com (2603:10b6:408:13f::29)
 by CO1PR08MB7045.namprd08.prod.outlook.com (2603:10b6:303:d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 10:45:41 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::c2) by BN9PR03CA0804.outlook.office365.com
 (2603:10b6:408:13f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 10:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.3)
 smtp.mailfrom=flex.com; aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=144.49.247.3; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.3) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 10:45:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wyd1lWjeUHhSiZeuERKKWS5PAPtjkuoxjXmJXTxZmrBw7FPtS8XE78KJQjLFMPyzEa1ZfTxZ1Uvx+iQkaODE3OMt8gEshntLYXl+czMBjqfISe0CKfo5adekHX7NT0vXD1cmGeNlykkn9OVOE5WY60O5Ev4hqRYnJTsQI/SxKXbbqzN1FRTn9Fk23O4itUO6CUtfle/xBIdLLSRSCf7L/O3vpUC+nPTh19T4+yVBqcXhCWcj3EUYuI3HKGblc0rLhhBsCcuB4Hg2WMOjJgmG+qo8d2efBPbylwPpYC9KTo2W2X0XKg1f/LILdY3bdBohhiUKZZ/lGWmVM9q0Pa2Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJCTEjYHVJBjn9mG0QqoHYW7/0X29VFwuhr2JxRQ7is=;
 b=nXRGGu140eeVaPk9udO/4UyQfBFAN4AfkoGysBVDae4TDLJFBLkHP/5i3uueCkmMZxND+WeDVp1m5zCPL1NFbCoYKjWTenAFUIN+S2he81TZ2hyVKc2kNUxqHodmfTyH2Uv32iekL8iMCxnN9DOEVPa0K1AxMaTAaH1KW+CE99RhclihselUyEfWQ+4QbbjDlySay5auYcRWEBm5CuzA5mQge9uj9oam5HUhKAwnDcIMKF3Pq+Qp0rOCs8FftWXO+xvwuDLHU40r/LxVAM68mxEbNATdxCU4cAX2MH+LzXFAZfNMeXgy5wY9MXOcqzuZ8CTEW/cvElnBsBe4vXdJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB5657.namprd08.prod.outlook.com (2603:10b6:5:10c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 10:45:38 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 10:45:38 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrew Jeffery <andrew@aj.id.au>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhlIHBvd2VyIGJ1dHRv?=
 =?big5?B?biBmb3IgYSBsb25nIHRpbWUgdGhhdCBjYW4ndCBmb3JjZSB0dXJuIG9mZiBzeXN0?=
 =?big5?Q?em_power?=
Thread-Topic: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Index: AQHXkmhH5ZD2Fz+Ed0uVX3qFyM9Mfqt17RpV
Date: Mon, 16 Aug 2021 10:45:38 +0000
Message-ID: <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
In-Reply-To: <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6e630bdf-aeb9-444e-fbc8-08d960a2fd85
x-ms-traffictypediagnostic: DM6PR08MB5657:|CO1PR08MB7045:
X-Microsoft-Antispam-PRVS: <CO1PR08MB704559FECA37ABE91364A30EDCFD9@CO1PR08MB7045.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2NZ2fttq04sX7gr0KUaPM0ar2qHKuMWAK0y/S+CePxh2dg/4mxiRTH3AzCQ41qrNMBD7X05xN9YXAnV0ugZjE+1CW/aqamhGy6Paqs+DlFK5W0sZgfI8l7znvi6rQIo3yGPSXx1XWbYFSKBmMyzqErqIAzH5GStdov2gefrbT9GPeLPw3Eoinmm1Dls7mbKF2EOEKemCcFo5NjuAn/DUKm3LbyVrrGOymk++0wTnI8c9kYHbG8heSvZUwq0Z97brwYBwxHsNSNNwMW068z3dWFJ7IP6ptUAb6I7MSSAME/8zAlHTTSPab5I1hA2QPIESNtv6DdE9xDOKlGdexavay5nCsA9is1WGzK/DZeEiCIDcuFsgE2TjV2JcDSYPL+cV6uxA/HTlgTXRmyPzn0pQHa6YkeCTd2eZpIzBnK5e57i40JB+5yhLwgOAsi1LNhhl0/yo3DJwzhRy4TL8Jr3kPwBPcrUowwI7Nt7hWdXEDUmbwz0kl2/KRz7qn6ioIW1AJs9MKZRdCV2OSw4/smL/Iq6UTAZg7A/P8XMa5XwMXJFuZCkfIsChWEewptBWVsr0TAYRZCogXkpUphmzHb6O5jbJ1BwEkphjvil94mKUJFdKeFMmX3V3mF3D+KcidtzCJjO7zqzfAo3rDlCV9AdEoeGzZHmsKZ84InLajg8HedUfLkmzf2VNhF8rw04A9bH1kPRVZKF9rjHRb9Nc0xnQkA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(39860400002)(396003)(136003)(9686003)(38070700005)(33656002)(83380400001)(478600001)(316002)(55016002)(71200400001)(5660300002)(186003)(110136005)(86362001)(52536014)(8936002)(66946007)(66446008)(76116006)(91956017)(38100700002)(7696005)(19627405001)(224303003)(6506007)(64756008)(66556008)(66476007)(2906002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TmJvYzF0YVFXR2gzRDJzSno4UmgzOWtMYzFBcUVjcmE3N21IY1U5YkR2anp1alpT?=
 =?big5?B?Qy9QcnBHbTl6SnY2QVR5bmVFRFlsSDBpUnNKeFg5ZHhTSDhDYklER3ZnZW1IM0dm?=
 =?big5?B?b25OcHRBQWhOTnNQMjZ6RWtuNEtuenpOY2ZLa1dKTkRFWTl3eFdEZVdNWmoyNVNP?=
 =?big5?B?eDRKUCtkZ3ZKb3lJK1AyaW1lNC9iY1pxaUJDMmcvaEtkZG1HWUVDRyttYzQzWHdW?=
 =?big5?B?eEQyeHI4V1FOdVh1dm5FQmJVNnV5ZFlGaVdtZGJEU0ZUMXJ0ZHpXVDcrNDZqanZL?=
 =?big5?B?QjhYUE1VaVRQT013aUgranh3UjFJZy8yQnNqRkMraC9MZGdTLzZCeXFoTDZ1bmQw?=
 =?big5?B?K20xVjA3MGZXdENhS3dHa1ZzS0hKaUY4WHZDU0IrSGRpZWMzYXM3ZG9MYk1ueGFr?=
 =?big5?B?REYvUWRNSHlyVzJmcEpBdVdpTjN0STFKdnYwZllVSEFuNUY0anllc0xjY1h6V2Jk?=
 =?big5?B?SDlDd1FYNXo5SDVwVytpT2RBcmM0OWJjcWVrYjVsZmxWT2RobWxFWk1FeVVEQVZE?=
 =?big5?B?cEtoMnh2UW8zU1o3OXRyU2lhVU5JRkNJVUl5U2EzWVNDS2hIWURKVjhuc05uVmEr?=
 =?big5?B?eHpOTmZiTlRFTHpPeHJ5L0dwYW9janBNaEVRcFRFbU5LL0RxUkNxREsvVG5PL1Jm?=
 =?big5?B?dzhKK3M2TGcwYi9Lek5ZMHlya2hLQVAxMUdMWjNrZERKblMxWnlGRk9FbGxxM203?=
 =?big5?B?VC8zTVA0TmZCMG1SWXIrNk8vbEhVRE80U2RmblR6cW5GWFNzVXRyN1ZwdnFxdWtC?=
 =?big5?B?UUsxazZwVDh3WTZBZTU3dTh3MllhS0xNTGNOQmJXNVN4dzhZRkJzU1VPRUszemp1?=
 =?big5?B?cWk4RS9pbW5LaHRGSnVZcy9jK3cwYk5XbjIxNHUxTktjOXNhYVpxRWV2ZTkrd2wr?=
 =?big5?B?TzZHVkxYaE5GR0V6blkxQ2JzN0tnK2lmekhGY0p3TmgzbWFrdHZDZVRTQk1BemFY?=
 =?big5?B?eDBpZ2JmRlZqWU1PRXJwL0owMHJTdDRJYzhycHRzQnBrRlFHM0lCWTlCMks2aVNS?=
 =?big5?B?ZTNRK1NRd2d4bThGTEMwWXRXYVZjYjUzRUhTeFBuYWZhcGwxWEVsZDNwZWk5MnBj?=
 =?big5?B?ek04U2xsZ2tJZGxhems3UmhtcXduY21qRmJPSENFYnRJWWgybE1abGIvRHV4YmZ6?=
 =?big5?B?Zk1QVnZianNjUTcrUlpWZ2dWdUJCWkhPMnB0aXpGUWtMeFhNSTlGRTdKYWFRSG82?=
 =?big5?B?V2NGa0FpMTRtRE9QZFdqOWRDV0pRSk1ZWDE5cXMwSGw3dHh5cU0wRHFiclp2UEdx?=
 =?big5?B?dDF5Q1doSGdrMHVhVDVxNklxOTArdDVrWjByd3lWWnprME5aUk5paEFVM2Y5MkNl?=
 =?big5?B?Z1hJcC9sdnM4M1NET2N3TFNhOVpOSDFBU0IxM3Y1eG50UFJGTmtmUHI5ckgySFFQ?=
 =?big5?B?Q25IVUJjQ24wUllzZS82V1l5YWlWeFBIRWcwaVFKTnRzb3JPSm42VXZSajlTbEpQ?=
 =?big5?B?OEhJekxlQ0ZraU9MU0E3RjBXTHhsd2U5WHRxVkpYeCtZUUdoZmt1bFovNjlPRmQz?=
 =?big5?B?akZsdnhTS2R3MnFRWnc2TVIvZzVvdHh3cDRjZmlXZFd4MjN1UWxVeldwdzltNWQz?=
 =?big5?B?bzhiaGpySW5IaEQrdzFZbDNOTHM1QmdLQjl3QzF3NkRyN010TWppdytaL3BvN1hY?=
 =?big5?B?N1NGenViVmp4VG5hbjRZaUZPK2V4VkVxWEVIUHFGakUvZFk0c3d1NElWUnMwZ1lw?=
 =?big5?B?VEV1S3U3K1ZuVTZ6dlBnM1B1QnBpcnlZcnVLNjd2c1d6OTRKV0M1dzQyekNGVG40?=
 =?big5?Q?ix5DT+43nMxUxRZd?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB551444C4EAB80473CB576740DCFD9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5657
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d39a5717-c447-4703-f43c-08d960a2fc5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kS004A396rOEYbuaG15oYZ0RzcobyQcm9eax0XQ2BJfh58oT2m14ClnHBww0s0K5RtmdjnabhXS4Cnlp6ov/d+pJOoLYwgUutB1mN+my8jn8PoLg1eGhSXp0ByPxGYkRi6+8VOpC9qZrrXtIK5dQ0NkM4MhAB7Gjs+edW07iv6z4SAM/PjfJtQFT9hMtc3vVnr+A7X6zcsFMxCQX0jGHz/x+BkC5uU9emlOaQMVIdt03nyQfOMuqb8IIh9xKypoD4dunt1aHjsMfj0H6Jjlv/psazD4ifZ7z9UdH7wC5DXOED4j6lBnNlqCwjKGiYAHOLWMmscQRLJLm9siAXX3oZ0Ztt83Di4UgLsLpNbe7Ljakvn7sMX5zrposGJpZPAL1M+Cv3muCAIHLSrprel4i8L7mFkTdIzi9WBV9eKJCxWzzAMHqYV1NqYEhWc2/Ewp1UF2eoaQP/OJHNdHFq98M9Rv77zSw8BOVo0llfEft41d2pTWpfm4P6++DKrfG7TbcoEsUCYXe7sLL/AnFOVINNakWe0+5k0+9EQ1vgfhsY6LqOX4RNtEWTdfweXVosporrR/dr8uYs6orizap74Q4ElhX/tYVRIYYjeTxrARVmrp39ndmMtNKQMk0CSLMmNM2ByYrUo4cu8IPCuIJubAUGsd516FOIgEZ66X782xRaYIwiaQtFqFhFOhvchv9C1PE7jGu0CHXEmX3lo5LNCOELc1FXyxM/vX3odIroH98pc4=
X-Forefront-Antispam-Report: CIP:144.49.247.3; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(186003)(2906002)(47076005)(86362001)(4186021)(82310400003)(478600001)(70206006)(70586007)(36860700001)(6506007)(19627405001)(5660300002)(356005)(224303003)(336012)(81166007)(9686003)(33656002)(7696005)(316002)(26005)(55016002)(110136005)(83380400001)(8936002)(82740400003)(52536014)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 10:45:40.1592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e630bdf-aeb9-444e-fbc8-08d960a2fd85
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.3];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB7045
X-Proofpoint-ORIG-GUID: 3i6d_oiFWjXcARjLUF2bTkU3uHFMAWE5
X-Proofpoint-GUID: 3i6d_oiFWjXcARjLUF2bTkU3uHFMAWE5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_03:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160066
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

--_000_DM6PR08MB551444C4EAB80473CB576740DCFD9DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHlvdXIgaGludCAoQ09ORklHX0RFQlVHX1BJTkNUUkw9
eSkgdGhhdCBsZXQgbWUgc2VlIHdoZXJlIHRoZSBwYXNzdGhyb3VnaCBzZXR0aW5nIHdhcyBkaXNh
YmxlZC4NCj09PT09PQ0KWyAgIDExLjYzMTA0NF0gYXNwZWVkLWc2LXBpbmN0cmwgMWU2ZTIwMDAu
c3lzY29uOnBpbmN0cmw6IHJlcXVlc3QgcGluIDEyMCAoQUIyMikgZm9yIDFlNzgwMDAwLmdwaW86
MTIwDQpbICAgMTEuNjMxMDY0XSBNdXhpbmcgcGluIDEyMCBmb3IgR1BJTw0KWyAgIDExLjYzMTA3
MV0gRGlzYWJsaW5nIHNpZ25hbCBQV004IGZvciBQV004DQpbICAgMTEuNjMxMDg3XSBXYW50IFND
VTQxQ1sweDAxMDAwMDAwXT0weDEsIGdvdCAweDAgZnJvbSAweDAwMDAwMEMwDQpbICAgMTEuNjMx
MDk0XSBEaXNhYmxpbmcgc2lnbmFsIFRIUlVJTjAgZm9yIFRIUlUwDQpbICAgMTEuNjMxMTAyXSBX
YW50IFNDVTRCQ1sweDAxMDAwMDAwXT0weDEsIGdvdCAweDEgZnJvbSAweDBGMDAwMDAwDQpbICAg
MTEuNjMxMTE4XSBXYW50IFNDVTRCQ1sweDAxMDAwMDAwXT0weDAsIGdvdCAweDAgZnJvbSAweDBF
MDAwMDAwDQpbICAgMTEuNjMxMTI0XSBFbmFibGluZyBzaWduYWwgR1BJT1AwIGZvciBHUElPUDAN
Cj09PT09PQ0KDQpCdXQgc29tZXRoaW5nIHN0cmFuZ2UgaXMgdGhlIGxvZ3Mgc2VlbXMgZnJvbSAi
eDg2LXBvd2VyLWNvbnRyb2wiIHBhY2thZ2UgYmVjYXVzZSBpdCB3b3VsZCBub3QgYXBwZWFyIGFm
dGVyIEkgY29tbWVudGVkIG91dCBwYXJ0aWFsIGNvZGUgYXMgYmVsb3cgaW4gdGhlIHBhY2thZ2Uu
DQpDb3VsZCB5b3Ugb3Igb3RoZXJzIHRlbGwgbWUgd2h5LCBwbGVhc2U/IEkgbWVhbiBkaWQgSSBt
aXNzIGFueSBjb25maWd1cmF0aW9ucyBvciBjb2RlIGNoYW5nZXMgb3IgYW55dGhpbmcgd2hlbiB1
c2luZyB0aGUgIng4Ni1wb3dlci1jb250cm9sIiBwYWNrYWdlPw0KDQojaWYgMCAvL0FkZGVkIGJ5
IENocmlzIGZvciB0ZXN0aW5nDQogICAgLy8gUmVxdWVzdCBQT1dFUl9CVVRUT04gR1BJTyBldmVu
dHMNCiAgICBpZiAoIXBvd2VyQnV0dG9uTmFtZS5lbXB0eSgpKQ0KICAgIHsNCiAgICAgICAgaWYg
KCFyZXF1ZXN0R1BJT0V2ZW50cyhwb3dlckJ1dHRvbk5hbWUsIHBvd2VyQnV0dG9uSGFuZGxlciwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3dlckJ1dHRvbkxpbmUsIHBvd2VyQnV0
dG9uRXZlbnQpKQ0KICAgICAgICB7DQogICAgICAgICAgICByZXR1cm4gLTE7DQogICAgICAgIH0N
CiAgICB9DQogICAgZWxzZQ0KICAgIHsNCiAgICAgICAgcGhvc3Bob3I6OmxvZ2dpbmc6OmxvZzxw
aG9zcGhvcjo6bG9nZ2luZzo6bGV2ZWw6OkVSUj4oDQogICAgICAgICAgICAicG93ZXJCdXR0b24g
bmFtZSBzaG91bGQgYmUgY29uZmlndXJlZCBmcm9tIGpzb24gY29uZmlnIGZpbGUiKTsNCiAgICAg
ICAgcmV0dXJuIC0xOw0KICAgIH0NCiNlbmRpZiAvL0FkZGVkIGJ5IENocmlzIGZvciB0ZXN0aW5n
DQoNCkFub3RoZXIsIGxhc3QgdGltZSBJIGZvcmdvdCB0byBzYXkgdGhhdCBJIGhhdmUgdHJpZWQg
dG8gdXNlICJkZXZtZW0gMHgxZTZlMjRCQyAzMiAweDBGMDAwMDAwIiB0byBzZXQgcGFzc3Rocm91
Z2ggYmFjayBtYW51YWxseSBhbmQgdGhlIHBvd2VyIGJ1dHRvbiB3b3JrcyBmaW5lLiBUaGlzIGlz
IHdoeSBJIHRoaW5rIHRoZSBwYXNzdGhyb3VnaCB3YXMgZ29uZSBhZnRlciB0aGUgc3lzdGVtIGJv
b3RpbmcgdXAuDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCrFIpfOqzDogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4N
CrFIpfOk6bTBOiAyMDIxpn44pOsxNqTpIKRVpMggMDI6MzANCqaspfOqzDogQ2hyaXMgQ2hlbiAo
VFBJKSA8Q2hyaXMuQ2hlbjNAZmxleC5jb20+OyBCaWxscywgSmFzb24gTSA8amFzb24ubS5iaWxs
c0BsaW51eC5pbnRlbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiBbeDg2LXBvd2VyLWNvbnRyb2xdOiBwcmVzcyB0aGUg
cG93ZXIgYnV0dG9uIGZvciBhIGxvbmcgdGltZSB0aGF0IGNhbid0IGZvcmNlIHR1cm4gb2ZmIHN5
c3RlbSBwb3dlcg0KDQpIaSBDaHJpcywNCg0KT24gTW9uLCAxNiBBdWcgMjAyMSwgYXQgMTM6MjIs
IENocmlzIENoZW4gKFRQSSkgd3JvdGU6DQo+IEhpIEphc29uIGFuZCBvdGhlcnMsDQo+DQo+IEkg
dGhpbmsgSSBmaWd1cmVkIG91dCB0aGUgcHJvYmxlbSBpcyB0aGUgR1BJT1AwIGFuZCBHUElPUDEg
cGFzc3Rocm91Z2gNCj4gd2FzIG5vdCBzZXQgYWZ0ZXIgc3lzdGVtIGJvb3RpbmcgdXAuIEhvd2V2
ZXIsIGFzIEkgbWVudGlvbmVkIHdoZW4NCj4gcmlzaW5nIHRoZSBxdWVzdGlvbiwgSSBoYXZlIGFs
cmVhZHkgc2V0IEdQSU9QMCBhbmQgUDEgcGFzc3Rocm91Z2ggaW4NCj4gdS1ib290LCBpdCBmb3Ig
bm93IGxvb2tzIGxpa2Ugd2FzIGJlZW4gdHVybmVkIG9mZiBkdXJpbmcgS2VybmVsIG9yDQo+IE9w
ZW5CTUMgYXBwbGljYXRpb24gcnVubmluZyB1cC4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGNs
dWUgd2h5IHRoZQ0KPiBHUElPIHBhc3N0aHJvdWdoIHdvdWxkIGJlIHR1cm5lZCBvZmYgb3Igd2hl
cmUgc2hvdWxkIEkgbmVlZCB0byBhZGQNCj4gcGFzc3Rocm91Z2ggc2V0dGluZyBhZ2Fpbj8NCj4N
Cg0KSWYgdGhlIGtlcm5lbCBpcyBkaXNhYmxpbmcgaXQgeW91IG1pZ2h0IGJlIGFibGUgdG8gZmlu
ZCB0aGUgY2F1c2Ugd2l0aA0KQ09ORklHX0RFQlVHX1BJTkNUUkw9eSBhbmQgdGhlIHBpbmN0cmwg
YXR0cmlidXRlcyBpbiBkZWJ1Z2ZzLiBIYXZpbmcNCnNhaWQgdGhhdCwgdGhlIHVwc3RyZWFtIGtl
cm5lbCBoYXNuJ3QgYmVlbiB0YXVnaHQgYWJvdXQgU0NVNTEwWzI4XSBvbg0KdGhlIDI2MDAsIHNv
IGlmIGl0IGlzIHRvdWNoaW5nIGl0IHRoZW4gaXQncyBkb2luZyBzbyB2aWEgb3V0LW9mLXRyZWUN
CnBhdGNoZXMuDQoNCkFuZHJldw0KCkxlZ2FsIERpc2NsYWltZXIgOgpUaGUgaW5mb3JtYXRpb24g
Y29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50
aWFsLiAKSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9y
IGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCAKb3IgYnkgdGhlaXIgZGVzaWduZWUuIElm
IHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCAKeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2Fn
ZSwgaW4gYW55IGZvcm0sIAppcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIApwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRo
ZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2FnZSEK

--_000_DM6PR08MB551444C4EAB80473CB576740DCFD9DM6PR08MB5514namp_
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
Hi Andrew,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your hint (CONFIG_DEBUG_PINCTRL=3Dy) that let me see where the p=
assthrough setting was disabled.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[ &nbsp; 11.631044] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin =
120 (AB22) for 1e780000.gpio:120
<div>[ &nbsp; 11.631064] Muxing pin 120 for GPIO</div>
<div>[ &nbsp; 11.631071] Disabling signal PWM8 for PWM8</div>
<div>[ &nbsp; 11.631087] Want SCU41C[0x01000000]=3D0x1, got 0x0 from 0x0000=
00C0</div>
<div>[ &nbsp; 11.631094] Disabling signal THRUIN0 for THRU0</div>
<div>[ &nbsp; 11.631102] Want SCU4BC[0x01000000]=3D0x1, got 0x1 from 0x0F00=
0000</div>
<div>[ &nbsp; 11.631118] Want SCU4BC[0x01000000]=3D0x0, got 0x0 from 0x0E00=
0000</div>
[ &nbsp; 11.631124] Enabling signal GPIOP0 for GPIOP0<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"margin:0px;font-size:12pt">=3D=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
But something strange is the logs seems from <span style=3D"background-colo=
r:rgb(255, 255, 255);display:inline !important">
&quot;x86-power-control&quot; package&nbsp;</span>because it would not appe=
ar after I commented out partial code
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">as below in the package.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 1=
2pt; background-color: rgb(255, 255, 255); display: inline !important;">Cou=
ld you or others tell me why, please?
 I mean did I miss any configurations or code changes or anything when usin=
g the &quot;x86-power-control&quot; package?</span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">
<div style=3D"color:#d4d4d4;background-color:#1e1e1e;font-family:'Droid San=
s Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight:normal;f=
ont-size:14px;line-height:19px">
<span><span style=3D"color:#c586c0">#if</span><span style=3D"color:#569cd6"=
>&nbsp;</span><span style=3D"color:#b5cea8">0 //Added by Chris for testing<=
/span></span>
<div><span style=3D"color:#6a9955">&nbsp; &nbsp; // Request POWER_BUTTON GP=
IO events</span></div>
<div><span>&nbsp; &nbsp; </span><span style=3D"color:#c586c0">if</span><spa=
n>&nbsp;(!</span><span style=3D"color:#9cdcfe">powerButtonName</span><span>=
.</span><span style=3D"color:#dcdcaa">empty</span><span>())</span></div>
<div><span>&nbsp; &nbsp; {</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"color:#c586c0"=
>if</span><span>&nbsp;(!</span><span style=3D"color:#dcdcaa">requestGPIOEve=
nts</span><span>(powerButtonName, powerButtonHandler,</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;powerButtonLine, powerButton=
Event))</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; {</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"=
color:#c586c0">return</span><span>&nbsp;-</span><span style=3D"color:#b5cea=
8">1</span><span>;</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
<div><span>&nbsp; &nbsp; }</span></div>
<div><span>&nbsp; &nbsp; </span><span style=3D"color:#c586c0">else</span></=
div>
<div><span>&nbsp; &nbsp; {</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"color:#4ec9b0"=
>phosphor</span><span>::</span><span style=3D"color:#4ec9b0">logging</span>=
<span>::</span><span style=3D"color:#dcdcaa">log</span><span>&lt;</span><sp=
an style=3D"color:#4ec9b0">phosphor</span><span>::</span><span style=3D"col=
or:#4ec9b0">logging</span><span>::</span><span style=3D"color:#4ec9b0">leve=
l</span><span>::</span><span style=3D"color:#4ec9b0">ERR</span><span>&gt;(<=
/span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"=
color:#ce9178">&quot;powerButton name should be configured from json config=
 file&quot;</span><span>);</span></div>
<div><span>&nbsp; &nbsp; &nbsp; &nbsp; </span><span style=3D"color:#c586c0"=
>return</span><span>&nbsp;-</span><span style=3D"color:#b5cea8">1</span><sp=
an>;</span></div>
<div><span>&nbsp; &nbsp; }</span></div>
<span><span style=3D"color:#c586c0">#endif&nbsp;<span style=3D"color:rgb(18=
1, 206, 168);background-color:rgb(30, 30, 30);display:inline !important">//=
Added by Chris for testing</span></span></span></div>
</span></div>
</div>
<div><font face=3D"Calibri, Helvetica, sans-serif"><br>
</font></div>
<div><font face=3D"Calibri, Helvetica, sans-serif">Another, last time I for=
got to say that I have tried to use &quot;devmem 0x1e6e24BC 32 0x0F000000&q=
uot; to set passthrough back manually and the power button works fine. This=
 is why I think the passthrough was gone after
 the system booting up.</font></div>
<div><font face=3D"Calibri, Helvetica, sans-serif"><br>
</font></div>
<div><font face=3D"Calibri, Helvetica, sans-serif">Regards,</font></div>
<div><font face=3D"Calibri, Helvetica, sans-serif">Chris Chen<br>
</font><span style=3D"font-family: Calibri, Helvetica, sans-serif;"></span>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Andrew Je=
ffery &lt;andrew@aj.id.au&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~8=A4=EB16=A4=E9 =A4U=A4=C8 02:30<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; B=
ills, Jason M &lt;jason.m.bills@linux.intel.com&gt;; openbmc@lists.ozlabs.o=
rg &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [x86-power-control]: press the power button for a lo=
ng time that can't force turn off system power</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">Hi Chris,<br>
<br>
On Mon, 16 Aug 2021, at 13:22, Chris Chen (TPI) wrote:<br>
&gt; Hi Jason and others,<br>
&gt; <br>
&gt; I think I figured out the problem is the GPIOP0 and GPIOP1 passthrough=
 <br>
&gt; was not set after system booting up. However, as I mentioned when <br>
&gt; rising the question, I have already set GPIOP0 and P1 passthrough in <=
br>
&gt; u-boot, it for now looks like was been turned off during Kernel or <br>
&gt; OpenBMC application running up. Can you please give me a clue why the =
<br>
&gt; GPIO passthrough would be turned off or where should I need to add <br>
&gt; passthrough setting again?<br>
&gt; <br>
<br>
If the kernel is disabling it you might be able to find the cause with <br>
CONFIG_DEBUG_PINCTRL=3Dy and the pinctrl attributes in debugfs. Having <br>
said that, the upstream kernel hasn't been taught about SCU510[28] on <br>
the 2600, so if it is touching it then it's doing so via out-of-tree <br>
patches.<br>
<br>
Andrew<br>
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

--_000_DM6PR08MB551444C4EAB80473CB576740DCFD9DM6PR08MB5514namp_--
