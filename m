Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFAEBB96
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 02:06:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4743sf10k0zF6Th
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 12:05:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6208c0c36a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="CeBAhAzC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="H+WUOFpQ"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4743rn3BxyzF6TT
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 12:05:08 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA113tKK016802; Thu, 31 Oct 2019 18:05:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=nVBdzxtgbkzrMvgolfMDx/IqVSqPlMa0UaZJElh4Rdg=;
 b=CeBAhAzCmZNE7EzOv0U5cvhT0zve8+tfx6YJWqb07vApb9oMFgcmsKALjAnx2tsUluCU
 5NSBDlviAnicqjnrXhe5osEdf9cel8Rv51Caix6lob/csE7EsJX0A4nfd7hAclZLcxrI
 zjPhm66kPutwEPtAB37fw3ilp3/MMe3jfyc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w00t5367g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 18:05:03 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 31 Oct 2019 18:05:02 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 31 Oct 2019 18:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7C7G3JRaFZIF4ZxLgtOO0LSrERClcH2VuP8WpVmu9s1AY1GnGQqv+IOtzastWIkJjgoGLsW4PguyUoy2jonbsPjAnl1E7XNSTdw7zvl9pPJ2g8VxYIaH5tiXC/2PKigBA4Z6C3DGIcQZBkp+rzpb9m/cUKlqI79Yon+5kA0ZH/7C+SdJgnOfYD1uOoJQ+rdnZ8zkeJRH8yjSUx1guu2rctQ2j4sdcNbeePj6ZfN8dH6765lwwtNCDC6d9EPt0TLUz0iMbx+iAOiGmhVqrinSwOULnoJASKOz1DWT8sGAP+7GomBGkZPqaLu5LwcBqwc0khySeKcqErWCvYgc7tZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVBdzxtgbkzrMvgolfMDx/IqVSqPlMa0UaZJElh4Rdg=;
 b=METJXZoHi5OM8H5ZxThVNu90iyyTVr7HDNXrXEAz8xubZ2AdDfL4hudXAWqU6VtXvxhftXnsUfGNi3/5kHG1zZ9q16X7tNLao/LxOs1ij/QthUW+f9aCRVOwil5jMMv61DXWQKiyAl3pG/i/v6aJVkFP6EsocuU7gyuRsR7PxBbqjOFlq3yDeu2M+dANcZDZN+N9bw65/5tEn3umd1e1vk5S7Yrja4SQTPQj5fE3H+55E9yBtMZOaZ+0LBUVi13FUUS69PbeppwN5bHEKLHw+EDDCeysBC9oUzhxo2R5miRBHikNLURWFZhSBzNkf1TtEL9l7vYgtyUIZLBcEGMPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVBdzxtgbkzrMvgolfMDx/IqVSqPlMa0UaZJElh4Rdg=;
 b=H+WUOFpQa0+40zkBD5i1YxlT48GfQ4Dk6DoNJRYmGPFB+9dxWazPQCQf6qLVhhm8m+47y0Shvo5Kzwr+aKUpWyv+VUHIlGSjySA13qHYew8EQ32OgNQ80LgLWzvYsCeqD9O2psJvNNoWLb2AgvndUF5mC1Gn8NqRw84H8ZRRDdo=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3620.namprd15.prod.outlook.com (52.133.252.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 1 Nov 2019 01:05:01 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2408.018; Fri, 1 Nov 2019
 01:05:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>
Subject: kernel patch pull for IPV6
Thread-Topic: kernel patch pull for IPV6
Thread-Index: AQHVkFBjJJRSJCw2LkGpdAU+nnKGPw==
Date: Fri, 1 Nov 2019 01:05:01 +0000
Message-ID: <06422EF3-4D9D-4880-99EA-513C41215F37@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:905a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95bc9296-5d6f-477a-11f0-08d75e6785ce
x-ms-traffictypediagnostic: BY5PR15MB3620:
x-microsoft-antispam-prvs: <BY5PR15MB36207BBE4750BBBA38B4BDE4DD620@BY5PR15MB3620.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(376002)(366004)(136003)(39860400002)(346002)(396003)(199004)(189003)(76116006)(486006)(6512007)(71200400001)(2501003)(5660300002)(2616005)(2906002)(86362001)(478600001)(476003)(14454004)(6436002)(6486002)(6116002)(54896002)(91956017)(36756003)(8676002)(4744005)(6306002)(81156014)(46003)(6506007)(66446008)(66946007)(99286004)(9326002)(102836004)(71190400001)(316002)(66476007)(7736002)(81166006)(66556008)(64756008)(256004)(8936002)(186003)(110136005)(33656002)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3620;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IcicHJVDmu7TYB+dmegcMCGwR6hwMdMrunaFm6vCkORVq4Kpi6emXmwpeWGqFx5TISCIxyew3C9lMVAEinYhryC23HzJo61BHH52Zg68hzwM9r9tB2J2X9Pnf0p1/xlUy0F8S8P6/UNtdeN4hIa8KiLoL3jYUr8F0H3k5Wo7OO0008ECp/5Vo72IKVIyBj1vo/BdtUrUqkxcec+N5Njcft9mhbUrx2Wbw7waI7/wOpAMpjRZt57aBFk2QFKqwEasrYlwMd0fGim/ZnEordJEP/KukV5pfyaDe+Dv57dcKUmPoMsUbC8HMtJVA9IiL697Lp3iUI/1K3QpBr4MkkrI6vsOpylKxjAV2R46BQYLpHeSG70mllrWM/nPniaRjaXoVC8n2IVX6drN+MnIJryxmX8ST2y6Cvm/STt56e6wwHxxy3PL8bXbbZevDKhxNQWv
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_06422EF34D9D488099EA513C41215F37fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bc9296-5d6f-477a-11f0-08d75e6785ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 01:05:01.4392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7pfOEWQ1pa3hT7bGc08tO6R0XojRoxP7Oe1nIDyXw7OH3oHvX9KttHd3aMYWj02IeaYJ9ARxteCG7TKOP7Zjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3620
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_08:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1911010007
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

--_000_06422EF34D9D488099EA513C41215F37fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgZm9sbG93aW5nIHBhdGNoIHRvIG91ciBvcGVu
Ym1jIGtlcm5lbCBmcm9tIGxpbnV4LW5leHQgcmVwb3NpdG9yeS4NCg0KDQpjb21taXQgY2YwZWJh
MzM0MjY4NTYzMTUyZTRhOGJjOWFiODY1ZDAwMzdhNzk0OA0KDQpBdXRob3I6IFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPg0KDQpEYXRlOiAgIFRodSBTZXAgMTIgMTI6MDQ6NTAgMjAx
OSAtMDcwMA0KDQoNCg0KICAgIG5ldC9uY3NpOiBEaXNhYmxlIGdsb2JhbCBtdWx0aWNhc3QgZmls
dGVyDQoNCg0KY29tbWl0IDg4ODI0ZTNiZjI5YTJmY2FjZmQ5ZWJiZmUwMzA2MzY0OWYwZjMyNTQN
Cg0KQXV0aG9yOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5v
cmc+DQoNCkRhdGU6ICAgRnJpIE9jdCAyNSAxMzo0NzoyNCAyMDE5ICsxMTAwDQoNCg0KDQogICAg
bmV0OiBldGhlcm5ldDogZnRnbWFjMTAwOiBGaXggRE1BIGNvaGVyZW5jeSBpc3N1ZSB3aXRoIFNX
IGNoZWNrc3VtDQoNCg0KDQpSZWdhcmRzLA0KLVZpamF5DQo=

--_000_06422EF34D9D488099EA513C41215F37fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <ED909E542B4F4F4190480A82B2EF9D65@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnAuTXNvTGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwgZGl2Lk1z
b0xpc3RQYXJhZ3JhcGgNCgl7bXNvLXN0eWxlLXByaW9yaXR5OjM0Ow0KCW1hcmdpbi10b3A6MGlu
Ow0KCW1hcmdpbi1yaWdodDowaW47DQoJbWFyZ2luLWJvdHRvbTowaW47DQoJbWFyZ2luLWxlZnQ6
LjVpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28t
c3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KcC5wMSwgbGkucDEsIGRpdi5wMQ0KCXttc28t
c3R5bGUtbmFtZTpwMTsNCgltYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglm
b250LXNpemU6OC41cHQ7DQoJZm9udC1mYW1pbHk6TWVubG87DQoJY29sb3I6I0FBQUIyNTt9DQpw
LnAyLCBsaS5wMiwgZGl2LnAyDQoJe21zby1zdHlsZS1uYW1lOnAyOw0KCW1hcmdpbjowaW47DQoJ
bWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZTo4LjVwdDsNCglmb250LWZhbWlseTpN
ZW5sbzsNCgljb2xvcjpibGFjazt9DQpwLnAzLCBsaS5wMywgZGl2LnAzDQoJe21zby1zdHlsZS1u
YW1lOnAzOw0KCW1hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6
ZTo4LjVwdDsNCglmb250LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpzcGFuLnMxDQoJ
e21zby1zdHlsZS1uYW1lOnMxO30NCnNwYW4uYXBwbGUtY29udmVydGVkLXNwYWNlDQoJe21zby1z
dHlsZS1uYW1lOmFwcGxlLWNvbnZlcnRlZC1zcGFjZTt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28t
c3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
Zjt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEu
MGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLyogTGlzdCBEZWZpbml0aW9ucyAqLw0KQGxpc3QgbDANCgl7bXNvLWxpc3QtaWQ6
MTY0ODE5NTQyNzsNCgltc28tbGlzdC10eXBlOmh5YnJpZDsNCgltc28tbGlzdC10ZW1wbGF0ZS1p
ZHM6MTczMzk3MTY1MiA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcx
MyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNTt9DQpAbGlzdCBsMDpsZXZlbDEN
Cgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjps
ZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDINCgl7bXNvLWxldmVs
LW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMDpsZXZlbDMNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdo
dDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxpc3QgbDA6bGV2ZWw0DQoJe21zby1sZXZlbC10
YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWlu
ZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw1DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0
OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw2
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRl
bnQ6LTkuMHB0O30NCkBsaXN0IGwwOmxldmVsNw0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsN
Cgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30N
CkBsaXN0IGwwOmxldmVsOA0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsN
Cgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxl
ZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsOQ0KCXttc28tbGV2ZWwt
bnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpv
bA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQp1bA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQotLT48
L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5r
PSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgSm9lbCw8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+Q2FuIHlvdSBwbGVhc2UgcHVsbCBmb2xsb3dpbmcgcGF0Y2ggdG8gb3VyIG9wZW5ibWMg
a2VybmVsIGZyb20gbGludXgtbmV4dCByZXBvc2l0b3J5LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+
Y29tbWl0IGNmMGViYTMzNDI2ODU2MzE1MmU0YThiYzlhYjg2NWQwMDM3YTc5NDg8L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0icDIiPjxzcGFuIGNsYXNzPSJzMSI+QXV0aG9yOiBWaWph
eSBLaGVta2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDs8L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0icDIiPjxzcGFuIGNsYXNzPSJzMSI+RGF0ZTogPC9zcGFuPjxzcGFuIGNsYXNz
PSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOw0KPC9zcGFuPjxzcGFuIGNsYXNzPSJzMSI+
VGh1IFNlcCAxMiAxMjowNDo1MCAyMDE5IC0wNzAwPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9InAzIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMiI+PHNwYW4gY2xh
c3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xh
c3M9InMxIj5uZXQvbmNzaTogRGlzYWJsZSBnbG9iYWwgbXVsdGljYXN0IGZpbHRlcjwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxz
cGFuIGNsYXNzPSJzMSI+Y29tbWl0IDg4ODI0ZTNiZjI5YTJmY2FjZmQ5ZWJiZmUwMzA2MzY0OWYw
ZjMyNTQ8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDIiPjxzcGFuIGNsYXNzPSJz
MSI+QXV0aG9yOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0ICZsdDtiZW5oQGtlcm5lbC5jcmFzaGlu
Zy5vcmcmZ3Q7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFz
cz0iczEiPkRhdGU6IDwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4m
bmJzcDsNCjwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPkZyaSBPY3QgMjUgMTM6NDc6MjQgMjAxOSAm
IzQzOzExMDA8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDMiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNw
YWNlIj4mbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPm5ldDogZXRoZXJuZXQ6
IGZ0Z21hYzEwMDogRml4IERNQSBjb2hlcmVuY3kgaXNzdWUgd2l0aCBTVyBjaGVja3N1bTwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMyI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZl
cnRlZC1zcGFjZSI+Jm5ic3A7Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5SZWdhcmRzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_06422EF34D9D488099EA513C41215F37fbcom_--
