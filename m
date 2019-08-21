Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF296E6F
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:38:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CpgP6q9GzDqRp
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:38:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3136f1accf=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PgZ0rVlC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XP+DJUj2"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cpfs6GGwzDqQM
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:38:09 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x7L0arjk010968
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 17:38:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=qkBaZS3wroP1J/jE2sosHgNj1xzIFQUd9r3FzuP5Pl8=;
 b=PgZ0rVlCiXNKNsM7gdWRao6/mbk4M05a+gQWKtgBbqJhrSqhf1jMv4BmR056h+A3SPoJ
 lxQZenzse5Ej3R+x7hnM2/ND1J5GHZdIKqbEvVKc6UKgWwA+ipuBvpSWziayUuWJWKS1
 7wCBb/6At+V45x5KeQh4MtXqqG/3wL8GHXY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2ugn13hsuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 17:38:05 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 20 Aug 2019 17:38:04 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 20 Aug 2019 17:38:04 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 17:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oud0l1OMyOU3dbZmxpr/g0pCNGclV/fOHvTBOtwPsGkSqjZQ5GLHGfnM02SnIu/r8iVwE90kmcyz+kBvz+L6Uarexd3kOMG5Y5LyP2AfhUM6NekizS+xXeOVLbWcFqsGzSGD7FQt1pK/5mrTIq9HE35SB0Z5WgmffiVgf09gTA4vZ8joNK8k4miv0KX+bsjmTLcmBL/w3tlptX3h3tUQiZ0P+IjP4wF6sVoBHkSmjdIxLX39rc/3m03ndo5ApHUQtd/yz1FJJzpRwocLlKIuwkncv3msV4mVuqIFyD14GLVvkGP/JIIsriT5PrPd19qxKJHOeALw7aZSZNe8raM2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkBaZS3wroP1J/jE2sosHgNj1xzIFQUd9r3FzuP5Pl8=;
 b=HOR4xZVgxN0SkrCxVJeD7N81d9DOPM4HbK/Jh/yng626Mjqf+tu5wRMo6YD1WhFjb3+MKaM3q03eeEmMVZHcpczeIJXTg08zb7RcrBBsk3hWIhOeWpAwPY5aK+sosgn/SwF0Kc4QHIS4dzHcaU9q+CXDThUVy5GNBE2VB2S40u7/WofCrlv76pCaplb/YbYdvAMfe2kAFp3qIxjm78lO0FumeOXbhul/yKl13vdpo0BdJ5FtMyItlXoGa2af+R7NY+OHnFyF7WyhLIYuereTgTl/XV2B4CYJSfn2B9fRoPyhDT4Stk1KkNeM9K/FXxEHMHMd64sMdCz8cjepaNdxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkBaZS3wroP1J/jE2sosHgNj1xzIFQUd9r3FzuP5Pl8=;
 b=XP+DJUj2ddJbPAifBWB1NQDbh/WsAgtfoJ2a8D/oDY8Ab6zRxLhXvJsOSniPDDtNJuRFTIMYuPIfkSp8YxGtNyN35Sz83OeqP8eHq+Xmxiy5qCSiXcjG99ulz/Q7eNaIBs4rgix3iChhRs8bo4TRL3/tvIPIn07BfULGHboHch4=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3405.namprd15.prod.outlook.com (20.179.21.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 00:37:49 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 00:37:49 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 48, Issue 109
Thread-Topic: openbmc Digest, Vol 48, Issue 109
Thread-Index: AQHVV7Xb1lffmEsva0GBrjs6kW7+o6cEweQA
Date: Wed, 21 Aug 2019 00:37:49 +0000
Message-ID: <10228502-939A-4EDC-A58D-9E0E270D0D3B@fb.com>
References: <mailman.910.1566346569.372.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.910.1566346569.372.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:7f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a57a2f8-41fc-43fe-b6fd-08d725cfcb65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB3405; 
x-ms-traffictypediagnostic: MN2PR15MB3405:
x-microsoft-antispam-prvs: <MN2PR15MB3405DBC4ED9904778FC2B3D0BDAA0@MN2PR15MB3405.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(346002)(39860400002)(366004)(10533003)(189003)(199004)(18543002)(81166006)(316002)(6486002)(81156014)(2906002)(446003)(6436002)(71200400001)(64756008)(71190400001)(76116006)(8936002)(5640700003)(6512007)(91956017)(66446008)(99286004)(8676002)(102836004)(25786009)(1730700003)(229853002)(66556008)(66476007)(486006)(476003)(186003)(2616005)(66946007)(5660300002)(478600001)(6916009)(11346002)(6506007)(2501003)(46003)(86362001)(36756003)(76176011)(256004)(33656002)(14454004)(6246003)(305945005)(2351001)(7736002)(53936002)(4744005)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3405;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nhXn0lX+5kdwSyOR8MsnlFCUrJSbniQ0S3pOL8hqu/XLXyKYmN8+7jPP7EZnQOvSIfSaFj+kThPKGFetHbkK2Ly06lUrkzfhRIvJavgS6HyzotKNObHD8dYPzHIt/K21SP4XSqOZJFIsMjWIOVUAzSL29BKio7EMO4ghZu7VEUI7JJ0EUOYrz1ri6StEgZESJIGtBXiRE9jjXaRZ9ZTCbqL54ZWxV/LIicDIWVtf577RS5FrrtKHzkVS+1sU9cnaoMmrNTzVLT+zLKRxHxdMxURGqFbEKxEazusHc8OSCAKB3zd0PlI2IIAHwriz3cUTbpvQjuKMyfGkL+jqlcFiCsB6Uj8qKNObN0+H0O1WP4RAcm9hlhCe4GvHYam50hdvnS6ZD+n4TbxykyIMN/gKOxwKCSfCQ1qmaN5fGysjmyM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D3AE51A8723C7418D75F8602BE48728@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a57a2f8-41fc-43fe-b6fd-08d725cfcb65
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 00:37:49.5814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmrTmGpcv/gIiyWWks1w0m1VtMpzYZD4UM3KI7Wan8Ez6L+1BgM/UgEMfZJFCbjgIOPQWP4ce+T9EJmfYfRz7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3405
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210004
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

PiA6OnNuaXA6Og0KPiBUaGUgZG9jdW1lbnRhdGlvbiBzdWdnZXN0cyB0aGVzZSB0b29scyBhcmUg
cHJpbWFyaWx5IGZvciBkZWJ1Z2dpbmcNCj4gcHVycG9zZXMuIFRoaXMgd2Fzbid0IGNsZWFyIHRv
IG1lIHByZXZpb3VzbHkgLSBJIG5vdyB0aGluayB3ZSBzaG91bGQNCj4ganVzdCBob3N0IHRoZW0g
aW4gdGhlIG9wZW5ibWMtdG9vbHMgcmVwbyB3aGVyZSB3ZSBhbHJlYWR5IGhvc3QgYQ0KPiBidW5j
aCBvZiBvdGhlciBzY3JpcHRzIGZvciBkZWJ1Z2dpbmcuIElmIHlvdSB3YW50IHRvIGluc3RhbGwg
dGhlbSBpbiB0aGUNCj4gaW1hZ2UgdGhlbiB3ZSBqdXN0IHdyaXRlIHRoZSByZWNpcGVzIG5lY2Vz
c2FyeS4NCjo6c25pcDo6DQoNCkFuZHJldywgSeKAmW0gc3VyZSBpdOKAmXMgYSBtYXR0ZXIgb2Yg
bWUgbm90IGhhdmluZyBtYWRlIGl0IGNsZWFyLiBUaGFua3MgZm9yIGN1dHRpbmcgdGhyb3VnaCB0
aGUgaGF6ZSBhbmQgdW5kZXJzdGFuZGluZyBteSBpbnRlbnQuIFRoaXMgaXMgYSB2ZXJ5IGFjY2Vw
dGFibGUgcmVzb2x1dGlvbi4gSeKAmWxsIHBvc3QgdG8gdGhlIG9wZW5ibWMtdG9vbHMgcmVwb3Np
dG9yeSBhcyB5b3XigJl2ZSBzdWdnZXN0ZWQuDQoNCioqKm1lYSBjdWxwYXMgYW5kIHRoYW5rcyoq
Kg0KDQpXaWxmcmVkDQoNCg==
