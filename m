Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EFB1CBA7D
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 00:15:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jl4h0MyZzDr9C
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 08:15:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2397cd1311=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=le8qBSv6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=J/Kx6Vb1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jl283ttdzDr9B
 for <openbmc@lists.ozlabs.org>; Sat,  9 May 2020 08:12:46 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 048LtM6Y020933; Fri, 8 May 2020 15:12:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5Swdke6SowPTuWenLRwDgSezitj7L1iEPMumauZVENE=;
 b=le8qBSv6EIXqxC9V4kDt3TQ9WKoDDuU6VLQi0UyBB3bnzJ350342vvjJiZJXIzyA1NRJ
 DB5Db+ZD4XK1ORUdLglNaJPwWbN7t/EIZ//QG5vsuZjQXwJecVEGHIbdWHL7Wvno2tY6
 isQJe0h17y+2UFvBzSjb1p8/0OGaYlUFpgM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30vtdxxb8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 May 2020 15:12:41 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 8 May 2020 15:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRLLKViozt8InN6gv/+wCm2ZtLZVSIVr9Y1UaENKyZFRowchFX5Fzxa5EUXU7WkfPnpRzxQw95xOrRDnN1doEFw5F6jeP5c2EFFavRc/4d8WfIChMJsPO65iDmz25O/rZ8MFyQuc6UEl8jRYQK6Afb5heU+Uii5A703vJa1TJRXIOTKMC9FaRIfA2hGWoVtDaVDJrLeHkmbSZC686r2hsDWP7zBXt9yxYhWbOIR9QPT++YlQSaf6zeOBsTfFLU8aqf3aICR/VH4i7y1995I0ugiD4ObLWxXtTdzy7NlRVn0U9o86PJQKU0jN4GpsXlUHpPSPSSFAPk8corxDLbnXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Swdke6SowPTuWenLRwDgSezitj7L1iEPMumauZVENE=;
 b=ccFTesMMisOEM5MoQLeTRn0Xje2IbCSh/TcHIboamoUcYkfG8hnqJfOJTOHe3DmtYfgZ54T9++jCZEs4l06YYLrJT356MhIn14lv4N9tMgTrb2x9vwUrk7bF0i1ioRGwCt+fd8yPInAh/E6taH0nmxYIBn+hX2OSJRwt0Ypp3x6IWB1Jzw2WzB+b3NTSHcVzJUNBoIms09Zg0r4yPQEqEBLAMPQtG1Vm8DJu0huGL4AL2ThdGiQUvn/fRwp9ZCLRxxeUlJu8Zqb+PEYThcx3ZHWCZ0kcXg9n5XnS9hDnmehuVmTHMnRrN/blMO6ZgAjGRzrhRx5lxmnSVbIalFmtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Swdke6SowPTuWenLRwDgSezitj7L1iEPMumauZVENE=;
 b=J/Kx6Vb1ZdFKmDaJrMiUWJ3mzKI3eKSDDZ5iu/joLucMnySNSdDUklewPDldAdk+FbCyNX6PCrdNhGfKKDLzMaXnWnCEKlaBAV1n7XYm26QnKgiiki5DMS88wyKKbAehMtvPmdFh8M4T+vvEN01EsLam73ef/ALsZMIfKdbdUq0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3334.namprd15.prod.outlook.com (2603:10b6:a03:106::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 8 May
 2020 22:12:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2958.035; Fri, 8 May 2020
 22:12:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, Andrew Geissler
 <geissonator@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Dunfell Update Status
Thread-Topic: Dunfell Update Status
Thread-Index: AQHWHZEinkxzaprkVUuCJxDTD030GKiZzMoAgAAo/oCABGVOAA==
Date: Fri, 8 May 2020 22:12:39 +0000
Message-ID: <414154FE-AAEA-43DA-889A-BC79CA092ADE@fb.com>
References: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
 <16620BAA-69AD-491E-A2C3-265C53DC91F9@gmail.com>
 <0938c96f-b3ff-3a16-7ca4-53bf99488009@linux.vnet.ibm.com>
In-Reply-To: <0938c96f-b3ff-3a16-7ca4-53bf99488009@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:e822]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cbb68d4-8f0f-4461-236c-08d7f39cebc4
x-ms-traffictypediagnostic: BYAPR15MB3334:
x-microsoft-antispam-prvs: <BYAPR15MB33348813687A616277C5691DDDA20@BYAPR15MB3334.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNUhlyDwA1+OgW4e744UN0zSEJAoPru/Lds/6RLe8LQc/Yp8/4IblmRgOFFTXDNMHJmhMifXOYsjT11I4NMQ+eCjGwh4MwwbwIW0TwLAoqwUQ60lbE7wzK6rwq9UFL1gKo1J0bir6KemX+T90fHJSUpjeQvtNHLdSjj5G5CXfi6XMESuZyQPJua0hizJmhpjT1BmtwID9JlGJ5WYdqLYQcOoE3rAX8+auW6rivyk2noKpHuRd7bgrPB4898JpB4oPFX3zCuuhFjd+Hx8F86ocqMz0FnOKognnpxp/l+qJ+oc9fdbo9S9j5hYZHY2kyY/8ENR0qVvXOIP/5tlFtmJa3HyjKhw8Ol/Dk7LkrM5uWawxQxzjmgHs54MTBe9Fu36isiMB9Tg/WjAhDeqkZ0WMyfslvwlCdmIGhB2bpVMzvSvt2cMQf3aHRYijAedE1B8Xgah9/sBb8PpfLO2z8hhIeFKgAgKeRTgmP7E3TyK8c3KoUUFH7kR0nAa8TyLvwr2nL9x5TQJQxj/uERRzR6SR3JHoQGcejcTMiFe1+7qxZLSEFhJkIn5I+O9n57Vbvb3N+h+aoEpHSUNvWcYECSRYsPB7hYONMLGP/Xbu3A3Lr0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(376002)(396003)(136003)(39860400002)(33430700001)(8936002)(2906002)(2616005)(64756008)(66476007)(66556008)(66446008)(33656002)(6512007)(76116006)(71200400001)(110136005)(66946007)(5660300002)(8676002)(3480700007)(53546011)(15650500001)(33440700001)(7116003)(6506007)(6486002)(478600001)(316002)(186003)(36756003)(86362001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0sMt+yoi1iJ+RAtpw1O5egr0RqKuWcT0Ippc8nzntsLpEVbj+wYscq1bU/ktWiXizAAwZ86EHZChi4ICihiVlim3SCtMBflUW7BjzLJbq/myoiy+8CRo8vueHtSOY0Ybcxg7mivAyzpJVIQFK+ND56Pa8A6ZHVdH9ui418e1A0J6DKDHA4ftaiSD/1VLlhUkjMbNbrUQzfnBOyyf1Na0SOUpQVuQ6lw9u2ViIeYsjn3bDyGqxtUiVn0GsxnJOXbYOuh9Z8D6ZnA7edVwBViXH3Ku+DBaDLWpEohVGTlDRI4gvx2HlpyyhnIbzUr+Of9C9kdT0jr3GLZWCf684wc7/WJ5nKYXUW7AG/GTTYNc8HiFu/SGhok8mJZOBtO85tlc0jLwr3LfYkx8GWcC8k1ltWFUrRYXgovZKswpo91IwNMY15FXHIEMC1LopCrVHz6s72af7DHGLVdfKaH6Eaq9DEuYUa8Rw6RKMtzCu2T5MeKBw7U0SXNolFoiX/Atm9822FpnBmAHRW/Ebq9oqEOySw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CED92441DA85AE4081B9B8ECC96C28D4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbb68d4-8f0f-4461-236c-08d7f39cebc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 22:12:39.1202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YC7ze6NbCKgtQTBmyjhlTwtEdpAYQzdGbsp3uwVDHcXHrJ2eKfnKZqxBchiIdOcoFyjjsaI0iEk1ifTsN1PJWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3334
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-08_19:2020-05-08,
 2020-05-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 mlxlogscore=990 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005080187
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

RG8gd2UgbmVlZCB0byBpbnN0YWxsIG9yIHVwZ3JhZGUgYW55IHBhY2thZ2UgaW4gb3VyIGJ1aWxk
IHN5c3RlbSB0byBidWlsZCB0aGlzIG5ldyBkdW5mZWwuDQpJIGFtIHNlZWluZyBsb3RzIG9mIGJ1
aWxkIGVycm9yIHN0YXJ0aW5nIGZyb20gc2FuaXR5IGNoZWNrZXIuIE15IGJ1aWxkIG1hY2hpbmUg
aXMgY2VudG9zIA0KQ2VudE9TIExpbnV4IHJlbGVhc2UgNy43LjE5MDguDQoNCu+7v09uIDUvNS8y
MCwgMTowNiBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEd1bm5hciBNaWxscyIgPG9wZW5ibWMt
Ym91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Yg
Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbT4gd3JvdGU6DQoNCiAgICBPbiA1LzUvMjAyMCAxMjoz
OCBQTSwgQW5kcmV3IEdlaXNzbGVyIHdyb3RlOg0KICAgID4gQW4gdXBkYXRlIG9uIHRoZSBlbWFp
bCBiZWxvdy4gVXBzdHJlYW0geW9jdG8gKGluY2x1ZGluZyB0aGUgbmV3IER1bmZlbGwgcmVsZWFz
ZSkNCiAgICA+IHdlbnQgaW50byBvcGVuYm1jIG1hc3RlciB0aGlzIG1vcm5pbmcgd2l0aCB0aGUg
Zm9sbG93aW5nIGNvbW1pdDoNCiAgICA+DQogICAgPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9vcGVuYm1jL2NvbW1pdC84MmM5MDVkYzU4YTM2YWVhZTQwYjFiMjczYTEyZjYzZmIxOTczY2Y0
DQogICAgPg0KICAgID4NCiAgICA+IE5vdyB0aGF0IHdl4oCZcmUgcGFzdCB0aGUgcHl0aG9uMyBt
aWdyYXRpb24gaXNzdWUsIHdl4oCZbGwgYmUgZG9pbmcgcmViYXNlcw0KICAgID4gb24gdXBzdHJl
YW0geW9jdG8gb25jZSBhIHdlZWsgYWdhaW4gKHdoaWNoIHNob3VsZCBwcmV2ZW50IG5lZWRpbmcN
CiAgICA+IGJpZyBwYWluZnVsIHVwZGF0ZXMgbGlrZSB0aGlzKS4NCiAgICBBd2Vzb21lIQ0KICAg
IA0KICAgID4+IE9uIEFwciAyOCwgMjAyMCwgYXQgMjowNSBQTSwgQW5kcmV3IEdlaXNzbGVyIDxn
ZWlzc29uYXRvckBnbWFpbC5jb20+IHdyb3RlOg0KICAgID4+DQogICAgPj4gQSBmYWlybHkgcXVp
Y2sgdXBkYXRlIG9uIHdoZXJlIHdlIGFyZSB3aXRoIGdldHRpbmcgYmFjayBvbnRvIHVwc3RyZWFt
IHlvY3RvLg0KICAgID4+DQogICAgPj4gRm9yIHRob3NlIHRoYXQgZG9u4oCZdCBrbm93LCBkdW5m
ZWxsIGlzIHRoZSBuYW1lIG9mIHRoZSBuZXh0IHlvY3RvIHJlbGVhc2UuDQogICAgPj4NCiAgICA+
PiBUaGUgbW92ZSBmcm9tIHB5dGhvbjIgdG8gcHl0aG9uMyBpcyBtb3N0bHkgYmVoaW5kIHVzLCB0
aGFua3MgZXZlcnlvbmUsDQogICAgPj4gZXNwZWNpYWxseSBQYXRyaWNrIChzdHdjeCkgZm9yIGFs
bCB0aGUgaGVscCB0aGVyZS4NCiAgICA+Pg0KICAgIFRoYW5rIHlvdSBBbmRyZXcgZm9yIGRyaXZp
bmcgdGhpcyBhbmQgdG8gZXZlcnlvbmUgd2hvIGhlbHBlZCENCiAgICANCg0K
