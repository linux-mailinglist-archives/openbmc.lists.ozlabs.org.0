Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 952158C098
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 20:31:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Lrv3ddFzDqfC
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 04:31:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3128378571=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZRcgOpiQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="I3/qiXop"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467LrB4DfLzDqZV
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 04:30:45 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DIRpPY016595; Tue, 13 Aug 2019 11:28:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5E9NzsG3a0keXuQcrkGKCiuRwQN8JrDx/HFuJEW9p4M=;
 b=ZRcgOpiQqj4BNBBZO0yzL59NYWh7BZOecjHg7uFSny2gOJ6xwH5RGBBjNl4zpd1N5lj2
 WOfkVnMpHyOCAEDe1n2S5+cDN0mp5eJNS/Zv0nVzVESj+wMoxPHRBH/eoJyLQTsTidaO
 +jo7/PiD05fpFUoap/fcALuannTPMen203M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uc1n188mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Aug 2019 11:28:37 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Aug 2019 11:28:33 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Aug 2019 11:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXVT4JgZX+906S5h2E3iTxks4l1d1sAphTKkt8Ep3PbMLlt79JeG967nVV/gn6jOe0VEHAwSVsyOlXtuZrL0r7Vnk4LnipaLNYQw8TeSc4UZNxpNH/KyPsu3ira9oWw5mHqtdW6517IsFCOKPgIbIbt6he0YesdDCCfAfFN1++pjaxO9YkPpgrL+dxMy+9tFVza09fQAJgPlhNyQxN2Cz5sVTSvaRtCsuGOK82UwVjUM7sjyH0vVykQ+a2b5BQtf65etfBw/gUPnR33VI5lHAmyeFc890OPl4wdifhAsDN0Nqeh/DacRCE+VRgzanWsyWCqUQrOkmNDy2Aw58Jt71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E9NzsG3a0keXuQcrkGKCiuRwQN8JrDx/HFuJEW9p4M=;
 b=EKr6ggD0VGoFQo5Q7xqHoZ4jt7wdhPNrKrTQedFStP6gLySHXZ94YEVBOeVUjn45l1Q0NS1oJhE5sL410nc9KQypcgP/YdXrKgkyabb62rLkvFn+phGk2TEVcf26zrBo+g9RgktXkRVj2RxATOWSs7ROHTDdhzJMFkqHJ0meCd8BTgEJ51kyqfDKk/FWewxyxaeQil1Z5qygrnmbMg7y7NPrG0Yk4ZY/keoHUpWmaDPwN0no+cwR2FvI2jRZVQJBh/YvsuKFWitbQoedPOdbhqkKLznG5spdpIzPHJLDVSc4pIoOmMQ8BhFGbp6y32Jw/ufpFfn0wUvHg6p+DPtaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E9NzsG3a0keXuQcrkGKCiuRwQN8JrDx/HFuJEW9p4M=;
 b=I3/qiXopOsPsT+Qyfs9JMXbRzWL/JNqOMkAA+/igihuJpB5lFKj8EABtvKGOw+UqnRpRO6m45grglShjaEPxz7kxQrj/jnHFUVT85ybm+lO6dLz9iBktkeo6g/S8q+WwEHKWrkWhooZiVI1sZDvxxo1vsYx5tWi27preEW1gaog=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1470.namprd15.prod.outlook.com (10.173.234.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Tue, 13 Aug 2019 18:28:32 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 18:28:32 +0000
From: Tao Ren <taoren@fb.com>
To: Terry Duncan <terry.s.duncan@linux.intel.com>
Subject: Re: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Topic: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Thread-Index: AQHVTLYXvEPb5D4KhEGV/bPPR833MKbwAYEAgAAEloCAADQnAIABB7CA///nDgCAAJqugIAAE4WAgAAKTAD///adAIAHd5c0gAAgs4A=
Date: Tue, 13 Aug 2019 18:28:32 +0000
Message-ID: <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
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
In-Reply-To: <dc0382c9-7995-edf5-ee1c-508b0f759c3d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:d1d9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0e6396a-7818-4f33-b5f7-08d7201c0b58
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1470; 
x-ms-traffictypediagnostic: MWHPR15MB1470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB14704A260F7545A2D5217DA6B2D20@MWHPR15MB1470.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(136003)(376002)(199004)(189003)(8676002)(25786009)(6512007)(71200400001)(6246003)(2906002)(54906003)(71190400001)(99286004)(65956001)(31686004)(65806001)(81156014)(81166006)(8936002)(478600001)(86362001)(6486002)(229853002)(6916009)(6436002)(31696002)(6116002)(53936002)(4744005)(76176011)(14454004)(66556008)(64756008)(486006)(66446008)(102836004)(305945005)(476003)(11346002)(2616005)(46003)(446003)(186003)(58126008)(316002)(256004)(7736002)(6506007)(386003)(66476007)(64126003)(53546011)(65826007)(66946007)(36756003)(52116002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1470;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7FO2OR6m9JeXkxCo5orV/lYT2v7PayvUULrOJaD0TX01ukGbUdxH1+Gm6atG+w8sfk0G9oWRr8ZM+ML/ulpP244o2WrrGnwXL/f/qJBd3comzmfYUgAbZvoFekS5JSFBOLEEXk7HD3M8xfgDuE6tcMA3GGE5XbflryZm9BTVRISedFDSfSguwu0rhxQQdYx15U+02XlFEuTBXxrA/ISI41ejobKOfC1E1xM1rj04JgKZvs3u8fYXwkCqCu1+jOIhTmb96V+rQFWSLQV9ETKylyyULoKEXjU0Jp6Q3duvstmuiJw52/h/N5hzlgvN/7PoWbIv35xjRhBTljU+EVwKy03isUGF2alRE5TZYi7Ms0DBIt04NMbFG2638/rzpVF2Xges3sY8PV29JDSACiUYhrlA0eF59dwsYCdSuSH8V8I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39A9831CC7A08749A9C1CCF59C5330E5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6396a-7818-4f33-b5f7-08d7201c0b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 18:28:32.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJR1rFbsp8uiJcY9PATYhxbqL55m6T5ZxajzkpWrwpb+rCTKVDhEvNWYFCr3vNyn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1470
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130172
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

T24gOC8xMy8xOSA5OjMxIEFNLCBUZXJyeSBEdW5jYW4gd3JvdGU6DQo+IFRhbywgaW4geW91ciBu
ZXcgcGF0Y2ggd2lsbCBpdCBiZSBwb3NzaWJsZSB0byBkaXNhYmxlIHRoZSBzZXR0aW5nIG9mIHRo
ZSBCTUMgTUFDP8KgIEkgd291bGQgbGlrZSB0byBiZSBhYmxlIHRvIHNlbmQgTkNTSV9PRU1fR0VU
X01BQyBwZXJoYXBzIHdpdGggbmV0bGluayAoVEJEKSB0byBnZXQgdGhlIHN5c3RlbSBhZGRyZXNz
IHdpdGhvdXQgaXQgYWZmZWN0aW5nIHRoZSBCTUMgYWRkcmVzcy4NCj4gDQo+IEkgd2FzIGFib3V0
IHRvIHNlbmQgcGF0Y2hlcyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIEludGVsIGFkYXB0ZXJzIHdo
ZW4gSSBzYXcgdGhpcyB0aHJlYWQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBUZXJyeQ0KDQpIaSBU
ZXJyeSwNCg0KU291bmRzIGxpa2UgeW91IGFyZSBwbGFubmluZyB0byBjb25maWd1cmUgQk1DIE1B
QyBhZGRyZXNzIGZyb20gdXNlciBzcGFjZSB2aWEgbmV0bGluaz8gQmVuIFdlaSA8YmVud2VpQGZi
LmNvbT4gc3RhcnRlZCBhIHRocmVhZCAiT3V0LW9mLWJhbmQgTklDIG1hbmFnZW1lbnQiIGluIG9w
ZW5ibWMgY29tbXVuaXR5IGZvciBOQ1NJIG1hbmFnZW1lbnQgdXNpbmcgbmV0bGluaywgYW5kIHlv
dSBtYXkgZm9sbG93IHVwIHdpdGggaGltIGZvciBkZXRhaWxzLg0KDQpJIGhhdmVuJ3QgZGVjaWRl
ZCB3aGF0IHRvIGRvIGluIG15IHYyIHBhdGNoOiBtYXliZSB1c2luZyBkZXZpY2UgdHJlZSwgbWF5
YmUgbW92aW5nIHRoZSBsb2dpYyB0byB1Ym9vdCwgYW5kIEknbSBhbHNvIGV2YWx1YXRpbmcgdGhl
IG5ldGxpbmsgb3B0aW9uLiBCdXQgaXQgc2hvdWxkbid0IGltcGFjdCB5b3VyIHBhdGNoLCBiZWNh
dXNlIHlvdSBjYW4gZGlzYWJsZSBOQ1NJX09FTV9HRVRfTUFDIG9wdGlvbiBmcm9tIHlvdXIgY29u
ZmlnIGZpbGUuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg==
