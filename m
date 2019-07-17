Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419E6C30F
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 00:20:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45psCX2ldPzDqTY
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 08:20:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="lAkm5YYB"; 
 dkim-atps=neutral
X-Greylist: delayed 9300 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jul 2019 08:19:51 AEST
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45psBv0zpBzDqKh
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 08:19:48 +1000 (AEST)
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HMFFVF030770
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 18:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=0EkQAG/sWb8/3TdcQDoLlLT4G1MvoGxlDl1Cpgg9HvQ=;
 b=lAkm5YYBwbMJRSReQzzx/wMMtumP7VnMyvC2LgHNUX+J3gz03wphI6bGcneLMRiu2uNC
 Bzq5lCkNS9vnOLdt6zMzWcN3nicUtzsyXm3XAHje5+fdk7FHP/A+e8NeyB8jfbErzqGg
 VWeID+ovP6XYVW0H00izOqaShXLt3QCzTC1TCMEXJ/k6G9lR8mMV0iWlC67wL0U9coIC
 qlhexj6BYRPRX1iHonhP3qt5MKscLoP0n07DotadNyopY0BhaySKQqLJGyAo3+xAJWDn
 Ng9PvK6zHwObTCXoSAFKw33JUj3NoyKvTc5sC7lCADcTQ8SKqfcDXgqQRrzWvuuAgaVs QA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 2tt59x9v0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 18:19:44 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HMIOvC082687
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 18:19:44 -0400
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com
 [143.166.148.206])
 by mx0b-00154901.pphosted.com with ESMTP id 2tt75emj6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 18:19:44 -0400
X-LoopCount0: from 10.166.135.93
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="1332360524"
From: <Justin.Lee1@Dell.com>
To: <benwei@fb.com>, <supreeth.venkatesh@arm.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQAyNicAAAOQ2QAAB9Q+YP//6ZiAgAA7KqA=
Date: Wed, 17 Jul 2019 22:19:42 +0000
Message-ID: <de2f4cdb9f5e4a8b943e72efd27a9c14@AUSX13MPS302.AMER.DELL.COM>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6c8358ba6edda830110b331be552beedba0a50a2.camel@arm.com>
 <DM5PR15MB1321AAEFD4F1E91F452085AEA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
 <ef766735da734b8098e46b00359b4f85@AUSX13MPS302.AMER.DELL.COM>
 <DM5PR15MB13211397B4364925E53293EAA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
In-Reply-To: <DM5PR15MB13211397B4364925E53293EAA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
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
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170249
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1031
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170248
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

DQoNCj4gPiBIaSBCZW4sDQo+ID4NCj4gPiBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIGFib3V0IHRo
ZSAyLmMgaXRlbSBiZWxvdy4NCj4gPg0KPiA+DQo+ID4gPiBGb3IgdGhlIENMSSB0b29sIGFuZCBt
YW5hZ2VtZW50ICYgbW9uaXRvcmluZyBkYWVtb24sIEkgd2FzIGluaXRpYWxseSB0aGlua2luZyB1
c2luZyBOQy1TSSBvdmVyIFJNSUkvUkJULCBtYWlubHkgYmVjYXVzZSBrZXJuZWwgYWxyZWFkeSBz
dXBwb3J0cyB0aGlzIGFuZCBpdCBwcm92aWRlcyBhIG5ldGxpbmsgaW50ZXJmYWNlIGZvciB1c2Vy
c3BhY2UgdG8gc2VuZC9yZWNlaXZlIGNvbW1hbmRzLg0KPiA+ID4gQnV0IEkgdGhpbmsgd2UgY2Fu
IG1ha2Ugb3VyIG1hbmFnZW1lbnQgdG9vbCB0cmFuc3BvcnRhdGlvbiBhZ25vc3RpYywgc28gZm9y
IE5DU0lvUk1JSS9SQlQsIGl0IGNvbW11bmljYXRlcyB0byBrZXJuZWwgTkNTSSBkcml2ZXIgb3Zl
ciBuZXRsaW5rLCBhbmQgZm9yIE5DU0kgb3ZlciBNQ1RQLCBpdCB1c2VzIGEgdGhlIG1lY2hhbmlz
bSBwcm92aWRlZCBieSBsaWJtY3RwLg0KPiA+ID4gDQo+ID4gPiA+ID4gQW5kIGluIGtlcm5lbCA1
LnggLCBOQy1TSSBkcml2ZXIgc3VwcG9ydHMgTmV0bGluayBpbnRlcmZhY2UgZm9yIA0KPiA+ID4g
PiA+IGNvbW11bmljYXRpbmcgd2l0aCB1c2Vyc3BhY2UgcHJvY2Vzc2VzLg0KPiA+ID4gPiA+ICAg
DQo+ID4gPiA+ID4gSSdtIHRoaW5raW5nIGFkZGluZyB0aGUgZm9sbG93aW5nIHRvb2xzIHRvIE9w
ZW5CTUMgYXMgYSBzdGFydGluZyANCj4gPiA+ID4gPiBwb2ludCBhbmQgYnVpbGQgZm9ybSB0aGVy
ZToNCj4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gICAgICAgMS4gQSBjb21tYW5kIGxpbmUgdXRpbGl0
eSAoZS5nLiBuY3NpLXV0aWwpIHRvIHNlbmQgcmF3IA0KPiA+ID4gPiA+IE5DLVNJIGNvbW1hbmRz
LCB1c2VmdWwgZm9yIGRlYnVnZ2luZyBhbmQgaW5pdGlhbCBOSUMgYnJpbmcgdXAsDQo+ID4gPiA+
ID4gICAgICAgRm9yIGV4YW1wbGU6DQo+ID4gPiA+ID4gICAgICAgICAgIG5jc2ktdXRpbCAtZXRo
MCAtY2ggMCA8cmF3IE5DLVNJIGNvbW1hbmQ+DQo+ID4gPiA+ID4gIA0KPiA+ID4gPiA+ICAgICAg
IFdlIGNhbiBmdXJ0aGVyIGV4dGVuZCB0aGlzIGNvbW1hbmQgbGluZSB0b29sIHRvIHN1cHBvcnQg
DQo+ID4gPiA+ID4gb3RoZXIgbWFuYWdlbWVudCBpbnRlcmZhY2VzLCBlLmcgc2VuZGluZyBNQ1RQ
IG9yIFBMRE0gY29tbWFuZHMgdG8gTklDLg0KPiA+ID4gPiA+ICANCj4gPiA+ID4gPiAgICAgICAy
LiBBIGRhZW1vbiBydW5uaW5nIG9uIE9wZW5CTUMgKGUuZyBuY3NpZCkgbW9uaXRvcmluZyBOSUMg
DQo+ID4gPiA+ID4gc3RhdHVzLCAgZm9yIGV4YW1wbGU6DQo+ID4gPiA+ID4gICAgICAgICAgIGEu
IFF1ZXJ5IGFuZCBsb2cgTklDIGNhcGFiaWxpdHkgYW5kIGN1cnJlbnQgcGFyYW1ldGVyIA0KPiA+
ID4gPiA+IHNldHRpbmcNCj4gPiA+ID4gPiAgICAgICAgICAgYi4gUGVyaW9kaWNhbGx5IGNoZWNr
IE5JQyBsaW5rIHN0YXR1cywgcmUtaW5pdGlhbGl6ZSANCj4gPiA+ID4gPiBOQy1TSSBsaW5rIGlm
IE5JQyBpcyB1bnJlYWNoYWJsZSwgbG9nIHRoZSBzdGF0dXMNCj4gPiA+ID4gPiAgICAgICAgICAg
Yy4gRW5hYmxlIGFuZCBtb25pdG9yIE5JQyBBc3luY2hyb25vdXMgRXZlbnQgDQo+ID4gPiA+ID4g
Tm90aWZpY2F0aW9ucw0KPiA+ID4gPiA+IChBRU5zKQ0KPiA+DQo+ID4NCj4gPiBGb3Igc2VsZWN0
ZWQgY2hhbm5lbHMsIEFFTiBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIERvIHlvdSBwbGFuIHRvIGVu
YWJsZSB0aGUgQUVOIGZvciBub24tc2VsZWN0ZWQgY2hhbm5lbHMgdG9vPw0KPiA+IElmIHllcywg
d2hhdCBpcyB0aGUgYXBwcm9hY2ggeW91IGFyZSBnb2luZyB0byBkbz8gRW5hYmxlIGl0IGJ5IHVz
ZXJzcGFjZSBvciBtb2RpZnkgTkMtU0kgZHJpdmVyIHRvIGFjaGlldmUgdGhhdD8NCj4gPiBXZSBh
cmUgcGxhbm5pbmcgdG8gbW9uaXRvciBhbGwgY2hhbm5lbHMgYnV0IHN0aWxsIGxvb2sgZm9yIHRo
ZSBiZXN0IHdheS4NCj4gPg0KPiANCj4gSGkgSnVzdGluLA0KPiBGb3Igbm93IEkgb25seSBwbGFu
IHRvIG1vbml0b3Igc2VsZWN0ZWQgY2hhbm5lbC4gQnV0IEknbSBjdXJpb3VzIGFib3V0IHRoZSBB
RU4gZW5hYmxlZCBieSBkZWZhdWx0LiBJcyB0aGlzIHBlcmZvcm1lZCBieSBrZXJuZWwgZHJpdmVy
IHRvZGF5Pw0KPiBJbiB0aGUgcHJldmlvdXMgdmVyc2lvbiAoZS5nLiA0LngpLCBJIGhhZCB0byBt
YW51YWxseSBlbmFibGUgIChvciBzdWJzY3JpYmUgdG8pIHRoZW0gYWZ0ZXIgTkMtU0kgaW5pdGlh
bGl6YXRpb24uDQoNCg0KSGkgQmVuLA0KDQpJbnNpZGUgdGhlIG5jc2lfY29uZmlndXJlX2NoYW5u
ZWwoKSBmdW5jdGlvbiwgdGhlcmUgaXMgb25lIHN0YXRlIHRvIGVuYWJsZSB0aGUgQUVOICh1bmxl
c3MgdGhlIGNhcGFiaWxpdHkgYml0IGZvciBBRU4gaXMgbm90IHNldCkuDQoNCgkJfSBlbHNlIGlm
IChuZC0+c3RhdGUgPT0gbmNzaV9kZXZfc3RhdGVfY29uZmlnX2FlKSB7DQoJCQluY2EudHlwZSA9
IE5DU0lfUEtUX0NNRF9BRTsNCgkJCW5jYS5ieXRlc1swXSA9IDA7DQoJCQluY2EuZHdvcmRzWzFd
ID0gbmMtPmNhcHNbTkNTSV9DQVBfQUVOXS5jYXA7DQoNCg0KPiANCj4gKHRoaXMgaXMgd2h5IEkg
d2FzIHRoaW5raW5nIGEgdXNlcnNwYWNlIENMSSB0byBjaGVjayBOSUMgcGFyYW1ldGVycyB3b3Vs
ZCBiZSB1c2VmdWwgdG8gZ2V0IHRoZSBjdXJyZW50IE5JQyBzZXR0aW5nKQ0KPiANCj4gQnV0IGlu
IGFueSBjYXNlIChzZWxlY3RlZCB2cyBhbGwgY2hhbm5lbHMpLCBJIGFtIHRoaW5raW5nIGhhdmlu
ZyBzb21lIHRvb2wgb3IgZGFlbW9uIGluIHVzZXJzcGFjZSB0byBtb2RpZnkgQUVOIHNldHRpbmcg
d291bGQgcHJvdmlkZSBmbGV4aWJpbGl0eSwgc2luY2Uga2VybmVsIGRyaXZlciBhbHJlYWR5IHBy
b3ZpZGVzIGFjY2VzcyBtZWNoYW5pc20uDQo+IEZvciB0aGUgMi5jIGNhc2UsIHdlIG1heSBzZWxl
Y3RpdmVseSBlbmFibGUgQUVOcyBiYXNlZCBvbiAiZ2V0IGNhcGFiaWxpdHkiIGNtZC4gQWxzbyB3
ZSBtYXkgY2hlY2sgd2hpY2ggT0VNIEFFTnMgKGlmIGFueSkgYXJlIHN1cHBvcnRlZCwgYW5kIGJh
c2VkIG9uIG91ciBuZWVkcyBzZWxlY3RpdmVseSBlbmFibGUvZGlzYWJsZSB0aGVzZS4NCj4gDQo+
IA0KPiA+IEZvciBkZWxpdmVyaW5nIHRoZSBBRU4gdG8gdXNlcnNwYWNlLCBjdXJyZW50bHksIHdl
IGltcGxlbWVudCBpdCB2aWEgdGhlIG1jZ3JwcyBsb2NhbGx5IGJ1dCBwbGFuIHRvIHVwc3RyZWFt
Lg0KPiA+DQo+ID4gZW51bSBuY3NpX2dlbmxfbXVsdGljYXN0X2dyb3VwcyB7DQo+ID4JTkNTSV9H
RU5MX01DR1JQX0FFTiwNCj4gPiB9Ow0KPiA+DQo+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCBnZW5s
X211bHRpY2FzdF9ncm91cCBuY3NpX2dlbmxfbWNncnBzW10gPSB7DQo+ID4JW05DU0lfR0VOTF9N
Q0dSUF9BRU5dID0geyAubmFtZSA9IE5DU0lfR0VOTF9NQ0dSUF9BRU5fTkFNRSB9LCB9Ow0KPiA+
DQo+ID4gc3RhdGljIHN0cnVjdCBnZW5sX2ZhbWlseSBuY3NpX2dlbmxfZmFtaWx5IF9fcm9fYWZ0
ZXJfaW5pdCA9IHsNCj4gPgkubmFtZSA9ICJOQ1NJIiwNCj4gPgkudmVyc2lvbiA9IDAsDQo+ID4J
Lm1heGF0dHIgPSBOQ1NJX0FUVFJfTUFYLA0KPiA+CS5tb2R1bGUgPSBUSElTX01PRFVMRSwNCj4g
Pgkub3BzID0gbmNzaV9vcHMsDQo+ID4JLm5fb3BzID0gQVJSQVlfU0laRShuY3NpX29wcyksDQo+
ID4JLm1jZ3JwcyA9IG5jc2lfZ2VubF9tY2dycHMsDQo+ID4JLm5fbWNncnBzID0gQVJSQVlfU0la
RShuY3NpX2dlbmxfbWNncnBzKSwgfTsNCj4gPg0KPiA+DQo+IA0KPiBUaGlzIGlzIGEgZ3JlYXQg
aWRlYSEgUHJldmlvdXNseSBJIGhhZCBhIGhhY2t5IHNvbHV0aW9uIHRvIHNlbmQgYSBjdXN0b20g
bmV0bGluayBtZXNzYWdlIGZvciBBRU5zLCBidXQgdGhpcyBtdWx0aWNhc3QgZ3JvdXAgaXMgbW9y
ZSBmbGV4aWJsZS4NCj4gSW4geW91ciBjdXJyZW50IGRlc2lnbiwgZG8geW91IGhhdmUgbXVsdGlw
bGUgcHJvY2Vzc2VzIGxpc3RlbmluZyB0byB0aGVzZT8gT3IgMSBwcm9jZXNzIHRoYXQgaGFuZGxl
cyBhbGwgQUVOcy4NCg0KDQpDdXJyZW50bHksIHdlIHdpbGwgb25seSBoYXZlIG9uZSBwcm9jZXNz
IHRvIGxpc3RlbiBhbGwgQUVOcyBidXQgaXQgaXMgbm90IGZpbmFsaXplZCB5ZXQuDQoNCg0KPiAN
Cj4gUmVnYXJkcywNCj4gLUJlbg0KPiANCg0KVGhhbmtzLA0KSnVzdGluDQo=
