Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC410E67C
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 08:51:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHPJ3dKLzDqRs
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 18:51:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7239b4c66a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="O77auKgN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cEHnhWgM"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHNS2bjMzDqQ9
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 18:50:39 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB27oFmT025735; Sun, 1 Dec 2019 23:50:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=9vbPuYYoOWf9KtsIlEeCU/dE3YogCWWufxfNpm6gnPI=;
 b=O77auKgN8jy4Expk+AajFXkDGin/NngJjXnkHjUBy+Ly8wZ9uyNdRetc9ejlLXzKKCcV
 0Qb1xcVT+I5nyzqog2hGMtMrYJw7FA1DwzNClYpZmZXwX2m8iMbU4CPBneivqU90A3cz
 IPlvWj+js7OB9akCIu5fO7vnsgY77OfD/kM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2wm8yk3ht6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 01 Dec 2019 23:50:31 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Sun, 1 Dec 2019 23:50:30 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Sun, 1 Dec 2019 23:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPOLBYpElkNUq5+OueFZTqVOZVRvIKSLj7AGVqMzMaoY1BQzgr1npxemZ82NYAUv9kOJdh7Kcm0Spnc7TX5V3D1k5sCIPdbJ0yDsxJluBApyJe7HOrOyTZUYK0B26pc5zlRVnyv76e8c/sF5wZrXrj7OqELkDqEy2R06MldTph7ASPniMkypH7dvAblF5o4aO53ueLWTGwTm1Owb8aE4ljh6ksDhEsjZNVFpRwSeCtqJjSnLmwUE2SA8EM28DFnp2Op2SOe2gqqHPEiSsIfRiAqa68m0CpOGxjJRUa0ME/PTErcVlazjpdSgtPVdL0TND7HVTkXUqvazWcLueEOFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vbPuYYoOWf9KtsIlEeCU/dE3YogCWWufxfNpm6gnPI=;
 b=NDSISgkBXdEY+m9w+MCkdkVq9QvOyd/WRGtVqv46dI2fJ5oN2gHwWiip84R3pZXqLMqMz4n77b1ceepjdsOAozOu4zvwLUvS82QNYEi8Vwwzni2xfojHdsJXmyrHpXW035VZZDA8CpWeauK2p7KV/9TqQqXsDHEM2BJOUJ+UgQ7xhshZK2EcoCFOFTbW59qUwyQPR8T2XKg4gt0GsRI/aQpOyJMPn6L4h2gVYdJ3JgKPZG08ct9/wYwmK83jvMWrXfEYo9noxurVNJaCWGLbe6e6ekMRDfpFGG6dFxdxyVYnkrK9sg7QMBrJBQHNFw45IBI4vvlVo+NJl4HR1i9xfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vbPuYYoOWf9KtsIlEeCU/dE3YogCWWufxfNpm6gnPI=;
 b=cEHnhWgMaTW2wE7XvonOmuoaEmFjotfFHI1BASNLcmBxAOe5P/WX6Q0xFDBowxsdR0fnLMRJ8lmJxL0uJ8qVn6XCfbSyzQClXeZ8V2pLzq+/M9xV6a/uxzNtF+p6rXAHvWJg4orzftG5AmQKVFUAWevLzzd6x+JhsAINsODnim8=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1517.namprd15.prod.outlook.com (10.173.235.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Mon, 2 Dec 2019 07:50:29 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376%11]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 07:50:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Kumar Thangavel <thangavel.k@hcl.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Fan speed controller validation
Thread-Topic: Fan speed controller validation
Thread-Index: AQHVm4PVD//5NU7LKUOru6b/45uBD6eVei4AgAsBirCABZF2gA==
Date: Mon, 2 Dec 2019 07:50:29 +0000
Message-ID: <876B4130-8EA0-4CF4-BA98-A884AD5D3B35@fb.com>
References: <SG2PR04MB30294FA650F268F9E273B8FAFD700@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <424B6416-2F3A-4F5E-BDA5-5BBB8919C622@fb.com>
 <SG2PR04MB30290216E5264EFD0999FE93FD470@SG2PR04MB3029.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30290216E5264EFD0999FE93FD470@SG2PR04MB3029.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::5397]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69178c9b-c5cb-45a1-44c5-08d776fc4d34
x-ms-traffictypediagnostic: MWHPR15MB1517:
x-microsoft-antispam-prvs: <MWHPR15MB1517B7705F2C1DB2A22A6979DD430@MWHPR15MB1517.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(396003)(366004)(376002)(53754006)(189003)(199004)(38564003)(478600001)(6486002)(7736002)(6436002)(3480700005)(102836004)(99286004)(229853002)(6506007)(76176011)(186003)(33656002)(6512007)(53546011)(236005)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(46003)(25786009)(316002)(110136005)(5660300002)(36756003)(2616005)(256004)(6246003)(11346002)(5024004)(71190400001)(446003)(14444005)(81156014)(81166006)(8676002)(8936002)(9326002)(6306002)(54896002)(6116002)(790700001)(14454004)(86362001)(2906002)(2501003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1517;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVoNn4C3hiGqwmVW+TCVux1VgrCqu4Pb1PPn5ONa2mL7r7DgENOOINh8h0C3rfH1jIEqwv9XvUizCyXrrz+oyydWCO/W01Y/1M08GShwfq72en5P+sM2nAMmXfdIzMEs9DCuTVF6P6pnrJ3NJPEqbtD1gi2OqjJXK2sHW5x70cegTk7lvkEtbcJ6ORBV6wdbw944DDy3Z6qGNbIvZUbBl7Xqiprlmpc61SFXK7iW/1BmYiGI5kLwhDP4ByjggC1+/D7ABzuYBEfGKHELB0n3q0S5DuOfugtHIuK8rg/q8Rneoa/Vfjvd9hhSX8UYdsS3A1krdRk6loAWWfjPm7/djnsTXXydTRpvMgxpmFYr3Z+hNTIEUquKE7mA6qaMfR6pYN0ro7LPgN2uF0RnUf4YeVzLZ702bTeWqyoyDCPeRmVztoRLUUvuQc+b/T9T2bip
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_876B41308EA04CF4BA98A884AD5D3B35fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69178c9b-c5cb-45a1-44c5-08d776fc4d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 07:50:29.4342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqcKKOku+Q2dCb7lwLlCLtL0rMutcxNwtKmeCvgH7ZV+B/MI5C+OQW2HtQVD5h1LuOSoeDL+NsuuJfprTtMleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1517
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-01_04:2019-11-29,2019-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912020070
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

--_000_876B41308EA04CF4BA98A884AD5D3B35fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3VtYXIsDQpJdCBpcyBzYW1lIGZvciBhbGwgcGxhdGZvcm1zLiBEbyB5b3Ugc2VlIHN3YW1w
ZCBydW5uaW5nIGluIHlvdXIgcGxhdGZvcm0uIElmIGl0IGlzIHJ1bm5pbmcgdGhlbiB5b3UgY2Fu
IGNoYW5nZSB5b3VyIHRlbXBlcmF0dXJlIHZhbHVlIGJleW9uZyBhbnkgb2YgbGltaXQgcHJvdmlk
ZWQgaW4gZmFuIHRhYmxlIGFuZCBmYW4gc3BlZWQgc2hvdWxkIGNoYW5nZSB0byB0aGUgbWVudGlv
biB2YWx1ZXMgaW4gdGFibGUuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpGcm9tOiBLdW1hciBUaGFu
Z2F2ZWwgPHRoYW5nYXZlbC5rQGhjbC5jb20+DQpEYXRlOiBUaHVyc2RheSwgTm92ZW1iZXIgMjgs
IDIwMTkgYXQgNDozNyBBTQ0KVG86IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiwg
Im9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1
YmplY3Q6IFJFOiBGYW4gc3BlZWQgY29udHJvbGxlciB2YWxpZGF0aW9uDQoNCkhpIFZpamF5LA0K
DQpUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuDQoNCldlIGFyZSB1c2luZyBlbnRpdHktbWFuYWdl
ciBmb3IgZmFuIHNwZWVkIGNvbnRyb2xsZXIuIFNvIHdlIGhhdmUgZW50cnkgZm9yIGZhbiBzcGVl
ZCBjb250cm9sbGVyIGluIGpzb24gZmlsZS4NCg0KQXMgeW91IHN1Z2dlc3RlZCwgd2UgY291bGQg
YWJsZSB0byBzZWUgc29tZSBwd20gYW5kIGZhbiBzcGVlZCB2YWx1ZXMgYXJlIGNoYW5naW5nIGlm
IHdlIHVwZGF0ZSB0aGUgdGVtcGVyYXR1cmUgdmFsdWVzIHdoaWxlIHN3YW1wZCBpcyBydW5uaW5n
IGluIFRQLg0KDQpJbiBZVjIsIHRoZSBwd20gdmFsdWVzIGFyZSBub3QgdXBkYXRpbmcgcHJvcGVy
bHkgaWYgdGVtcGVyYXR1cmUgdXBkYXRlcy4NCg0KUGxlYXNlIGZpbmQgdGhlIGF0dGFjaGVkIGRv
Y3VtZW50cyAgZm9yIHRlbXBlcmF0dXJlcyBhbmQgcHdtIHZhbHVlcyBvZiBUUCBhbmQgWVYyLg0K
DQpBcyBvZiBub3csIHdlIGFyZSB1c2luZyBzYW1lIFRQIHNwZWVkIGNvbnRyb2xsZXIgdGFibGUg
ZW50cmllcyBmb3IgWVYyLg0KDQpDb3VsZCB5b3UgcGxlYXNlIGxldCB1cyBrbm93IHRoZSBwcm9j
ZWR1cmUgZm9yIGZhbiBzcGVlZCB2YWxpZGF0aW9uLg0KDQpUaGFua3MsDQpLdW1hci4NCg0KRnJv
bTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpTZW50OiBGcmlkYXksIE5vdmVt
YmVyIDIyLCAyMDE5IDEyOjE0IEFNDQpUbzogS3VtYXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0Bo
Y2wuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogRmFuIHNwZWVk
IGNvbnRyb2xsZXIgdmFsaWRhdGlvbg0KDQpLdW1hciwNCklmIHlvdSBhcmUgdXNpbmcgZW50aXR5
IG1hbmFnZXIsIHRoZW4geW91IHNob3VsZCBoYXZlIGVudHJ5IGZvciBmYW4gc3BlZWQgY29udHJv
bGxlciB0YWJsZSBpbiBlbnRpdHkgbWFuYWdlciBqc29uIGZpbGUuIFRoZW4geW91IG5lZWQgdG8g
cnVuIHN3YW1wZC4gT25jZSBzd2FtcGQgaXMgcnVubmluZyB0aGVuIHlvdSBjYW4gY2hhbmdlIHRl
bXBlcmF0dXJlIHZhbHVlcyB2aWEgZGJ1cyBpbnRlcmZhY2UgYW5kIHNlZSBpZiBmYW4gc3BlZWRz
IGFyZSBjaGFuZ2luZy4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206IG9wZW5ibWMgPG9wZW5i
bWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3Bl
bmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPj4gb24gYmVo
YWxmIG9mIEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbTxtYWlsdG86dGhhbmdh
dmVsLmtAaGNsLmNvbT4+DQpEYXRlOiBTdW5kYXksIE5vdmVtYmVyIDE3LCAyMDE5IGF0IDc6NDQg
UE0NClRvOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc+IiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+Pg0KU3ViamVjdDogRmFuIHNwZWVkIGNvbnRyb2xsZXIgdmFsaWRhdGlvbg0K
DQpIaSBBbGwsDQoNCk91ciBwcm9kdWN0IGhhdmUgSW5sZXQgdGVtcGVyYXR1cmUgc2Vuc29yIGFu
ZCAgdHdvIEZhbiB3aXRoIFRBQ0hPIHNlbnNvciBmZWVkYmFjayBjb25uZWN0ZWQgdGhyb3VnaCBG
YW4gc3BlZWQgY29udHJvbGxlciB0byBCTUMgU29DLg0KV2UgY2FuIGFibGUgdG8gcmVhZCB0ZW1w
ZXJhdHVyZSBzZW5zb3IgYW5kIGNvbnRyb2wgdGhlIEZhbiAoUFdNKSB0aHJvdWdoIEQtQnVzIGlu
dGVyZmFjZS4NCkFsbCBwcm9kdWN0IHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gZGVjbGFyZWQgYXMg
SlNPTiBjb25maWd1cmF0aW9uIGZpbGUgaW4gRW50aXR5LU1hbmFnZXIgLg0KV2hhdCBpcyB0aGUg
cHJvY2VkdXJlIHRvICB0ZXN0ICBGYW4gU3BlZWQgQ29udHJvbGxlcihGU0MpICBiYXNlZCBvbiBT
VEVQIGFuZCBQSUQgYmFzZWQgYWxnb3JpdGhtLg0KDQpQbGVhc2UgZmluZCB0aGUgYXR0YWNoZWQg
RmFuU2Vuc29yIGRidXMgbG9ncyBmb3IgeW91ciByZWZlcmVuY2UuDQoNClRoYW5rcywNCkt1bWFy
Lg0KDQoNCg0KDQoNCg0KDQoNCjo6RElTQ0xBSU1FUjo6DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KVGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVu
dChzKSBhcmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVu
dChzKSBvbmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNl
Y3VyZSBvciBlcnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBj
b3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3Ig
bWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBj
b250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3Jl
IG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRz
IGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlz
IGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3Nh
cmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0
ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlz
Y2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24g
b2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRo
b3JpemVkIHJlcHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5k
IG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwg
YW5kL29yIGF0dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3Ro
ZXIgZGVmZWN0cy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=

--_000_876B41308EA04CF4BA98A884AD5D3B35fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B0188B11CD0C384B81A31CBA2628D900@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPCEtLVtp
ZiAhbXNvXT48c3R5bGU+dlw6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kb1w6KiB7
YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kd1w6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0
I1ZNTCk7fQ0KLnNoYXBlIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQo8L3N0eWxlPjwh
W2VuZGlmXS0tPjxzdHlsZT48IS0tDQovKiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYg
MyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIg
MTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1h
bCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJbWFyZ2luLWJv
dHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmki
LHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJp
b3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30N
CmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28tc3R5bGUtcHJpb3Jp
dHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAu
bXNvbm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5h
bWU6bXNvbm9ybWFsOw0KCW1hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZv
bnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bh
bi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1pbHk6
IlRpbWVzIE5ldyBSb21hbiIsc2VyaWY7DQoJY29sb3I6YmxhY2s7fQ0Kc3Bhbi5FbWFpbFN0eWxl
MTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQpzcGFuLkVtYWlsU3R5bGUyMA0KCXttc28t
c3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsN
Cgljb2xvcjp3aW5kb3d0ZXh0O30NCnNwYW4uRW1haWxTdHlsZTIxDQoJe21zby1zdHlsZS10eXBl
OnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNv
bG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0
LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4
LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3Jk
U2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBt
c28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYi
IC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBl
bGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0K
PC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0i
RU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBLdW1hciw8bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkl0IGlzIHNhbWUgZm9yIGFsbCBwbGF0Zm9ybXMuIERvIHlv
dSBzZWUgc3dhbXBkIHJ1bm5pbmcgaW4geW91ciBwbGF0Zm9ybS4gSWYgaXQgaXMgcnVubmluZyB0
aGVuIHlvdSBjYW4gY2hhbmdlIHlvdXIgdGVtcGVyYXR1cmUgdmFsdWUgYmV5b25nIGFueSBvZiBs
aW1pdCBwcm92aWRlZCBpbiBmYW4gdGFibGUgYW5kIGZhbiBzcGVlZCBzaG91bGQgY2hhbmdlIHRv
IHRoZSBtZW50aW9uIHZhbHVlcyBpbiB0YWJsZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UmVn
YXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LVZpamF5IDxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2
IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGlu
ZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+S3VtYXIgVGhhbmdhdmVsICZsdDt0
aGFuZ2F2ZWwua0BoY2wuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5UaHVyc2RheSwgTm92ZW1i
ZXIgMjgsIDIwMTkgYXQgNDozNyBBTTxicj4NCjxiPlRvOiA8L2I+VmlqYXkgS2hlbWthICZsdDt2
aWpheWtoZW1rYUBmYi5jb20mZ3Q7LCAmcXVvdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmcXVv
dDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+
UkU6IEZhbiBzcGVlZCBjb250cm9sbGVyIHZhbGlkYXRpb248bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgVmlqYXksPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlRoYW5rcyBmb3IgeW91ciByZXNwb25zZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+V2UgYXJlIHVzaW5nIGVudGl0eS1tYW5hZ2VyIGZvciBmYW4gc3BlZWQgY29udHJvbGxlci4g
U28gd2UgaGF2ZSBlbnRyeSBmb3IgZmFuIHNwZWVkIGNvbnRyb2xsZXIgaW4ganNvbiBmaWxlLjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BcyB5b3Ugc3VnZ2VzdGVkLCB3ZSBjb3VsZCBhYmxlIHRv
IHNlZSBzb21lIHB3bSBhbmQgZmFuIHNwZWVkIHZhbHVlcyBhcmUgY2hhbmdpbmcgaWYgd2UgdXBk
YXRlIHRoZSB0ZW1wZXJhdHVyZSB2YWx1ZXMgd2hpbGUgc3dhbXBkIGlzIHJ1bm5pbmcgaW4gVFAu
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkluIFlWMiwgdGhlIHB3bSB2YWx1ZXMgYXJlIG5vdCB1
cGRhdGluZyBwcm9wZXJseSBpZiB0ZW1wZXJhdHVyZSB1cGRhdGVzLg0KPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlBsZWFzZSBmaW5kIHRoZSBhdHRhY2hlZCBkb2N1bWVudHMmbmJzcDsgZm9yIHRl
bXBlcmF0dXJlcyBhbmQgcHdtIHZhbHVlcyBvZiBUUCBhbmQgWVYyLjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5BcyBvZiBub3csIHdlIGFyZSB1c2luZyBzYW1lIFRQIHNwZWVkIGNvbnRyb2xsZXIg
dGFibGUgZW50cmllcyBmb3IgWVYyLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Db3VsZCB5b3Ug
cGxlYXNlIGxldCB1cyBrbm93IHRoZSBwcm9jZWR1cmUgZm9yIGZhbiBzcGVlZCB2YWxpZGF0aW9u
LjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MsPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5LdW1hci48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2Jv
cmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxhIG5hbWU9Il9fX19fcmVwbHlzZXBhcmF0b3IiPjwvYT48
Yj5Gcm9tOjwvYj4gVmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7DQo8YnI+
DQo8Yj5TZW50OjwvYj4gRnJpZGF5LCBOb3ZlbWJlciAyMiwgMjAxOSAxMjoxNCBBTTxicj4NCjxi
PlRvOjwvYj4gS3VtYXIgVGhhbmdhdmVsICZsdDt0aGFuZ2F2ZWwua0BoY2wuY29tJmd0Ozsgb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBGYW4gc3BlZWQg
Y29udHJvbGxlciB2YWxpZGF0aW9uPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5LdW1hciw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPklmIHlvdSBh
cmUgdXNpbmcgZW50aXR5IG1hbmFnZXIsIHRoZW4geW91IHNob3VsZCBoYXZlIGVudHJ5IGZvciBm
YW4gc3BlZWQgY29udHJvbGxlciB0YWJsZSBpbiBlbnRpdHkgbWFuYWdlciBqc29uIGZpbGUuIFRo
ZW4geW91IG5lZWQgdG8gcnVuIHN3YW1wZC4gT25jZSBzd2FtcGQgaXMgcnVubmluZyB0aGVuIHlv
dSBjYW4gY2hhbmdlIHRlbXBlcmF0dXJlIHZhbHVlcyB2aWEgZGJ1cyBpbnRlcmZhY2UgYW5kIHNl
ZQ0KIGlmIGZhbiBzcGVlZHMgYXJlIGNoYW5naW5nLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5S
ZWdhcmRzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tVmlqYXk8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRp
diBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRp
bmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPm9wZW5ibWMgJmx0Ozwvc3Bhbj48
YSBocmVmPSJtYWlsdG86b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQiPm9wZW5ibWMtYm91
bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc8L3NwYW4+PC9hPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7DQogb24gYmVoYWxm
IG9mIEt1bWFyIFRoYW5nYXZlbCAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzp0aGFuZ2F2ZWwu
a0BoY2wuY29tIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+dGhhbmdhdmVsLmtAaGNs
LmNvbTwvc3Bhbj48L2E+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2si
PiZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+U3VuZGF5LCBOb3ZlbWJlciAxNywgMjAxOSBhdCA3OjQ0
IFBNPGJyPg0KPGI+VG86IDwvYj4mcXVvdDs8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQiPm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzwvc3Bhbj48L2E+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7
Y29sb3I6YmxhY2siPiZxdW90OyAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmciPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5vcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc8L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2Nv
bG9yOmJsYWNrIj4mZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPkZhbiBzcGVlZCBjb250cm9sbGVy
IHZhbGlkYXRpb248L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkhpIEFs
bCw8L3NwYW4+PG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOzwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJ0ZXh0LWluZGVudDouNWlu
Ij5PdXIgcHJvZHVjdCBoYXZlIElubGV0IHRlbXBlcmF0dXJlIHNlbnNvciBhbmQgJm5ic3A7dHdv
IEZhbiB3aXRoIFRBQ0hPIHNlbnNvciBmZWVkYmFjayBjb25uZWN0ZWQgdGhyb3VnaCBGYW4gc3Bl
ZWQgY29udHJvbGxlciB0byBCTUMgU29DLg0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5XZSBjYW4gYWJsZSB0byByZWFkIHRlbXBlcmF0dXJlIHNlbnNvciBhbmQgY29udHJv
bCB0aGUgRmFuIChQV00pIHRocm91Z2ggRC1CdXMgaW50ZXJmYWNlLjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+QWxsIHByb2R1Y3Qgc3BlY2lmaWMgY29uZmlndXJhdGlvbiBk
ZWNsYXJlZCBhcyBKU09OIGNvbmZpZ3VyYXRpb24gZmlsZSBpbiBFbnRpdHktTWFuYWdlciAuDQo8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldoYXQgaXMgdGhlIHByb2NlZHVy
ZSB0byAmbmJzcDt0ZXN0ICZuYnNwO0ZhbiBTcGVlZCBDb250cm9sbGVyKEZTQykgJm5ic3A7YmFz
ZWQgb24gU1RFUCBhbmQgUElEIGJhc2VkIGFsZ29yaXRobS48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNr
Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+UGxlYXNlIGZpbmQgdGhlIGF0
dGFjaGVkIEZhblNlbnNvciBkYnVzIGxvZ3MgZm9yIHlvdXIgcmVmZXJlbmNlLjwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
VGhhbmtzLDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5LdW1hci48L3NwYW4+PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOzwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IDwvc3Bhbj4NCjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOzwvc3Bhbj48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIu
MHB0O2NvbG9yOmJsYWNrIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgPC9zcGFuPg0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7PC9z
cGFuPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOzwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZTo3LjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlm
O2NvbG9yOmdyYXkiPjo6RElTQ0xBSU1FUjo6PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPGRpdiBj
bGFzcz0iTXNvTm9ybWFsIiBhbGlnbj0iY2VudGVyIiBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXIi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6Ny41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVv
dDssc2Fucy1zZXJpZjtjb2xvcjpncmF5Ij4NCjxociBzaXplPSIxIiB3aWR0aD0iMTAwJSIgYWxp
Z249ImNlbnRlciI+DQo8L3NwYW4+PC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjcuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6Z3JheSI+VGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0
YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJl
Y2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRv
IGJlIHNlY3VyZQ0KIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJj
ZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBs
ZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBh
bmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0
aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZQ0KIG9yaWdpbmF0b3Igb3Ig
SENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50
ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5kIG1heSBu
b3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmlld3Mgb3Igb3BpbmlvbnMgb2YgSENMIG9yIGl0
cyBhZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXByb2R1Y3Rpb24sIGRpc3NlbWluYXRpb24sIGNv
cHlpbmcsIGRpc2Nsb3N1cmUsDQogbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3Ig
cHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29u
c2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBk
ZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUNCiBvcGVu
aW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2
aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxkaXYgY2xh
c3M9Ik1zb05vcm1hbCIgYWxpZ249ImNlbnRlciIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjcuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7
LHNhbnMtc2VyaWY7Y29sb3I6Z3JheSI+DQo8aHIgc2l6ZT0iMSIgd2lkdGg9IjEwMCUiIGFsaWdu
PSJjZW50ZXIiPg0KPC9zcGFuPjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_876B41308EA04CF4BA98A884AD5D3B35fbcom_--
