Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11A1B67F1
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 01:11:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Y376W0qzDr4N
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 09:11:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1382a73f5b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=g7kkVI55; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=HGu/gO3Q; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Y1R66wkzDqKK
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 09:10:17 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NMxKta010970; Thu, 23 Apr 2020 16:10:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5uY4+Nu1ydS8Tr5km9LevTflA6jZgfNDizzaaDNwZhA=;
 b=g7kkVI5550OKokXflGqkIYbsLvDZ3Wb09hYxz4wMgKlWKcwVyw//ort23NvxnkBZicLG
 e9YJ1oFFSydMPbfIgNFp9PYdVYTpPhxZTaEEt1r2XBN/BHci1mysgAL7HDNG2urWEEGK
 ipf/Hz9aY4X5515kS6jXUUzLA+kgeJ0tIV4= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30kknkr9be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Apr 2020 16:10:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 23 Apr 2020 16:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqL+b4o92Cjm+3Y26rhQruQ7Umjo7wzMzGioCsEn782gYxF6Qx27HG4zHXm8AoBpakkVmeFJNu362RGQKzLUVUhMDS/27tg71UWsj+i+p/Xv8ohNPdacxWB+ROhiCqMVl9T12AbAZtIdI33yCOiTeMMpmYNi3UYN3Ggp8JbtFZsENmaCdtsmRb2D2yXuD+HDABbpnRA9+XOZW/cn6TXepmIcSmJI9HzXQyqaI56JRshk7D7NbjIQmI7JiA3neW9kIzzpGB6s4WmylTDwVRP3KIE79ExwZSHNL/HWTxIHxsQjUU65aHB/wO3Qu3RAIRQl3wt6tndj7d/l3+lv5AsKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uY4+Nu1ydS8Tr5km9LevTflA6jZgfNDizzaaDNwZhA=;
 b=QIpSSVyaKR1LL0VnntaDRI6DGTovbYt1PvHRtcl0jCk/3QoXn71GBSUFg6U4ZTLABynUlzLIJXg9SkBtMFwA2Z0rd1MohS/55jfQ/OFptKL7SS8VjHBgG3Rn5asgknt0BsM3u+SCg0Gm66oRHrUukNc9kK2C9GNcDqiHHn5iCL9ZDStSA2BrxQBhCQznxyjDH/ld6EbQlGM+SP8XbOf3HW0LL2S+DZB3arX8sGa+Fxw8YUhfGWfn/u5o0ZQ//YHDmuZhNoamsLH8cZSVP5rXRT1fyBWDzg6n+yZ4sPqOTcTf23tHwSgsle8neQlM4PLOEa5zSmw9OU05ePHLuwiREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uY4+Nu1ydS8Tr5km9LevTflA6jZgfNDizzaaDNwZhA=;
 b=HGu/gO3QFFvenIfWVAPYOoYQxGmobA4QEnZc8DM/Vdp3T8sXWH8iWPEc9t9Wszs79EX2TZrDkg7oZmJSoRz2D+62D8ZYwLPBgtvaANNQ/nl85eXOEX14KQ2YpX6hIY/0xCrc7OjHHPT8rS9HvwE62e6nIWnHt1SHRpzshLP8EdQ=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2806.namprd15.prod.outlook.com (2603:10b6:a03:15c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 23:10:08 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 23:10:08 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Oskar Senft <osk@google.com>
Subject: Re: Access Intel ME IPMB from BMC
Thread-Topic: Access Intel ME IPMB from BMC
Thread-Index: AQHWFexuK6oXnP3TQkeAetsUpPklTKiB3UuAgAB7mID//6wGgIAE18eAgAAAvoD//8PsgIAAlx0A//+u/4A=
Date: Thu, 23 Apr 2020 23:10:08 +0000
Message-ID: <9F56DDEC-765C-4C50-AE04-B2418FD88770@fb.com>
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
 <B3FB3174-1794-4A57-B850-61F0D8200339@fb.com>
 <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
 <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
 <403834AD-B194-44E8-8904-21610A30D727@fb.com>
 <aa5912c6-de60-f965-368f-1864a521c4d8@linux.intel.com>
In-Reply-To: <aa5912c6-de60-f965-368f-1864a521c4d8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:265d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af3c0f6e-204b-4097-2b52-08d7e7db7789
x-ms-traffictypediagnostic: BYAPR15MB2806:
x-microsoft-antispam-prvs: <BYAPR15MB2806AEBC4C72E296E0686EB5DDD30@BYAPR15MB2806.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(376002)(39860400002)(366004)(136003)(66446008)(33656002)(6486002)(66476007)(66946007)(5660300002)(478600001)(36756003)(186003)(66556008)(4326008)(86362001)(2906002)(110136005)(2616005)(316002)(6512007)(64756008)(81156014)(8676002)(71200400001)(76116006)(53546011)(6506007)(4744005)(8936002)(91956017);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: er+jtBaUf4uo0TMbI0OrwcPjZKGbuGtELkRdwXdR9f32/VGFHRtA+P41P+alhIB3YCwUdOjrn7zUjzYLYZRgbF6SL0NiMkWs0SKbBXCmVYk14vghee00HJQGbSawxJ3tQTBvWB3asxG1ER5boDcsmbtQmz3VG2AQXRTCagEa5ylZrI7LvQ10g5zr7eq2O1wGT6mj05WVT5+XyIQU/D80HDLOZ8W4ydbOCTNX0RdsXooAmSCySmkqBjU70c/vxohroYqr0CzcSrenyq1DxTg+Kf0o+5dPm7d/KVti8kJz4YX2HoiSWh25M2htRpsRBvhoCIthaJliGqTB+4FSzgKiXAkd6QdOBHOcU8GAvoyBPyQbTnCFvljQ2AwxAa8Zcm2nO62a6W5Uvcgx/vrHE2fQLfbFF4BEq+0HPMiQka84ShR7BrQlfgzQaEi9WZmOzBSy
x-ms-exchange-antispam-messagedata: 2zrmvfDiU0i0HK41yGVfWk0Y4dwuSkgdIPmOiNvgVGebe3ccFJWrpP+mFvP/ejUpK/1JytXIq9/fG+GpQc80jyr6N8TYB+oQXmcVrqVEe5q6LrUKHcw7Wu7yep0SlmXs7aRWkzodFDXtA6AhTxpCj1qWRQqyvOuX+beat97MzaEja5wwO720hd5gVY9lMjfa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C33D901B09B22D48BDC5DBCECDA9A2A4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af3c0f6e-204b-4097-2b52-08d7e7db7789
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 23:10:08.4017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbpzRXpHsSVrP7MuhmnXT8rioqNS+AefaFfw56D+dHg1iB4zrzY4TFXkk49xCenW/lOsFoM0HrvXce2tw3ECig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2806
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_18:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230166
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMjMvMjAsIDI6MDAgUE0sICJKYW1lcyBGZWlzdCIgPGphbWVzLmZlaXN0QGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiA0LzIzLzIwMjAgMTE6NTkgQU0sIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICA+IEFzIGkyYyBzbGF2ZSBtcXVldWUgZHJpdmVyIGlzIG5vdCB1
cHN0cmVhbWVkIGFuZCB3aXRoIGFscmVhZHkgaGF2aW5nIA0KICAgID4gc2FtZSBmdW5jdGlvbmFs
aXR5IGluIGlwbWItZGV2IGRyaXZlciB3aGljaCBpcyBhbHJlYWR5IGluIHVvc3RyZWFtIA0KICAg
ID4ga2VybmVsLCBJIGRvbuKAmXQgc2VlIGFueSByZWFzb24gdG8gdXNlIGkyYyBzbGF2ZSBtcXVl
dWUgZHJpdmVyLiBJIGhpZ2hseSANCiAgICA+IGluY291cmFnZSBwZW9wbGUgdG8gdXNlIGlwbWIt
ZGV2IGRyaXZlciB3aXRoIGxhdGVzdCBpcG1iYnJpZGdlLiBJZiB0aGVyZSANCiAgICA+IGFyZSBh
bnkgaXNzdWVzLCBwbGVhc2UgbGV0IHVzIGtub3cuDQogICAgDQogICAgT25lIGlzc3VlIHdlIHJh
biBpbnRvIGlzIGhhdmluZyBNQ1RQIGFuZCBJUE1CIG9uIHRoZSBzYW1lIGJ1cy4gSVBNQiANCiAg
ICBkcml2ZXIgY2FuJ3QgaGFuZGxlIE1DVFAgdHJhZmZpYywgd2hlcmUgdGhlIG1xdWV1ZSBjb3Vs
ZCBoYW5kbGUgYm90aC4gDQogICAgS2VybmVsIGFsc28gZG9lc24ndCBhbGxvdyBtdWx0aXBsZSBz
bGF2ZSBhZGRyZXNzZXMgb24gb25lIGJ1cy4gSGF2ZW4ndCANCiAgICBmb3VuZCBhIGdvb2Qgc29s
dXRpb24gdG8gdGhpcyBvbmUgeWV0Lg0KDQpJIGRvbid0IHNlZSBtdWNoIGRpZmZlcmVuY2UgaW4g
bXF1ZXVlIGFuZCBpcG1iIGRyaXZlciBjb2RlIHdpc2UuIElmIA0Kc29tZXRoaW5nIGhhcyBjaGFu
Z2VkIGluIGN1cnJlbnQgbXF1ZXVlIGRyaXZlciB0byBzdXBwb3J0IG1jdHAgdHJhZmZpYw0KdGhl
biB3ZSBzaG91bGQgdHJ5IHRvIGFkZCB0aGVzZSBpbiBpcG1iIGRyaXZlciBhcyB3ZWxsLg0KDQpJ
IGNhbid0IGNvbW1lbnQgbXVjaCBhcyBJIGhhdmUgbm90IHNlZW4gY3VycmVudCBtcXVldWUgZHJp
dmVyLg0KICAgIA0KICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiANCiAgICA+IC1WaWpheQ0K
ICAgID4gDQogICAgDQogICAgDQoNCg==
