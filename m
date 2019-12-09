Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D311758B
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 20:22:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WtP73QzYzDqQM
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 06:22:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=72461f3461=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="feH3HzaB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="euIrsUwH"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WtNR0q4MzDqNy
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 06:21:37 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9JE9AB032376; Mon, 9 Dec 2019 11:21:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=nYgk621ShlcK6LWfGrwsM76qn50KfeWXU0GfNdbW2Hg=;
 b=feH3HzaB4SMUVPI6AjuIZ7DPA6hPywcY0M0V9EtjKi4ZKOjb7Tx63LJjMpCqQVGZpQ8O
 JJOm2lME1y4UFIQZahSuzeQEd8qASWd5pWCHOy1Xf2aOS48raePEME6bDdq8oCCHa1sE
 N3AT4JNOMBtUl/E/dYcMGNSvdQSY3oHZHWs= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2wrc26a1dj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 11:21:31 -0800
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Dec 2019 11:21:30 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Dec 2019 11:21:29 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Dec 2019 11:21:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUA0QSjzC/ghF8YhzwmN0jZk10F/cyAEQy3PAKYxTBrj1LvL2LUxCXmoigmkk29A2n6w/IEyOqVoMhLZ4pPqKvcoJbxWr4j4Bs/oQaTgnvHbSLfoXw2Q4ygboz9oLmHif7Eoja+AcqQqtC+9TNSOx2NUByDpM7FlbjrpQiKxhXSzHv0liu4rEWrM6PyoGHmKJVyLchSYuPm/6k2FbPzF8POaoFuR2YiU5jSZXErg7DImkXXoCG5i+8hI2bJOws7VG0e/3wwJPViDGdQjRsXwlXQayE62+pdqYphwe7DKSD0/3/m3PJ/gVtkfABcrK44BmLlHWi+Lk7ytA8rfINsPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYgk621ShlcK6LWfGrwsM76qn50KfeWXU0GfNdbW2Hg=;
 b=THuRtoCqKFApiMLagHqLnpDKiF0yZBdD3LpvXVCr+pHc3j26DhAzm7JEve5dVmga7Q5DCcv87L36p3HQALlcSoMeydAEkAsrFIGZ5tU2B4Q9r77PpgVYlkktLtuk1MWlihuBwFr7XsG6AW/8nlCO4OPPaCgHPQfKt5Twk2iJPb1zZ5LAmVyySSMF2Ee/87wvO/FK53/vM3DKIDrl+AaXZ/9a7kVeVPzcGv2HtDRPSiT4nRW1E7f1CTPMFwy0Ad7NzSaJmt3W41+hFtwfE6l0ywVpjUQyOeXe3RLy+AO/aU0MTK1b2d7ZoRIy/GEe5SUnSWWWZndU1ni8etshPZCY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYgk621ShlcK6LWfGrwsM76qn50KfeWXU0GfNdbW2Hg=;
 b=euIrsUwHbO0swoIW7SH7JJy+Y+FgBxMWHbiGifgxdZMbg6Oo3v6QSqwicaBb0lE6LLt18E60o6THrUVrwh/BJP8nfPLgJ4JWmsRtsjxf1v0/afooP+GmTW2/60ih6MPDsd8RLymCPueYEtuk1sRyQteRaI4P2+M7gdpZFFIDsOE=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1168.namprd15.prod.outlook.com (10.175.2.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Mon, 9 Dec 2019 19:21:14 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 19:21:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: Re: ipmb bridge
Thread-Topic: ipmb bridge
Thread-Index: AQHVlnGlQsGRLWH4QkWnkQ6P8OrtEaeBukCAgDAeZIA=
Date: Mon, 9 Dec 2019 19:21:13 +0000
Message-ID: <843C006E-A2DB-4B6E-88B1-B0CC6AEDE4FE@fb.com>
References: <AD40F5EA-1994-44CC-B49B-DBDBB79AD484@fb.com>
 <b5325d37-43d6-c1a9-32b0-752bfb63ea38@linux.intel.com>
In-Reply-To: <b5325d37-43d6-c1a9-32b0-752bfb63ea38@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:9739]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3ca2511-006e-405a-26fa-08d77cdcf527
x-ms-traffictypediagnostic: MWHPR15MB1168:
x-microsoft-antispam-prvs: <MWHPR15MB1168072BBD1CCD2773739F7DDD580@MWHPR15MB1168.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(33656002)(186003)(53546011)(221733001)(2616005)(6512007)(8676002)(4326008)(6506007)(81166006)(229853002)(71200400001)(71190400001)(81156014)(8936002)(76116006)(66946007)(3480700005)(66556008)(305945005)(2906002)(66476007)(966005)(7116003)(478600001)(86362001)(36756003)(316002)(64756008)(66446008)(110136005)(5660300002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1168;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nW1WnTxXF79Gq+Tfvo2LW7JmpmW6hYMSwmxo0Pqm5dTcerPdmCQiMgKsLfh3IT81xS/FBtwXhGtf3coap2vnBMghdoPnJ7wUQfqi25wfTNx5mW7FfQKqJbt2ZWigvPlcvG906Di+dQMt+YTieYfREcqpnsW7xOanb5/ACCpAnOKG30s1MMIOVfESQE8CsvqYxYZ4b/g84lgvlNdqqCMV0xVa4sFITfh4Mj2mJHxsXr6CJdY0sRa2utkAMeOKAokeZ3Ojm8qvEPnP/d4mBeF26gPodml39Ez3pfZIdk3eS20U7X5K9gRNEN/LIOtQECP7rBanxCWlu1xA3Th9D5DOwlikD4xTuwXuzBAWSEJQ0yYpiSmYEiUPN3I8KOuR3YopQ0EoFmUdSQ8fX10S+nbDfFUIvrnBPpC/ot19I7tuCctU9+3OxQN7B7PRATplaC34RwVSLU0si9Y1VJHb8CsNYGtpYJJupC8uTmFM+/DC4kw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CD240A6325B1844B9A95395618CC29A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ca2511-006e-405a-26fa-08d77cdcf527
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 19:21:14.2618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZyawZkdBymsYJUhFmM3lAK92XdXyd4wEsp8Lvp51IajclboiwdB1ZQ3bpDkkp5Sag6M47FwgOtQkn2cMy7nRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1168
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_04:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912090152
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SmFlL0phbWVzLA0KQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IG5ldyBpcG1iYnJpZGdlIGFwcGxpY2F0
aW9uIGJhc2VkIG9uIHVwc3RyZWFtIGRyaXZlci4gDQpJIGhhdmUgdGVzdGVkIGFuZCB2ZXJpZmll
ZCBpdCBpbiBvdXIgZW52aXJvbm1lbnQuDQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3Qu
eHl6LyMvYy9vcGVuYm1jL2lwbWJicmlkZ2UvKy8yNzc5NC8NCg0KUmVnYXJkcw0KLVZpamF5DQoN
Cu+7v09uIDExLzgvMTksIDEyOjMyIFBNLCAiSmFlIEh5dW4gWW9vIiA8amFlLmh5dW4ueW9vQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBIaSBWaWpheSwNCiAgICANCiAgICBZZXMsIEkg
c2F3IHlvdSBzdWJtaXR0ZWQgYSBjaGFuZ2Ugb24gaXBtYiBrZXJuZWwgZHJpdmVyIHRvIG1ha2Ug
aXQuDQogICAgVGhhbmtzIGEgbG90IGZvciB5b3VyIGVmZm9ydC4gRGlmZmVyZW50bHkgZnJvbSBt
cXVldWUgc2xhdmUgZHJpdmVyLCBpcG1iDQogICAgZHJpdmVyIHVzZXMgaXBtYiBwYWNrZXRzIGlu
c3RlYWQgb2YgcmF3IGRhdGEgc3RyZWFtIHNvIHRoZSBpcG1iYnJpZGdlDQogICAgc2VydmljZSBj
b3VsZCBiZSBzaW1wbGlmaWVkIGlmIHdlIHVzZSBpcG1iIGRyaXZlci4gSSBkb24ndCB0aGluayB3
ZSBuZWVkDQogICAgdG8gc3VwcG9ydCBib3RoIG1xdWV1ZSBhbmQgaXBtYiBkcml2ZXJzIGluIHRo
ZSBzZXJ2aWNlIHNvIGl0IHdvdWxkIGJlDQogICAgZ29vZCBpZiB3ZSBjYW4gcmVwbGFjZSB0aGUg
bG9naWMgd2l0aCBpcG1iIGRyaXZlciBzdXBwb3J0IGluIGlwbWJicmlkZ2UNCiAgICBzZXJ2aWNl
Lg0KICAgIA0KICAgIFRoYW5rcywNCiAgICBKYWUNCiAgICANCiAgICBPbiAxMS84LzIwMTkgMTI6
MTggUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IEhpIEphZSwNCiAgICA+IA0KICAgID4g
Q3VycmVudCBpcG1iIGJyaWRnZSBuZWVkcyBtcXVldWUgc2xhdmUgZHJpdmVyIHdoaWNoIGlzIG5v
dCB1cHN0cmVhbS4gDQogICAgPiBUaGVyZSBpcyBhIGlwbWIgZHJpdmVyIGluIGtlcm5lbCBhbmQg
b3VyIGlwbWJicmlkZ2UgZG9lc27igJl0IHVzZSBpdC4gSSBhbSANCiAgICA+IGluIHRoZSBwcm9j
ZXNzIG9mIHVzaW5nIHVwc3RyZWFtIElQTUIgZHJpdmVyIGFuZCB3YW50IHRvIHJldmlzZSANCiAg
ICA+IGlwbWJicmlkZ2UgY29kZSBhcyBwZXIgaXBtYiBkcml2ZXIuIFBsZWFzZSBhZHZpc2UuDQog
ICAgPiANCiAgICA+IFJlZ2FyZHMNCiAgICA+IA0KICAgID4gLVZpamF5DQogICAgPiANCiAgICAN
Cg0K
