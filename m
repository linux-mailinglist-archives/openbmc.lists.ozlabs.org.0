Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA03B6F13
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 23:52:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YYc74T9SzF4p4
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 07:52:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4164fb3d32=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DXwRJ3de"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Y/iF/xD6"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YYbT3nDCzF32W
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 07:51:48 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ILctpI012809
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 14:51:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=ftoLpRAoOIPgY4xziBI4/zbmqXtZRCd3XeRAcSl+b20=;
 b=DXwRJ3de1nYHRObvv3GknTdNkMWuobwXZsOnH0YRzWTFLX6RLVcOk6leyU4jJ4VmliqX
 0FDRZd9duCxJjjaTRdJc+vpb9ed4C8Vs3P8vPGpFT6GCxC4Ufl0TgUJEd5RkRnUZtb0g
 mVNAGF4XvKwjp2ZKLctGP6a90mT4ZYQ0vFE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v3vdqg43x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 14:51:45 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 14:51:45 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Sep 2019 14:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY4cygwTqu1Wrx0tBxtmsMgixc8za9MwyZNSAGJYvx5kYBhF7leRbBlh+rgR6R853kwTYKrK/Nc8flx8l/4FtdgrMHZxROh1YYolzxFqhLTyLitdodbCEAxDfCxW6L1ZfNiRFuL1hRqpzzYFawYaB9sAi/wervO5AKfsP5qfGhjmX0pLGKfN66zbc50ak3RfZfgCegIt7Gu0RhBArcB8rp+nYkpS5q6NcgplQlfTna2coH2SxqZ8l6HJ26Igm16SeUOTyJU2rXhvuQli4STtq7Ng7jJmwjrlezpn6jWfFimMRxrg6YmmQ3KBpbHwRetjmxnalKAYpEk4jxVeO5TJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftoLpRAoOIPgY4xziBI4/zbmqXtZRCd3XeRAcSl+b20=;
 b=j4Y34uuqEIl8TcIIP7cQHnrs9x/KyuXwwaHJXfzUl8AGPHBLcxaXbbTc/fF/0BcA4eKTjUdNB7isW6aZUcNgBmDKQsaDs9sICEk7w+X8Xkk6oYPow5GX0OqLYfnqLos73EvaNBPhrVDxmjfxguLZQ0E5jszsQfHrB77WpRquZLihNYrBp/0jqAtoBfl82AVJ/uMJVssSHdM1+UY9Zmt1wz8c60l6Fdg+L2SBn+PWg8W6Z2jCNNKURespcmMlVxc72q0ctkuHX1RRez6Q8MvGGDbuAoWV43nJ2fOjieZBVAWtWs+5W/8lAgL32XXXafhMZ4512bCZ1jmmckLdq3mxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftoLpRAoOIPgY4xziBI4/zbmqXtZRCd3XeRAcSl+b20=;
 b=Y/iF/xD6DJFs1nKwYiNkCgd0DX0bhstdrRi/05f/GwLDSS8ExdeVdAjGhtoYqITkU8U+vteKGXR0G5gTAukgBmIA4vpld0ysBhBAvGSSkMkjn8Fzw6+QcCP7ljulVMYfcJTVaoEZXa5N5Api8VvfWy5sS13S6I7CHocDgXOyWjE=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1614.namprd15.prod.outlook.com (10.175.140.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Wed, 18 Sep 2019 21:51:43 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 21:51:43 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: src-uri-bad in flashd and chassisd recipes
Thread-Topic: src-uri-bad in flashd and chassisd recipes
Thread-Index: AQHVbmtChgpkIQtbk0i+BRqIzRLCTA==
Date: Wed, 18 Sep 2019 21:51:43 +0000
Message-ID: <1558DF2D-BC3C-489C-AC4A-9DF7F8332E01@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::1:6c8c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98f8e3b0-e667-45fd-5af9-08d73c82654f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1614; 
x-ms-traffictypediagnostic: MWHPR15MB1614:
x-microsoft-antispam-prvs: <MWHPR15MB161472A043905D4EFCB7AAECBD8E0@MWHPR15MB1614.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(396003)(39860400002)(366004)(199004)(189003)(6512007)(66476007)(66556008)(8676002)(8936002)(54896002)(66946007)(81156014)(102836004)(1730700003)(99286004)(71190400001)(64756008)(2501003)(76116006)(6916009)(33656002)(478600001)(81166006)(6506007)(66446008)(6486002)(476003)(486006)(2906002)(4744005)(71200400001)(6436002)(14444005)(86362001)(256004)(7736002)(5660300002)(5640700003)(2616005)(6116002)(46003)(316002)(36756003)(186003)(25786009)(14454004)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1614;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uJxkQS/8/atM6qf1BPmValM4ngwI060K1VZn7t9mAJfIQ8WHcXBZumwdl5ZHKQS6vggnnLP+CPpR6tcQcllfNooRlz6ivuEul8A2wXwH5LW0pRLB0yE779iC3nDtZ52AciOfcsmzJQwE/DwGsQ/3LpmpmkcuL6bq7b2Wbmpgb5Ha0jryrmw/UmIYWGiIrUYtnCYlB/sLkG6DUCqIwCMA3521ERcxEj5YanFqYC6TlqxNMPNhReMCgeGH+5Hjc0tVk4KFkYhcxqgIK6jTQobkC22LGM7Nfu3hP7BdDjJjP6W03lXg/v6708vjUIzeD8LJhRwC3g8YvrnuW+9mPZhmz0wm4quMP3g67D/tC6GDUi2RxTaH8YWkbbO8jsyTqwL2aN/7p2shtE4Gna2YrF02l9A0locrwBuxjHnXFZ0pmZY=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_1558DF2DBC3C489CAC4A9DF7F8332E01fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f8e3b0-e667-45fd-5af9-08d73c82654f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 21:51:43.7539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTjM48BfZyHqextwzB/5X+3MbYBSCldkgPXL5441fNSSEXE8Zw6UpOQ/OsgBvKTUpiNWBni0TT23rPNm3eWCPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1614
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_10:2019-09-18,2019-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=641 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180184
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

--_000_1558DF2DBC3C489CAC4A9DF7F8332E01fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SeKAmW0gYmVlbiBzZWVpbmcgdGhlc2Ugd2FybmluZ3MgYWZ0ZXIgYSDigJxnaXQgcHVsbOKAnS4g
QXJlIHRoZXNlIHdhcm5pbmdzIGV4cGVjdGVkPyBJcyBpdCBva2F5IHRvIGF0dGVtcHQgdG8gY3Vy
ZSB0aGVtIG9yIGFyZSB0aGV5IHNpbXBseSB0cmFuc2llbnQgd2FybmluZ3M/DQoNCldpbGZyZWQN
Cg0KDQoNCg0KDQpXQVJOSU5HOiBvYm1jLXBob3NwaG9yLWZsYXNoZC0xLjAtcjEgZG9fcGFja2Fn
ZV9xYTogUUEgSXNzdWU6IG9ibWMtcGhvc3Bob3ItZmxhc2hkOiBTUkNfVVJJIHVzZXMgUE4gbm90
IEJQTiBbc3JjLXVyaS1iYWRdDQpXQVJOSU5HOiBvYm1jLXBob3NwaG9yLWNoYXNzaXNkLTEuMC1y
MSBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogb2JtYy1waG9zcGhvci1jaGFzc2lzZDogU1JDX1VS
SSB1c2VzIFBOIG5vdCBCUE4gW3NyYy11cmktYmFkXQ0KDQoNCg==

--_000_1558DF2DBC3C489CAC4A9DF7F8332E01fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <52AF68A146E07B49BAF7CA88086C515F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250
LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFuIHN0
eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IiBjbGFzcz0iIj48Zm9u
dCBmYWNlPSJBbmRhbGUgTW9ubyIgY2xhc3M9IiI+SeKAmW0gYmVlbiBzZWVpbmcgdGhlc2Ugd2Fy
bmluZ3MgYWZ0ZXIgYSZuYnNwO+KAnGdpdCBwdWxs4oCdLiBBcmUgdGhlc2Ugd2FybmluZ3MgZXhw
ZWN0ZWQ/IElzIGl0DQogb2theSB0byBhdHRlbXB0IHRvIGN1cmUgdGhlbSBvciBhcmUgdGhleSBz
aW1wbHkgdHJhbnNpZW50IHdhcm5pbmdzPzwvZm9udD48L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxl
PSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7
IiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAy
NTUpOyIgY2xhc3M9IiI+PGZvbnQgZmFjZT0iQW5kYWxlIE1vbm8iIGNsYXNzPSIiPjxiciBjbGFz
cz0iIj4NCjwvZm9udD48L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9u
dC1zdHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFzcz0iIj48Zm9udCBm
YWNlPSJBbmRhbGUgTW9ubyIgY2xhc3M9IiI+V2lsZnJlZDwvZm9udD48L2Rpdj4NCjxkaXYgc3R5
bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1h
bDsiIGNsYXNzPSIiPjxmb250IGZhY2U9IkFuZGFsZSBNb25vIiBjbGFzcz0iIj48YnIgY2xhc3M9
IiI+DQo8L2ZvbnQ+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNo
OiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFzcz0iIj48Zm9udCBmYWNlPSJBbmRh
bGUgTW9ubyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9mb250PjwvZGl2Pg0KPGRpdiBzdHls
ZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFs
OyBmb250LWZhbWlseTogJnF1b3Q7QW5kYWxlIE1vbm8mcXVvdDs7IGNvbG9yOiByZ2IoMTU5LCAx
NjAsIDI4KTsgYmFja2dyb3VuZC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwLjkwMTk2MSk7IiBjbGFz
cz0iIj4NCjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGln
YXR1cmVzIiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxl
PSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7
IGZvbnQtZmFtaWx5OiAmcXVvdDtBbmRhbGUgTW9ubyZxdW90OzsgY29sb3I6IHJnYigxNTksIDE2
MCwgMjgpOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDAsIDAsIDAsIDAuOTAxOTYxKTsiIGNsYXNz
PSIiPg0KPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdh
dHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9
Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsg
Zm9udC1mYW1pbHk6ICZxdW90O0FuZGFsZSBNb25vJnF1b3Q7OyBjb2xvcjogcmdiKDE1OSwgMTYw
LCAyOCk7IGJhY2tncm91bmQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMC45MDE5NjEpOyIgY2xhc3M9
IiI+DQo8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0
dXJlcyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0i
bWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyBm
b250LWZhbWlseTogJnF1b3Q7QW5kYWxlIE1vbm8mcXVvdDs7IiBjbGFzcz0iIj4NCjxzcGFuIHN0
eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IiBjbGFzcz0iIj48c3Bh
biBzdHlsZT0iZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlczsiIGNs
YXNzPSIiPldBUk5JTkc8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6
IG5vLWNvbW1vbi1saWdhdHVyZXM7IiBjbGFzcz0iIj46DQo8L3NwYW4+PHNwYW4gc3R5bGU9ImZv
bnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXM7IiBjbGFzcz0iIj5vYm1j
LXBob3NwaG9yLWZsYXNoZC0xLjAtcjEgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IG9ibWMtcGhv
c3Bob3ItZmxhc2hkOiBTUkNfVVJJIHVzZXMgUE4gbm90IEJQTiBbc3JjLXVyaS1iYWRdPC9zcGFu
Pjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5v
cm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O0FuZGFsZSBNb25v
JnF1b3Q7OyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1
NSwgMjU1LCAyNTUpOyIgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vLWNvbW1vbi1saWdhdHVyZXM7IiBjbGFzcz0iIj5XQVJOSU5HPC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzOyIgY2xhc3M9
IiI+Og0KPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21t
b24tbGlnYXR1cmVzOyIgY2xhc3M9IiI+b2JtYy1waG9zcGhvci1jaGFzc2lzZC0xLjAtcjEgZG9f
cGFja2FnZV9xYTogUUEgSXNzdWU6IG9ibWMtcGhvc3Bob3ItY2hhc3Npc2Q6IFNSQ19VUkkgdXNl
cyBQTiBub3QgQlBOIFtzcmMtdXJpLWJhZF08L3NwYW4+PC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHls
ZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFs
OyBmb250LWZhbWlseTogJnF1b3Q7QW5kYWxlIE1vbm8mcXVvdDs7IGNvbG9yOiByZ2IoMTU5LCAx
NjAsIDI4KTsgYmFja2dyb3VuZC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwLjkwMTk2MSk7IiBjbGFz
cz0iIj4NCjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGln
YXR1cmVzIiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxl
PSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7
IGZvbnQtZmFtaWx5OiAmcXVvdDtBbmRhbGUgTW9ubyZxdW90OzsgY29sb3I6IHJnYigxNTksIDE2
MCwgMjgpOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDAsIDAsIDAsIDAuOTAxOTYxKTsiIGNsYXNz
PSIiPg0KPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdh
dHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvc3Bhbj48L2Rpdj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_1558DF2DBC3C489CAC4A9DF7F8332E01fbcom_--
