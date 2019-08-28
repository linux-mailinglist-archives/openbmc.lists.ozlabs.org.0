Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DC9F72D
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 02:09:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J5hQ6lm6zDqxh
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 10:09:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=31438aa310=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lhkADVVX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NWGUDAlr"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J5gm2Td3zDqjY
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 10:08:47 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7S08aKs026844; Tue, 27 Aug 2019 17:08:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=i9cPVzXETJzR3NEOTZQgH5X7f7e1T7LWL58gtYEQ0NI=;
 b=lhkADVVXwKVdx+eVr4nQHaPDnc1qZqVHmnWtXRjabekNkbhUOQKDlySdpyeDH8vImDZY
 mnQSkfdfbDvWR23zRs0rwjWRk98sTGyOFXziYrP+HeSFXOVOyb1PDqRKURfX5CDokjuA
 9zr+ahwx6oLyJzBIwz4NS72Rlg8IK8/R1y4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2un2fm3eaq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Aug 2019 17:08:37 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Aug 2019 17:08:36 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Aug 2019 17:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivHUHRviJKPRR3fb8KYtGkGNkbjDc7++vqWuGnbsWIna8EpT6URaXF3ub64vgIf86RsMd9bsegdmBpIRuyrcyrGsbXV7RvEyMJjyrDxXEK8qb1PZ5AXxhA3S5nIs1aaUqusyCWXw0YMCuM1HzpjvdwGwr5tzgG3LU43i9xMufAHqSE5x/FDrUnXEXyEjfng9Z564ULyluLy5JijnKHXer0t5P2pRcRv0SbCVbhI/jqswCiHxyl8xEySP8akoNK+K6CWb+Q9vmgohwuT2mBes033wfEVJTgbTdUiYlgNRiQdTAU9z39/sm7cs/f8G6RibFX96vi/SjB/0AOXPdC7vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9cPVzXETJzR3NEOTZQgH5X7f7e1T7LWL58gtYEQ0NI=;
 b=Vaiyn+xtLgy3Ptw3tCgukVehKUhI+xtuIl1Yx5fgrrkkXgxbT6DjPAUAIQxqeVlWsIaWTcEhuSB6es/F3fkXgw0xn03IMknGH8RTqhyngnwAVDLv7T4CtX677dl4hqPbt05ypKrZOVOnxZRFPlINweqYmgWYrDKyIhpqxsP/C1J/zqvy+EYIH1FJV4fi5KM8+/0lUpJdtD3An+c+6p/aTUIOD23zTWFsZy87Fa7Bde3SmVKxciRt7FKsKv34ToOE9hJdYzkRlFrQJW952NZqjga6xFPJRhMfJu7qMlP4ouIaYYPrW5pJezEzfrOtPTNk+MSJC8NecYRger/XL3gxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9cPVzXETJzR3NEOTZQgH5X7f7e1T7LWL58gtYEQ0NI=;
 b=NWGUDAlrxKnwyJ3tA25hL+ErDGrSwK+xgM1fKsuzcBdxgoWvhmozswoe/M5yTvGfNC2UDkgH2zXpjTD8olQ5uChFGzVlR6Uw4nmMi6bn7uzvGnoeGfgksGqmACwjRhQOwF4VC6P2GPJJQy0mZGZpjUbzlMJNdBQUy3b9ySa9xk8=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1310.namprd15.prod.outlook.com (10.175.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 00:08:35 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 00:08:35 +0000
From: Tao Ren <taoren@fb.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [Potential Spoof] Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: [Potential Spoof] Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAP//uMoAgAB7VACAAYVBAIABuxeA
Date: Wed, 28 Aug 2019 00:08:35 +0000
Message-ID: <30720005-49a6-c2ba-2719-c00772bf1caf@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
 <216516045.73889.1566772168645.JavaMail.zimbra@nod.at>
 <bc19f328-ef5d-9840-7985-82461c99205e@fb.com>
In-Reply-To: <bc19f328-ef5d-9840-7985-82461c99205e@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:300:ae::15) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::8b51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 578ff742-b6cf-4d2a-e0c2-08d72b4bde8f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1310; 
x-ms-traffictypediagnostic: MWHPR15MB1310:
x-microsoft-antispam-prvs: <MWHPR15MB1310A2960C5AF26EA7AF1886B2A30@MWHPR15MB1310.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(102836004)(7736002)(66476007)(2616005)(25786009)(476003)(446003)(46003)(66574012)(2906002)(6246003)(486006)(316002)(76176011)(256004)(386003)(53546011)(58126008)(11346002)(229853002)(99286004)(14444005)(305945005)(14454004)(6916009)(4326008)(54906003)(6116002)(66556008)(66946007)(71200400001)(65806001)(53936002)(71190400001)(8676002)(5660300002)(81166006)(81156014)(86362001)(31686004)(65956001)(478600001)(52116002)(31696002)(66446008)(36756003)(8936002)(64756008)(6436002)(6512007)(6506007)(186003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1310;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnEw0g79JptEPn1sx+tBMJtKDb0AzHr+Kv64VaIyO9hAcl356ZJ2oPH76Ftv1onbe6gK2j0cIGbJ0MMUe6/lkus7BoI4DzqmOoIcVrIuaDMFtJBJBlCmTgoq3wpIai3K8nnRhPuUv0AwYHS358wdARt4+qMN4utkNQ9qUmCoYyl26GpL/tCm+3GwjgnB77pLAxru+TXukgZ9SrXdaAuTxZdDxvEGeTrh2GiSNP5YVgY8L+ZD+8PNUk1ZB7dhV4j8J0RsSwn9pgSFv8tB8d6raNME+irdr6uuB2K4HaPXocqIK3aGDA9d1N2DktmzTP0A6+7xHZd8Ixs3+fht8duuGkaEY6C7fWuKQekdV19GJevatf66o1Gpc834tBj1S4aYhkiUYI4YUiDOEk0Hp6uVDsttc8Qq4ACM+TmYVmyD3sw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDFC331DC3E9524EB61E89921110F696@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 578ff742-b6cf-4d2a-e0c2-08d72b4bde8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 00:08:35.4686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mP1kIy99WQdGy/+bKjdaWD9QlbCQNDbG9T0+FNiSpPDmgJUYGRZuGfTkrhMXuN9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1310
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-27_05:2019-08-27,2019-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908270231
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

T24gOC8yNi8xOSA5OjQyIFBNLCBUYW8gUmVuIHdyb3RlOg0KPiBPbiA4LzI1LzE5IDM6MjkgUE0s
IFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToNCj4+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0NCj4+PiBWb246ICJUYW8gUmVuIiA8dGFvcmVuQGZiLmNvbT4NCj4+PiBBbjogIlJpY2hh
cmQgV2VpbmJlcmdlciIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+LCAiQW5kcmV3IEpl
ZmZlcnkiIDxhbmRyZXdAYWouaWQuYXU+DQo+Pj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZz4sICJPcGVuQk1DIE1haWxsaXN0IiA8b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPg0KPj4+IEdlc2VuZGV0OiBNb250YWcsIDI2LiBBdWd1c3QgMjAxOSAwMDowODow
OA0KPj4+IEJldHJlZmY6IFJlOiBrZXJuZWwgQlVHIGF0IGZzL2pmZnMyL2djLmM6Mzk1IQ0KPj4N
Cj4+PiBPbiA4LzI1LzE5IDEyOjIyIFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6DQo+Pj4+
IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDI6MDYgQU0gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bh
ai5pZC5hdT4gd3JvdGU6DQo+Pj4+PiBMb29rcyBsaWtlIGEgbGFjayBvZiByb2J1c3RuZXNzIHRv
IGZpbGVzeXN0ZW0gY29ycnVwdGlvbiB0byBtZS4gTFdODQo+Pj4+DQo+Pj4+IFdoYXQgZXhhY3Rs
eSBtYWtlcyB5b3UgdGhpbmsgc28/DQo+Pj4+IFRoZSBpbm9kZSBjYWNoZSBlbnRyeSBpcyBpbiBz
dGF0ZSBJTk9fU1RBVEVfVU5DSEVDS0VEIHdoaWxlIEdDIHJ1biwNCj4+Pj4gd2hpY2ggaXMgbm90
IGFsbG93ZWQuDQo+Pj4+DQo+Pj4+IFRhbywgaXMgdGhlIGVycm9yIHBlcnNpc3RlbnQgb3IgZGlk
IGl0IGhhcHBlbiBvbmx5IG9uY2U/DQo+Pj4NCj4+PiBIaSBSaWNoYXJkLA0KPj4+DQo+Pj4gSXQg
cmFyZWx5IGhhcHBlbnMgKH4xIG91dCBvZiAxMDAwIG1hY2hpbmVzIGluIG15IGVudmlyb25tZW50
KSwgYnV0IG9uY2UgaXQNCj4+PiBoYXBwZW5zLCBpdCdzIHBlcnNpc3RlbnQ6IHRoZSBtYWNoaW5l
IHdpbGwgZmFsbCBpbnRvIHJlYm9vdCBsb29wIGR1ZSB0byB0aGUNCj4+PiBjcmFzaC4NCj4+DQo+
PiBDYW4geW91IHByb3ZpZGUgbWUgYW4gaW1hZ2Ugb2YgdGhlIGZpbGVzeXN0ZW0gc3VjaCB0aGF0
IEkgY2FuIGhhdmUgYSBsb29rPw0KPj4gQW4gaW1hZ2Ugd2hlcmUgdGhlIGlzc3VlIGlzIHBlcnNp
c3RlbnQuLi4NCj4gDQo+IEhpIFJpY2hhcmQsDQo+IA0KPiBJIHRyaWVkIGtlcm5lbCBpbWFnZSB3
aXRoIGpmZnMyIHN1bW1hcnkgZW5hYmxlZCBhbmQgZGlzYWJsZWQsIGFuZCBpdCBsb29rcyB0bw0K
PiBtZSB0aGUgcmVzdWx0IGlzIHNpbWlsYXI6IEkgY2FuIHJlYWNoIGxvZ2luIHNjcmVlbiBub3cs
IGJ1dCB0aGUgc2FtZSBrZXJuZWwNCj4gcGFuaWMgaGFwcGVucyBhZnRlciAicmVib290IiBjb21t
YW5kLg0KPiANCj4gVGhlIGJlaGF2aW9yIGlzIGEgbGl0dGxlIGRpZmZlcmVudCBmcm9tIHdoYXQg
SSBzYXcgeWVzdGVyZGF5OiBwcmV2aW91c2x5IGtlcm5lbA0KPiBwYW5pYyBoYXBwZW5lZCBhdCBi
b290IHRpbWUsIGFuZCBub3cgaXQncyBhZnRlciAicmVib290IiBjb21tYW5kLiBJIGd1ZXNzIGl0
J3MNCj4gYmVjYXVzZSBtb3JlIG5vZGUgYmVpbmcgd3JpdHRlbiB0byB0aGUgZmxhc2g/DQo+IA0K
PiBJIHVuZGVyc3RhbmQgaXQncyBoZWxwZnVsIHRvIHNoYXJlIHRoZSBmaWxlIHN5c3RlbSBpbWFn
ZSwgYnV0IHVuZm9ydHVuYXRlbHkgSQ0KPiBjYW5ub3QgZG8gaXQgYmVjYXVzZSBpdCBjb250YWlu
cyBjb25maWRlbnRpYWwgZGF0YS4gU29ycnkgYWJvdXQgdGhhdC4uDQo+IA0KPiBUaGFuayB5b3Ug
YWdhaW4gZm9yIHRoZSBoZWxwLCBhbmQga2luZGx5IGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGZ1
cnRoZXINCj4gc3VnZ2VzdGlvbnMuDQoNClNvbWUgaW50ZXJlc3RpbmcgZmluZGluZ3M6IEkgY2hl
Y2tlZCAzIGltcGFjdGVkIG1hY2hpbmVzIGFuZCBhbGwgb2YgdGhlbSBhcmUNCmNhdXNlZCBieSB0
aGUgc2FtZSBzZXQgb2YgZmlsZXMsIGFuZCB0aGVzZSBmaWxlcyBoYXZlIGJlZW4gb24gdGhlIGZs
YXNoIGZvcg0KeWVhcnMgd2l0aG91dCBtb2RpZmljYXRpb24uDQoNCg0KLSBUYW8NCg==
