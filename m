Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78297506B16
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 13:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjMMN2WlJz300Q
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 21:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.a=rsa-sha256 header.s=jan2016.eng header.b=KUBwSJtk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=akamai.com (client-ip=2620:100:9001:583::1;
 helo=mx0a-00190b01.pphosted.com; envelope-from=iwolosch@akamai.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=akamai.com header.i=@akamai.com header.a=rsa-sha256
 header.s=jan2016.eng header.b=KUBwSJtk; 
 dkim-atps=neutral
X-Greylist: delayed 1800 seconds by postgrey-1.36 at boromir;
 Tue, 19 Apr 2022 21:40:55 AEST
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjMLv2kRyz2x9p
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 21:40:48 +1000 (AEST)
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
 by m0050093.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 23JB5J0b021924; Tue, 19 Apr 2022 12:10:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=jan2016.eng;
 bh=nK6iYH5vzwkVCcX892uCKoleL8b2+YiulWkf1WFAE+c=;
 b=KUBwSJtk5+nAyTWQ/uYtS7Y70Pe9M9KJnYiu/2H1hjI+RGGOzUvWGiD2w4r62dT26+YS
 o26mdvWbyZKi56ec4zHSMup4K+174Iot+Raxcu0ncIfEmJxnJ8OzTZJ1zEnhQzimhWQv
 3GnutJ0ZUbQTns7vxE7QtUke47k/tqqnCscb8Y91V81rtsp7XnZgiBX3UE+8sIXefnWb
 YtNg+UpyqCSnWQ8dTxMn4FZmycVYSA4QxXl/fXKH4U1v7S1MaLQWfbwiU6vdZDhmNgKr
 Mq07RZ07CE13cVq9zoRrUq1d8JyBvjdTM9lk40ABwOgFQ+6IO2Lz+Xx4Dwp+1yROxb2w Ww== 
Received: from prod-mail-ppoint6 (prod-mail-ppoint6.akamai.com [184.51.33.61]
 (may be forged))
 by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3ffpkk0uc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 12:10:34 +0100
Received: from pps.filterd (prod-mail-ppoint6.akamai.com [127.0.0.1])
 by prod-mail-ppoint6.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 23JB6J7l014764; Tue, 19 Apr 2022 07:10:33 -0400
Received: from email.msg.corp.akamai.com ([172.27.123.57])
 by prod-mail-ppoint6.akamai.com with ESMTP id 3ffs4ydkxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 07:10:33 -0400
Received: from USTX2EX-DAG3MB3.msg.corp.akamai.com (172.27.165.127) by
 usma1ex-dag4mb5.msg.corp.akamai.com (172.27.91.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 07:10:33 -0400
Received: from USTX2EX-DAG3MB6.msg.corp.akamai.com (172.27.165.130) by
 USTX2EX-DAG3MB3.msg.corp.akamai.com (172.27.165.127) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 06:10:32 -0500
Received: from USTX2EX-DAG3MB6.msg.corp.akamai.com ([172.27.165.130]) by
 USTX2EX-DAG3MB6.msg.corp.akamai.com ([172.27.165.130]) with mapi id
 15.00.1497.033; Tue, 19 Apr 2022 06:10:32 -0500
From: "Woloschin, Ian" <iwolosch@akamai.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Index: AQHYUFC3wzcdnWsyE0C35dXq0R/P9azwotgAgABPBACAAAINgIAF0LoAgAAaGwCAAE2NAA==
Date: Tue, 19 Apr 2022 11:10:32 +0000
Message-ID: <A7880E9C-D21E-41CC-BD57-644EFAA9732F@akamai.com>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
 <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
 <TY2PR06MB33910DF8FDDE1072646911B4F2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Yl4JcpZNvPQWcL3C@hatter.bewilderbeest.net>
 <HK0PR06MB33800677F5A1735DF472A90EF2F29@HK0PR06MB3380.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB33800677F5A1735DF472A90EF2F29@HK0PR06MB3380.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.60.22041000
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.27.164.43]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB4F4D226EF66347BC77122C52D9E05C@akamai.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_04:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190062
X-Proofpoint-GUID: 3AS4tWRXszHHQ-BBBRf330hJD_fh9f4J
X-Proofpoint-ORIG-GUID: 3AS4tWRXszHHQ-BBBRf330hJD_fh9f4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 clxscore=1011
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190063
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

WXVwLCBJJ20gcHJldHR5IHN1cmUgbXkgc3lzdGVtcyBuZWVkIFN1cGVySU8gdG8gY29uZmlndXJl
IHRoZSBzZXJpYWwgcG9ydHMgd2hpY2ggd2UgZG8gdXNlLCB0aG91Z2ggSSdsbCBiZSB0aGUgZmly
c3QgdG8gYWRtaXQgSSBkbyBub3QgZW50aXJlbHkgdW5kZXJzdGFuZCBob3cgYW55IG9mIHRoaXMg
aXMgYWN0dWFsbHkgY29uZmlndXJlZC4NCg0KLUlhbg0KDQrvu79PbiA0LzE4LzIyLCAxMDozMyBQ
TSwgIlJ5YW4gQ2hlbiIgPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQoNCiAgICBI
ZWxsbywNCiAgICAJWWVzLCBsZWF2ZSBTQ1U3MFsyMF0gPTAsIHNldCBISUNSNVs4XSA9IDAsIEhJ
Q1JCWzZdID0gMSBpcyBlbm91Z2ggdG8gZGlzYWJsZSBMUEMyQUhCLg0KICAgIAlISUNSNVs2XSBp
cyBMUEMgZncgY3ljbGUgaXQgaXMgYWxsb3dlZC4NCg0KICAgIFJ5YW4NCg0KICAgID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206IFpldiBXZWlzcyA8emV2QGJld2lsZGVy
YmVlc3QubmV0Pg0KICAgID4gU2VudDogVHVlc2RheSwgQXByaWwgMTksIDIwMjIgOTowMCBBTQ0K
ICAgID4gVG86IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KICAgID4gQ2M6
IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7
IEFuZHJldyBKZWZmZXJ5DQogICAgPiA8YW5kcmV3QGFqLmlkLmF1PjsgSWFuIFdvbG9zY2hpbiA8
aWFuLndvbG9zY2hpbkBha2FtYWkuY29tPg0KICAgID4gU3ViamVjdDogUmU6IFtQQVRDSCB1LWJv
b3QgdjIwMTkuMDQtYXNwZWVkLW9wZW5ibWMgdjJdIGFzcGVlZDogYWRkDQogICAgPiBDT05GSUdf
QVNQRUVEX0VOQUJMRV9CQUNLRE9PUlMNCiAgICA+IA0KICAgID4gT24gRnJpLCBBcHIgMTUsIDIw
MjIgYXQgMDE6MTE6MDlBTSBQRFQsIFJ5YW4gQ2hlbiB3cm90ZToNCiAgICA+ID5IZWxsbywNCiAg
ICA+ID4JVGhhbmtzIHlvdXIgcmVzcG9uc2UuDQogICAgPiA+CUFuZCB5ZXMsIEkgcHJlZmVyIGFw
cGx5IHBhdGNoIHdpdGhvdXQgYW55IGNvbmZpZyB0byBkaXNhYmxlIGl0Lg0KICAgID4gPg0KICAg
ID4gPlJ5YW4NCiAgICA+ID4NCiAgICA+IA0KICAgID4gQWZ0ZXIgdGhpbmtpbmcgYWJvdXQgdGhp
cyBhIGJpdCBtb3JlLCBJIHJlbWVtYmVyZWQgdGhhdCBJYW4gV29sb3NjaGluDQogICAgPiAoQ0Nl
ZCkgaGFkIG1lbnRpb25lZCBhdCBzb21lIHBvaW50IHRoYXQgdGhlIHN5c3RlbXMgaGUgd29ya3Mg
d2l0aCBkbyBpbiBmYWN0DQogICAgPiB1c2UgdGhlIEFTVDI1MDAncyBidWlsdC1pbiBTdXBlci1J
TywgYW5kIGhlbmNlIHdvdWxkIHByZXN1bWFibHkgYmUgYnJva2VuIGJ5DQogICAgPiBhIHBhdGNo
IHRoYXQgdW5jb25kaXRpb25hbGx5IGRpc2FibGVkIHRoYXQuICBBbmQgaW4gY29udHJhc3QsIHRo
ZSBBU1JvY2sgYm9hcmRzDQogICAgPiBJJ3ZlIGJlZW4gd29ya2luZyB3aXRoIHJlcXVpcmUgdGhl
IEFTVDI1MDAgU3VwZXItSU8gdG8gYmUgZGlzYWJsZWQgZm9yIHRoZQ0KICAgID4gaG9zdCB0byBi
b290IHByb3Blcmx5LCBzbyBpdCBzZWVtcyBsaWtlIHdlJ2xsIG5lZWQNCiAgICA+ICpzb21lKiBt
aW5pbWFsIGFtb3VudCBvZiBjb25maWd1cmFiaWxpdHkgdG8gc3VwcG9ydCBhdCBsZWFzdCB0aG9z
ZSB0d28NCiAgICA+IGNsYXNzZXMgb2Ygc3lzdGVtcyAoaS5lLiBhIEtjb25maWcgYm9vbGVhbiB0
aGF0IGRldGVybWluZXMgd2hldGhlciB0aGUNCiAgICA+IFN1cGVyLUlPIHNob3VsZCBiZSBlbmFi
bGVkIG9yIGRpc2FibGVkKS4NCiAgICA+IA0KICAgID4gSSBkb24ndCBrbm93IG9mZmhhbmQgd2hh
dCB0aGUgaW50ZXJhY3Rpb25zIGJldHdlZW4gU0NVNzBbMjBdLCBISUNSQls2XSwgYW5kDQogICAg
PiBISUNSNVsxMF0gYXJlIHRob3VnaCwgYW5kIEkgZG9uJ3QgaGF2ZSBhbnkgaGFyZHdhcmUgdGhh
dCBhY3R1YWxseSB1c2VzIHRoZQ0KICAgID4gQVNUMjUwMCBTdXBlci1JTyB0byB0ZXN0IHdpdGgu
ICBXb3VsZCBsZWF2aW5nIFNDVTcwWzIwXT0wIHRvIGVuYWJsZSB0aGUNCiAgICA+IFN1cGVyLUlP
IHdoaWxlIGxlYXZpbmcgSElDUkJbNl09MSBhbmQgSElDUjVbMTBdPTAgd29yayBmb3Igc3lzdGVt
cyBsaWtlDQogICAgPiBJYW4ncyB0byBlbmFibGUgdGhlIFN1cGVyLUlPIHdoaWxlIGtlZXBpbmcg
ZXZlcnl0aGluZyBlbHNlIGxvY2tlZCBkb3duIGFzDQogICAgPiBtdWNoIGFzIHBvc3NpYmxlPw0K
ICAgID4gDQogICAgPiANCiAgICA+IFpldg0KDQoNCg==
