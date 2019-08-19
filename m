Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E1950BF
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 00:27:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C7pM2Vg9zDqfK
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 08:27:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3134769992=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Mi13DhGk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="N8y40mYw"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C7nm0mTDzDqcT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 08:26:50 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JMHrtW014257; Mon, 19 Aug 2019 15:26:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=M/ostW9HMTel/C3F5t373Q68Z6f0c5x5jP/m+kLWAGo=;
 b=Mi13DhGk0pCSVv+sWYxdDqe6VN1ztn3Sea8pLB4RqiVHLJ/zpTmh07WuCYprosa6L8AW
 QMncyP6rOKvRwqzqA7104IpVgdrW8xuCGCQ0h4Lr1eG7FC+wedcvFNm5/6FinX6btFHO
 /GLO+/4AegraSITvryN9WMoNE3rfu+B4OyI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ug2tu0g26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 19 Aug 2019 15:26:44 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Aug 2019 15:26:43 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 19 Aug 2019 15:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYjS7Y82TGVraAVQTKPxmPVyCBnobq4+JIGF+jpNBA5M9stJXN2VnBbrY69r5v3ofKRukOiwklm1NoNTUrOU3mb0Z4TzzmfHVB5bPIPDmbIUoKDqaZYQKxVTO58Inhk7NVGulyqiFffBW+bWXROsXeQzuYSn6OgNak933uKTew+GpvJZGzaE1AoUkv4G6YcyavG+1hP6X7z4JoE+brJcImzS/fmDUlw0ObUK+Tvq3R5lL41DT+Lo2JnCg1UUiDN9GvrRCNEvZdDu3Cl6U5z3bLDAkCcq6+f4bzYXJ+IYPs4Zf84qmahi8Ks3CQFTfUBEd5HBCJiMd4UBVWX9hRuxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/ostW9HMTel/C3F5t373Q68Z6f0c5x5jP/m+kLWAGo=;
 b=Xyv0MdgDy6MOHH6tHmw3JWgngw0Qynm60qX/YQcK171q16KHA8G3V9rOlWIbOA7z7uzr09sEmk1/pjh9YBfdRELr2nZbjyvfi/Y7vfNnIe7bz7/lUp8Two/b4FVx5YSp1cgkGUKYoYNT5LzuDHdARYByppPRCG/uHiQ6f3sGCJntm4E/oM0//rgKG6tn2w8CdXhhrwpO/qtmgK0D5nr4kkqLh3ADeM0/OjDggiux81nEbuhiiUr0tzvM9yXuvnflbupPnSUNKIFoh2BwRt5vyYq4eW3cSp1Midkb8aBNzHxiMPPWUFdqogyC34O/XFcXkMLICsLgDG1Yo03LojsrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/ostW9HMTel/C3F5t373Q68Z6f0c5x5jP/m+kLWAGo=;
 b=N8y40mYwlt5gmr8B+FWVPPXNGvLuUZ41xk7M5vVZENvEXDkc8fSvOH7BYZdrXXzlh9y5rAuh/VtVLyMyDCceT5QCBEp07TlLOo8DLcg+F8k8tI+F6A3cypIBTC/UeBxqk2ccWbtPJrO41yn5Q5kuUxLpcDVKxGdgW+PZOaPyVR4=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1478.namprd15.prod.outlook.com (10.172.161.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 22:26:40 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 22:26:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [External] Re: ipmitool FRU write question
Thread-Topic: [External] Re: ipmitool FRU write question
Thread-Index: AQHVVFzV+6eanr+jzE+Yoot8AQjEyacCk5qAgAB72YD//4zRgA==
Date: Mon, 19 Aug 2019 22:26:39 +0000
Message-ID: <8E191471-44DD-41F2-8E60-B39982821C85@fb.com>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
 <CAO=notyjqi2m5LRDqRjSkTpYBmu5m_wr4JQnBeU8Vifg9_zLzw@mail.gmail.com>
 <4ACC3BDB-7E8D-4A4E-BBA7-A7B281A705C2@fb.com>
 <CAO=noty_n2a5nHzL7O-hDRAuuhw8Mx8CXmTc-_0izpAzMCS_EQ@mail.gmail.com>
In-Reply-To: <CAO=noty_n2a5nHzL7O-hDRAuuhw8Mx8CXmTc-_0izpAzMCS_EQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2b1d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f6585a-4efd-4411-1d20-08d724f44e5c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1478; 
x-ms-traffictypediagnostic: CY4PR15MB1478:
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <CY4PR15MB147883DDAA2F636F4591D063DDA80@CY4PR15MB1478.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(53546011)(6486002)(102836004)(186003)(6436002)(229853002)(25786009)(6116002)(6506007)(81156014)(6916009)(64756008)(66446008)(8936002)(2616005)(8676002)(76176011)(99286004)(316002)(66556008)(46003)(91956017)(76116006)(81166006)(66476007)(14454004)(6512007)(6306002)(305945005)(5660300002)(66946007)(71200400001)(54906003)(86362001)(36756003)(71190400001)(2906002)(7736002)(6246003)(478600001)(486006)(11346002)(446003)(476003)(53936002)(966005)(4326008)(14444005)(256004)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1478;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DlJY/LKYgpeu3dTRSDAeopI6GcbEEMqZ4F5iDnMWAjfEiqKCQ72A+EjilB20LDeEcAHjbmy2aGQrPVbJgCWiestxnLSBzBv8CJZBAUkuncr+z8ZEfMmM413Y/O1CG+75hWxBndeHRNDcVxqLA+aRrj5msCgmjn8Mf5ih+NPTGvnUEhjqOTAbfz99C+JreyJzqv6zBcJTzpSXo2lgljvEPY5eelCMr30t5RblScEDkiDx7j+lfLuO/vuHUDWSuL+kN1Zv69LSP8eFubD8EpFNtJY9bgWyT5C4m8b8dAhxjlUsAUuEBYbiBnj3qHiqci4+nxlZXM+japhYA2879BiGubfv0TgaZEgCz4zKjsImhFTP/gk2+ceSI+sRTTY24uv47pAGLVB67pu8wgmi1m/5GgTkM0DRlUyEdOmh2tHdhsc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <01EE10CDC37AC8429D6F41C7C282E942@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f6585a-4efd-4411-1d20-08d724f44e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 22:26:39.9925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hhuxo6Tu4+q1UxeV+e9E/ofYWpUib/f7YWHwOcxTI8RpkP0TYvSJMBDDpXHPlpROdzt4mVcCkIN/O64TMOsuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1478
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190221
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Harry Sung1 <hsung1@lenovo.com>, Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDgvMTkvMTksIDM6MTkgUE0sICJQYXRyaWNrIFZlbnR1cmUiIDx2ZW50dXJlQGdv
b2dsZS5jb20+IHdyb3RlOg0KDQogICAgT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMjo1NSBQTSBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4NCiAg
ICA+DQogICAgPiBPbiA4LzE2LzE5LCAxMTowMiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFBh
dHJpY2sgVmVudHVyZSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMu
b3psYWJzLm9yZyBvbiBiZWhhbGYgb2YgdmVudHVyZUBnb29nbGUuY29tPiB3cm90ZToNCiAgICA+
DQogICAgPiAgICAgT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6NDcgQU0gSGFycnkgU3VuZzEg
PGhzdW5nMUBsZW5vdm8uY29tPiB3cm90ZToNCiAgICA+ICAgICA+DQogICAgPiAgICAgPg0KICAg
ID4gICAgID4gPiBPbiA4LzE1LzE5IDY6NDkgQU0sIEhhcnJ5IFN1bmcxIHdyb3RlOg0KICAgID4g
ICAgID4gPiA+IEhpIFRlYW0sDQogICAgPiAgICAgPiA+ID4NCiAgICA+ICAgICA+ID4gPg0KICAg
ID4gICAgID4gPiA+DQogICAgPiAgICAgPiA+ID4gQ3VycmVudCBwaG9zcGhvci1ob3N0LWlwbWlk
IGRvZXMgbm90IHN1cHBvcnQgZnJ1IHdyaXRlIGNvbW1hbmQsIGJ1dA0KICAgID4gICAgID4gPiA+
IGlwbWktZnJ1LXBhcnNlciBzdXBwb3J0cyBpdC4NCiAgICA+ICAgICA+ID4gPg0KICAgID4gICAg
ID4gPiA+IFdlIGZvdW5kIHRoaXMgZnJ1IHdyaXRlIGNvbW1hbmQgb25seSB1cGRhdGUgdGhlIGRh
dGEgdG8gZGJ1cw0KICAgID4gICAgID4gPiA+IGludmVudG9yeSwgYnV0IGRvZXNuJ3Qgc3luYyB0
aGUgZGF0YSBiYWNrIHRvIHRoZSBFRVBST00uDQogICAgPiAgICAgPiA+ID4NCiAgICA+ICAgICA+
ID4gPiBEb2VzIGlwbWktZnJ1LXBhcnNlciBoYXMgYW55IHBsYW5zIHRvIGltcGxlbWVudCBpdD8g
SSB0aGluayBpdCBpcyBtb3JlDQogICAgPiAgICAgPiA+ID4gbWFrZSBzZW5zZSB0byBzeW5jIHRo
ZSBkYXRhIHRvIEVFUFJPTSB3aGVuIHdlIGRvIGZydSB3cml0ZS4NCiAgICA+ICAgICA+ID4NCiAg
ICA+ICAgICA+ID4gVGhlIGFsdGVybmF0aXZlIEZSVSBkYWVtb24gZnJvbSBlbnRpdHkgbWFuYWdl
ciwgRnJ1RGV2aWNlLCBzdXBwb3J0cyB3cml0aW5nDQogICAgPiAgICAgPiA+IHRoZSBGUlUgZGly
ZWN0bHkuDQogICAgPiAgICAgPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1t
YW5hZ2VyL2Jsb2IvbWFzdGVyL3NyYy9GcnVEZXZpY2UuY3BwDQogICAgPiAgICAgPiA+DQogICAg
PiAgICAgPiA+IEhhcHB5IHRvIHNlZSB0aGlzIGNhcGFiaWxpdHkgYWRkZWQgdG8gaXBtaS1mcnUt
cGFyc2VyLCBidXQgeW91IG1pZ2h0IGJlIGFibGUgdG8NCiAgICA+ICAgICA+ID4gbW9kZWwgaXQg
b2ZmIEZydURldmljZS4gIElmIHlvdSB3YW50IHRvIHVzZSBGcnVEZXZpY2UgYXMtaXMsIHlvdSB3
aWxsIG5lZWQgdGhlDQogICAgPiAgICAgPiA+IGFsdGVybmF0aXZlIEZydVdyaXRlIGNvbW1hbmQg
c2V0cyBmcm9tIGhlcmUuDQogICAgPiAgICAgPiA+DQogICAgPiAgICAgPiA+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL2ludGVsLWlwbWktb2VtL2Jsb2IvMTU5NTQ3Y2RmYmYxOTkyNzM3ZGNl
Y2INCiAgICA+ICAgICA+ID4gY2IzODg4YWY3Nzk1ZjkzMGIvc3JjL3N0b3JhZ2Vjb21tYW5kcy5j
cHAjTDMxNg0KICAgID4gICAgID4gPg0KICAgID4gICAgID4gPiBBcyB3cml0dGVuLCB0aG9zZSBj
b21tYW5kcyBjaGFuZ2UgdGhlIGJlaGF2aW9yIGEgYml0LCBhbmQgZG91YmxlIGJ1ZmZlcnMgdGhl
DQogICAgPiAgICAgPiA+IEZSVSB3cml0ZSBjb21tYW5kcy4gIFdoZW4gdGhlIGxhc3QgRnJ1IHdy
aXRlIGlzIHNlbnQsIHRoZSBkYXRhIGlzIGZsdXNoZWQNCiAgICA+ICAgICA+ID4gdGhyb3VnaCB0
aGUgRlJVIHBhcnNlciB0byBlbnN1cmUgdGhhdCBpdCdzIHZhbGlkLCBhbmQgdGhlIHVzZXIgaXNu
J3QgZG9pbmcNCiAgICA+ICAgICA+ID4gYW55dGhpbmcgbmVmYXJpb3VzIChsaWtlIGNoYW5naW5n
IGEgcHJvZHVjdCBuYW1lIG9yIHNlcmlhbA0KICAgID4gICAgID4gPiBudW1iZXIpIGJlZm9yZSBp
dCB3cml0ZXMgdGhlIEVFUFJPTSBpbiBvbmUgY2h1bmssIGFzIHF1aWNrbHkgYXMgaXQgY2FuIHRv
DQogICAgPiAgICAgPiA+IHJlZHVjZSB0aGUgcG9zc2liaWxpdHkgb2YgYSBoYWxmIHdyaXR0ZW4g
RUVQUk9NLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEhpIEVkLA0KICAgID4gICAgID4NCiAg
ICA+ICAgICA+IFRoYW5rcyBmb3IgeW91ciBraW5kbHkgcmVwbHkhIEkgaGF2ZSBzdXJ2ZXllZCB0
aGUgZW50aXR5LW1hbmFnZXIgYmVmb3JlLg0KICAgID4gICAgID4gQnV0IEkgZW5jb3VudGVyZWQg
YW4gaXNzdWUgd2hlbiBJIHVzaW5nIHBob3NwaG9yLWludmVudG9yeS1tYW5hZ2VyIGFuZCBlbnRp
dHktbWFuYWdlciBhdCB0aGUgc2FtZSB0aW1lLg0KICAgID4gICAgID4gQm90aCBvZiB0aGVtIGhh
dmUgc2FtZSBtZXRob2QgIk5vdGlmeSIgdW5kZXIgc2FtZSBpbnRlcmZhY2UgIiB4eXoub3BlbmJt
Y19wcm9qZWN0LkludmVudG9yeS5NYW5hZ2VyICIsIGJ1dCBkaWZmZXJlbnQgc2lnbmF0dXJlLg0K
ICAgID4NCiAgICA+ICAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJs
P3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpfY19vcGVuYm1jX2lwbWkt
MkRmcnUtMkRwYXJzZXJfLTJCXzIyMDIyJmQ9RHdJQmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01V
dyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1TOXRDOVhm
Mk5TTFR5SEpDRlRsNm9JTzQyTHBkaHJ0bndYYkgwVnNzQ2tJJnM9UDgwVlRvZjBUOWFzcC1rUTRx
cjltY0VZMVkzbUtUZlZqLWJ6dHg1LTNfbyZlPQ0KICAgID4NCiAgICA+ICAgICBUaGlzIHBhdGNo
IGFkZHJlc3NlcyBwYXJ0IG9mIGl0Lg0KICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBw
aG9zcGhvci1pbnZlbnRvcnktbWFuYWdlcjoNCiAgICA+ICAgICA+IE5BTUUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVFlQRSAgICBTSUdOQVRVUkUgICBSRVNVTFQvVkFMVUUgICBG
TEFHUw0KICAgID4gICAgID4geHl6Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuTWFuYWdlciBp
bnRlcmZhY2UgLSAgICAgICAgICAgICAtICAgICAgICAgICAgIC0NCiAgICA+ICAgICA+IC5Ob3Rp
ZnkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0aG9kICAgIGF7b2F7c2F7c3Z9fX0g
LSAgICAgICAgICAgICAtDQogICAgPiAgICAgPg0KICAgID4gICAgID4gZW50aXR5LW1hbmFnZXIN
CiAgICA+ICAgICA+IE5BTUUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRSAg
ICBTSUdOQVRVUkUgICBSRVNVTFQvVkFMVUUgICBGTEFHUw0KICAgID4gICAgID4geHl6Lm9wZW5i
bWNfcHJvamVjdC5JbnZlbnRvcnkuTWFuYWdlciBpbnRlcmZhY2UgLSAgICAgICAgIC0gICAgICAg
ICAgICAtDQogICAgPiAgICAgPiAuTm90aWZ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG1ldGhvZCAgICBhe3Nhe3N2fX0gLSAgICAgICAgICAgIC0NCiAgICA+ICAgICA+DQogICAgPiAg
ICAgPiBTbyB3aGVuIHNvbWUgc2VydmljZXMgY2FsbCB0aGUgJ05vdGlmeScgbWV0aG9kIGZhaWxl
ZCBiZWNhdXNlIG9mIGdldHRpbmcgd3Jvbmcgc2VydmljZS4NCiAgICA+ICAgICA+IEV4OiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9pcG1pLWZydS1wYXJzZXIvYmxvYi9tYXN0ZXIvd3JpdGVm
cnVkYXRhLmNwcCNMMjA2DQogICAgPiAgICAgPiBIYXZlIHlvdSBldmVyIHNlZW4gdGhpcyBpc3N1
ZSBiZWZvcmU/DQogICAgPg0KICAgID4gICAgIEkndmUgYWRkcmVzc2VkIHBhcnQgb2YgdGhpcyBp
c3N1ZSBpbiBwaG9zcGhvci1ob3N0LWlwbWlkLCBub3cgaXQgbm8NCiAgICA+ICAgICBsb25nZXIg
YXNzdW1lcyB0aGUgRlJVJ3Mgb3duZXIuDQogICAgPiAgICAgU2VlIHBhdGNoZXMgcmVsYXRlZCB0
bzoNCiAgICA+DQogICAgPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3It
aG9zdC1pcG1pZC9jb21taXQvNDVlOTNjYmFlMGFhMGQwZjUzODVkNDBmNTY4NWIyM2UxOGY5NTM1
MQ0KICAgID4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3QtaXBt
aWQvY29tbWl0L2MyNmNjNzE3YTRlZWYxOGZmZmMxY2E4OTFiYjZhNjAxNTc0MGJmOWYNCiAgICA+
DQogICAgPiAgICAgPg0KICAgID4gICAgID4gU2hvdWxkIEkgdXNlIGludGVsLWRidXMtaW50ZXJm
YWNlcyBpZiBJIHdhbnQgdG8gdXNlIEZydWRldmljZSAoZW50aXR5LW1hbmFnZXIpIGFuZCB3cml0
ZSBGUlUgY29tbWFuZChpbnRlbC1pcG1pLW9lbSk/DQogICAgPiAgICAgPiBPciBpdCBpcyBjb21w
YXRpYmxlIHdpdGggb3JpZ2luYWwgZGJ1cy1pbnRlcmZhY2U/DQogICAgPg0KICAgID4gICAgIFlv
dSB1c2UgYm90aC4NCiAgICA+IFBhdHJpY2ssIEkgYW0gbm90IHVzaW5nIGludGVsLWRidXMtaW50
ZXJmYWNlcywgb25seSB1c2luZyBkYnVzLXNlbnNvcnMuIFdoYXQgaXMgdGhlIHVzZSBvZiBpbnRl
bC1kYnVzLWludGVyZmFjZXM/DQogICAgDQogICAgSSBkb24ndCB1c2UgYm90aC4gIEkgb25seSB1
c2UgcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzLiAgSSB3YXMganVzdA0KICAgIGluZGljYXRpbmcg
dGhleSB3ZXJlbid0IGdvaW5nIHRvIGludGVyZmVyZSB3aXRoIGVhY2ggb3RoZXIgYmVjYXVzZSB0
aGUNCiAgICBpbnRlbC1kYnVzLWludGVyZmFjZXMgaXNuJ3QgdXNlZCBpbiB0aGUgc2FtZSB3YXkg
YXMNCiAgICBwaG9zcGhvci1kYnVzLWludGVyZmFjZXMuDQoNCk9rYXksIHRoYW5rcw0KICAgIA0K
ICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBUaGFua3MsDQogICAgPiAgICAgPiBIYXJy
eQ0KICAgID4NCiAgICA+DQogICAgDQoNCg==
