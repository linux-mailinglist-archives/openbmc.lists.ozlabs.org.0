Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF68332D1A
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:20:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw26R1T5yz3cL1
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:20:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=xLCZBWqg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.137.20;
 helo=mx0b-00154904.pphosted.com; envelope-from=joshua.giles@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=xLCZBWqg; dkim-atps=neutral
X-Greylist: delayed 8318 seconds by postgrey-1.36 at boromir;
 Wed, 10 Mar 2021 04:20:31 AEDT
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2674SCnz3bPZ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 04:20:28 +1100 (AEDT)
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129Evw6v009449; Tue, 9 Mar 2021 10:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=1cPWEbsqqantu1lrxDkSQgHOYj3uj1JTWR4Eu1fmaTw=;
 b=xLCZBWqg/kGUNw5hl4Sjq71IrxC6xZVqyJIHDLMkN2urG2Kz8n09SOAMLCIVTHQjcCY7
 bfFEi34fS734mXrWe6soS13B2L/kozOdI7WD5A1JJgDRtIOitCa+2cWCoRw8HQBdIpAU
 9HMKbNGDY7plEQeLNOrPKv334XsPmI+ekahWBCpfPB1JMREQ77ZIb9/4HquW5veIT3bA
 SkLd9p6MurmCdxefEuBlfXYDvQl4flJTmvZKAB+33+IohuPz3a043BjUxcBCrETlVeuq
 mtmFskC9Y0dOfo1QdPMJ2j78E9o6EApJWkTKYd0llgiJ/SK4Y2ADNHV+VzuA4N6gP/Zy 3g== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 3743q1194c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 10:01:39 -0500
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129F0xUf179145; Tue, 9 Mar 2021 10:01:39 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0a-00154901.pphosted.com with ESMTP id 374r6pg35x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:01:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8Y7jMGkC76hT0ujtVK2eFfGROWVaAOFiDD3MwDsteutm9K+zoCSgtRiNyx9d9t9tp2IPHwsFFPdTixPu52kclel1BPsGJ396/zuGpeTO/GUNW8H09dcjMEDwAWPttqgxb9vdMiWCgHPre8vTNpm/H8x69USKYKMqTmuiuhqMfDBNgYH/ySTT4wr6MXsZG9ti55QpfgY0NNLfOgb9EQtR/xya5K2N6irctNJg57ZNdhgLuypELx6DXYT16x7HCaRn4ch1ooFduiR2LIVmZxJUtwzsz8ayGhVdABiNLZqUJ0+r8tHvnySt4OF5M1FPhuy7+xf0MyCWMppvcc/3szzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cPWEbsqqantu1lrxDkSQgHOYj3uj1JTWR4Eu1fmaTw=;
 b=Hb6qtnuQ0W4hOHnsPvXZCudMGNwj9yN2NRXcan4SFgq6vQiku3CtWU0Xni5zmL2/2CHnQ46xpgAp/fowsOneDtOXgrFhP9fheCDRtSCRZhfQf1EdYN8loYicvqeiwCfIZGgusb4h60FJvoS8kaKYuiBQ57M5W70TwesUcIu/bCUGQzjVfzliXNRm6CD+balat7b4DYJrVF0lYq5HIr7DGBmG7wE61eC9nshJ8ZiWvSNXYwVX0hIl8IECkrGawNEYNq1lQ5iduo/b122zOWOyByMO3vfB3lRdB+UGxzIYBbu6NESSb7kTwM+T1iQPMRRbqupXHbPtIIU8VM8f4sx8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3561.namprd19.prod.outlook.com (2603:10b6:5:1df::25)
 by DM5PR19MB4677.namprd19.prod.outlook.com (2603:10b6:4:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Tue, 9 Mar
 2021 15:01:35 +0000
Received: from DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::4076:5a01:b38f:f6c4]) by DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::4076:5a01:b38f:f6c4%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 15:01:35 +0000
From: "Giles, Joshua" <Joshua.Giles@dell.com>
To: Ed Tanous <edtanous@google.com>
Subject: ObjectMapper & Redfish Update Service: Software.Activation Missing
 (SW Version Mgmt & Image Update)
Thread-Topic: ObjectMapper & Redfish Update Service: Software.Activation
 Missing (SW Version Mgmt & Image Update)
Thread-Index: AdcU9RfwkTp+VM+oRIKXZejr+c5iLw==
Date: Tue, 9 Mar 2021 15:01:35 +0000
Message-ID: <DM6PR19MB3561D5FB2E6B326E1ABD8E8C95929@DM6PR19MB3561.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [108.193.65.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea3c10c6-0828-4053-b762-08d8e30c3bf5
x-ms-traffictypediagnostic: DM5PR19MB4677:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR19MB467791418DD9A729D9A2BB0895929@DM5PR19MB4677.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 01utbAxD448rYWyEJF1ehCC3gE/szHysOHIhtJz5Cvjqx0Qp8EMRkiLs1Eo6oZ3YvBSWKtgdStF0yRaY2X7g1lZd69dO20aLnGw1emH2YxU2llM6yeOtJe52d2EvUsgBGCFYm+BMNdMM1yDZj8saR5HzDIoPurpDV311SCbAQiVk56j7bA5vJKKgxsr8q/kKaDo30tfA4z1Zwxzmtvr1S+qbK+7YfBlKUg0SXV05562OmmrlqTb+2/zKZAKLiGNTsnpxeBr5RKALqp51ndC4X0wge9SW5PCPRcPMS35ojcucrwyENSYAmwjdrnJAUBTKQmU8U1ZJUVqVNwLoTTMZazC+GFhF3v/OrS99JjhS/a/uI+0bz9ZSUuEeh0mrcFvxdIkFl0l9KJgppK/Fi6w1Raf33j0jqtahpa3jTXjY1hr9suF/ZM57pcDo1OT8U7EGcr5ldDEw/UYuZy3XU2gt8egzLIu6tC4SQvMdOzwjhjC4+a3AuAW7Mcyt5tJr7qF4F6Mjo/83W6kvOEhdWpBvS4TZoI8k1lU9m2eD4pZeFeBq0mWIBOmDyADK9aCWj72uoCagmtulAwsYh7uplLls8/Mr4U8L93HqncmFagoCmlo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3561.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(7696005)(66556008)(64756008)(66946007)(15650500001)(55016002)(66476007)(52536014)(966005)(478600001)(26005)(2906002)(66446008)(54906003)(4326008)(316002)(6916009)(8676002)(786003)(86362001)(8936002)(71200400001)(83380400001)(33656002)(6506007)(76116006)(5660300002)(186003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?U3hGN0tyWUFjZFRzaGJzSHNUYi9qaDVETmFGSmZteW1Cbno1MjNtUWtyUWtn?=
 =?utf-8?B?ZFVGK240dmZzRkNUZVlxRzFaVlJuaXJyd0hFQkR3K1lMdSs4Zjc2NjN1Q1Jm?=
 =?utf-8?B?MzI5WFZIbFRjUVlPZHBCdENrdDZhWmg2dThzQVZZTktKMDN4WHFlUEVwclVC?=
 =?utf-8?B?aVRodXdEM1BmYjl0OWdtVWpvTVlLamY4MVRBTUdUUlh5aVArSVd2ZnhNZlFm?=
 =?utf-8?B?QlBEclRJYUI5YVNNVUh3Ymxjb0ZwajdJOURMU3g0N2FhcWRTeHFXdGltb3BB?=
 =?utf-8?B?djZhYjJkc3VRcnZtWHkxT0tHcEcwTDJHZzZxU0J4N3lGbGZoYXN0dUNHS3Jm?=
 =?utf-8?B?dWFCU052Q1NPcXlaY3BzMW1zY3BOSTNKaldQNTlkNktkQW8rQVN3T3MxZTB3?=
 =?utf-8?B?RUN3QmtrSWxZTjg4R0lJNm1PVXFtQlBEdnVrQVRJZzNUOGNod3VuNFNDcmc3?=
 =?utf-8?B?c1FJVlBDN3YrTTNjbFo4YnBCdWRhTUh1ZDlRTzlYdjB2b2xXaXJZNnQrRVVJ?=
 =?utf-8?B?cVhDejQzY3ZiaUpkTWM4TzU2cHQwdEdETjhZYTlDbS9DQjJPRHBDTjBEYS9u?=
 =?utf-8?B?TjNuejVPQUJ0a0tSOGl2US9TS0tQaVVlSG5jQmRKa3YxQjdhY0FJTUx2SkxJ?=
 =?utf-8?B?OGJrZ2Q4SFYyS05QV2tSRVdyNG5TQmpVdk9oRU5RVEYyNmo2M0hBRXphRW5n?=
 =?utf-8?B?UUQ1aW9TMU14Q0hZc3BwOUFqcDlzOWg4bDFPS2dwSzZIUjZXNjFzQTMwaUVx?=
 =?utf-8?B?MnhUMFJUQTE1NjYwbUZNZllBZGp5ZVJyUXA5eXREa0FOaXFjUFM5S051dFQv?=
 =?utf-8?B?dUtyTmtrV2J3eVpQK2lVMDRnRFY1MTBBZUxuRHFZYnQ0S1Fkb3A3TjFGS3Bm?=
 =?utf-8?B?VHNkcHN1ZW9DMWh6Q2FNVnJhb3JTbWV5VVM0Mkl1YmlydlN6azdOdVpWVU1O?=
 =?utf-8?B?ZmlUbjFCSVNNeVEwczRPNGZkdmc4YVQ4SDgrV3FrWEZwMjkzUmlxdEphaWp3?=
 =?utf-8?B?SUNaanJ4ZmVrSmVYQnlKVEhUaHJNeUVqaTZaaTBIYUV5Q0JtSENEeGlJendB?=
 =?utf-8?B?clZJZE5EcDFjUThDVDVEamdSL2hDc0kybC9FRzVmaVptbmh0VzVEeFV0cjMr?=
 =?utf-8?B?NXBCWWw4TkppbUhIZ0Z4R3F4MTVGK0I1UmxnKzk5Mlh6Qkpva1JlSWFLMmtD?=
 =?utf-8?B?Zk5SbVEzbktwcit1c1R3NFRZM1UwYUV3Q1ZES01xZUt0bHlqOUd4ZEg1bkVU?=
 =?utf-8?B?ZytaZlBxMjhsUFlHY3NwWURVcjRQa01aRVJWMzlhNGZXdjB6QWw4Tkd2MHFh?=
 =?utf-8?B?MlB6c3dpVE9MdmhkdlEwLzBsZnphUi9xMy8vZnJ0cnUzcTJrUStIM1JpUHRn?=
 =?utf-8?B?SmRwS0tnOEVhMGdMbTNRYzFVYldNbmxlcFRiNlpOUFZZVkk4VWN4MXRuQW1P?=
 =?utf-8?B?b3NIcmxKZy9hMlJhaEtpVEQwUmwzYXhSb1hFM1NuVCticnJvTklIT0pXV2I2?=
 =?utf-8?B?eXhnaTlKcVBBUEFFSWJtK2lYeTZ2Vnp6Z3lQNlZpY0Z1R2pQejBuV2MraHFK?=
 =?utf-8?B?K0xocEZjT1gwSkdCZWdXSGEzZnFFejBxdE9XeW5mSWVkSjZoUjMzRUVUZ1U2?=
 =?utf-8?B?MC9yRGdCMkcvRHZ6QzBRajMyYzh0bjFQR3lrYTFjd0R6SC94d0pqOGRFazlV?=
 =?utf-8?B?T0h0TDZNSlJuNGh5Z0Zqc3JUMmV6N1lRMkxMMFNPWitGeU1FYW1CaElpVlMz?=
 =?utf-8?Q?QvJvFXPT0ZwDj3R1DJnB38CPqmwqp8J5RFgXNT1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3561.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3c10c6-0828-4053-b762-08d8e30c3bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 15:01:35.6997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqOWcG87uOiocp1voFOmsthvSyK7njq0jNKfik+itWKyyfppZmcMp/5RUKUrs+wt/+NsTYYV8T3HBY3C4RR//g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB4677
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_13:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090077
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090077
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
Cc: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Ed Tanous <ed@tanous.net>, "Rao, Balaji B" <Balaji.B.Rao@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gYWxsLA0KDQpQcm9ibGVtOg0KTXkgY29sbGVhZ3VlIEJhbGFqaSBSYW8gYW5kIEkgYXJl
IGxvb2tpbmcgYXQgUmVkZmlzaCArIEl0ZW0gVXBkYXRlciBpbXBsZW1lbnRhdGlvbiBhbmQgZm91
bmQgc29tZSB1bmV4cGVjdGVkIChJJ20gYSBuZXdiaWUpIGJlaGF2aW9yIGNvbWluZyBmcm9tIHBy
b2Nlc3NlcyBpbnZvbHZlZC4NCkluIHBhcnRpY3VsYXIsIHRoZXJlIGlzIHNvbWUgZGlzY3JlcGFu
Y3kvZGlzYWdyZWVtZW50IGFyb3VuZCB0aGUgT2JqZWN0TWFwcGVyLkdldE9iamVjdCB2ZXJzdXMg
aW50cm9zcGVjdGlvbiBvZiB0aGUgL3NvZnR3YXJlLzxpZD4gaW50ZXJmYWNlcy4uLg0KDQpJbnRl
cmZhY2VzIG1pc3NpbmcNCj09PT09PT09PT09PT09PQ0KQUZBSUNULCBSRiB1cGRhdGVfc2Vydmlj
ZS5jcHAgaGFzIGEgdGhyZWFkIHRoYXQgbW9uaXRvcnMgYW5kIGN5Y2xlcyB0aHJvdWdoIHRoZSBp
bnRlcmZhY2VzIG9mIHRoZSBvYmplY3QgaW4gcXVlc3Rpb24gL3h5ei9vcGVuYm1jX3Byb2plY3Qv
c29mdHdhcmUvPGlkPiBhbmQgd2hlbiBpdCBmaW5kcyB0aGUg4oCc4oCmU29mdHdhcmUuQWN0aXZh
dGlvbuKAnSBpbnRlcmZhY2UsIGl0IHdpbGwgYWN0aXZhdGUgdGhlIGltYWdlIGJ5IHNldHRpbmcg
dGhlIFJlcXVlc3RlZEFjdGl2YXRpb24gcHJvcGVydHkgdG8g4oCcQWN0aXZlLuKAnQ0KDQpUaGlz
IGZyYW1ld29yayB3b3JrcyBmaW5lIGZvciBCTUMgdXBkYXRlcyBidXQgSSBzZWUgdGhhdCBmb3Ig
b3VyIEJJT1MvSG9zdCB1cGRhdGVzIFJGIG9ubHkgZmluZHMgc29tZSBpbnRlcmZhY2VzIHRoZW4g
Y29tcGxldGVzIChleGl0IG91dCBvZiBpbWFnZV9tYW5hZ2VyX21haW4uY3BwKTsgUkYgdGhyZWFk
IHRpbWVzIG91dCAoMTBtaW4pIHdpdGhvdXQgZmluZGluZyB0aGUgU29mdHdhcmUuQWN0aXZhdGlv
biBpbnRlcmZhY2UuDQoNCkhlbHAgV2FudGVkDQo9PT09PT09PT09PQ0KTm90IHVudGlsIHRoZSBv
YmplY3QgbWFwcGVyIHNlcnZpY2UgaXMgcmVzdGFydGVkIGRvIEkgc2VlIHRoZSBleHBlY3RlZCBp
bnRlcmZhY2VzIHBvcHVsYXRlLg0KTG9va2luZyBmb3Igc29tZSBndWlkYW5jZSBvbiB0aGlzIFJG
PC0+T2JqZWN0TWFwcGVyIHJlbGF0aW9uc2hpcCwga25vd24gcHJvYmxlbXMgd2l0aCBPTSBvciBk
aWZmZXJlbnQgd2F5cyBvZiBzZWFyY2hpbmcgZm9yIHRoZXNlIGludGVyZmFjZXMuDQpSZXBybyBv
YnNlcnZhdGlvbiBTdGVwcyAxLTUgYmVsb3cuLi4NCg0KU3RlcHMNCj09PT0NCjEuKSBHaXZlbiBh
biB1cGxvYWQgb2YgYSBob3N0IHVwZGF0ZSBwYWNrYWdlIHdlIHNlZSB0aGUgb2JqZWN0IGluIHRo
ZSBhcHByb3ByaWF0ZSB1cGRhdGVyIGFuZCB2ZXJzaW9uIHNlcnZpY2VzOg0KIyBidXNjdGwgdHJl
ZSB4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkJJT1MuVXBkYXRlcg0KYC0veHl6DQogIGAt
L3h5ei9vcGVuYm1jX3Byb2plY3QNCiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJl
DQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2YxNGYyZDE1DQojIGJ1c2N0
bCB0cmVlIHh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuVmVyc2lvbg0KYC0veHl6DQogIGAt
L3h5ei9vcGVuYm1jX3Byb2plY3QNCiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJl
DQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2YxNGYyZDE1DQoNCg0KMi4p
IGludHJvc3BlY3Rpb24gc2hvdWxkIHNob3cgdXMgdGhlICJTb2Z0d2FyZS5BY3RpdmF0aW9uIiBp
bnRlcmZhY2UgYW5kIGRvZXM6IA0KIyBidXNjdGwgaW50cm9zcGVjdCB4eXoub3BlbmJtY19wcm9q
ZWN0LlNvZnR3YXJlLkJJT1MuVXBkYXRlciAveHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS9m
MTRmMmQxNQ0KTkFNRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBF
ICAgICAgU0lHTkFUVVJFIFJFU1VMVC9WQUxVRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RkxBR1MNCm9yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlICAgICAgICAgaW50ZXJm
YWNlIC0gICAgICAgICAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0N
Ci5JbnRyb3NwZWN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIC0g
ICAgICAgICBzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0NCi4uLg0K
W3NuaXBdDQp4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXRpb24gICAgIGludGVy
ZmFjZSAtICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
DQouQWN0aXZhdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3BlcnR5ICBz
ICAgICAgICAgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQWN0aXZhdC4uLiBlbWl0cy1j
aGFuZ2Ugd3JpdGFibGUNCi5SZXF1ZXN0ZWRBY3RpdmF0aW9uICAgICAgICAgICAgICAgICAgICAg
ICAgcHJvcGVydHkgIHMgICAgICAgICAieHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5BY3Rp
dmF0Li4uIGVtaXRzLWNoYW5nZSB3cml0YWJsZQ0KIFsvc25pcF0NCg0KMy4pIEhvd2V2ZXIgR2V0
T2JqZWN0IGRvZXMgbm90IHNob3cgdGhpcyBpbnRlcmZhY2UgYW5kIF9sb29rc18gaW5jb21wbGV0
ZSAob25seSAxIGRpY3Rpb25hcnkpIHdoZW4gY29tcGFyZWQgdG8gdGhlIGJtYyBlcXVpdmFsZW50
ICgyIGRpY3Rpb25hcmllcykuLi5ub3Qgc3VyZSBob3cgdGhpcyB3b3JrcyBvciB3aGF0IGl0IG1l
YW5zIHRob3VnaC4uLg0KIyBkYnVzLXNlbmQgLS1zeXN0ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9
eHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBwZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qvb2Jq
ZWN0X21hcHBlciB4eXoub3BlbmJtY19wcm9qZWN0Lk9iamVjdE1hcHBlci5HZXRPYmplY3Qgc3Ry
aW5nOiIveHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS9mMTRmMmQxNSIgYXJyYXk6c3RyaW5n
Og0KbWV0aG9kIHJldHVybiB0aW1lPTE2MTQ5NTc5MTUuMzI2MDMxIHNlbmRlcj06MS4yNyAtPiBk
ZXN0aW5hdGlvbj06MS44NDggc2VyaWFsPTUxODcgcmVwbHlfc2VyaWFsPTINCiAgIGFycmF5IFsN
CiAgICAgIGRpY3QgZW50cnkoDQogICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3Qu
U29mdHdhcmUuVmVyc2lvbiINCiAgICAgICAgIGFycmF5IFsNCiAgICAgICAgICAgIHN0cmluZyAi
b3JnLmZyZWVkZXNrdG9wLkRCdXMuSW50cm9zcGVjdGFibGUiDQogICAgICAgICAgICBzdHJpbmcg
Im9yZy5mcmVlZGVza3RvcC5EQnVzLlBlZXIiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVl
ZGVza3RvcC5EQnVzLlByb3BlcnRpZXMiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1j
X3Byb2plY3QuQ29tbW9uLkZpbGVQYXRoIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJt
Y19wcm9qZWN0Lk9iamVjdC5EZWxldGUiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1j
X3Byb2plY3QuU29mdHdhcmUuVmVyc2lvbiINCiAgICAgICAgIF0NCiAgICAgICkNCiAgIF0NCg0K
NC4pIGdldC1tYXBwZXIgc2hvd3MgU29mdHdhcmUuVmVyc2lvbiB0byBiZSB0aGUgc2VydmljZSBh
c3NvY2lhdGVkIHdpdGggdGhpcyBvYmplY3QNCiNtYXBwZXIgZ2V0LXNlcnZpY2UgL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvc29mdHdhcmUvZjE0ZjJkMTUNCnh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdh
cmUuVmVyc2lvbg0KDQo1LikgSG93ZXZlciwgcmVzdGFydGluZyBPTSBhcHBlYXJzIHRvIHBvcHVs
YXRlIHRoZSBtaXNzaW5nIGludGVyZmFjZXMvZGljdGlvbmFyaWVzLi4ud2hhdCBnaXZlcz8gDQoj
c3lzdGVtY3RsIHJlc3RhcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBwZXINCiNkYnVz
LXNlbmQgLS1zeXN0ZW0gLS1wcmludC1yZXBseSAtLWRlc3Q9eHl6Lm9wZW5ibWNfcHJvamVjdC5P
YmplY3RNYXBwZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qvb2JqZWN0X21hcHBlciB4eXoub3BlbmJt
Y19wcm9qZWN0Lk9iamVjdE1hcHBlci5HZXRPYmplY3Qgc3RyaW5nOiIveHl6L29wZW5ibWNfcHJv
amVjdC9zb2Z0d2FyZS9mMTRmMmQxNSIgYXJyYXk6c3RyaW5nOiANCm1ldGhvZCByZXR1cm4gdGlt
ZT0xNjE1MjMxNTMzLjg1OTQ3OSBzZW5kZXI9OjEuNDQ5OCAtPiBkZXN0aW5hdGlvbj06MS40NTE3
IHNlcmlhbD0xMjg3IHJlcGx5X3NlcmlhbD0yDQogICBhcnJheSBbDQogICAgICBkaWN0IGVudHJ5
KA0KICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkJJT1MuVXBk
YXRlciINCiAgICAgICAgIGFycmF5IFsNCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVkZXNr
dG9wLkRCdXMuSW50cm9zcGVjdGFibGUiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVz
a3RvcC5EQnVzLlBlZXIiDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5mcmVlZGVza3RvcC5EQnVz
LlByb3BlcnRpZXMiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuQXNz
b2NpYXRpb24uRGVmaW5pdGlvbnMiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3By
b2plY3QuQ29tbW9uLkZpbGVQYXRoIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19w
cm9qZWN0Lk9iamVjdC5EZWxldGUiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3By
b2plY3QuU29mdHdhcmUuQWN0aXZhdGlvbiINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5i
bWNfcHJvamVjdC5Tb2Z0d2FyZS5WZXJzaW9uIg0KICAgICAgICAgXQ0KICAgICAgKQ0KICAgICAg
ZGljdCBlbnRyeSgNCiAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2Fy
ZS5WZXJzaW9uIg0KICAgICAgICAgYXJyYXkgWw0KICAgICAgICAgICAgc3RyaW5nICJvcmcuZnJl
ZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZSINCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZy
ZWVkZXNrdG9wLkRCdXMuUGVlciINCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVkZXNrdG9w
LkRCdXMuUHJvcGVydGllcyINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVj
dC5Db21tb24uRmlsZVBhdGgiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2pl
Y3QuT2JqZWN0LkRlbGV0ZSINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVj
dC5Tb2Z0d2FyZS5WZXJzaW9uIg0KICAgICAgICAgXQ0KICAgICAgKQ0KICAgXQ0KDQpSZWZlcmVu
Y2VzDQo9PT09PT09PT0NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0
ZXIvYXJjaGl0ZWN0dXJlL29iamVjdC1tYXBwZXIubWQNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2RvY3MvYmxvYi9tYXN0ZXIvYXJjaGl0ZWN0dXJlL2NvZGUtdXBkYXRlL2NvZGUtdXBkYXRl
Lm1kDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1kYnVzLWludGVyZmFjZXMv
dHJlZS9tYXN0ZXIveHl6L29wZW5ibWNfcHJvamVjdC9Tb2Z0d2FyZQ0KDQotSm9zaCBHaWxlcw0K
DQo=
