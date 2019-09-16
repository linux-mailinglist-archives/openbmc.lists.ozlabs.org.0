Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975AB411F
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 21:27:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XGTh1nr1zF3V8
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 05:27:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=416284063b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="NeUtjI4p"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QBoFNDSw"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XGSv6c24zF37N;
 Tue, 17 Sep 2019 05:26:38 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8GJMhmx027557;
 Mon, 16 Sep 2019 12:26:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=ogR1zpt2cCVDBmLh/EmDzj/QvaVpOWrRD/EnZGk4ghU=;
 b=NeUtjI4pi4JD/3EpQbsoxagML3uWIJSLY2GTIsLeo5qkrfDFXpHkBeOAmpZW5A7DlpZ4
 dJxZv7y48vAT0oniP7OfxUGHvHvHff9vjuSGZKWri+v9xWIvgDjLnQWBgYftRy1e2bWV
 if4FlU1qLp4+FXoWU6fVkD0e/Q1Dw2PWMCk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2v21jpbd5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 12:26:30 -0700
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 16 Sep 2019 12:26:29 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 16 Sep 2019 12:26:28 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Sep 2019 12:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKGNxPhu47Krt0u0zH/Ahnz2dG1r8Ux9K0pafaiQ6QhJbYaC720zQsTkekqPNnvM9K5Ia4ckKJwCI2uBZNNyTcKmA8nanmkB9wWsQnGUgMjc0vemw7e1PBiJCk9Qjp8vi9moJM6yKD5yg2rXVOWGRUJRW+u1GLhi6Rj9y3a2y2goYDvw9sWjpPAbZ9uDvzDnRvcL5DQOcYfPeCJ83RjPbs2zkyCiL4rKRFYyDNy3FxHkh9S3Wg9ZuYOsPSqCtmM9iuSSYE/xx6vyG4/Sud7K/nuf2yxR2vjNEBbYySAGnKnjZy6jJub98jOEKL8h1di9beJm3eVMz4/eSkkbI+3gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogR1zpt2cCVDBmLh/EmDzj/QvaVpOWrRD/EnZGk4ghU=;
 b=Ky3QVIuVsbPAuMucwAu+1Y+rU+sNYtbL7ZPcq6mNN+2PtaaHIEy7LX7GoNcRsRJi+SqYXrm/8NWHofzpDnsbHLWSw1cn20Fob8zYzS3QtySfwLkOtut+5VOi/B7e7l4zRWPSWwE1UWb5x1N+o8JW3ysfiI3Ov+wtOoSR8avkz0Z6aKWDb507xJr9hOnoiC1105zPWWR9lXJcGnx3WftUQEkU+OwU8FxGXVQ6Qnr8JYk7SGxKhQXXazwUVaj1JNdFjUsSVwSa9Z9CdojAEMO19c2xRyKzgH8tY3V08ddqADPUvYsD43gl7gX4EEW6eDpdr2kay+qBTq0RJZ16nQ6rxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogR1zpt2cCVDBmLh/EmDzj/QvaVpOWrRD/EnZGk4ghU=;
 b=QBoFNDSwCA10G4DpMm11RSBeJyTJlHkf7QQvr5YxgzPAgWMGQ21jSTTPyZYuVeEcJYuustfXGs6vXNxTlhlRiCGgO4QN83VmzP6pFL2SowGcWaRpQAWoeRpr/eaURxpcLVG+JlRIMQvVXVTlvOjfT1e+ee2trShAwd+PFDD8rSY=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3633.namprd15.prod.outlook.com (52.133.254.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 19:26:27 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 19:26:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Christian Svensson <bluecmd@google.com>, Samuel Mendoza-Jonas
 <sam@mendozajonas.com>
Subject: Re: [PATCH] net/ncsi: Disable global multicast filter
Thread-Topic: [PATCH] net/ncsi: Disable global multicast filter
Thread-Index: AQHVaZ0NbQw1puXXZ0+6LB7mxUixK6ctnJ+AgACl8oD///4ggA==
Date: Mon, 16 Sep 2019 19:26:27 +0000
Message-ID: <1A7F2AEC-9360-47A8-976A-16E4534F86D2@fb.com>
References: <20190912190451.2362220-1-vijaykhemka@fb.com>
 <eb370d3280327b512828adc62b64656e65b22745.camel@mendozajonas.com>
 <CAEfeXva6c-CkUziTiC=uzoqTn9Ycxh=1mW8bYZuFfP4no_kReQ@mail.gmail.com>
In-Reply-To: <CAEfeXva6c-CkUziTiC=uzoqTn9Ycxh=1mW8bYZuFfP4no_kReQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:306b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb9e73d2-c89e-4d72-5f4b-08d73adbc55e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR15MB3633; 
x-ms-traffictypediagnostic: BY5PR15MB3633:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3633490197516F7B6A720210DD8C0@BY5PR15MB3633.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(102836004)(53936002)(186003)(5660300002)(478600001)(7736002)(6512007)(86362001)(6306002)(54896002)(6246003)(46003)(236005)(36756003)(4326008)(11346002)(256004)(446003)(476003)(486006)(2616005)(110136005)(54906003)(6506007)(53546011)(6436002)(99286004)(76176011)(14454004)(33656002)(316002)(229853002)(6116002)(66946007)(64756008)(66556008)(66476007)(66446008)(76116006)(91956017)(71190400001)(81166006)(554214002)(2906002)(25786009)(81156014)(8676002)(8936002)(71200400001)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3633;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3W4gGPj8kLl1fOMP0XfbnaldSG0i2WcCDqwT7B4H1JnltTejBTgfgHwDAuttCdndqEgt8y8Lw6G38em0WyQynXm6dtURaziUowYWkgVxDq5dA81qzwRPbsd9QQJASTjiTNKfSJlaI7KAmB3DUe2yavGgfhnVyPnfAHbWfYDct4IM1ZfJU12H/YWp3Z6lNA+oNM7WjnSPBezEbnz58ymRZXWhVpEel8MVDAfrlmiVRpJJEMW9W+hjMb1cRsul3fKyLjgNNA+YNNEqZbwpk4OurS0n2OWA0NjS2SYePq2xMGRxOAVtcEBwH+ZGgEPYdntsMr1irsuJmp1SwGbmanUzn/zQ3clFaBHC9dYs3cr/4XO4tUfHNtcof5owOjTVa7hFd0Hbh1ddKt2fNIYlrSTLr2LL1BE+PoQjyCA9or5Eno8=
Content-Type: multipart/alternative;
 boundary="_000_1A7F2AEC936047A8976A16E4534F86D2fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9e73d2-c89e-4d72-5f4b-08d73adbc55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 19:26:27.8270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnm+E07BgwMF0vNx/AlcsF5FyLrEVblHN+LNugqWao4GpYFMfJhw8T65ILE//Dju8ZGoCkrkIqigXf4nIzrA2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3633
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-16_07:2019-09-11,2019-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909160189
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_1A7F2AEC936047A8976A16E4534F86D2fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IENocmlzdGlhbiBTdmVuc3NvbiA8Ymx1ZWNtZEBnb29nbGUuY29tPg0KRGF0ZTog
TW9uZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMTkgYXQgNTozMyBBTQ0KVG86IFNhbXVlbCBNZW5kb3ph
LUpvbmFzIDxzYW1AbWVuZG96YWpvbmFzLmNvbT4NCkNjOiBWaWpheSBLaGVta2EgPHZpamF5a2hl
bWthQGZiLmNvbT4sICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0PiwgIm5l
dGRldkB2Z2VyLmtlcm5lbC5vcmciIDxuZXRkZXZAdmdlci5rZXJuZWwub3JnPiwgImxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIm9w
ZW5ibWMgQCBsaXN0cyAuIG96bGFicyAuIG9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4s
IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+LCAibGludXgtYXNwZWVkQGxpc3RzLm96bGFi
cy5vcmciIDxsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz4sIFNhaSBEYXNhcmkgPHNkYXNh
cmlAZmIuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbmV0L25jc2k6IERpc2FibGUgZ2xvYmFs
IG11bHRpY2FzdCBmaWx0ZXINCg0KT24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgNDozOSBBTSBTYW11
ZWwgTWVuZG96YS1Kb25hcyA8c2FtQG1lbmRvemFqb25hcy5jb208bWFpbHRvOnNhbUBtZW5kb3ph
am9uYXMuY29tPj4gd3JvdGU6DQo+DQo+IEknbGwgaGF2ZSBhIGxvb2sgYXQgdGhlIG11bHRpY2Fz
dCBpc3N1ZXMsIENDJ2luZyBpbiBDaHJpcyB0b28gd2hvIElJUkMNCj4gd2FzIGxvb2tpbmcgYXQg
c2ltaWxhciBpc3N1ZXMgZm9yIHUtYm1jIGluIGNhc2UgaGUgZ290IGZ1cnRoZXIuDQoNClRoYW5r
cy4gSSB0aGluayB0aGlzIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgcGF0Y2ggdGhhdCB1LWJtYyBo
YXMsIGJ1dCB0aGlzIG9uZSBpcyBhbiBhY3R1YWwgbmljZS1sb29raW5nIHBhdGNoIDotKS4gVGhl
IHUtYm1jIG9uZSBpcyBqdXN0IGEgYnVuY2ggb2YgI2lmIDAncyBhcm91bmQgbXVsdGljYXN0IGZp
bHRlcmluZy4NClRoYW5rcyBDaHJpcw0KDQoNCldoYXQgSSdtIHdvcnJpZWQgYWJvdXQgaXMgdGhh
dCB3ZSBmb3JnZXQgd2h5IElQdjYgd29ya3MgYnkgZGlzYWJsaW5nIG11bHRpY2FzdCBmaWx0ZXJp
bmcsIEkgZG9uJ3Qgc2VlIGFueSBlbGFib3JhdGUgbWVudGlvbiBvZiB0aGlzIGluIHRoZSBjb2Rl
LiBUaGUgbG9uZy10ZXJtIGZpeCBpcyB0byBtYWtlIHN1cmUgdGhlIEdNRiBpcyBwcm9ncmFtbWVk
IHdpdGggdGhlIGNvcnJlY3QgbXVsdGljYXN0IGdyb3VwcyB0byBtYWtlIElQdjYgaGFwcHksIGFu
ZCB3ZSBzaG91bGRuJ3QgbG9zZSB0cmFjayBvZiB0aGF0IEkgZmVlbC4gSG93ZXZlciwgYXMgYW4g
aW50ZXJtZWRpYXRlIGZpeCBJIHdlbGNvbWUgdGhpcyBwYXRjaCB3aG9sZS1oZWFydGVkbHkuDQoN
CkN1cnJlbnRseSBpc3N1ZXMgYXJlIHdpdGggdmVuZGVy4oCZcyBmaXJtd2FyZS4gSWYgd2UgZW5h
YmxlIG11bHRpY2FzdCBmaWx0ZXJpbmcgaXQgZmlsdGVycyBJUFY2IHBhY2tldHMgYXMgd2VsbCBs
aWtlIFJBLCBuZWlnaGJvciBkaXNjb3ZlcnkgZXRjLiBBbmQgYnkgZGlzYWJsaW5nIGl0IGZvcndh
cmQgYWxsIHBhY2tldHMgaW5jbHVkaW5nIElQVjYgdG8gbWFuYWdlbWVudCBjb250cm9sbGVyLg0K
DQpJIHdpbGwgc2VlIGlmIEkgY2FuIGRpZyB1cCBhbiBldmFsIGJvYXJkIHRvIHRyeSBpdCBvbiBh
bmQgYWRkIGEgVGVzdGVkLUJ5IGluIHRoYXQgY2FzZS4NCg0KVGhhbmtzIENocmlzLCBJIGFtIGxv
b2tpbmcgZm9yd2FyZCB0byB5b3VyIHRlc3QgcmVzdWx0cy4NCg0KVGhhbmtzLA0K

--_000_1A7F2AEC936047A8976A16E4534F86D2fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B6AA9CEC29323247BCB80AE34E0A4E09@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNv
bm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6
bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVm
YXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUi
IHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNv
bGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFj
ayI+Q2hyaXN0aWFuIFN2ZW5zc29uICZsdDtibHVlY21kQGdvb2dsZS5jb20mZ3Q7PGJyPg0KPGI+
RGF0ZTogPC9iPk1vbmRheSwgU2VwdGVtYmVyIDE2LCAyMDE5IGF0IDU6MzMgQU08YnI+DQo8Yj5U
bzogPC9iPlNhbXVlbCBNZW5kb3phLUpvbmFzICZsdDtzYW1AbWVuZG96YWpvbmFzLmNvbSZndDs8
YnI+DQo8Yj5DYzogPC9iPlZpamF5IEtoZW1rYSAmbHQ7dmlqYXlraGVta2FAZmIuY29tJmd0Oywg
JnF1b3Q7RGF2aWQgUy4gTWlsbGVyJnF1b3Q7ICZsdDtkYXZlbUBkYXZlbWxvZnQubmV0Jmd0Oywg
JnF1b3Q7bmV0ZGV2QHZnZXIua2VybmVsLm9yZyZxdW90OyAmbHQ7bmV0ZGV2QHZnZXIua2VybmVs
Lm9yZyZndDssICZxdW90O2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcmcXVvdDsgJmx0O2xp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcmZ3Q7LCAmcXVvdDtvcGVuYm1jIEAgbGlzdHMgLiBv
emxhYnMgLiBvcmcmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDssDQogSm9l
bCBTdGFubGV5ICZsdDtqb2VsQGptcy5pZC5hdSZndDssICZxdW90O2xpbnV4LWFzcGVlZEBsaXN0
cy5vemxhYnMub3JnJnF1b3Q7ICZsdDtsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZyZndDss
IFNhaSBEYXNhcmkgJmx0O3NkYXNhcmlAZmIuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5S
ZTogW1BBVENIXSBuZXQvbmNzaTogRGlzYWJsZSBnbG9iYWwgbXVsdGljYXN0IGZpbHRlcjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgNDozOSBBTSBTYW11ZWwgTWVuZG96YS1Kb25hcyAmbHQ7
PGEgaHJlZj0ibWFpbHRvOnNhbUBtZW5kb3pham9uYXMuY29tIj5zYW1AbWVuZG96YWpvbmFzLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IEknbGwgaGF2ZSBhIGxvb2sgYXQg
dGhlIG11bHRpY2FzdCBpc3N1ZXMsIENDJ2luZyBpbiBDaHJpcyB0b28gd2hvIElJUkM8YnI+DQom
Z3Q7IHdhcyBsb29raW5nIGF0IHNpbWlsYXIgaXNzdWVzIGZvciB1LWJtYyBpbiBjYXNlIGhlIGdv
dCBmdXJ0aGVyLjxicj4NCjxicj4NClRoYW5rcy4gSSB0aGluayB0aGlzIGlzIHZlcnkgc2ltaWxh
ciB0byB0aGUgcGF0Y2ggdGhhdCB1LWJtYyBoYXMsIGJ1dCB0aGlzIG9uZSBpcyBhbiBhY3R1YWwg
bmljZS1sb29raW5nIHBhdGNoIDotKS4gVGhlIHUtYm1jIG9uZSBpcyBqdXN0IGEgYnVuY2ggb2Yg
I2lmIDAncyBhcm91bmQgbXVsdGljYXN0IGZpbHRlcmluZy48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlRoYW5rcyBDaHJpczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PGJyPg0KPGJyPg0KV2hhdCBJJ20gd29ycmllZCBhYm91dCBpcyB0aGF0IHdlIGZv
cmdldCB3aHkgSVB2NiB3b3JrcyBieSBkaXNhYmxpbmcgbXVsdGljYXN0IGZpbHRlcmluZywgSSBk
b24ndCBzZWUgYW55IGVsYWJvcmF0ZSBtZW50aW9uIG9mIHRoaXMgaW4gdGhlIGNvZGUuIFRoZSBs
b25nLXRlcm0gZml4IGlzIHRvIG1ha2Ugc3VyZSB0aGUgR01GIGlzIHByb2dyYW1tZWQgd2l0aCB0
aGUgY29ycmVjdCBtdWx0aWNhc3QgZ3JvdXBzIHRvIG1ha2UgSVB2NiBoYXBweSwgYW5kDQogd2Ug
c2hvdWxkbid0IGxvc2UgdHJhY2sgb2YgdGhhdCBJIGZlZWwuIEhvd2V2ZXIsIGFzIGFuIGludGVy
bWVkaWF0ZSZuYnNwO2ZpeCBJIHdlbGNvbWUgdGhpcyBwYXRjaCB3aG9sZS1oZWFydGVkbHkuDQo8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Q3VycmVudGx5IGlzc3VlcyBhcmUgd2l0aCB2ZW5kZXLi
gJlzIGZpcm13YXJlLiBJZiB3ZSBlbmFibGUgbXVsdGljYXN0IGZpbHRlcmluZyBpdCBmaWx0ZXJz
IElQVjYgcGFja2V0cyBhcyB3ZWxsIGxpa2UgUkEsIG5laWdoYm9yIGRpc2NvdmVyeSBldGMuIEFu
ZCBieSBkaXNhYmxpbmcgaXQgZm9yd2FyZCBhbGwgcGFja2V0cyBpbmNsdWRpbmcgSVBWNiB0byBt
YW5hZ2VtZW50IGNvbnRyb2xsZXIuPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5JIHdpbGwgc2VlIGlmIEkgY2FuIGRpZyB1cCBhbiBldmFsIGJvYXJkIHRvIHRy
eSBpdCBvbiBhbmQgYWRkIGEgVGVzdGVkLUJ5IGluIHRoYXQgY2FzZS48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+VGhhbmtzIENocmlzLCBJIGFtIGxvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHRlc3Qg
cmVzdWx0cy48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9i
b2R5Pg0KPC9odG1sPg0K

--_000_1A7F2AEC936047A8976A16E4534F86D2fbcom_--
