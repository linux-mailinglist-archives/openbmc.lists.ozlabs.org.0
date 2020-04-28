Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307D1BC759
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 19:59:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BTtx49r1zDqNH
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 03:59:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2387508ca5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=mI2kYiLW; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PJjB8Fvc; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BTsg5GHnzDq63
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 03:58:38 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SHur90001919; Tue, 28 Apr 2020 10:58:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uIiSe5gF+uKKFNjfW5rQThFSrgJyN0t2uT3eQ0d2Ixc=;
 b=mI2kYiLWnY1LbRdtAsQ+tQs7likxK9rglHWAmYQz4fCmm4MCD0Jr+JGPnaySURrXX0+V
 mARE9dyRD4v+YOqTbDa8ZCYVCw8RzSR4nnoVRdLQCM0jOPBHsmdJNuepAtdz4uvA20fY
 nAAqwBGrsPnw29Z4RBFOVqFnV4mjtJ2keHw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30n57q8kfn-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Apr 2020 10:58:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 28 Apr 2020 10:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeKqeNZwNRUFDviPViMkZ47vWE4lHbDEzDbR97hyVYsJqIiv8D7D3fOEznOYVJLHKF+c4R+YU+S+yy2WSsoMYFPpll6Kkg3xaBJ9vMhteZ3yW7y61fyEd4SyUqkUtp+3BQ9btfO35fY3ZooUMVKCNaDr227ZHCd0LYYCGAK6/8cYqt3Pw6TPSXfae4bU5oToYuiD91FU+NMi9Eysm+Q5WeUUFAK5x0nzY3g+pIgCs1BMjH+kWo5tqV4WguRRTAQLtcDs0YdnXATjx0HMihvIzDBlRn1boAjWjh7sX28vG+2DOoraBY35neX/DvZZ9K4lc37KR5z7KBej3NQui/mtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIiSe5gF+uKKFNjfW5rQThFSrgJyN0t2uT3eQ0d2Ixc=;
 b=VqCxxsUiKk+1i2zpxg1ZO1vJnxZkuzeKlizlLViiIb5JPVeXlWEgPabRN8OSyAD0qg5T6dTpI/KyqB4NeqJeWSBixsFakquNMyhhGlKyVF4wa2Ex5jfHCCTdB+Y/KK9bBMJ5JkwY/KxMBEW2ZwSElY2UiLg40TGwUjMOWp0itzWyXD2t1Q05pgxY75SFOSSLP1lLnOeMc51e65/zY5af3IEt0M4sTi7fBQtc0miWB+k6xyfmnyNlhrhs6m4PBj3elUtbg69H+IpqL5Pxfl/nzujqIIOQhSDAcElI+Gan6VvFEQ3xMJom4SESmBvS34JAufeeFW/4KqpF8Tih/3E4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIiSe5gF+uKKFNjfW5rQThFSrgJyN0t2uT3eQ0d2Ixc=;
 b=PJjB8FvcsME/wg3mAYXbJRNAhwXYuPdh3fHhTsWYS/JzhM/1SNQvYq/lNGa+pd+J3YmHTEJsYJ7t3ULp+yUkf34y63J/D3m7GuERDp0nx2JOKmtajXB5SQDDGAVUjkD7LDAGs2oU7nwk1pl3RGdQICoijYMQmbYOghF4Ky/Lkj0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3062.namprd15.prod.outlook.com (2603:10b6:a03:fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 17:57:58 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 17:57:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Matt Spinler <mspinler@linux.ibm.com>, =?utf-8?B?5byg6buO5piO?=
 <lemon_zhang555@163.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Power monitoring and management
Thread-Topic: Power monitoring and management
Thread-Index: AQHWHTigR/p5dhVvMUykt3HtRbUHuqiOg7uA///Zk4A=
Date: Tue, 28 Apr 2020 17:57:58 +0000
Message-ID: <0BC262D7-868F-497A-8D04-2832136D554C@fb.com>
References: <53d78955.715a.171bfe1da3d.Coremail.lemon_zhang555@163.com>
 <2a63ff3f-c4f7-e455-7428-4db7e28f40d1@linux.ibm.com>
In-Reply-To: <2a63ff3f-c4f7-e455-7428-4db7e28f40d1@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:1ca7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 024f8330-a786-4464-76ef-08d7eb9dafc0
x-ms-traffictypediagnostic: BYAPR15MB3062:
x-microsoft-antispam-prvs: <BYAPR15MB3062C3279C6A2533C74BA8D3DDAC0@BYAPR15MB3062.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(66446008)(66476007)(66556008)(64756008)(186003)(2906002)(76116006)(91956017)(66946007)(5660300002)(110136005)(316002)(8936002)(6512007)(6486002)(8676002)(71200400001)(6506007)(53546011)(3480700007)(86362001)(33656002)(36756003)(966005)(2616005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8BTleTsnHLN25Z8Ej0Pl6kOLSi9QyTrxN2zNO0lS92X77Acv4SmUWNNz/SHkgMxC6GCdDac3dhk604j+dW7esCnHELHXS8UszTDr+qcjRITWFlKaugoVaJm8ixFCdvHGNqUTpmms2a/HX5ClBqdmwsA6D8AHlqVm0Rl2jSR6F0MiQyWvelzytM0q2cD8YQOL5yicE/9WwMC3PLdNY7IuGfyJwgNn2obL9PdkA/zdUa5iHeEiMISTfYseHo+B4z71EVt7/MxIA2tR1ELU0PSLeUuBnkA486xs+eyWrDqbuxDDsM4nza/RVHC6oRBnIPK9BkNG7Q4vJe5t2Dkl3qpGJsqvD+mGgZEqpRG4bJlnR8ICiU9dBv4ws8tO7Pmaf/+i+ifyFg43k4D1YsSs3LHt3hYG1HmpRoNiWOVJFODY8ND/C3nnd1jocLkb2477BLl7ZG+eOyqL2haiit850fsUg4KgTtl0oioxzXI8f/M28aNiU9d410nHR/ND2ugBVxAdSoTgFDkvjcsVvM/piIWjXQ==
x-ms-exchange-antispam-messagedata: IUT4vOJRbqdA/vjHotOSVzWi2SBM5i3IPQRaWFm8k8lpOKuYJsYQ6S2ZssafJC2zyewGjMTdBmuPIIwHMPaRt/BPJRIQPJ2S2nMCLfmIHVPAnCDMEPnapDsWWZT187yZMutR8hQxiWstsXRmGufGX2kQIowiqvsxoWwcNLq4R1JfqN1TcdwkeRlOv0P3hfJF9JBU8qbZ96kY3c34W4QWI4Oc78edX5yQ73608tlQW0SQBtHNVBUOwLWglW8BQmOpYNZicZ+d18xhMhrnWRq06neSeCFdje4E4q2+AZmvi9oQCMavOhACTFTTjS+HYOKHnm5p6KMiYJauUGcd++AE1m+IBEl6YYox1VLwj3sJP2uKKSjyDM+K0yPeP+pkmKfiHwr0WxFzSvrdEoGeJAJDsx//14PE2ScYt/QXI9gJAzhofkBu8G02Oij6NthdENTf7NL1F39u+3/iDxrHdLvK5n1IPXRX9PRwxg6S3Ddfckx19rfr2UPcPUDgYi2z+Lcp8Vwpo7X2trX/FoP+U0iHy4Zqg8PbK8O6btJ+kgwyFpxQ5ALPlfrOZO0Gbc/iAQf8Eg56fo6j0pUvEFV3SXLg5lCO25XPpoKzJS1yqdMARyJ9M1b9kfUg14l3EbRr+zivsgJq4HHnyL6BEqVyTmnziPy/p6ak7tkdg93yuzCV3Z40saSsU4MnHYrfYNswL1gNjLKFDBmlMuKxz6ckn7Pj8EQMFfuBm1g3pHtBqQtUqBWGJKusOuySux7qI0p98MMthH3edNWHbuq/dGiSdJpP8M9NpG/z1or3SCn/VW8ib0gvJbY/xXGyVs/C1It1VihN/tHSzfHRn9oMaFBwwOeM4g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B343D77F84DB6499F40769A8FA833FC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 024f8330-a786-4464-76ef-08d7eb9dafc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 17:57:58.6134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCc+6gxzGBRxwv/g8DvCg12KNUbDdaC3IcGcebpxWfVYlw/oNYHI7uctYE6n6v+b+EaXOAfHG/Ftg1BX5HLbRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3062
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_12:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280143
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

DQoNCu+7v09uIDQvMjgvMjAsIDY6MTcgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBNYXR0IFNw
aW5sZXIiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIG1zcGlubGVyQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KDQogICAgDQog
ICAgDQogICAgT24gNC8yOC8yMDIwIDM6MjMgQU0sIOW8oOm7juaYjiB3cm90ZToNCiAgICA+IGhl
bGxvLA0KICAgID4gV2UgaGF2ZSBhIGZ1bmN0aW9uYWwgcmVxdWlyZW1lbnQgLSB0aGUgQVNUMjQw
MCBzZW5kcyBhIFBXUl9PTiBwaW4gZG93biANCiAgICA+IHNpZ25hbCBmb3IgMTAwIG1zIHRvIENQ
TEQgdG8gcmVxdWVzdCB0aGF0IHRoZSBzZXJ2ZXIgcG93ZXIgb24uIFRoZSANCiAgICA+IENQTEQg
Y2hhbmdlIFBHT09EIHBpbiB1cCBhbmQgcG93ZXJzIG9uIHRoZSBzeXN0ZW0uIElmIHRoZSBDUExE
IA0KICAgID4gcmVjZWl2ZXMgYSBjb250aW51b3VzIFBXUl9PTiBwaW4gZG93biBzaWduYWwgZm9y
IDQgcywgaXQgd2lsbCANCiAgICA+IGltbWVkaWF0ZWx5IHNodXQgZG93biB0aGUgc2VydmVyIGFu
ZCBjaGFuZ2UgUEdPT0QgcGluIGRvd24uIFdlIGNoYW5nZWQgDQogICAgPiB0aGUgIlBHT09EIuOA
gSJQT1dFUl9QSU4iIHBpbiBkZWZpbml0aW9uIGluIA0KICAgID4gL2V0Yy9kZWZhdWx0L29ibWMv
Z3Bpby9ncGlvX2RlZnMuanNvbiBmaWxlLCBidXQgaXQgZG9lcyBub3Qgd29yay53aGVyZSANCiAg
ICA+IHNob3VsZCB3ZSBjaGFuZ2UgdGhlIGRlZmluaXRpb24gb2YgdGhlc2UgcGlucyB0byBtYWtl
IGl0IG1lZXQgb3VyIA0KICAgID4gbmVlZHMsIGFuZCBob3cgdG8gYWRkIGEgZGVsYXkgZm9yIFBX
Ul9PTiBwaW4uDQogICAgDQogICAgVGhlICBjb2RlIHRoYXQgaGFuZGxlcyBncGlvX2RlZnMuanNv
biBpcyANCiAgICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9za2VsZXRvbi90cmVlL21hc3Rl
ci9vcC1wd3JjdGwsIHRob3VnaCBJIA0KICAgIGJlbGlldmUgdGhlcmUgaXMgYW4gYWx0ZXJuYXRl
IHZlcnNpb24gdGhhdCB1c2VzIGVudGl0eSBtYW5hZ2VyIHRvIGdldCANCiAgICB0aGUgR1BJTyBk
ZWZpbml0aW9ucyBzb21ld2hlcmUgZWxzZS4gIFlvdSBzaG91bGQgYmUgYWJsZSB0byBtb2RpZnkg
dGhhdCANCiAgICBhcyBuZWNlc3NhcnkgdG8gbWVldCB5b3VyIG5lZWRzLg0KDQpXZSBoYXZlIHg4
Ni1wb3dlci1jb250cm9sIHdoaWNoIG1vbml0b3JzIHRoZXNlIEdQSU9zIGFuZCB0YWtlIGFwcHJv
cHJpYXRlIGFjdGlvbnMuDQpZb3UgbmVlZCB0byBkZWZpbmUgdGhlc2UgR1BJT3MgaW4gZHRzIGZp
bGUgZm9yIHBpbiBtYXBpbmcgdG8gR1BJTyBsaW5lIG5hbWUuDQogICAgDQogICAgDQogICAgDQog
ICAgPiBSZWdhcmRzLA0KICAgID4gR2FybmV0DQogICAgDQogICAgDQoNCg==
