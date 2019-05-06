Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A315386
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 20:19:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yWGf4Zm1zDqMl
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 04:19:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00296dc217=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="QOSDziTf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dXD7y+m9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yWFq1Z97zDqHq
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 04:18:37 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x46IHW2r000973;
 Mon, 6 May 2019 11:18:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=DG+ct80+gbmK3+uNPQMWF9S4Q38B3sjsRGbJdnPEUU0=;
 b=QOSDziTftSrFKXNR1T04DSxUFwIiUmXxMBrC3yBfxIv4AgGjds6xEsruy3Trzjes6a8T
 16GfN4kePy6jYV0JXXLU5FZXY7Ev5EdNkqYNkYFxNMRTbU022/EDT46rMWN8aR2X8n12
 WnSCIFHA1JgRLvfLnZChN0dWFa+FsxV6fCM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2s96d9x0bt-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 May 2019 11:18:33 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 May 2019 11:18:25 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 6 May 2019 11:18:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG+ct80+gbmK3+uNPQMWF9S4Q38B3sjsRGbJdnPEUU0=;
 b=dXD7y+m9mTcmDhJfvWxOWYgGE6TAlS/jPlHzrZfIirQ/Dnk+2coYXE4eaISQX7A133tIxx9hfesQRg8YeTFKipzNwg8XlJiwDkhD4s+8iw1TNbjQ5vrZMW9Palfnm3hS5yuTIz7HEmLp6azcyL1LV89c1+WFRmO4G6R4Trxz68A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1671.namprd15.prod.outlook.com (10.175.121.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Mon, 6 May 2019 18:18:24 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 18:18:24 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: pid control configuration
Thread-Topic: pid control configuration
Thread-Index: AQHVAHC+JTVF079u7EWEF1cz6ijBgKZW49mAgAEiSgCABkgqgP//q6gA
Date: Mon, 6 May 2019 18:18:24 +0000
Message-ID: <CF3E02FB-32B4-4D77-9E02-1633C2C4A8A8@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
In-Reply-To: <1b82951d-4293-0525-a562-000899544c2e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2d00]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f0c3666-a169-46ba-a002-08d6d24f3a9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1671; 
x-ms-traffictypediagnostic: CY4PR15MB1671:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR15MB16713769B48CE2021FC35BB2DD300@CY4PR15MB1671.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(6436002)(99286004)(6116002)(14454004)(2906002)(229853002)(6486002)(478600001)(2501003)(446003)(5660300002)(46003)(14444005)(256004)(476003)(6246003)(86362001)(2616005)(11346002)(6512007)(53546011)(6506007)(486006)(102836004)(186003)(76176011)(6306002)(53936002)(81166006)(7736002)(305945005)(7116003)(316002)(110136005)(25786009)(966005)(33656002)(82746002)(3480700005)(71190400001)(71200400001)(83716004)(36756003)(91956017)(76116006)(66446008)(64756008)(66556008)(66476007)(73956011)(66946007)(8676002)(8936002)(81156014)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1671;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MMVMfdeYb+h/BR7kmji+tgNE2lbUy0CcrQPpoJ54TDugR2hX1mT8UJsG2xoirMv6oh/NLTlAzOqC1qPXWNzxoE6Ya0PCAb/Vcyx9XTj2gVGPZ/EjIxjqiQYuGVU7nKNUME+7vUDRUtLqjhggMEXUQMFw8XM0NfOSJ02lTfXJfPZOzTcjOOTDhpAADT9WOvqihg4WfiStd3YnfkEFXyDxQfFqWncbFAgPIlzwTyrP36k4k1zYH3o6hWucqGfjodrgO5yx+XPiitVzDRCyhnqUWYFTEWxD87ghlcsL+btuP127sDbjIGlwbIsnlGNWSSmhmf3D8CullVgURivOA9a+7nRq39f6GUBiA2/UyWGXe0XhlsVAIWCUm5fcQ14ZYsYfB7TvK4kToXFNvMBU4+VMQJmNsS/EK4AWI2P/iNxPPWs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F5AD33863040B4FB1A7FF6EEE24D7EA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0c3666-a169-46ba-a002-08d6d24f3a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 18:18:24.6024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1671
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=964 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060153
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

DQoNCu+7v09uIDUvNi8xOSwgOToyMCBBTSwgIkVkIFRhbm91cyIgPGVkLnRhbm91c0BpbnRlbC5j
b20+IHdyb3RlOg0KDQogICAgT24gNS8yLzE5IDQ6MjQgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToN
CiAgICA+ICBNeSB1bmRlcnN0YW5kaW5nIGhlcmUgaXMgcGlkIGRhdGEgYXJlIG9ubHkgZGVmaW5l
ZCBmb3IgdGVtcCBzZW5zb3JzIHdoaWNoIHdpbGwgZ2VuZXJhdGUgcHdtIHZhbHVlcyBmb3IgZmFu
Lg0KICAgID4gDQogICAgDQogICAgVGhlIGFib3ZlIGlzIG5vdCBob3cgcGhvc3Bob3IgcGlkIGNv
bnRyb2wgb3BlcmF0ZXMuICBUaGUgdGVtcGVyYXR1cmUNCiAgICBjb250cm9sbGVycyAicmVxdWVz
dCIgYSBnaXZlbiBmYW4gUlBNLCB0aGVuIHRoZSBmYW4gUElEIGNvbnRyb2xsZXINCiAgICAod2hp
Y2ggaXMgc2Nhbm5lZCBtdWNoIG1vcmUgcXVpY2tseSB0aGFuIHRoZSB0ZW1wZXJhdHVyZSBjb250
cm9sbGVycykNCiAgICBhdHRlbXB0cyB0byBkcml2ZSB0aGUgZmFuIHRvIHRoYXQgc3BlZWQuICBU
aGlzIGVuZHMgdXAgYmVpbmcgYSB0d28gc3RhZ2UNCiAgICBmZWVkYmFjayBsb29wIHRoYXQgY2Fu
IHBlcmZvcm0gYmV0dGVyIHRoYW4gYSBzaW5nbGUgUElEIGxvb3AuDQpXaGVyZSB3b3VsZCBJIGdl
dCBkYXRhIGZvciBGYW4gcGlkIHdoYXRldmVyIGRhdGEgIHdlIGdldCBmcm9tIHRoZXJtYWwgdGVh
bSBhcmUgDQpPbmx5IGZvciB0ZW1wZXJhdHVyZSBwaWRzLg0KICAgIA0KICAgIEluIGNvbnRyb2wg
dGhlb3J5LCB0aGlzIGlzIGNhbGxlZCBhICJDYXNjYWRlIiBjb250cm9sIHNjaGVtZQ0KICAgIA0K
ICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9f
ZW4ud2lraXBlZGlhLm9yZ193aWtpX1BJRC01RmNvbnRyb2xsZXItMjNDYXNjYWRlLTVGY29udHJv
bCZkPUR3SUNhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQ
VmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09Z1JyUXRTZWp5SVJzanVQUzBHZnF3WDZiT21qU0NP
cXM3QlU1b2luYTZvTSZzPW81Nk9xc3F0SmdpQWVIU3lwM1pkNHliOG9GTzhsekgtRElZc29rVHlj
NDgmZT0NCg0KVGhhbmtzIGZvciB0aGlzLg0KICAgIA0KICAgIC1FZA0KICAgIA0KDQo=
