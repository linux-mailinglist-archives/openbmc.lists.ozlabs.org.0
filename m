Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46096CF5
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 01:12:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cmlw4FXGzDr39
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 09:12:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3135482c9f=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="XZwhofzV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="aFsb8qan"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CmlD3VhkzDr6w
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 09:11:51 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KMxxEK028360; Tue, 20 Aug 2019 16:11:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=q4q2GSKBdtIU1WXsI/rYLNhIStlkXltD3R9XfZxDYJA=;
 b=XZwhofzVyHfbboL6U8Vd2nKU5p9Ar2mrJGmP7bdW040WHjB3dihCmnvEhPbOfB5yHGdd
 k19rp0aG30m+HlA2J7jk4h7cg/RLwY65k1oCyEH+84w+2obIRy6YxExhbNVJj0GD3Es0
 t9rRk4BWpxZ26TmZXhZp25V2kne9BNPlEs0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ugpmas10n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Aug 2019 16:11:47 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 16:11:46 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 16:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glYlsPAAagXrLWq+IHwCOuZayiRs6m/+2qbrJdRUqqeK+DS5IG6inXif4IQYjoFjmF3oYDL75SzlroswzIM8u/xSXBmgbdiBHhWFKZ0uFik0XTmpEpV0WGFvpqXMvGIHD5Jtr2qjwTDgDtmOl5P0wlEjIu+JvjwMcys6z6VK7TDbzosH+TTZ+TlAS00/5ZdG0DMsmTsIN4ndE5/lZ8B9j2/II6Z9bstzPphi43sB4Yyp0p04BAfuQNb9lcy2WC0pvmkRRbVEt5E1bG0/EX/7bfXHFiOUuVlvs9mI0DB1mu4KkUQdBw8CqTTHHcpAnteX5JUONZ7TKyuxSCdYKKO7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4q2GSKBdtIU1WXsI/rYLNhIStlkXltD3R9XfZxDYJA=;
 b=erhLaavDKnCmIZKkuf3uKilAvtGc8aTm4d93LhWBbzugD5tgOIHCTUVdVMb4J4xyS5tKWs9yhVex9NQaP58xUGuTuOAgiF/OsHxo58oi9lWIdr7sKV8kRWgpGnw9ZnBBwAwDxkF7SS9iT5aVL+Hj3clmeKtq6U+PfiykFHLtl0AxbwmvNU98vsZ6hc1E+p4rftYtQCP0Px5nW9SCg8mhRG90jpOGjV0f/MW5kNitXtWFe1wLLocxN0Lim5Wsoz4fJ5oAJN3WS2IS9KGSXhH9Lw7Wmo6Wl6ZHFqndDLLOMLHUKvcFXAJPpNJz3rEz7pY/5WIoJPYtl93zPAtKsNXd1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4q2GSKBdtIU1WXsI/rYLNhIStlkXltD3R9XfZxDYJA=;
 b=aFsb8qanueZVt7c0y9qCQCvB970s+e40qTxzx3f2gC8hbU1d8KX6ZzKtRdUjbTU2HlLoyLKcgTu7o5kbOGVeM/xWmumuqwhrplNOcz2TqPJ7FfqNzLbOG78MK99XFnohekRR+A14ZEIKJNHrRXFK19FJDkhSLNwNW3R9dkdQwds=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1933.namprd15.prod.outlook.com (10.174.100.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 23:11:45 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 23:11:45 +0000
From: Tao Ren <taoren@fb.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqA
Date: Tue, 20 Aug 2019 23:11:45 +0000
Message-ID: <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
In-Reply-To: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:301:3b::20) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:7d53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cca80f4b-1a4e-4b69-e493-08d725c3c510
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1933; 
x-ms-traffictypediagnostic: MWHPR15MB1933:
x-microsoft-antispam-prvs: <MWHPR15MB1933AE9FEAAC5BDFA74BB8D3B2AB0@MWHPR15MB1933.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(136003)(39860400002)(366004)(189003)(199004)(25786009)(5660300002)(66476007)(66946007)(64756008)(86362001)(66446008)(71190400001)(71200400001)(66556008)(486006)(6436002)(65956001)(36756003)(256004)(65806001)(6506007)(186003)(8676002)(386003)(2616005)(6486002)(102836004)(53936002)(6512007)(53546011)(14454004)(76176011)(81156014)(8936002)(229853002)(46003)(45080400002)(31696002)(446003)(11346002)(6246003)(476003)(2501003)(316002)(7736002)(2906002)(6116002)(305945005)(110136005)(58126008)(52116002)(14444005)(31686004)(81166006)(99286004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1933;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4kcbB0BMrXWa55qQnikhhxG6mqxeTDNS1FnN2AoIOIMSiPfvEh3Q2XjjyHKaGuARUk3mIi916l5GcAVxZEtEACNCgTk+K8ExHWFhiYd8ZPFbqXUaiPSgWbSGl2i0YKUJncxnN67qEIdSw27lH8oayY1ihM+u9j7eJHrtRwQi5S2F4QNkVTCkWNL2/C3QyHlyvw2Q871RIWdY0lIITfZqvJfxUQVjLlJN7ngFvDDKuUjzkWnJmAHL/Q9h/pYYahshMfZInsRQY4yVHrwHLrKDRLhtdFMj1LUi//SkPkkpZ1weR3cimj/Z32a93HEm+hgvpl6yi+04VBleFmZRcgBIEbSHG2K0e/79MuVPNfTOz66drpLqRsXiy98cshwT95MQpNypXHmy814xVlOBWwzHGG5DTXcdR5r4qWFBYa3OFS8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D08796B18F3D124FB1D12DB25835F95D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cca80f4b-1a4e-4b69-e493-08d725c3c510
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 23:11:45.2752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTK9hm+wfO0vWbezcw/Fj2BOBkfcqS3jqwmKkeyoWOfOTyGaZjqANqB7dYXfhAoy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1933
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200209
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

T24gOC8yMC8xOSA0OjA5IFBNLCBUYW8gUmVuIHdyb3RlOg0KPiBIaSwNCj4gDQo+IEkgaGl0IGZv
bGxvd2luZyBqZmZzMiBidWcgd2hpbGUgcnVubmluZyBMaW51eCA1LjAuMyBvbiBDTU0gKEFTUEVF
RDI1MDApIEJNQyBwbGF0Zm9ybS4gSGFzIGFueW9uZSBzZWVuIHRoZSBpc3N1ZSBiZWZvcmU/IEFu
eSBzdWdnZXN0aW9ucz8gDQo+IA0KPiBbICAgNDYuMDI0MDE3XSAtLS0tLS0tLS0tLS1bIGN1dCBo
ZXJlIF0tLS0tLS0tLS0tLS0NCj4gWyAgIDQ2LjA3OTE3OF0ga2VybmVsIEJVRyBhdCAvZGF0YS91
c2Vycy90YW9yZW4vb3BlbmJtYy9idWlsZC1jbW0vdG1wL3dvcmstc2hhcmVkL2NtbS9rZXJuZWwt
c291cmNlL2ZzL2pmZnMyL2djLmM6Mzk1IQ0KPiBbICAgNDYuMjA0MDc2XSBJbnRlcm5hbCBlcnJv
cjogT29wcyAtIEJVRzogMCBbIzFdIEFSTQ0KPiBbICAgNDYuMjYxMzc4XSBNb2R1bGVzIGxpbmtl
ZCBpbjogZXh0NCBtYmNhY2hlIGpiZDIgY3J5cHRvX2hhc2gNCj4gWyAgIDQ2LjMyOTA5M10gQ1BV
OiAwIFBJRDogMTE4MSBDb21tOiBqZmZzMl9nY2RfbXRkMyBOb3QgdGFpbnRlZCA1LjAuMy1jbW0g
IzENCj4gWyAgIDQ2LjQxMTM0M10gSGFyZHdhcmUgbmFtZTogR2VuZXJpYyBEVCBiYXNlZCBzeXN0
ZW0NCj4gWyAgIDQ2LjQ2ODY4NV0gUEMgaXMgYXQgamZmczJfZ2FyYmFnZV9jb2xsZWN0X3Bhc3Mr
MHg2ZjQvMHg3MzQNCj4gWyAgIDQ2LjUzNTMyMl0gTFIgaXMgYXQgamZmczJfZ2FyYmFnZV9jb2xs
ZWN0X3Bhc3MrMHg2ZjQvMHg3MzQNCj4gWyAgIDQ2LjYwMTk3N10gcGMgOiBbPDgwMmMyOTJjPl0g
ICAgbHIgOiBbPDgwMmMyOTJjPl0gICAgcHNyOiA2MDAwMDAxMw0KPiBbICAgNDYuNjc2OTU5XSBz
cCA6IGFmM2NkZWQwICBpcCA6IGI1NmE3NWMwICBmcCA6IGFmM2NkZjI0DQo+IFsgICA0Ni43Mzk0
NjNdIHIxMDogYjQwNjExNDAgIHI5IDogYjU3YTM5MDAgIHI4IDogYjU1NWQ0YWMNCj4gWyAgIDQ2
LjgwMTk2OF0gcjcgOiBiNTU1ZDRhYyAgcjYgOiBiNDAzNTAyYyAgcjUgOiAwMDAwMDAwMCAgcjQg
OiBiNDAzNTAwMA0KPiBbICAgNDYuODgwMDczXSByMyA6IGI1NmE3NWMwICByMiA6IDAwMDAwMDAw
ICByMSA6IDAwMDAwMDAwICByMCA6IGI0MDM1MDJjDQo+IFsgICA0Ni45NTgxNzddIEZsYWdzOiBu
WkN2ICBJUlFzIG9uICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgSVNBIEFSTSAgU2VnbWVudCBub25l
DQo+IFsgICA0Ny4wNDM1NjFdIENvbnRyb2w6IDAwYzUzODdkICBUYWJsZTogYjU3NzQwMDggIERB
QzogMDAwMDAwNTENCj4gWyAgIDQ3LjExMjMxOV0gUHJvY2VzcyBqZmZzMl9nY2RfbXRkMyAocGlk
OiAxMTgxLCBzdGFjayBsaW1pdCA9IDB4NTQzNzJmZmUpDQo+IFsgICA0Ny4xOTI0OTBdIFN0YWNr
OiAoMHhhZjNjZGVkMCB0byAweGFmM2NlMDAwKQ0KPiBbICAgNDcuMjQ0NjAxXSBkZWMwOiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMCA4MGEwNzAyOCA4MDBhZDZj
OSAwMDAwZmYyYw0KPiBbICAgNDcuMzQyNDY4XSBkZWUwOiBhZjNjZGVmYyBhZjNjZGVmMCA4MDEy
NWNkNCA4MDEyMzEzYyBhZjNjZGYyNCA4MDBhZDZjOSA4MDEyNjE0YyBiNDAzNTAwMCANCj4gWyAg
IDQ3LjQ0MDMzMV0gZGYwMDogZmZmZmUwMDAgYWYzY2MwMDAgYWYzY2MwMDAgYjQwMzUwMDAgODAy
YzUwOWMgYjQxOWRkMTggYWYzY2RmNzQgYWYzY2RmMjgNCj4gWyAgIDQ3LjUzODE5Nl0gZGYyMDog
ODAyYzUxNzQgODAyYzIyNDQgZmZmZmUwMDAgMDAwMDAwMDEgMDAwMDAwMDAgZmZmZmUwMDAgYjU3
YjA5NDAgMDAwMDAwMDANCj4gWyAgIDQ3LjYzNjA1OF0gZGY0MDogZmZmZmUwMDAgYjQwMzUwMDAg
ODAyYzUwOWMgYjQxOWRkMTggYWYzY2RmNzQgODAwYWQ2YzkgYjU3NTM5ODAgYjU3NTM5ODANCj4g
WyAgIDQ3LjczMzkyM10gZGY2MDogYjU3YjA5NDAgMDAwMDAwMDAgYWYzY2RmYWMgYWYzY2RmNzgg
ODAxMzRkNTggODAyYzUwYTggYjU3NTM5OTggYjU3NTM5OTgNCj4gWyAgIDQ3LjgzMTc4N10gZGY4
MDogYWYzY2RmYWMgYjU3YjA5NDAgODAxMzRjMGMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDANCj4gWyAgIDQ3LjkyOTY0OF0gZGZhMDogMDAwMDAwMDAgYWYzY2Rm
YjAgODAxMDEwZTggODAxMzRjMTggMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAN
Cj4gWyAgIDQ4LjAyNzUxMl0gZGZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4gWyAgIDQ4LjEyNTM3Nl0g
ZGZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDANCj4gWyAgIDQ4LjIyMzIzMF0gQmFja3RyYWNlOiAgDQo+IFsg
ICA0OC4yNTI0ODldIFs8ODAyYzIyMzg+XSAoamZmczJfZ2FyYmFnZV9jb2xsZWN0X3Bhc3MpIGZy
b20gWzw4MDJjNTE3ND5dIChqZmZzMl9nYXJiYWdlX2NvbGxlY3RfdGhyZWFkKzB4ZDgvMHgxYWMp
DQo+IFsgICA0OC4zNzUyOTRdICByMTA6YjQxOWRkMTggcjk6ODAyYzUwOWMgcjg6YjQwMzUwMDAg
cjc6YWYzY2MwMDAgcjY6YWYzY2MwMDAgcjU6ZmZmZmUwMDANCj4gWyAgIDQ4LjQ2ODk4NV0gIHI0
OmI0MDM1MDAwDQo+IFsgICA0OC40OTkyODFdIFs8ODAyYzUwOWM+XSAoamZmczJfZ2FyYmFnZV9j
b2xsZWN0X3RocmVhZCkgZnJvbSBbPDgwMTM0ZDU4Pl0gKGt0aHJlYWQrMHgxNGMvMHgxNjQpDQo+
IFsgICA0OC42MDMzNThdICByNjowMDAwMDAwMCByNTpiNTdiMDk0MCByNDpiNTc1Mzk4MA0KPiBb
ICAgNDguNjU4NTkwXSBbPDgwMTM0YzBjPl0gKGt0aHJlYWQpIGZyb20gWzw4MDEwMTBlOD5dIChy
ZXRfZnJvbV9mb3JrKzB4MTQvMHgyYykNCj4gWyAgIDQ4Ljc0NTAwMV0gRXhjZXB0aW9uIHN0YWNr
KDB4YWYzY2RmYjAgdG8gMHhhZjNjZGZmOCkNCj4gWyAgIDQ4LjgwNTQyOF0gZGZhMDogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDANCj4gWyAgIDQ4LjkwMzI5Nl0gZGZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4gWyAgIDQ5
LjAwMTE1N10gZGZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MTMgMDAwMDAwMDANCj4gWyAgIDQ5LjA4MDMwNV0gIHIxMDowMDAwMDAwMCByOTowMDAwMDAwMCBy
ODowMDAwMDAwMCByNzowMDAwMDAwMCByNjowMDAwMDAwMCByNTo4MDEzNGMwYw0KPiBbICAgNDku
MTc0MDAwXSAgcjQ6YjU3YjA5NDANCj4gWyAgIDQ5LjIwNDI3NV0gQ29kZTogZTU5ZjAwNDQgZWJm
YTI1Y2IgZTFhMDAwMDYgZWIwZTg4OGQgKGU3ZjAwMWYyKQ0KPiBbICAgNDkuMjc3MTg4XSAtLS1b
IGVuZCB0cmFjZSA2YmFhN2FmMGE5MGQxNWFiIF0tLS0NCj4gWyAgIDQ5LjMzMjM5NV0gS2VybmVs
IHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbg0KDQpCVFcsIGJlbG93IGFyZSBh
bGwgdGhlIG1lc3NhZ2VzIHByaW50ZWQgYnkgamZmczIgYmVmb3JlIHN5c3RlbSBjcmFzaDoNCg0K
WyAgIDIxLjA3ODQzM10gamZmczI6IHZlcnNpb24gMi4yLiAoU1VNTUFSWSkgIMKpIDIwMDEtMjAw
NiBSZWQgSGF0LCBJbmMuDQpbICAgMzkuNzc2MjA3XSBqZmZzMjogbm90aWNlOiAoMTE4MCkgamZm
czJfYnVpbGRfeGF0dHJfc3Vic3lzdGVtOiBjb21wbGV0ZSBidWlsZGluZyB4YXR0ciBzdWJzeXN0
ZW0sIDAgb2YgeGRhdHVtICgwIHVuY2hlY2tlZCwgMCBvcnBoYW4pIGFuZCAwIG9mIHhyZWYgKDAg
ZGVhZCwgMCBvcnBoYW4pIGZvdW5kLg0KWyAgIDQwLjAxNjU3NF0gamZmczI6IHdhcm5pbmc6ICgx
MTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2ludGVybmFsOiBubyBkYXRhIG5vZGVzIGZvdW5kIGZv
ciBpbm8gIzE0MA0KWyAgIDQwLjEyMjk2NF0gamZmczI6IG5vdGljZTogKDExODEpIGpmZnMyX2Rv
X3JlYWRfaW5vZGVfaW50ZXJuYWw6IGJ1dCBpdCBoYXMgY2hpbGRyZW4gc28gd2UgZmFrZSBzb21l
IG1vZGVzIGZvciBpdA0KWyAgIDQzLjU3OTM2MV0gamZmczI6IHdhcm5pbmc6ICgxMTgxKSBqZmZz
Ml9nZXRfaW5vZGVfbm9kZXM6IEVlcC4gTm8gdmFsaWQgbm9kZXMgZm9yIGlubyAjMTQxLg0KWyAg
IDQzLjY3OTQwNF0gamZmczI6IHdhcm5pbmc6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2lu
dGVybmFsOiBubyBkYXRhIG5vZGVzIGZvdW5kIGZvciBpbm8gIzE0MQ0KWyAgIDQzLjc4NTY2MV0g
amZmczI6IFJldHVybmVkIGVycm9yIGZvciBjcmNjaGVjayBvZiBpbm8gIzE0MS4gRXhwZWN0IGJh
ZG5lc3MuLi4NClsgICA0NC4wMjE4MjVdIGpmZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZG9f
cmVhZF9pbm9kZV9pbnRlcm5hbDogbm8gZGF0YSBub2RlcyBmb3VuZCBmb3IgaW5vICMxNTQNClsg
ICA0NC4xMjgxOTFdIGpmZnMyOiBub3RpY2U6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2lu
dGVybmFsOiBidXQgaXQgaGFzIGNoaWxkcmVuIHNvIHdlIGZha2Ugc29tZSBtb2RlcyBmb3IgaXQN
ClsgICA0NC4zMTQ4NjJdIGpmZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZG9fcmVhZF9pbm9k
ZV9pbnRlcm5hbDogbm8gZGF0YSBub2RlcyBmb3VuZCBmb3IgaW5vICMxNTUNClsgICA0NC40MjEx
NTJdIGpmZnMyOiBub3RpY2U6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2ludGVybmFsOiBi
dXQgaXQgaGFzIGNoaWxkcmVuIHNvIHdlIGZha2Ugc29tZSBtb2RlcyBmb3IgaXQNClsgICA0NC42
MDczNzhdIGpmZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZG9fcmVhZF9pbm9kZV9pbnRlcm5h
bDogbm8gZGF0YSBub2RlcyBmb3VuZCBmb3IgaW5vICMxNjMNClsgICA0NC43MTM2OTJdIGpmZnMy
OiBub3RpY2U6ICgxMTgxKSBqZmZzMl9kb19yZWFkX2lub2RlX2ludGVybmFsOiBidXQgaXQgaGFz
IGNoaWxkcmVuIHNvIHdlIGZha2Ugc29tZSBtb2RlcyBmb3IgaXQNClsgICA0NC44OTk5OTFdIGpm
ZnMyOiB3YXJuaW5nOiAoMTE4MSkgamZmczJfZ2V0X2lub2RlX25vZGVzOiBFZXAuIE5vIHZhbGlk
IG5vZGVzIGZvciBpbm8gIzE2NC4NClsgICA0NS4wMDAxMDddIGpmZnMyOiB3YXJuaW5nOiAoMTE4
MSkgamZmczJfZG9fcmVhZF9pbm9kZV9pbnRlcm5hbDogbm8gZGF0YSBub2RlcyBmb3VuZCBmb3Ig
aW5vICMxNjQNClsgICA0NS4xMDYzNzBdIGpmZnMyOiBSZXR1cm5lZCBlcnJvciBmb3IgY3JjY2hl
Y2sgb2YgaW5vICMxNjQuIEV4cGVjdCBiYWRuZXNzLi4uDQpbICAgNDUuOTM0MjgyXSBqZmZzMjog
SW5vZGUgIzEwNiBhbHJlYWR5IGluIHN0YXRlIDAgaW4gamZmczJfZ2FyYmFnZV9jb2xsZWN0X3Bh
c3MoKSENCg0KDQpUaGFua3MsDQoNClRhbw0K
