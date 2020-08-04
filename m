Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610723BF2F
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 20:04:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLjLx215mzDqYS
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 04:04:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5485aa590c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=GxGHMYZC; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Pxuo6xQK; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLjL16BkqzDqVN
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 04:03:26 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074HkH9A013178; Tue, 4 Aug 2020 11:03:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=2byasJmshiq1s4mhcdIKoMjeBL3bbmy8G8HhMk/ftLs=;
 b=GxGHMYZCqKCnCWwwkD4dlU6wW5rjeDYWnXIg7VRYqQG8mDpug03qQn4Pt4FXv7RS3KnF
 se/P52o8jlxFVP64nWH2Elgvw6FMIkABLvbealCKd8C1XIzyeh5DZodbxs1OtAeaLzeG
 QSBb8FefnwQwVWWo7do8hM6vilt5kP1iodQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 32nr82kj80-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 04 Aug 2020 11:03:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 4 Aug 2020 11:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdbW0IAm4jOxGL5lBpu84f0p1gQnW9QsNG57Via0DDZXAbv8gJ+p8VH3V5f6Iu/rDGhSvahwpwEEt8nhv6uecWN4cynbB8J2hrDbaRvg6iXGfYR/4837sz/DW7yhNsmuUdYOS3oJkTVBab4mrcInIuFa4UZcpXfA3o9vk9FHrbTAg6XhlBxaO2tviFZSBajNIqlcUX9r9UG4DDFxHHbcM1aw4ccImFx0nmEN26OqfXyPrFZV/ynD5EuS78j1TymC/bpliXPCRl1zJxfUCHPccG5G6TNJQgZLUZhTWRgBBiLfdq+V64kywf9+agqt3wxkFx1AVl2qb7BUPpu8NEpQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2byasJmshiq1s4mhcdIKoMjeBL3bbmy8G8HhMk/ftLs=;
 b=KnOvRAKJFAyrpfFKsiwxjbAQF4lLOI0HTYPIuwVxgQ8KObn0b9wVV2WGA1tF2TOgPtCEeLdqZhVI/ERTr2vwYnwQ260H6X400jN7VDDYUGS7QmjwKX18wrIl5QnC8Sru8JaiLEWgZKeKTGlQxM86H8YLVhp0ScQmF8XE+FXrIm87Y7eF/SdX+SLroLtis4N+TzLrMnye+Qkjdr7QtDvGPA8xiL5PmnAENRW6B6BucJUjD3CaraGQzdA2ONu4v5S5fniZ96aDzUC23vkERoR1ROcvq08u5iOpAox2MDkFgSnxeRQNXfxtWQKgCqfOYeQOEtji/yIwj8wrUieahn4qZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2byasJmshiq1s4mhcdIKoMjeBL3bbmy8G8HhMk/ftLs=;
 b=Pxuo6xQKbXlgngcuq5/pytQSQN9Ef+eZU3fT8ewR5Pon84RtXmutLFFKulg8n4L070Pxj51TJST4ZFnouI22VqAdrw6ccENHUJDtQjlPP5J8u1RSL1fdBbp1rM5V8e0zdmiJg7vH79yso+dK+PaSsBmSIKjtyH0fdVzzrS3hVZ8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2488.namprd15.prod.outlook.com (2603:10b6:a02:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 18:03:02 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 18:03:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor virtual sensor
Thread-Topic: Phosphor virtual sensor
Thread-Index: AQHWTlMkknRRiUDgBU+3FsJUUtOwWakL2NSAgBxLwYD//9xngA==
Date: Tue, 4 Aug 2020 18:03:02 +0000
Message-ID: <98697C01-7FF9-42C5-B942-2C22C3012AC7@fb.com>
References: <DF74EA96-65CA-430F-9525-56DF39237550@fb.com>
 <85F50CF8-34D6-4DA4-9090-9FAE6AE07605@fb.com>
 <bc912bd8fef6a69b43c08761128f32c7aee3c24b.camel@fuzziesquirrel.com>
In-Reply-To: <bc912bd8fef6a69b43c08761128f32c7aee3c24b.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:fdf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95130669-4bcb-43d1-26fa-08d838a0a17f
x-ms-traffictypediagnostic: BYAPR15MB2488:
x-microsoft-antispam-prvs: <BYAPR15MB2488F0823A6503C879DF616DDD4A0@BYAPR15MB2488.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VJS8jix/FF/89x6UgIXyHsm7Mo5GMC5tdSbs6KEe2QNI7ja7C6eik3QADM/5oWx7bxs0kIUTnJ7M6LtfQC/Cip/cEoX3wVadt5KeGXAlVhQo281VnBbCQExq33NGkKO4jcmb61WTouj3vMYtxoKzMGZodJMMQPXOrNpxRffplbPjSAxvCfjq2yHgJEl3Xm7V5KntkHC17mrreWWxjs3qn/ZSbbNiUDswMSCp566U7+i4azICknSbTMo4cac8iXoqNJAw0a+0ds9ksA5bipOkfkAc7nXlc7wQPVOqML81w5VqULALSai/M5+rBDXbQKWNJwSsSNnBw/5WuJYTmwZo/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(376002)(136003)(346002)(366004)(71200400001)(66556008)(66946007)(33656002)(186003)(66476007)(86362001)(558084003)(2616005)(5660300002)(66446008)(64756008)(6506007)(110136005)(76116006)(316002)(8936002)(478600001)(8676002)(7116003)(6512007)(6486002)(3480700007)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ggjzvMKWFVyR0sgIG20Lfni7ZnLiAX8vTyfWwXoSBEdz06p4QB5a6Yt/rphQ1SadbnIiVIFSwcUMZfOJN/BeUncQ+Dr8+4YytND69kB9p3s9ROghViTSYLbN5TAy4TawAiCpNDK5fPDctiK3KObb1KN1NSgIae8fBJxsLcRcn2E7+w73xDj3S9NQwzRnrf7+f5xC2c5vq0/Dhzgf/YeKkcLJiSHQDVbKgcx2OAx2mpwlvHB8MSxdAbEyDEMDltXSi/6FaVxlvd+PidbMJThR0tgpvxvKT+Amh6AsOIyczwT0ZDzYN22e5N9VlMeiSiosrFCznjwhT87NNhd21ey7dSmeRH+IqBpOzsbCO9eZt2WsAsB7QcqpAznhgbsv60fAi/i8u2bEVDblZl85lsKQqD37HCnmDEN48D+BLy4KEBMMCGWS1YGD94XQPBdu31NjmHE8WpAI7j2brUHIkTzH7ImVfCfR1Q3wDmLbHaE5OkcgAPF5gadZrNCKqsooY5e4UUIC1zkTgGJOKgtzh8dkRS6diP+OJwcHHm79hwDAhNWerfpaCT3qApup/DKy29kwG2QlWFtIh/pGfKNMHkPiV0oUHO1I+Hgl1qUhmyHh5UuHEfrHAv9kaDgc4U90a9HRbG6IdnKwzgQStTEwBKcpV+fqwzUQvQIHADfC4qtxXTo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC6541591FE8484586750817F9728E9A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95130669-4bcb-43d1-26fa-08d838a0a17f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 18:03:02.6603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5f6PRqhvYQhCQ584FPHmHw3DbCcxdV/pQqasIYbuLMiHAccmqnbwoRAftM25Sg57QhQ98xXPbjEub4gnlk5xpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2488
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040131
X-FB-Internal: deliver
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

VGhhbmtzIEJyYWQNCg0K77u/T24gOC80LzIwLCA2OjEyIEFNLCAiQnJhZCBCaXNob3AiIDxicmFk
bGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+IHdyb3RlOg0KDQogICAgT24gRnJpLCAyMDIwLTA3LTE3
IGF0IDIwOjA0ICswMDAwLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiBIaSBCcmFkLA0KICAg
ID4gUGxlYXNlIGNyZWF0ZSBhIGZvbGxvd2luZyByZXBvLCBJIHdpbGwgc3RhcnQgY29kaW5nLg0K
ICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiAtVmlqYXkNCg0KICAgIFNvcnJ5IFZpamF5LiAg
SSBmaW5hbGx5IGNyZWF0ZWQgdGhpcyB0b2RheS4NCg0KICAgIC1icmFkDQoNCg==
