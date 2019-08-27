Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BF9DCB9
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 06:44:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hbqj5crHzDqlr
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 14:44:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=314261b480=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="U2xrfjAV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ak4O9VTq"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hbq21JzHzDqkh
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 14:43:20 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x7R4dWck011045;
 Mon, 26 Aug 2019 21:43:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=o4gKDN6M6aTLo2iyBhVIM8mTbxHPEU3YRmky4gu8kd4=;
 b=U2xrfjAVn+9IeMxk0zu+axhEEFNgYkc3jkQmSLqSElvtDZjCUJYQGvYDz1n+FINFeeqo
 FJhIGkloOFkOmtNTEGwGD7jN9ymVxTom4ylPsz7RRJILEErxDWgPgKNZkJVCzyQJ5heW
 8bvU6YojY5ETSU4qwgptQ3h3iHXr7wKcS+M= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2uk3hhsnam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 21:43:08 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 26 Aug 2019 21:43:07 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 21:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQzPa+ACIU5fa2m3uiUgJAJ8AmHJDUjhWX3vlbDGEDLOgwAlvtmpimXweBmnNzhVF+tEcKtcDqZkdCkAlch5hS4LmE7mB29hs1xdUiWUeko+sZVrSLqqYMZB0ovoYUh4Lnlpb45Pl0qfzcJkUokpVQGFIuRdZB60NdACxhNoTMsJTR5PR1+OA7Fg/83NM0BqG6pWpNsUZRUHDMRha1beR4AT3AyeZyNyxxoh0TcSI6bas/2rp77+/ZRbB9zbikRfnmbQwcq6W1qFSxN2kMP4+YbT/yKAmZtcFuiC6JzpsAqP+vYop0JOn7prtZjWV7kyhnIxsv/qGvnOOujJvVSxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4gKDN6M6aTLo2iyBhVIM8mTbxHPEU3YRmky4gu8kd4=;
 b=Qva9eIT5QE4FXJlYKmxCB1/W2c3tTDaPLF4rX+wnwT4O3N4zcb9ELaG226oJlA+LRv1CdkSs2RRDVflmo0IpkBdUwvtQWOAOO/x+K3hwKSuXU6KhWMoe4YllQnqH4xvJqeDEfxUiVt2oFcanSXTDOYuA8QEnyt1y/+cyPZJV8Iwf6vXRE4HYMX01bZgwwarNj0ccSabbokPebY2Zi+Nc7KCDGfDDl3VpwJiZFt92AAGxQJx2Zf4ir0vnrR2DgWGTTD6i8r84+ZOyA68EYt+4F+ua0zznbcrR+ZE4AYH5q9Z1lNL1l4xK1hmWXsZcwTrDvEM/9x3fcTVoVOQh7KER2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4gKDN6M6aTLo2iyBhVIM8mTbxHPEU3YRmky4gu8kd4=;
 b=ak4O9VTq9I96nHJeVZgFCUbqAjsMuiKabV9TU6UZBp3h/Y5Kw+mcnuzvBWRDzbJ+doGzfQvtjQBw+wG2gNHd5X1kXApuFQC4IV1PzvLXP6YoDM0dYCaD7W0qhCRuBkmad3x/WF7Dr0ANOw0WQEfE3Zexb2f3hWffXr6gfDzWZlU=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1135.namprd15.prod.outlook.com (10.175.2.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 04:42:44 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 04:42:44 +0000
From: Tao Ren <taoren@fb.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAP//uMoAgAB7VACAAfqaAA==
Date: Tue, 27 Aug 2019 04:42:43 +0000
Message-ID: <bc19f328-ef5d-9840-7985-82461c99205e@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
 <216516045.73889.1566772168645.JavaMail.zimbra@nod.at>
In-Reply-To: <216516045.73889.1566772168645.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:301:4a::27) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::c36d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1484d3e0-9e84-4ba6-cc6c-08d72aa9002a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1135; 
x-ms-traffictypediagnostic: MWHPR15MB1135:
x-microsoft-antispam-prvs: <MWHPR15MB11355620FD740B697E264F93B2A00@MWHPR15MB1135.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(58126008)(36756003)(6116002)(7736002)(5660300002)(76176011)(66946007)(102836004)(186003)(53936002)(46003)(6506007)(6512007)(6486002)(6436002)(386003)(2616005)(81156014)(486006)(446003)(6246003)(256004)(11346002)(71200400001)(305945005)(53546011)(14444005)(8676002)(99286004)(8936002)(52116002)(71190400001)(316002)(14454004)(4326008)(64756008)(66476007)(66556008)(66446008)(65806001)(31686004)(54906003)(65956001)(81166006)(6916009)(476003)(478600001)(66574012)(25786009)(31696002)(229853002)(2906002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1135;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ar27/wyzhRzxkR0BuCuyJVKQo+2ek8jX1AqrBR6czm6CJYn0LE/LYl3RYIDfyE/VclISG3y+dFbjJb/8kcCQy7JQ0HkvQynleUE5DI+rPdiAzhwgozr7ZdigKoiL/WavlTIjUEIEofNkdpixPxgeiYQvX8dImY91kBNvWfX0fPlQ1UDMrBFt/1mU8CHy4DV91h7yz+umOqGip7ZJ9Phs17XO93vOYpaj0SE8QvHx8xlMx+WCt/EJISlEsNrwkJli7KyXmJTzLG96xr+gAig/RkTmL5JWTJX5Bi1JZNeBSQHCks6b4Lm08iPrXaUq4dO2+IPWvIS+d2hJUTHrd3PmiKMYfmiuLi1ED1FBlJFlRYsopBwE8IoME16JN7z6QrRgnZk5nAVb6daKyDVhLtLk4djEWw+LNRE0zx4G94Yqb4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <07C410008C563D4BA6FF0A9E615F694D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1484d3e0-9e84-4ba6-cc6c-08d72aa9002a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 04:42:43.9587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9Y+pgam918uBRonO3yd4lNL+tBbCdpi9WNBNZZSpjChAkUIT48lYGs9hRDrQX3l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1135
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-26_08:2019-08-26,2019-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908270051
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC8yNS8xOSAzOjI5IFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6DQo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0NCj4+IFZvbjogIlRhbyBSZW4iIDx0YW9yZW5AZmIuY29t
Pg0KPj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwu
Y29tPiwgIkFuZHJldyBKZWZmZXJ5IiA8YW5kcmV3QGFqLmlkLmF1Pg0KPj4gQ0M6ICJsaW51eC1t
dGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJPcGVuQk1DIE1haWxsaXN0IiA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPj4gR2VzZW5kZXQ6IE1vbnRhZywgMjYuIEF1Z3Vz
dCAyMDE5IDAwOjA4OjA4DQo+PiBCZXRyZWZmOiBSZToga2VybmVsIEJVRyBhdCBmcy9qZmZzMi9n
Yy5jOjM5NSENCj4gDQo+PiBPbiA4LzI1LzE5IDEyOjIyIFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIg
d3JvdGU6DQo+Pj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMjowNiBBTSBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCj4+Pj4gTG9va3MgbGlrZSBhIGxhY2sgb2Ygcm9i
dXN0bmVzcyB0byBmaWxlc3lzdGVtIGNvcnJ1cHRpb24gdG8gbWUuIExXTg0KPj4+DQo+Pj4gV2hh
dCBleGFjdGx5IG1ha2VzIHlvdSB0aGluayBzbz8NCj4+PiBUaGUgaW5vZGUgY2FjaGUgZW50cnkg
aXMgaW4gc3RhdGUgSU5PX1NUQVRFX1VOQ0hFQ0tFRCB3aGlsZSBHQyBydW4sDQo+Pj4gd2hpY2gg
aXMgbm90IGFsbG93ZWQuDQo+Pj4NCj4+PiBUYW8sIGlzIHRoZSBlcnJvciBwZXJzaXN0ZW50IG9y
IGRpZCBpdCBoYXBwZW4gb25seSBvbmNlPw0KPj4NCj4+IEhpIFJpY2hhcmQsDQo+Pg0KPj4gSXQg
cmFyZWx5IGhhcHBlbnMgKH4xIG91dCBvZiAxMDAwIG1hY2hpbmVzIGluIG15IGVudmlyb25tZW50
KSwgYnV0IG9uY2UgaXQNCj4+IGhhcHBlbnMsIGl0J3MgcGVyc2lzdGVudDogdGhlIG1hY2hpbmUg
d2lsbCBmYWxsIGludG8gcmVib290IGxvb3AgZHVlIHRvIHRoZQ0KPj4gY3Jhc2guDQo+IA0KPiBD
YW4geW91IHByb3ZpZGUgbWUgYW4gaW1hZ2Ugb2YgdGhlIGZpbGVzeXN0ZW0gc3VjaCB0aGF0IEkg
Y2FuIGhhdmUgYSBsb29rPw0KPiBBbiBpbWFnZSB3aGVyZSB0aGUgaXNzdWUgaXMgcGVyc2lzdGVu
dC4uLg0KDQpIaSBSaWNoYXJkLA0KDQpJIHRyaWVkIGtlcm5lbCBpbWFnZSB3aXRoIGpmZnMyIHN1
bW1hcnkgZW5hYmxlZCBhbmQgZGlzYWJsZWQsIGFuZCBpdCBsb29rcyB0bw0KbWUgdGhlIHJlc3Vs
dCBpcyBzaW1pbGFyOiBJIGNhbiByZWFjaCBsb2dpbiBzY3JlZW4gbm93LCBidXQgdGhlIHNhbWUg
a2VybmVsDQpwYW5pYyBoYXBwZW5zIGFmdGVyICJyZWJvb3QiIGNvbW1hbmQuDQoNClRoZSBiZWhh
dmlvciBpcyBhIGxpdHRsZSBkaWZmZXJlbnQgZnJvbSB3aGF0IEkgc2F3IHllc3RlcmRheTogcHJl
dmlvdXNseSBrZXJuZWwNCnBhbmljIGhhcHBlbmVkIGF0IGJvb3QgdGltZSwgYW5kIG5vdyBpdCdz
IGFmdGVyICJyZWJvb3QiIGNvbW1hbmQuIEkgZ3Vlc3MgaXQncw0KYmVjYXVzZSBtb3JlIG5vZGUg
YmVpbmcgd3JpdHRlbiB0byB0aGUgZmxhc2g/DQoNCkkgdW5kZXJzdGFuZCBpdCdzIGhlbHBmdWwg
dG8gc2hhcmUgdGhlIGZpbGUgc3lzdGVtIGltYWdlLCBidXQgdW5mb3J0dW5hdGVseSBJDQpjYW5u
b3QgZG8gaXQgYmVjYXVzZSBpdCBjb250YWlucyBjb25maWRlbnRpYWwgZGF0YS4gU29ycnkgYWJv
dXQgdGhhdC4uDQoNClRoYW5rIHlvdSBhZ2FpbiBmb3IgdGhlIGhlbHAsIGFuZCBraW5kbHkgbGV0
IG1lIGtub3cgaWYgeW91IGhhdmUgZnVydGhlcg0Kc3VnZ2VzdGlvbnMuDQoNCg0KQ2hlZXJzLA0K
DQpUYW8NCg==
