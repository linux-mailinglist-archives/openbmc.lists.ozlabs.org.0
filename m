Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775FB256D
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 20:52:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VPsK517qzF5nl
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 04:52:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41592e3fcd=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="B9pgYuGe"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Gr9BMsi+"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VPrZ2BhzzF5nj
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 04:52:12 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DIoN3F015919
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 11:52:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=XJQOTbH3BCuKUgzFNFXbA1C8b0pI0RHTGdcxQfMDSEE=;
 b=B9pgYuGe1fu7mPRDpah8ww5SXcYvcHkKflbwhe2ef0Q0kdSPERxuHuSt8TIcrKHiv4fC
 HV5JGwF1Sw4EO2hfvYDFY6xNj1P1seugymlUzf7amuLFXcHceJcPTIOxi7F41eCzZX4o
 4z6vL8TItmPm9xpsSVe9i9n953Wg2fT48tk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v0dq58wv6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 11:52:10 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 13 Sep 2019 11:52:09 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Sep 2019 11:52:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWeRUhd+fkS39G3wfGwlCIZzY1BdPAADPoy6mkopb4D0BA2dikAEcjqURKKBbsc/1zbJAmoB4mLLlRANFBgKVRyDrMvsLO8YElURoPqWv5ss42UgJfNxfzih4P/3lkQ8BgJHIfVqopDdxctxmBXuBadhvzskAW26vcyNFVL56dLogrHcK956KmIeh91qE5x/VGuvirLCxy/fVdJdJh5Q3dI6unludOKA66t6N2/xuvFwIu5Qhis0xigiqshKK12C2+6nNm3fIlzStybvFPwyuj9mGvn03rE1VaRD/b2e9bNUQgIpQxmCEM2wn8OJmiIb/0dx9iohNraD9eCFDlD7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJQOTbH3BCuKUgzFNFXbA1C8b0pI0RHTGdcxQfMDSEE=;
 b=ZZyMZGMkGDsmR7noVj+3ZnsyDV07WsQ1VixaWPE7NkOKcWZHV39NRvypJMHh+GaY1gJ/zaqIDjBd8eLBjkx+Vl6IEDiZJQGx7jiycQuOzylE/bXdLxdRYalTLXlV5tuFsMK37/qVs/+oT5Yid5GVbF/8CKEGtYdbj5oGdw9WTIchRwfqJXbxQkEQJxK80DeprmowcNhF8PIfuuKOspvrivdLE5uQad9XJw10Xjcm6IjWOFDZxaSlw4jjjN1BD0KfsOeLB9qgTPpfbyho8R9a43TcAvbSmSOUwU598xk5czwibCKOF0TW8bKUgogTfrSwQcOYEQK06I7pchRAYGa9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJQOTbH3BCuKUgzFNFXbA1C8b0pI0RHTGdcxQfMDSEE=;
 b=Gr9BMsi+2ZULqXjbvLmzfb1b3zv8TIGF4zZubfXattxAXbRPzrxa3R1slkKXVZ1t5LhfXeJrMTU/wFwONvQqma1mFA8AarVSY8fDIuS6meehqBQmA7u5I+hD5F/a2CcMIzNx15rfoGFAVT4JIZ5C8+pyNyh36SmUvXqcz323hds=
Received: from BN6PR15MB1810.namprd15.prod.outlook.com (10.174.115.23) by
 BN6PR15MB1492.namprd15.prod.outlook.com (10.172.152.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Fri, 13 Sep 2019 18:52:08 +0000
Received: from BN6PR15MB1810.namprd15.prod.outlook.com
 ([fe80::88a2:b916:be78:e602]) by BN6PR15MB1810.namprd15.prod.outlook.com
 ([fe80::88a2:b916:be78:e602%9]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 18:52:08 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Rant regarding code review issues
Thread-Topic: Rant regarding code review issues
Thread-Index: AQHVamRXIa+Mqs/WGU+nPJCAMBMLdw==
Date: Fri, 13 Sep 2019 18:52:07 +0000
Message-ID: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:21e9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21eb9e39-48a4-4332-3511-08d7387b7a53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR15MB1492; 
x-ms-traffictypediagnostic: BN6PR15MB1492:
x-microsoft-antispam-prvs: <BN6PR15MB14925B49CAE67D9166EF4C6CBDB30@BN6PR15MB1492.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(346002)(376002)(39860400002)(199004)(189003)(36756003)(91956017)(2616005)(102836004)(71190400001)(71200400001)(2501003)(186003)(6506007)(76116006)(14444005)(256004)(2351001)(6116002)(46003)(476003)(2906002)(66446008)(66946007)(66476007)(64756008)(66556008)(53936002)(86362001)(33656002)(7736002)(478600001)(6512007)(6916009)(6486002)(99286004)(486006)(6436002)(305945005)(5660300002)(1730700003)(81166006)(5640700003)(8936002)(14454004)(316002)(81156014)(25786009)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR15MB1492;
 H:BN6PR15MB1810.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dxC3GFu9ypd3EgLav6pd5aoxI0OhPJ7EIRkdk4czJAWeJa8KKaK3W9t9DS6GVtmq42TrCYLKljbqUJt6XsizTvMJCN7arLyIYgPgDujoroglJbqmZwRs9+31cb3In85pJLGqTodtaprpB3z3QXakD7jWs7XcFXrX239VF/zM+qvrTgJpddXkH7x644VrhBeKFbfjMURe5SfPQXq++e97ZQ7T+KUcyEPh3YKoapi6jk3Kj3v4v4QqVr28L2TX+xhvOG+bgRyx2HxdtO2Ty2GS2CUTD0n4U/Koif+SA5GFfa5dnopIULLUw6aV/iKDAW9lA09xzRG66OEv/gnRO/o1i/0lx5vJdESUZamhWIl0XIYwbm1XHLfAoKpP1QhZtqskGJ7tOrjxjl68xYNZskeuH/epzGDfyPvPPZCFxjOmpHY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DE80ADED74C7A4B91DD2A70F8F631C3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 21eb9e39-48a4-4332-3511-08d7387b7a53
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 18:52:07.7282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+wFTDCRbtN0K3VZ2afiJmmHuhrKQOb9yL6awpXIoYUb8Lv8/Qe84bsm58lhGEYGYSKT+/uIQlEKOV9E87K+rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1492
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_09:2019-09-11,2019-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=781 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909130191
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

SSBiZWxpZXZlIHRoaXMgaXMgYSBqdXN0aWZpZWQgcmFudC4gVGhpcyBpcyBub3QgaW50ZW5kZWQg
dG8gb2ZmZW5kLCBidXQgdG8gYXNzZXJ0IHRoYXQgdGhlIHByb2Nlc3MgaXMgYnJva2VuLg0KDQpJ
IHN0cm9uZ2x5IGFzc2VydCB0aGF0IHRoZXJlIHNob3VsZCBiZSBhIGZvcm1hbCBsaXN0IG9mIGNv
bW1pdCBydWxlcy4gSWYgdGhlIHJ1bGVzIHdlcmUgYWN0dWFsbHkgZG9jdW1lbnRlZCBhbmQgcHVi
bGlzaGVkLCBvbmUgY291bGQgZ28gdGhyb3VnaCB0aGUgY2hlY2tsaXN0IHRvIGVuc3VyZSB0aGF0
IHRoZSBjb21taXQgY29uZm9ybXMuIFRoZSByZXN1bHQgd291bGQgYmUgbGVzcyB0aW1lIHdhc3Rl
ZCBieSB0aGUgY29tbWl0dGVyIGFuZCB0aGUgcmV2aWV3ZXJzLCBhcyB3ZWxsIGFzIG1vcmUgY29u
c2lzdGVuY3kuDQoNCldoZW4gSSBnbyB0b29saW5nIGRvd24gVVMtMTAxIGF0IDkwIG1waCBpbiB0
aGUgY2FycG9vbCBsYW5lLCB0ZXh0aW5nIG15IGlsbGVnYWwgYWxpZW4gZ2lybGZyaWVuZCBhcyBJ
4oCZbSBkcml2aW5nIHRvIHRoZSBjb252ZW5pZW5jZSBzdG9yZSwgaW4gYSBzdG9sZW4gcmVkIGNv
bnZlcnRpYmxlLCB3aXRoIGEgYm90dGxlIG9mIGZpbmUgc2NvdGNoIGluIG9uZSBoYW5kIGFuZCBh
biB1bnJlZ2lzdGVyZWQgQUsgaW4gdGhlIG90aGVyLCBhdCBsZWFzdCBJIGtub3cgd2hpY2ggcnVs
ZXMgSeKAmW0gdmlvbGF0aW5nIG9yIGxpa2VseSB0byBiZSB2aW9sYXRpbmcgd2hlbiBJIGhlYXIg
aGVsaWNvcHRlcnMgb3ZlcmhlYWQuIA0KDQpCdXQgaXQgc3Vja3MgdG8gaGF2ZSBhIGNvbW1pdCBi
b290ZWQgZm9yIHJlYXNvbnMgdGhhdCAoYSkgSSBjb3VsZCBub3QgcmVhc29uYWJseSBiZSBleHBl
Y3RlZCB0byBoYXZlIGtub3duIHByZXZpb3VzbHkgKGJlY2F1c2UgSSByZWFkIHRoZSBkb2N1bWVu
dGF0aW9uLCBvZiBjb3Vyc2UpIGFuZCAoYikgSSBtYXkgbGVnaXRpbWF0ZWx5IGRpc2FncmVlIHdp
dGggKGUuZy4gdGhlIGluc2FuaXR5IHRoYXQgYW55b25lIGhvbGRzIHRvIGFuIDgwLWNvbHVtbiBy
dWxlIGluc3RlYWQgb2YgMTMyIGluIGEgZGF5IG9mIDRLIG1vbml0b3JzIGFuZCA3NS1jaGFyYWN0
ZXIgY2xhc3MgbmFtZXMgaW5zaWRlIG5lc3RlZCBuYW1lc3BhY2VzIHRoYXQgYXJlIGp1c3QgYXMg
bG9uZywgbm90IGNvdW50aW5nIGZ1bGx5IGRlY29yYXRlZCB0cmFpdHMpLiBPaOKApnJpZ2h04oCm
anVzdCB1c2Ug4oCcYXV0b+KAnS4NCg0KVGhlIHByb2Nlc3Mgc2hvdWxkIGJlIHNvbWV3aGF0IHBy
ZWRpY3RhYmxlLCBwcmVmZXJhYmx5IHByb2dyYW1tYXRpYy4NCg0KTWluZCB5b3UsIEkgaGF2ZSBu
byBwcm9ibGVtIHdpdGggY29tcGx5aW5nIHdpdGggdGhlIG1haW50YWluZXLigJlzIHJ1bGVzLCBi
dXQgSeKAmWQgbGlrZSB0byBoYXZlIHNvbWUgY2hhbmNlIGF0IGdldHRpbmcgYSB0cml2aWFsIGNv
bW1pdCBwYXNzZWQgb24gdGhlIGZpcnN0IHNob3QuIFR3byBsaW5lcyBvZiBCaXRCYWtlIGNvbmZp
ZywgdGhhdCBhY3R1YWxseSBhY2NvbXBsaXNoIHdoYXQgaXMgaW50ZW5kZWQsIGZldGNoZXMgYSBo
YWxmLWRvemVuIGNvbXBsYWludHM/DQoNCkl0IGhlbHBzIHRoZSBtYWludGFpbmVyIGlmIGNvbW1p
dHRlcnMgYXJlIGFibGUgdG8gc2VsZi1wb2xpY2UgOTglIG9mIHRoZSBpc3N1ZXMsIGFuZCBtYWtl
cyB0aGUgZW50aXJlIHByb2Nlc3Mgc2VlbSBsZXNzIGhvc3RpbGUuDQoNCkFsc28sIHRoZXJlIGFy
ZSB0b28gbWFueSBwbGFjZXMgdG8gcHV0IHRoZSBzYW1lIGluZm9ybWF0aW9uLiBJIHF1b3RlZCB0
aGUgd2FybmluZyBtZXNzYWdlcyBJIHdhcyByZW1lZHlpbmcgaW4gdGhlIHBhdGNoIHNldCBjb21t
ZW50cywgYnV0IHN1bW1hcml6ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGJlY2F1c2UgdGhhdCBz
ZWVtZWQgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uIEFuZCB0aGF0IGdvdCBtZSBhbm90aGVy
IGRvd252b3RlLg0KDQpOb3cgZm9yZ2l2ZSBtZSBmb3IgbXkgcmFudC4gSSBnb3R0YSBwaWNrIHVw
IHNvbWUgTSZN4oCZcyBmb3IgbXkgZ2lybGZyaWVuZCBiZWZvcmUgNXRoIHBlcmlvZCBvciBzaGXi
gJlsbCBiZSB2ZXJ5IGNyb3NzIHdpdGggbWUuDQoNCg0K
