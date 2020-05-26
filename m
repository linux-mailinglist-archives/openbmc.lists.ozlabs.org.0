Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4F1E2A4D
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 20:54:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WjmT5qbwzDqPS
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:54:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=24151d482d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Ea7aUnXp; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ezYh0N7q; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WjlY0gVmzDqCD
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 04:53:11 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QIjCJY012840; Tue, 26 May 2020 11:53:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=fHVFRK26Xy5CJ5IYwlz0/+o/woYt2PQ1rEtwlWyvCWs=;
 b=Ea7aUnXp12O0/FWfQ6eIf18oG04biGpst+NwI4dHBWbzVqGNl6apE71lW7qRDwQKUXLr
 9jl/PTausjHplw2gDhip5iGAOfj6wWtp6290gBZIzxRDaJ5BXCA0jHUKyGQl5W/Yjg1y
 q/nmcCSCRvyZmD/S1nzZq7MT9vbNXDuiewU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3171jpk22v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 May 2020 11:53:06 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 26 May 2020 11:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoe/1xf5T6e/2quu8ZpkxJ9SW53cna+S9QBRbe+twjcyRvjk86py1in+WfF6AG8n5xVjvsIc7k3/2xj0mzRwDUhYVOF7wbwTTpd+XUhEoJxfGwN+K574eYVa59+0N/Ni7PUaelvoZWHFJ+0/fk022QR2D8umjqpHCbSKOPX68tvKIw65dPKKx6Y8h789vF21pxKz160MA+5luL2QjyDGyq6bHX8xtRx8jRvEKD6+fc1m8k7QVSAYdYmKYe2URuj4xw34oSqjqZ8m3gGiv+lizICIBzzStlSEALigafzQYR9lW3v/ULezbPzo/D5exD1eqyBN3YY2wTALyilBhLGo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHVFRK26Xy5CJ5IYwlz0/+o/woYt2PQ1rEtwlWyvCWs=;
 b=DYHSWMbHYJ+2fvFRh7mrM12Dnm7a/DxkJW1ivpH76wMiYvct/YkRLj4ctN1PjoIbVKo6FgvP4Z55PNqNM0UtW8BMfU9waCESsQQuEYQ4pZtNH1x8wWWeHVMJS00cteK+6SehWL26syesfMKghd6EuQ8p6Yf4l3WnO9g3ge30bm4cdmx09e0zjjpd/RFcJX26Ii6c/fpjBaH0qM3rQBJlRsk+gkSaKODQREvlk3gPLWalfAIeuQWXPWvKvjWHr7bqxOBYZi3Qu6LyIhzSUW6NcH+X80VWRclEnZwZRR1a46G/OnnCzepCy8MatH3sqt44md5ZzpMFfTmKir/z4lC9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHVFRK26Xy5CJ5IYwlz0/+o/woYt2PQ1rEtwlWyvCWs=;
 b=ezYh0N7qS3uC66BB6Uq5WbZUVaKddlMmcEpUhgJC/+kl1jr2EgRvO/qVyACyLd6zhcxYYDzs2vACuks1KAOnMbtkC4DdqII3uS5a90wv0DHg5+ABs3pOCU3izkCbw28Co2b+xhfIsiannmVL5lv3ALXigOzfYHMyC9z1jgIR+6w=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2360.namprd15.prod.outlook.com (2603:10b6:a02:81::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 18:53:04 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:53:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: =?utf-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "uperic@163.com" <uperic@163.com>
Subject: Re: About FRU
Thread-Topic: About FRU
Thread-Index: AQHWMphk/W/HEhL68Em0gcVDMnsrwKi6QzuA
Date: Tue, 26 May 2020 18:53:04 +0000
Message-ID: <5822570C-9A4D-4441-AF69-4BC1149FAC71@fb.com>
References: <HK2PR04MB38261243DC62EC7BB7003ABAFEB30@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB38261243DC62EC7BB7003ABAFEB30@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 129d86bb-28a9-466f-2c4b-08d801a60589
x-ms-traffictypediagnostic: BYAPR15MB2360:
x-microsoft-antispam-prvs: <BYAPR15MB236009EC19F92711B76032BFDDB00@BYAPR15MB2360.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SliyT8hgctyA3PIXKD5XVw2zjFBRNMD6/oWExVebzNZa0OesnzOc15Teyt63i0SlPl0E5nvNTztIrJNXhnQbQOxfGrG99poZmrH4kQJv8fxDLL+A32Sx/UPg7bLJuRxui95c0txyq/lQ4sJuV1or12p+5iSFJhefyIVYEG5+MXZE4FQRyoES+EeTdosJProQU3Zu0Zvcqz7QqR6zjvvU0pAye2w6YjgrnwZupCBI89BLH3JrI34maOxQl0ZTIjspe2Bm7vWec9J78h7WsdtN8h4M0tws+6pv1f8xOsHWnmHYMJl/h8K+8jfAkz+0q7397yeR3Hx6Wl0PdrrnjYT2SA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(346002)(136003)(376002)(396003)(6512007)(36756003)(76116006)(66946007)(71200400001)(110136005)(8676002)(316002)(66446008)(64756008)(66556008)(8936002)(66476007)(2906002)(478600001)(9326002)(33656002)(2616005)(6486002)(86362001)(7116003)(5660300002)(3480700007)(6506007)(45080400002)(186003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pQ/k/l4/1b/Y3lZA8FIiSidUrWL0Xq4gJ8i4bO/ke5lo9iO5NsszemansxZFybZQxDdmLCTkgI0E/vTcXSeWJDVO1e01QIJIl3VFIgqYBDxkU/ljdsDQg3HFzHObMAMR5yA5HZeSAYJH1U8GQuJcr1xhg5jdSSaKgrxnt+ObpnNwJk+N9fBDIHpcPFI+lewi7JQT34IMbD9ZkkSoeGaosVYKEQwmWPf3GihCgNN1qW0TJDdWLTJB138Be4f/WExDUqAPxngvQ9r/tmQTQQ1TLeQxESH31I/OX5Jeo+A5xcrKdY/msdWCDDQIIK6dLPk5DBgsNtgcIOhw1hhPs9aL7mvqzaqysgD7mb4Q9kKp76ca9UN2n6bWzLkLVKWhjMl/m/dNb9AYn7gNpahTnJ9ltvwkNUQAKL12cPC7jysQgEHmgkTy6uki4SFaJdmXx7SqgmtyirnrWY0uKfWAiOjPXSTJfTLLZfwzeVhoQ+DtKz4774QN2LZyNyRfQKLArUovvOhhJ7vO+OJXVpboKZNCNKhtt9zsqpzeKQTniIIyfMXmAVUNfCzNdCkluu/4x9+5
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_5822570C9A4D4441AF694BC1149FAC71fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 129d86bb-28a9-466f-2c4b-08d801a60589
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 18:53:04.1500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVzUnRyA51wkEStrxhZDJ4hlzeW8MtCi5B/7AjeUZ1GXIN3qU055PLrEFjmw21KwoFvD4zZRvY3BIV6r13MKZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2360
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxscore=0 clxscore=1031 impostorscore=0 mlxlogscore=999
 cotscore=-2147483648 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260145
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

--_000_5822570C9A4D4441AF694BC1149FAC71fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSGFybGV5LA0KV2hhdCBhcHByb2FjaCB5b3UgYXJlIHVzaW5nIHRvIHJlYWQgRlJVIGFzIHRo
ZXJlIGFyZSBjb3VwbGUgb2YgZnJ1IGltcGxlbWVudGF0aW9uICBsaWtlIHBob3NwaG9yLWZydSBh
bmQgZW50aXR5IG1hbmFnZXIgYXBwcm9hY2guIE9uY2UgeW91IGhhdmUgZnJ1IHJlYWRpbmcgdmlh
IGFueSBvZiB0aGVzZSBhcHBsaWNhdGlvbiB0aGVuIG9ubHkgaXBtaSB0b29sIHdpbGwgYmUgYWJs
ZSB0byByZWFkIGFuZCBwcmludC4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206IG9wZW5ibWMg
PG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZz4gb24g
YmVoYWxmIG9mIOWRqCDov5zmuIUgPHpob3V5dWFucWluZzhAb3V0bG9vay5jb20+DQpEYXRlOiBN
b25kYXksIE1heSAyNSwgMjAyMCBhdCA2OjMxIEFNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPiwgInVwZXJpY0AxNjMuY29tIiA8dXBlcmljQDE2My5jb20+
DQpTdWJqZWN0OiBBYm91dCBGUlUNCg0KDQpIZWxsbyBldmVyeW9uZSwNCg0KICAgICAgIE15IG1v
dGhlcmJvYXJkIGhhcyBhbiBFRVBST00gZGV2aWNlIHRvIHN0b3JlIEZSVSByZWxhdGVkIGluZm9y
bWF0aW9uLiBIb3cgY2FuIEkgY29uZmlndXJlIGl0IGluIHRoZSBvcGVuYm1jIGNvbmZpZ3VyYXRp
b24gZmlsZSB0byBzZWUgdGhpcyBGUlUgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgaXBtaXRvb2wg
ZnJ1IHByaW50IGNvbW1hbmQ/DQoNCkFyZSB0aGVyZSBzb21lIGV4YW1wbGVzIHRvIHByb3ZpZGUg
cmVmZXJlbmNlLCBJIGRpZCBub3QgZmluZCBhIHBsYWNlIHRvIGNvbmZpZ3VyZSB0aGUgZWVwcm9t
IGRldmljZSBpbiB0aGUgb3BlbmJtYyBwcm9qZWN0Pw0KDQpJcyB0aGVyZSBhbnkgZG9jdW1lbnRh
dGlvbiBhYm91dCBGUlUgaW5kaWNhdGluZyB0aGF0IHRoZSBtb2R1bGUgcmVhZHMgYW5kIHBhcnNl
cyBpbmZvcm1hdGlvbiBmcm9tIGVlcHJvbSwgYW5kIHRoZW4gaXQgY2FuIGJlIHJlYWQgYnkgdGhl
IGlwbWl0b29sIGZydSBwcmludCBjb21tYW5kPyBXaGF0IGlzIHRoZSBwcm9jZXNzIGxpa2U/DQoN
ClRoYW5rcw0KSGFybGV5DQoNCg==

--_000_5822570C9A4D4441AF694BC1149FAC71fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <EB94013892384548B938A9A8F975F4C5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiTVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4
IDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1pbmdMaVU7DQoJcGFub3NlLTE6MiAy
IDUgOSAwIDAgMCAwIDAgMDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1h
dGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250
LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250
LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxATVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3
IDIgNSA4IDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQE1pbmdMaVUiOw0KCXBh
bm9zZS0xOjIgMSA2IDkgMCAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAu
TXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCglt
YXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToi
Q2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlw
ZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6
OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29y
ZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8
Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBj
bGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIEhhcmxleSw8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldoYXQgYXBwcm9hY2ggeW91IGFyZSB1
c2luZyB0byByZWFkIEZSVSBhcyB0aGVyZSBhcmUgY291cGxlIG9mIGZydSBpbXBsZW1lbnRhdGlv
biZuYnNwOyBsaWtlIHBob3NwaG9yLWZydSBhbmQgZW50aXR5IG1hbmFnZXIgYXBwcm9hY2guIE9u
Y2UgeW91IGhhdmUgZnJ1IHJlYWRpbmcgdmlhIGFueSBvZiB0aGVzZSBhcHBsaWNhdGlvbiB0aGVu
IG9ubHkgaXBtaSB0b29sIHdpbGwgYmUgYWJsZSB0byByZWFkIGFuZCBwcmludC48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+LVZpamF5PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1
QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8
L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVu
Ym1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnJmd0OyBvbiBiZWhhbGYgb2YNCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtmb250LWZhbWlseTomcXVvdDtNUyBHb3RoaWMmcXVvdDs7Y29sb3I6YmxhY2siPuWRqDwv
c3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+DQo8L3NwYW4+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Zm9udC1mYW1pbHk6TWluZ0xpVTtjb2xvcjpi
bGFjayI+6L+cPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2ZvbnQtZmFtaWx5
OiZxdW90O01TIEdvdGhpYyZxdW90Oztjb2xvcjpibGFjayI+5riFPC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4gJmx0O3pob3V5dWFucWluZzhAb3V0bG9v
ay5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPk1vbmRheSwgTWF5IDI1LCAyMDIwIGF0IDY6MzEg
QU08YnI+DQo8Yj5UbzogPC9iPk9wZW5CTUMgTWFpbGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZyZndDssICZxdW90O3VwZXJpY0AxNjMuY29tJnF1b3Q7ICZsdDt1cGVyaWNAMTYzLmNv
bSZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+QWJvdXQgRlJVPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJiYWNrZ3Jv
dW5kOndoaXRlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+SGVs
bG8gZXZlcnlvbmUsPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9ImJhY2tncm91bmQ6d2hpdGUiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iYmFja2dyb3VuZDp3aGl0
ZSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO015IG1vdGhlcmJvYXJkIGhhcyBhbiBFRVBST00gZGV2aWNlIHRvIHN0
b3JlIEZSVSByZWxhdGVkIGluZm9ybWF0aW9uLiBIb3cgY2FuIEkgY29uZmlndXJlIGl0IGluIHRo
ZSBvcGVuYm1jIGNvbmZpZ3VyYXRpb24gZmlsZSB0byBzZWUgdGhpcyBGUlUgaW5mb3JtYXRpb24g
dGhyb3VnaA0KIHRoZSBpcG1pdG9vbCBmcnUgcHJpbnQgY29tbWFuZD8gPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJiYWNrZ3JvdW5kOndo
aXRlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9ImJhY2tncm91bmQ6d2hpdGUiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2Nv
bG9yOmJsYWNrIj5BcmUgdGhlcmUgc29tZSBleGFtcGxlcyB0byBwcm92aWRlIHJlZmVyZW5jZSwg
SSBkaWQgbm90IGZpbmQgYSBwbGFjZSB0byBjb25maWd1cmUgdGhlIGVlcHJvbSBkZXZpY2UgaW4g
dGhlIG9wZW5ibWMgcHJvamVjdD88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iYmFja2dyb3VuZDp3aGl0ZSI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImJhY2tncm91bmQ6d2hp
dGUiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5JcyB0aGVyZSBh
bnkgZG9jdW1lbnRhdGlvbiBhYm91dCBGUlUgaW5kaWNhdGluZyB0aGF0IHRoZSBtb2R1bGUgcmVh
ZHMgYW5kIHBhcnNlcyBpbmZvcm1hdGlvbiBmcm9tIGVlcHJvbSwgYW5kIHRoZW4gaXQgY2FuIGJl
IHJlYWQgYnkgdGhlIGlwbWl0b29sIGZydSBwcmludCBjb21tYW5kPyBXaGF0DQogaXMgdGhlIHBy
b2Nlc3MgbGlrZT88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIiBzdHlsZT0iYmFja2dyb3VuZDp3aGl0ZSI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwv
ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJiYWNrZ3JvdW5kOndoaXRl
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+VGhhbmtzPG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5
bGU9ImJhY2tncm91bmQ6d2hpdGUiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9y
OmJsYWNrIj5IYXJsZXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_5822570C9A4D4441AF694BC1149FAC71fbcom_--
