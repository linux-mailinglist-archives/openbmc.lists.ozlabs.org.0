Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F3AE002
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 22:43:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S0VS1JQdzDqRs
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 06:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4155ca654a=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qMuAVKxM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Mimaiw8j"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S0Tn3Kk5zDqQc
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 06:42:34 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x89Kc8KZ019294; Mon, 9 Sep 2019 13:42:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=xijcdaht0YCceJ1TEY3jPy6oULJ1AwMBaYfXycMvuI4=;
 b=qMuAVKxMToeEPGn2DZ/MAQsn3eJqApe/5zdklAah02F0tWg/art6IaA0LfNpu9aMUv4x
 o4i2v0zfIEKM5ZiUQ9OiFl6fuVn7kA3gaytWsXG20qIZXVdwvEQa6tvKW0HQhe8VTxwH
 cgA+cUvrDsgJLs6Os/30/ji+7FteW/4R49E= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uwrsb9m3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2019 13:42:30 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Sep 2019 13:42:29 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Sep 2019 13:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTTmrXCI2MOrZdIVEnh1VwmKiXOUkN4SKMh6+iDl7XQU65AbJvgG0QDtb2WWAVtpV4O91cuJH0CLr8RCThBIy3JIXMI3a/bkPVhRPTOwzNQee2fXDvQEho4lHzWS1Jlb4tKGp1OOSVf1n9H6O4F/YOEYaSOtM6kzMWD2l2QYUcdfcmRNajgzsMAPBbENhJfvptrlFmEyMpIIiIoAMX+ns8tTnXNZ7FwW4WkBd2F1+UHUo5tFntg4Yz07/377ObZS4KDZjyNtc9pbYyiWavH1veuVFMdXhNC3wwJcHwWD25rs/KZrUCe2svzONRie+NAvneLewvcZfhj8fIUE0V24aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xijcdaht0YCceJ1TEY3jPy6oULJ1AwMBaYfXycMvuI4=;
 b=B7oeKcIvnMNZAaR4pcRYZ3tifHc5diGQcOpTqnmZiu8STNWtRS1uhdWbdvHZr/UjsOup54a+k7duhrrl7DApw7umIVy3E7xfwEgHpwxiKFu76tXTAR+bsafaixwTDP//M7RhTGP6JI3Qi8Gjc7XNL447pT2ZyvZKfrZx0lOJxWWfpPOpKidFp/z1ttWRq3yITgOft/Aet1SOE5riMIK6ONEr/hya+5GCwgPS4y2+QDqr1A4jtoq5NYVR+HRq58SK7nqgtXh9IIjkEkdQU7JvHntoL2O4AHwa3fPtZsAMcjO7zNd0eUz+DGg8p7btp953BVKd1ZaB8QCnlzWzutByKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xijcdaht0YCceJ1TEY3jPy6oULJ1AwMBaYfXycMvuI4=;
 b=Mimaiw8jBugBOV2Qa3+x8FZkF0InCH+v/fFGJE9Dq9uLoKfXR9ewZ0IAt8yn2CJ+jIQfGzB/CqJel5viuvENPMskw3CblUiFyVP3xD8b6wrjamFjshFzdoCCHOs2mSXyg9hgzThy3AX56/dk1k01b6g7tUbd0n0fHT+9p6UkPOw=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1871.namprd15.prod.outlook.com (10.174.255.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Mon, 9 Sep 2019 20:42:28 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b%12]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 20:42:28 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [Potential Spoof] Re: Sdbusplus/tight memory conditions
Thread-Topic: [Potential Spoof] Re: Sdbusplus/tight memory conditions
Thread-Index: AQHVZ0Q57eDlD8fLBE28p87QbNHoD6cjz6cA
Date: Mon, 9 Sep 2019 20:42:28 +0000
Message-ID: <3437EA8F-D052-4507-A18D-9E1268875BEB@fb.com>
References: <31AC8BA7-36DC-43EA-A541-47D233C97D97@fb.com>
In-Reply-To: <31AC8BA7-36DC-43EA-A541-47D233C97D97@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:fdd0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 461cfd69-8107-4d7e-2590-08d735663af6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1871; 
x-ms-traffictypediagnostic: MWHPR15MB1871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB18715A8581236FD8DB05F24FBDB70@MWHPR15MB1871.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(6506007)(6436002)(186003)(4744005)(53936002)(6246003)(54896002)(6512007)(99286004)(37006003)(316002)(6862004)(54906003)(6116002)(25786009)(4326008)(66946007)(64756008)(66556008)(66476007)(66446008)(71190400001)(71200400001)(86362001)(81166006)(53546011)(8936002)(7736002)(81156014)(8676002)(76116006)(11346002)(6486002)(5660300002)(236005)(229853002)(33656002)(36756003)(6636002)(256004)(14444005)(76176011)(446003)(478600001)(102836004)(14454004)(46003)(2906002)(2616005)(476003)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1871;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lAZCIUGQ5P/OchHUgWxKWJDh+QEynuoaK7Bvyf+EV398brGcvhej59/YR3kxbrkz4Jl8/6gST1onvee5CCbHWMJGgfj8kcq6kHtGrscerkvcCbdM29sUmnhDu/eahX2nT7atTwPAk/0xseERIdIOFjQOASRMB96ZZ41HoPOPzAnpCakx/vF4q/XSkjt29jKIIYfgQrG2dFkB27yb2yGng4BJKUCUqITMq1yzD9ztXBuHAmFeMaqA3DPmLkVZK1sKIZ2MNWPqHFXEirjb0rVpRk9tWn9jDDpQ++Ub8jp8qSWMKTUvXrxcXLtnj4lCkVZW1PBWXKR7vzK5nUtsTrQDi7bFosqfr+sX576BZWTWFa5lfbXwQxlv8UvgEXoxm9Pcu0emriFTB7/8qrG1481Y+5swdA23TZES88qDw/DbCmI=
Content-Type: multipart/alternative;
 boundary="_000_3437EA8FD0524507A18D9E1268875BEBfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 461cfd69-8107-4d7e-2590-08d735663af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 20:42:28.6261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVKWkrFpR7UZHjTCtFVRgtqedZyeUEpn+VLrklNe8/Nujmd3CjhqtFpVZXFhUw/obBAfG6qbI9w16P2lynxUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1871
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_07:2019-09-09,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=29
 malwarescore=0
 mlxlogscore=40 priorityscore=1501 bulkscore=0 spamscore=29
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 mlxscore=29
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1909090202
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_3437EA8FD0524507A18D9E1268875BEBfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8sIEnigJltIGFkZGluZyB0aGUgY29tcGlsZSBvcHRpb25zIC1PUyAob3B0aW1pemUgZm9yIHNw
YWNlKSBhbmQgLXMgKHN0cmlwIHN5bWJvbHMpLg0KDQpJ4oCZbSBoYXBweSB0byBsb29rIGF0IG90
aGVyIHBvc3NpYmlsaXRpZXMsIGJ1dCBpZiB5b3UgcmV2aWV3IG15IGV4cGVyaW1lbnRzLCBzeW1i
b2wgc3RyaXBwaW5nIGFsb25lIGNhbuKAmXQgcmVhc29uYWJseSBhY2NvdW50IGZvciB0aGF0IG11
Y2ggYmxvYXQuIEkgd291bGQgbG92ZSB0byBiZSBwcm92ZW4gd3Jvbmcgc28gdGhhdCBJIGNhbiBn
ZXQgY2xvc3VyZSBvbiB0aGlzLiBJIHdpbGwgYnVpbGQgYW5kIGZsYXNoIGEgY29tcGxldGUgaW1h
Z2UsIGFzIHlvdSBzdWdnZXN0ZWQuDQoNCldpbGZyZWQNCg0KT24gU2VwIDksIDIwMTksIGF0IDEy
OjI0IFBNLCBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbTxtYWlsdG86dmlqYXlraGVt
a2FAZmIuY29tPj4gd3JvdGU6DQoNCkkgYW0gc3VyZSBpdCBpcyBiZWZvcmUgc3RyaXAsIGl0IHNo
b3VsZCBiZSBmZXcga2Igb25seS4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCg==

--_000_3437EA8FD0524507A18D9E1268875BEBfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A8CF7E36B529864B88737E3D421A5153@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCk5vLCBJ4oCZbSBhZGRpbmcgdGhlIGNvbXBpbGUg
b3B0aW9ucyAtT1MgKG9wdGltaXplIGZvciBzcGFjZSkgYW5kIC1zIChzdHJpcCBzeW1ib2xzKS4N
CjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPknigJlt
IGhhcHB5IHRvIGxvb2sgYXQgb3RoZXIgcG9zc2liaWxpdGllcywgYnV0IGlmIHlvdSByZXZpZXcg
bXkgZXhwZXJpbWVudHMsIHN5bWJvbCBzdHJpcHBpbmcgYWxvbmUgY2Fu4oCZdCByZWFzb25hYmx5
IGFjY291bnQgZm9yIHRoYXQgbXVjaCBibG9hdC4gSSB3b3VsZCBsb3ZlIHRvIGJlIHByb3ZlbiB3
cm9uZyBzbyB0aGF0IEkgY2FuIGdldCBjbG9zdXJlIG9uIHRoaXMuIEkgd2lsbCBidWlsZCBhbmQg
Zmxhc2ggYSBjb21wbGV0ZQ0KIGltYWdlLCBhcyB5b3Ugc3VnZ2VzdGVkLjwvZGl2Pg0KPGRpdiBj
bGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+V2lsZnJlZDxiciBj
bGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xh
c3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9uIFNlcCA5LCAyMDE5LCBhdCAxMjoyNCBQTSwgVmlqYXkg
S2hlbWthICZsdDs8YSBocmVmPSJtYWlsdG86dmlqYXlraGVta2FAZmIuY29tIiBjbGFzcz0iIj52
aWpheWtoZW1rYUBmYi5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUt
aW50ZXJjaGFuZ2UtbmV3bGluZSI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iV29yZFNl
Y3Rpb24xIiBzdHlsZT0icGFnZTogV29yZFNlY3Rpb24xOyBjYXJldC1jb2xvcjogcmdiKDAsIDAs
IDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6
IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsg
bGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAw
cHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNp
bmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246
IG5vbmU7Ij4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMGluIDBpbiAwLjAwMDFwdDsgZm9udC1zaXpl
OiAxMXB0OyBmb250LWZhbWlseTogQ2FsaWJyaSwgc2Fucy1zZXJpZjsiIGNsYXNzPSIiPg0KSSBh
bSBzdXJlIGl0IGlzIGJlZm9yZSBzdHJpcCwgaXQgc2hvdWxkIGJlIGZldyBrYiBvbmx5LjxvOnAg
Y2xhc3M9IiI+PC9vOnA+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBpbiAwaW4gMC4wMDAx
cHQ7IGZvbnQtc2l6ZTogMTFwdDsgZm9udC1mYW1pbHk6IENhbGlicmksIHNhbnMtc2VyaWY7IiBj
bGFzcz0iIj4NCjxvOnAgY2xhc3M9IiI+Jm5ic3A7PC9vOnA+PC9kaXY+DQo8ZGl2IHN0eWxlPSJt
YXJnaW46IDBpbiAwaW4gMC4wMDAxcHQ7IGZvbnQtc2l6ZTogMTFwdDsgZm9udC1mYW1pbHk6IENh
bGlicmksIHNhbnMtc2VyaWY7IiBjbGFzcz0iIj4NClJlZ2FyZHM8bzpwIGNsYXNzPSIiPjwvbzpw
PjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwaW4gMGluIDAuMDAwMXB0OyBmb250LXNpemU6
IDExcHQ7IGZvbnQtZmFtaWx5OiBDYWxpYnJpLCBzYW5zLXNlcmlmOyIgY2xhc3M9IiI+DQotVmlq
YXk8bzpwIGNsYXNzPSIiPjwvbzpwPjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjwvZGl2Pg0KPGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_3437EA8FD0524507A18D9E1268875BEBfbcom_--
