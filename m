Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F59A258
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 23:48:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dynp5zfXzDrb6
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 07:48:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=paul.vancil@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="GYc2QSgf"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dyn94R3TzDqfY
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 07:47:39 +1000 (AEST)
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MLjAUS005726
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 17:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=FfUpmg0QdS1O/+rHfiiD+ELGLqDJe4NaB7YTmjzsH0U=;
 b=GYc2QSgfdYP7uHwC2mfmFbh5QO4J3Ic/KUicJOaWi8CN1fA3g3OwuBNh6QGiGsVuex62
 bPJ3VjdPFnuRblrhWRwfn4k9a4nWMWo6aEnRTHQVw5oRBoJdG/YM2chCD3s3yNQGUaKS
 0neONJFGMgC/8vJaVRhrMT73as40ogQJK3PZ7U+v6oRh3/q+N3Do2o1HyedsnfItcC9f
 oXpxTrDLYB3sqyl6Wrijs/04DAxEZ0xnzOvlbujd5CCUiPxZifbxyTsjEiG0/EH8ezB7
 JYzmYZ8jMXOgLhFxBPs2t7jC5MhBHCeSvVQswuwfrO7eL2hujhysFYf8aFqlBkYKAm6u Zw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2uhs6b2v8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 17:47:34 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MLlSpU126346
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 17:47:33 -0400
Received: from ausxipps301.us.dell.com (ausxipps301.us.dell.com
 [143.166.148.223])
 by mx0a-00154901.pphosted.com with ESMTP id 2uey0u7fyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 17:47:32 -0400
X-LoopCount0: from 10.166.135.98
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="386003954"
From: <Paul.Vancil@dell.com>
To: <vijaykhemka@fb.com>, <gmills@linux.vnet.ibm.com>, <neladk@microsoft.com>, 
 <openbmc@lists.ozlabs.org>
Subject: RE: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eAAZhsAAABeOw0AAFAxbAAAv3HuAAAfCb5A=
Date: Thu, 22 Aug 2019 21:47:23 +0000
Message-ID: <be08f05341ad4878bf736fa0a0a7fef4@AUSX13MPS302.AMER.DELL.COM>
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
 <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
 <7C51D2AB-7154-43C4-9B6A-03C3FD27DF23@fb.com>
In-Reply-To: <7C51D2AB-7154-43C4-9B6A-03C3FD27DF23@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908220190
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

VmlqYXksDQpTaW5jZSBETVRGIGhhcyBub3QgcmVsZWFzZWQgaXQgYXMgcHVibGljIGFuZCBpdCBo
YXMgcXVpdGUgYSBmZXcgZXJyb3JzIGluIGl0LCB0aGV5IGRvbuKAmXQgd2FudCB0byB1bnRpbCBm
aXhlZC4NCkkgd2lsbCBjcmVhdGUgYW4gT3BlbkJNQyBUZWxlbWV0cnkgbW9ja3VwIHRoYXQgbG9v
a3MgbW9yZSBPcGVuQk1DIGxpa2UgYmFzZWQgb24gT3BlbkJNQyBwbGF0Zm9ybSBtb2NrdXBzIEkg
aGF2ZSBwdWxsZWQgYXQgcGx1Z2Zlc3RzLg0KVGhlbiBJJ2xsIHB1dCB0aGUgY29ycmVjdGVkIFRl
bGVtZXRyeSByZXNvdXJjZXMgdW5kZXIgdGhhdC4NCg0KVGhhbmtzDQpwYXVsdg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5j
b20+IA0KU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMiwgMjAxOSAzOjI4IFBNDQpUbzogR3VubmFy
IE1pbGxzOyBWYW5jaWwsIFBhdWw7IG5lbGFka0BtaWNyb3NvZnQuY29tOyBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBUZWxlbWV0cnkgUmVkZmlzaCBNb2NrdXAgbG9jYXRp
b24gYXQgRE1URg0KDQoNCltFWFRFUk5BTCBFTUFJTF0gDQoNCg0KDQrvu79PbiA4LzIxLzE5LCAy
OjM4IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgR3VubmFyIE1pbGxzIiA8b3BlbmJtYy1ib3Vu
Y2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBnbWls
bHNAbGludXgudm5ldC5pYm0uY29tPiB3cm90ZToNCg0KICAgIA0KICAgIE9uIDgvMjEvMjAxOSAx
MjowOCBQTSwgUGF1bC5WYW5jaWxAZGVsbC5jb20gd3JvdGU6DQogICAgPiBOZWVyYWosDQogICAg
PiBJdCB3b3JrcyBpZiB5b3UgaGF2ZSBhY2Nlc3MgdG8gdGhlIGdpdGh1Yi5jb20vRE1URi9SZWRm
aXNoIHJlcG8uDQpXZSBhcyBGYWNlYm9vayBhbHNvIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoaXMg
cHJpdmF0ZSByZXBvLiBDYW4geW91IHBsZWFzZSBtb3ZlIHRoaXMgaW50byBvdXIgb3BlbmJtYyBy
ZXBvLg0KICAgIA0KICAgIEhpIE5lZXJhaiwNCiAgICANCiAgICBMaW5rIHdvcmtlZCBmb3IgbWUg
YXMgd2VsbC4NCiAgICBNaWNyb3NvZnQgaXMgYSBSZWRmaXNoIEZvcnVtIFN1cHBvcnRlciBzbyB5
b3Ugc2hvdWxkIGJlIGFibGUgdG8gZ2V0IA0KICAgIGFjY2VzcyB0byB0aGUgZ2l0aHViLmNvbS9E
TVRGL1JlZGZpc2ggcmVwbyBieToNCiAgICANCiAgICAxLiBKb2luaW5nIHRoZSBETVRGIGhlcmU6
IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fd3d3
LmRtdGYub3JnX2pvaW4mZD1Ed0lEYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBL
aTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPUNSTFQwTWo4ZElIaDdUc2ZK
eVlWVGJJbjFJZEJfU0w1QXJlWm5PbGlhWk0mcz1vUDNXWXZoc09ZaDlXWWhFM0ZUdHVnYXZJUWQz
ZzFLMEFDdWtvWko5bkkwJmU9IA0KICAgIDIuIEFmdGVyIGpvaW5pbmcgdGhlIERNVEYsIGpvaW4g
dGhlIFJlZGZpc2ggZm9ydW0gaGVyZTogDQogICAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9p
bnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19tZW1iZXJzLmRtdGYub3JnX2FwcHNfb3JnX3dvcmtn
cm91cF9wb3J0YWxfJmQ9RHdJRGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5
cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1DUkxUME1qOGRJSGg3VHNmSnlZ
VlRiSW4xSWRCX1NMNUFyZVpuT2xpYVpNJnM9NExVeXEzaktaazEtLVJPOG9lVk8wa0tEMDg5MDBs
UUJLelZuOEhEUzVxZyZlPSANCiAgICAgICAgICAgICBNZW51ID4gR3JvdXAgPiBBbGwgR3JvdXBz
IC0tIFNlbGVjdCAiUmVkZmlzaCBGb3J1bSINCiAgICAzLiBTZW5kIGFuIGVtYWlsIHRvIHRoZSBS
ZWRmaXNoIGZvcnVtIGFza2luZyBmb3IgeW91ciBHaXRIdWIgSUQgdG8gYmUgDQogICAgZ2l2ZW4g
YWNjZXNzIHRvIHRoZSBwcml2YXRlIFJlZGZpc2ggcmVwb3NpdG9yeQ0KICAgIA0KICAgIC0gR3Vu
bmFyDQogICAgDQogICAgDQogICAgPiBGb3IgdGhvc2Ugd2hvIGhhdmUgYWNjZXNzIHRvIHRoZSBE
TVRGIHByaXZhdGUgcmVwbyBvbiBnaXRodWIsIFRoZSBsb2NhdGlvbiBvZiB0aGUgY3VycmVudCBU
ZWxlbWV0cnkgbW9ja3VwIGlzOg0KICAgID4gICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tXy0zRnVybC0zRGh0dHBzLTI1M0EtMjUyRi0yNTJGZ2l0aHViLmNvbS0yNTJGRE1URi0y
NTJGUmVkZmlzaC0yNTJGdHJlZS0yNTJGbWFzdGVyLTI1MkZtb2NrdXBzLTI1MkZwdWJsaWMtMkR0
ZWxlbWV0cnktMjZhbXAtM0JkYXRhLTNEMDItMjU3QzAxLTI1N0NuZWxhZGstMjU0MG1pY3Jvc29m
dC5jb20tMjU3QzIzZTI3YWE5NjI3YTQ3YmUzOGJlMDhkNzI1ZDRkMGY1LTI1N0M3MmY5ODhiZjg2
ZjE0MWFmOTFhYjJkN2NkMDExZGI0Ny0yNTdDMS0yNTdDMC0yNTdDNjM3MDE5NDY4Mjg2MTA0MjU5
LTI2YW1wLTNCc2RhdGEtM0RYWnMwRk03cDk3Z3JiUzUwRXVTMGxBV2stMjUyQnItMjUyQmFNdUd4
UmVSU3hnWjFMdnMtMjUzRC0yNmFtcC0zQnJlc2VydmVkLTNEMCZkPUR3SURhUSZjPTVWRDBSVHRO
bFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VT
bDVnJm09Q1JMVDBNajhkSUhoN1RzZkp5WVZUYkluMUlkQl9TTDVBcmVabk9saWFaTSZzPWN1dDct
VThtcjJjMl9uaS02QXpTd0lCeGtUTlRnTU9IN3pGd05DckVlN1EmZT0gDQogICAgPg0KICAgIA0K
DQo=
