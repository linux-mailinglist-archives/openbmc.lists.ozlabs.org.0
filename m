Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E313F0240
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 13:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqQ9K0kR4z3bhl
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 21:07:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=DGlE/ky7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=2864f39059=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=DGlE/ky7; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqQ8q1Ph5z30DH
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 21:07:21 +1000 (AEST)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IB27Gk020265; Wed, 18 Aug 2021 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=mk/3pN1BqL9zhqx9J46GYxMgAGruY7RlfVe6S8IBJp8=;
 b=DGlE/ky7P8nMrbenE5eh5Kvb2GU2vUwO750zmorl5b0fCw7R0lRBtXJjL6Z9Dkz2L71z
 zXl7wnza1AN6DYytDDwhmg4lflxeLYCeBkwXvK+T98WB7Py0HQsWjtNZhAQUOBZnxqhH
 5O6d7c9x7GcYjyI62EQg3nMN6prkzNucxJVDgm6mKQLZ2rh9+R0R/OQWJnBDDlJFOJ/1
 tNu/aC/9n2V7PSa2wic6fR3tWRCDQrOEG/oAh3TXGvEAkwSNdVcKYPmUcZkOhf0w/TuZ
 4tjIyykdrF9/qNd2KhPtXWVHM3aS6EKYSswUnuwZqwp1gnpndUS/A3FweDkok7nOhoKA pg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by mx07-002d6701.pphosted.com with ESMTP id 3agrxg2k9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 11:07:11 +0000
Received: from BN9PR03CA0608.namprd03.prod.outlook.com (2603:10b6:408:106::13)
 by BL0PR08MB5265.namprd08.prod.outlook.com (2603:10b6:208:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 11:07:09 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::68) by BN9PR03CA0608.outlook.office365.com
 (2603:10b6:408:106::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 11:07:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.3)
 smtp.mailfrom=flex.com; aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=144.49.247.3; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.3) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 18 Aug 2021 11:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJAsczC6N9qZj/Inu+6NBgmodBhWYBW97MM48hhC/dMvW+lxIJpTUroomUS3JpZYbDLQRC6kPdJQ3P/F/AMDs86EjVjSAgcdEYcfEXldNro4i+s/3ulZ44G9ydkCrREQ9wCipM9zntK5ZpF8iF0FV4y6hYwVDtWLCFoGWfhbzPWEpcDSh6KLZ2a3hST0NAHMV9YSqMRRhmSd9wNbElZ36UQCoku+b8VdOI3bTOpfgu9oC5YaPdVlu9UHg9oTopojjBaCHrrBIlxzyZ2gpnlFlWfXR4xs2X9FDSB3O3Zn/iyP3YmGComw3mMcprPJpK9ndwXjzYjeZYMcId4ELzpD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krsMCyi0uk8LoHR9V8Oi8MbHgKKA3cvyoMMvRg/EIUo=;
 b=cmL4yzuJIxJuxP5iKEYzrcBBaqJLcqg8kFXnRA+fBdj7tLHIvqQo0J5kM59xYXqrgp7D6YCtCtnmWfNB2ep6W8edTJPhFxnhSln7xEorjUG3bbJuc0DoGirGnRKh7JBOxPY31woW+8tUIA/iP+TSTh1f9auQAhcpTtQUkidzpcqTyYSlHALK7SpUb8XNn6LYeqJFZbwXjSpL0H+KqH+vv+taykoFhq8RQEe6DfgOSRnRDqPrzsakX3eUg1jkuo7EYKH0+NBc39NDXJNA9CYiQHsSCJp+FM1rP7OMeUNspxBZX0gurtlBsz+RHPE4sG8yJi/Mb8pJHQxVto6B5re+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB2681.namprd08.prod.outlook.com (2603:10b6:3:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 11:07:07 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 11:07:07 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrew Jeffery <andrew@aj.id.au>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0DogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhlIHBvd2VyIGJ1dHRv?=
 =?big5?B?biBmb3IgYSBsb25nIHRpbWUgdGhhdCBjYW4ndCBmb3JjZSB0dXJuIG9mZiBzeXN0?=
 =?big5?Q?em_power?=
Thread-Topic: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
Thread-Index: AQHXkmhH5ZD2Fz+Ed0uVX3qFyM9Mfqt17RpVgAEEj4CAAJA2UIAAEAGAgAB+24CAAQu/RQ==
Date: Wed, 18 Aug 2021 11:07:07 +0000
Message-ID: <DM6PR08MB55140245266AADC189348568DCFF9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
 <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
 <DM6PR08MB5514BD820BCA7BCD3B810BFDDCFE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <66823be3-bf61-4d1d-8dd8-6798f51dd701@www.fastmail.com>
 <8de9006c-a45a-4a24-0afa-c99ced621080@linux.intel.com>
In-Reply-To: <8de9006c-a45a-4a24-0afa-c99ced621080@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c581e492-df4a-4892-ecd1-08d962385275
x-ms-traffictypediagnostic: DM5PR08MB2681:|BL0PR08MB5265:
X-Microsoft-Antispam-PRVS: <BL0PR08MB5265185A83D5DFAD3BE4B5A1DCFF9@BL0PR08MB5265.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P8bFjkvwKDbm96VTD7l/NXLORwK9vXvoK14KonCypdnowBDGANpcaoOjVeUDXBF8YleoGxQVqJvdqYRqS92DDWwpnwNiub7Q8lugadoTrekarWLA7mG0MwymOJ8b/dM5GDXsUu0TYZXdk4ZCWS93OVaec7C6hVn/P4ox40BZGN1sdkfY3QIeuzMUXtjFIJZ2eICVxG0RY/SuLY/NRT7lSyptEGOWXtbE69qkm2wf74e0HkbPB1KCEkuyLeunb+KDn7sS6cxV61Urd+k85pekiekRyOOm7GLpTmsaSPSma5Jx6P6EJLNix53mpRCncT+DkQ5ZjzteJ4cVXySy8+7+odm17NA8eAvRaPwYgaUVLmGVhuRKFKcwErMrw3Rbr/Y4nzVwKX4jKCXbmFjMvDO6Zy4wjCpc6EVW3TxznOz0HOiXYmxvI4g3E4g+hFtvaKLaZFgeojPfy0CnP5UMl05YRS3GS5C8DwcH86JBdERiKRrjVCJzdqyO7SoIaXn6Igdb/MOI2a9KMWI7MEQAL0i+wHdn/gS4qofp+LIJN4XK7kxMGjoASH+GvXxJGbAOPZ6+vi59VvsRh8W1pB4c3TD45VrH1sV1xsr9DgbRQ7OMjL49hzVTT3anaupJW7RbeJ698cNqDfpRxzfMoCILgE1+ziSp9jUmgF3Y4MYRkXmT/t64orF7/4rhnvvUuu/SQt+h8JEWn8KdNfzTiEpyU6Zn24mSWvD0OEz6UyX3fyMeVM2CTMLff0M4RJo5wHKX2Prz+BLzx4q9fBdVTRHJpQl8jKWutiCXNd81KM8oPz4SgDU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(396003)(136003)(166002)(52536014)(66946007)(7696005)(66476007)(66556008)(66446008)(76116006)(38100700002)(64756008)(83380400001)(2906002)(122000001)(966005)(71200400001)(110136005)(224303003)(316002)(86362001)(5660300002)(91956017)(19627405001)(186003)(38070700005)(8936002)(9686003)(33656002)(478600001)(55016002)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?N2NWL3RFQVNOM0NtSW1vMGRtUGdSdmd0YjNWYmtwQmtsME82cTlSNlVzTUUzRVpa?=
 =?big5?B?QW9EMlhWOC9lcmtCRjN5S01ZaWd1V2x0Skg1TzdsU3IvS1AwWWhya05RWDNOMzRC?=
 =?big5?B?eVZjZHh0U3dqNmw2QkRjZS9zNGdUVkliU2gwekJ5RjROSElGNDlFOVBJaVdTY1BM?=
 =?big5?B?SS9NTG9hWEs2OEgyRlg5MCtFWVU1SUdxdVFETlRvbDZYalR1MWlycno2Y05YRlhh?=
 =?big5?B?RXpqZHR6YkpzQlBUVE12cyt4V1hIR1JjUmFweHJmcDVOTjg4eC9Jb21CcFBLdllp?=
 =?big5?B?TWhOTFBBbjlRZmhBdURBR2pjclNsUHNXQnNwY3RFRkVlaXhrWmdkVDZnR0xKQXJl?=
 =?big5?B?bmppeVBlaU05TjBYN1hXem51cmVSdE5uWlIxRlFnbTR0aGRhWFo3NDZFTklzVHd1?=
 =?big5?B?N2E2UnhGT0syR2ZodkUxTWFtMHRobEd6VlhZUTduWkFvSmo1Wm4weUlLRE53QWhi?=
 =?big5?B?ZS81RGRzMTU0Y0JFUjB0VFlESmhlNUpiY1RoTXk4NlZ1NkQzU3pHZS85cHJRSUpy?=
 =?big5?B?M05reStpVkhsZ3lBYzZnN25VbktlQmVmWklDYmRSdmlIWGdNb25DT3VzLy9FK1JC?=
 =?big5?B?V205SmpSZ2hzeFdZem5xRGFDYjdjL0plY29oWm5DRHdvbDZkQ0xVQVZRME5oS01P?=
 =?big5?B?WFliQmxROUEvSEFFakdueUV2WFdnT3p1cm9xNWJRSGcxeU0ycytZaElNUVVlU2hi?=
 =?big5?B?cWRtemw0L1pjV0JHa2lqVkNMZHl3aExVUXcyb28wc1N5WTE0YVVBeGJreG95bmtk?=
 =?big5?B?UXdIaFhYNzlmdHB1MjRHdzV4Mys4aUZVcnZCSXhpeitIaER6NDZyQkswUjBFaWpW?=
 =?big5?B?UFlMVFZybFVZazRPT3R6bjh4M0ZFeSt6R0tsY05XQTNkRE11NU91aDkxbFNYREZH?=
 =?big5?B?NDhoQmxLT29LeUVmLzdpc1dONlR1MkNVMGVuUEU5L25iTzI3OVNFWXpmOUdFclE5?=
 =?big5?B?SnN5OUZGYTZKMTRDWFpRYysyUGdKQ1pURnd0MUZnRVZtb3BHYU5NL080NVk4cjNu?=
 =?big5?B?TVRHeXlrUkRXRitiTVdsTDQ0MS9sZFFIUjJOMWNXYzhQK0drM0xiQlY4K3BzRkF4?=
 =?big5?B?eTF2SXVPTS8xUzdaYy9wRmxXR1BmeHhOVzZ3UHhBdlBXbEw1bmRDbkhvdDhiVkhj?=
 =?big5?B?VmpPcE1DdTQvdS9PRW9DSnhpZDgzZkVsNzNHS2F6T1lwWlhPTmdkd2I4R0JzeHpk?=
 =?big5?B?dzdIMGxIcXJjMUxCZlZjbmJ4LzFTZWdKRE9KRVloS2tjdWFWWGJPNDBNZGQ1bkRU?=
 =?big5?B?UjhMM042czlPNjQ4ZXhsZzVIZU16SG51cE5aOXRtZGptVSswQkQwVklvU2VOU3Nl?=
 =?big5?B?ZHFEaXZaWitBTVc1M2xJaEZhamVrMUJPSFNPUjByRzFzS0d3ZXh1Yzl1ajZXbHFI?=
 =?big5?B?S3hlSU1FVDNVejFVSHBkSWRiTjYzZDI3L1pzT0o5L0w0RGcyR2IvcVl1aTFmeU43?=
 =?big5?B?Ky9nM043cTl5dzBnOWg2NVJYekd1c2dIczRrL2dBMU1idjFrdHVKdXE3U2VMd01P?=
 =?big5?B?azVWWTdKcVNxUytjK2c5ZE02a282WTgzWlpGU2t2cWNmcVZVR1VRZTBHTzlsci9y?=
 =?big5?B?Uk43OXpNSGg2MW9jZ3Z1bmJNSVNsU3RCOU1jU2dLZGJsNVY5N2F5NnROOUg5UVpu?=
 =?big5?B?SEZ5SjIzV29aRGk1U3RQQzk2MFV2elZBckJOVnQvWkN1b1FNTCtFdHg3elErY0Vr?=
 =?big5?B?RWpyeUZPbU9rY2FNWXZTeC83NG9XOS9PeStZQ0hERzdaWFBweGFGN3l5VER4ZHE5?=
 =?big5?Q?673pUIo+3CYtpknO?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55140245266AADC189348568DCFF9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2681
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7a290155-2094-481d-57cf-08d96238514d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8gxIEr68Xc9SC0vih9ZdswbjRUIK19gQqqMOm0CvZ3SAoqCjUyoYmnlEY5/rjRyGS9hAGuUJkkTzxfrpHPq0dNNyUcUQUcJ2rGm+6rtJmtFQGgZAQCJQbNlwDq97V9JF81NauKgaMYreslb4IAYbAxl2qGRtl52cUqBqGNbT24qLPDsFyD6H2vlaPly4SMpofTUSzeIToiMkAbnCYQ30dmi/67Un/t746qqzY8w9obS9RW/H6mlLFiPjH1RppMDbhiRMxF/Ygk2x0+9a+Nd8HkFNFme9V9Mr7PrxsVV4FT4Q0nsS2K1FMbPFq7Wf0nrBtrlc6fLM04JwSZKYk0jCGBBR4lsgYyihrwtQ88goVFe4o0oYSRJQUxIPcsutqQ9iAnbGklC4PQrUS/yqcOMcAhvcHgowvDAUGGk0FHRsYpTPYx6cB/h0h7aMfAetpLNA98mXcWcllNJrlC1b/lyOtgen8ku2mJgbaS7/QLYqr+nuh3MvqDZkmtyEUhTWK9ylTjV+hN1nfcYSieM4pdJ/oGgvHxwZilc7+n8vEqUoZB8WPcH9eOwC9DdmvtHOVeqpRk6DkjUgAgliFo99JYoBj0ncVZz8Wv3bZTJStQHcAXisoonBdE2smEEDCLqm8LgIDUNo7LWSLqlatyUxGB2mukA8xtGFDPEU2fa9OGVNKKqq0o89zWOQLbCJGapFXwfuB2asWgTDZTMDGRoC51nUJ43VtH7WYWHNYQViZmNfnY8i7114fEE669b3wPOuzt/bMiTYwtSN9OE/W+lAiM6j22ZNRNrw7kLne+0j1yVvtUuzzmY0x73/GNTkXdS71c/
X-Forefront-Antispam-Report: CIP:144.49.247.3; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(966005)(7696005)(110136005)(5660300002)(508600001)(36860700001)(33656002)(52536014)(47076005)(19627405001)(53546011)(4186021)(6506007)(9686003)(83380400001)(316002)(2906002)(70206006)(186003)(82310400003)(81166007)(356005)(26005)(224303003)(86362001)(55016002)(8936002)(336012)(166002)(70586007)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 11:07:08.8347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c581e492-df4a-4892-ecd1-08d962385275
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.3];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB5265
X-Proofpoint-ORIG-GUID: 3CKu_RD_ujELQMisltndfXqDhpEwuRji
X-Proofpoint-GUID: 3CKu_RD_ujELQMisltndfXqDhpEwuRji
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_03:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180069
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

--_000_DM6PR08MB55140245266AADC189348568DCFF9DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgQW5kcmV3LA0KDQpVbmRlcnN0b29kLiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uDQoN
Cg0KSGkgSmFzb24sDQoNCkkgd2lsbCB0YWtlIGl0IGEgc2hvdC4gVGhhbmtzIGZvciB5b3VyIHNo
YXJpbmcuDQoNCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQqxSKXzqsw6IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytjaHJpcy5jaGVuMz1m
bGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiClTqrtIEJpbGxzLCBKYXNvbiBNIDxqYXNvbi5tLmJp
bGxzQGxpbnV4LmludGVsLmNvbT4NCrFIpfOk6bTBOiAyMDIxpn44pOsxOKTpIKRXpMggMDM6MDQN
CqaspfOqzDogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+DQqlRKauOiBSZTogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhlIHBvd2VyIGJ1dHRv
biBmb3IgYSBsb25nIHRpbWUgdGhhdCBjYW4ndCBmb3JjZSB0dXJuIG9mZiBzeXN0ZW0gcG93ZXIN
Cg0KDQoNCk9uIDgvMTcvMjAyMSA1OjMwIEFNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4gSGkg
Q2hyaXMsDQo+DQo+IE9uIFR1ZSwgMTcgQXVnIDIwMjEsIGF0IDIwOjQ3LCBDaHJpcyBDaGVuIChU
UEkpIHdyb3RlOg0KPj4gSGkgQW5kcmV3LA0KPj4NCj4+IFRoYXQgbWVhbnMgSSdtIGFibGUgdG8g
Y2hvb3NlIG9uZSBvZiBmb2xsb3dpbmcgMiBvcHRpb25zIHRvIGFjaGlldmUNCj4+IHBhc3MtdGhy
b3VnaCBiZWhhdmlvciB3aGVuIEkgdXNpbmcgeDg2LXBvd2VyLWNvbnRyb2wgcGFja2FnZSwgaXMg
bXkNCj4+IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8NCj4+DQo+PiAxLiBBZGQgY29kZSB0byByZS1l
bmFibGUgR1BJT1AwIGFuZCBHUElPUDEgaW50byBhIHBhc3MtdGhyb3VnaCBmdW5jdGlvbg0KPj4g
YWZ0ZXIgdGhleSBhcmUgcmVxdWVzdGVkIGFzIGEgR1BJTyBmdW5jdGlvbiBpbiB0aGUgeDg2LXBv
d2VyLWNvbnRyb2wNCj4+IHBhY2thZ2UuIChPciBtYXliZSB0byBjcmVhdGUgYSBzY3JpcHQgd2l0
aCAiZGV2bWVtID4gMHgxZTZlMjRCQyAzMg0KPj4gMHgwRjAwMDAwMCIgY29tbWFuZCB0aGF0IHdp
bGwgYmUgcnVuIGF1dG9tYXRpY2FsbHkgYWZ0ZXIgc3lzdGVtIHVwIHRvDQo+PiBjaGFuZ2UgcmVn
aXN0ZXIgZGlyZWN0bHkuKQ0KPg0KPiBUaGlzIGlzIGEgaGFjayBhbmQgc2hvdWxkIGJlIGEgbGFz
dCByZXNvcnQuIEV2ZW4gdGhlbiBJJ2QgYXZvaWQgaXQuDQo+DQo+IENlcnRhaW5seSB5b3Ugc2hv
dWxkIGF2b2lkIHNoaXBwaW5nIHdpdGggL2Rldi9tZW0gZW5hYmxlZC4NCj4NCj4+DQo+PiAyLiBN
b2RpZnkgcGluY3RybCBpbiBLZXJuZWwgdGhhdCB3aWxsIG5vdCBkaXNhYmxlIEdQSU9QMCBhbmQg
R1BJT1AxJ3MNCj4+IHBhc3MtdGhyb3VnaCBmdW5jdGlvbiBpZiB0aGV5IGFscmVhZHkgYXJlIGNv
bmZpZ3VyZWQgYXMgYSBwYXNzLXRocm91Z2gNCj4+IHdoZW4gdGhleSBhcmUgcmVxdWVzdGluZyBh
cyBhIEdQSU8gZnVuY3Rpb24uDQo+DQo+IFBlcmhhcHMsIHRob3VnaCBtYXliZSB5b3Ugc2hvdWxk
IGZvbGxvdyB1cCBvbiB3aGV0aGVyIHlvdSBjYW4gZHJpdmUNCj4gR1BJT1AxIHdoZW4gaXQncyBp
biBwYXNzLXRocm91Z2ggbW9kZS4gTXkgcmVjb2xsZWN0aW9uIGlzIHlvdSBjYW5ub3QsDQo+IGF0
IGxlYXN0IGZvciB0aGUgQVNUMjUwMCBhbmQgZWFybGllciwgaW4gd2hpY2ggY2FzZSBib3RoIFAw
IGFuZCBQMSBhcmUNCj4gZWZmZWN0aXZlbHkgaW5wdXRzIGZvciB0aGUgcHVycG9zZSBvZiB0aGUg
R1BJTyBjb250cm9sbGVyIGRlc3BpdGUgUDENCj4gYmVpbmcgYSBwaHlzaWNhbCBvdXRwdXQuIFRo
aXMgYmVoYXZpb3VyIGlzIHByb2JhYmx5IG1vcmUgY29uZnVzaW5nIHRoYW4NCj4gaXQgaXMgaGVs
cGZ1bC4NCj4NCj4gVGhlcmUncyBhbHNvIG9wdGlvbiAzIHdoaWNoIGlzIHRvIGVtdWxhdGUgdGhl
IHBhc3MtdGhyb3VnaCBpbiBzb2Z0d2FyZSwNCj4gYXMgSSBvdXRsaW5lZCBpbiBteSBwcmV2aW91
cyBlbWFpbC4NClRoaXMgaXMgc29tZSBvZiB0aGUgY29uZmlndXJhdGlvbiB0aGF0IEkgaGF2ZSBv
biBteSBzeXN0ZW0gd2hlcmUgdGhlDQpwYXNzLXRocm91Z2ggaXMgd29ya2luZyBjb3JyZWN0bHkg
aW4geDg2LXBvd2VyLWNvbnRyb2w6DQoNCkkgaGF2ZSBvbmUga2VybmVsIHBhdGNoIHRoYXQgc2Vs
ZWN0cyB0aGUgInBhc3MtdGhyb3VnaCIgcGluDQpjb25maWd1cmF0aW9uIG9uIHN0YXJ0dXA6DQpo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9s
aW51eC9jb21taXQvOGZlMWFjMzFjMTNhMGU4NDQzYzY2NTM5NDExMmJhNDA3YzkwYWU3MF9fOyEh
SFNudGxDZyFFcF9JV0ZJNmRIcVRBRnNEd0xZb0owSllsM1Bqc0UyaGNFSlFGSWtOdDFuRGdITDlQ
dkpFQVdNbURXdEU0YXoxJCAuDQoNCkluIHg4Ni1wb3dlci1jb250cm9sLCBJIGhhdmUgdGhlIFBP
V0VSX0JVVFRPTiBHUElPIG1hcHBlZCB0byBHUElPUDIsIGFuZA0KSSdtIGFibGUgdG8gY2xhaW0g
YW5kIG1vbml0b3IgdGhhdCBHUElPIHdpdGhvdXQgYWZmZWN0aW5nIHRoZQ0KcGFzcy10aHJvdWdo
IHN0YXR1cy4NCg0KSSBoYXZlIFBPV0VSX09VVCBtYXBwZWQgdG8gR1BJT1AzIHdoaWNoIGNhbm5v
dCBiZSBoZWxkIGluDQp4ODYtcG93ZXItY29udHJvbCBhcyBpdCBkaXNhYmxlcyB0aGUgcGFzcy10
aHJvdWdoIHdoZW4gY2xhaW1lZC4gIFNvLCBpdA0KaXMgYWx3YXlzIHJlbGVhc2VkIGFmdGVyIHRo
ZSBwb3dlci1jb250cm9sIGFjdGlvbiBpcyBjb21wbGV0ZWQuDQoNClRoYW5rcywNCi1KYXNvbg0K
DQo+DQo+IEhvcGUgdGhhdCBoZWxwcywNCj4NCj4gQW5kcmV3DQo+DQoKTGVnYWwgRGlzY2xhaW1l
ciA6ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIG1heSBiZSBwcml2
aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuIApJdCBpcyBpbnRlbmRlZCB0byBiZSByZWFkIG9ubHkg
YnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQgaXMgYWRkcmVzc2VkIApvciBi
eSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMgbm90IHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQsIAp5b3UgYXJlIG9uIG5vdGljZSB0aGF0IGFueSBkaXN0cmli
dXRpb24gb2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwgCmlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBpbiBlcnJvciwgCnBsZWFzZSBp
bW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIG9yIGRlc3Ryb3kgYW55IGNv
cHkgb2YgdGhpcyBtZXNzYWdlIQo=

--_000_DM6PR08MB55140245266AADC189348568DCFF9DM6PR08MB5514namp_
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
Understood. Thanks for your explanation.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Jason,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I will take it a shot. Thanks for your sharing.</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
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
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED B=
ills, Jason M &lt;jason.m.bills@linux.intel.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~8=A4=EB18=A4=E9 =A4W=A4=C8 03:04<br>
<b>=A6=AC=A5=F3=AA=CC:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [x86-power-control]: press the power button for a lo=
ng time that can't force turn off system power</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText"><br>
<br>
On 8/17/2021 5:30 AM, Andrew Jeffery wrote:<br>
&gt; Hi Chris,<br>
&gt; <br>
&gt; On Tue, 17 Aug 2021, at 20:47, Chris Chen (TPI) wrote:<br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;<br>
&gt;&gt; That means I'm able to choose one of following 2 options to achiev=
e<br>
&gt;&gt; pass-through behavior when I using x86-power-control package, is m=
y<br>
&gt;&gt; understanding correct?<br>
&gt;&gt;<br>
&gt;&gt; 1. Add code to re-enable GPIOP0 and GPIOP1 into a pass-through fun=
ction<br>
&gt;&gt; after they are requested as a GPIO function in the x86-power-contr=
ol<br>
&gt;&gt; package. (Or maybe to create a script with &quot;devmem &gt; 0x1e6=
e24BC 32<br>
&gt;&gt; 0x0F000000&quot; command that will be run automatically after syst=
em up to<br>
&gt;&gt; change register directly.)<br>
&gt; <br>
&gt; This is a hack and should be a last resort. Even then I'd avoid it.<br>
&gt; <br>
&gt; Certainly you should avoid shipping with /dev/mem enabled.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; 2. Modify pinctrl in Kernel that will not disable GPIOP0 and GPIOP=
1's<br>
&gt;&gt; pass-through function if they already are configured as a pass-thr=
ough<br>
&gt;&gt; when they are requesting as a GPIO function.<br>
&gt; <br>
&gt; Perhaps, though maybe you should follow up on whether you can drive<br>
&gt; GPIOP1 when it's in pass-through mode. My recollection is you cannot,<=
br>
&gt; at least for the AST2500 and earlier, in which case both P0 and P1 are=
<br>
&gt; effectively inputs for the purpose of the GPIO controller despite P1<b=
r>
&gt; being a physical output. This behaviour is probably more confusing tha=
n<br>
&gt; it is helpful.<br>
&gt; <br>
&gt; There's also option 3 which is to emulate the pass-through in software=
,<br>
&gt; as I outlined in my previous email.<br>
This is some of the configuration that I have on my system where the <br>
pass-through is working correctly in x86-power-control:<br>
<br>
I have one kernel patch that selects the &quot;pass-through&quot; pin <br>
configuration on startup: <br>
<a href=3D"https://urldefense.com/v3/__https://github.com/Intel-BMC/linux/c=
ommit/8fe1ac31c13a0e8443c665394112ba407c90ae70__;!!HSntlCg!Ep_IWFI6dHqTAFsD=
wLYoJ0JYl3PjsE2hcEJQFIkNt1nDgHL9PvJEAWMmDWtE4az1$">https://urldefense.com/v=
3/__https://github.com/Intel-BMC/linux/commit/8fe1ac31c13a0e8443c665394112b=
a407c90ae70__;!!HSntlCg!Ep_IWFI6dHqTAFsDwLYoJ0JYl3PjsE2hcEJQFIkNt1nDgHL9PvJ=
EAWMmDWtE4az1$</a>
 .<br>
<br>
In x86-power-control, I have the POWER_BUTTON GPIO mapped to GPIOP2, and <b=
r>
I'm able to claim and monitor that GPIO without affecting the <br>
pass-through status.<br>
<br>
I have POWER_OUT mapped to GPIOP3 which cannot be held in <br>
x86-power-control as it disables the pass-through when claimed.&nbsp; So, i=
t <br>
is always released after the power-control action is completed.<br>
<br>
Thanks,<br>
-Jason<br>
<br>
&gt; <br>
&gt; Hope that helps,<br>
&gt; <br>
&gt; Andrew<br>
&gt; <br>
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

--_000_DM6PR08MB55140245266AADC189348568DCFF9DM6PR08MB5514namp_--
