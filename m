Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF641EDBA1
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 05:32:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49crtS25J5zDqV3
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 13:32:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.183.28.62;
 helo=mx08-002d6701.pphosted.com; envelope-from=solon.fan@flex.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=flex.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=iZQLzYmL; dkim-atps=neutral
X-Greylist: delayed 5336 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jun 2020 13:31:12 AEST
Received: from mx08-002d6701.pphosted.com (mx08-002d6701.pphosted.com
 [185.183.28.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49crsY05zrzDqNx
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 13:31:12 +1000 (AEST)
Received: from pps.filterd (m0132499.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054206PB023988
 for <openbmc@lists.ozlabs.org>; Thu, 4 Jun 2020 02:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-transfer-encoding :
 mime-version : content-type; s=dkim;
 bh=mY1LfFGmAX8RVbiz/xejOOZzpE+i6rGT5bV1ZuBXvvQ=;
 b=iZQLzYmLQvrlLKsE26hzTZ9fuk1Xnga1L9AMfmx5+bfluM26PKO6M2tnmrQLE0aNFDLA
 4TEnRpuZy5mZzG1+xifyxBI0cXQHYClbRuBKfBwLzwNF5xcAIy8BN9Xkf/ygvWZSDzym
 y0suT68i97kPtQe+aXc/O50GsTDHc9ZVilO8iG5CIzkrsWs3seQ7/qG6XutQYS54f7Xm
 N+lUrn/Pdm+a2P3AOQOornzKu1bGKTxQDfoKMjhJ9jvEiAqkXhSrcZ3l8GZjmWwiNGbS
 /VfO4C/XsXsjr/507LILcP3yZ6zOx1G83dvH3XzPgPudgTs7+UIcyKR/eXT6BCCc2yY6 zg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx08-002d6701.pphosted.com with ESMTP id 31egfmsjy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2020 02:02:09 +0000
Received: from MWHPR01CA0047.prod.exchangelabs.com (2603:10b6:300:101::33) by
 BYAPR08MB4950.namprd08.prod.outlook.com (2603:10b6:a03:67::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.21; Thu, 4 Jun 2020 02:02:06 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::e9) by MWHPR01CA0047.outlook.office365.com
 (2603:10b6:300:101::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 02:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.237.140.178)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=pass action=none header.from=flex.com;
Received-SPF: Pass (protection.outlook.com: domain of flex.com designates
 18.237.140.178 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.237.140.178; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (18.237.140.178) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 02:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPQLLJY/qdostgRxfAAPt/JiRrn9J2/5ldVXalFeK/zN/rcOK8Pbe22VqiMlg5F2rSWnib2Ojkz3joUH9ik8HdBkUAJyqkX9nKcCcBRwzI5Xu1e19cZqgBxMVzPdzQQhzkmxW6+O6U4VTnhQFAnqgLN0uWZ+Xk1OVbGIQbZL50930eXOPxH+xpD3Jsu+3hZq6l0SD9u3hf7AAXCq9gQouW4lfGR0MFcJjVmOtgjFr3ss8mwXjhkdPebgfbRNuvfdTO3eC+tDeTmTaIbyY6Fri1MFOv2NNTbP6CFq1XRTvuNidrFJSqlgab0QIBW6DSw45nv3Itn/ZGa8SnNW6ZUcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0d/7Ul4kSAbv5sPhgXET7bC/a/cxU40XB07Y5t4C/Y=;
 b=dMKlOS7ud0O/xb9NbVTuHqg0VMJ/cFqkyyxpavIaxWZ6FceUA/RXe4rudwoM7tNAVcltJS3qieRrxB+n3c1xl6pbz71WnRMlm3qnrL9avRkrUEsokAeDV102MvLhehY0rHOfdKHDriGyL0I1EERszJAn8qYfMOx9vpgTkhpJwLponpr+JNKrW/QFXkw8CgwerbxGMfzdxOoltt00jcwkVs4JrZbUZGk1BvHNUcHR6IbfRzmAwf3ixXSHCfgUGeVTYbpdvy4FZywLtZjUOyQ64z7FjxoKB0rJ4Hh4JpwHPSlIVgY87f9oHFunzcnnxt/y7GlqqkdRsCFKC7jOGOMZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from BN6PR08MB2563.namprd08.prod.outlook.com (2603:10b6:404:bd::21)
 by BN6PR08MB3411.namprd08.prod.outlook.com (2603:10b6:405:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Thu, 4 Jun
 2020 02:02:03 +0000
Received: from BN6PR08MB2563.namprd08.prod.outlook.com
 ([fe80::9910:d4be:2edc:7889]) by BN6PR08MB2563.namprd08.prod.outlook.com
 ([fe80::9910:d4be:2edc:7889%11]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 02:02:03 +0000
From: Solon Fan <Solon.Fan@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: openbmc Digest, Vol 58, Issue 16
Thread-Topic: openbmc Digest, Vol 58, Issue 16
Thread-Index: AQHWOhQBSZjhnPziAEilOxEWPc33SKjHtApQ
Date: Thu, 4 Jun 2020 02:02:02 +0000
Message-ID: <BN6PR08MB25636264CA3890038B0826CC94890@BN6PR08MB2563.namprd08.prod.outlook.com>
References: <mailman.13.1591236005.24422.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.13.1591236005.24422.openbmc@lists.ozlabs.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-originating-ip: [158.116.222.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87069d2c-2a74-48bf-2177-08d8082b4844
x-ms-traffictypediagnostic: BN6PR08MB3411:|BYAPR08MB4950:
X-Microsoft-Antispam-PRVS: <BYAPR08MB49506DCE37BC9869B9775EA894890@BYAPR08MB4950.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: O3crR18mCDDxNagAucrsmI7hpwTT135L9PraV9ipai2tSgQGO5losAFBTTG+oa1ovANp/WyQswBA/s1LqhcZdjidq+QAwPejPr/cyjcoYiLORBeJFl5AXorGeYf1cIf4KZoEGjhjiGlvFTEPNTsYRnfWU9+mavvcGS6Yd4ChhlWIdF9qgEsfXAALRNSltGqUrXHhwV6c3lBDtTU+2w/Q6b/bCf3UTQtrnmVkPrg42uwNLOAZGkFVj4RwSoolIKjQSPKbaqu5dvToX5n8B33dYHoEaXa+2Rs/jHPMNpluVDC2OVg/9EzokQIbpkvGtMFSqy9rww/e/iOC78HmJjyjJfLzEVSgdinsYxt56KDLKCrmhj2Pt/lY/0TUYtT4+h/hlrd+Sd9qgDl0emYWec2cLA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:BN6PR08MB2563.namprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(396003)(136003)(346002)(39860400002)(366004)(376002)(186003)(83380400001)(76116006)(33656002)(26005)(6506007)(8936002)(53546011)(8676002)(66476007)(64756008)(86362001)(52536014)(66446008)(66946007)(66556008)(5660300002)(7696005)(966005)(55016002)(2906002)(478600001)(71200400001)(316002)(6916009)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TKtt8+Aje6VlOqyy9ZZrWR28Blv4va/2SD/nWAMHoWxJ+sMQLzov8uudK4IpT7tDUFI1X6+caB0on0C5Aif0BmXW5FB5Fr64vSQ5lNTJ0DV/dfndLHlEqNoWKTleNo8hYmNK2pbanbW4VnQmyNC2XGxq9xtvd+pg3Wn+6OSKcxGNCeOF178L1hDkZ0XWpd8lUV7mOccQgJ0Dp3OcaGIKFkRhyaxi8OSC14mzp/h7tPHNy6H99qVTBHqRuugjx6N8llq9mzYP7S6OTs8o128i3rGMg/hIpjgiifiLAHgsLd94JV9MLEhJIVV61RuSIom6RZmzOrtwxwmv5kwavpu+R2i3ngtzYJOBs9+e/jB/6xPBePon8UtYADrmdowc9vcJ/LFITzynUMKx69K+ALcmSI9qXFkKPCpJE3NNgBCntuR6WkksqYlNeHImQSDEfaDcrOjpPHm2ILS37inWlrVpzUaPH/Wj/Uchf+QDVdFjuWYHa0E7ArHnhVbczYVuz6OF
x-ms-exchange-transport-forked: True
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3411
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:18.237.140.178; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:p01c.mail.dlp.protect.symantec.com; CAT:NONE; SFTY:;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(46966005)(9686003)(5660300002)(86362001)(8676002)(83380400001)(55016002)(8936002)(82740400003)(45080400002)(6506007)(316002)(70206006)(52536014)(6916009)(966005)(47076004)(70586007)(33656002)(356005)(53546011)(186003)(7636003)(2906002)(26005)(478600001)(7696005)(336012)(82310400002);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 18396ad7-fbb3-4b4f-f91b-08d8082b4662
X-Forefront-PRVS: 04244E0DC5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f9DCUxv1xaiS8O1j8zYHoL7GI+LnEK2x9uAKqG0z+VS3vHfwKsQetHTXHw9fTbfNkefWICn8z24XAnDr9ZpPw3mPhijiTBEU9ayJWT7xQQLTJ5YB4uaKZB3+28YxDHuDfaeuSRie3WhFq3lWnpNODQbxqdj8OppVorMGGueg6f6i6C5YOIg0jx5a1JGBlZJKiJbezHpc1z9cKrr2uHqk30ho8N9r9+ar6y3UirTgw65LH9J3NdZUwghgI+Xm5c+1RtNBOWUr0gfjpkNpe8zymFgX36SNr3WA/Ed9kGLTEEod1xibHZzacISaUmxEzL61oUU/pjLC61PYhMchXMeDEO96vIfxf3hg+DrN1ILbSHt6RBlnurUaTV+gP12sKa237hNUyv2zWOAhKbPoKkPEFf7IcSPc0/hd5xDIsxyKGVrdBy+Ox3i//kLpIge5lxGEl1KDt0OBNgjqR1ZAAC6LszpwB0/R9JMYpHGK2NxYf5E=
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 02:02:05.8057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87069d2c-2a74-48bf-2177-08d8082b4844
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[18.237.140.178];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4950
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 impostorscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040011
Content-Type: text/plain; charset="utf-8"
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

UkU6IEhlbGxvIHRvIE9wZW5CTUMgVGVhbSAoR2FycmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJt
d2FyZSkpDQoNCktpbmQgUmVnYXJkcw0KDQpTb2xvbiBGYW4NCkNDUyBEZXNpZ24gQk1DDQoNCjRG
LCBCbGRnLiAxMCwgTm8uIDMwMDAgTG9uZ2RvbmcgQXZlLiwNClB1ZG9uZyBOZXcgRGlzdHJpY3Qs
IFNoYW5naGFpIDIwMTIwMywgQ2hpbmENCmRpcmVjdDogKzg2IDAyMSAyMDgyMTYwMCBFeHQgMTQw
Mg0KbW9iaWxlOiArODYgMTg2MDYyMjA4ODUNCg0KwqDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJt
Yy1ib3VuY2VzK3NvbG9uLmZhbj1mbGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYg
T2Ygb3BlbmJtYy1yZXF1ZXN0QGxpc3RzLm96bGFicy5vcmcNClNlbnQ6IDIwMjDlubQ25pyINOaX
pSAxMDowMA0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogb3BlbmJtYyBE
aWdlc3QsIFZvbCA1OCwgSXNzdWUgMTYNCg0KU2VuZCBvcGVuYm1jIG1haWxpbmcgbGlzdCBzdWJt
aXNzaW9ucyB0bw0KCW9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KDQpUbyBzdWJzY3JpYmUgb3Ig
dW5zdWJzY3JpYmUgdmlhIHRoZSBXb3JsZCBXaWRlIFdlYiwgdmlzaXQNCglodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL29wZW5ibWNf
XzshIUhTbnRsQ2chQTE1Y19CMGRRTjFaMzNzck1CUXg4bEhrZEJ6RnhuZ3ZkRUoyTkphQzhrOWlU
R1lJTXdWcUJkWVBPWEpPcFBnJA0Kb3IsIHZpYSBlbWFpbCwgc2VuZCBhIG1lc3NhZ2Ugd2l0aCBz
dWJqZWN0IG9yIGJvZHkgJ2hlbHAnIHRvDQoJb3BlbmJtYy1yZXF1ZXN0QGxpc3RzLm96bGFicy5v
cmcNCg0KWW91IGNhbiByZWFjaCB0aGUgcGVyc29uIG1hbmFnaW5nIHRoZSBsaXN0IGF0DQoJb3Bl
bmJtYy1vd25lckBsaXN0cy5vemxhYnMub3JnDQoNCldoZW4gcmVwbHlpbmcsIHBsZWFzZSBlZGl0
IHlvdXIgU3ViamVjdCBsaW5lIHNvIGl0IGlzIG1vcmUgc3BlY2lmaWMgdGhhbiAiUmU6IENvbnRl
bnRzIG9mIG9wZW5ibWMgZGlnZXN0Li4uIg0KDQoNClRvZGF5J3MgVG9waWNzOg0KDQogICAxLiBS
ZTogW1BBVENIIHYxNCAwLzNdIGkyYzogbnBjbTd4eDogYWRkIE5QQ00gaTJjIGNvbnRyb2xsZXIN
CiAgICAgIGRyaXZlciAoV29sZnJhbSBTYW5nKQ0KICAgMi4gUkU6IEhlbGxvIHRvIE9wZW5CTUMg
VGVhbSAoR2FycmV0dCwgTWlrZSAoSFBFIFNlcnZlciBGaXJtd2FyZSkpDQoNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KDQpNZXNzYWdlOiAxDQpEYXRlOiBXZWQsIDMgSnVuIDIwMjAgMjI6MjU6NTMgKzAyMDAN
CkZyb206IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+DQpUbzogVGFsaSBQZXJyeSA8
dGFsaS5wZXJyeTFAZ21haWwuY29tPg0KQ2M6IG9mZXJ5QGdvb2dsZS5jb20sIGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20sDQoJYXZpZmlzaG1hbjcwQGdtYWlsLmNvbSwgdG1haW1vbjc3QGdtYWls
LmNvbSwga2Z0aW5nQG51dm90b24uY29tLA0KCXZlbnR1cmVAZ29vZ2xlLmNvbSwgeXVlbm5AZ29v
Z2xlLmNvbSwgYmVuamFtaW5mYWlyQGdvb2dsZS5jb20sDQoJcm9iaCtkdEBrZXJuZWwub3JnLCBh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20sDQoJbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnLCBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnLA0KCW9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsDQoJbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZywga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIIHYxNCAwLzNdIGkyYzogbnBjbTd4eDogYWRkIE5QQ00gaTJjIGNvbnRy
b2xsZXINCglkcml2ZXINCk1lc3NhZ2UtSUQ6IDwyMDIwMDYwMzIwMjU1My5HQjc2ODRAa3VuYWk+
DQpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9InVzLWFzY2lpIg0KDQpPbiBXZWQs
IE1heSAyNywgMjAyMCBhdCAxMTowODoxN1BNICswMzAwLCBUYWxpIFBlcnJ5IHdyb3RlOg0KPiBU
aGlzIHBhdGNoIHNldCBhZGRzIGkyYyBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHRoZSBOdXZvdG9u
IE5QQ00gDQo+IEJhc2Vib2FyZCBNYW5hZ2VtZW50IENvbnRyb2xsZXIgKEJNQykuDQo+IA0KPiBO
UENNN3h4IGluY2x1ZGVzIDE2IEkyQyBjb250cm9sbGVycy4gVGhpcyBkcml2ZXIgb3BlcmF0ZXMg
dGhlIGNvbnRyb2xsZXIuDQo+IFRoaXMgbW9kdWxlIGFsc28gaW5jbHVkZXMgYSBzbGF2ZSBtb2Rl
Lg0KPiANCj4gLS0tDQo+IHYxNCAtPiB2MTM6DQo+IAktIEZpeCB5YW1sIGV4YW1wbGU6IGFkZCBt
aXNzaW5nIGluY2x1ZGUuDQo+IAktIFJlcGxhY2UgYWxsIHVkZWxheSB0byB1c2xlZXBfcmFuZ2Us
IGV4Y2VwdCBvbmUgd2hpY2ggaXMgY2FsbGVkIGZyb20NCj4gCSAgaXJxLg0KPiAJLSBGaXggY29t
cGlsYXRpb24gZXJyb3IgKG1vZHVsZV9wbGF0ZnJvbV9pbml0IGNvbmZsaWN0KS4NCj4gCS0gZGVi
dWdmcyBjb3VudGVycyBhbHdheXMgdXBkYXRlZC4gQ291bnRpbmcgdGlsbCBtYXggdmFsdWUsDQo+
IAkgIHRoZW4gc3RvcCBjb3VudGluZy4NCj4gCS0gUmVuYW1lIGJ1cy1mcmVxdWVuY3kgdG8gY2xv
Y2stZnJlcXVlbmN5Lg0KPiAJLSBSZW1vdmUgdW51c2VkIHZhcmlhYmxlcy4NCg0KSSBkb24ndCBo
YXZlIHRpbWUgZm9yIGEgZGVlcGVyIHJldmlldywgYnV0IGZyb20gd2hhdCBJIGNhbiB0ZWxsIHRo
aXMgZHJpdmVyIGlzIGdvb2QgdG8gZ28gYW5kIHdlIGNhbiBmaXggdGhpbmdzIGluY3JlbWVudGFs
bHkgZnJvbSBub3cgb24uDQoNCkFwcGxpZWQgdG8gZm9yLW5leHQgKHdpbGwgZ28gaW50byA1Ljgp
LCB0aGFua3MhDQoNCi0tLS0tLS0tLS0tLS0tIG5leHQgcGFydCAtLS0tLS0tLS0tLS0tLQ0KQSBu
b24tdGV4dCBhdHRhY2htZW50IHdhcyBzY3J1YmJlZC4uLg0KTmFtZTogc2lnbmF0dXJlLmFzYw0K
VHlwZTogYXBwbGljYXRpb24vcGdwLXNpZ25hdHVyZQ0KU2l6ZTogODMzIGJ5dGVzDQpEZXNjOiBu
b3QgYXZhaWxhYmxlDQpVUkw6IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2xp
c3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvYXR0YWNobWVudHMvMjAyMDA2MDMvOThi
YjE2ZjIvYXR0YWNobWVudC0wMDAxLnNpZ19fOyEhSFNudGxDZyFBMTVjX0IwZFFOMVozM3NyTUJR
eDhsSGtkQnpGeG5ndmRFSjJOSmFDOGs5aVRHWUlNd1ZxQmRZUFFwbUtlakEkID4NCg0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCk1lc3NhZ2U6IDINCkRhdGU6IFdlZCwgMyBKdW4g
MjAyMCAxOTozNjo1MyArMDAwMA0KRnJvbTogIkdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmly
bXdhcmUpIiA8bWlrZS5nYXJyZXR0QGhwZS5jb20+DQpUbzogQnJhZCBCaXNob3AgPGJyYWRsZXli
QGZ1enppZXNxdWlycmVsLmNvbT4sDQoJIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4NCkNjOiAiU2hhZmZlciwgU2NvdHQiIDxzY290dC5zaGFmZmVy
QGhwZS5jb20+LCAiVmVyZHVuLCBKZWFuLU1hcmllIg0KCTxqZWFuLW1hcmllLnZlcmR1bkBocGUu
Y29tPiwgIkNpc25lcm9zLCBKb3JnZSAoR2VvcmdlKSINCgk8am9yZ2UuY2lzbmVyb3NAaHBlLmNv
bT4sICJSb2RnZXJzLCBSZW5lZSIgPHJlbmVlLnJvZGdlcnNAaHBlLmNvbT4sDQoJIkNodW5nLCBK
b2huIChUV04gaUxPKSIgPGpvaG4uY2h1bmdAaHBlLmNvbT4sICJDaGVuLCBHaWxiZXJ0Ig0KCTxn
aWxiZXJ0LmNoZW5AaHBlLmNvbT4sICJOZXdtYW4sIEVkd2FyZCAoaUxPIEZpcm13YXJlKSINCgk8
ZWR3YXJkLm5ld21hbkBocGUuY29tPg0KU3ViamVjdDogUkU6IEhlbGxvIHRvIE9wZW5CTUMgVGVh
bQ0KTWVzc2FnZS1JRDoNCgk8REY0UFI4NDAxTUIxMTQ1RjJGMUUwRjY2RTdEQTYzM0Q4NUY4Rjg4
MEBERjRQUjg0MDFNQjExNDUuTkFNUFJEODQuUFJPRC5PVVRMT09LLkNPTT4NCgkNCkNvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD0idXRmLTgiDQoNCkhpIEJyYWQsDQoNCk91ciB0aGlu
a2luZyBpcyB0byBzZXQgdXAgcHVibGljIGZvcmtzICJjbG9zZSB0byBob21lIiB0aGF0IHdlIGNh
biB3b3JrIHJhcGlkbHkgaW4gYW5kIHNpbXVsdGFuZW91c2x5IHdvcmsgdG8gdXBzdHJlYW0gcGF0
Y2hlcyBmb3IgVS1ib290LCBMaW51eCwgYW5kIE9wZW5CTUMgdG8gdGhlIG1haW4gcmVwb3MuICBU
aGUgZm9ya3MgYXJlIGN1cnJlbnRseSB1bm1vZGlmaWVkIGJ1dCB0aGF0IHdpbGwgY2hhbmdlIHNv
b24gYXMgd2Ugc3RhcnQgbW92aW5nIG91ciBtb2RzIG91dCBvZiBvdXIgcHJpdmF0ZSByZXBvcy4N
Cg0KSSBzaG91bGQgYmUgY2xlYXIgdGhhdCB0aGUgREwzNjBzIHdlIGFyZSB1c2luZyBhcmUgbW9k
aWZpZWQgZnJvbSB0aGUgb2ZmLXRoZS1zZWxmIEhQRSBHZW4xMCBzZXJ2ZXJzIGJlY2F1c2Ugb2Yg
b3VyIHNpbGljb24gcm9vdCBvZiB0cnVzdCB0ZWNobm9sb2d5LiAgVGhlIENJIHN5c3RlbSB0aGF0
IEplYW4tTWFyaWUgaGFzIHNldCB1cCBpcyBvbmUgb2YgdGhlc2UgbW9kaWZpZWQgc3lzdGVtcy4N
Cg0KVGhhbmtzLA0KDQpNaWtlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBC
cmFkIEJpc2hvcCBbbWFpbHRvOmJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbV0NClNlbnQ6IFdl
ZG5lc2RheSwgSnVuZSAzLCAyMDIwIDI6MjQgUE0NClRvOiBHYXJyZXR0LCBNaWtlIChIUEUgU2Vy
dmVyIEZpcm13YXJlKSA8bWlrZS5nYXJyZXR0QGhwZS5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcNCkNjOiBTaGFmZmVyLCBTY290dCA8c2NvdHQuc2hhZmZlckBocGUuY29tPjsgVmVyZHVu
LCBKZWFuLU1hcmllIDxqZWFuLW1hcmllLnZlcmR1bkBocGUuY29tPjsgQ2lzbmVyb3MsIEpvcmdl
IChHZW9yZ2UpIDxqb3JnZS5jaXNuZXJvc0BocGUuY29tPjsgUm9kZ2VycywgUmVuZWUgPHJlbmVl
LnJvZGdlcnNAaHBlLmNvbT47IENodW5nLCBKb2huIChUV04gaUxPKSA8am9obi5jaHVuZ0BocGUu
Y29tPjsgQ2hlbiwgR2lsYmVydCA8Z2lsYmVydC5jaGVuQGhwZS5jb20+OyBOZXdtYW4sIEVkd2Fy
ZCAoaUxPIEZpcm13YXJlKSA8ZWR3YXJkLm5ld21hbkBocGUuY29tPg0KU3ViamVjdDogUmU6IEhl
bGxvIHRvIE9wZW5CTUMgVGVhbQ0KDQpPbiBUdWUsIDIwMjAtMDYtMDIgYXQgMjA6NTYgKzAwMDAs
IEdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdhcmUpDQp3cm90ZToNCj4gSGVsbG8gT3Bl
bkJNQyB0ZWFtLA0KPiANCj4gTXkgbmFtZSBpcyBNaWtlIEdhcnJldHQgYW5kIEkgd29yayB3aXRo
IGEgdGVhbSBhdCBIZXdsZXR0IFBhY2thcmQNCg0KV2VsY29tZSBNaWtlIGFuZCBIUEUuDQoNCg0K
PiBFbnRlcnByaXNlIGNyZWF0aW5nIGEgcG9ydCBvZiBPcGVuQk1DIG9uIG91ciBzZXJ2ZXIgaGFy
ZHdhcmUuICBXZSBoYXZlIA0KPiBqdXN0IHNpZ25lZCB0aGUgQ0NMQSAoYXR0YWNoZWQpIGFuZCB1
cGxvYWRlZCBpdC4gIFdlIGxvb2sgZm9yd2FyZCB0byANCj4gd29ya2luZyB3aXRoIHRoZSBPcGVu
Qk1DIGNvbW11bml0eS4NCg0KTGlrZXdpc2UhDQoNCj4gDQo+IFRvIGludHJvZHVjZSBteXNlbGYs
IEkgYW0gYSBmaXJtd2FyZSBhcmNoaXRlY3QgaW4gSFBFJ3MgY29tcHV0ZSBncm91cCANCj4gd2l0
aCBhIGJhY2tncm91bmQgaW4gQklPUyBhbmQgQk1DIGZpcm13YXJlLiAgVGhlcmUgd2lsbCBiZSBh
IGZldyBvdGhlciANCj4gZm9sa3Mgb24gb3VyIHRlYW0gd29ya2luZyB3aXRoIG1lLCBhbGwgd2l0
aCBCTUMgZGV2ZWxvcG1lbnQgDQo+IGV4cGVyaWVuY2UuDQo+IA0KPiBUaGUgdGVhbSBoYXMgY3Jl
YXRlZCBhIHBvcnQgb2YgT3BlbkJNQyBmb3Igb3VyIERMMzYwIDItc29ja2V0IDFVIHJhY2sgDQo+
IHNlcnZlciB0aGF0IHJ1bnMgaW4gcGxhY2Ugb2Ygb3VyIGlMTyA1IGZpcm13YXJlLg0KDQpJcyB0
aGlzIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vSGV3bGV0
dFBhY2thcmQvb3BlbmJtYz9fXzshIUhTbnRsQ2chQTE1Y19CMGRRTjFaMzNzck1CUXg4bEhrZEJ6
RnhuZ3ZkRUoyTkphQzhrOWlUR1lJTXdWcUJkWVA5TXk0dTU0JCAgIFRoYW5rcyBmb3IgbGVhdmlu
ZyB0aGUgYXR0cmlidXRpb24gdG8gdGhlIHVwc3RyZWFtIHByb2plY3QgKCJmb3JrZWQgZnJvbSBv
cGVuYm1jL29wZW5ibWMiKS4NCg0KPiBUaGlzIGhhcyBiZWVuIHNob3duIGFzIGEgcHJvb2Ygb2Yg
Y29uY2VwdCBhdCBhIGZldyB2ZW51ZXMgaW5jbHVkaW5nIA0KPiBtb3N0IHJlY2VudGx5IHRoZSBP
Q1AgVmlydHVhbCBTdW1taXQgYSBjb3VwbGUgb2Ygd2Vla3MgYWdvLiAgSmVhbi0gDQo+IE1hcmll
IFZlcmR1biBoYXMgdXNlZCB0aGlzIHByb29mIG9mIGNvbmNlcHQgYXMgdGhlIHVuZGVybHlpbmcg
aGFyZHdhcmUgDQo+IGZvciBhbiBPcGVuIFNvdXJjZSBGaXJtd2FyZSBDSSBzeXN0ZW0uICBXZSBo
b3BlIHRvIHRoZSB1cHN0cmVhbSB0aGUgDQo+IE9wZW5CTUMgd29yayBzb29uLg0KDQpBd2Vzb21l
IQ0KDQo+IA0KPiBJIGJlbGlldmUgdGhlIG5leHQgcmVxdWVzdCBpcyB0byBhc2sgZm9yIHRlYW0g
bWVtYmVycyB0byBiZSBhZGRlZCB0byANCj4gdGhlIGdlcnJpdCBzeXN0ZW0/DQoNCkFsbCB5b3Ug
bmVlZCB0byBsb2cgaW4gdG8gR2Vycml0IGFuZCBzdWJtaXQgY29kZSBpcyBhIGdpdGh1YiBhY2Nv
dW50Lg0KDQpUbyBoYXZlIHlvdXIgY29kZSBhdXRvbWF0aWNhbGx5IHRlc3RlZCBieSB0aGUgQ0kg
c3lzdGVtLCB5b3UgZG8gbmVlZCB0byBiZSBvbiBhbiBBQ0wgLSBJJ2xsIHNldCB0aGF0IHVwIGFz
IHNvb24gYXMgeW91IGxvZyBpbnRvIGdlcnJpdC4NCg0KdGh4IC0gYnJhZA0KDQpFbmQgb2Ygb3Bl
bmJtYyBEaWdlc3QsIFZvbCA1OCwgSXNzdWUgMTYNCioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKg0KCkxlZ2FsIERpc2NsYWltZXIgOgpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiAK
SXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0
eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCAKb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSBy
ZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCAKeW91
IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4g
YW55IGZvcm0sIAppcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIApwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5k
ZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2FnZSEK
