Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24D20199B
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 19:40:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pR0m06PlzDqdf
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 03:40:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=04398644b5=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pNy90qBzzDrMp
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 02:08:13 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JFXFaB012181; Fri, 19 Jun 2020 15:37:37 GMT
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 31rqfgkvrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 15:37:37 +0000
Received: from G4W9119.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.20.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id B54ED66;
 Fri, 19 Jun 2020 15:37:36 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 19 Jun 2020 15:37:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 19 Jun 2020 15:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMnnQn72u/sXPnb+vW6vOjGoct5AojyrqeH3XufBUQE0vz46Zu+C8WyaRxxU+mS4VPRSETY9Bw0Wup+2o1IY/GkwAsKvsFEum7Ao6788bzqXZFL8GjiNz8FxrMVTYIOxhh9N0AVPpyFjVSJj7FltzKdVE5y3kVOJdhZyJLE1Y9TC27022MmCWYjsBUEY4Mnb46y08P5Cj0F8hcrgnQssdGlx9iNLOUxOtzgGNYeGxFSt8SSu0bAP14WSNKI9AAOtr0DgtaN2Crv1qXX+OGb78TjEBOl4apePMt5aEUOFJe3tI4h/XyZ1j3H3fcVOvx5XZJ659Fzdb+FG3qdOhoEpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUod/uNKu7fnKw878UAdZwVlcu49DjOKRmjWKz4fGGc=;
 b=PevqRa1SoB7SuCn9fXXJs/4KzLB8281oNAp2iNHM0KpCBJhUklifwIFviJ6bTmEUePLjgUDNA32WzIeucvQu9IfjzbSsgLCBiraNh/Sw3JmUwOKIjjwKqsXBoLqJh8c0w8FKHHbroKzhP6zuDRq+GchfLlVutAJd4AoVrKJhDt18wHn8Q4PJtTDuvajmpXrLoWeX61QER3KBIAAdSIq4WZ1uk9iqnFfQTMOduBLyPXT7v1rPfAZt+Afl3CgzR7s2BfTHFiIdOU/4WS6cYIl8hS3EJ08qTNqsiIMJMRXVoHMnzcYBNlYWo2u6GIR9q+OlvnGFHrftrAeKSBBxuDjPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7611::7) by DF4PR8401MB0858.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 15:37:34 +0000
Received: from DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2479:cd7a:5b17:d85d]) by DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2479:cd7a:5b17:d85d%12]) with mapi id 15.20.3109.021; Fri, 19 Jun
 2020 15:37:34 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Verdun, Jean-Marie"
 <jean-marie.verdun@hpe.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: OpenBMC - how best to do meta-hpe commit
Thread-Topic: OpenBMC - how best to do meta-hpe commit
Thread-Index: AdZGTdLTlPs7S4nWRWCOUKXSSaw3OA==
Date: Fri, 19 Jun 2020 15:37:34 +0000
Message-ID: <DF4PR8401MB11459191B8F682B8DAB4707A8F980@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [73.76.19.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a09a0b8f-c9cc-47d1-8ac7-08d81466b028
x-ms-traffictypediagnostic: DF4PR8401MB0858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB08582DD8DCE6F3785B87FE388F980@DF4PR8401MB0858.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f4sYH4d++IWhZobvVbnoZZh6ncZm+cve31TnTC2XXLvozJNMVu9Sy+s9l5+XFFwzWo0JQO50xMXUhfgWNWeesuFqcsfJISwC4LVjzI0C8pcJpyZ1szU8F7A2ZiM86Qg+XiYoT1HsdUxaW//xemtpIaDQTVuzHDDjNN2OKQNL7N6JEiGPAGqlWYzxN+BUk34s/BFtlsuX6tfn1w4lCL4cn2JEUhxGZk0hxKUfp+vGLTnb/wvCT5tWRcvn63cfg+Xs+eCrcy9a/HtW0isFOy/ETTyMuGsUJSDlB0Yl4+eFcpgafpav5Vcv0vOIaP/BQmDNQIggFcBwykKvUlyC0OQI/VVKM4xaBJyRgM2E5H6HbHyxvxtKaO9v+lyTnTPUtmRCwiW1lXaf2KOZT1MCuE86rA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(136003)(346002)(376002)(39860400002)(4744005)(33656002)(316002)(4326008)(52536014)(478600001)(7696005)(26005)(66476007)(71200400001)(66946007)(76116006)(966005)(186003)(66446008)(110136005)(64756008)(54906003)(8676002)(55016002)(8936002)(5660300002)(9686003)(2906002)(86362001)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qBUX1PL1ycrXCI8zj2P4BOiPuATqCx1k3OGHsaFzkYVQF3CEG5tuUGBbMohpalhxtdVD+u3qpfta+eS/weaGd8cgVP5Qwegih5B9SV/3olozaC8bAL8alyFvhyfrr54ELx+fkeMzwQLTUqyL0i5stvqKuBdlUlRpQ1jn+iE3LHWwsmDEKHDfZ+031Lxit5vtkCOYO1+K9Z3YxlYQ1AyYc4KG3qTU9jMbWIB4jPXPD1jUiQJcefM3gzxljgUSGKHofGzM1PLsrMIRS881RFqi8a3ZgIPLMmFWs76CI0E0zfPkmxzWAJu8Q2AmpY5b0JvVJJfA0W2amS4EOW505oea2KZKnyMflyjpn4V0gpXdqZgcwhzJRcOrXLFRevbBYR0rvpX/cwv0B6qkztVgmY+aufK7XiOu2+bdprZw1xt8H+i+nQZ7Dz32HT4U4KtdFi4pjNA5rZOQb9KB5XyNI7PvMRWA4vHfOoh+dNt//m24jpE=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-Network-Message-Id: a09a0b8f-c9cc-47d1-8ac7-08d81466b028
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 15:37:34.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk77XcDqH+F81x8BxJUrVaxJENi5dERCNtdGQE15jjOte0VETUOzUOupf2u6MA/XOJheRq+tipDxi7LFetTZCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0858
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_16:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 mlxlogscore=680 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190114
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, 
 John \(TWN iLO\)" <john.chung@hpe.com>, "Chen, Gilbert" <gilbert.chen@hpe.com>,
 "Newman, Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCBhbmQgYWxsLA0KDQpUaGFuayB5b3UgZm9yIGNyZWF0aW5nIG1ldGEtaHBlLiAgSSdk
IGxpa2UgeW91ciBvcGluaW9uIG9uIHRoZSBiZXN0IHdheSB0byBkbyBvdXIgaW5pdGlhbCBtZXRh
LWhwZSBjb21taXQuICBJdHMgY3VycmVudGx5IDE2OCBmaWxlcyBzcGxpdCBpbnRvICgxKSBhIG1h
Y2hpbmUgbGF5ZXIgZm9yIG91ciBETDM2MCwgKDIpIGEgQk1DIFNPQyBsYXllciwgKDMpIGEgY29t
bW9uIGxheWVyIGZvciBlbGVtZW50cyBjb21tb24gdG8gSFBFIHBsYXRmb3Jtcy4gIEkga25vdyB0
aGUgdGVhbSBwcmVmZXJzIHNtYWxsIGNvbW1pdHMgYnV0IHdvdWxkIGxpa2UgeW91ciB0aG91Z2h0
cyBvbiB0aGlzIHNpbmNlIGl0IGlzIG1vcmUgb3IgbGVzcyBhdG9taWMuDQoNCkkgYXNzdW1lIHRo
aXMgd291bGQgZ2V0IGNvbW1pdHRlZCB0byBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3Qu
eHl6L29wZW5ibWMvbWV0YS1ocGUgYW5kIGdvIHRocm91Z2ggdGhlIG5vcm1hbCBHZXJyaXQgcmV2
aWV3IHByb2Nlc3MgcmlnaHQ/ICBJJ3ZlIGxvb2tlZCBhbmQgbm90IGJlZW4gYWJsZSB0byBmaW5k
IGdvb2QgZXhhbXBsZXMgb2Ygb3RoZXIgIjFzdCBjb21taXRzIiB0byBzZWUgaG93IGl0J3MgYmVl
biBkb25lIGluIHRoZSBwYXN0Lg0KDQpUaGFua3MsDQoNCk1pa2UNCg==
