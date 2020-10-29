Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB329DDBD
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 01:41:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM67y540fzDqXB
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 11:41:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=OMIyXYKV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=dB83cqeF; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM66K6qfdzDqTs
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 11:40:08 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 09T0ORon005373;
 Wed, 28 Oct 2020 17:40:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Nj16tunhlzX9LDoXVhhgfMpYYC0wnnQH2ZarOt8jSrw=;
 b=OMIyXYKV1sMbJ7kU3BlX/+0ejIDpnZ5FWCIBFSiJP6QELqZ22NTPiIMHlmUza/tMrRDA
 Rbj8aTYX7imUmk6gHa/C+6iDvn1++Hoa+lLtyzprSgXFS6FMyRo26/w4xfBPTnyJ0BY8
 LgZ325ltN9R8D2qKwdT/vFNbs7pSwrU+Xj0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 34ejk2apad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Oct 2020 17:40:04 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 17:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIbwPPdpUpvE6lWkjsX4tYGtgV0EUJFn5GzrCELJD0eVVvFjh2vs0IrFAg9ZfqBGme1F8tFkenbfzIFqfJYJfaRfFzX9qHnPHOQ3nGmgljY4C5HloFvGvopS32U/H8t8X/w4ZETRX6dHEQnVRD1MzSUXFCpfHst1dwX54TS9yX4XPNZbtrJD6cWSpst4PbVIQkkvpdnx6jrXMuQ9e8Xjwkj5uBNO8AHR1qZEnpSG0jQ2jKrznKc/GAfXBF8ga/2Bx8fQZXTOMUI6rIMbwjX8gJ/0pWUpHttggy+rC9Pr+KKD70lSgxJ52cHo02vfAcbBsq7llGcnQZ4UAC4PB64vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj16tunhlzX9LDoXVhhgfMpYYC0wnnQH2ZarOt8jSrw=;
 b=kHnUXwI5ngfMilHcAykOwMUtq7pwdY5ZbIX2aIK+sIlpSP6+rBdhe826H321D8C+umxVzGWJxQnfDocIzYj4BKUq+EbiJ3758SXdSRk9TrYoMkfg7iAo2JzuFAKxCi63xGOv0XdrhjqoaF+eU/JNK2YH2c1DtJOwPbgokl454n/x99JZIvbfrwS8AM1UXADGc/zKbOtiWQJsNGnAZX1+ANx+y26++BN8hhT8eQcG09S01y1Yr3iDggsyzWCxwbfaK0G0Sp5QKVoH2TPKYxP1yQZYjnXgANxnLeZtdXKhqq1puckc0ORgS05qJpzixV8cH9la3m9B+rUP9pHX5Bv52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj16tunhlzX9LDoXVhhgfMpYYC0wnnQH2ZarOt8jSrw=;
 b=dB83cqeFSJMHYZvJPhTHCk1s+vpoAtWZMZOVchxaQGaEujUAuP/SjLpFssK9eK7gz6RVoztbLwI2p0NCd3vM1xLN24hmhJmiS9RNwH6PV7UnJb+JfgLU1XdIm5tYwchXkR1BvCneYTM/mqDZ3S96X4h7yJVozAJhYCzpHHtTr20=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2534.namprd15.prod.outlook.com (2603:10b6:a03:152::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 29 Oct
 2020 00:40:02 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 00:40:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Derick Montague <Derick.Montague@ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Firmware Update - Single File Upload
Thread-Topic: Firmware Update - Single File Upload
Thread-Index: AQHWrXilgfrcvIL49E+Lft+tabZ4UamtR8eA
Date: Thu, 29 Oct 2020 00:40:02 +0000
Message-ID: <0FB070DA-1BAF-4934-907F-A92467054563@fb.com>
References: <OFAF28317F.F38BF613-ON0025860F.00792E84-0025860F.007A831D@notes.na.collabserv.com>
In-Reply-To: <OFAF28317F.F38BF613-ON0025860F.00792E84-0025860F.007A831D@notes.na.collabserv.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ibm.com; dkim=none (message not signed)
 header.d=none;ibm.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::4:43d4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 662a2b9e-58cd-4645-d49e-08d87ba32c1e
x-ms-traffictypediagnostic: BYAPR15MB2534:
x-microsoft-antispam-prvs: <BYAPR15MB253432DBADFE0380040BE9BADD140@BYAPR15MB2534.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oT25upIrEHcItTaybIEiMAT0m7RWwdmf+KCorXcxwcv1IcUDzSQJDPwA7PL9CHSnay6DgC6WLE082XsSWWiXTS2cgHoHg28JBK8UZGhtIt+TxE5F6kkFtN7xl0IXZ2fmUjAiVoSkDgo/dG4BqDAjXziNW0QzrJRzX36lvx2tcCR67RtXBms9P602Wgt1hGE8tW2ZzJr2vVNSnKLr4lGR32QL8mK0zk/P+jooOl44NFYcMSrirBx49CWGPUB7oabd0odYPIgas9QVRN9BUjY8QQ3GSNMsHYcPmD7HMu9Tb/X4y5Dip1rNdMhjdZRgCSrPdNh1iFcFRizKdzS4fYH6Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(71200400001)(2616005)(83380400001)(15650500001)(33656002)(4744005)(186003)(2906002)(36756003)(86362001)(478600001)(6512007)(66446008)(66476007)(66946007)(5660300002)(8676002)(110136005)(66556008)(316002)(8936002)(6506007)(64756008)(76116006)(91956017)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DNuf0DnBHCQGi45uhzxBLs0LJY5YhcIYIfZDWlfXkvoV64s2sXsrasJ5talc+Q26R/wmOeuj6nuOp73hrdEtbqPvV8cv9Ibexfi7cE9IUrDelJPl1W4JGNMxEK//GOA010Ok7TytueKskIEH58R4hH9hRSI2qG57pD3Fu391e7UU+EkRuKcBF40u9Ga/5cqulPJDgjxkWwW9sqmExksovLPikEUEpLo3rIIYuqqbqrvEU9uMLxYS5h7zZd5wuKVde9vLT8Vsb3jYBrV/Kkl7NtOwAKXsORFf3xIFb2btg5YZgvkdKsXxeozhULcHZHgwRtkNA/hND5MqYP8N3PLd2E7lt1G1jreWt01YbgPI7LEj17RFQHkFuAzspoIL1c8sidouYBf3XQylnjPnhHEZiqt8E/HvCijy0Fn2MTk4BCo3UCUyMO4UlP91vo0aoP+9XZnJee1lXNQDAsg+3LFCi8bPlT+dZ5F0Yb/DZZ0q1OfsQKw8EP2tFOmsw5/9qQgk9UsBjJaGovPWv8h5+r+XFncrhTTHFre1RJUOqOWNcRw0SOHpakI3H5f9eeImIPcs8RJcHz+JmLDcgj7cRLKkyEbehk9Fma3qnlsSuGmMiotRedhZB0YqULprfk0MuE3kGiyeZcg/kR0a6n7/V4RtPfxFE8ivrJX/5evH2aAJZDcvSAZyi3tglBbOfaPCKy9E
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E38136F10258F342906D5F87A4ED1FE7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662a2b9e-58cd-4645-d49e-08d87ba32c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 00:40:02.1929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEEZ+tfzia+kgsHdB0GaR9J3/TgrHg1NMa0Q0F3pKFhe5mJHyLb1w4ekys23cOegFIL3+b8PSuzRdIO14kkJ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2534
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=979 clxscore=1011
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290000
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

DQoNCu+7v09uIDEwLzI4LzIwLCAzOjIxIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgRGVyaWNr
IE1vbnRhZ3VlIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBEZXJpY2suTW9udGFndWVAaWJtLmNvbT4gd3JvdGU6DQoNCiAg
ICBIZWxsbywNCg0KICAgIEF0IHRvZGF5J3MgR1VJIERlc2lnbiBXb3JrIEdyb3VwLCBhIHVzZSBj
YXNlIHdhcyBwcmVzZW50ZWQgYWJvdXQgc2luZ2xlIGZpbGUgdXBsb2FkLg0KICAgIFRoZSB1c2Ug
Y2FzZSB3YXMgdGhhdCB0aGUgb25seSB1cGRhdGUgcmVxdWlyZWQgd2FzIGEgQk1DIHVwZGF0ZS4g
SW4gdGhpcyBjYXNlLCB3b3VsZA0KICAgIHRoZSBob3N0IG5lZWQgYmUgcG93ZXJlZCBkb3duIHRv
IGFwcGx5IHRoZSB1cGRhdGU/DQoNCkZvciBCTUMgdXBncmFkZSwgbm8gY2hhbmdlIHJlcXVpcmVk
IGluIGhvc3QgcG93ZXIgc3RhdGUuDQoNCiAgICBUaGFua3MhDQogICAgRGVyaWNrIE1vbnRhZ3Vl
DQogICAgSUJNIENvZ25pdGl2ZSBTeXN0ZW1zIFVzZXIgRXhwZXJpZW5jZQ0KDQoNCg==
