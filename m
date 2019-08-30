Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B911A3E55
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 21:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kq9X5xTHzDr6B
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 05:22:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41455f9187=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Q/PnqDM1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="AmU9l5uQ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kq8p3ndMzDqrm
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 05:21:22 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7UJKRtV008552
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 12:21:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=5zq5jkTAylyYp2K+TjBPHgmyoamom1cTGPkZRye48ME=;
 b=Q/PnqDM1xHw7oA7PnHEsmu+xuf6bKY3z3yH5dkqtsUxsy5DjIgyAgWFLxfplSKyaOj7p
 Xfercrp4DkygGknkzzjE/ULvlMhCapDnQam6uOiFXJXr/V99t7h9AsALBn1TlHmJ1twt
 /aGIj0hRDB1N9dVU4Xt2c83PyzgkmW0sgPo= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uq0s6at0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 12:21:18 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 30 Aug 2019 12:21:17 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 30 Aug 2019 12:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmHJSJy3Uw8X3fkNbelQPy4pc4Ve6Y571t3IxPJMCAUw2Fd4uYteh+zhiur5rcGmbwc9ECdOOjs3d+ZeWiXvj0OVIHYvOOV/MVsx3DBgOqIVx85gHULp2uHfBtig1eku18f0lyaCEsuGJbQzqjTa7wYmG3iGb2wF+8NIOgG4O4hChhlbsKhifh3yhD8YqLWsugLecv+XB/NKaZPZOuLYmMZU1NZ4fKO6ZvrdNdDjn7OueHZ/lqHfB70sooguMTCKEz4TGffyAPRqPG7/HIrcmNiH+wBeG9T98FYvBEpF8SVnJkbvRsLTgY1gBMLSF6mMZ9LVhtWIM0KfWxnNwvgzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zq5jkTAylyYp2K+TjBPHgmyoamom1cTGPkZRye48ME=;
 b=eu/eDUEbOSG3h0qipb8pqUlQgHsGYpcgW/uQaWd/3yx747nnhgZN77JNyYM39nz0v58cRn4MsT0GSQ8cAYy0WcpELRW0MuPF0NszWjSVj5bo7dfWR7x6ze1NPQFf17ZQKbEIEOgasD7qDo8lw2/1V7I7YJ3+Qz64OxvLg140rw+JsMTGipR5SScKS62t+6gkGghFo5BV97/UwIcum5MZ5cfijW46oz6T/D/spjKPIbtInwqresmsiPwa3XHLqZzNoKpTivDR1Pz+xKBp75u0Ee+0Z7hDlTEt4LBLzVgCYsG0zIuwGUVDFDnYNQ/oLeW18Wj7EvQJQXR5XkwrAdevfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zq5jkTAylyYp2K+TjBPHgmyoamom1cTGPkZRye48ME=;
 b=AmU9l5uQMAErqBDJoy+HhcqiquRpoPsR7liDi9fzoOVjk4mIzIEaS+5gG66ODUD58TaxGTO5mqOuFx+LAzoz+Kszn7DTESkc22us24UviOPo4I1NIxwfFDtC4gHs7y218OAXiCrPtDa1PzUfmbLpIpSiC7XZqsX8Ig0cmD/uvoc=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3280.namprd15.prod.outlook.com (20.179.20.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 19:21:16 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 19:21:16 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Stack Overflow Tag for OpenBMC
Thread-Topic: Stack Overflow Tag for OpenBMC
Thread-Index: AQHVX2gY/TXnoDsjYEa3mRDcCitsVQ==
Date: Fri, 30 Aug 2019 19:21:16 +0000
Message-ID: <DDA5E5EE-3E4C-4036-ACF3-C8DDBF478F19@fb.com>
References: <mailman.1925.1567165547.372.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.1925.1567165547.372.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:2cbc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce8d7c1-445e-4f03-373e-08d72d7f3aa8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB3280; 
x-ms-traffictypediagnostic: MN2PR15MB3280:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR15MB328011BFD023435DCEC36258BDBD0@MN2PR15MB3280.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(366004)(136003)(376002)(396003)(189003)(199004)(4744005)(91956017)(66446008)(64756008)(6486002)(66946007)(11346002)(446003)(5640700003)(76176011)(1730700003)(81156014)(66556008)(81166006)(66476007)(486006)(2616005)(86362001)(476003)(6506007)(6116002)(606006)(8676002)(76116006)(186003)(99286004)(8936002)(71200400001)(6436002)(25786009)(71190400001)(7736002)(46003)(36756003)(478600001)(6916009)(2906002)(33656002)(256004)(102836004)(966005)(53936002)(2501003)(236005)(6306002)(54896002)(6512007)(5660300002)(14454004)(2351001)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3280;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: krsD0SdZsZwfg8EcwDy3xCenzJPpjlTq2nie+wDbXo24MoiY8L9ev61uDLYcccNjVo7K7rNC4GcJn6Y/wSK0Bah7lGaEyLePhWO8UxAzeVxTwLEzQTJwLJCHodOTT/Wn1o0VeTbT9FMBoiz+nw5+2/vQGhrZuLyIaqDTY+qAvRa5abFnyQHqDojN1Navyggj1Ot2w9354SzCGy1sqgFlD4gtOcOIF6bOTe8ESENZJGw0iG3KLvFvrZ6pkDVSYfKxgrzc4PJ5CtdMyGJU+4AyvRP8B9LZHIBKbTtUH7wf5OvBmb6thSyQLn5fgy8BdPmmCnNyrNe98Jr8/ckIFBe0nv4mWsoCOsZ7G4DTB/TUZotBB2F5E3b8tMLZx/aJvM4b7DMg94jLa4rBWI5o/7vmqf7CK7vpXOBP5n0maNw3oUg=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DDA5E5EE3E4C4036ACF3C8DDBF478F19fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cce8d7c1-445e-4f03-373e-08d72d7f3aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 19:21:16.3154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EoBz4mZg33BXZ3Po7jiHJK6uGw0CY2+UEMKhPKHZ2h/Nj2duHJBGBt+fN0W3o0nRCV7U5kNX8KDg5kOmP20BJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3280
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-08-30_07:2019-08-29,2019-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=981 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908300181
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

--_000_DDA5E5EE3E4C4036ACF3C8DDBF478F19fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXMgYSBjb21tdW5pdHksIHdlJ3JlIGdldHRpbmcgbW9yZSBhbmQgbW9yZSBxdWVzdGlvbnMgdmlh
DQpJUkMsIHRoZSBtYWlsaW5nIGxpc3QsIGFuZCBvcGVuYm1jIGdpdGh1YiBpc3N1ZXMuIEFueSB0
aG91Z2h0cw0Kb24gY3JlYXRpbmcgYSBzdGFjayBvdmVyZmxvdyB0YWcgdG8gdHJ5IGFuZCBnZXQg
YSBtb3JlIHNlYXJjaGFibGUNCmFuZCBjb25zaXN0ZW50IGxvY2F0aW9uIGZvciBxdWVzdGlvbnMg
KGkuZS4gb3BlbmJtYyk/DQoNCjExMCUgZm9yIGl0Lg0KDQpPbiBhIHNpbWlsYXIgbm90ZSwgd2hh
dCBhYm91dCBjcmVhdGluZyBhIFN0YWNrRXhjaGFuZ2UgZm9yIE9wZW5CTUM/IFNlZSBodHRwczov
L2FyZWE1MS5zdGFja2V4Y2hhbmdlLmNvbQ0KDQpBbiBPcGVuQk1DIFN0YWNrRXhjaGFuZ2UgbWF5
IGJlIGFuIGFwcHJvcHJpYXRlIHJlcGxhY2VtZW50IGZvciBJUkMgKyBtYWlsaW5nIGxpc3QgKyBH
aXRIdWIgSXNzdWVzLiBJdOKAmXMgZnJlZSB0byBjcmVhdGUgb25lLCBhbmQgbW9kZXJhdGlvbiBl
ZmZvcnRzIGNhbiBzdGVlciBpdCB0b3dhcmQgYmVpbmcgYSBnb29kIFdpa2kgcmVwbGFjZW1lbnQu
DQoNClJlZ2FyZGxlc3MsIGEgdGFnIGZvciBPcGVuQk1DIGlzIGEgZ3JlYXQgc3RlcCBmb3J3YXJk
Lg0KDQpXaWxmcmVkDQo=

--_000_DDA5E5EE3E4C4036ACF3C8DDBF478F19fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CCC16907CCF2874FB1301F20F8D0CA40@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPkFzIGEgY29tbXVuaXR5
LCB3ZSdyZSBnZXR0aW5nIG1vcmUgYW5kIG1vcmUgcXVlc3Rpb25zIHZpYTxiciBjbGFzcz0iIj4N
CklSQywgdGhlIG1haWxpbmcgbGlzdCwgYW5kIG9wZW5ibWMgZ2l0aHViIGlzc3Vlcy4gQW55IHRo
b3VnaHRzPGJyIGNsYXNzPSIiPg0Kb24gY3JlYXRpbmcgYSBzdGFjayBvdmVyZmxvdyB0YWcgdG8g
dHJ5IGFuZCBnZXQgYSBtb3JlIHNlYXJjaGFibGU8YnIgY2xhc3M9IiI+DQphbmQgY29uc2lzdGVu
dCBsb2NhdGlvbiBmb3IgcXVlc3Rpb25zIChpLmUuIG9wZW5ibWMpPzxiciBjbGFzcz0iIj4NCjwv
ZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjxkaXYg
Y2xhc3M9IiI+MTEwJSBmb3IgaXQuJm5ic3A7PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFz
cz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5PbiBhIHNpbWlsYXIgbm90ZSwgd2hhdCBhYm91
dCBjcmVhdGluZyBhIFN0YWNrRXhjaGFuZ2UgZm9yIE9wZW5CTUM/IFNlZSZuYnNwOzxhIGhyZWY9
Imh0dHBzOi8vYXJlYTUxLnN0YWNrZXhjaGFuZ2UuY29tIiBjbGFzcz0iIj5odHRwczovL2FyZWE1
MS5zdGFja2V4Y2hhbmdlLmNvbTwvYT4mbmJzcDs8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNs
YXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkFuIE9wZW5CTUMgU3RhY2tFeGNoYW5nZSBt
YXkgYmUgYW4gYXBwcm9wcmlhdGUgcmVwbGFjZW1lbnQgZm9yIElSQyAmIzQzOyBtYWlsaW5nIGxp
c3QgJiM0MzsgR2l0SHViIElzc3Vlcy4gSXTigJlzIGZyZWUgdG8gY3JlYXRlIG9uZSwgYW5kIG1v
ZGVyYXRpb24gZWZmb3J0cyBjYW4gc3RlZXIgaXQgdG93YXJkIGJlaW5nIGEgZ29vZCBXaWtpIHJl
cGxhY2VtZW50LjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9IiI+UmVnYXJkbGVzcywgYSB0YWcgZm9yIE9wZW5CTUMgaXMgYSBncmVhdCBzdGVw
IGZvcndhcmQuPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRp
diBjbGFzcz0iIj5XaWxmcmVkPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_DDA5E5EE3E4C4036ACF3C8DDBF478F19fbcom_--
