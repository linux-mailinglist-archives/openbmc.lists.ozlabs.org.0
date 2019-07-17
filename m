Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2876F031
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2019 19:32:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45rZgf09HMzDqhk
	for <lists+openbmc@lfdr.de>; Sun, 21 Jul 2019 03:32:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="AbotrxYp"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45rZfj0D43zDqfW
 for <openbmc@lists.ozlabs.org>; Sun, 21 Jul 2019 03:31:22 +1000 (AEST)
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HJeaQD001609
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 15:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=OpsBR18l5rNLgku4RF6CnCh4sVvC8gZrlow3Zh0cQwc=;
 b=AbotrxYpaO/5Vif9ZgoXd6cmPC6BlY5eJiDMQWueHe/zf3ifEbX0nHE4L6sCQ/UJIwsp
 /EkrtPGmsrphcwlPIZI9FOWKFSfZDEZjliNzjvCV+Iq7qcePbLZUrb5qfH5U9QSlsiWv
 mZnlwgU9lTdUBFuht8qPthbEIMXHT5CGGe2p5/qmInihDawZMVFtp/kc9fBPRBMd5NWE
 H7j3BvoA2hJv7INjYekT9IjwIQoHOrni78Pt7W2MvTcQLglErfEbzm6q+LAAV4LcF5/x
 ujB2twUEawAPPo/MqqUxxSadulH/Gc6j2APJbWIJJcC3Ddx0RGSDYTb7HZf05ie2xxLv bw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2tsw0yvb4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 15:44:46 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HJhZXU051148
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 15:44:45 -0400
Received: from ausxipps306.us.dell.com (AUSXIPPS306.us.dell.com
 [143.166.148.156])
 by mx0b-00154901.pphosted.com with ESMTP id 2tt8769qqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 15:44:45 -0400
X-LoopCount0: from 10.166.135.96
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="348718552"
From: <Justin.Lee1@Dell.com>
To: <benwei@fb.com>, <supreeth.venkatesh@arm.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQAyNicAAAOQ2QAAB9Q+YA==
Date: Wed, 17 Jul 2019 19:44:42 +0000
Message-ID: <ef766735da734b8098e46b00359b4f85@AUSX13MPS302.AMER.DELL.COM>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
 <DM5PR15MB1321AAEFD4F1E91F452085AEA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
In-Reply-To: <DM5PR15MB1321AAEFD4F1E91F452085AEA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-07-17T19:44:40.5428473Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170222
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1031
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170222
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
Cc: Jeff.Booher-Kaeding@arm.com, dong.wei@arm.com, sam@mendozajonas.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQmVuLA0KDQpJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIGFib3V0IHRoZSAyLmMgaXRlbSBiZWxv
dy4NCg0KDQo+IEZvciB0aGUgQ0xJIHRvb2wgYW5kIG1hbmFnZW1lbnQgJiBtb25pdG9yaW5nIGRh
ZW1vbiwgSSB3YXMgaW5pdGlhbGx5IHRoaW5raW5nIHVzaW5nIE5DLVNJIG92ZXIgUk1JSS9SQlQs
IG1haW5seSBiZWNhdXNlIGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRzIHRoaXMgYW5kIGl0IHByb3Zp
ZGVzIGEgbmV0bGluayBpbnRlcmZhY2UgZm9yIHVzZXJzcGFjZSB0byBzZW5kL3JlY2VpdmUgY29t
bWFuZHMuDQo+IEJ1dCBJIHRoaW5rIHdlIGNhbiBtYWtlIG91ciBtYW5hZ2VtZW50IHRvb2wgdHJh
bnNwb3J0YXRpb24gYWdub3N0aWMsIHNvIGZvciBOQ1NJb1JNSUkvUkJULCBpdCBjb21tdW5pY2F0
ZXMgdG8ga2VybmVsIE5DU0kgZHJpdmVyIG92ZXIgbmV0bGluaywgYW5kIGZvciBOQ1NJIG92ZXIg
TUNUUCwgaXQgdXNlcyBhIHRoZSBtZWNoYW5pc20gcHJvdmlkZWQgYnkgbGlibWN0cC4NCj4gDQo+
ID4gPiBBbmQgaW4ga2VybmVsIDUueCAsIE5DLVNJIGRyaXZlciBzdXBwb3J0cyBOZXRsaW5rIGlu
dGVyZmFjZSBmb3IgDQo+ID4gPiBjb21tdW5pY2F0aW5nIHdpdGggdXNlcnNwYWNlIHByb2Nlc3Nl
cy4NCj4gPiA+ICAgDQo+ID4gPiBJJ20gdGhpbmtpbmcgYWRkaW5nIHRoZSBmb2xsb3dpbmcgdG9v
bHMgdG8gT3BlbkJNQyBhcyBhIHN0YXJ0aW5nIA0KPiA+ID4gcG9pbnQgYW5kIGJ1aWxkIGZvcm0g
dGhlcmU6DQo+ID4gPiAgDQo+ID4gPiAgICAgICAxLiBBIGNvbW1hbmQgbGluZSB1dGlsaXR5IChl
LmcuIG5jc2ktdXRpbCkgdG8gc2VuZCByYXcgTkMtU0kgDQo+ID4gPiBjb21tYW5kcywgdXNlZnVs
IGZvciBkZWJ1Z2dpbmcgYW5kIGluaXRpYWwgTklDIGJyaW5nIHVwLA0KPiA+ID4gICAgICAgRm9y
IGV4YW1wbGU6DQo+ID4gPiAgICAgICAgICAgbmNzaS11dGlsIC1ldGgwIC1jaCAwIDxyYXcgTkMt
U0kgY29tbWFuZD4NCj4gPiA+ICANCj4gPiA+ICAgICAgIFdlIGNhbiBmdXJ0aGVyIGV4dGVuZCB0
aGlzIGNvbW1hbmQgbGluZSB0b29sIHRvIHN1cHBvcnQgb3RoZXIgDQo+ID4gPiBtYW5hZ2VtZW50
IGludGVyZmFjZXMsIGUuZyBzZW5kaW5nIE1DVFAgb3IgUExETSBjb21tYW5kcyB0byBOSUMuDQo+
ID4gPiAgDQo+ID4gPiAgICAgICAyLiBBIGRhZW1vbiBydW5uaW5nIG9uIE9wZW5CTUMgKGUuZyBu
Y3NpZCkgbW9uaXRvcmluZyBOSUMgDQo+ID4gPiBzdGF0dXMsICBmb3IgZXhhbXBsZToNCj4gPiA+
ICAgICAgICAgICBhLiBRdWVyeSBhbmQgbG9nIE5JQyBjYXBhYmlsaXR5IGFuZCBjdXJyZW50IHBh
cmFtZXRlciANCj4gPiA+IHNldHRpbmcNCj4gPiA+ICAgICAgICAgICBiLiBQZXJpb2RpY2FsbHkg
Y2hlY2sgTklDIGxpbmsgc3RhdHVzLCByZS1pbml0aWFsaXplIE5DLVNJIA0KPiA+ID4gbGluayBp
ZiBOSUMgaXMgdW5yZWFjaGFibGUsIGxvZyB0aGUgc3RhdHVzDQo+ID4gPiAgICAgICAgICAgYy4g
RW5hYmxlIGFuZCBtb25pdG9yIE5JQyBBc3luY2hyb25vdXMgRXZlbnQgTm90aWZpY2F0aW9ucw0K
PiA+ID4gKEFFTnMpIA0KDQoNCkZvciBzZWxlY3RlZCBjaGFubmVscywgQUVOIGlzIGVuYWJsZWQg
YnkgZGVmYXVsdC4gRG8geW91IHBsYW4gdG8gZW5hYmxlIHRoZSBBRU4gZm9yIG5vbi1zZWxlY3Rl
ZCBjaGFubmVscyB0b28/DQoNCklmIHllcywgd2hhdCBpcyB0aGUgYXBwcm9hY2ggeW91IGFyZSBn
b2luZyB0byBkbz8gRW5hYmxlIGl0IGJ5IHVzZXJzcGFjZSBvciBtb2RpZnkgTkMtU0kgZHJpdmVy
IHRvIGFjaGlldmUgdGhhdD8NCldlIGFyZSBwbGFubmluZyB0byBtb25pdG9yIGFsbCBjaGFubmVs
cyBidXQgc3RpbGwgbG9vayBmb3IgdGhlIGJlc3Qgd2F5Lg0KDQoNCkZvciBkZWxpdmVyaW5nIHRo
ZSBBRU4gdG8gdXNlcnNwYWNlLCBjdXJyZW50bHksIHdlIGltcGxlbWVudCBpdCB2aWEgdGhlIG1j
Z3JwcyBsb2NhbGx5IGJ1dCBwbGFuIHRvIHVwc3RyZWFtLg0KDQplbnVtIG5jc2lfZ2VubF9tdWx0
aWNhc3RfZ3JvdXBzIHsNCglOQ1NJX0dFTkxfTUNHUlBfQUVOLA0KfTsNCg0Kc3RhdGljIGNvbnN0
IHN0cnVjdCBnZW5sX211bHRpY2FzdF9ncm91cCBuY3NpX2dlbmxfbWNncnBzW10gPSB7DQoJW05D
U0lfR0VOTF9NQ0dSUF9BRU5dID0geyAubmFtZSA9IE5DU0lfR0VOTF9NQ0dSUF9BRU5fTkFNRSB9
LA0KfTsNCg0Kc3RhdGljIHN0cnVjdCBnZW5sX2ZhbWlseSBuY3NpX2dlbmxfZmFtaWx5IF9fcm9f
YWZ0ZXJfaW5pdCA9IHsNCgkubmFtZSA9ICJOQ1NJIiwNCgkudmVyc2lvbiA9IDAsDQoJLm1heGF0
dHIgPSBOQ1NJX0FUVFJfTUFYLA0KCS5tb2R1bGUgPSBUSElTX01PRFVMRSwNCgkub3BzID0gbmNz
aV9vcHMsDQoJLm5fb3BzID0gQVJSQVlfU0laRShuY3NpX29wcyksDQoJLm1jZ3JwcyA9IG5jc2lf
Z2VubF9tY2dycHMsDQoJLm5fbWNncnBzID0gQVJSQVlfU0laRShuY3NpX2dlbmxfbWNncnBzKSwN
Cn07DQoNCg0KPiA+ID4gICAgICAgICAgICAgICAgIGkuIHN1Y2ggYXMgIExpbmsgU3RhdHVzIENo
YW5nZSwgQ29uZmlndXJhdGlvbiANCj4gPiA+IHJlcXVpcmVkLCBIb3N0IGRyaXZlciBzdGF0dXMg
Y2hhbmdlDQo+ID4gPiAgICAgICAgICAgICAgICAgaWkuIHRoZXJlIGFyZSBPRU0tc3BlY2lmaWMg
QUVOcyB0aGF0IEJNQyBtYXkgYWxzbyANCj4gPiA+IGVuYWJsZSBhbmQgbW9uaXRvcg0KPiA+ID4g
ICAgICAgICAgICAgICAgIGlpaS4gZWl0aGVyIGxvZyB0aGVzZSBldmVudHMsIGFuZC9vciBwZXJm
b3JtcyANCj4gPiA+IHJlY292ZXJ5IGFuZCByZW1lZGlhdGlvbiBhcyBuZWVkZWQNCj4gPiA+ICAg
ICAgICAgICBkLiBBZGRpdGlvbmFsIG1vbml0b3Jpbmcgc3VjaCBhcyANCj4gPiA+ICAgICAgICAg
ICAgICAgICBpLiAgdGVtcGVyYXR1cmUgKG5vdCBpbiBzdGFuZGFyZCBOQy1TSSBjb21tYW5kIHll
dCksIA0KPiA+ID4gICAgICAgICAgICAgICAgIGlpLiBmaXJtd2FyZSB2ZXJzaW9uLCB1cGRhdGUg
ZXZlbnQsIG5ldHdvcmsgdHJhZmZpYyANCj4gPiA+IHN0YXRpc3RpY3MNCj4gPiA+ICANCj4gPiA+
IEJvdGggdGhlIENMSSB0b29sIGFuZCB0aGUgbW9uaXRvcmluZyBkYWVtb24gY2FuIGVpdGhlciBj
b21tdW5pY2F0ZSANCj4gPiA+IHRvIGtlcm5lbCBkcml2ZXIgZGlyZWN0bHkgdmlhIE5ldGxpbmsg
aW5kZXBlbmRlbnRseSwgb3Igd2UgY2FuIGhhdmUgDQo+ID4gPiB0aGUgbmNzaSBkYWVtb24gYWN0
aW5nIGFzIGNvbW1hbmQgc2VyaWFsaXplciB0byBrZXJuZWwgYW5kIG90aGVyIA0KPiA+ID4gdXNl
cg0KPiA+IHNwYWNlIHByb2Nlc3Nlcy4NCj4gPiA+IFRoZXNlIGFyZSBqdXN0IHNvbWUgb2YgbXkg
aW5pdGlhbCB0aG91Z2h0cyBhbmQgSSdkIGxvdmUgdG8gaGVhciBzb21lIA0KPiA+ID4gZmVlZGJh
Y2sgaWYgdGhlc2Ugd291bGQgYmUgdXNlZnVsIHRvIE9wZW5CTUMuDQo+ID4gPiANCj4gPiA+IElm
IGFueW9uZSBpbiBpbnRlcmVzdGVkIGluIGNvbGxhYm9yYXRlIG9uIHRoZXNlIHdlIGNhbiBkaXNj
dXNzIG1vcmUgDQo+ID4gPiBvbiBmZWF0dXJlcyBhbmQgZGVzaWduIGRldGFpbHMuDQo+ID4gSSBh
bSBpbnRlcmVzdGVkIGluIGNvbGxhYm9yYXRpbmcgb24gdGhlIGRlc2lnbiBkZXRhaWxzLg0KPiAN
Cj4gR3JlYXQhIEkgY2FuIHB1dCBhIGRyYWZ0IG9uIEdlcnJpdCBhbmQgd2UgY2FuIHdvcmsgdG9n
ZXRoZXIgb24gdGhpcy4gRG8geW91IGhhdmUgYWRkaXRpb25hbCB1c2VzIGNhc2VzIHlvdSdyZSBs
b29raW5nIGZvcj8NCj4gDQo+IFJlZ2FyZHMNCj4gLUJlbg0KDQpUaGFua3MsDQpKdXN0aW4NCg==
