Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BCE8C528
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:37:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467VzG0sNYzDqbW
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 10:37:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=31298eb122=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="FGO4k/zB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="kY97MYTK"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Vyf4NrGzDqY5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 10:36:54 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E0XOl0001736; Tue, 13 Aug 2019 17:36:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ddp4x8JuvJjFC6EDvk7VhbBAiGaxjH0DFq2wVW4AFDc=;
 b=FGO4k/zBOHX5ARLBkNs7ZUU67x2MFshkzL7toL18fAh+kMBWGuSAYNs3LmTbh+ZK22dk
 b+VcwR/Balv6u4FnibpHt8a7XY0uucROMuQPS9H/XbxBLpA+L3ef1kYPpaprXOHCCkaM
 xAh+xDWHXW7OyxVXXk/iZzeO/wM45NTEoi4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uc6jfg96r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Aug 2019 17:36:46 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Aug 2019 17:36:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Aug 2019 17:36:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzm3HBBR/ea4sLwRUDO+8wI/hacxZlbmiFHivSg5nkR+XZjtd8FNYE6ygw2T9+S3khjnrJT2CCH/EdJzrixGA/wonJKeijNhkFNh/Ozh9z5BJEy+QfpxemmFYW8+4i0pnvLTdVUArtL3lTujCJUZdQYCcIcCmY3VaHHSjnKcPhDMkKLjjNLpdLqPKnvPXb7jVI9O4n8peiqmASMuOMteskMNLqb55jyy3TBDlAQz4VxRrFyyg7UYzClALyTMCRMlJB5yn1spE2R50IDQgQNPbygRJXMI8pfjGjc8gqube+sbjFPU8EZ9QIHGaebcQPI6fgmHUNg0xWM/18meITdMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddp4x8JuvJjFC6EDvk7VhbBAiGaxjH0DFq2wVW4AFDc=;
 b=PvLS8feQnPyZkFKcJyxRr88FtTWnZ8f3fu/D/E/afmPja3xU2rH+uhyTE25ijhH+E6KpgggHuSkCmJhfQInumORNu1Sr769fkTaMQUOA8Tx6eqn4HydDR8CldfEfcZbN3zkIch9fyVCdIFLrwEMvLP259IAQyExRSbCFynYOseAIWMADYN71/MoLRgUCia6pbLssHZVp3XsgE+XCicavnCxGM07cBgQGAvrR9rlYXaZDXYSPHNtrFuPXM7/BbK9Cqa6YJhW8k6GSnknfffydRnPZucyCpHREybyUzw/j/iObbTguMGVNO+N3E96zTPTPZAxnhyKKhO4SubMjcL4NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddp4x8JuvJjFC6EDvk7VhbBAiGaxjH0DFq2wVW4AFDc=;
 b=kY97MYTK0O0jxcyMzgJ4TdbA+gELEKItl5vrQYsMh2VqfmVzZg/U3dFz2mV+xV5PW+itRj6BFpfnjiRb6vFGt3W9OUKfCflspjxX+gZObsY3yWrWtG+TrC0OplO2Se3G07wM5P+wMHxpdxsNC8drV3Olhp8/JsSb9Fk+V/5sU18=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1919.namprd15.prod.outlook.com (10.174.100.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 14 Aug 2019 00:36:44 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 00:36:44 +0000
From: Tao Ren <taoren@fb.com>
To: Terry Duncan <terry.s.duncan@linux.intel.com>
Subject: Re: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Topic: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Index: AQHVTLYXvEPb5D4KhEGV/bPPR833MKbwAYEAgAAEloCAADQnAIABB7CA///nDgCAAJqugIAAE4WAgAAKTAD///adAIAHd5c0//+rWoAAE8QNAAAHQsYAAACAcgA=
Date: Wed, 14 Aug 2019 00:36:43 +0000
Message-ID: <edf32d22-57c8-fc11-7a92-33328d69a1b0@fb.com>
References: <20190807002118.164360-1-taoren@fb.com>
 <20190807112518.644a21a2@cakuba.netronome.com>
 <20190807184143.GE26047@lunn.ch>
 <806a76a8-229a-7f24-33c7-2cf2094f3436@fb.com>
 <20190808133209.GB32706@lunn.ch>
 <77762b10-b8e7-b8a4-3fc0-e901707a1d54@fb.com>
 <20190808211629.GQ27917@lunn.ch>
 <ac22bbe0-36ca-b4b9-7ea7-7b1741c2070d@fb.com>
 <20190808230312.GS27917@lunn.ch>
 <f1519844-4e21-a9a4-1a69-60c37bd07f75@fb.com>
 <10079A1AC4244A41BC7939A794B72C238FCE0E03@fmsmsx104.amr.corp.intel.com>
 <bc9da695-3fd3-6643-8e06-562cc08fbc62@linux.intel.com>
 <dc0382c9-7995-edf5-ee1c-508b0f759c3d@linux.intel.com>
 <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
 <33e3e783-fb93-e628-8baa-a8374540ea25@linux.intel.com>
 <68c25963-4659-c5a2-f8ca-ee51ae17d63f@linux.intel.com>
In-Reply-To: <68c25963-4659-c5a2-f8ca-ee51ae17d63f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR01CA0040.prod.exchangelabs.com (2603:10b6:300:101::26)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::7fa4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72b21116-c4ef-44fe-08d6-08d7204f7b2c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1919; 
x-ms-traffictypediagnostic: MWHPR15MB1919:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB1919AE45E220A50B673E1D55B2AD0@MWHPR15MB1919.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(376002)(39860400002)(136003)(199004)(189003)(446003)(66556008)(256004)(8676002)(53546011)(229853002)(186003)(14444005)(31686004)(4326008)(46003)(7736002)(14454004)(11346002)(2616005)(65806001)(65956001)(25786009)(6506007)(386003)(6116002)(486006)(76176011)(52116002)(102836004)(476003)(305945005)(66476007)(66446008)(5660300002)(58126008)(71200400001)(316002)(64126003)(99286004)(6486002)(6916009)(71190400001)(6512007)(81156014)(81166006)(478600001)(53936002)(6436002)(8936002)(2906002)(36756003)(86362001)(31696002)(65826007)(66946007)(6246003)(64756008)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1919;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GcmaM7lkcO+PI4Gj1r3aGYW7CbupNUk1Ur8KxnaCUtCWIruVCN0GgPl9AeIZyvivXhQQj/dE5lohzV/153lv/tOdF/9TeKiIxWFfxEPMybJzRx8pSyUiuaHHf10RfMi6jwuPMEophIhF+k7eHzaj6IT7493jvfAyJ8+u+eRbDW3NYBfsd/FLnjd2MPFQb6qhpXSVEak1gClzX9dp8paFWZTAI7iANpT10rKTrGoRT3ZICOoy0fiTZSaJKYMedFnWullpUPOmSvqyP/l8B4IuZLvS0f+zqYXkPSeTY7KTSHsYz+3bfG2CmlBrCmQwrLOn+k+0put1nOSy8g2rye/nY8Oh4hyO3tWHosTn7f/hbwOSxVmp51M3Hmqoj1GIo8C1nXP6/rCjKMA7waU7oL5OiBR76XlrNfHWAxvZDdP8JOk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00F21B94A9CDEA4DB696EAC31EC80EEA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b21116-c4ef-44fe-08d6-08d7204f7b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 00:36:43.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht4okqg3NsshSdzJKwFJ2JGLpan3Gj/Ot6/sN73oOlhS/IumXkE9ulcf4iAtf6Gb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1919
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140002
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <jakub.kicinski@netronome.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ben Wei <benwei@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S.Miller" <davem@davemloft.net>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC8xMy8xOSA1OjIyIFBNLCBUZXJyeSBEdW5jYW4gd3JvdGU6DQo+IE9uIDgvMTMvMTkgMTo1
NCBQTSwgVGVycnkgRHVuY2FuIHdyb3RlOg0KPj4NCj4+IE9uIDgvMTMvMTkgMTE6MjggQU0sIFRh
byBSZW4gd3JvdGU6DQo+Pj4gT24gOC8xMy8xOSA5OjMxIEFNLCBUZXJyeSBEdW5jYW4gd3JvdGU6
DQo+Pj4+IFRhbywgaW4geW91ciBuZXcgcGF0Y2ggd2lsbCBpdCBiZSBwb3NzaWJsZSB0byBkaXNh
YmxlIHRoZSBzZXR0aW5nIG9mIHRoZSBCTUMgTUFDP8KgIEkgd291bGQgbGlrZSB0byBiZSBhYmxl
IHRvIHNlbmQgTkNTSV9PRU1fR0VUX01BQyBwZXJoYXBzIHdpdGggbmV0bGluayAoVEJEKSB0byBn
ZXQgdGhlIHN5c3RlbSBhZGRyZXNzIHdpdGhvdXQgaXQgYWZmZWN0aW5nIHRoZSBCTUMgYWRkcmVz
cy4NCj4+Pj4NCj4+Pj4gSSB3YXMgYWJvdXQgdG8gc2VuZCBwYXRjaGVzIHRvIGFkZCBzdXBwb3J0
IGZvciB0aGUgSW50ZWwgYWRhcHRlcnMgd2hlbiBJIHNhdyB0aGlzIHRocmVhZC4NCj4+Pj4NCj4+
Pj4gVGhhbmtzLA0KPj4+Pg0KPj4+PiBUZXJyeQ0KPj4+DQo+Pj4gSGkgVGVycnksDQo+Pj4NCj4+
PiBTb3VuZHMgbGlrZSB5b3UgYXJlIHBsYW5uaW5nIHRvIGNvbmZpZ3VyZSBCTUMgTUFDIGFkZHJl
c3MgZnJvbSB1c2VyIHNwYWNlIHZpYSBuZXRsaW5rPyBCZW4gV2VpIDxiZW53ZWlAZmIuY29tPiBz
dGFydGVkIGEgdGhyZWFkICJPdXQtb2YtYmFuZCBOSUMgbWFuYWdlbWVudCIgaW4gb3BlbmJtYyBj
b21tdW5pdHkgZm9yIE5DU0kgbWFuYWdlbWVudCB1c2luZyBuZXRsaW5rLCBhbmQgeW91IG1heSBm
b2xsb3cgdXAgd2l0aCBoaW0gZm9yIGRldGFpbHMuDQo+Pj4NCj4+PiBJIGhhdmVuJ3QgZGVjaWRl
ZCB3aGF0IHRvIGRvIGluIG15IHYyIHBhdGNoOiBtYXliZSB1c2luZyBkZXZpY2UgdHJlZSwgbWF5
YmUgbW92aW5nIHRoZSBsb2dpYyB0byB1Ym9vdCwgYW5kIEknbSBhbHNvIGV2YWx1YXRpbmcgdGhl
IG5ldGxpbmsgb3B0aW9uLiBCdXQgaXQgc2hvdWxkbid0IGltcGFjdCB5b3VyIHBhdGNoLCBiZWNh
dXNlIHlvdSBjYW4gZGlzYWJsZSBOQ1NJX09FTV9HRVRfTUFDIG9wdGlvbiBmcm9tIHlvdXIgY29u
ZmlnIGZpbGUuDQo+Pg0KPj4gVGhhbmtzIFRhby4gSSBzZWUgbm93IHRoYXQgZGlzYWJsaW5nIHRo
ZSBOQ1NJX09FTV9HRVRfTUFDIG9wdGlvbiB3aWxsIGRvIHdoYXQgSSB3YW50Lg0KPj4NCj4+IEJl
c3QsDQo+PiBUZXJyeQ0KPiBIaSBUYW8sDQo+IA0KPiBBZnRlciBhIHNlY29uZCBsb29rLCBpdCBh
cHBlYXJzIHRoYXQgdGhlIE9FTSBoYW5kbGVycyBmb3IgQnJvYWRjb20gYW5kIE1lbGFub3ggaW4g
bmNzaS1yc3AuYyB3aWxsIHNldCB0aGUgTUFDIHJlZ2FyZGxlc3Mgb2YgdGhlIG9yaWdpbiBvZiB0
aGUgcmVxdWVzdC4gRXZlbiB3aXRoIE5DU0lfT0VNX0dFVF9NQUMgZGlzYWJsZWQsIHNlbmRpbmcg
YW4gT0VNIGNvbW1hbmQgd2l0aCBuZXRsaW5rIHdvdWxkIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBC
TUMgTUFDLg0KDQpJIHRoaW5rIGl0J3MgYmVjYXVzZSB0aG9zZSBvZW0gaGFuZGxlciBmdW5jdGlv
bnMgYXJlIG5vdCBjb250cm9sbGVkIGJ5IE5DU0lfT0VNX0dFVF9NQUMuIEknbSBub3Qgc3VyZSBp
ZiB3ZSBkaWQgdGhhdCBpbnRlbnRpb25hbGx5LCBidXQgSU1ITyBpdCBuZWVkcyB0byBiZSBmaXhl
ZC4NCg0KVmlqYXkgbWlnaHQgYmUgYWJsZSB0byBzaGFyZSBtb3JlIGJhY2tncm91bmQgd2hlbiB0
aGUgb3B0aW9uIHdhcyBpbnRyb2R1Y2VkPw0KDQoNCi0gVGFvDQo=
