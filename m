Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B898B25843C
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgQb93MNTzDqWP
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:57:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=651215578a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=opPZ/a8h; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=en9LL2aU; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgQZR32NpzDqQX
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 08:57:17 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VMt7Dh009777; Mon, 31 Aug 2020 15:57:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=bAm/sH6s7pTcP2kLbTqG9//q3lAr4+yeu83eN+N1qeQ=;
 b=opPZ/a8hHgoOm0Ag2P/+RAtOiTsUeW3semUArUEYwTpnyZd+45OCcThusSmeIvaS0tSM
 rKShRss99vJWGELTpC/2AtXXGZfXHJchiXCKKM0+8+eC0Fl/1m14+xXkH/5++ia2W4g4
 fP6yZJ306IOcrBloxDmkRcpYVo0DwtnByKQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 337muh2afk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 31 Aug 2020 15:57:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 31 Aug 2020 15:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/0N/hOCnMCg9khnMjDEHR4YrMF78ahv/pMf3132VeLzHfyuWnyJLe5PRMmClcg7zJJJZIXSfkbfwtRH6y5a1mifuFRA+gpLC3IJJT9IIUGhNme4uVWUw94xjrBlK9i0nc4z1PIjGGUth0EcsimSLClqG+B9Vhqz02eoYmrXxnjL0ztpIJQxADgX7zAHkSSFrODbEWfhk6E1cylCrloFpQeUYFDNcCrGticLoIa+AopUSGyi7tWmH2Xnz97frqItTHK+Ov2/cgZjEFYkBir7wucm5lNDqHtZSwvurhTDEYyhtnYOddQ8bfIeQ/EnvxapdxjEuVVnOkj8EnvA9OYByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAm/sH6s7pTcP2kLbTqG9//q3lAr4+yeu83eN+N1qeQ=;
 b=Gnw43u/EMCar3AjwtS8myBL7+/8Ud68m1Idr4aW1H7l60UcGxc8Ov/wTVYW81+Keuz6K4NOUZiNaGSCiSPiXaG8kEQnPiY7gdpu7pk06x99GWwfrbjx/6SJT3Nz90ZTGau6O41AwYewF8+5KcyH9hboOr3BSdgfQ5uAjt8k6GL7BWaGiJdI8wPZbUdmj+YEaOilGPlu0K046AOWsnbMn//5uSjDnLJ4pQSpCC6Vyt3OMuTkxAg50I24yTXdjUcvyB6WP8HbiLqIvtDv4YCWTZYD4/bhPwiTiX8a/we0D5vyrXq4ykJt77W4g4GZ0Md3fs+sSbu0izwoLSgLQydWwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAm/sH6s7pTcP2kLbTqG9//q3lAr4+yeu83eN+N1qeQ=;
 b=en9LL2aU6wdRyPTSU1gsnLAMPLtUBL4oxgZpjosZ/w3+sP8aSuylsZq5PX1TmIbMQo4Xis2Rmuw3H7MlszYC96lNaGUay4oQEtRbcyRLAEfhVZDhaEC4s9ASmKYZGIjjpjVuGp5BY/xcl0cjqRYkpTgZGgZix1xAZzkUFRw2U+U=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2262.namprd15.prod.outlook.com (2603:10b6:a02:8c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 22:57:10 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 22:57:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAlZGEAAA69zED//4xygA==
Date: Mon, 31 Aug 2020 22:57:10 +0000
Message-ID: <86DB51C5-7661-422C-AA3D-CDD2A242D7B8@fb.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <A951892D-226B-45F4-97C1-963AB8E4B2BD@fb.com>
 <655f7aab1c5c44a2a47280f1957fff27@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <655f7aab1c5c44a2a47280f1957fff27@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [73.223.116.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d7a4bf3-87a9-44fe-e3d3-08d84e013159
x-ms-traffictypediagnostic: BYAPR15MB2262:
x-microsoft-antispam-prvs: <BYAPR15MB226242C2FE9E12A3FCA31A96DD510@BYAPR15MB2262.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R34zUD7d39njSHru4Tywj1KhSQ6m+Fc3wt2D2gC2uuQOAxMWJFRyDRbK6JCjygXA5z36mN59t5qcXcpy6FC8VfNMaMIhLAYvYIdpx8EgD1XoaNZaI2Wx0ZaQtC+14SGhFWMAi5lFn/0kYGnXsDHwTtD2qy21QUg6/yZvitSw2oMEt33q+IzvHf1Cw1HDkyE2Zf9uqaQekV1Ju954SfD3ocevkhf+H3HUj82YgJD0U8vYopQW4SL7v0SZSThHAj8MxKHs4BPZFtlksJo1bvW9Dkeufa0UeLW9N09+eXieXrsuxVQ/qHrYPCkrGsuSNbPtZGpN1MdbYtE20Wdw4iNLb+25v4/FLWAee0wnO5zdX88IdnuBT7/63oJcnS60yhqkTUIc/H77mpF8SgpnwacgMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(346002)(39860400002)(396003)(26005)(8676002)(86362001)(8936002)(33656002)(2906002)(110136005)(3480700007)(66946007)(6512007)(71200400001)(53546011)(966005)(36756003)(6506007)(316002)(478600001)(64756008)(66446008)(76116006)(66556008)(66476007)(2616005)(83380400001)(5660300002)(186003)(7116003)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Nm3cE0ch1sfzwxGRTQJidasXu+NHNOCtkOvheOEws/im9kKrqIjrJ2o1dJiHHC2wXqF+v4ohgQzVW25QqI9fElLS3jVoecPLRgUc9odRCtKbvOzMxOuJ7QAhw0FwRNLM5gwjuqFCLV5yjgONmQu0lFLF7o70Jh4h/QJbTQwlyp7yT3anz1omXfoQjzDi1ICk4UWd1LPfo/ajbxcBupyVZmr2ahNCl3pKUrWO2x1mlYVGNJWmWfS4HeIyMOvTTNEv8AgvGkNzltdUGm/fzKtqWI2tqg90AjSu3gQd08zMsMcSreJtuFUWZ4mEqY6IYwFu1RAbKGryXWPqGAdIp9EOX4sqsN0XF7/RXgW5vzh+5rcJoPeHesWclHxJPvS1WrSpWIrjq5Q9X+PUNLSnkxL7CyYQB9I4cSSDb0U+LeqDErc6lx+pumx+BQJa/EcR389wELmkwpiku5gTw9amW68dHY0A0IB/Ns4Nreef6Kc41h5Oec+usyJJgCRXGddDPi+NFynl1ucDdS/wtZF7w7gwHm6bYIwgoOdeNHU/eLpYA5RcDxrcaKHW4VhZrEI1cZKx+6KUN2s8WFhMoHkWaZeM1fZGbSt2xqIr7Kk2gP6Dc6ASGB2FMaOfKHqLPxk78+2FMlLJ97fNxf0gAsg3f9NAuQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EC991E68B61664CB345DC810EC7D786@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7a4bf3-87a9-44fe-e3d3-08d84e013159
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 22:57:10.1264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XtcKZ1Y6XAgBJT6Rr97L6j8fjPSPzVeDjLnXW2qjfkqaW2Qc0xJziEuqJV0LhLqoPhQW4rk0q/Trzn5jOYnug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2262
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_10:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008310135
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

WWVzLCBwbGVhc2UgYWRkIGFueSBwYXRjaCBpbiB0aGUgc2FtZSB0aW9nYXBhc3MgcGxhdGZvcm0g
bGF5ZXINCg0K77u/T24gOC8zMS8yMCwgMzo1MSBQTSwgIkJydWNlIE1pdGNoZWxsIiA8QnJ1Y2Vf
TWl0Y2hlbGxAcGhvZW5peC5jb20+IHdyb3RlOg0KDQogICAgU28geW91IGFyZSBpbXBseWluZyB0
byBub3QgYWRkIGEgc2Vjb25kIHRpb2dhcGFzcywgY29ycmVjdD8NCg0KICAgID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206IFZpamF5IEtoZW1rYSBbbWFpbHRvOnZpamF5
a2hlbWthQGZiLmNvbV0NCiAgICA+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMxLCAyMDIwIDE1OjQ5
DQogICAgPiBUbzogQnJ1Y2UgTWl0Y2hlbGw7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KICAg
ID4gU3ViamVjdDogUmU6IFdoZW4gYnVpbGRpbmcgT3BlbkJNQyAuIC4gLiA/DQogICAgPiANCiAg
ICA+IA0KICAgID4gDQogICAgPiBPbiA4LzMwLzIwLCAzOjA0IFBNLCAib3BlbmJtYyBvbiBiZWhh
bGYgb2YgQnJ1Y2UgTWl0Y2hlbGwiIDxvcGVuYm1jLQ0KICAgID4gYm91bmNlcyt2aWpheWtoZW1r
YT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YNCiAgICA+IEJydWNlX01pdGNo
ZWxsQHBob2VuaXguY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgIFdoZW4gc2VsZWN0aW5n
IFRhcmdldCBoYXJkd2FyZQ0KICAgID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJt
YyMzLXRhcmdldC15b3VyLWhhcmR3YXJlDQogICAgPiAgICAgdG8gYnVpbGQgZm9yIHRoZSBpcyBh
IHRpb2dhcGFzcywgbm93IGlmIEkgYWRkIGEgbWV0YS1waG9lbml4L21ldGEtDQogICAgPiB0aW9n
YXBhc3MvY29uZiAgaG93IGRvZXMNCiAgICA+ICAgICAJc291cmNlIHNldHVwIHRpb2dhcGFzcyBi
dWlsZA0KICAgID4gICAgIGtub3cgd2hpY2ggdGlvZ2FwYXNzIHRvIGJ1aWxkPw0KICAgID4gVGhl
cmUgaXMgb25seSBvbmUgdGlvZ2FwYXNzIGluIHRoZSBzeXN0ZW0gYW5kIGl0IGtib3dzIHdoZXJl
IHRvIGJ1aWxkDQogICAgPiBmcm9tLg0KICAgID4gDQogICAgPiAgICAgT3IgYW0gSSBub3Qgc3Vw
cG9zZWQgdG8gY2hvb3NlIGEgbmFtZSAoaS5lLiB0aW9nYXBhc3MgaW4gdGhpcyBleGFtcGxlKQ0K
ICAgID4gdGhhdCBpcyBhbHJlYWR5IGluIHRoZSBsaXN0DQogICAgPiAgICAgd2hlbiBJIG5lZWQg
dG8gY3JlYXRlIGEgbmV3IG1ldGEtcGhvZW5peC9tZXRhLTxtYWNoaW5lPi9jb25mPw0KICAgID4g
DQogICAgPiAgICAgVGhhbmtzIQ0KICAgID4gDQogICAgPiAgICAgLS0NCiAgICA+ICAgICBCcnVj
ZQ0KICAgID4gDQoNCg0K
