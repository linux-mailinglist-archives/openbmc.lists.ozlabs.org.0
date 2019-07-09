Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE163CAC
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 22:21:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jtxw63LgzDqZ2
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 06:21:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=20933b6a2e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="RNkTgF4P"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="G55t940D"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jtxF1p5BzDqKw
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 06:20:40 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x69KHEUG024085;
 Tue, 9 Jul 2019 13:20:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XZi28PL8qpJLWI83NM8qUcdoaqWq0CvRlfekfhIaMO8=;
 b=RNkTgF4PmDfZC+Z1m78x3Cyyc5qzix59Wf6NPGyFZzp72wSrxXUizvxcAqJLbhLSbLhJ
 U6IS+60SQodi8IS2Yd5MKTPHDQKIet4ZKhigOKM+3bUcwWavyf/vGeYzSBfVIrcmFD5i
 /ktMojVFw8Np+5nXz+Puatcm/T9+VBOybt0= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2tmxrb0r0y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2019 13:20:29 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 9 Jul 2019 13:20:27 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 13:20:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZi28PL8qpJLWI83NM8qUcdoaqWq0CvRlfekfhIaMO8=;
 b=G55t940DY1C8EqdZ6nO5AgNMdkwj7DDLjFM5XUBNjeet4gtLL5CmIpgxpTQjXsdfzov9y05tRRKKEbLbL0kGg4cCTg1+WWH35E26fbn4VEOcWDmYp4AldzIhumzvngxMm1JJtxeQ8LT/Ti2wgW3iSrL+JrjzZtCMUzz72+S2MNk=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1845.namprd15.prod.outlook.com (10.172.75.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Tue, 9 Jul 2019 20:20:25 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68%7]) with mapi id 15.20.2032.023; Tue, 9 Jul 2019
 20:20:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, =?utf-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?=
 <Duke.Du@quantatw.com>
Subject: Re: Could phosphor-hwmon support peci-sensors
Thread-Topic: Could phosphor-hwmon support peci-sensors
Thread-Index: AdU1iSUCJhGDbsKEQ6GlW/GsUn/vgwALMsKAAAE9iwAAJ4qCgA==
Date: Tue, 9 Jul 2019 20:20:24 +0000
Message-ID: <F50EEE1E-164A-45A2-BF1D-0A895CE0E32C@fb.com>
References: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
 <20190708175241.nem73wmy27itc72p@thinkpad.dyn.fuzziesquirrel.com>
 <b6bc00d5-e093-c9c1-0456-1e3f02ce6059@linux.intel.com>
In-Reply-To: <b6bc00d5-e093-c9c1-0456-1e3f02ce6059@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:f78f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 903f6df3-7897-4c00-27e8-08d704aae05c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1845; 
x-ms-traffictypediagnostic: CY4PR15MB1845:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB1845E37620ABC818B381F2B8DDF10@CY4PR15MB1845.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(346002)(376002)(136003)(43544003)(53754006)(199004)(189003)(5660300002)(6116002)(25786009)(71200400001)(71190400001)(76176011)(99286004)(36756003)(53546011)(8676002)(305945005)(6506007)(102836004)(68736007)(81166006)(46003)(54906003)(81156014)(33656002)(14454004)(110136005)(316002)(86362001)(6486002)(229853002)(7736002)(76116006)(66946007)(64756008)(66556008)(66476007)(91956017)(256004)(66446008)(966005)(476003)(6246003)(2616005)(11346002)(6436002)(53936002)(4326008)(446003)(478600001)(186003)(486006)(2906002)(8936002)(6306002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1845;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6mYUvcr7akg+TRb1BALxmEo+esyx8Izu3369albYgzTdQloQ6mg8sDJGOJSPhgt2Bhk5BmWuQk3hAfLF+NXVC2QFKItAzS+5JbYJVBeuXs+m1jyHhavcSBbW4108Thr/TpZENkQbnNyXDxsNWvTFbOs5qwUvVtNVDr42SkIDoXPb6kNy2JxtwKqBF3wdwQBGc4W/ske38tp9bdUS309yh25u9r55dSHpTnjxaTibgNpDbqbs/uMA6lF3lWCJvMbpzTuTDdYAl5QsnVtzqhurNlWxjQazMO3HLJI5TzuwfMH8iiT73WtFB+oIIoFeeTmxjOM2V/8LnhfPqK28q7rwd1ZwZP/1M/4/urAsm52rs0s7X16o1VUGpKfPKfKIgC7jA5HLK4VcGGDaRiLo6zkcuCqOMkUxLU4m99lLpmohn90=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B5A337731EC644C95BE0560071EFB64@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 903f6df3-7897-4c00-27e8-08d704aae05c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:20:25.0060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1845
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=615 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090242
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvOC8xOSwgMTE6MjkgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBKYW1lcyBG
ZWlzdCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgamFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAg
IE9uIDcvOC8xOSAxMDo1MiBBTSwgQnJhZCBCaXNob3Agd3JvdGU6DQogICAgPiBPbiBNb24sIEp1
bCAwOCwgMjAxOSBhdCAxMjozMzoyMVBNICswMDAwLCBEdWtlIER1ICjmnZznpaXlmIkpIHdyb3Rl
Og0KICAgID4+IEhpIEFsbCwNCiAgICA+PiAgSSBoYXZlIHNvbWUgcHJvYmxlbXMgd2l0aCBwaG9z
cGhvci1od21vbi4NCiAgICA+PiBDb3VsZCBwYWNrYWdlIHBob3NwaG9yLWh3bW9uIHN1cHBvcnRz
IHBlY2kgc2Vuc29ycyBzdWNoIGFzIGNwdSBhbmQgDQogICAgPj4gZGltbSB0ZW1wYXR1cmVzID8N
CiAgICA+PiBJZiB5ZXMsIGNvdWxkIHlvdSBnaXZlIG1lIHNvbWUgaGludHMgdGhhdCBob3cgZG8g
SSB3cml0ZSBjb25maWd1cmF0aW9uIA0KICAgID4+IGZvciBwZWNpIHNlbnNvcnMsIHBsZWFzZSA6
KS4NCiAgICA+Pg0KICAgID4+IFRoYW5rcy4NCiAgICA+PiBEdWtlLCBEdQ0KICAgID4gDQogICAg
PiBwaG9zcGhvci1od21vbiBzaG91bGQgd29yayB3aXRoIGFueXRoaW5nIHRoYXQgaW1wbGVtZW50
cyB0aGUgaHdtb24gQUJJLiANCiAgICA+IFNvIEkgdGhpbmsgdG8gbWFrZSBQRUNJIHNlbnNvcnMg
d29yayB3aXRoIHBob3NwaG9yLWh3bW9uLCB5b3UgbmVlZCBod21vbiANCiAgICA+IGRyaXZlcnMg
Zm9yIFBFQ0kgc2Vuc29ycy4gIEkgZG9uJ3Qga25vdyBpZiBhbnlvbmUgaXMgd29ya2luZyBvbiB0
aGF0Lg0KICAgID4gDQogICAgPiBJIHN1c3BlY3QgdGhlIG90aGVyIHNlbnNvciBhcHBsaWNhdGlv
biAtIGRidXMtc2Vuc29ycyBzdXBwb3J0cyBQRUNJIGp1c3QgDQogICAgPiBmaW5lLiAgQnV0IEkg
ZG9uJ3Qga25vdyBob3cgaXQgd29ya3MsIGlmIGl0IGNhbiBiZSB1c2VkIHdpdGhvdXQgZW50aXR5
IA0KICAgID4gbWFuYWdlciwgIGFuZC9vciBpZiBpdCBjYW4gYmUgcnVuIGluIHBhcmFsbGVsIHdp
dGggcGhvc3Bob3ItaHdtb24uDQogICAgDQogICAgKyBKYWUsIENQVSBTZW5zb3IgQXV0aG9yDQog
ICAgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZGJ1cy1zZW5zb3JzL2Jsb2IvbWFz
dGVyL3NyYy9DUFVTZW5zb3JNYWluLmNwcA0KICAgIA0KICAgIENQVSBzZW5zb3IgY3VycmVudGx5
IHN1cHBvcnRzIFBFQ0kgc2Vuc29ycyANCiAgICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9k
YnVzLXNlbnNvcnMvYmxvYi9tYXN0ZXIvc3JjL0NQVVNlbnNvci5jcHANCiAgICANCiAgICBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9ibG9iL2Y4NjFkYTg5ZWQwM2Y5
ZWM1NTZjNWVkNmFjODE5OTg4YzBjMWY0OTgvY29uZmlndXJhdGlvbnMvV0ZUJTIwQmFzZWJvYXJk
Lmpzb24jTDIxODENCiAgICANCiAgICBJdCBkb2VzIHJlcXVpcmUgZW50aXR5LW1hbmFnZXIgY3Vy
cmVudGx5LCBidXQgaXQgY291bGQgYmUgcnVuIGluIA0KICAgIHBhcmFsbGVsIHdpdGggcGhvc3Bo
b3ItaHdtb24uDQoNClRoZXJlIGlzIHBlY2kgZHJpdmVyIGFsb25nIHdpdGggaHdtb24gcGVjaSBk
cml2ZXIgYXZhaWxhYmxlIGluIG9wZW5ibWMgbGludXgga2VybmVsIDUuMyANCndoaWNoIHdpbGwg
dGFrZSBjYXJlIG9mIGh3bW9uIGludGVyZmFjZS4gQW5kIHRoZXJlIGFyZSBhbHNvIHBlY2ktZGlt
bSBhbmQgcGVjaS1jcHUgDQpkcml2ZXIgdG8gcmVhZCBjcHUgYW5kIGRpbW0gc2Vuc29ycy4gT25j
ZSB0aGVzZSBkcml2ZXJzIGVuYWJsZWQsIGl0IHNvdWxkIHdvcmsgd2l0aCANCnBob3NwaG9yLWh3
bW9uIHdpdGhvdXQgZW50aXR5IG1hbmFnZXIgYW5kIGRidXMtc2Vuc29ycy4NCg0KUmVnYXJkcw0K
LVZpamF5DQogICAgDQogICAgLUphbWVzDQogICAgDQoNCg==
