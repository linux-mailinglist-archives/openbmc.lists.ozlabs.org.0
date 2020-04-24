Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1703E1B8256
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 01:07:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4988w443g6zDr1S
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 09:07:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=1383c36895=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=hq0ClHMs; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=TDTAfy93; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4988vH3cq1zDqY6
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 09:07:05 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ON3USu015241; Fri, 24 Apr 2020 16:07:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ifql2VUsGYny1XsqDqo4icRAlyIz+KaPHXcOWV1sG2I=;
 b=hq0ClHMsmesW47pO788tp6GVVjPQKcraSkeELXvdolTRTm5R5XIroOyYEMVL5f3Kp07y
 u5TUSsc2zM7vK0U5oeGXQzxlUSpYrfdv4lg1k2seI2LzJyDgTU1kp3muydQkbhfjF3iw
 eOGrVcdIhdBUBgKBVeEupAjoTw04nSpAb8o= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30jq4jsg0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Apr 2020 16:06:59 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 24 Apr 2020 16:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7sdY27RGmE7JuxPVB6RYqpuE/Wu8N1XuqWMIHXnTEASzA4c7YPtt8zBBDZIFP6Bv7NbrJGDyWih2ZaslX6noNt/igScNjkivJpaF5UGgCSlOd2A2qJ5VcO595i6dYCcmFj4Us3amHOP2qGG7ol3PNBAOeYQ/Br/xodfo/YfIgswXdixTlH0ShloxmGBlVRpZB3/3sLaelpNwejs9tkOPbX75korcWA/Brx+10425L7dwaQRLC2tiftAZ8ORfhdQjSIDDW7UkYUQHkk2cPXrhQ0T+fDMD4kZRBhlQsycXkiPCoVR82cPkdeP97xvwDKWjsH97nIzy0vduZqn3KrTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifql2VUsGYny1XsqDqo4icRAlyIz+KaPHXcOWV1sG2I=;
 b=bkeOjpHWKYiNsFFTdSxoTha1eaV6ZtbHuedWzBHiWJetwPrvcTtUHdr6RtngcPVofXkXzy4PI7srp2SHuMjtteWOq0aeudHATXXMxpHUp/SGaXwTuUMZ8RkXgH6PlmGPkdigEjr5/jMMoYK6CZexB1gqb2WDslt5LMWQfNlMZtVzIxyTg3l3L0KMd/Gzm8lzfvskprI+z/BARV1LHMNsE+fcRnfjHnt5oavr8lzbqJTt/GChte0ZV0K+87Z+iaVNctlLEd60tTvbtlQ4nGqQFGhnCdrOGDDIgCKA1qDf1IqP7HGqzCrVfYMq4SqM3hIVXa9XY01fpSsCfN6qGCC84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifql2VUsGYny1XsqDqo4icRAlyIz+KaPHXcOWV1sG2I=;
 b=TDTAfy93QJMphpd9muI7GH4hvx2y6Bb/MbSvhm2CkDPLUwPuvs6JxjosBZnHtstlJ8liGMa/kchv0gbzRiWdgsurEDwBz0vhF99Y6TsTpTfqoZ1ysBMJeltO0TNTq8fko/Prtc6a5+29g3q921Wa8ZazIk3LdBkCJuJPJsSjPjA=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2311.namprd15.prod.outlook.com (2603:10b6:a02:89::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 23:06:58 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 23:06:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Intel-BMC: Fan control
Thread-Topic: Intel-BMC: Fan control
Thread-Index: AdYZyY7P3PIB+VYAQwqoWDNCiBKcFwAf+5uA//+2xYCAAIVvAP//1ZOA
Date: Fri, 24 Apr 2020 23:06:58 +0000
Message-ID: <02B788BD-3D05-40E9-969D-D6CF07E2E8D2@fb.com>
References: <e3297385bee9483989607bce1e9837d9@SCL-EXCHMB-13.phoenix.com>
 <e05f77ca-b69c-0e8a-3b4d-3e20a2f87b02@linux.ibm.com>
 <FF397713-D6F3-4E6A-BA22-34EEA5C07236@fb.com>
 <90c0f54a-24c4-ab8c-4f45-df1c631d006c@linux.intel.com>
In-Reply-To: <90c0f54a-24c4-ab8c-4f45-df1c631d006c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:c10c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed0eff51-54f7-4b35-afde-08d7e8a430b7
x-ms-traffictypediagnostic: BYAPR15MB2311:
x-microsoft-antispam-prvs: <BYAPR15MB231192CF9415111A4CF0C67BDDD00@BYAPR15MB2311.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39860400002)(6506007)(186003)(6486002)(66946007)(6512007)(2616005)(66476007)(91956017)(76116006)(64756008)(33656002)(66556008)(66446008)(316002)(71200400001)(86362001)(110136005)(2906002)(53546011)(5660300002)(36756003)(8676002)(81156014)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +QZ4+Wlbs6uYyEO5m9gayO1wVLZ/bewvks/RqcvSw5i6f830nT6mBeg/aHiD4Or5mYgkQdlyYIcYJKVAs0Suaa4JkyWYbd005PXDiZP93VuJ9CoECVcpZHfpq+J0/fPWuX49WbDaAMwBruE5R8UxSbOgP7Jo0n0+QT8Q8hAt2wbazcnioLmtQD3qGMH7Toymu5bJsGDibOg20df9C6vGbJJ25wXUcyxG/uT5nIlJ7gD7l/UrwWnSZB8y/NDcQWJ/l/5Jk20tKAEFGX9yQCkzbfv0e+/R1qsVxI5VzQz0FoJg5EIrHM9DjTBXjMspPCOUMBAc3STkbv93GCQtG+wOpVgKUnRTTTxqBBoMMl8TgqtjIGjcjJlZtMUoUlKUqVFEQ8YclSlGon072p8U3bMRXthdBXvkRqQXPW4tYwscS/9Ngx5uiUKmrLAa3bGpWnin
x-ms-exchange-antispam-messagedata: oZY3RtvGiIVme913EyucMMrb3GAxrTyJJBQU/rLWwBMbU0kSEfvpX3QwKTEmS4HF/Ta0+S4BwssTMY8wMKfhUmly7+GIzSEbijLcSFlexpxgg7+OziySLaJ1QUz40NRkQ8cyzHssfwJDjaKPG8GZ4HGbXl/1bP6gqMWALa2+XcPHBOL3nQq0nXqRaGA9IUiEHzfLLUb0Mak844mXXHiLOLQiOmxst8S0NF/KF1O1/3iCkT3z86sbs8VZyf8YxKNV4fAVxaNrPupCjBOESwidsv1RYeWcncqQmAdzmg7L/5kJ0HSRSNvKVNI1nKNLZygEexF6hFwB58lQr+jdDTCP6mJd0HeWHNK4M08H1L4EoUxC7ok84DDu6ZJIDbxYfHOicVGtSLs2Ep2Nn83oefcsPyNjaVyK4LMYk0lCxf8q6hLpEIQvnn+pkFs6EkVzc+zuPrVWQNua90zCh7dzeuFZ66CPdNcts9g6vzlKVKDsqzbbryycrULjhPFkv19tKEVfyNEmezRUOGU4+CusFT4UIJBEYInMeyEppd2TqGb2Jpz8kanJcnkRDHz0Q1e4+z/LwxcQF6dea4gj78aQ82L4W882WAKtmpXrsn1OhQkmW9uF1Wwfuq31JRlMoBRTJ8540BGRaS+DpKJQh9fBQCXfrGSiCrYBBeClX6/hofX2qK0aIFHYEOpQHyEYQ43BXkk0eEvrSYzk75vlcSn1an2JX7aGdYEGHFfLcN03ODElj7i+vWClCxgC9E3a+Nnk8ffxiL50mtDCvUPeZa3r7K94RX5gyrd2LLCUwiiMfI+UW1cGm0ktO00Ra2NMEGnLa0bSeCPNL9Jr/ZaiuBBMhSlytA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <464C098BC1EE72449EAD36B5FE7A577C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0eff51-54f7-4b35-afde-08d7e8a430b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 23:06:58.4450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9icTLToRlMRLURF9H6infbfjjnNm0obATI/3/s9lHhSbYiBviMlcUOfFoQEgCZ81GaCLPR0Jixi6ti2EQKEhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2311
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_13:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240174
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

DQoNCu+7v09uIDQvMjQvMjAsIDExOjQwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmFtZXMg
RmVpc3QiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAg
ICBPbiA0LzI0LzIwMjAgMTA6NDEgQU0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IEkgY2Fu
4oCZdCBjb21tZW50IGZvciBJbnRlbC1ibWMgYnV0IGluIG9wZW5ibWMsIGVudGl0eSBtYW5hZ2Vy
IHN1cHBvcnRzIA0KICAgID4gZm9yIHBob3NwaG9yLWZhbi1jb250cm9sIGFuZCB5YW1sIGNvbmZp
ZyBpcyBub3QgcmVxdWlyZWQgaWYgdGhlcmUgaXMgRU0gDQogICAgPiBjb25maWcgYXZhaWxhYmxl
Lg0KICAgIA0KICAgIFNsaWdodCBjb3JyZWN0aW9uLCBwaG9zcGhvci1waWQtY29udHJvbCBpcyB3
aGF0IEVNIHN1cHBvcnRzLCBhbmQgdGhlcmUgDQogICAgaXMgbm8geWFtbCBjb25maWcgcmVxdWly
ZWQuIEl0IGRvZXMgbm90IHVzZSBwaG9zcGhvci1mYW4tY29udHJvbC4NCg0KVGhhbmtzIEphbWVz
IGZvciBjb3JyZWN0aW5nLCB5ZXMgaXQgaXMgcGlkIGNvbnRyb2wNCiAgICANCiAgICANCiAgICA+
IA0KICAgID4gKkZyb206ICpvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIu
Y29tQGxpc3RzLm96bGFicy5vcmc+IG9uIA0KICAgID4gYmVoYWxmIG9mIE1hdHRoZXcgQmFydGgg
PG1zYmFydGhAbGludXguaWJtLmNvbT4NCiAgICA+ICpEYXRlOiAqRnJpZGF5LCBBcHJpbCAyNCwg
MjAyMCBhdCA4OjA4IEFNDQogICAgPiAqVG86ICpQYXRyaWNrIFZvZWxrZXIgPFBhdHJpY2tfVm9l
bGtlckBwaG9lbml4LmNvbT4sICJPcGVuQk1DIA0KICAgID4gKG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZykiIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQogICAgPiAqU3ViamVjdDogKlJlOiBJ
bnRlbC1CTUM6IEZhbiBjb250cm9sDQogICAgPiANCiAgICA+IE5vLCBwaG9zcGhvci1mYW4tY29u
dHJvbCBpcyBjdXJyZW50bHkgZHJpdmVuIGJ5IHlhbWwgY29uZmlncyBhdCBidWlsZCANCiAgICA+
IHRpbWUuIFRoZXJlIGlzIHdvcmsgc2xhdGVkIHRvIGVuYWJsZSB1c2Ugb2YgcnVudGltZSBqc29u
IGNvbmZpZ3MgZm9yIA0KICAgID4gcGhvc3Bob3ItZmFuLWNvbnRyb2wuDQogICAgPiANCiAgICA+
IEkgYmVsaWV2ZSBlbnRpdHktbWFuYWdlciBjYW4gYmUgdXNlZCB0byBwcm92aWRlIGNvbmZpZyBk
YXRhIHRvIHRoZSANCiAgICA+IHBob3NwaG9yLXBpZC1jb250cm9sIGZhbiBjb250cm9sIGFwcGxp
Y2F0aW9uIHRob3VnaC4NCiAgICA+IA0KICAgID4gT24gNC8yMy8yMCA2OjQ4IFBNLCBQYXRyaWNr
IFZvZWxrZXIgd3JvdGU6DQogICAgPiANCiAgICA+ICAgICBGYW4gY29udHJvbCByZWxhdGVkIHF1
ZXN0aW9uIGZvciBJbnRlbC1CTUM6IERvIHRoZSBlbnRpdHktbWFuYWdlcg0KICAgID4gICAgIHRh
Y2hzLCBQV01zLCBhbmQgem9uZXMgaW5mb3JtIHBob3NwaG9yLWZhbi1jb250cm9sPyBPciBpcw0K
ICAgID4gICAgIHBob3NwaG9yLWZhbi1jb250cm9sIGRyaXZlbiBwdXJlbHkgZnJvbSB0aGUgeWFt
bCBjb25maWd1cmF0aW9ucyBhdA0KICAgID4gICAgIGJ1aWxkIHRpbWU/DQogICAgPiANCiAgICAN
Cg0K
